INSERT INTO app (Name, Description) VALUES ("Netflix", "Streaming service to watch TV shows and movies online");

INSERT INTO app (Name, Description) VALUES ("Hulu", "Premium streaming service offering live and on-demand TV and movies, with and without commercials, both in and outside the home.");

INSERT INTO app (Name, Description) VALUES ("The Hub", "Top of the line streaming service to your favorite videos.");

INSERT INTO app (Name, Description) VALUES ("Youtube", "Watch quality content from your favorite creators.");

INSERT INTO app (Name, Description) VALUES ("Amazon Prime Video", "Amazon’s best take at getting into the streaming market.");

INSERT INTO app (Name, Description) VALUES ("Crackle", "Watch Movies and TV Shows for free");

INSERT INTO app (Name, Description) VALUES ("Disney Plus", "Classic favorites. New releases. Disney Channel throwbacks. Exclusive Original series.");

INSERT INTO app (Name, Description) VALUES ("Acorn TV", "Award-Winning British TV");

INSERT INTO app (Name, Description) VALUES ("CBS All Access", "On-demand streaming service that lets you watch its programming whenever you want");

INSERT INTO app (Name, Description) VALUES ("NFL Redzone", "Stream the highlights of every game on Sunday.");

INSERT INTO shows (ShowID, Title, Description) VALUES (1, "Breaking Bad", "Set in Albuquerque, New Mexico, between 2008 and 2010, Breaking Bad follows Walter White, a meek high school chemistry teacher who transforms into a ruthless player in the local methamphetamine drug trade, driven by a desire to provide for his family after being diagnosed with terminal lung cancer.");
INSERT INTO shows (ShowID, Title, Description) VALUES (2, "Friends ", "A 90’s Comedy TV show based in Manhattan following the lives of 6 friends as they face all of life’s challenges and beauties together.");
INSERT INTO shows (ShowID, Title, Description) VALUES (3 , "Game of Thrones ", "This show, set in medieval times, recounts the tale of a country’s civil war. It is set in the fictional continents of Westeros and Essos in a completely different world.");
INSERT INTO shows (ShowID, Title, Description) VALUES (4, "It’s Always Sunny in Philadelphia", "The series follows the lives of The Gang, a group of 5 narcissistic friends who run their own bar, located in South Philadelphia.");
INSERT INTO shows (ShowID, Title, Description) VALUES (5, "One Piece", "A Japanese animated television series about a boy’s journey to explore the Grand Line in search of the world’s greatest treasure known as One Piece so he can rule in an era of pirates.");
INSERT INTO shows (ShowID, Title, Description) VALUES (6, "New Girl", "Jess, an unorthodox woman, moves into a loft with three men. At first, their relationship is rocky, but the show tells the story of the life experiences Jess shares with her new roommates.");
INSERT INTO shows (ShowID, Title, Description) VALUES (7, "Avatar: The Last Airbender", "In a world where people can bend elements, a 12-year old boy embarks on a journey to save the world. Luckily, he is accompanied by his closest friends as he tries to fulfill his destiny as the Avatar and return peace and balance to the world.");
INSERT INTO shows (ShowID, Title, Description) VALUES (8, "Rick and Morty", "An animated series following the adventures a drunk, super scientist and his not-so-bright grandson.");
INSERT INTO shows (ShowID, Title, Description) VALUES (9, "The Office", "Set in Scranton, Pennsylvania, this show is a mockumentary which follows the daily activities at Dunder Mifflin Paper Company.");
INSERT INTO shows (ShowID, Title, Description) VALUES (10, "Narcos", "A deep-dive into the criminal actions of drug lord Pablo Escobar and the other Colombian drug cartels who rose to power in the late 1900s.");

INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (1,1);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (2,1);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (2,2);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (3,1);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (4,1);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (5,1);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (6,1);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (1,2);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (4,2);
INSERT INTO seasonshow (SeasonNumber, ShowID) VALUES (9,1);


INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (1,1,1);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (2,1,2);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (3,2,2);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (4,1,3);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (5,1,4);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (6,1,5);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (7,1,6);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (8,2,1);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (9,2,4);
INSERT INTO season (SeasonID, ShowID, SeasonNumber) VALUES (10,1,9);

INSERT INTO platform (PlatformID, Name, isMobile) VALUES (1, "Windows", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (2, "Mac OSX", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (3, "Linux", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (4, "IOS", 1);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (5, "Android", 1);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (6, "Chrome OS", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (7, "FireTV", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (8, "Roku", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (9, "AppleTV", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (10, "ChromeCast", 0);
INSERT INTO platform (PlatformID, Name, isMobile) VALUES (11, "GoogleTV", 0);

INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("ericweiss@gmail.com", "Eric", "Weiss", "Password1", "United States");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("sattenapalli.v@northeastern.edu", "Varun", "Sattenapalli", "BjergsenGod", "United States");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("123kevin@gmail.com", "Kevin", "Fallon", "Soccererplayer!", "India");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("sqllover88@protonmail.com", "Jim", "Juggler", "IHateJuggling", "Canada");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("dallascowboys@aol.com", "Dak", "Prescott", "iloveSQL33", "United Kingdom");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("quarantinekids6000@gmail.com", "Kanye", "West", "4graduation", "France");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("derbinsky@northeastern.edu", "Nate", "Derbinsky", "DATABASERULES567", "United States");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("hani.k@northeastern.edu", "Hani", "Kitabwalla", "iLOVEb3lla", "Kenya");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("owenthurminator@gmail.com", "Owen", "Thurm", "NOLEGDAYS", "United States");
INSERT INTO user (Email, FName, LName, Password, Country) VALUES ("jimbomcstuff2@outlook.com", "Jimbo", "McStuff", "1onlyeatpopeyes", "United States");

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (1, "Man eats 40 watermelon quickly", "Read the title", '2020-01-04', '00:08:33', 1, "Youtube", NULL);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (2, "The Fire", "The staff decamp to the parking lot for the day when a fire starts in the kitchen. To fill the time they start to play games, which reveal a little too much about some of the team", '2005-10-11', '00:22:03', 0, "Netflix", 1);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (3, "Chapter Two: The Cave of Two Lovers", "The children become lost while taking a short cut through a cave", '2006-08-04', '00:16:48', 0, "Netflix", 2);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (4, "La Casa de Papel E7", "With one of their own critically injured, the robbers race against time to save his life. During a moment alone, Ariadna makes a confession to Mónica", '2018-07-16', '00:44:28', 0, "Netflix", 3);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (5, "Problem Dog", "Walt places Skyler in a difficult spot with their new operation. And as Walt looks to protect himself against Gus, Jesse agrees to a dangerous proposition", '2011-08-11', '00:59:11', 0, "Hulu", 4);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (6, "Bullet Points", "As Skyler concocts an elaborate story to explain their finances, Walt worries when he discovers that Hank has begun a new investigation, and Jesse's lack of interest in doing anything but partying catches Gus' attention", '2011-08-07', '01:03:44', 0, "Hulu", 5);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (7, "Dead Fall", "Sucre and Michael attempt to take off with the money, but their plan leads them into deep water. Meanwhile, Sara realises that she is in serious danger, and Lincoln risks an ambush when he heads to Arizona to reunite with LJ.", '2006-10-23', '00:15:22', 1, "Hulu", 4);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (8, "Ads by political rivals in Utah go viral", "Chris Peterson and Spencer Cox discuss the gubernatorial race and their PSA promoting positivity in the election.", '2020-10-06', '00:05:54', 1, "CBS All Access", NULL);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (9, "Thanks for the Memories", "Izzie plans a big Thanksgiving dinner at Meredith's, but it remains to be seen how many guests will actually show up. In the meantime, Meredith treats a patient who's been in a vegetative state for 16 years.", '2005-11-20', '00:32:29', 0, "Amazon Prime Video", 6);

INSERT INTO video (VideoID, Title, Description, ReleaseDate, Duration, isFree, HostingApp, Season) VALUES (10, "From a Whisper to a Scream", "A multiple trauma causes the tension between Burke and Cristina to come to a head. How much longer can Burke's secret remain hidden? Elsewhere, Alex surprises Addison when he displays an uncharacteristically sensitive side, and George tells Callie that he knows she slept with Mark, which results in Callie attacking Meredith in the locker room.", '2006-11-23', '00:34:19', 0, "Amazon Prime Video", 7);


INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("Netflix", 1, 2, "1.7.3");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("Hulu", 2, 3, "2.7.1");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("The Hub", 3, 5, "5.3.2");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("Youtube", 4, 1, "4.5.9");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("Amazon Prime Video", 5, 2, "10.7.2");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("Crackle", 6, 3, "8.2.1");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("Disney Plus", 7, 4, "9.1.1");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("Acorn TV", 8, 3, "1.4.4");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("CBS All Access", 9, 3, "5.1.9");
INSERT INTO appplatform (AppName, PlatformID, Rating, Version) VALUES ("NFL Redzone", 10, 2, "8.6.9");

INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("ericweiss@gmail.com", "Netflix", '2020-12-31', 20.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("ericweiss@gmail.com", "Hulu", '2021-05-31', 35.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("ericweiss@gmail.com", "Amazon Prime Video", '2020-12-15', 17.50);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("sattenapalli.v@northeastern.edu", "The Hub", '2022-04-31', 140.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("sattenapalli.v@northeastern.edu", "Disney Plus", '2020-12-31', 30.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("123kevin@gmail.com", "The Hub", '2021-1-31', 50.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("sqllover88@protonmail.com", "Disney Plus", '2021-09-31', 89.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("owenthurminator@gmail.com", "CBS All Access", '2021-02-01', 60.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("owenthurminator@gmail.com", "NFL Redzone", '2021-02-10', 150.00);
INSERT INTO appsubscription (UserEmail, AppName, Expiration, Cost) VALUES ("dallascowboys@aol.com", "Acorn TV", '2021-01-01', 45.00);

INSERT INTO likes (UserEmail, VideoID) VALUES ("ericweiss@gmail.com", 1);

INSERT INTO likes (UserEmail, VideoID) VALUES ("ericweiss@gmail.com", 2);

INSERT INTO likes (UserEmail, VideoID) VALUES ("ericweiss@gmail.com", 3);

INSERT INTO likes (UserEmail, VideoID) VALUES ("ericweiss@gmail.com", 4);

INSERT INTO likes (UserEmail, VideoID) VALUES ("sqllover88@protonmail.com", 5);

INSERT INTO likes (UserEmail, VideoID) VALUES ("sqllover88@protonmail.com", 6);

INSERT INTO likes (UserEmail, VideoID) VALUES ("sqllover88@protonmail.com", 7);

INSERT INTO likes (UserEmail, VideoID) VALUES ("owenthurminator@gmail.com", 7);

INSERT INTO likes (UserEmail, VideoID) VALUES ("owenthurminator@gmail.com", 9);

INSERT INTO likes (UserEmail, VideoID) VALUES ("owenthurminator@gmail.com", 10);



INSERT INTO videolist (UserEmail, VideoID) VALUES ("ericweiss@gmail.com", 1);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("ericweiss@gmail.com", 2);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("ericweiss@gmail.com", 3);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("sattenapalli.v@northeastern.edu", 5);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("dallascowboys@aol.com", 5);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("123kevin@gmail.com" , 6);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("123kevin@gmail.com", 7);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("123kevin@gmail.com", 8);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("hani.k@northeastern.edu", 8);
INSERT INTO videolist (UserEmail, VideoID) VALUES ("quarantinekids6000@gmail.com", 10);

INSERT INTO showlist (UserEmail, ShowID) VALUES ("ericweiss@gmail.com", 1);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("ericweiss@gmail.com", 2);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("ericweiss@gmail.com", 3);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("sattenapalli.v@northeastern.edu", 5);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("dallascowboys@aol.com", 5);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("123kevin@gmail.com" , 6);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("123kevin@gmail.com", 7);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("123kevin@gmail.com", 8);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("hani.k@northeastern.edu", 8);
INSERT INTO showlist (UserEmail, ShowID) VALUES ("quarantinekids6000@gmail.com", 10);





INSERT INTO tags(VideoID, Tag) VALUES (1, "Fruit");
INSERT INTO tags(VideoID, Tag) VALUES (1, "Extreme");
INSERT INTO tags(VideoID, Tag) VALUES (3, "Romance");
INSERT INTO tags(VideoID, Tag) VALUES (4, "Romance");
INSERT INTO tags(VideoID, Tag) VALUES (7, "Thriller");
INSERT INTO tags(VideoID, Tag) VALUES (7, "Mystery");
INSERT INTO tags(VideoID, Tag) VALUES (8, "Politics");
INSERT INTO tags(VideoID, Tag) VALUES (8, "Utah");
INSERT INTO tags(VideoID, Tag) VALUES (9, "Thanksgiving");
INSERT INTO tags(VideoID, Tag) VALUES (10, "Trauma");



