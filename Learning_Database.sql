-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2014 at 05:17 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=209 ;

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
