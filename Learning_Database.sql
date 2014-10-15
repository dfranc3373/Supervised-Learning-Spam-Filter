-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Oct 16, 2014 at 01:37 AM
-- Server version: 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Learning_Database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Emails`
--

CREATE TABLE `Emails` (
`Email_ID` int(11) NOT NULL,
  `ThresholdID` int(11) DEFAULT NULL,
  `Body` text,
  `Subject` text NOT NULL,
  `EmailTo` text NOT NULL,
  `EmailFrom` text NOT NULL,
  `SpamFlag` int(1) NOT NULL DEFAULT '0',
  `PercentageSpamFound` int(11) NOT NULL,
  `DateFound` timestamp NULL DEFAULT NULL,
  `DateReceived` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `Emails`
--

INSERT INTO `Emails` (`Email_ID`, `ThresholdID`, `Body`, `Subject`, `EmailTo`, `EmailFrom`, `SpamFlag`, `PercentageSpamFound`, `DateFound`, `DateReceived`) VALUES
(1, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:44:43', '2014-10-16 05:44:43'),
(2, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:45:29', '2014-10-16 05:45:29'),
(3, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:46:38', '2014-10-16 05:46:38'),
(4, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:46:39', '2014-10-16 05:46:39'),
(5, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:46:43', '2014-10-16 05:46:43'),
(6, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:47:05', '2014-10-16 05:47:05'),
(7, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:47:39', '2014-10-16 05:47:39'),
(8, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:47:40', '2014-10-16 05:47:40'),
(9, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:48:00', '2014-10-16 05:48:00'),
(10, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:48:25', '2014-10-16 05:48:25'),
(11, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:48:26', '2014-10-16 05:48:26'),
(12, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:48:57', '2014-10-16 05:48:57'),
(13, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:49:08', '2014-10-16 05:49:08'),
(14, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:49:47', '2014-10-16 05:49:47'),
(15, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:50:11', '2014-10-16 05:50:11'),
(16, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:50:26', '2014-10-16 05:50:26'),
(17, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:50:56', '2014-10-16 05:50:56'),
(18, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:51:21', '2014-10-16 05:51:21'),
(19, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:51:30', '2014-10-16 05:51:30'),
(20, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:52:18', '2014-10-16 05:52:18'),
(21, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:52:26', '2014-10-16 05:52:26'),
(22, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:53:10', '2014-10-16 05:53:10'),
(23, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:54:19', '2014-10-16 05:54:19'),
(24, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:57:14', '2014-10-16 05:57:14'),
(25, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:57:53', '2014-10-16 05:57:53'),
(26, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:58:28', '2014-10-16 05:58:28'),
(27, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 05:59:53', '2014-10-16 05:59:53'),
(28, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:01:18', '2014-10-16 06:01:18'),
(29, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:01:53', '2014-10-16 06:01:53'),
(30, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:02:30', '2014-10-16 06:02:30'),
(31, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:02:52', '2014-10-16 06:02:52'),
(32, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:03:43', '2014-10-16 06:03:43'),
(33, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:05:06', '2014-10-16 06:05:06'),
(34, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:06:19', '2014-10-16 06:06:19'),
(35, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:06:37', '2014-10-16 06:06:37'),
(36, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:06:56', '2014-10-16 06:06:56'),
(37, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:07:13', '2014-10-16 06:07:13'),
(38, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:07:22', '2014-10-16 06:07:22'),
(39, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:08:00', '2014-10-16 06:08:00'),
(40, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:08:38', '2014-10-16 06:08:38'),
(41, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:09:53', '2014-10-16 06:09:53'),
(42, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:10:01', '2014-10-16 06:10:01'),
(43, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:12:15', '2014-10-16 06:12:15'),
(44, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:12:19', '2014-10-16 06:12:19'),
(45, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:13:25', '2014-10-16 06:13:25'),
(46, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:14:26', '2014-10-16 06:14:26'),
(47, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:16:17', '2014-10-16 06:16:17'),
(48, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:17:38', '2014-10-16 06:17:38'),
(49, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:20:07', '2014-10-16 06:20:07'),
(50, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:20:50', '2014-10-16 06:20:50'),
(51, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:21:06', '2014-10-16 06:21:06'),
(52, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:22:40', '2014-10-16 06:22:40'),
(53, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:22:53', '2014-10-16 06:22:53'),
(54, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:23:54', '2014-10-16 06:23:54'),
(55, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:23:55', '2014-10-16 06:23:55'),
(56, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:24:08', '2014-10-16 06:24:08'),
(57, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:25:06', '2014-10-16 06:25:06'),
(58, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:26:56', '2014-10-16 06:26:56'),
(59, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:27:12', '2014-10-16 06:27:12'),
(60, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:29:16', '2014-10-16 06:29:16'),
(61, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:29:27', '2014-10-16 06:29:27'),
(62, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:30:30', '2014-10-16 06:30:30'),
(63, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:31:16', '2014-10-16 06:31:16'),
(64, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:31:59', '2014-10-16 06:31:59'),
(65, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:32:35', '2014-10-16 06:32:35'),
(66, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:33:06', '2014-10-16 06:33:06'),
(67, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:34:30', '2014-10-16 06:34:30'),
(68, 1, 'This is a string, with keywords porn ass and bitch with a link www.google.com', 'This is a string, with keywords ass and bitch', '', '', 0, 0, '2014-10-16 06:36:12', '2014-10-16 06:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `KeywordCount`
--

CREATE TABLE `KeywordCount` (
`KeywordCount_ID` int(11) NOT NULL,
  `Keyword_ID` int(11) NOT NULL,
  `Email_ID` int(11) NOT NULL,
  `Runtime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `KeywordCount`
--

INSERT INTO `KeywordCount` (`KeywordCount_ID`, `Keyword_ID`, `Email_ID`, `Runtime`) VALUES
(1, 14, 1, NULL),
(2, 22, 1, NULL),
(3, 14, 1, '2014-10-16 06:36:12'),
(4, 22, 1, '2014-10-16 06:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `Keywords`
--

CREATE TABLE `Keywords` (
`Keyword_ID` int(11) NOT NULL,
  `Keyword` text NOT NULL,
  `BasePercentage` int(11) NOT NULL,
  `ActualPercentage` int(11) NOT NULL,
  `LastRunTime` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=208 ;

--
-- Dumping data for table `Keywords`
--

INSERT INTO `Keywords` (`Keyword_ID`, `Keyword`, `BasePercentage`, `ActualPercentage`, `LastRunTime`) VALUES
(2, 'abilify\n', 50, 50, '1413407748'),
(3, 'accutane\n', 50, 50, '1413407748'),
(4, 'aceteminophen\n', 50, 50, '1413407748'),
(5, 'acomplia\n', 50, 50, '1413407748'),
(6, 'adderall\n', 50, 50, '1413407748'),
(7, 'adipex\n', 50, 50, '1413407748'),
(8, 'advair\n', 50, 50, '1413407748'),
(9, 'advicer\n', 50, 50, '1413407748'),
(10, 'allegra\n', 50, 50, '1413407748'),
(11, 'ambien\n', 50, 50, '1413407748'),
(12, 'amoxil\n', 50, 50, '1413407748'),
(13, 'anime\n', 50, 50, '1413407748'),
(14, 'ass\n', 50, 50, '1413407749'),
(15, 'ativan\n', 50, 50, '1413407749'),
(16, 'augmentation\n', 50, 50, '1413407749'),
(17, 'avodart\n', 50, 50, '1413407749'),
(18, 'baccarrat\n', 50, 50, '1413407749'),
(19, 'balenciaga\n', 50, 50, '1413407749'),
(20, 'bargain\n', 50, 50, '1413407749'),
(21, 'bdsm\n', 50, 50, '1413407749'),
(22, 'bitch\n', 50, 50, '1413407749'),
(23, 'blackjack\n', 50, 50, '1413407749'),
(24, 'bllogspot\n', 50, 50, '1413407749'),
(25, 'booker\n', 50, 50, '1413407749'),
(26, 'botkier\n', 50, 50, '1413407749'),
(27, 'breast\n', 50, 50, '1413407749'),
(28, 'burberry\n', 50, 50, '1413407749'),
(29, 'buycialis\n', 50, 50, '1413407749'),
(30, 'byob\n', 50, 50, '1413407749'),
(31, 'caduet\n', 50, 50, '1413407749'),
(32, 'carisoprodol\n', 50, 50, '1413407749'),
(33, 'carisprodol\n', 50, 50, '1413407749'),
(34, 'casino\n', 50, 50, '1413407749'),
(35, 'celebrex\n', 50, 50, '1413407749'),
(36, 'celexa\n', 50, 50, '1413407750'),
(37, 'cephalaxin\n', 50, 50, '1413407750'),
(38, 'chanel\n', 50, 50, '1413407750'),
(39, 'chantix\n', 50, 50, '1413407750'),
(40, 'chloe\n', 50, 50, '1413407750'),
(41, 'cialis\n', 50, 50, '1413407750'),
(42, 'cialisonline\n', 50, 50, '1413407750'),
(43, 'citalopram\n', 50, 50, '1413407750'),
(44, 'claims\n', 50, 50, '1413407750'),
(45, 'claritin\n', 50, 50, '1413407750'),
(46, 'clomid\n', 50, 50, '1413407750'),
(47, 'clotrimazole\n', 50, 50, '1413407750'),
(48, 'coach\n', 50, 50, '1413407750'),
(49, 'cock\n', 50, 50, '1413407750'),
(50, 'codeine\n', 50, 50, '1413407750'),
(51, 'coolhu\n', 50, 50, '1413407750'),
(52, 'coumadin\n', 50, 50, '1413407750'),
(53, 'crestor\n', 50, 50, '1413407750'),
(54, 'cumshot\n', 50, 50, '1413407750'),
(55, 'cyclen\n', 50, 50, '1413407750'),
(56, 'cyclobenzaprine\n', 50, 50, '1413407750'),
(57, 'cymbalta\n', 50, 50, '1413407750'),
(58, 'dating\n', 50, 50, '1413407750'),
(59, 'debt\n', 50, 50, '1413407751'),
(60, 'dick\n', 50, 50, '1413407751'),
(61, 'diovan\n', 50, 50, '1413407751'),
(62, 'discreetordering\n', 50, 50, '1413407751'),
(63, 'doxycycline\n', 50, 50, '1413407751'),
(64, 'drugs\n', 50, 50, '1413407751'),
(65, 'dutyfree\n', 50, 50, '1413407751'),
(66, 'effexor\n', 50, 50, '1413407751'),
(67, 'enhancement\n', 50, 50, '1413407751'),
(68, 'ephedra\n', 50, 50, '1413407751'),
(69, 'ephedrine\n', 50, 50, '1413407751'),
(70, 'fendi\n', 50, 50, '1413407751'),
(71, 'finance\n', 50, 50, '1413407751'),
(72, 'fioricet\n', 50, 50, '1413407751'),
(73, 'flomax\n', 50, 50, '1413407751'),
(74, 'flowers\n', 50, 50, '1413407751'),
(75, 'fosamax\n', 50, 50, '1413407751'),
(76, 'freenet\n', 50, 50, '1413407751'),
(77, 'fuck\n', 50, 50, '1413407752'),
(78, 'gabapentin\n', 50, 50, '1413407752'),
(79, 'gambling\n', 50, 50, '1413407752'),
(80, 'gay\n', 50, 50, '1413407752'),
(81, 'gdf\n', 50, 50, '1413407752'),
(82, 'gds\n', 50, 50, '1413407752'),
(83, 'generic\n', 50, 50, '1413407752'),
(84, 'goldenbleu\n', 50, 50, '1413407752'),
(85, 'gucci\n', 50, 50, '1413407752'),
(86, 'guess\n', 50, 50, '1413407752'),
(87, 'gustto\n', 50, 50, '1413407752'),
(88, 'hermes\n', 50, 50, '1413407752'),
(89, 'holdem\n', 50, 50, '1413407752'),
(90, 'hoodia\n', 50, 50, '1413407752'),
(91, 'hotel\n', 50, 50, '1413407752'),
(92, 'hqtube\n', 50, 50, '1413407752'),
(93, 'hydrocodone\n', 50, 50, '1413407752'),
(94, 'incest\n', 50, 50, '1413407752'),
(95, 'insurance\n', 50, 50, '1413407752'),
(96, 'keppra\n', 50, 50, '1413407752'),
(97, 'klonopin\n', 50, 50, '1413407752'),
(98, 'kooba\n', 50, 50, '1413407752'),
(99, 'lamictal\n', 50, 50, '1413407752'),
(100, 'lasix\n', 50, 50, '1413407753'),
(101, 'lesbian\n', 50, 50, '1413407753'),
(102, 'levaquin\n', 50, 50, '1413407753'),
(103, 'levitra\n', 50, 50, '1413407753'),
(104, 'lexapro\n', 50, 50, '1413407753'),
(105, 'lipitor\n', 50, 50, '1413407753'),
(106, 'lisinopril\n', 50, 50, '1413407753'),
(107, 'loan\n', 50, 50, '1413407753'),
(108, 'lorazepam\n', 50, 50, '1413407753'),
(109, 'lortab\n', 50, 50, '1413407753'),
(110, 'lotrel\n', 50, 50, '1413407753'),
(111, 'lunesta\n', 50, 50, '1413407753'),
(112, 'lunestra\n', 50, 50, '1413407753'),
(113, 'lyrica\n', 50, 50, '1413407753'),
(114, 'macinstruct\n', 50, 50, '1413407753'),
(115, 'male\n', 50, 50, '1413407753'),
(116, 'meds\n', 50, 50, '1413407753'),
(117, 'meridia\n', 50, 50, '1413407753'),
(118, 'metformin\n', 50, 50, '1413407753'),
(119, 'methotrexate\n', 50, 50, '1413407753'),
(120, 'mortgage\n', 50, 50, '1413407753'),
(121, 'naked\n', 50, 50, '1413407753'),
(122, 'naproxen\n', 50, 50, '1413407753'),
(123, 'nasonex\n', 50, 50, '1413407754'),
(124, 'neurontin\n', 50, 50, '1413407754'),
(125, 'nexium\n', 50, 50, '1413407754'),
(126, 'norco\n', 50, 50, '1413407754'),
(127, 'norvasc\n', 50, 50, '1413407754'),
(128, 'nude\n', 50, 50, '1413407754'),
(129, 'omeprazole\n', 50, 50, '1413407754'),
(130, 'ottawavalleyag\n', 50, 50, '1413407754'),
(131, 'ownsthis\n', 50, 50, '1413407754'),
(132, 'oxycodone\n', 50, 50, '1413407754'),
(133, 'oxycontin\n', 50, 50, '1413407754'),
(134, 'paxil\n', 50, 50, '1413407754'),
(135, 'payday\n', 50, 50, '1413407754'),
(136, 'penis\n', 50, 50, '1413407754'),
(137, 'percocet\n', 50, 50, '1413407754'),
(138, 'percocet\n', 50, 50, '1413407754'),
(139, 'pharmacies\n', 50, 50, '1413407754'),
(140, 'pharmacy\n', 50, 50, '1413407754'),
(141, 'phentermine\n', 50, 50, '1413407754'),
(142, 'pills\n', 50, 50, '1413407754'),
(143, 'plavix\n', 50, 50, '1413407754'),
(144, 'poker\n', 50, 50, '1413407754'),
(145, 'porn\n', 50, 50, '1413407755'),
(146, 'porno\n', 50, 50, '1413407755'),
(147, 'poze\n', 50, 50, '1413407755'),
(148, 'prada\n', 50, 50, '1413407755'),
(149, 'prednisone\n', 50, 50, '1413407755'),
(150, 'prescription\n', 50, 50, '1413407755'),
(151, 'prevacid\n', 50, 50, '1413407755'),
(152, 'prilosec\n', 50, 50, '1413407755'),
(153, 'promethazine\n', 50, 50, '1413407755'),
(154, 'propecia\n', 50, 50, '1413407755'),
(155, 'protonix\n', 50, 50, '1413407755'),
(156, 'provigil\n', 50, 50, '1413407755'),
(157, 'prozac\n', 50, 50, '1413407755'),
(158, 'pussy\n', 50, 50, '1413407755'),
(159, 'rafe\n', 50, 50, '1413407755'),
(160, 'ringtones\n', 50, 50, '1413407755'),
(161, 'ritalin\n', 50, 50, '1413407755'),
(162, 'rogaine\n', 50, 50, '1413407755'),
(163, 'roulette\n', 50, 50, '1413407755'),
(164, 'seroquel\n', 50, 50, '1413407755'),
(165, 'sertraline\n', 50, 50, '1413407755'),
(166, 'sex\n', 50, 50, '1413407755'),
(167, 'shemale\n', 50, 50, '1413407756'),
(168, 'shit\n', 50, 50, '1413407756'),
(169, 'simvastatin\n', 50, 50, '1413407756'),
(170, 'singulair\n', 50, 50, '1413407756'),
(171, 'soma\n', 50, 50, '1413407756'),
(172, 'suboxone\n', 50, 50, '1413407756'),
(173, 'tamoxifen\n', 50, 50, '1413407756'),
(174, 'tano\n', 50, 50, '1413407756'),
(175, 'techannounce\n', 50, 50, '1413407756'),
(176, 'thyroid\n', 50, 50, '1413407756'),
(177, 'tits\n', 50, 50, '1413407756'),
(178, 'titties\n', 50, 50, '1413407756'),
(179, 'topamax\n', 50, 50, '1413407756'),
(180, 'trading\n', 50, 50, '1413407756'),
(181, 'tramadol\n', 50, 50, '1413407756'),
(182, 'trazodone\n', 50, 50, '1413407756'),
(183, 'treesje\n', 50, 50, '1413407756'),
(184, 'tylenol\n', 50, 50, '1413407756'),
(185, 'ultram\n', 50, 50, '1413407756'),
(186, 'vagina\n', 50, 50, '1413407756'),
(187, 'valium\n', 50, 50, '1413407756'),
(188, 'valtrex\n', 50, 50, '1413407757'),
(189, 'viagra\n', 50, 50, '1413407757'),
(190, 'viagrabuy\n', 50, 50, '1413407757'),
(191, 'viagraonline\n', 50, 50, '1413407757'),
(192, 'vicodin\n', 50, 50, '1413407757'),
(193, 'vicoprofen\n', 50, 50, '1413407757'),
(194, 'vioxx\n', 50, 50, '1413407757'),
(195, 'vytorin\n', 50, 50, '1413407757'),
(196, 'weightloss\n', 50, 50, '1413407757'),
(197, 'wellbutrin\n', 50, 50, '1413407757'),
(198, 'xanax\n', 50, 50, '1413407757'),
(199, 'xenical\n', 50, 50, '1413407757'),
(200, 'xrumor\n', 50, 50, '1413407757'),
(201, 'zetia\n', 50, 50, '1413407757'),
(202, 'zocor\n', 50, 50, '1413407757'),
(203, 'zoloft\n', 50, 50, '1413407757'),
(204, 'zolus\n', 50, 50, '1413407757'),
(205, 'zyban\n', 50, 50, '1413407757'),
(206, 'zyprexa\n', 50, 50, '1413407757'),
(207, 'zyrtec\n', 50, 50, '1413407757');

-- --------------------------------------------------------

--
-- Table structure for table `Thresholds`
--

CREATE TABLE `Thresholds` (
`Theshold_ID` int(11) NOT NULL,
  `ThresholdLevel` int(1) NOT NULL,
  `ThesholdPercentage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `TotalNonSpamKeywordOccurrences`
--

CREATE TABLE `TotalNonSpamKeywordOccurrences` (
  `TotalNonSpamKeywordOccurrences_ID` int(11) NOT NULL,
  `Keyword_ID` int(11) NOT NULL,
  `LastTimeCounted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TotalSpamKeywordOccurrences`
--

CREATE TABLE `TotalSpamKeywordOccurrences` (
  `TotalSpamKeywordOccurrences_ID` int(11) NOT NULL,
  `Keyword_ID` int(11) NOT NULL,
  `LastTimeCounted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Emails`
--
ALTER TABLE `Emails`
 ADD PRIMARY KEY (`Email_ID`), ADD KEY `ThresholdID` (`ThresholdID`);

--
-- Indexes for table `KeywordCount`
--
ALTER TABLE `KeywordCount`
 ADD PRIMARY KEY (`KeywordCount_ID`), ADD KEY `Keyword_ID` (`Keyword_ID`,`Email_ID`);

--
-- Indexes for table `Keywords`
--
ALTER TABLE `Keywords`
 ADD PRIMARY KEY (`Keyword_ID`);

--
-- Indexes for table `Thresholds`
--
ALTER TABLE `Thresholds`
 ADD PRIMARY KEY (`Theshold_ID`);

--
-- Indexes for table `TotalNonSpamKeywordOccurrences`
--
ALTER TABLE `TotalNonSpamKeywordOccurrences`
 ADD PRIMARY KEY (`TotalNonSpamKeywordOccurrences_ID`), ADD KEY `Keyword_ID` (`Keyword_ID`);

--
-- Indexes for table `TotalSpamKeywordOccurrences`
--
ALTER TABLE `TotalSpamKeywordOccurrences`
 ADD PRIMARY KEY (`TotalSpamKeywordOccurrences_ID`), ADD KEY `Keyword_ID` (`Keyword_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Emails`
--
ALTER TABLE `Emails`
MODIFY `Email_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `KeywordCount`
--
ALTER TABLE `KeywordCount`
MODIFY `KeywordCount_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Keywords`
--
ALTER TABLE `Keywords`
MODIFY `Keyword_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `Thresholds`
--
ALTER TABLE `Thresholds`
MODIFY `Theshold_ID` int(11) NOT NULL AUTO_INCREMENT;
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
