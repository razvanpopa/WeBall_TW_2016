-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2016 at 10:35 AM
-- Server version: 10.1.6-MariaDB
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weball`
--

-- --------------------------------------------------------

--
-- Table structure for table `championships`
--

CREATE TABLE IF NOT EXISTS `championships` (
  `id_championship` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `details` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `team_nr` int(11) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `championships`
--

INSERT INTO `championships` (`id_championship`, `name`, `details`, `logo`, `team_nr`, `date`) VALUES
(1, 'UEFA CHAMPIONS', 'Cei mai tari campionate ever pt ca uefa .', 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Logo_FC_Bayern_M%C3%BCnchen.svg', 5, '2016-06-05'),
(2, 'FBK SOUTH DAKOTA', 'UEFA UEFA UEFA ! FIFA', 'https://upload.wikimedia.org/wikipedia/de/3/3c/AS_Monaco.svg', 4, '2016-06-07'),
(3, 'Fifa 2016 XBOX', 'Turneul organizat de insoft si bitdefnder pt un loc in palas la kfc', 'https://hdlogo.files.wordpress.com/2013/11/real-madrid-hd-logo.png', 3, '2016-06-06'),
(4, 'BRAVO PETROSANI 2012', 'sadasdasda', 'http://zllox.com/wp-content/uploads/2016/03/Logo-Free.jpg', NULL, '2016-06-06'),
(5, 'Barnova Champions', 'Un campionat pe xbox', 'http://upload.wikimedia.org/wikipedia/de/e/e7/Logo_TSG_Hoffenheim.svg', NULL, '2016-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `championships_admin`
--

CREATE TABLE IF NOT EXISTS `championships_admin` (
  `id_championship` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `championships_admin`
--

INSERT INTO `championships_admin` (`id_championship`, `id_user`) VALUES
(2, 1),
(3, 2),
(3, 3),
(2, 3),
(1, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `championship_teams`
--

CREATE TABLE IF NOT EXISTS `championship_teams` (
  `id_championship` int(11) NOT NULL,
  `id_team` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `championship_teams`
--

INSERT INTO `championship_teams` (`id_championship`, `id_team`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id_comment` int(11) NOT NULL,
  `id_campionat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `details` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id_comment`, `id_campionat`, `id_user`, `details`) VALUES
(1, 1, 1, 'HAI kapatos!'),
(2, 1, 1, 'Oare mai are vreo sansa Rapid?'),
(3, 2, 1, 'Slab sezonul acesta, ma asteptam mai mult de la Steaua');

-- --------------------------------------------------------

--
-- Table structure for table `custom_preference`
--

CREATE TABLE IF NOT EXISTS `custom_preference` (
  `id_user` int(11) NOT NULL,
  `id_team` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `custom_preference`
--

INSERT INTO `custom_preference` (`id_user`, `id_team`) VALUES
(1, 5),
(1, 81),
(1, 86);

-- --------------------------------------------------------

--
-- Table structure for table `footbal_teams`
--

CREATE TABLE IF NOT EXISTS `footbal_teams` (
  `id` int(11) NOT NULL,
  `team_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `logo` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `footbal_teams`
--

INSERT INTO `footbal_teams` (`id`, `team_name`, `logo`) VALUES
(5, 'FC Bayern München', 'http://upload.wikimedia.org/wikipedia/commons/c/c5/Logo_FC_Bayern_München.svg'),
(7, 'Hamburger SV', 'http://upload.wikimedia.org/wikipedia/commons/6/66/HSV-Logo.svg'),
(16, 'FC Augsburg', 'http://upload.wikimedia.org/wikipedia/de/b/b5/Logo_FC_Augsburg.svg'),
(9, 'Hertha BSC', 'http://upload.wikimedia.org/wikipedia/de/8/81/Hertha_BSC_Logo_2012.svg'),
(3, 'Bayer Leverkusen', 'http://upload.wikimedia.org/wikipedia/de/9/95/Bayer_04_Leverkusen_Logo.svg'),
(2, 'TSG 1899 Hoffenheim', 'http://upload.wikimedia.org/wikipedia/de/e/e7/Logo_TSG_Hoffenheim.svg'),
(55, 'SV Darmstadt 98', 'http://upload.wikimedia.org/wikipedia/de/8/87/Svdarmstadt98.svg'),
(8, 'Hannover 96', 'http://upload.wikimedia.org/wikipedia/de/c/cd/Hannover_96_Logo.svg'),
(15, '1. FSV Mainz 05', 'http://upload.wikimedia.org/wikipedia/de/0/0b/FSV_Mainz_05_Logo.svg'),
(31, 'FC Ingolstadt 04', 'http://upload.wikimedia.org/wikipedia/de/5/55/FC-Ingolstadt_logo.svg'),
(12, 'Werder Bremen', 'http://upload.wikimedia.org/wikipedia/commons/b/be/SV-Werder-Bremen-Logo.svg'),
(6, 'FC Schalke 04', 'http://upload.wikimedia.org/wikipedia/de/6/6d/FC_Schalke_04_Logo.svg'),
(4, 'Borussia Dortmund', 'http://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg'),
(18, 'Bor. Mönchengladbach', 'https://upload.wikimedia.org/wikipedia/commons/8/81/Borussia_Mönchengladbach_logo.svg'),
(11, 'VfL Wolfsburg', 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Logo-VfL-Wolfsburg.svg'),
(19, 'Eintracht Frankfurt', 'http://upload.wikimedia.org/wikipedia/commons/0/04/Eintracht_Frankfurt_Logo.svg'),
(10, 'VfB Stuttgart', 'http://upload.wikimedia.org/wikipedia/commons/a/ab/VfB_Stuttgart_Logo.svg'),
(1, '1. FC Köln', 'http://upload.wikimedia.org/wikipedia/de/1/16/1._FC_Köln.svg'),
(25, 'MSV Duisburg', 'http://upload.wikimedia.org/wikipedia/de/3/38/Msv_duisburg(neu).svg'),
(13, '1. FC Kaiserslautern', 'http://upload.wikimedia.org/wikipedia/commons/d/d3/Logo_1_FC_Kaiserslautern.svg'),
(33, 'Eintracht Braunschweig', 'http://upload.wikimedia.org/wikipedia/de/4/45/Logo_Eintracht_Braunschweig.svg'),
(46, 'SV Sandhausen', 'https://upload.wikimedia.org/wikipedia/commons/d/d3/SV_Sandhausen.svg'),
(17, 'SC Freiburg', 'http://upload.wikimedia.org/wikipedia/de/f/f1/SC-Freiburg_Logo-neu.svg'),
(14, '1. FC Nürnberg', 'http://upload.wikimedia.org/wikipedia/commons/f/fa/1._FC_Nürnberg_logo.svg'),
(30, 'FSV Frankfurt', 'http://upload.wikimedia.org/wikipedia/de/c/ce/FSV_Frankfurt_1899.svg'),
(721, 'Red Bull Leipzig', 'http://upload.wikimedia.org/wikipedia/de/d/d4/RB_Leipzig_2010_logo.svg'),
(21, 'SpVgg Greuther Fürth', 'http://upload.wikimedia.org/wikipedia/de/6/6d/SpVgg_Greuther_Fürth_logo.svg'),
(32, 'Karlsruher SC', 'http://upload.wikimedia.org/wikipedia/de/a/a8/Karlsruher_SC_Logo.svg'),
(44, '1. FC Heidenheim 1846', 'http://upload.wikimedia.org/wikipedia/commons/9/9d/1._FC_Heidenheim_1846.svg'),
(26, 'TSV 1860 München', 'http://upload.wikimedia.org/wikipedia/commons/4/48/TSV_1860_München.svg'),
(29, 'SC Paderborn 07', 'https://upload.wikimedia.org/wikipedia/commons/e/e3/SC_Paderborn_07_Logo.svg'),
(36, 'VfL Bochum', 'https://upload.wikimedia.org/wikipedia/commons/7/72/VfL_Bochum_logo.svg'),
(20, 'FC St. Pauli', 'http://upload.wikimedia.org/wikipedia/de/2/2f/Logo_FC_St_Pauli.svg'),
(38, 'Arminia Bielefeld', 'http://upload.wikimedia.org/wikipedia/de/e/e5/Logo_Arminia_Bielefeld.svg'),
(28, '1. FC Union Berlin', 'http://upload.wikimedia.org/wikipedia/de/e/e4/1._FC_Union_Berlin.svg'),
(24, 'Fortuna Düsseldorf', 'http://upload.wikimedia.org/wikipedia/commons/9/94/Fortuna_Düsseldorf.svg'),
(521, 'OSC Lille', 'http://upload.wikimedia.org/wikipedia/de/0/08/LOSC_Lille_Crest_2012.png'),
(524, 'Paris Saint-Germain', 'http://upload.wikimedia.org/wikipedia/de/1/1e/Paris_Saint-Germain_(seit_2013).gif'),
(531, 'ES Troyes AC', 'https://upload.wikimedia.org/wikipedia/fr/b/bf/ES_Troyes_AC.svg'),
(555, 'Gazélec Ajaccio', 'http://upload.wikimedia.org/wikipedia/en/4/46/Gazélec_Ajaccio_logo.png'),
(516, 'Olympique de Marseille', 'http://upload.wikimedia.org/wikipedia/de/2/27/Olympique_Marseille_Logo.svg'),
(514, 'SM Caen', 'https://upload.wikimedia.org/wikipedia/fr/7/79/LogoSmc2013.png'),
(522, 'OGC Nice', 'https://upload.wikimedia.org/wikipedia/en/0/05/OGC_Nice_logo.png'),
(548, 'AS Monaco FC', 'http://upload.wikimedia.org/wikipedia/de/3/3c/AS_Monaco.svg'),
(543, 'FC Nantes', 'http://upload.wikimedia.org/wikipedia/de/5/50/FC_Nantes_(seit_2008).svg'),
(538, 'EA Guingamp', 'http://upload.wikimedia.org/wikipedia/de/a/ae/EA_Guingamp_Logo.svg'),
(518, 'Montpellier Hérault SC', 'http://upload.wikimedia.org/wikipedia/de/3/35/HSC_Montpellier_Logo.svg'),
(532, 'Angers SCO', 'http://upload.wikimedia.org/wikipedia/de/0/0f/SCO_Angers.svg'),
(536, 'SC Bastia', 'http://upload.wikimedia.org/wikipedia/de/6/69/SC_Bastia.svg'),
(529, 'Stade Rennais FC', 'http://upload.wikimedia.org/wikipedia/de/b/b6/Stade_Rennais_Football_Club.svg'),
(526, 'FC Girondins de Bordeaux', 'http://upload.wikimedia.org/wikipedia/de/e/ea/Girondins_Bordeaux_Logo.svg'),
(547, 'Stade de Reims', 'http://upload.wikimedia.org/wikipedia/de/9/9e/Stade_Reims_Logo.svg'),
(511, 'Toulouse FC', 'http://upload.wikimedia.org/wikipedia/de/0/0a/FC_Toulouse_Logo.svg'),
(527, 'AS Saint-Étienne', 'http://upload.wikimedia.org/wikipedia/de/b/b1/AS_Saint-Etienne_(aktuell).svg'),
(523, 'Olympique Lyonnais', 'http://upload.wikimedia.org/wikipedia/de/f/f1/Olympique_Lyon.svg'),
(525, 'FC Lorient', 'http://upload.wikimedia.org/wikipedia/de/c/c4/FC_Lorient_neu.png'),
(510, 'Ajaccio AC', 'http://upload.wikimedia.org/wikipedia/de/5/58/AC_Ajaccio.svg'),
(528, 'Dijon FCO', 'http://upload.wikimedia.org/wikipedia/de/e/e1/FCO_Dijon.svg'),
(1045, 'Paris FC', 'https://upload.wikimedia.org/wikipedia/de/b/be/Logo_ParisFC_2011.png'),
(540, 'FC Stade Lavallois Mayenne', 'http://upload.wikimedia.org/wikipedia/de/4/49/Stade_Laval.svg'),
(557, 'Chamois Niortais FC', 'http://upload.wikimedia.org/wikipedia/de/0/0a/Chamois_Niort_Logo.svg'),
(515, 'FC Valenciennes', 'http://upload.wikimedia.org/wikipedia/de/e/eb/Valenciennes_AFC_(2008).svg'),
(556, 'Nîmes Olympique', 'http://upload.wikimedia.org/wikipedia/de/b/b6/Olympique_Nimes.svg'),
(513, 'Évian Thonon Gaillard FC', 'http://upload.wikimedia.org/wikipedia/de/c/cb/Evian_Thonon_Gaillard.svg'),
(567, 'Red Star 93', 'https://upload.wikimedia.org/wikipedia/fr/b/bc/Logo_RedStarFC.png'),
(573, 'US Créteil', 'http://upload.wikimedia.org/wikipedia/de/d/d1/US_Créteil.svg'),
(541, 'Clermont Foot Auvergne', 'http://upload.wikimedia.org/wikipedia/de/a/a1/Clermont_Foot_Auvergne.svg'),
(517, 'Sochaux FC', 'http://upload.wikimedia.org/wikipedia/de/a/ae/FC_Sochaux_Logo_2010.svg'),
(1042, 'FC Bourg-en-Bresse Péronnas', 'https://upload.wikimedia.org/wikipedia/fr/6/66/Football_Bourg_en_Bresse_Péronnas_logo.png'),
(533, 'Le Havre AC', 'http://upload.wikimedia.org/wikipedia/de/4/47/Le_Havre_AC.svg'),
(519, 'AJ Auxerre', 'http://upload.wikimedia.org/wikipedia/de/5/5b/AJ_Auxerre.svg'),
(512, 'Stade Brestois', 'http://upload.wikimedia.org/wikipedia/de/c/cb/Stade_Brestois_29.svg'),
(545, 'FC Metz', 'http://upload.wikimedia.org/wikipedia/de/b/ba/FC_Metz_Logo.svg'),
(546, 'RC Lens', 'http://upload.wikimedia.org/wikipedia/de/d/d7/RC_Lens_Logo.svg'),
(520, 'AS Nancy', 'http://upload.wikimedia.org/wikipedia/de/8/8f/AS_Nancy_Logo.svg'),
(544, 'RC Tours', 'http://upload.wikimedia.org/wikipedia/de/9/9a/FC_Tours.svg'),
(66, 'Manchester United FC', 'http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg'),
(73, 'Tottenham Hotspur FC', 'http://upload.wikimedia.org/wikipedia/de/b/b4/Tottenham_Hotspur.svg'),
(1044, 'AFC Bournemouth', 'https://upload.wikimedia.org/wikipedia/de/4/41/Afc_bournemouth.svg'),
(58, 'Aston Villa FC', 'http://upload.wikimedia.org/wikipedia/de/9/9f/Aston_Villa_logo.svg'),
(62, 'Everton FC', 'http://upload.wikimedia.org/wikipedia/de/f/f9/Everton_FC.svg'),
(346, 'Watford FC', 'https://upload.wikimedia.org/wikipedia/en/e/e2/Watford.svg'),
(338, 'Leicester City FC', 'http://upload.wikimedia.org/wikipedia/en/6/63/Leicester02.png'),
(71, 'Sunderland AFC', 'http://upload.wikimedia.org/wikipedia/de/6/60/AFC_Sunderland.svg'),
(68, 'Norwich City FC', 'http://upload.wikimedia.org/wikipedia/de/8/8c/Norwich_City.svg'),
(354, 'Crystal Palace FC', 'http://upload.wikimedia.org/wikipedia/de/b/bf/Crystal_Palace_F.C._logo_(2013).png'),
(61, 'Chelsea FC', 'http://upload.wikimedia.org/wikipedia/de/5/5c/Chelsea_crest.svg'),
(72, 'Swansea City FC', 'http://upload.wikimedia.org/wikipedia/de/a/ab/Swansea_City_Logo.svg'),
(67, 'Newcastle United FC', 'http://upload.wikimedia.org/wikipedia/de/5/56/Newcastle_United_Logo.svg'),
(340, 'Southampton FC', 'http://upload.wikimedia.org/wikipedia/de/c/c9/FC_Southampton.svg'),
(57, 'Arsenal FC', 'http://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg'),
(563, 'West Ham United FC', 'http://upload.wikimedia.org/wikipedia/de/e/e0/West_Ham_United_FC.svg'),
(70, 'Stoke City FC', 'http://upload.wikimedia.org/wikipedia/de/a/a3/Stoke_City.svg'),
(64, 'Liverpool FC', 'http://upload.wikimedia.org/wikipedia/de/0/0a/FC_Liverpool.svg'),
(74, 'West Bromwich Albion FC', 'http://upload.wikimedia.org/wikipedia/de/8/8b/West_Bromwich_Albion.svg'),
(65, 'Manchester City FC', 'http://upload.wikimedia.org/wikipedia/de/f/fd/ManCity.svg'),
(560, 'RC Deportivo La Coruna', 'http://upload.wikimedia.org/wikipedia/en/4/4e/RC_Deportivo_La_Coruña_logo.svg'),
(92, 'Real Sociedad de Fútbol', 'http://upload.wikimedia.org/wikipedia/de/5/55/Real_Sociedad_San_Sebastián.svg'),
(80, 'RCD Espanyol', 'http://upload.wikimedia.org/wikipedia/de/a/a7/RCD_Espanyol_De_Barcelona.svg'),
(82, 'Getafe CF', 'http://upload.wikimedia.org/wikipedia/de/d/de/Getafe_CF.svg'),
(78, 'Club Atlético de Madrid', 'http://upload.wikimedia.org/wikipedia/de/c/c1/Atletico_Madrid_logo.svg'),
(275, 'UD Las Palmas', 'http://upload.wikimedia.org/wikipedia/en/2/20/UD_Las_Palmas_logo.svg'),
(87, 'Rayo Vallecano de Madrid', 'http://upload.wikimedia.org/wikipedia/de/1/12/Rayo_vallecano_madrid.svg'),
(95, 'Valencia CF', 'http://upload.wikimedia.org/wikipedia/de/7/75/FC_Valencia.svg'),
(84, 'Málaga CF', 'http://upload.wikimedia.org/wikipedia/de/e/e8/FC_Málaga.svg'),
(559, 'Sevilla FC', 'http://upload.wikimedia.org/wikipedia/en/8/86/Sevilla_cf_200px.png'),
(77, 'Athletic Club', 'http://upload.wikimedia.org/wikipedia/de/7/7f/Athletic_Club_Bilbao.svg'),
(81, 'FC Barcelona', 'http://upload.wikimedia.org/wikipedia/de/a/aa/Fc_barcelona.svg'),
(96, 'Sporting Gijón', 'http://upload.wikimedia.org/wikipedia/de/4/48/Real_Sporting_de_Gijon.svg'),
(86, 'Real Madrid CF', 'http://upload.wikimedia.org/wikipedia/de/3/3f/Real_Madrid_Logo.svg'),
(88, 'Levante UD', 'http://upload.wikimedia.org/wikipedia/de/1/1f/Levante_ud.svg'),
(558, 'RC Celta de Vigo', 'http://upload.wikimedia.org/wikipedia/de/0/0c/Celta_Vigo.svg'),
(90, 'Real Betis', 'http://upload.wikimedia.org/wikipedia/de/4/43/Real_Betis.svg'),
(94, 'Villarreal CF', 'http://upload.wikimedia.org/wikipedia/de/7/70/Villarreal_CF_logo.svg'),
(83, 'Granada CF', 'http://upload.wikimedia.org/wikipedia/de/d/d3/Granada_CF.svg'),
(278, 'SD Eibar', 'http://upload.wikimedia.org/wikipedia/en/7/75/SD_Eibar_logo.svg'),
(595, 'CD Mirandes', 'http://upload.wikimedia.org/wikipedia/en/b/b8/CD_Mirandés_logo.svg'),
(91, 'Real Zaragoza', 'http://upload.wikimedia.org/wikipedia/de/8/8f/Real_zaragoza.svg'),
(1048, 'Real Oviedo', 'https://upload.wikimedia.org/wikipedia/de/a/a9/Real_Oviedo.svg'),
(596, 'CD Lugo', 'http://upload.wikimedia.org/wikipedia/en/0/09/CD_Lugo_logo.svg'),
(286, 'SD Ponferradina', 'http://upload.wikimedia.org/wikipedia/en/0/0b/SD_Ponferradina_logo.svg'),
(285, 'Elche FC', 'http://upload.wikimedia.org/wikipedia/de/a/af/Elche_CF.svg'),
(260, 'CD Numancia de Soria', 'http://upload.wikimedia.org/wikipedia/en/0/07/CD_Numancia_logo.svg'),
(254, 'CD Tenerife', 'http://upload.wikimedia.org/wikipedia/de/f/f4/CD_Tenerife_Logo.svg'),
(304, 'AD Alcorcón', 'http://upload.wikimedia.org/wikipedia/en/2/28/AD_Alcorcón_logo.svg'),
(89, 'RCD Mallorca', 'http://upload.wikimedia.org/wikipedia/de/e/e0/Rcd_mallorca.svg'),
(744, 'UE Llagostera', 'http://upload.wikimedia.org/wikipedia/en/4/4a/UE_Llagostera.png'),
(79, 'CA Osasuna', 'http://upload.wikimedia.org/wikipedia/de/c/ca/Atletico_Osasuna.svg'),
(299, 'Huesca', 'https://upload.wikimedia.org/wikipedia/en/1/11/Sd_huesca.png'),
(263, 'Deportivo Alavés', 'http://upload.wikimedia.org/wikipedia/en/2/2e/Deportivo_Alaves_logo.svg'),
(267, 'UD Almeria', 'http://upload.wikimedia.org/wikipedia/de/6/69/Union_Deportiva_Almeria.svg'),
(745, 'CD Leganes', 'http://upload.wikimedia.org/wikipedia/en/thumb/0/02/Club_Deportivo_Leganés.png/180px-Club_Deportivo_Leganés.png'),
(265, 'Gimnàstic de Tarragona', 'https://upload.wikimedia.org/wikipedia/en/d/df/Gimnàstic_tarragona_200px.png'),
(237, 'Albacete Balompié', 'https://upload.wikimedia.org/wikipedia/en/3/37/Albacete_balompie.svg'),
(295, 'Córdoba CF', 'http://upload.wikimedia.org/wikipedia/en/9/96/Córdoba_CF_logo.svg'),
(250, 'Real Valladolid', 'http://upload.wikimedia.org/wikipedia/de/6/6e/Real_Valladolid_Logo.svg'),
(1046, 'Athletic Bilbao B', 'https://upload.wikimedia.org/wikipedia/de/thumb/7/7f/Athletic_Club_Bilbao.svg/150px-Athletic_Club_Bilbao.svg.png'),
(298, 'Girona FC', 'http://upload.wikimedia.org/wikipedia/en/9/90/For_article_Girona_FC.svg'),
(450, 'Hellas Verona FC', 'http://upload.wikimedia.org/wikipedia/de/a/a2/Hellas_Verona_1903_FC.svg'),
(100, 'AS Roma', 'http://upload.wikimedia.org/wikipedia/de/3/32/AS_Rom.svg'),
(109, 'Juventus Turin', 'http://upload.wikimedia.org/wikipedia/de/d/d2/Juventus_Turin.svg'),
(115, 'Udinese Calcio', 'http://upload.wikimedia.org/wikipedia/de/b/b1/Udinese_Calcio.svg'),
(114, 'US Cittá di Palermo', 'http://upload.wikimedia.org/wikipedia/de/7/7f/US_Palermo.svg'),
(107, 'Genoa CFC', 'http://upload.wikimedia.org/wikipedia/de/7/76/Genoa_CFC.svg'),
(471, 'US Sassuolo Calcio', 'http://upload.wikimedia.org/wikipedia/de/a/a3/US_Sassuolo_Calcio.svg'),
(113, 'SSC Napoli', 'http://upload.wikimedia.org/wikipedia/commons/2/28/S.S.C._Napoli_logo.svg'),
(584, 'UC Sampdoria', 'http://upload.wikimedia.org/wikipedia/de/c/cc/Sampdoria_Genua.svg'),
(713, 'Carpi FC', 'https://upload.wikimedia.org/wikipedia/uk/0/0b/Carpi_FC_1909_logo.png'),
(110, 'SS Lazio', 'http://upload.wikimedia.org/wikipedia/de/thumb/4/47/Lazio_Rom.svg/500px-Lazio_Rom.svg.png'),
(103, 'Bologna FC', 'http://upload.wikimedia.org/wikipedia/de/9/92/FC_Bologna.svg'),
(108, 'FC Internazionale Milano', 'https://upload.wikimedia.org/wikipedia/it/7/7e/Logo_FC_Internazionale_Milano_2014.png'),
(102, 'Atalanta BC', 'http://upload.wikimedia.org/wikipedia/de/2/28/Atalanta_BC.svg'),
(470, 'Frosinone Calcio', 'https://upload.wikimedia.org/wikipedia/it/c/c3/Frosinonestemma.png'),
(586, 'Torino FC', 'http://upload.wikimedia.org/wikipedia/de/2/2e/Torino_FC_Logo.svg'),
(99, 'ACF Fiorentina', 'http://upload.wikimedia.org/wikipedia/de/d/de/AC_Florenz.svg'),
(98, 'AC Milan', 'http://upload.wikimedia.org/wikipedia/de/9/9e/AC_Mailand_Logo.svg'),
(445, 'Empoli FC', 'http://upload.wikimedia.org/wikipedia/de/4/42/Logo_FC_Empoli.svg'),
(106, 'AC Chievo Verona', 'http://upload.wikimedia.org/wikipedia/de/3/3f/AC_Chievo_Verona.svg'),
(1049, 'CD Tondela', 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Emblema_CD_Tondela.png'),
(498, 'Sporting CP', 'https://upload.wikimedia.org/wikipedia/en/3/3e/Sporting_Clube_de_Portugal.png'),
(711, 'C.F. Os Belenenses', 'http://upload.wikimedia.org/wikipedia/de/d/db/Belenenses_Lissabon.svg'),
(496, 'FC Rio Ave', 'http://upload.wikimedia.org/wikipedia/de/6/63/Rio_Ave_FC.svg'),
(503, 'FC Porto', 'http://upload.wikimedia.org/wikipedia/de/e/ed/FC_Porto_1922-2005.svg'),
(502, 'Vitoria Guimaraes', 'http://upload.wikimedia.org/wikipedia/de/8/81/Vitoria_Guimaraes.svg'),
(506, 'Vitoria Setubal', 'http://upload.wikimedia.org/wikipedia/de/b/bd/Vitória_Setúbal.svg'),
(810, 'Boavista Porto FC', 'http://upload.wikimedia.org/wikipedia/en/4/40/Boavista_F.C._logo.svg'),
(1052, 'União Madeira', 'https://upload.wikimedia.org/wikipedia/en/0/0f/UMadeira.png'),
(504, 'Maritimo Funchal', 'http://upload.wikimedia.org/wikipedia/de/3/3b/Marítimo_Funchal.svg'),
(583, 'Moreirense FC', 'https://upload.wikimedia.org/wikipedia/pt/8/8c/Logo_Moreirense.svg'),
(712, 'FC Arouca', 'http://upload.wikimedia.org/wikipedia/de/b/b4/FC_Arouca.png'),
(497, 'Sporting Braga', 'http://upload.wikimedia.org/wikipedia/de/f/f3/Sporting_Clube_de_Braga.svg'),
(501, 'Nacional Funchal', 'http://upload.wikimedia.org/wikipedia/de/e/ee/Nacional_Funchal.svg'),
(495, 'SL Benfica', 'http://upload.wikimedia.org/wikipedia/de/8/89/Logo_Benfica_Lissabon.svg'),
(582, 'GD Estoril Praia', 'http://upload.wikimedia.org/wikipedia/de/1/14/GD_Estoril_Praia.svg'),
(507, 'FC Paços de Ferreira', 'http://upload.wikimedia.org/wikipedia/de/f/f2/FC_Pacos_de_Ferreira.svg'),
(509, 'Académica de Coimbra', 'http://upload.wikimedia.org/wikipedia/de/b/b8/Logo_Academica_de_Coimbra.svg'),
(1054, '1. FC Magdeburg', 'https://upload.wikimedia.org/wikipedia/en/f/fb/1_FC_Magdeburg.png'),
(40, 'Rot-Weiß Erfurt', 'http://upload.wikimedia.org/wikipedia/de/4/41/Rot_Weiss_Erfurt_Logo.svg'),
(39, 'SV Wehen Wiesbaden', 'http://upload.wikimedia.org/wikipedia/de/3/3d/Logo_SV_Wehen_Wiesbaden.svg'),
(1055, 'Würzburger Kickers', 'https://upload.wikimedia.org/wikipedia/en/b/b2/Kickers_Wurzburg.png'),
(34, 'FC Hansa Rostock', 'https://upload.wikimedia.org/wikipedia/en/7/78/FC_Hansa_Rostock.png'),
(56, 'Werder Bremen II', 'https://upload.wikimedia.org/wikipedia/commons/b/be/SV-Werder-Bremen-Logo.svg'),
(202, 'Stuttgarter Kickers', 'https://upload.wikimedia.org/wikipedia/en/6/6f/Stuttgarter_Kickers.png'),
(204, 'Fortuna Köln', 'https://upload.wikimedia.org/wikipedia/en/1/15/SC_Fortuna_Koln.png'),
(51, 'Preußen Münster', 'http://upload.wikimedia.org/wikipedia/de/b/be/SC_Preussen_Muenster_Logo.svg'),
(741, 'SG Sonnenhof Großaspach', 'http://upload.wikimedia.org/wikipedia/de/1/1d/SG_Sonnenhof.svg'),
(720, 'Holstein Kiel', 'http://upload.wikimedia.org/wikipedia/de/3/30/Holstein_Kiel_Logo.svg'),
(740, 'Mainz 05 II', 'http://upload.wikimedia.org/wikipedia/de/0/0b/FSV_Mainz_05_Logo.svg'),
(22, 'Erzgebirge Aue', 'http://upload.wikimedia.org/wikipedia/de/1/13/Fc_erzgebirge_aue.svg'),
(52, 'VfL Osnabrück', 'http://upload.wikimedia.org/wikipedia/de/0/00/Logo_Vfl_Osnabrueck.svg'),
(35, 'Dynamo Dresden', 'http://upload.wikimedia.org/wikipedia/de/e/e1/Logo_SG_Dynamo_Dresden_neu.svg'),
(45, 'VfB Stuttgart II', 'http://upload.wikimedia.org/wikipedia/commons/a/ab/VfB_Stuttgart_Logo.svg'),
(50, 'VfR Aalen', 'http://upload.wikimedia.org/wikipedia/commons/2/2f/VfR_Aalen_Wappen.svg'),
(54, 'Chemnitzer FC', 'http://upload.wikimedia.org/wikipedia/commons/c/c5/Chemnitzer_FC_Logo.svg'),
(23, 'Energie Cottbus', 'https://upload.wikimedia.org/wikipedia/en/1/12/Fcenergie.png'),
(554, 'Hallescher FC', 'http://upload.wikimedia.org/wikipedia/de/0/00/Hallescher_FC_Logo_2012.svg'),
(665, 'Roda JC Kerkrade', 'http://upload.wikimedia.org/wikipedia/de/3/36/Roda_JC_Kerkrade_(2011).svg'),
(671, 'Heracles Almelo', 'http://upload.wikimedia.org/wikipedia/de/d/d8/Heracles_Almelo.svg'),
(675, 'Feyenoord Rotterdam', 'http://upload.wikimedia.org/wikipedia/de/2/24/Logo_Feyenoord_Rotterdam.svg'),
(676, 'FC Utrecht', 'http://upload.wikimedia.org/wikipedia/de/4/48/FC_Utrecht.svg'),
(682, 'AZ Alkmaar', 'https://upload.wikimedia.org/wikipedia/en/e/e0/AZ_Alkmaar.svg'),
(678, 'Ajax Amsterdam', 'http://upload.wikimedia.org/wikipedia/de/7/79/Ajax_Amsterdam.svg'),
(672, 'Willem II', 'https://upload.wikimedia.org/wikipedia/de/7/7c/Willem_II_Tilburg.svg'),
(679, 'Vitesse Arnhem', 'http://upload.wikimedia.org/wikipedia/de/4/41/Vitesse_Arnheim.svg'),
(680, 'ADO Den Haag', 'http://upload.wikimedia.org/wikipedia/de/4/45/ADO_Den_Haag.svg'),
(674, 'PSV Eindhoven', 'http://upload.wikimedia.org/wikipedia/de/0/05/PSV_Eindhoven.svg'),
(673, 'SC Heerenveen', 'http://upload.wikimedia.org/wikipedia/de/e/e7/SC_Heerenveen.svg'),
(669, 'De Graafschap', 'https://upload.wikimedia.org/wikipedia/en/a/a6/Degraafschap.png'),
(677, 'FC Groningen', 'http://upload.wikimedia.org/wikipedia/de/e/ef/FC_Groningen.svg'),
(666, 'FC Twente Enschede', 'http://upload.wikimedia.org/wikipedia/de/6/6a/FC_Twente_Enschede_(ab_2006).svg'),
(684, 'PEC Zwolle', 'http://upload.wikimedia.org/wikipedia/de/2/28/PEC_Zwolle_2012.svg'),
(717, 'SC Cambuur-Leeuwarden', 'http://upload.wikimedia.org/wikipedia/de/5/5a/SC_Cambuur-Leeuwarden.svg'),
(667, 'NEC Nijmegen', 'http://upload.wikimedia.org/wikipedia/de/3/34/NEC_Nijmegen.svg'),
(670, 'Excelsior', 'https://upload.wikimedia.org/wikipedia/en/f/f5/SBV_Excelsior_logo.png'),
(524, 'Paris Saint-Germain', 'http://upload.wikimedia.org/wikipedia/de/1/1e/Paris_Saint-Germain_(seit_2013).gif'),
(749, 'Malmö FF', 'http://upload.wikimedia.org/wikipedia/de/1/17/Logo_Malmö_FF.svg'),
(495, 'SL Benfica', 'http://upload.wikimedia.org/wikipedia/de/8/89/Logo_Benfica_Lissabon.svg'),
(1056, 'FC Astana', 'https://upload.wikimedia.org/wikipedia/en/9/96/FC_Astana_Logo.svg'),
(559, 'Sevilla FC', 'http://upload.wikimedia.org/wikipedia/en/8/86/Sevilla_cf_200px.png'),
(18, 'Bor. Mönchengladbach', 'https://upload.wikimedia.org/wikipedia/commons/8/81/Borussia_Mönchengladbach_logo.svg'),
(65, 'Manchester City FC', 'http://upload.wikimedia.org/wikipedia/de/f/fd/ManCity.svg'),
(109, 'Juventus Turin', 'http://upload.wikimedia.org/wikipedia/de/d/d2/Juventus_Turin.svg'),
(610, 'Galatasaray SK', 'https://upload.wikimedia.org/wikipedia/commons/f/f6/Galatasaray_Sports_Club_Logo.png'),
(78, 'Club Atlético de Madrid', 'http://upload.wikimedia.org/wikipedia/de/c/c1/Atletico_Madrid_logo.svg'),
(11, 'VfL Wolfsburg', 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Logo-VfL-Wolfsburg.svg'),
(751, 'CSKA Moscow', 'https://upload.wikimedia.org/wikipedia/en/f/fa/CSKA_Moscow_logo.png'),
(674, 'PSV Eindhoven', 'http://upload.wikimedia.org/wikipedia/de/0/05/PSV_Eindhoven.svg'),
(66, 'Manchester United FC', 'http://upload.wikimedia.org/wikipedia/de/d/da/Manchester_United_FC.svg'),
(86, 'Real Madrid CF', 'http://upload.wikimedia.org/wikipedia/de/3/3f/Real_Madrid_Logo.svg'),
(724, 'Shakhtar Donetsk', 'https://upload.wikimedia.org/wikipedia/en/2/20/FC_Shakhtar_Donetsk.png'),
(95, 'Valencia CF', 'http://upload.wikimedia.org/wikipedia/de/7/75/FC_Valencia.svg'),
(731, 'FC Zenit St. Petersburg', 'https://upload.wikimedia.org/wikipedia/commons/2/25/FC_Zenit_1_star_2015_logo.png'),
(842, 'Dynamo Kyiv', 'https://upload.wikimedia.org/wikipedia/commons/5/5b/FC_Dynamo_Kyiv_logo.png'),
(503, 'FC Porto', 'http://upload.wikimedia.org/wikipedia/de/e/ed/FC_Porto_1922-2005.svg'),
(61, 'Chelsea FC', 'http://upload.wikimedia.org/wikipedia/de/5/5c/Chelsea_crest.svg'),
(971, 'Maccabi Tel Aviv', 'https://upload.wikimedia.org/wikipedia/en/f/f8/MTAFC_logo.png'),
(654, 'Olympiacos F.C.', 'http://upload.wikimedia.org/wikipedia/de/9/96/Logo_Olympiakos_Piräus.svg'),
(5, 'FC Bayern München', 'http://upload.wikimedia.org/wikipedia/commons/c/c5/Logo_FC_Bayern_München.svg'),
(755, 'GNK Dinamo Zagreb', 'http://www.gnkdinamo.hr/Content/Images/main-logo.png'),
(57, 'Arsenal FC', 'http://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg'),
(100, 'AS Roma', 'http://upload.wikimedia.org/wikipedia/de/3/32/AS_Rom.svg'),
(81, 'FC Barcelona', 'http://upload.wikimedia.org/wikipedia/de/a/aa/Fc_barcelona.svg'),
(3, 'Bayer Leverkusen', 'http://upload.wikimedia.org/wikipedia/de/9/95/Bayer_04_Leverkusen_Logo.svg'),
(748, 'FK BATE Baryssau', 'http://upload.wikimedia.org/wikipedia/de/thumb/0/0a/Logo_BATE_Baryssau.svg/150px-Logo_BATE_Baryssau.svg.png'),
(1057, 'KAA Gent', 'https://upload.wikimedia.org/wikipedia/en/f/f4/KAA_Gent_logo.svg'),
(523, 'Olympique Lyonnais', 'http://upload.wikimedia.org/wikipedia/de/f/f1/Olympique_Lyon.svg'),
(363, 'Chesterfield FC', 'https://upload.wikimedia.org/wikipedia/en/9/94/Chesterfield_FC_crest.svg'),
(357, 'Barnsley FC', 'https://upload.wikimedia.org/wikipedia/en/c/c9/Barnsley_FC.svg'),
(1079, 'Swindon Town FC', 'https://upload.wikimedia.org/wikipedia/en/a/a3/Swindon_Town_FC.svg'),
(1067, 'Bradford City AFC', 'https://upload.wikimedia.org/wikipedia/en/3/32/Bradford_City_AFC.png'),
(1080, 'Shrewsbury Town FC', 'https://upload.wikimedia.org/wikipedia/en/1/1b/Shrewsbury_Town_Badge_2015-.jpg'),
(384, 'Millwall FC', 'https://upload.wikimedia.org/wikipedia/en/7/71/Millwall_FC_logo.png'),
(361, 'Rochdale AFC', 'https://upload.wikimedia.org/wikipedia/en/d/d5/Rochdale_badge.png'),
(1077, 'Peterborough United FC', 'https://upload.wikimedia.org/wikipedia/en/d/d4/Peterborough_United.svg'),
(1073, 'Fleetwood Town FC', 'https://upload.wikimedia.org/wikipedia/en/6/64/Fleetwood_Town_FC.png'),
(1069, 'Southend United FC', 'https://upload.wikimedia.org/wikipedia/en/7/79/Southend_United.svg'),
(1071, 'Doncaster Rovers FC', 'https://upload.wikimedia.org/wikipedia/en/4/46/Doncaster_Rovers_FC.png'),
(1068, 'Bury FC', 'https://upload.wikimedia.org/wikipedia/en/b/b7/Bury_FC.svg'),
(1074, 'Crewe Alexandra FC', 'https://upload.wikimedia.org/wikipedia/en/9/9d/Crewe_Alexandra.svg'),
(393, 'Port Vale FC', 'https://upload.wikimedia.org/wikipedia/en/5/5f/Port_Vale_logo.svg'),
(1076, 'Coventry City FC', 'https://upload.wikimedia.org/wikipedia/en/9/94/Coventry_City_FC_logo.svg'),
(75, 'Wigan Athletic FC', 'https://upload.wikimedia.org/wikipedia/en/4/43/Wigan_Athletic.svg'),
(1070, 'Colchester United FC', 'https://upload.wikimedia.org/wikipedia/en/4/48/Colchester_United_FC_logo.svg'),
(336, 'Blackpool FC', 'https://upload.wikimedia.org/wikipedia/en/d/df/Blackpool_FC_logo.svg'),
(1072, 'Burton Albion FC', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Burton_Albion_FC_logo.svg/847px-Burton_Albion_FC_logo.svg.png'),
(1078, 'Scunthorpe United FC', 'https://upload.wikimedia.org/wikipedia/en/9/95/Scunthorpe_United_FC_logo.svg'),
(370, 'Gillingham FC', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/FC_Gillingham_Logo.svg/788px-FC_Gillingham_Logo.svg.png'),
(356, 'Sheffield United FC', 'https://upload.wikimedia.org/wikipedia/en/9/9c/Sheffield_United_FC_logo.svg'),
(369, 'Walsall FC', 'https://upload.wikimedia.org/wikipedia/en/e/ef/Walsall_FC.svg'),
(1075, 'Oldham Athletic AFC', 'https://upload.wikimedia.org/wikipedia/en/2/21/Oldham_Athletic_new_badge.png');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `id_meci` int(11) NOT NULL,
  `id_championship` int(11) NOT NULL,
  `id_team1` int(11) NOT NULL,
  `id_team2` int(11) NOT NULL,
  `score` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id_meci`, `id_championship`, `id_team1`, `id_team2`, `score`, `date`) VALUES
(1, 1, 1, 2, '2-0', '2016-06-05'),
(2, 1, 1, 3, '0-1', '2016-06-06'),
(3, 1, 1, 4, '12-12', '2016-06-12'),
(4, 1, 1, 5, '0-9', '2016-06-07'),
(5, 1, 3, 4, '2-1', '2016-06-01'),
(6, 1, 4, 5, '2-2', '2016-06-14'),
(7, 2, 1, 4, '22-22', '2016-06-13'),
(8, 2, 3, 4, '1-2', '2016-06-21'),
(9, 3, 1, 2, '3-0', '2016-06-05'),
(10, 3, 1, 3, '3-3', '2016-06-01'),
(11, 3, 2, 3, '4-5', '2016-06-14'),
(12, 1, 3, 5, '1123-123', '2016-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `polles`
--

CREATE TABLE IF NOT EXISTS `polles` (
  `id_polle` int(11) NOT NULL,
  `id_championship` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `polles_option`
--

CREATE TABLE IF NOT EXISTS `polles_option` (
  `id_polle` int(11) NOT NULL,
  `option_details` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `id_team` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `motto` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id_team`, `name`, `logo`, `motto`) VALUES
(1, 'STEAUA ', 'https://upload.wikimedia.org/wikipedia/de/3/3c/AS_Monaco.svg', 'Cu steaua noi mergem!'),
(2, 'RAPID', 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Logo_FC_Bayern_M%C3%BCnchen.svg', 'CEI MAI SLABI'),
(3, 'CLUJ NAPOCA', 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Logo_FC_Bayern_M%C3%BCnchen.svg', 'JAVRELE'),
(4, 'KAPATOS', 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Logo_FC_Bayern_M%C3%BCnchen.svg', 'google power1'),
(5, 'GAURA VASLUI', 'https://hdlogo.files.wordpress.com/2013/11/real-madrid-hd-logo.png', 'Puterea e cu noi!'),
(6, 'Panificom', 'http://salvaticopiii-iasi.ro/wp-content/uploads/2014/12/logo_panifcom.jpg', 'Salvati copii');

-- --------------------------------------------------------

--
-- Table structure for table `teams_user`
--

CREATE TABLE IF NOT EXISTS `teams_user` (
  `id_team` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `teams_user`
--

INSERT INTO `teams_user` (`id_team`, `id_user`) VALUES
(1, 1),
(3, 2),
(2, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8_bin NOT NULL,
  `pass` varchar(32) COLLATE utf8_bin NOT NULL,
  `genre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `motto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `security` varchar(50) COLLATE utf8_bin NOT NULL,
  `active` tinyint(1) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `pass`, `genre`, `age`, `avatar`, `motto`, `email`, `security`, `active`, `admin`) VALUES
(1, 'LazarSamuel', 'a3dcb4d229de6fde0db5686dee47145d', 'Barbat', 21, NULL, 'lazaros es sadasnd', 'lazar.samuel@gmail.com', 'cV9WIsiesXQUQFPtuZ27NpsGyxrmBtP1AcCJxusW8uwIdard', 1, NULL),
(2, 'vandame', '0cc175b9c0f1b6a831c399e269772661', NULL, NULL, NULL, NULL, 'razvan.popa2010@gmail.com', '8fo2SEu8Tylv8ete6xYldeSsVwwhnrsCDcD8cUxWWwXGa9OIYX', 1, NULL),
(3, 'travian', '0cc175b9c0f1b6a831c399e269772661', NULL, NULL, NULL, NULL, 'a@yahoo.com', 'ehmkHuYXlATMw8WnPLRg6mJfgMgahWgghBIhfEVRYX8h2VVZpF', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `championships`
--
ALTER TABLE `championships`
  ADD PRIMARY KEY (`id_championship`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id_meci`);

--
-- Indexes for table `polles`
--
ALTER TABLE `polles`
  ADD PRIMARY KEY (`id_polle`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id_team`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `championships`
--
ALTER TABLE `championships`
  MODIFY `id_championship` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id_meci` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `polles`
--
ALTER TABLE `polles`
  MODIFY `id_polle` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id_team` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
