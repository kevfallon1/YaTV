import sqlite3
from flask import Flask, render_template, request, url_for, flash, redirect, get_flashed_messages, request
from flask_login import LoginManager, current_user, login_user, UserMixin, logout_user, login_required
from passlib.hash import sha256_crypt

app = Flask(__name__)
app.config['SECRET_KEY'] = 'akdfsj;fdkasjfa;dksfj'
login = LoginManager(app)

class User(UserMixin):
	def __init__(self, fname, lname, id, password, country, is_admin):
		self.fname = fname
		self.lname = lname
		self.id = id
		self.password = password
		self.country = country
		self.is_admin = is_admin; 

	def is_active(self):
		return True

	def is_anonymous(self):
		return False

	def is_authenticated(self):
		return True

	def set_admin(self):
		self.is_admin = True

@login.user_loader
def load_user(id):
	conn = get_db_connection()
	login = conn.execute("SELECT * FROM user WHERE user.Email='" + id + "'").fetchone()
	conn.close()
	isAdmin = False
	if login['Email'] == "admin@yatv.com":
		isAdmin = True
	if not login:
		return 
	return User(login['FName'], login['LName'], login['Email'], login['Password'], login['Country'], isAdmin)
	
def get_db_connection():
    conn = sqlite3.connect('data.sqlite')
    conn.row_factory = sqlite3.Row
    return conn

@app.context_processor
def inject_user():
	if current_user.is_authenticated:
		return dict(user=current_user.id)
	return dict(user="")

@app.route('/')
def index():
	conn = get_db_connection()
	apps = conn.execute('SELECT * FROM app').fetchall()
	conn.close()
	return render_template('index.html', apps=apps)


@app.route('/myapps')
def myapps():
	if not current_user.is_authenticated:
		flash("You must be logged in to access this feature")
		return redirect(url_for('login'))
	useremail = current_user.id
	conn = get_db_connection()
	applist = conn.execute("SELECT app.name, app.Description FROM user INNER JOIN appsubscription ON user.Email = "
							+ "appsubscription.UserEmail INNER JOIN app on appsubscription.AppName = app.Name WHERE user.Email='" 
							+ useremail + "'ORDER BY app.Name").fetchall()
	conn.close()
	return render_template('myapps.html', applist=applist)

@app.route('/mylist')
def mylist():
	if not current_user.is_authenticated:
		flash("You must be logged in to access this feature")
		return redirect(url_for('login'))
	useremail = current_user.id
	conn = get_db_connection()
	showlist = conn.execute("SELECT shows.Title, shows.Description, shows.ShowID FROM user INNER JOIN showlist ON user.Email = "
							+ "showlist.UserEmail INNER JOIN shows ON showlist.ShowID = shows.ShowID WHERE user.Email='"
							+ useremail + "'ORDER BY shows.Title").fetchall()
	videolist = conn.execute("SELECT video.Title, video.Description FROM user INNER JOIN videolist ON user.Email = "
							+ "videolist.UserEmail INNER JOIN video ON videolist.VideoID = video.VideoID WHERE user.Email='"
							+ useremail + "'ORDER BY video.Title").fetchall()
	conn.close()
	return render_template('mylist.html', showlist=showlist, videolist=videolist)

@app.route('/mostwatched')
def mostwatched():
	conn = get_db_connection()
	showlist = conn.execute("SELECT shows.Title AS Top10Shows, app.Name AS App"
							+ " FROM app INNER JOIN video ON video.HostingApp = app.Name"
							+ " INNER JOIN season ON season.SeasonID = video.Season"
							+ " INNER JOIN seasonshow ON season.ShowID = seasonshow.ShowID"
							+ " INNER JOIN shows ON seasonshow.ShowID = shows.ShowID"
							+ " INNER JOIN watched ON watched.VideoID = video.VideoID"
							+ " GROUP BY shows.Title"
							+ " ORDER BY COUNT(watched.VideoID)"
							+ " LIMIT 10").fetchall()
	conn.close()
	return render_template('mostwatched.html', showlist=showlist)

@app.route('/login', methods=['GET', 'POST'])
def login():
	if current_user.is_authenticated:
		flash("You are already logged in")
		return redirect(url_for('index'))
	
	if request.method == 'POST':
		email = request.form['email']
		password = request.form['password']
		if not email or not password:
			flash('Both fields are required')
			return redirect(url_for('login'))
		user = load_user(email)
		if not user:
			flash('Invalid username or password')
			return redirect(url_for('login'))
		if user.id != email or  not sha256_crypt.verify(password, user.password):
			flash('Invalid username or password')
			return redirect(url_for('login'))
		login_user(user)
		flash("Successfully logged in")
		next_page = request.args.get('next')
		if not next_page:
			next_page = url_for('index')	
		return redirect(next_page)

	return render_template('login.html')


@app.route('/logout')
def logout():
	if not current_user.is_authenticated:
		flash("You are not logged in to an account")
		return redirect(url_for('index'))
	logout_user()
	flash("Successfully logged out")
	return redirect(url_for('index'))

@app.route('/create', methods=['GET', 'POST'])
def create():
	if current_user.is_authenticated:
		flash("You are already logged in")
		return redirect(url_for('index'))
	
	if request.method == 'POST':
		fname = request.form['fname']
		lname = request.form['lname']
		email = request.form['email']
		password = sha256_crypt.encrypt(request.form['password'])
		country = request.form['country']
		if not fname or not lname or not email or not password or not country:
			flash("All fields are required")
			return redirect(url_for('create'))
		user = User(fname, lname, email, password, country, True)
		
		conn = get_db_connection()
		conn.execute('INSERT INTO user (Email, FName, LName, Password, Country) VALUES (?, ?, ?, ?, ?)',
				 (user.id, user.fname, user.lname, user.password, user.country))
		conn.commit()
		conn.close()

		flash("Account successfully created! You can now log in.")
		return redirect(url_for('login'))
	return render_template('create.html')

@app.route('/<appName>/subscribe', methods=('POST',))
def subscribe(appName):
	if not current_user.is_authenticated:
		flash("You must be logged in to subscribe to an app.")
		return redirect('login')
	conn = get_db_connection()
	current = conn.execute("SELECT * FROM appsubscription WHERE appsubscription.UserEmail='"
	+ current_user.id + "' AND AppName = '" + appName + "'").fetchone()
	if current:
		flash("You are already subscribed to " + appName)
		return redirect(url_for('index'))
	conn.execute('INSERT INTO appsubscription (UserEmail, AppName) VALUES (?, ?)',
				(current_user.id, appName))
	conn.commit()
	conn.close()

	flash("Successfully subscribed to " + appName)
	return redirect(url_for('index'))

@app.route('/<appName>/unsubscribe', methods=('POST',))
def unsubscribe(appName):
	if not current_user.is_authenticated:
		flash("You must be logged in to unsubscribe from an app.")
		return redirect(url_for('login'))
	conn = get_db_connection()
	conn.execute('DELETE FROM appsubscription WHERE AppName = ? AND UserEmail = ?',
				(appName, current_user.id))
	conn.commit()
	conn.close()

	flash("Successfully unsubscribed from " + appName)
	return redirect(url_for('myapps'))

@app.route('/<appName>/apppage')
def AppPage(appName):
	conn = get_db_connection()
	app = conn.execute("SELECT * FROM app WHERE app.Name = '" + appName + "'").fetchone()
	platforms = conn.execute("SELECT * FROM app INNER JOIN appplatform ON app.Name = appplatform.AppName " 
	+ "INNER JOIN platform ON appplatform.PlatformID = platform.PlatformID").fetchall()
	shows = conn.execute('SELECT DISTINCT shows.Title, shows.Description, shows.ShowID FROM app INNER JOIN video ON'
	+ " app.Name = video.HostingApp INNER JOIN season ON video.Season = season.SeasonID"
	+ " INNER JOIN seasonshow ON season.ShowID = seasonshow.ShowID AND season.SeasonNumber = seasonshow.SeasonNumber"
	+ " INNER JOIN shows ON seasonshow.ShowID = shows.ShowID WHERE app.Name ='" + appName + "'").fetchall()
	conn.close()
	return render_template('page.html', app=app, platforms=platforms, shows=shows)	

@app.route('/freevideos')
def freevideos():
	conn = get_db_connection()
	videos = conn.execute("SELECT video.VideoID as id, video.Title as title, app.Name as name" +
							" FROM app INNER JOIN video ON app.Name = video.HostingApp" +
							" WHERE video.isFree LIKE 1").fetchall()
	platforms = conn.execute("SELECT platform.Name as name, video.VideoID as id" 
		+ " FROM video INNER JOIN app on video.HostingApp = app.Name" 
		+ " INNER JOIN appplatform ON app.Name = appplatform.AppName"
        + " INNER JOIN platform on appplatform.PlatformID = platform.PlatformID"
		+ " WHERE Video.isFree LIKE 1").fetchall()
	conn.close()
	return render_template('freevideos.html', videos=videos, platforms=platforms)

@app.route('/<showID>/showpage')
def showpage(showID):
	conn = get_db_connection()
	show = conn.execute("SELECT * FROM shows WHERE shows.ShowID = '" + showID + "'").fetchone()
	seasons = conn.execute("SELECT DISTINCT season.SeasonNumber as seasonnumber, shows.ShowID as showid FROM season INNER JOIN seasonshow" 
			+ " ON season.ShowID = seasonshow.ShowID AND"
    		+ " season.SeasonNumber = seasonshow.SeasonNumber"
    		+ " INNER JOIN shows ON seasonshow.ShowID = shows.ShowID ORDER BY season.SeasonNumber").fetchall()
	seasonvideos = conn.execute("SELECT video.Title as videotitle, video.Description as videodescription, "
			+ " season.SeasonNumber as seasonnumber, shows.ShowID as showid FROM video INNER JOIN season ON video.Season = season.SeasonID"
			+ " INNER JOIN seasonshow ON season.ShowID = seasonshow.ShowID AND season.SeasonNumber = seasonshow.SeasonNumber"
        	+ " INNER JOIN shows ON seasonshow.ShowID = shows.ShowID").fetchall()
	conn.close()
	return render_template('showpage.html', show=show, seasons=seasons, seasonvideos=seasonvideos) 

@app.route('/<videoname>/videopage')
def videopage(videoName):
	return

@app.route('/populartags')
def populartags():
	conn = get_db_connection()
	tags = conn.execute("SELECT DISTINCT tags.Tag AS top3, COUNT(DISTINCT watched.VideoID) AS numwatched"
			+ " FROM (tags INNER JOIN video ON tags.VideoID = video.VideoID)"
			+ " INNER JOIN watched ON watched.VideoID = video.VideoID"
			+ " GROUP BY tags.Tag"
			+ " ORDER BY COUNT(watched.VideoID)"
			+ " LIMIT 3;").fetchall()
	conn.close()
	return render_template('populartags.html', tags=tags)

@app.route('/revenuereport')
def revenuereport():

	conn = get_db_connection()
	countries = conn.execute("SELECT DISTINCT user.Country FROM user ORDER BY user.Country").fetchall()
	revenue = {}
	for country in countries:
		revenue[country['Country']] = conn.execute("SELECT app.Name as name, IFNULL(SUM(appsubscription.Cost),0) as revenue"
			+ " FROM app INNER JOIN appsubscription ON app.Name = appsubscription.AppName"
			+ " INNER JOIN user ON appsubscription.UserEmail = user.Email"
			+ " WHERE user.Country LIKE '%" + country['Country'] + "%'"
			+ " GROUP BY app.Name"
			+ " ORDER BY SUM(appsubscription.Cost) DESC").fetchall()
		
	
	conn.close()
	return render_template('revenuereport.html',revenue=revenue, countries=countries)

@app.route('/<showid>/addshow', methods=('POST',))
def addshow(showid):
	if not current_user.is_authenticated:
		flash("You must be logged in to add a show to your MyList")
		return redirect('login')
	conn = get_db_connection()
	current = conn.execute("SELECT Shows.ShowID, Shows.Title, User.Email"
			+ " FROM user INNER JOIN showlist ON user.Email = showlist.UserEmail"
			+ " INNER JOIN shows on showlist.ShowID = shows.ShowID"
			+ " WHERE showlist.UserEmail = '" + current_user.id + "'AND shows.ShowID = '" + showid + "'").fetchone()
	if current:
		flash(current['Title'] + " is already on your MyList")
		return redirect(url_for('index'))
	conn.execute('INSERT INTO showlist (UserEmail, ShowID) VALUES (?, ?)',
				(current_user.id, showid))
	conn.commit()
	conn.close()

	flash("Show successfully added to your MyList")
	return redirect(url_for('mylist'))

@app.route('/<showid>/removeshow', methods=('POST',))
def removeshow(showid):
	conn = get_db_connection()
	conn.execute('DELETE FROM showlist WHERE ShowID = ? AND UserEmail = ?',
				(showid, current_user.id))
	conn.commit()
	conn.close()

	flash("Show removed from your MyList")
	return redirect(url_for('mylist'))

@app.route('/admin')
def admin():
	if not current_user.is_authenticated:
		flash("You must be logged in to an admin account to access the admin panel")
		return redirect(url_for('index'))

	if current_user.is_admin == False:
		flash("You are not an administrator")
		print(current_user.is_admin)
		return redirect(url_for('index'))
	return render_template('admin.html')
	
