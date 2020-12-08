-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2020 at 07:35 PM
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
-- Using MySQL/MariaDB as DBMS
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `Name` varchar(50) NOT NULL,
  `Description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `watched`
--

CREATE TABLE `watched` (
  `UserEmail` varchar(70) NOT NULL,
  `VideoID` int(11) NOT NULL,
  `isLiked` tinyint(1) NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `SeasonID` int(11) NOT NULL,
  `ShowID` int(11) NOT NULL,
  `SeasonNumber` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seasonshow`
--

CREATE TABLE `seasonshow` (
  `SeasonNumber` tinyint(3) NOT NULL,
  `ShowID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `VideoID` int(11) NOT NULL,
  `Tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `videolist`
--

CREATE TABLE `videolist` (
  `UserEmail` varchar(70) NOT NULL,
  `VideoID` int(11) NOT NULL
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
