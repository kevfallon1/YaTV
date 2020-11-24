-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2020 at 03:51 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `YaTV`
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `Name` varchar(50) NOT NULL,
  `Description` mediumtext NOT NULL
) 

--
-- Dumping data for table `app`
--

INSERT INTO `app` (`Name`, `Description`) VALUES
('Acorn TV', 'Award-Winning British TV'),
('Amazon Prime Video', 'Amazon’s best take at getting into the streaming market.'),
('CBS All Access', 'On-demand streaming service that lets you watch its programming whenever you want'),
('Crackle', 'Watch Movies and TV Shows for free'),
('Disney Plus', 'Classic favorites. New releases. Disney Channel throwbacks. Exclusive Original series.'),
('Hulu', 'Premium streaming service offering live and on-demand TV and movies, with and without commercials, both in and outside the home.'),
('Netflix', 'Streaming service to watch TV shows and movies online'),
('NFL Redzone', 'Stream the highlights of every game on Sunday.'),
('The Hub', 'Top of the line streaming service to your favorite videos.'),
('Youtube', 'Watch quality content from your favorite creators.');

-- --------------------------------------------------------

--
-- Table structure for table `appplatform`
--

CREATE TABLE `appplatform` (
  `AppName` varchar(50) NOT NULL,
  `PlatformID` int(11) NOT NULL,
  `Rating` tinyint(1) NOT NULL,
  `Version` varchar(15) NOT NULL
) 

--
-- Dumping data for table `appplatform`
--

INSERT INTO `appplatform` (`AppName`, `PlatformID`, `Rating`, `Version`) VALUES
('Acorn TV', 8, 3, '1.4.4'),
('Amazon Prime Video', 5, 2, '10.7.2'),
('CBS All Access', 9, 3, '5.1.9'),
('Crackle', 6, 3, '8.2.1'),
('Disney Plus', 7, 4, '9.1.1'),
('Hulu', 2, 3, '2.7.1'),
('Netflix', 1, 2, '1.7.3'),
('NFL Redzone', 10, 2, '8.6.9'),
('The Hub', 3, 5, '5.3.2'),
('Youtube', 4, 1, '4.5.9');

-- --------------------------------------------------------

--
-- Table structure for table `appsubscription`
--

CREATE TABLE `appsubscription` (
  `UserEmail` varchar(70) NOT NULL,
  `AppName` varchar(50) NOT NULL,
  `Expiration` date NOT NULL,
  `Cost` float NOT NULL
) 

--
-- Dumping data for table `appsubscription`
--

INSERT INTO `appsubscription` (`UserEmail`, `AppName`, `Expiration`, `Cost`) VALUES
('123kevin@gmail.com', 'The Hub', '2021-01-31', 50),
('dallascowboys@aol.com', 'Acorn TV', '2021-01-01', 45),
('ericweiss@gmail.com', 'Amazon Prime Video', '2020-12-15', 17.5),
('ericweiss@gmail.com', 'Hulu', '2021-05-31', 35),
('ericweiss@gmail.com', 'Netflix', '2020-12-31', 20),
('owenthurminator@gmail.com', 'CBS All Access', '2021-02-01', 60),
('owenthurminator@gmail.com', 'NFL Redzone', '2021-02-10', 150),
('sattenapalli.v@northeastern.edu', 'Disney Plus', '2020-12-31', 30),
('sattenapalli.v@northeastern.edu', 'The Hub', '0000-00-00', 140),
('sqllover88@protonmail.com', 'Disney Plus', '0000-00-00', 89);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `UserEmail` varchar(70) NOT NULL,
  `VideoID` int(11) NOT NULL
) 

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`UserEmail`, `VideoID`) VALUES
('ericweiss@gmail.com', 1),
('ericweiss@gmail.com', 2),
('ericweiss@gmail.com', 3),
('ericweiss@gmail.com', 4),
('owenthurminator@gmail.com', 7),
('owenthurminator@gmail.com', 9),
('owenthurminator@gmail.com', 10),
('sqllover88@protonmail.com', 5),
('sqllover88@protonmail.com', 6),
('sqllover88@protonmail.com', 7);

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

CREATE TABLE `platform` (
  `PlatformID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `isMobile` tinyint(1) NOT NULL
) 

--
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`PlatformID`, `Name`, `isMobile`) VALUES
(1, 'Windows', 0),
(2, 'Mac OSX', 0),
(3, 'Linux', 0),
(4, 'IOS', 1),
(5, 'Android', 1),
(6, 'Chrome OS', 0),
(7, 'FireTV', 0),
(8, 'Roku', 0),
(9, 'AppleTV', 0),
(10, 'ChromeCast', 0),
(11, 'GoogleTV', 0);

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `SeasonID` int(11) NOT NULL,
  `ShowID` int(11) NOT NULL,
  `SeasonNumber` tinyint(3) NOT NULL
) 

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`SeasonID`, `ShowID`, `SeasonNumber`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(5, 1, 4),
(6, 1, 5),
(7, 1, 6),
(8, 2, 1),
(9, 2, 4),
(10, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `seasonshow`
--

CREATE TABLE `seasonshow` (
  `SeasonNumber` tinyint(3) NOT NULL,
  `ShowID` int(11) NOT NULL
) 

--
-- Dumping data for table `seasonshow`
--

INSERT INTO `seasonshow` (`SeasonNumber`, `ShowID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `showlist`
--

CREATE TABLE `showlist` (
  `UserEmail` varchar(70) NOT NULL,
  `ShowID` int(11) NOT NULL
) 

--
-- Dumping data for table `showlist`
--

INSERT INTO `showlist` (`UserEmail`, `ShowID`) VALUES
('123kevin@gmail.com', 6),
('123kevin@gmail.com', 7),
('123kevin@gmail.com', 8),
('dallascowboys@aol.com', 5),
('ericweiss@gmail.com', 1),
('ericweiss@gmail.com', 2),
('ericweiss@gmail.com', 3),
('hani.k@northeastern.edu', 8),
('quarantinekids6000@gmail.com', 10),
('sattenapalli.v@northeastern.edu', 5);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `ShowID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL
) 

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`ShowID`, `Title`, `Description`) VALUES
(1, 'Breaking Bad', 'Set in Albuquerque, New Mexico, between 2008 and 2010, Breaking Bad follows Walter White, a meek high school chemistry teacher who transforms into a ruthless player in the local methamphetamine drug trade, driven by a desire to provide for his family after being diagnosed with terminal lung cancer.'),
(2, 'Friends ', 'A 90’s Comedy TV show based in Manhattan following the lives of 6 friends as they face all of life’s challenges and beauties together.'),
(3, 'Game of Thrones ', 'This show, set in medieval times, recounts the tale of a country’s civil war. It is set in the fictional continents of Westeros and Essos in a completely different world.'),
(4, 'It’s Always Sunny in Philadelphia', 'The series follows the lives of The Gang, a group of 5 narcissistic friends who run their own bar, located in South Philadelphia.'),
(5, 'One Piece', 'A Japanese animated television series about a boy’s journey to explore the Grand Line in search of the world’s greatest treasure known as One Piece so he can rule in an era of pirates.'),
(6, 'New Girl', 'Jess, an unorthodox woman, moves into a loft with three men. At first, their relationship is rocky, but the show tells the story of the life experiences Jess shares with her new roommates.'),
(7, 'Avatar: The Last Airbender', 'In a world where people can bend elements, a 12-year old boy embarks on a journey to save the world. Luckily, he is accompanied by his closest friends as he tries to fulfill his destiny as the Avatar and return peace and balance to the world.'),
(8, 'Rick and Morty', 'An animated series following the adventures a drunk, super scientist and his not-so-bright grandson.'),
(9, 'The Office', 'Set in Scranton, Pennsylvania, this show is a mockumentary which follows the daily activities at Dunder Mifflin Paper Company.'),
(10, 'Narcos', 'A deep-dive into the criminal actions of drug lord Pablo Escobar and the other Colombian drug cartels who rose to power in the late 1900s.');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `VideoID` int(11) NOT NULL,
  `Tag` varchar(100) NOT NULL
) 

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`VideoID`, `Tag`) VALUES
(1, 'Extreme'),
(1, 'Fruit'),
(3, 'Romance'),
(4, 'Romance'),
(7, 'Mystery'),
(7, 'Thriller'),
(8, 'Politics'),
(8, 'Utah'),
(9, 'Thanksgiving'),
(10, 'Trauma');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Email` varchar(70) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `Password` varchar(70) NOT NULL,
  `Country` varchar(50) NOT NULL
) 

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Email`, `FName`, `LName`, `Password`, `Country`) VALUES
('123kevin@gmail.com', 'Kevin', 'Fallon', 'Soccererplayer!', 'India'),
('dallascowboys@aol.com', 'Dak', 'Prescott', 'iloveSQL33', 'United Kingdom'),
('derbinsky@northeastern.edu', 'Nate', 'Derbinsky', 'DATABASERULES567', 'United States'),
('ericweiss@gmail.com', 'Eric', 'Weiss', 'Password1', 'United States'),
('hani.k@northeastern.edu', 'Hani', 'Kitabwalla', 'iLOVEb3lla', 'Kenya'),
('jimbomcstuff2@outlook.com', 'Jimbo', 'McStuff', '1onlyeatpopeyes', 'United States'),
('owenthurminator@gmail.com', 'Owen', 'Thurm', 'NOLEGDAYS', 'United States'),
('quarantinekids6000@gmail.com', 'Kanye', 'West', '4graduation', 'France'),
('sattenapalli.v@northeastern.edu', 'Varun', 'Sattenapalli', 'BjergsenGod', 'United States'),
('sqllover88@protonmail.com', 'Jim', 'Juggler', 'IHateJuggling', 'Canada');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `VideoID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Duration` time NOT NULL,
  `isFree` tinyint(1) NOT NULL,
  `HostingApp` varchar(50) NOT NULL,
  `Season` int(11) DEFAULT NULL
) 

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`VideoID`, `Title`, `Description`, `ReleaseDate`, `Duration`, `isFree`, `HostingApp`, `Season`) VALUES
(1, 'Man eats 40 watermelon quickly', 'Read the title', '2020-01-04', '00:08:33', 1, 'Youtube', NULL),
(2, 'The Fire', 'The staff decamp to the parking lot for the day when a fire starts in the kitchen. To fill the time they start to play games, which reveal a little too much about some of the team', '2005-10-11', '00:22:03', 0, 'Netflix', 1),
(3, 'Chapter Two: The Cave of Two Lovers', 'The children become lost while taking a short cut through a cave', '2006-08-04', '00:16:48', 0, 'Netflix', 2),
(4, 'La Casa de Papel E7', 'With one of their own critically injured, the robbers race against time to save his life. During a moment alone, Ariadna makes a confession to Mónica', '2018-07-16', '00:44:28', 0, 'Netflix', 3),
(5, 'Problem Dog', 'Walt places Skyler in a difficult spot with their new operation. And as Walt looks to protect himself against Gus, Jesse agrees to a dangerous proposition', '2011-08-11', '00:59:11', 0, 'Hulu', 4),
(6, 'Bullet Points', 'As Skyler concocts an elaborate story to explain their finances, Walt worries when he discovers that Hank has begun a new investigation, and Jesse\'s lack of interest in doing anything but partying catches Gus\' attention', '2011-08-07', '01:03:44', 0, 'Hulu', 5),
(7, 'Dead Fall', 'Sucre and Michael attempt to take off with the money, but their plan leads them into deep water. Meanwhile, Sara realises that she is in serious danger, and Lincoln risks an ambush when he heads to Arizona to reunite with LJ.', '2006-10-23', '00:15:22', 1, 'Hulu', 4),
(8, 'Ads by political rivals in Utah go viral', 'Chris Peterson and Spencer Cox discuss the gubernatorial race and their PSA promoting positivity in the election.', '2020-10-06', '00:05:54', 1, 'CBS All Access', NULL),
(9, 'Thanks for the Memories', 'Izzie plans a big Thanksgiving dinner at Meredith\'s, but it remains to be seen how many guests will actually show up. In the meantime, Meredith treats a patient who\'s been in a vegetative state for 16 years.', '2005-11-20', '00:32:29', 0, 'Amazon Prime Video', 6),
(10, 'From a Whisper to a Scream', 'A multiple trauma causes the tension between Burke and Cristina to come to a head. How much longer can Burke\'s secret remain hidden? Elsewhere, Alex surprises Addison when he displays an uncharacteristically sensitive side, and George tells Callie that he knows she slept with Mark, which results in Callie attacking Meredith in the locker room.', '2006-11-23', '00:34:19', 0, 'Amazon Prime Video', 7);

-- --------------------------------------------------------

--
-- Table structure for table `videolist`
--

CREATE TABLE `videolist` (
  `UserEmail` varchar(70) NOT NULL,
  `VideoID` int(11) NOT NULL
) 

--
-- Dumping data for table `videolist`
--

INSERT INTO `videolist` (`UserEmail`, `VideoID`) VALUES
('123kevin@gmail.com', 6),
('123kevin@gmail.com', 7),
('123kevin@gmail.com', 8),
('dallascowboys@aol.com', 5),
('ericweiss@gmail.com', 1),
('ericweiss@gmail.com', 2),
('ericweiss@gmail.com', 3),
('hani.k@northeastern.edu', 8),
('quarantinekids6000@gmail.com', 10),
('sattenapalli.v@northeastern.edu', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `appplatform`
--
ALTER TABLE `appplatform`
  ADD PRIMARY KEY (`AppName`,`PlatformID`),
  ADD KEY `PlatformID` (`PlatformID`);

--
-- Indexes for table `appsubscription`
--
ALTER TABLE `appsubscription`
  ADD PRIMARY KEY (`UserEmail`,`AppName`),
  ADD KEY `AppName` (`AppName`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`UserEmail`,`VideoID`),
  ADD KEY `VideoID` (`VideoID`);

--
-- Indexes for table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`PlatformID`);

--
-- Indexes for table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`SeasonID`),
  ADD KEY `ShowID` (`ShowID`),
  ADD KEY `SeasonNumber` (`SeasonNumber`);

--
-- Indexes for table `seasonshow`
--
ALTER TABLE `seasonshow`
  ADD PRIMARY KEY (`SeasonNumber`,`ShowID`),
  ADD KEY `ShowID` (`ShowID`);

--
-- Indexes for table `showlist`
--
ALTER TABLE `showlist`
  ADD PRIMARY KEY (`UserEmail`,`ShowID`),
  ADD KEY `ShowID` (`ShowID`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`ShowID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`VideoID`,`Tag`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`VideoID`),
  ADD KEY `HostingApp` (`HostingApp`);

--
-- Indexes for table `videolist`
--
ALTER TABLE `videolist`
  ADD PRIMARY KEY (`UserEmail`,`VideoID`),
  ADD KEY `VideoID` (`VideoID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appplatform`
--
ALTER TABLE `appplatform`
  ADD CONSTRAINT `appplatform_ibfk_1` FOREIGN KEY (`AppName`) REFERENCES `app` (`Name`),
  ADD CONSTRAINT `appplatform_ibfk_2` FOREIGN KEY (`PlatformID`) REFERENCES `platform` (`PlatformID`);

--
-- Constraints for table `appsubscription`
--
ALTER TABLE `appsubscription`
  ADD CONSTRAINT `appsubscription_ibfk_1` FOREIGN KEY (`UserEmail`) REFERENCES `user` (`Email`),
  ADD CONSTRAINT `appsubscription_ibfk_2` FOREIGN KEY (`AppName`) REFERENCES `app` (`Name`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`UserEmail`) REFERENCES `user` (`Email`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`VideoID`) REFERENCES `video` (`VideoID`);

--
-- Constraints for table `season`
--
ALTER TABLE `season`
  ADD CONSTRAINT `season_ibfk_1` FOREIGN KEY (`ShowID`) REFERENCES `seasonshow` (`ShowID`),
  ADD CONSTRAINT `season_ibfk_2` FOREIGN KEY (`SeasonNumber`) REFERENCES `seasonshow` (`SeasonNumber`);

--
-- Constraints for table `seasonshow`
--
ALTER TABLE `seasonshow`
  ADD CONSTRAINT `seasonshow_ibfk_1` FOREIGN KEY (`ShowID`) REFERENCES `shows` (`ShowID`);

--
-- Constraints for table `showlist`
--
ALTER TABLE `showlist`
  ADD CONSTRAINT `showlist_ibfk_1` FOREIGN KEY (`UserEmail`) REFERENCES `user` (`Email`),
  ADD CONSTRAINT `showlist_ibfk_2` FOREIGN KEY (`ShowID`) REFERENCES `shows` (`ShowID`);

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`VideoID`) REFERENCES `video` (`VideoID`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`HostingApp`) REFERENCES `app` (`Name`);

--
-- Constraints for table `videolist`
--
ALTER TABLE `videolist`
  ADD CONSTRAINT `videolist_ibfk_1` FOREIGN KEY (`UserEmail`) REFERENCES `user` (`Email`),
  ADD CONSTRAINT `videolist_ibfk_2` FOREIGN KEY (`VideoID`) REFERENCES `video` (`VideoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
