-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2014 at 04:20 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Learning_Database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Emails`
--

CREATE TABLE IF NOT EXISTS `Emails` (
  `Email_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ThresholdID` int(11) DEFAULT NULL,
  `Body` text,
  `Subject` text NOT NULL,
  `EmailTo` text NOT NULL,
  `EmailFrom` text NOT NULL,
  `SpamFlag` int(1) NOT NULL DEFAULT '0',
  `PercentageSpamFound` int(11) NOT NULL,
  `DateFound` timestamp NULL DEFAULT NULL,
  `DateReceived` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Email_ID`),
  KEY `ThresholdID` (`ThresholdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `KeywordCount`
--

CREATE TABLE IF NOT EXISTS `KeywordCount` (
  `KeywordCount_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Keyword_ID` int(11) NOT NULL,
  `Email_ID` int(11) NOT NULL,
  `Runtime` text,
  PRIMARY KEY (`KeywordCount_ID`),
  KEY `Keyword_ID` (`Keyword_ID`,`Email_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Keywords`
--

CREATE TABLE IF NOT EXISTS `Keywords` (
  `Keyword_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Keyword` text NOT NULL,
  `BasePercentage` int(11) NOT NULL,
  `ActualPercentage` int(11) NOT NULL,
  `LastRunTime` text,
  PRIMARY KEY (`Keyword_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Thresholds`
--

CREATE TABLE IF NOT EXISTS `Thresholds` (
  `Theshold_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ThresholdLevel` int(1) NOT NULL,
  `ThesholdPercentage` text NOT NULL,
  PRIMARY KEY (`Theshold_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `TotalNonSpamKeywordOccurrences`
--

CREATE TABLE IF NOT EXISTS `TotalNonSpamKeywordOccurrences` (
  `TotalNonSpamKeywordOccurrences_ID` int(11) NOT NULL,
  `Keyword_ID` int(11) NOT NULL,
  `LastTimeCounted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`TotalNonSpamKeywordOccurrences_ID`),
  KEY `Keyword_ID` (`Keyword_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TotalSpamKeywordOccurrences`
--

CREATE TABLE IF NOT EXISTS `TotalSpamKeywordOccurrences` (
  `TotalSpamKeywordOccurrences_ID` int(11) NOT NULL,
  `Keyword_ID` int(11) NOT NULL,
  `LastTimeCounted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`TotalSpamKeywordOccurrences_ID`),
  KEY `Keyword_ID` (`Keyword_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `TotalNonSpamKeywordOccurrences`
--
ALTER TABLE `TotalNonSpamKeywordOccurrences`
  ADD CONSTRAINT `TotalNonSpamKeywordOccurrences_ibfk_1` FOREIGN KEY (`Keyword_ID`) REFERENCES `Keywords` (`Keyword_ID`);

--
-- Constraints for table `TotalSpamKeywordOccurrences`
--
ALTER TABLE `TotalSpamKeywordOccurrences`
  ADD CONSTRAINT `TotalSpamKeywordOccurrences_ibfk_1` FOREIGN KEY (`Keyword_ID`) REFERENCES `Keywords` (`Keyword_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
