-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Oct 29, 2014 at 09:34 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `KeywordCount`
--

CREATE TABLE `KeywordCount` (
`KeywordCount_ID` int(11) NOT NULL,
  `Keyword_ID` int(11) NOT NULL,
  `Email_ID` int(11) NOT NULL,
  `Runtime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=212 ;

--
-- Dumping data for table `Keywords`
--

INSERT INTO `Keywords` (`Keyword_ID`, `Keyword`, `BasePercentage`, `ActualPercentage`, `LastRunTime`) VALUES
(1, 'abilify\n', 50, 50, '1414614701'),
(2, 'accutane\n', 50, 50, '1414614701'),
(3, 'aceteminophen\n', 50, 50, '1414614701'),
(4, 'acomplia\n', 50, 50, '1414614701'),
(5, 'adderall\n', 50, 50, '1414614701'),
(6, 'adipex\n', 50, 50, '1414614701'),
(7, 'advair\n', 50, 50, '1414614701'),
(8, 'advicer\n', 50, 50, '1414614701'),
(9, 'allegra\n', 50, 50, '1414614701'),
(10, 'ambien\n', 50, 50, '1414614701'),
(11, 'amoxil\n', 50, 50, '1414614701'),
(12, 'anime\n', 50, 50, '1414614701'),
(13, 'ass\n', 50, 50, '1414614701'),
(14, 'ativan\n', 50, 50, '1414614701'),
(15, 'augmentation\n', 50, 50, '1414614701'),
(16, 'avodart\n', 50, 50, '1414614701'),
(17, 'baccarrat\n', 50, 50, '1414614701'),
(18, 'balenciaga\n', 50, 50, '1414614701'),
(19, 'bargain\n', 50, 50, '1414614701'),
(20, 'bdsm\n', 50, 50, '1414614701'),
(21, 'bitch\n', 50, 50, '1414614701'),
(22, 'blackjack\n', 50, 50, '1414614701'),
(23, 'bllogspot\n', 50, 50, '1414614701'),
(24, 'booker\n', 50, 50, '1414614701'),
(25, 'botkier\n', 50, 50, '1414614701'),
(26, 'breast\n', 50, 50, '1414614701'),
(27, 'burberry\n', 50, 50, '1414614701'),
(28, 'buycialis\n', 50, 50, '1414614701'),
(29, 'byob\n', 50, 50, '1414614701'),
(30, 'caduet\n', 50, 50, '1414614701'),
(31, 'carisoprodol\n', 50, 50, '1414614701'),
(32, 'carisprodol\n', 50, 50, '1414614701'),
(33, 'casino\n', 50, 50, '1414614701'),
(34, 'celebrex\n', 50, 50, '1414614701'),
(35, 'celexa\n', 50, 50, '1414614701'),
(36, 'cephalaxin\n', 50, 50, '1414614701'),
(37, 'chanel\n', 50, 50, '1414614701'),
(38, 'chantix\n', 50, 50, '1414614701'),
(39, 'chloe\n', 50, 50, '1414614701'),
(40, 'cialis\n', 50, 50, '1414614701'),
(41, 'cialisonline\n', 50, 50, '1414614701'),
(42, 'citalopram\n', 50, 50, '1414614701'),
(43, 'claims\n', 50, 50, '1414614701'),
(44, 'claritin\n', 50, 50, '1414614701'),
(45, 'clomid\n', 50, 50, '1414614701'),
(46, 'clotrimazole\n', 50, 50, '1414614701'),
(47, 'coach\n', 50, 50, '1414614701'),
(48, 'cock\n', 50, 50, '1414614701'),
(49, 'codeine\n', 50, 50, '1414614701'),
(50, 'coolhu\n', 50, 50, '1414614701'),
(51, 'coumadin\n', 50, 50, '1414614701'),
(52, 'crestor\n', 50, 50, '1414614701'),
(53, 'cumshot\n', 50, 50, '1414614701'),
(54, 'cyclen\n', 50, 50, '1414614701'),
(55, 'cyclobenzaprine\n', 50, 50, '1414614701'),
(56, 'cymbalta\n', 50, 50, '1414614701'),
(57, 'dating\n', 50, 50, '1414614701'),
(58, 'debt\n', 50, 50, '1414614701'),
(59, 'dick\n', 50, 50, '1414614701'),
(60, 'diovan\n', 50, 50, '1414614701'),
(61, 'discreetordering\n', 50, 50, '1414614701'),
(62, 'doxycycline\n', 50, 50, '1414614701'),
(63, 'drugs\n', 50, 50, '1414614701'),
(64, 'dutyfree\n', 50, 50, '1414614701'),
(65, 'effexor\n', 50, 50, '1414614701'),
(66, 'enhancement\n', 50, 50, '1414614701'),
(67, 'ephedra\n', 50, 50, '1414614701'),
(68, 'ephedrine\n', 50, 50, '1414614701'),
(69, 'fendi\n', 50, 50, '1414614701'),
(70, 'finance\n', 50, 50, '1414614701'),
(71, 'fioricet\n', 50, 50, '1414614701'),
(72, 'flomax\n', 50, 50, '1414614701'),
(73, 'flowers\n', 50, 50, '1414614701'),
(74, 'fosamax\n', 50, 50, '1414614701'),
(75, 'freenet\n', 50, 50, '1414614701'),
(76, 'fuck\n', 50, 50, '1414614701'),
(77, 'gabapentin\n', 50, 50, '1414614701'),
(78, 'gambling\n', 50, 50, '1414614701'),
(79, 'gay\n', 50, 50, '1414614701'),
(80, 'gdf\n', 50, 50, '1414614701'),
(81, 'gds\n', 50, 50, '1414614701'),
(82, 'generic\n', 50, 50, '1414614701'),
(83, 'goldenbleu\n', 50, 50, '1414614701'),
(84, 'gucci\n', 50, 50, '1414614701'),
(85, 'guess\n', 50, 50, '1414614701'),
(86, 'gustto\n', 50, 50, '1414614701'),
(87, 'hermes\n', 50, 50, '1414614701'),
(88, 'holdem\n', 50, 50, '1414614701'),
(89, 'hoodia\n', 50, 50, '1414614701'),
(90, 'hotel\n', 50, 50, '1414614701'),
(91, 'hqtube\n', 50, 50, '1414614701'),
(92, 'hydrocodone\n', 50, 50, '1414614701'),
(93, 'incest\n', 50, 50, '1414614701'),
(94, 'insurance\n', 50, 50, '1414614701'),
(95, 'keppra\n', 50, 50, '1414614701'),
(96, 'klonopin\n', 50, 50, '1414614701'),
(97, 'kooba\n', 50, 50, '1414614701'),
(98, 'lamictal\n', 50, 50, '1414614701'),
(99, 'lasix\n', 50, 50, '1414614701'),
(100, 'lesbian\n', 50, 50, '1414614701'),
(101, 'levaquin\n', 50, 50, '1414614701'),
(102, 'levitra\n', 50, 50, '1414614701'),
(103, 'lexapro\n', 50, 50, '1414614701'),
(104, 'lipitor\n', 50, 50, '1414614701'),
(105, 'lisinopril\n', 50, 50, '1414614701'),
(106, 'loan\n', 50, 50, '1414614701'),
(107, 'lorazepam\n', 50, 50, '1414614701'),
(108, 'lortab\n', 50, 50, '1414614701'),
(109, 'lotrel\n', 50, 50, '1414614701'),
(110, 'lunesta\n', 50, 50, '1414614701'),
(111, 'lunestra\n', 50, 50, '1414614701'),
(112, 'lyrica\n', 50, 50, '1414614701'),
(113, 'macinstruct\n', 50, 50, '1414614701'),
(114, 'male\n', 50, 50, '1414614701'),
(115, 'meds\n', 50, 50, '1414614701'),
(116, 'meridia\n', 50, 50, '1414614701'),
(117, 'metformin\n', 50, 50, '1414614701'),
(118, 'methotrexate\n', 50, 50, '1414614701'),
(119, 'mortgage\n', 50, 50, '1414614701'),
(120, 'naked\n', 50, 50, '1414614701'),
(121, 'naproxen\n', 50, 50, '1414614701'),
(122, 'nasonex\n', 50, 50, '1414614701'),
(123, 'neurontin\n', 50, 50, '1414614701'),
(124, 'nexium\n', 50, 50, '1414614701'),
(125, 'norco\n', 50, 50, '1414614701'),
(126, 'norvasc\n', 50, 50, '1414614701'),
(127, 'nude\n', 50, 50, '1414614701'),
(128, 'omeprazole\n', 50, 50, '1414614701'),
(129, 'ottawavalleyag\n', 50, 50, '1414614701'),
(130, 'ownsthis\n', 50, 50, '1414614701'),
(131, 'oxycodone\n', 50, 50, '1414614701'),
(132, 'oxycontin\n', 50, 50, '1414614701'),
(133, 'paxil\n', 50, 50, '1414614701'),
(134, 'payday\n', 50, 50, '1414614701'),
(135, 'penis\n', 50, 50, '1414614701'),
(136, 'percocet\n', 50, 50, '1414614701'),
(137, 'percocet\n', 50, 50, '1414614701'),
(138, 'pharmacies\n', 50, 50, '1414614701'),
(139, 'pharmacy\n', 50, 50, '1414614701'),
(140, 'phentermine\n', 50, 50, '1414614701'),
(141, 'pills\n', 50, 50, '1414614701'),
(142, 'plavix\n', 50, 50, '1414614701'),
(143, 'poker\n', 50, 50, '1414614701'),
(144, 'porn\n', 50, 50, '1414614701'),
(145, 'porno\n', 50, 50, '1414614701'),
(146, 'poze\n', 50, 50, '1414614701'),
(147, 'prada\n', 50, 50, '1414614701'),
(148, 'prednisone\n', 50, 50, '1414614701'),
(149, 'prescription\n', 50, 50, '1414614701'),
(150, 'prevacid\n', 50, 50, '1414614701'),
(151, 'prilosec\n', 50, 50, '1414614701'),
(152, 'promethazine\n', 50, 50, '1414614701'),
(153, 'propecia\n', 50, 50, '1414614701'),
(154, 'protonix\n', 50, 50, '1414614701'),
(155, 'provigil\n', 50, 50, '1414614701'),
(156, 'prozac\n', 50, 50, '1414614701'),
(157, 'pussy\n', 50, 50, '1414614701'),
(158, 'rafe\n', 50, 50, '1414614701'),
(159, 'ringtones\n', 50, 50, '1414614701'),
(160, 'ritalin\n', 50, 50, '1414614701'),
(161, 'rogaine\n', 50, 50, '1414614701'),
(162, 'roulette\n', 50, 50, '1414614701'),
(163, 'seroquel\n', 50, 50, '1414614701'),
(164, 'sertraline\n', 50, 50, '1414614701'),
(165, 'sex\n', 50, 50, '1414614701'),
(166, 'shemale\n', 50, 50, '1414614701'),
(167, 'shit\n', 50, 50, '1414614701'),
(168, 'simvastatin\n', 50, 50, '1414614701'),
(169, 'singulair\n', 50, 50, '1414614701'),
(170, 'soma\n', 50, 50, '1414614701'),
(171, 'suboxone\n', 50, 50, '1414614701'),
(172, 'tamoxifen\n', 50, 50, '1414614701'),
(173, 'tano\n', 50, 50, '1414614701'),
(174, 'techannounce\n', 50, 50, '1414614701'),
(175, 'thyroid\n', 50, 50, '1414614701'),
(176, 'tits\n', 50, 50, '1414614701'),
(177, 'titties\n', 50, 50, '1414614701'),
(178, 'topamax\n', 50, 50, '1414614701'),
(179, 'trading\n', 50, 50, '1414614701'),
(180, 'tramadol\n', 50, 50, '1414614701'),
(181, 'trazodone\n', 50, 50, '1414614701'),
(182, 'treesje\n', 50, 50, '1414614701'),
(183, 'tylenol\n', 50, 50, '1414614701'),
(184, 'ultram\n', 50, 50, '1414614701'),
(185, 'vagina\n', 50, 50, '1414614701'),
(186, 'valium\n', 50, 50, '1414614701'),
(187, 'valtrex\n', 50, 50, '1414614701'),
(188, 'viagra\n', 50, 50, '1414614701'),
(189, 'viagrabuy\n', 50, 50, '1414614701'),
(190, 'viagraonline\n', 50, 50, '1414614701'),
(191, 'vicodin\n', 50, 50, '1414614701'),
(192, 'vicoprofen\n', 50, 50, '1414614701'),
(193, 'vioxx\n', 50, 50, '1414614701'),
(194, 'vytorin\n', 50, 50, '1414614701'),
(195, 'weightloss\n', 50, 50, '1414614701'),
(196, 'wellbutrin\n', 50, 50, '1414614701'),
(197, 'xanax\n', 50, 50, '1414614701'),
(198, 'xenical\n', 50, 50, '1414614701'),
(199, 'xrumor\n', 50, 50, '1414614701'),
(200, 'zetia\n', 50, 50, '1414614701'),
(201, 'zocor\n', 50, 50, '1414614701'),
(202, 'zoloft\n', 50, 50, '1414614701'),
(203, 'zolus\n', 50, 50, '1414614701'),
(204, 'zyban\n', 50, 50, '1414614701'),
(205, 'zyprexa\n', 50, 50, '1414614701'),
(206, 'zyrtec\n', 50, 50, '1414614701'),
(209, 'free', 50, 50, '1414614701'),
(210, 'nigerian', 50, 50, '1414614701'),
(211, 'prince', 50, 50, '1414614701');

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
MODIFY `Email_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `KeywordCount`
--
ALTER TABLE `KeywordCount`
MODIFY `KeywordCount_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Keywords`
--
ALTER TABLE `Keywords`
MODIFY `Keyword_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=212;
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
