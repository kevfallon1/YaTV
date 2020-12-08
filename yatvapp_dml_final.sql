-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2020 at 07:31 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yatvapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `Name` varchar(50) NOT NULL,
  `Description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

CREATE TABLE `platform` (
  `PlatformID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `isMobile` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`SeasonID`, `ShowID`, `SeasonNumber`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 1, 2),
(12, 2, 2),
(13, 3, 2),
(14, 4, 2),
(15, 5, 2),
(16, 6, 2),
(17, 7, 2),
(18, 8, 2),
(19, 9, 2),
(20, 10, 2),
(21, 1, 3),
(22, 2, 3),
(23, 3, 3),
(24, 4, 3),
(25, 5, 3),
(26, 6, 3),
(27, 7, 3),
(28, 8, 3),
(29, 9, 3),
(30, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `seasonshow`
--

CREATE TABLE `seasonshow` (
  `SeasonNumber` tinyint(3) NOT NULL,
  `ShowID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seasonshow`
--

INSERT INTO `seasonshow` (`SeasonNumber`, `ShowID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `showlist`
--

CREATE TABLE `showlist` (
  `UserEmail` varchar(70) NOT NULL,
  `ShowID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `ShowID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`ShowID`, `Title`, `Description`) VALUES
(1, 'Breaking Bad', 'Set in Albuquerque, New Mexico, between 2008 and 2010, Breaking Bad follows Walter White, a meek high school chemistry teacher who transforms into a ruthless player in the local methamphetamine drug trade, driven by a desire to provide for his family after being diagnosed with terminal lung cancer.'),
(2, 'Friends', 'A 90’s Comedy TV show based in Manhattan following the lives of 6 friends as they face all of life’s challenges and beauties together.'),
(3, 'Game of Thrones', 'This show, set in medieval times, recounts the tale of a country’s civil war. It is set in the fictional continents of Westeros and Essos in a completely different world.'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`VideoID`, `Tag`) VALUES
(1, 'Extreme'),
(1, 'Fruit'),
(2, 'Super Smash Bros. Ultimate'),
(3, 'Politics'),
(4, 'Politics'),
(12, 'Football'),
(13, 'Football'),
(31, 'Detective'),
(32, 'Cooking'),
(33, 'Politics');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`VideoID`, `Title`, `Description`, `ReleaseDate`, `Duration`, `isFree`, `HostingApp`, `Season`) VALUES
(1, 'Man eats 40 watermelon quickly', 'Read the title', '2020-01-04', '00:08:33', 1, 'Youtube', NULL),
(2, 'BRUTAL Shield Breaks in Smash Ultimate #20', 'Another edition of Smash Bros. clips', '2020-02-22', '00:10:03', 1, 'Youtube', NULL),
(3, 'Obama Runs Constructive Criticism Ad On McCain', 'In response to Republican attacks, Barack Obama unleashed a series of slightly negative ads that gently point out how McCain could be doing a better job.', '2012-10-10', '00:03:44', 1, 'Youtube', NULL),
(4, 'McCain Left On Campaign Bus Overnight', 'Campaign officials downplayed the incident, saying the senator was fine as soon as he was fed and taken to the bathroom.', '2008-10-20', '00:02:38', 1, 'Youtube', NULL),
(11, 'Ads by political rivals in Utah go viral', 'Chris Peterson and Spencer Cox discuss the gubernatorial race and their PSA promoting positivity in the election.', '2020-10-06', '00:05:54', 1, 'CBS All Access', NULL),
(12, 'Chiefs v. Cowboys', 'Watch Sunday NFL here', '2020-09-06', '03:01:54', 0, 'CBS All Access', NULL),
(13, 'Falcons v. Ravens', 'Watch Sunday NFL here', '2020-09-06', '02:55:01', 0, 'CBS All Access', NULL),
(14, 'Second Contact', 'Ensign Tendi has her first day of work on Starfleet\'s USS Cerritos, where she meets fellow support crew members; Boimler is tasked with a secret special assignment; Rutherford attempts to keep his dating life intact while a disaster strikes the ship.', '2020-08-06', '00:22:31', 1, 'CBS All Access', NULL),
(15, 'A Discount Service Dog', 'Humans come to heal alongside a menagerie of over 100 rescue animals at Jamie\'s ranch, outside of Austin.', '2020-10-29', '00:33:31', 1, 'CBS All Access', NULL),
(21, 'Hello Mr. Sattenapalli', 'Varun finds himself in another unfortunate situation.', '2020-01-01', '00:40:05', 0, 'The Hub', NULL),
(22, 'Home Invasion!', 'Kevin, in need of a place to stay for the night, busts into a home and finds himself in a completely new world.', '2020-02-01', '00:46:25', 0, 'The Hub', NULL),
(23, 'A Game of Football', 'Hani and friends engage in a two-hand touch game that sees Hani being more physical than anyone could imagine.', '2020-03-01', '00:21:12', 0, 'The Hub', NULL),
(24, 'A Long Day’s Rest', 'After a hard day out on the job, Eric needs to take a break. However, he finds himself in a house which just won’t sleep.', '2020-04-01', '01:49:55', 0, 'The Hub', NULL),
(31, 'The Hounds of Baskerville', 'Sherlock and John investigate the ghosts of a young man who has been seeing monstrous hounds out in the woods where his father died.', '2012-05-13', '01:28:00', 1, 'Acorn TV', NULL),
(32, 'Biscuit Week', 'Jo Brand welcomes new host Sandy Toksvig along with Jamie Laing and Sarah Millican.', '2019-09-03', '00:34:00', 1, 'Acorn TV', NULL),
(33, 'Brexit, yes or no?', 'Interviewers take a tour across England and ask citizens about their opinions on Brexit.', '2020-02-03', '00:48:31', 1, 'Acorn TV', NULL),
(34, 'ICC 2019: England v. India', 'England and India face off at the 2019 ICC in a 50 over ODI.', '2019-06-30', '05:51:27', 1, 'Acorn TV', NULL),
(41, 'Sunday Afternoon TDs', 'Every touchdown from every game, every Sunday afternoon during the NFL regular season.', '2020-11-22', '10:51:27', 0, 'NFL Redzone', NULL),
(42, '2019 NFC Championship', 'The San Francisco 49ers host the Green Bay Packers to determine who the NFC is sending to Super Bowl LIII.', '2020-01-19', '03:29:16', 1, 'NFL Redzone', NULL),
(43, 'NFL Super Bowl LIV', 'The Kansas City Chiefs take on the San Francisco 49ers at Hard Rock Stadium in Florida for the 54th Super Bowl.', '2020-02-03', '03:47:49', 1, 'NFL Redzone', NULL),
(44, '2018 AFC Championship', 'The New England Patriots host the Jacksonville Jaguars to determine who the AFC is sending to Super Bowl LII.', '2018-01-21', '03:21:15', 1, 'NFL Redzone', NULL),
(1001, 'Pilot', 'Walter White is a high school chemistry teacher who learns that he has lung cancer. With a new lease of life, Walter sets up a mobile meth lab with a former student and becomes a drug dealer in order to secure his family\'s financial security.', '2008-01-20', '00:42:51', 1, 'Netflix', 1),
(1002, 'Cat’s in the Bag...', 'Following their debacle in the desert, Walter and Jesse are left with a mess to dispose of. Later, Skyler grows suspicious of Walt\'s recent activity.', '2008-01-27', '00:43:14', 0, 'Netflix', 1),
(1003, '...And the Bag\'s in the River', 'Following an argument with Jesse, Walter is left to deal with Krazy-8 alone. After Marie raises concerns that Walt Jr is smoking cannabis, Hank shows him the dangers of drug use.', '2008-02-10', '00:51:11', 0, 'Netflix', 1),
(1004, 'Cancer Man', 'The DEA becomes suspicious of a new drug kingpin. Walt reveals that he has cancer to Marie and Hank. Elsewhere, Jesse visits his estranged family.', '2008-02-16', '00:38:18', 0, 'Netflix', 1),
(1011, 'Seven Thirty-Seven', 'Walt and Jesse are trying to work out a way of ending their partnership with Tuco. Elsewhere, Hank tries to mend fences between Marie and Skyler.', '2009-03-08', '00:43:18', 0, 'Netflix', 11),
(1012, 'Grilled', 'With Walt and Jesse kidnapped and being held captive by a crazed Tuco, Marie and Hank try to comfort Skyler over Walt\'s disappearance. Later, Hank pays a visit to Mrs Pinkman.', '2009-03-15', '00:40:58', 0, 'Netflix', 11),
(1013, 'Bit by a Dead Bee', 'Walt and Jesse\'s respective financial situations start to suffer when they try to cover their tracks. Meanwhile, the DEA gets a break in its meth investigation that could lead agents straight to Walt and Jesse.', '2009-03-22', '00:47:43', 0, 'Netflix', 11),
(1014, 'Down', 'Walt and Jesse appear to be in the clear, but now face trouble on their respective home fronts; Walt finds it difficult to reconnect with Skyler and the rest of his family, while Jesse\'s parents kick him out of their house.', '2009-03-29', '00:39:11', 0, 'Netflix', 11),
(1021, 'No Mas', 'In the wake of the Albuquerque airline disaster, Skyler forces Walt to move out, while Jesse\'s stay in drug rehab helps him come to grips with his role in the fatal mid-air collision.', '2010-03-21', '00:52:19', 0, 'Netflix', 21),
(1022, 'Caballo sin Nombre', 'As he finds Skyler is dead set on getting a divorce, an unwitting Walt lands squarely in the crosshairs of a pair of Mexican drug cartel hit men set on revenge.', '2010-03-28', '00:47:04', 0, 'Netflix', 21),
(1023, 'I.F.T', 'As Walt calls Skyler\'s bluff and moves back home without her consent, Jesse ponders re-entering the drug trade as a Mexican cartel anxiously awaits its opportunity to get revenge for the death of one of its own.', '2010-04-04', '00:44:33', 0, 'Netflix', 21),
(1024, 'Green Light', 'As Skyler\'s affair with her boss creates chaos within her fractured marriage, a new batch of meth that puts Jesse back in business inadvertently gets Walt involved, too.', '2010-04-11', '00:43:11', 0, 'Netflix', 21),
(2001, 'The One Where Monica Gets a Roommate', 'An introduction to the gang. After Rachel leaves her Mr Potato Head look-alike fiancé Barry at the altar, she moves in with Monica and discovers that independence sucks when you don\'t have Daddy\'s credit cards to rely on. Meanwhile, Chandler and Joey encourage Ross to experience the advantages of bachelorhood, and Phoebe supports herself by playing guitar in the subway.', '1994-09-22', '00:23:11', 1, 'Disney Plus', 2),
(2002, 'The One with the Sonogram at the End', 'Ross\'s lesbian ex-wife is pregnant with his child and he doesn\'t like her choice of last name for the baby. Elsewhere, Rachel finds out that her ex-fiancé went on what would have been their honeymoon.', '1994-09-29', '00:21:56', 0, 'Disney Plus', 2),
(2003, 'The One with the Thumb', 'Monica finds it difficult to break up with her latest boyfriend whom everyone likes, Chandler is reunited with his beloved cigarettes, and Phoebe receives a large sum of money.', '1994-10-06', '00:20:12', 0, 'Disney Plus', 2),
(2004, 'The One with George Stephanopoulos', 'While the men attend a hockey game and end up at a hospital, the women spy on President Clinton\'s top aide, George Stephanopoulos, who lives across the street. Meanwhile, Rachel receives her first pay packet.', '1994-10-13', '00:24:55', 0, 'Disney Plus', 2),
(2011, 'The One with Ross\'s New Girlfriend', 'Ross comes back from China with his new girlfriend Julie, and Rachel has a really hard time dealing with it. She winds up sleeping with Paolo and hates herself for it. Joey persuades her to tell Ross how she feels, but when Ross tells her he is in love with Julie, she can\'t bring herself to do it.', '1995-09-21', '00:21:33', 0, 'Disney Plus', 12),
(2012, 'The One With the Breast Milk', 'While Carol and Susan are away, Ross and the friends babysit his newborn son Ben, but Ross is disgusted when Phoebe tests the temperature of some bottled breast milk on her wrist. Meanwhile, Joey competes with a fellow cologne salesman.', '1995-09-28', '00:22:42', 0, 'Disney Plus', 12),
(2013, 'The One Where Heckles Dies', 'When downstairs neighbour Mr Heckles dies, the friends clean out his apartment, but Chandler becomes convinced his hyper-critical nature will mean he ends up alone and sad, just like Heckles.', '1995-10-05', '00:23:11', 0, 'Disney Plus', 12),
(2014, 'The One With Phoebe\'s Husband', 'Everyone is surprised when Phoebe\'s husband, a gay Canadian ice dancer, shows up, as nobody knew she was married. Elsewhere, Chandler reveals his third nipple, and Ross\'s new relationship is under attack, unbeknown to him.', '1995-10-12', '00:21:55', 0, 'Disney Plus', 12),
(2021, 'The One with the Princess Leia Fantasy', 'Monica is distraught after her breakup with Richard. Phoebe unsuccessfully tries to raise her spirits, but ultimately it\'s Mr Geller who comforts his daughter. Elsewhere, Chandler and Janice begin seeing each other again and Joey can\'t stand it. The two plan a day of fun to try to overcome Joey\'s aversions for Chandler\'s sake. Meanwhile, Rachel tells Phoebe and Monica about Ross\'s Princess Leia fantasy.', '1996-09-19', '00:22:22', 0, 'Disney Plus', 22),
(2022, 'The One Where No One\'s Ready', 'In a race against the clock, Ross tries to get the gang dressed and ready for a black-tie benefit at the museum.', '1996-09-26', '00:23:08', 0, 'Disney Plus', 22),
(2023, 'The One With the Jam', 'Monica decides the best way to get over Richard is to keep herself busy. She develops a `jam plan\', hoping the distraction of cooking will divert her attention. After making jars and jars of jam Monica decides she still wants to have a baby, so she begins searching for a sperm donor, and comes across Joey\'s file. Elsewhere, Phoebe is mistakenly stalked by a man who thinks she\'s Ursula, and Chandler receives dating advice.', '1996-10-03', '00:22:18', 0, 'Disney Plus', 22),
(2024, 'The One With the Metaphorical Tunnel', 'Ross panics when he sees his son with a Barbie doll, and Chandler\'s fear of commitment surfaces in his relationship with Janice.', '1996-10-10', '00:21:43', 0, 'Disney Plus', 22),
(3001, 'Winter Is Coming', 'A Night\'s Watch deserter is tracked down; Lord Eddard Ned Stark learns that his mentor has died; Viserys Targaryen plots to win back the throne; Robert arrives at Winterfell with his family; Ned prepares to leave for King\'s Landing.', '2011-04-17', '00:51:43', 1, 'Hulu', 3),
(3002, 'The Kingsroad', 'Bran\'s fate remains in doubt; Ned leaves Westeros with his daughters; Jon Snow heads north to join the Night\'s Watch; Daenerys tries to learn how to please her new husband.', '2011-04-24', '00:52:52', 0, 'Hulu', 3),
(3003, 'Lord Snow', 'Lord Ned Stark arrives at King\'s Landing, and before he can shake off the dust of the road, his presence is requested by the Small Council. On his way through the Red Keep, Ned sees Sir Jaime Lannister standing by the Iron Throne. The two men exchange barbs, and then Jaime recounts the day that the Mad King Aerys murdered Ned\'s father and brother in the throne room.', '2011-05-01', '00:51:11', 0, 'Hulu', 3),
(3004, 'Cripples, Bastards, and Broken Things', 'A raven flies through the gates of Winterfell, swooping past Bran Stark, who\'s standing in the courtyard practising his archery. He walks after the bird, and when he catches up to it, sees that the raven has three eyes. Bran wakens from the dream and finds himself in bed with his wolf Summer, still unable to walk. Theon Greyjoy enters the room with Hodor, a large and simpleminded stable boy, who carries Bran downstairs.', '2011-05-08', '00:51:22', 0, 'Hulu', 3),
(3011, 'The North Remembers', 'Tyrion arrives in King\'s Landing to counsel Joffrey; Stannis Baratheon plots an invasion to claim his late brother\'s throne; Daenerys and her three dragons search for allies and water; Bran presides over a threadbare Winterfell.', '2012-04-01', '00:51:33', 0, 'Hulu', 13),
(3012, 'The Night Lands', 'Tyrion chastens Cersei for alienating the king\'s subjects; Arya shares a secret with Gendry; one of Dany\'s scouts returns with news; Theon Greyjoy reunites with his father; Davos enlists a pirate to join forces with Stannis and Melisandre.', '2012-04-08', '00:51:44', 0, 'Hulu', 13),
(3013, 'What Is Dead May Never Die', 'Tyrion plots to gain alliances through the promise of marriage; Catelyn arrives in the Stormlands; Luwin tries to decipher Bran\'s dreams.', '2012-04-15', '00:52:13', 0, 'Hulu', 13),
(3014, 'Garden of Bones', 'Joffrey punishes Sansa; Catelyn tries to get Stannis and Renly to unite against the Lannisters; Dany arrives at the gates of Qarth; Arya and Gendry are taken to Harrenhal; Davos must smuggle Melisandre into a secret cove.', '2012-04-22', '00:53:11', 0, 'Hulu', 13),
(3021, 'Valar Dohaeris', 'Jon is brought before the King Beyond the Wall; Tyrion asks for his reward; Littlefinger offers Sansa a way out; Cersei hosts a dinner for the royal family; Daenerys sails into Slaver\'s Bay.', '2013-03-31', '00:54:54', 0, 'Hulu', 23),
(3022, 'Dark Wings, Dark Words', 'Sansa says too much, Shae asks Tyrion for a favour, Jaime finds a way to pass the time, Arya encounters the Brotherhood Without Banners.', '2013-04-07', '00:52:43', 0, 'Hulu', 23),
(3023, 'Walk of Punishment', 'Tyrion gains new responsibilities, Jon is taken to the Fist of the First Men, Daenerys meets with the slavers and Jaime strikes a deal with his captors.', '2013-04-14', '00:53:22', 0, 'Hulu', 23),
(3024, 'And Now His Watch Is Ended', 'The Night\'s Watch takes stock, Varys meets his better, Arya is taken to the commander of the Brotherhood and Daenerys makes an exchange.', '2013-04-21', '00:53:41', 0, 'Hulu', 23),
(4001, 'The Gang Gets Racist', 'Following three friends who own and run a bar in Philadelphia. The guys hire Dee\'s friend Terrell as a promoter for the bar and get more than they bargained for, and Charlie has to prove he\'s not a racist.', '2005-08-04', '00:21:00', 1, 'Amazon Prime Video', 4),
(4002, 'Charlie Wants an Abortion', 'A girl from Charlies past reveals they have a child together; Mac sees the benefits of being a pro-life advocate; Dennis uses an abortion rally to meet women.', '2005-08-11', '00:21:13', 0, 'Amazon Prime Video', 4),
(4003, 'Underage Drinking: A National Concern', 'After noticing a rise in underage patrons, the gang decide to make a few accommodating adjustments for their younger crowd.', '2005-08-16', '00:21:25', 0, 'Amazon Prime Video', 4),
(4004, 'Charlie Has Cancer', 'The gang learns that Charlie might have cancer; they hatch a scheme to alleviate his pain; Mac proves that he\'s a narcissist.', '2005-08-23', '00:22:25', 0, 'Amazon Prime Video', 4),
(4011, 'Charlie Gets Crippled', 'The gang learns something when Charlie must use a wheelchair; Dennis and Dees estranged father returns to town.', '2006-06-29', '00:22:26', 0, 'Amazon Prime Video', 14),
(4012, 'Charlie Gets Crippled; The Gang Goes Jihad Part 2', 'The gang uses unorthodox measures to save the bar from an overzealous business neighbour; Dennis and Dee\'s mother returns to town and makes Frank\'s life miserable.', '2006-06-29', '00:21:13', 0, 'Amazon Prime Video', 14),
(4013, 'Dennis and Dee Go on Welfare', 'Dennis and Dee quit their jobs and concoct a plan to go on welfare; Mac and Charlie suffer the consequences when Dennis and Dee quit.', '2006-07-06', '00:21:19', 0, 'Amazon Prime Video', 14),
(4014, 'Dennis and Dee Go on Welfare; Mac Bangs Dennis Mom Part 2', 'Barbara becomes jealous of Frank\'s new relationship with Dee and Dennis and that he\'s been dating; she tries to seduce Mac for revenge.', '2006-07-06', '00:21:08', 0, 'Amazon Prime Video', 14),
(4021, 'The Gang Finds a Dumpster Baby', 'Dennis becomes disappointed after joining an environmentalist group; Dee and Mac decide to raise a baby they found in a rubbish bin.', '2007-09-13', '00:22:22', 0, 'Amazon Prime Video', 24),
(4022, 'The Gang Gets Invincible', 'The Philadelphia Eagles hold open tryouts, and Mac, Dennis and Dee use the event for their personal competition.', '2007-09-13', '00:23:01', 0, 'Amazon Prime Video', 24),
(4023, 'Dennis and Dee\'s Mom Is Dead', 'Frank gleefully celebrates the sudden death of his ex-wife; both Dee and Frank become enraged at Barbara\'s will reading.', '2007-09-20', '00:20:55', 0, 'Amazon Prime Video', 24),
(4024, 'Dennis and Dee\'s Mom Is Dead; The Gang Gets Held Hostage Part 2', 'The McPoyle brothers and their sister, Margaret, take the gang hostage at their own bar. Elsewhere, Frank tries to find his will after Charlie hid it.', '2007-09-20', '00:22:18', 0, 'Amazon Prime Video', 24),
(5001, 'I\'m Luffy! The Man Who Will Become the Pirate King!', 'Monkey D. Luffy sets off to become the new Pirate King.', '1999-10-20', '00:22:18', 1, 'Netflix', 5),
(5002, 'Enter the Great Swordsman! Pirate Hunter Roronoa Zoro!', 'Luffy tries to rescue the pirate hunter Roronoa Zolo in the hopes that Zolo will join his crew, but he first must face the evil Captain Morgan and the captain\'s pampered son.', '1999-11-17', '00:21:01', 0, 'Netflix', 5),
(5003, 'Morgan Versus Luffy! Who\'s the Mysterious Pretty Girl?', 'Luffy must face his biggest opponent yet.', '1999-11-24', '00:24:10', 0, 'Netflix', 5),
(5004, 'The Passing of the Hat', 'Captain Red-Haired Shanks teaches Luffy a valuable lesson in friendship.', '1999-12-08', '00:21:38', 0, 'Netflix', 5),
(5011, 'The First Line of Defense? The Giant Whale Laboon Appears!', 'The Straw Hats are in a whale\'s belly.', '2001-03-21', '00:21:44', 0, 'Netflix', 15),
(5012, 'A Promise Between Men! Luffy and the Whale Vow to Meet Again!', 'More action to come in Luffy’s adventure!', '2001-03-21', '00:23:55', 0, 'Netflix', 15),
(5013, 'A Town That Welcomes Pirates? Setting Foot on Whisky Peak!', 'A violent snow storm batters the crew of the Going Merry; the Straw Hats arrive at Whisky Peak.', '2001-04-15', '00:21:21', 0, 'Netflix', 15),
(5014, 'Baroque Works', 'The Straw Hats are dead drunk, with bounty hunters on the prowl.', '2001-04-15', '00:22:38', 0, 'Netflix', 15),
(5021, 'Nami\'s Sick? Beyond the Snow Falling on the Sea!', 'After Giant Island, the crew looks for more adventure!', '2001-08-26', '00:21:38', 0, 'Netflix', 25),
(5022, 'A Raid! The Bliking and Blik Wapol!', 'With another task in sight, Luffy must find his way to his friends.', '2001-09-02', '00:22:18', 0, 'Netflix', 25),
(5023, 'An Island With No Doctors? Adventure in the Nameless Country!', 'The crew must find a medic, will they get there in time?', '2001-09-09', '00:21:16', 0, 'Netflix', 25),
(5024, 'Are You Happy? The Doctor Called Witch!', 'Giant snow rabbits slow Luffy and Sanji\'s progress up the mountain; the former King Wapol returns to the town he abandoned.', '2001-09-16', '00:22:44', 0, 'Netflix', 25),
(6001, 'Pilot', 'Newly single Jess arrives at her new flat with an unusual line in housewarming gifts, including a Dirty Dancing DVD and a neat line in personal theme tunes.', '2011-09-20', '00:24:00', 1, 'Amazon Prime Video', 6),
(6002, 'Kryptonite', 'Nick and Schmidt help Jess get her things out of her ex\'s apartment. Later, Jess meets new roomie Winston, who\'s back from playing basketball abroad.', '2011-09-27', '00:21:00', 0, 'Amazon Prime Video', 6),
(6003, 'Wedding', 'Fearful that he\'ll run into his ex-girlfriend at a wedding, Nick asks Jess to be his date. Meanwhile, Winston takes his role as an usher seriously.', '2011-10-04', '00:22:00', 0, 'Amazon Prime Video', 6),
(6004, 'Naked', 'When Jess walks in on Nick naked, his confidence is sent to an all-time low, just after a pretty co-worker agrees to go out with him.', '2011-11-01', '00:22:00', 0, 'Amazon Prime Video', 6),
(6011, 'Re-launch', 'Jess is laid off from her teaching job and volunteers to be a shot girl at Schmidt\'s rebranding party.', '2012-09-25', '00:22:00', 0, 'Amazon Prime Video', 16),
(6012, 'Katie', 'Out of work, Jess continues zany pursuits such as felt art and cooking unusual dishes. At the bar, a guy mistakes Jess for the blind date he is to meet.', '2012-09-25', '00:20:00', 0, 'Amazon Prime Video', 16),
(6013, 'Fluffer', 'Jess continues to have great sex with Sam but does not date. Jess feels uncomfortable with a sex only relationship. Nick unwittingly becomes her surrogate boyfriend. Schmidt pretends to be one of Mitt Romney\'s sons to impress women.', '2012-10-02', '00:20:00', 0, 'Amazon Prime Video', 16),
(6014, 'Neighbors', 'Schmidt struggles to fit in when Jess befriends a group of 20 year olds who move in across the hall. Nick plays pranks on Schmidt to make him think he is old.', '2012-11-09', '00:20:00', 0, 'Amazon Prime Video', 16),
(6021, 'All In', 'Nick and Jess run off to Mexico to give their relationship a chance to grow without the everyday problems of Schmidt and Winston. Meanwhile, Winston finds out he is color blind, and Schmidt makes a commitment to both Cece and Elizabeth.', '2013-09-17', '00:21:00', 0, 'Amazon Prime Video', 26),
(6022, 'Nerd', 'Jess turns to Nick for advice on how to fit in with a clique of mean girl teachers at her new school. Meanwhile, an office party is anything but fun for Schmidt, and Winston plots revenge on Daisy, whom he suspects is cheating on him.', '2013-09-24', '00:21:00', 0, 'Amazon Prime Video', 26),
(6023, 'Double Date', 'Thinking Schmidt has chosen to be with Cece, Jess and Nick invite him to go on a double date with them. Nick is caught between loyalty to his friend and loyalty to his girlfriend when he finds out a shocking secret. Meanwhile, Winston promises to get the foursome a table at an ultra-exclusive restaurant that doesn\'t take reservations.', '2013-10-01', '00:21:00', 0, 'Amazon Prime Video', 26),
(6024, 'The Captain', 'After being dumped by Cece and Elizabeth, an unhappy Schmidt tries to break up Jess and Nick. Winston tries to hook his cat up with another before he has to be neutered.', '2013-10-08', '00:21:00', 0, 'Amazon Prime Video', 26),
(7001, 'The Boy in the Iceberg', 'The legend of the Avatar is told. Katara and Sokka find a strange boy within an iceberg.', '2005-02-21', '00:23:00', 1, 'Disney Plus', 7),
(7002, 'The Avatar Returns', 'Aang and Katara inadvertently set off a trap the brings the warmongering Fire Nation to the Southern Water Tribe\'s peaceful village at the South Pole.', '2005-02-21', '00:25:00', 0, 'Disney Plus', 7),
(7003, 'The Southern Air Temple', 'After his departure from the Southern Air Temple 100 years ago, an excited Aang finally returns home but is disillusioned by what he finds there.', '2005-02-21', '00:25:00', 0, 'Disney Plus', 7),
(7004, 'The Warriors of Kyoshi', 'The gang arrives at Kyoshi Island and are captured by some Kyoshi warriors. When Aang reveals that he is the avatar, news quickly spreads out and suddenly reaches to Prince Zuko who then goes to Kyoshi Island to capture him.', '2005-03-04', '00:23:00', 0, 'Disney Plus', 7),
(7011, 'The Avatar State', 'Aang and friends arrive in the Earth Kingdom to begin his earthbending training, but a local general convinces Aang that all he needs to do is learn to control his Avatar state. Azula, Zuko\'s sister, arrives to escort her brother and uncle back to the Fire Nation.', '2006-03-17', '00:25:00', 0, 'Disney Plus', 17),
(7012, 'The Cave of Two Lovers', 'On their way to Omashu, Team Avatar is forced to travel underground to avoid Fire Nation attacks. Iroh and Zuko adjust to life as fugitives.', '2006-03-24', '00:25:00', 0, 'Disney Plus', 17),
(7013, 'Return of Omashu', 'Finding the city of Aang\'s old friend, King Bumi, captured by the Fire Nation, the heroes hatch a plan to rescue Aang\'s earthbending teacher. Azula gathers two old friends to help her hunt the Avatar.', '2006-04-07', '00:25:00', 0, 'Disney Plus', 17),
(7014, 'The Swamp', 'Aang hears a swamp calling to him. In the swamp, Aang and the gang find out that this is not any natural swamp.', '2006-04-14', '00:23:00', 0, 'Disney Plus', 17),
(7021, 'The Awakening', 'Weeks after the fall of the Earth Kingdom, Aang and his friends must infiltrate the Fire Nation. Katara meets her father for the first time in years. Zuko returns home, but is uneasy with his newfound reputation.', '2007-09-21', '00:25:00', 0, 'Disney Plus', 27),
(7022, 'The Headband', 'Posing as a regular kid, Aang goes to a Fire Nation school and sees what\'s missing from their lives. Zuko visits his uncle in prison.', '2007-09-28', '00:25:00', 0, 'Disney Plus', 27),
(7023, 'The Painted Lady', 'When Aang and his friends come across a fishing village being poisoned by a nearby factory, a local legend comes to life to help the townspeople.', '2007-10-05', '00:35:00', 0, 'Disney Plus', 27),
(7024, 'Sokka’s Master', 'After deciding he\'s the least valuable member of the team, Sokka seeks an apprenticeship with a sword-master. The rest of the gang tries to adjust to being without him. The imprisoned Iroh may not be as beaten as he seems.', '2007-10-12', '00:25:00', 0, 'Disney Plus', 27),
(8001, 'Pilot', 'A strangely eccentric genius scientist and inventor, moves into the home of his daughter and her family and begins to strongly influence his young grandson.', '2013-12-02', '00:22:00', 1, 'Hulu', 8),
(8002, 'Lawnmower dog', 'Rick helps Jerry out with the dog.', '2013-12-09', '00:22:00', 0, 'Hulu', 8),
(8003, 'Anatomy Park', 'It\'s Christmas. Rick shrinks Morty, injecting him into a homeless man to save Anatomy Park. Jerry tries to have a Christmas free of electronic devices, but regrets his decision when his parents introduce him to their new friend.', '2013-12-16', '00:22:00', 0, 'Hulu', 8),
(8004, 'M. Night Shaym-Aliens!', 'Rick and Morty try to get to the bottom of a mystery.', '2014-01-13', '00:22:00', 0, 'Hulu', 8),
(8011, 'A Rickle in Time', 'Having restarted time, Rick, Morty and Summer are in a quantum-uncertain state of existence. An argument leads to the creation of two alternate timelines, which need to be stitched back together fast if they are to escape quantum collapse.', '2015-07-26', '00:23:00', 0, 'Hulu', 18),
(8012, 'Mortynight run', 'Rick and Morty try to save a gas life form while Jerry resides in a daycare made for Jerrys.', '2015-08-02', '00:23:00', 0, 'Hulu', 18),
(8013, 'Auto Erotic Assimilation', 'Rick gets emotional. Beth and Jerry get into a fight.', '2015-08-09', '00:23:00', 0, 'Hulu', 18),
(8014, 'Total Rickall', 'The Smith house is locked down after parasites threaten to take over the world by multiplying through flashbacks.', '2015-08-16', '00:22:00', 0, 'Hulu', 18),
(8021, 'The Rickshank Rickdemption', 'Rick, still in galactic prison, puts an intricate escape plan into action. Back on Earth, which is now under federation control, Morty and Summer have an argument about their grandpa.', '2017-04-01', '00:22:00', 0, 'Hulu', 28),
(8022, 'Rickmancing the Stone', 'With the kids dealing with their parents\' divorce, Rick takes them to a Mad Max-style universe where he tries to steal a green crystal from a group of scavengers.', '2017-07-30', '00:21:00', 0, 'Hulu', 28),
(8023, 'Pickle Rick', 'Rick turns himself into a pickle while Beth, Summer, and Morty go to family therapy.', '2017-08-06', '00:23:00', 0, 'Hulu', 28),
(8024, 'Vindicators 3: The Return of worldender', 'Rick and Morty are summoned by the Vindicators to stop Worldender but end up in a deathtrap conceived by Drunk Rick.', '2017-08-13', '00:23:00', 0, 'Hulu', 28),
(9001, 'Pilot', 'The premiere episode introduces the boss and staff of the Dunder-Mifflin Paper Company in Scranton, Pennsylvania in a documentary about the workplace.', '2005-03-24', '00:23:00', 1, 'Crackle', 9),
(9002, 'Diversity Day', 'Michael\'s off color remark puts a sensitivity trainer in the office for a presentation, which prompts Michael to create his own.', '2005-03-29', '00:23:00', 0, 'Crackle', 9),
(9003, 'Health Care', 'Michael leaves Dwight in charge of picking the new healthcare plan for the staff, with disastrous results ahead.', '2005-04-05', '00:22:00', 0, 'Crackle', 9),
(9004, 'The Alliance', 'Just for a laugh, Jim agrees to an alliance with Dwight regarding the downsizing rumors.', '2005-04-12', '00:23:00', 0, 'Crackle', 9),
(9011, 'The Dundies', 'Very much unlike his staff, an overeager Michael can\'t wait for this year\'s annual Dundies awards.', '2005-09-20', '00:21:00', 0, 'Crackle', 19),
(9012, 'Sexual Harassment', 'The office reviews its sexual harassment policy in light of explicit e-mails.', '2005-09-27', '00:22:00', 0, 'Crackle', 19),
(9013, 'Office Olympics', 'Ready to finalize his deal for a new condo, Michael is away with Dwight while Jim rallies the staff together for office games.', '2005-10-04', '00:22:00', 0, 'Crackle', 19),
(9014, 'The Fire', 'A fire in the kitchen relegates the staff to the parking lot as help is on its way.', '2005-10-11', '00:22:00', 0, 'Crackle', 19),
(9021, 'Gay Witch Hunt', 'Michael apologizes to Oscar, after he finds out he\'s gay, for calling him a homosexual slur--but his apology outs Oscar to the entire office. And Jim decides to take a promotion at the Stamford office.', '2006-09-21', '00:23:00', 0, 'Crackle', 29),
(9022, 'The Convention', 'Michael and Dwight go to a convention in Philadelphia and run into Jim, and Michael becomes jealous of Jim\'s relationship with his new boss. Meanwhile, Pam gets ready for her first date since her engagement.', '2006-09-28', '00:22:00', 0, 'Crackle', 29),
(9023, 'The Coup', 'Michael is in trouble once again as Jan busts him for declaring it\'s Movie Monday where everyone watches a movie and neglects work. Angela pushes Dwight to make a move on Michael\'s job while Pam and Jim find creative ways to waste time.', '2006-10-05', '00:22:00', 0, 'Crackle', 29),
(9024, 'Grief Counseling', 'Michael takes on the role of office grief counselor when he learns that his old boss has died.', '2006-10-12', '00:22:00', 0, 'Crackle', 29),
(10001, 'Descenso', 'Chilean drug chemist Cockroach brings his product to Colombian smuggler Pablo Escobar. DEA agent Steve Murphy joins the war on drugs in Bogota.', '2015-10-28', '00:57:00', 1, 'Crackle', 10),
(10002, 'The Sword of Simón Bolivar', 'Communist radical group M-19 makes a move against the narcos, while Murphy gets an education in Colombian law enforcement from his new partner Peña.', '2015-10-28', '00:46:00', 0, 'Crackle', 10),
(10003, 'The Men of Always', 'Murphy encounters the depths of government corruption when he and Peña try to derail Escobar\'s political ambitions by proving he\'s a narco.', '2015-10-28', '00:46:00', 0, 'Crackle', 10),
(10004, 'The Palace of Flames', 'Despite a new extradition treaty, the U.S. puts more money into fighting communism, creating new challenges for Murphy and Peña in the hunt for Pablo.', '2015-10-28', '00:44:00', 0, 'Crackle', 10),
(10011, 'Free at Last', 'In the aftermath of a massive military effort to take Pablo into custody, the family reunites while enemies worry. Steve and Connie fight about safety.', '2016-09-02', '00:53:00', 0, 'Crackle', 20),
(10012, 'Cambalache', 'Tata gets impatient with life on the run. Pablo responds to President Gaviria\'s reward offer. Steve and Javier meet their new boss.', '2016-09-02', '00:46:00', 0, 'Crackle', 20),
(10013, 'Our Man in Madrid', 'President Gaviria has a new job for an old colleague. The Search Bloc\'s new tactics shake up Pablo, but also unsettle Steve and Javier.', '2016-09-02', '00:53:00', 0, 'Crackle', 20),
(10014, 'The Good, the Bad, and the Dead', 'The Cali cartel discusses moving in on Pablo\'s territory. Limón proposes a plan to Maritza. Tata gets a gun for protection.', '2016-09-02', '00:56:00', 0, 'Crackle', 20),
(10021, 'The Kingpin Strategy', 'The Gentlemen of Cali gather their associates together for a big surprise announcement about the future of their business.', '2017-09-01', '00:54:00', 0, 'Crackle', 30),
(10022, 'The Cali KGB', 'A gas incident threatens to destroy the agreement between Cali and the government and requires Jorge\'s help. Peña has problems with his old contact in Los Pepes.', '2017-09-01', '00:49:00', 0, 'Crackle', 30),
(10023, 'Follow the Money', 'The Rodríguez brothers are hiding during the negotiations. Pacho meets the Lord of the Heavens in Mexico. Peña\'s new DEA team visits Cali.', '2017-09-01', '00:59:00', 0, 'Crackle', 30),
(10024, 'Checkmate', 'Peña hatches a plan to try to capture Cali leader Gilberto Rodriguez. Amado proposes a business idea to Pacho.', '2017-09-01', '00:52:00', 0, 'Crackle', 30);

-- --------------------------------------------------------

--
-- Table structure for table `videolist`
--

CREATE TABLE `videolist` (
  `UserEmail` varchar(70) NOT NULL,
  `VideoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `watched`
--

CREATE TABLE `watched` (
  `UserEmail` varchar(70) NOT NULL,
  `VideoID` int(11) NOT NULL,
  `isLiked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `watched`
--
ALTER TABLE `watched`
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

--
-- Constraints for table `watched`
--
ALTER TABLE `watched`
  ADD CONSTRAINT `watched_ibfk_1` FOREIGN KEY (`UserEmail`) REFERENCES `user` (`Email`),
  ADD CONSTRAINT `watched_ibfk_2` FOREIGN KEY (`VideoID`) REFERENCES `video` (`VideoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
