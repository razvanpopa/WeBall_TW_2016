-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 05, 2016 at 03:01 AM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `campionate`
--

-- --------------------------------------------------------

--
-- Table structure for table `campionate`
--

CREATE TABLE IF NOT EXISTS `campionate` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(200) NOT NULL,
  `activ` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nume` (`nume`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `campionate`
--

INSERT INTO `campionate` (`id`, `nume`, `activ`) VALUES
(3, 'Campionat 1', 1),
(7, 'Campionat 3', 1),
(6, 'Campionat 2', 1),
(8, 'Campionat 4', 1),
(9, 'Campionat 5', 1),
(10, 'Campionat 6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `echipe`
--

CREATE TABLE IF NOT EXISTS `echipe` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nume` (`nume`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `echipe`
--

INSERT INTO `echipe` (`id`, `nume`) VALUES
(3, 'Albania'),
(4, 'Austria'),
(5, 'Belgia'),
(6, 'Croatia'),
(7, 'Cehia'),
(8, 'Anglia'),
(9, 'Germania'),
(10, 'Franta'),
(11, 'Ungaria'),
(12, 'Islanda'),
(13, 'Italia'),
(14, 'Irlanda'),
(15, 'Polonia'),
(16, 'Portugalia'),
(17, 'Romania'),
(18, 'Rusia'),
(19, 'Slovacia'),
(20, 'Spania'),
(21, 'Suedia'),
(22, 'Elvetia'),
(23, 'Turcia'),
(24, 'Ucraina');

-- --------------------------------------------------------

--
-- Table structure for table `jocuri`
--

CREATE TABLE IF NOT EXISTS `jocuri` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `echipa1` int(5) unsigned NOT NULL,
  `echipa2` int(5) unsigned NOT NULL,
  `finalizat` int(1) NOT NULL,
  `data` datetime NOT NULL,
  `puncte1` int(5) unsigned NOT NULL,
  `puncte2` int(5) unsigned NOT NULL,
  `tur` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `echipa1` (`echipa1`,`echipa2`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `jocuri`
--

INSERT INTO `jocuri` (`id`, `echipa1`, `echipa2`, `finalizat`, `data`, `puncte1`, `puncte2`, `tur`) VALUES
(1, 3, 4, 2, '2016-06-08 00:00:00', 1, 0, 0),
(2, 5, 6, 2, '2016-06-15 00:00:00', 0, 2, 0),
(3, 7, 8, 2, '2016-06-20 00:00:00', 1, 0, 0),
(4, 9, 10, 2, '2016-06-15 00:00:00', 2, 3, 0),
(5, 3, 6, 2, '2016-06-09 00:00:00', 1, 0, 1),
(6, 7, 10, 2, '2016-06-03 00:00:00', 0, 3, 1),
(7, 3, 10, 2, '2016-06-01 00:00:00', 2, 0, 2),
(8, 3, 4, 2, '2016-06-04 00:00:00', 1, 0, 0),
(9, 5, 6, 2, '2016-06-05 00:00:00', 0, 2, 0),
(10, 7, 8, 2, '2016-06-06 00:00:00', 3, 0, 0),
(11, 9, 10, 2, '2016-06-07 00:00:00', 0, 5, 0),
(12, 3, 6, 2, '2016-06-06 00:00:00', 1, 0, 1),
(13, 7, 10, 2, '2016-06-07 00:00:00', 0, 2, 1),
(14, 3, 10, 2, '2016-06-08 00:00:00', 1, 0, 2),
(15, 3, 4, 0, '2016-06-09 00:00:00', 0, 0, 0),
(16, 5, 6, 0, '2016-06-16 00:00:00', 0, 0, 0),
(17, 7, 8, 0, '2016-06-12 00:00:00', 0, 0, 0),
(18, 9, 10, 0, '2016-06-08 00:00:00', 0, 0, 0),
(19, 11, 12, 0, '2016-06-02 00:00:00', 0, 0, 0),
(20, 13, 14, 0, '2016-06-01 00:00:00', 0, 0, 0),
(21, 15, 16, 0, '2016-06-03 00:00:00', 0, 0, 0),
(22, 17, 18, 0, '2016-06-04 00:00:00', 0, 0, 0),
(23, 3, 4, 2, '2016-06-15 00:00:00', 1, 0, 0),
(24, 5, 6, 2, '2016-06-01 00:00:00', 0, 2, 0),
(25, 7, 8, 2, '2016-06-02 00:00:00', 3, 0, 0),
(27, 9, 11, 2, '2016-06-04 00:00:00', 0, 1, 0),
(28, 3, 6, 2, '2016-06-16 00:00:00', 1, 0, 1),
(29, 7, 11, 2, '2016-06-23 00:00:00', 0, 2, 1),
(30, 3, 11, 2, '2016-06-21 00:00:00', 1, 0, 2),
(31, 3, 4, 0, '2016-06-15 00:00:00', 0, 0, 0),
(32, 5, 6, 0, '2016-06-10 00:00:00', 0, 0, 0),
(33, 7, 8, 0, '2016-06-18 00:00:00', 0, 0, 0),
(34, 9, 10, 0, '2016-06-25 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jocuri_campionat`
--

CREATE TABLE IF NOT EXISTS `jocuri_campionat` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `campionat_id` int(5) unsigned NOT NULL,
  `joc_id` int(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campionat_id` (`campionat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `jocuri_campionat`
--

INSERT INTO `jocuri_campionat` (`id`, `campionat_id`, `joc_id`) VALUES
(1, 6, 1),
(2, 6, 2),
(3, 6, 3),
(4, 6, 4),
(5, 6, 5),
(6, 6, 6),
(7, 6, 7),
(8, 7, 8),
(9, 7, 9),
(10, 7, 10),
(11, 7, 11),
(12, 7, 12),
(13, 7, 13),
(14, 7, 14),
(15, 8, 15),
(16, 8, 16),
(17, 8, 17),
(18, 8, 18),
(19, 8, 19),
(20, 8, 20),
(21, 8, 21),
(22, 8, 22),
(23, 9, 23),
(24, 9, 24),
(25, 9, 25),
(27, 9, 27),
(28, 9, 28),
(29, 9, 29),
(30, 9, 30),
(31, 10, 31),
(32, 10, 32),
(33, 10, 33),
(34, 10, 34);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `user` varchar(100) NOT NULL,
  `security` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `email`, `pass`, `user`, `security`, `active`, `admin`) VALUES
(17, 'wazzup8@yahoo.com', 'Element94', 'stefan', '7mAZL3Whcr6rlRXVgEYOsP5TAZUtblwiI6hs9cKmEQOZGLTXoQ', 1, 1),
(18, 'stefanmaco@yahoo.com', 'Element94', 'stefanmaco', '508k9JRdEm1jbjgGlz5RV91qnvYMiVRj2bsM1FqoGJzZfkZO', 1, 0);
