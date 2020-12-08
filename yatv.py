import sqlite3
from flask import Flask, render_template, request, url_for, flash, redirect, get_flashed_messages, request
from flask_login import LoginManager, current_user, login_user, UserMixin, logout_user, login_required
from passlib.hash import sha256_crypt
import sys

app = Flask(__name__)
app.config['SECRET_KEY'] = 'akdfsj;fdkasjfa;dksfj'
login = LoginManager(app)
def getApp():
    return app

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
	if not login:
		return 
	if login['Email'] == "admin@yatv.com":
		isAdmin = True
	
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
	videolist = conn.execute("SELECT video.Title, video.Description, video.VideoID FROM user INNER JOIN videolist ON user.Email = "
							+ "videolist.UserEmail INNER JOIN video ON videolist.VideoID = video.VideoID WHERE user.Email='"
							+ useremail + "'ORDER BY video.Title").fetchall()
	conn.close()
	return render_template('mylist.html', showlist=showlist, videolist=videolist)

@app.route('/mostwatched')
def mostwatched():
	conn = get_db_connection()
	showlist = conn.execute("SELECT shows.Title AS Top10Shows, shows.ShowID, app.Name AS App"
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
	conn.execute('INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES (?, ?, ?, ?)',
				(current_user.id, appName, 2021-11-20 ,10))
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
	videos = conn.execute("SELECT video.Title, video.VideoID"
	+ " FROM app INNER JOIN video ON app.Name = video.HostingApp"
	+ " WHERE video.Season == '' AND app.Name = '" + appName +"'").fetchall()
	
	conn.close()
	return render_template('page.html', app=app, platforms=platforms, shows=shows, videos=videos)	

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
	seasonvideos = conn.execute("SELECT video.Title as videotitle, video.Description as videodescription, video.VideoID as videoid,"
			+ " season.SeasonNumber as seasonnumber, shows.ShowID as showid FROM video INNER JOIN season ON video.Season = season.SeasonID"
			+ " INNER JOIN seasonshow ON season.ShowID = seasonshow.ShowID AND season.SeasonNumber = seasonshow.SeasonNumber"
        	+ " INNER JOIN shows ON seasonshow.ShowID = shows.ShowID").fetchall()
	"""
	--Utilizes user parametization by allowing the user to input a show title. This query will then return the show and it's number of episdoes
	-- unless the show has 0 episodes, in which case nothing will be returned. This will be incorporated as a feature for the user to track
	-- how many episodes a show has.
	--This is a complex query because it has 3 inner joins (1 point), an aggregate function (1 point), a grouping (1 point),
	-- an ordering with two fields (1 point), a where condition and a having condition both not for joins (1 point) and a strong justification.
	-- This is a strong justification because this is a useful feature that will likely be implemented at a later stage.
	"""
	episodes = conn.execute("SELECT COUNT(video.VideoID) as episodecount FROM"
			+ " shows INNER JOIN seasonshow on shows.ShowID = seasonshow.ShowID"
    		+ " INNER JOIN season on seasonshow.ShowID = season.ShowID AND seasonshow.SeasonNumber = season.SeasonNumber"
        	+ " INNER JOIN video ON video.Season = season.SeasonID"
			+ " WHERE shows.ShowID LIKE '" + showID + "'"
			+ " GROUP BY shows.title HAVING COUNT(video.VideoID) > 0"
			+ " ORDER BY shows.Title, COUNT(video.VideoID) ASC").fetchone()
	
	"""
	--Utilizes user parametization by allowing a user to determine how many seasons that a show has. If a show
	-- has greater than 0 seasons, the show will be returned with a count of its number of seasons. This will be
	-- incorporated as a feature that lets a user determine how many seasons a show has. 
	--This is a complex query because it has 3 inner joins (1 point), an aggregate function (1 point), a grouping (1 point),
	-- an ordering with two fields (1 point), a where condition and a having condition both not for joins (1 point) and a strong justification.
	-- This is a strong justification because this is a useful feature that will likely be implemented at a later stage.
	"""
	seasoncount = conn.execute("SELECT shows.Title, COUNT(DISTINCT season.SeasonID) as seasoncount"
			+ " FROM shows INNER JOIN seasonshow on shows.ShowID = seasonshow.ShowID"
    		+ " INNER JOIN season on seasonshow.ShowID = season.ShowID AND seasonshow.SeasonNumber = season.SeasonNumber"
        	+ " INNER JOIN video ON video.Season = season.SeasonID"
			+ " WHERE shows.ShowID LIKE '" + showID + "'"
			+ " GROUP BY shows.title HAVING COUNT(season.seasonID) > 0"
			+ " ORDER BY shows.Title, COUNT(season.seasonID) ASC").fetchone()
	conn.close()
	return render_template('showpage.html', show=show, seasons=seasons, seasonvideos=seasonvideos, episodes=episodes, seasoncount=seasoncount) 

@app.route('/<videoID>/videopage')
def videopage(videoID):
	conn = get_db_connection()
	video = conn.execute("SELECT * FROM video WHERE video.VideoID = '" + videoID + "'").fetchone()
	conn.close()
	return render_template('videopage.html', video=video)

@app.route('/populartags')
def populartags():
	conn = get_db_connection()
	tags = conn.execute("SELECT DISTINCT tags.Tag AS top3, COUNT(watched.UserEmail) AS numwatched"
			+ " FROM (tags INNER JOIN video ON tags.VideoID = video.VideoID)"
			+ " INNER JOIN watched ON watched.VideoID = video.VideoID"
			+ " GROUP BY tags.Tag"
			+ " ORDER BY COUNT(watched.Useremail) DESC"
			+ " LIMIT 3;").fetchall()
	conn.close()
	return render_template('populartags.html', tags=tags)

@app.route('/<showid>/addshow', methods=('POST',))
def addshow(showid):
	if not current_user.is_authenticated:
		flash("You must be logged in to add a show to your MyList")
		return redirect(url_for('login'))
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

@app.route('/<videoid>/addvideo', methods=('POST',))
def addvideo(videoid):
	if not current_user.is_authenticated:
		flash("You must be logged in to add a video to your MyList")
		return redirect(url_for('login'))
	conn = get_db_connection()
	current = conn.execute("SELECT video.VideoID, video.Title, User.Email"
			+ " FROM user INNER JOIN videolist ON user.Email = videolist.UserEmail"
			+ " INNER JOIN video on videolist.VideoID = video.VideoID"
			+ " WHERE videolist.UserEmail = '" + current_user.id + "'AND video.VideoID = '" + videoid + "'").fetchone()
	if current:
		flash(current['Title'] + " is already on your MyList")
		return redirect(url_for('index'))
	conn.execute('INSERT INTO videolist (UserEmail, VideoID) VALUES (?, ?)',
				(current_user.id, videoid))
	conn.commit()
	conn.close()

	flash("Video successfully added to your MyList")
	return redirect(url_for('mylist'))

@app.route('/<videoid>/removevideo', methods=('POST',))
def removevideo(videoid):
	conn = get_db_connection()
	conn.execute('DELETE FROM videolist WHERE VideoID = ? AND UserEmail = ?',
				(videoid, current_user.id))
	conn.commit()
	conn.close()

	flash("Video removed from your MyList")
	return redirect(url_for('mylist'))

@app.route('/admin', methods=['GET', 'POST'])
def admin():
	if not current_user.is_authenticated:
		flash("You must be logged in to an admin account to access the admin panel")
		return redirect(url_for('index'))

	if current_user.is_admin == False:
		flash("You are not an administrator")
		return redirect(url_for('index'))
	
	conn = get_db_connection()
	apps = conn.execute("SELECT appplatform.AppName, appplatform.PlatformID, appplatform.Version"
				+ " FROM appplatform").fetchall()

	videos = conn.execute("SELECT * FROM video").fetchall()
	if request.method == 'POST':
		if request.form['btn'] == 'Submit Query':
			query = request.form['admin']
			try:
				conn.execute(query)
				flash("Query sent successfully")
			except:
				flash('Error, query unsuccessful: ' + str(sys.exc_info()[0]))
		elif request.form['btn'] == 'Update':
			appname = request.form['appname']
			platformid = request.form['platformid']
			newversion = request.form['newversion']
			try:
				conn.execute("UPDATE appplatform"
					+ " SET Version = ?"
					+ " WHERE AppName = ? AND PlatformID = ?",
					(newversion, appname, platformid))
				conn.commit()
				conn.close()
				flash("Platform updated")
				return redirect(url_for('admin'))
			except:
				flash("Error: Platform update failed")
		elif request.form['btn'] == 'Create Video':
			videoid = request.form['videoid']
			title = request.form['title']
			description = request.form['description']
			releasedate = request.form['releasedate']
			duration = request.form['duration']
			isfree = request.form['isfree']
			hostingapp = request.form['hostingapp']
			season = request.form['season']
			try:
				conn.execute("INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, "
						+ "isFree, HostingApp, Season) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
						(videoid, title, description, releasedate, duration, isfree, hostingapp, season))
				conn.commit()
				conn.close()
				flash("Video added")
				return redirect(url_for('admin'))
			except:
				flash("Error: Video not added")
		else:
			flash("ERROR")
	
	countries = conn.execute("SELECT DISTINCT user.Country FROM user ORDER BY user.Country").fetchall()
	revenue = {}
	for country in countries:
		revenue[country['Country']] = conn.execute("SELECT appsubscription.AppName as name, IFNULL(SUM(appsubscription.Cost),0) as revenue"
			+ " FROM appsubscription"
			+ " INNER JOIN user ON appsubscription.UserEmail = user.Email"
			+ " WHERE user.Country LIKE '%" + country['Country'] + "%'"
			+ " GROUP BY appsubscription.AppName"
			+ " ORDER BY SUM(appsubscription.Cost) DESC").fetchall()

	
	conn.close()
	return render_template('admin.html', apps=apps, videos=videos, countries = countries, revenue=revenue)
	
@app.route('/recentmovies')
def recentmovies():
	conn = get_db_connection()
	videos = conn.execute("SELECT video.Title AS title, video.VideoID as id"
		+ " FROM video"
		+ " WHERE video.Season = ''"
		+ " AND CAST(video.ReleaseDate as int) > '2019'"
		+ " AND video.Duration > '00:59:59';").fetchall()
	conn.close()
	return render_template('recentmovies.html', videos=videos)

@app.route('/<videoid>/watchvideo', methods=('POST',))
def watchvideo(videoid):
	if not current_user.is_authenticated:
		flash("You must be logged in to watch a video")
		return redirect(url_for('login'))
	conn = get_db_connection()
	current = conn.execute("SELECT watched.UserEmail, watched.VideoID FROM watched WHERE watched.UserEmail LIKE '" + current_user.id + "'" 
			+ " AND watched.VideoID LIKE '" + videoid + "'").fetchone()
	appsubscription = conn.execute("SELECT * FROM appsubscription INNER JOIN video ON appsubscription.AppName = video.HostingApp"
			+ " WHERE appsubscription.UserEmail LIKE '" + current_user.id + "' AND video.VideoID LIKE '" + videoid + "'").fetchone()
	video = conn.execute("SELECT * FROM video WHERE video.VideoID LIKE '" + videoid + "'").fetchone()
	if not appsubscription and video['isFree'] == '0':
		flash("You must be subscribed to " + video["HostingApp"])
		return redirect(url_for('videopage', videoID=videoid))
	if current:
		flash("You have already watched this video")
		return redirect(url_for('videopage', videoID=videoid))

	conn.execute("INSERT INTO watched (UserEmail, VideoID, isLiked) VALUES (?, ?, ?)",
			(current_user.id, videoid, 0))
	conn.commit()
	conn.close()
	flash("Successfully watched video")
	return redirect(url_for('videopage', videoID=videoid))

@app.route('/<videoid>/likevideo', methods=('POST',))
def likevideo(videoid):
	if not current_user.is_authenticated:
		flash("You must be logged in to like a video")
		return redirect(url_for('login'))
	conn = get_db_connection()
	current = conn.execute("SELECT * FROM watched WHERE watched.UserEmail LIKE '" + current_user.id + "'" 
			+ " AND watched.VideoID LIKE '" + videoid + "'").fetchone()
	if current:
		if current['isLiked'] == 1:
			flash("You have already liked this video")
			return redirect(url_for('videopage', videoID=videoid))
		conn.execute("UPDATE watched SET isLiked = 1 WHERE watched.UserEmail = ?  AND watched.VideoID = ?", 
				(current_user.id, videoid))
		conn.commit()
		conn.close()
		flash("Liked video")
		return redirect(url_for('videopage', videoID=videoid))
	
	flash("You must watch this video before you like it")
	return redirect(url_for('videopage', videoID=videoid))

@app.route('/reports')
def reports():
	if not current_user.is_authenticated:
		flash("You must be logged in to access reports")
		return redirect(url_for('login'))
	conn = get_db_connection()

	"""
	-- As a growing international business, it is important for us to keep track of how many countries around the world 
	-- utilize mobile platforms. As we focus on mobile platforms specifically, we look to use this query to track this data.
	-- This is a complex query because it has 3 inner joins (1 point), an aggregate function (1 point), a grouping (1 point),
	-- an ordering with two fields (1 point), a where condition and a having condition both not for joins (1 point) and a strong justification.
	-- This is a strong justification because this is a useful feature that will likely be implemented at a later stage.
	"""
	mobilecountries = conn.execute("SELECT User.Country FROM"
			+ " user INNER JOIN appsubscription ON user.Email = appsubscription.UserEmail"
    		+ " INNER JOIN appplatform ON appsubscription.AppName = appplatform.AppName"
        	+ " INNER JOIN platform ON appplatform.PlatformID = platform.PlatformID"
			+ " WHERE platform.isMobile LIKE 1 GROUP BY User.Country"
			+ " Having COUNT(platform.PlatformID) > 0 ORDER BY"
			+ " User.Country, COUNT(platform.PlatformID) ASC").fetchall()

	"""
	---This query utilizes user parameterization by allowing the user to input their account email. By doing so, this query
	---returns all videos the user has put into their MyList but has not wathced yet. 
	---This is a great way for users to quickly see what shows they've been meaning to watch and will inately make them 
	---spend more time on our app. The longer we have users on our platform, the more money we make. Our query justification:
	---(3+ tables joined: 1 point), (Except: 1 point), (Order By 2+: 1 point), (Where/Having: 1 point), (Non-Inner Joins: 1 point),
	---(Justification: 1 point)
	"""
	unwatched = conn.execute("SELECT v.VideoID, v.Title AS VideoTitle FROM videolist vl"
			+ " LEFT JOIN user u ON u.Email = vl.UserEmail"
			+ " INNER JOIN video v ON v.VideoID = vl.VideoID WHERE u.Email = '" + current_user.id +  "'"
			+ " EXCEPT SELECT w.VideoID AS vID, v.Title AS VideoTitle"
			+ " FROM watched w LEFT JOIN user u ON w.UserEmail = u.Email"
			+ " INNER JOIN video v ON v.VideoID = w.VideoID WHERE u.Email = '" + current_user.id + "'"
			+ " ORDER BY VideoTitle").fetchall()
	
	"""
	---This query will allow a user to see how "Cost Effective" their subscriptions are. By finding the user's total cost in
	---subscriptions for them, as well as how many total videos the user has watched, we are able to deliver how much 
	---bang for their buck the user is really getting. A happy customer is a loyal one, and this feature will allow us to
	---differentiate our offerings from competitors and appease our consumers, something exceptionally valuable for the company.
	---Our justification: (Tables joined 3+: 1 point), (Aggregate functions: 1 point), (Non-Aggregate functions: 1 point),
	---(Where/Having: 1 point), (Grouping: 1 point), (Justification: 1 point), (Subquery: 1 point)
	"""
	efficiency = conn.execute("SELECT videosWatched, ('$' || Cost) AS subscriptionsCost,"
			+ " PRINTF('%.2f', Cost / CAST(videosWatched AS FLOAT)) AS CostEfficiency"
			+ " FROM(SELECT (COUNT(w.VideoID) / COUNT(DISTINCT asub.AppName)) AS videosWatched,"
        	+ " (asub.Cost * COUNT(DISTINCT asub.AppName)) AS Cost"
    		+ " FROM appsubscription asub INNER JOIN user u ON asub.UserEmail = u.Email"
        	+ " INNER JOIN watched w ON u.Email = w.UserEmail WHERE u.Email = '" + current_user.id + "' GROUP BY u.Email"
    		+ " HAVING videosWatched > 0)").fetchone()
	conn.close()
	return render_template('reports.html', mobilecountries=mobilecountries, unwatched=unwatched, efficiency=efficiency)
	
	

	
	


