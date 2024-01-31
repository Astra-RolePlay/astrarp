-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.32-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- elused için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `elused` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `elused`;

-- tablo yapısı dökülüyor elused.adminmenu
CREATE TABLE IF NOT EXISTS `adminmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.adminmenu: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `adminmenu` (`id`, `name`, `license`, `citizenid`, `permission`) VALUES
	(1, 'Elused', 'license:9ddf064155f7acc32fc39a884049a1026e383b7e', 'QUZ31879', 'god'),
	(2, 'hasan585758h', 'license:208c2e2aedc86d1eaf35941a3fefdd36de247a16', NULL, 'god'),
	(3, 'root', 'license:2108202c852c99cd591973bccee56febaadc6083', NULL, 'god'),
	(4, 'tuts2yançek', 'license:01d91850ee248a58622fdeca23909912244a50eb', NULL, 'god');

-- tablo yapısı dökülüyor elused.an_engine
CREATE TABLE IF NOT EXISTS `an_engine` (
  `plate` varchar(64) NOT NULL DEFAULT '',
  `exhaust` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.an_engine: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.apartments: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.bank_accounts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.bank_cards
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.bank_cards: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.bank_statements: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `bank_statements` (`record_id`, `citizenid`, `account`, `business`, `businessid`, `gangid`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES
	(1, 'QUZ31879', 'Bank', NULL, NULL, NULL, 1000, 0, 34510, '2023-12-31 19:15:02', 'Deposit $1000 into Current Account'),
	(2, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 34510, '2023-12-31 19:15:03', 'Withdraw $1000 from Current Account'),
	(3, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 33510, '2023-12-31 19:15:07', 'Withdraw $1000 from Current Account'),
	(4, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 32510, '2023-12-31 19:15:11', 'Withdraw $1000 from Current Account'),
	(5, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 31510, '2023-12-31 19:15:11', 'Withdraw $1000 from Current Account'),
	(6, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 30510, '2023-12-31 19:15:12', 'Withdraw $1000 from Current Account'),
	(7, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 29510, '2023-12-31 19:15:12', 'Withdraw $1000 from Current Account'),
	(8, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 28510, '2023-12-31 19:15:12', 'Withdraw $1000 from Current Account'),
	(9, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 27510, '2023-12-31 19:15:12', 'Withdraw $1000 from Current Account'),
	(10, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 26510, '2023-12-31 19:15:12', 'Withdraw $1000 from Current Account'),
	(11, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 25510, '2023-12-31 19:15:12', 'Withdraw $1000 from Current Account'),
	(12, 'QUZ31879', 'Bank', NULL, NULL, NULL, 0, 1000, 24510, '2023-12-31 19:15:13', 'Withdraw $1000 from Current Account');

-- tablo yapısı dökülüyor elused.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.bans: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.crafting_benches
CREATE TABLE IF NOT EXISTS `crafting_benches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchId` varchar(50) NOT NULL,
  `blueprints` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benchId` (`benchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.crafting_benches: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.crypto: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1043, '[{"PreviousWorth":1045,"NewWorth":1043},{"PreviousWorth":1045,"NewWorth":1043},{"PreviousWorth":1045,"NewWorth":1043},{"NewWorth":1043,"PreviousWorth":1043}]');

-- tablo yapısı dökülüyor elused.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.crypto_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.darkchat_messages: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.dealers: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.gloveboxitems: ~38 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(103, '1JQ494ON', '[]'),
	(84, '2ZH856PP', '[]'),
	(163, '3PK726PO', '[{"label":"Araç Anahtarı","amount":1,"info":{"plate":"7UU531RN","model":"Pegassi Bati 801","lock":4322},"weight":0,"type":"item","name":"vehiclekey","unique":true,"slot":1,"useable":true,"image":"carkey.png"},{"label":"Araç Anahtarı","amount":1,"info":{"plate":"8WH393JB","model":"Pegassi Bati 801","lock":4322},"weight":0,"type":"item","name":"vehiclekey","unique":true,"slot":2,"useable":true,"image":"carkey.png"}]'),
	(125, '64AFY955', '[]'),
	(71, '67XDM645', '[]'),
	(93, '6GU752TV', '[]'),
	(162, '7UU531RN', '[]'),
	(35, '86XFC839', '[]'),
	(157, '8WH393JB', '[]'),
	(142, '9NT171QP', '[]'),
	(23, 'PD  1695', '[]'),
	(37, 'PD  2515', '[{"useable":true,"weight":0,"slot":1,"unique":true,"image":"carkey.png","type":"item","amount":1,"info":{"plate":"PD  2515","lock":4321,"model":" PD Challgargent"},"label":"Vehicle key","name":"vehiclekey"}]'),
	(134, 'PD  3408', '[]'),
	(128, 'PD  3430', '[]'),
	(89, 'PD  3472', '[]'),
	(19, 'PD  3643', '[]'),
	(86, 'PD  3979', '[]'),
	(79, 'PD  4684', '[]'),
	(21, 'PD  4925', '[]'),
	(177, 'PD  5091', '[]'),
	(90, 'PD  5444', '[]'),
	(186, 'PD  5459', '[]'),
	(73, 'PD  5507', '[]'),
	(34, 'PD  6067', '[]'),
	(129, 'PD  6154', '[{"info":{"plate":"PD  6154","lock":4321,"model":" PD Cruiser"},"type":"item","useable":true,"name":"vehiclekey","slot":1,"image":"carkey.png","label":"Araç Anahtarı","amount":1,"unique":true,"weight":0},{"info":{"lock":4322,"plate":"1JQ494ON","model":"Pegassi Ignus"},"type":"item","useable":true,"name":"vehiclekey","slot":2,"image":"carkey.png","label":"Araç Anahtarı","amount":1,"unique":true,"weight":0},{"info":{"lock":4321,"plate":"64AFY955","model":"Progen T20"},"type":"item","useable":true,"name":"vehiclekey","slot":3,"image":"carkey.png","label":"Araç Anahtarı","amount":1,"unique":true,"weight":0},{"info":{"plate":"PD  3408","lock":4321,"model":" PD Challgargent"},"type":"item","useable":true,"name":"vehiclekey","slot":4,"image":"carkey.png","label":"Araç Anahtarı","amount":1,"unique":true,"weight":0},{"info":{"plate":"9NT171QP","lock":4322,"model":"Ocelot Ardent"},"type":"item","useable":true,"name":"vehiclekey","slot":5,"image":"carkey.png","label":"Araç Anahtarı","amount":1,"unique":true,"weight":0}]'),
	(74, 'PD  6763', '[]'),
	(87, 'PD  7146', '[]'),
	(197, 'PD  7298', '[]'),
	(31, 'PD  7865', '[]'),
	(181, 'PD  8222', '[{"image":"carkey.png","useable":true,"label":"Araç Anahtarı","name":"vehiclekey","amount":1,"slot":1,"unique":true,"weight":0,"type":"item","info":{"lock":4321,"model":" PD Stgang","plate":"PD  8678"}}]'),
	(76, 'PD  8316', '[]'),
	(145, 'PD  8325', '[]'),
	(193, 'PD  8618', '[]'),
	(179, 'PD  8678', '[{"amount":1,"image":"carkey.png","useable":true,"weight":0,"name":"vehiclekey","info":{"plate":"3PK726PO","model":"Invetero Coquette","lock":4322},"type":"item","unique":true,"slot":1,"label":"Araç Anahtarı"},{"amount":1,"image":"carkey.png","useable":true,"weight":0,"name":"vehiclekey","info":{"plate":"PD  4134","model":"NULL","lock":4321},"type":"item","unique":true,"slot":2,"label":"Araç Anahtarı"}]'),
	(83, 'PD  8978', '[]'),
	(75, 'PD  9490', '[]'),
	(80, 'PD  9669', '[]'),
	(200, 'ST  4519', '[]');

-- tablo yapısı dökülüyor elused.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.houselocations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.house_plants: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.instagram_account
CREATE TABLE IF NOT EXISTS `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.instagram_account: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.instagram_followers
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.instagram_followers: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.instagram_posts
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL DEFAULT 'Los Santos',
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.instagram_posts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- elused.instagram_stories: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.insta_stories
CREATE TABLE IF NOT EXISTS `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.insta_stories: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.lapraces: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `Type` text DEFAULT NULL,
  `Steam` varchar(255) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT current_timestamp(),
  `Log` text DEFAULT NULL,
  `Cid` varchar(50) DEFAULT NULL,
  `Data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.logs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.management_funds: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 32000, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

-- tablo yapısı dökülüyor elused.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.management_outfits: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.mdt_config
CREATE TABLE IF NOT EXISTS `mdt_config` (
  `citizenid` varchar(10) NOT NULL,
  `theme` int(11) NOT NULL,
  `sidebar` int(11) NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_config: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `mdt_config` (`citizenid`, `theme`, `sidebar`) VALUES
	('QUZ31879', 1, 1);

-- tablo yapısı dökülüyor elused.mdt_evidences
CREATE TABLE IF NOT EXISTS `mdt_evidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgurl` text NOT NULL,
  `description` text NOT NULL,
  `type` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_evidences: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `evidences` text NOT NULL,
  `vehicles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`vehicles`)),
  `criminals` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_incidents: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.mdt_profiles
CREATE TABLE IF NOT EXISTS `mdt_profiles` (
  `citizenid` varchar(10) NOT NULL,
  `notes` text NOT NULL,
  `image` text NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_profiles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `vehicles` text NOT NULL,
  `evidences` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_reports: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.mdt_vehicles
CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
  `plate` varchar(10) NOT NULL,
  `image` text NOT NULL,
  `notes` text NOT NULL,
  UNIQUE KEY `plate` (`plate`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident` int(11) NOT NULL,
  `citizenid` text NOT NULL,
  `date` text NOT NULL,
  `approved` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_warrants: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.occasion_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.pets
CREATE TABLE IF NOT EXISTS `pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(60) DEFAULT NULL,
  `modelname` varchar(250) DEFAULT NULL,
  `health` tinyint(4) NOT NULL DEFAULT 100,
  `illnesses` varchar(60) NOT NULL DEFAULT 'none',
  `name` varchar(255) DEFAULT 'Pet',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- elused.pets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.phone_gallery: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.phone_invoices: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `phone_invoices` (`id`, `citizenid`, `amount`, `society`, `sender`, `sendercitizenid`) VALUES
	(1, 'XYP48353', 250, 'Garaj', 'Vale', 'Garaj'),
	(2, 'QUZ31879', 10000000, 'police', 'cabbar', 'XYP48353');

-- tablo yapısı dökülüyor elused.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.phone_messages: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` text DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.phone_tweets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL,
  `daily` int(11) NOT NULL DEFAULT 0,
  `aranma` longtext DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `ringtone` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1355 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.players: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `iban`, `pincode`, `daily`, `aranma`, `photo`, `photos`, `apps`, `widget`, `bt`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`) VALUES
	(1237, 'EPT80110', 1, 'license:208c2e2aedc86d1eaf35941a3fefdd36de247a16', 'hasan585758h', '{"cash":5008000,"bank":15010,"crypto":0,"blackmoney":0}', '{"phone":"666666","birthdate":"2024-01-12","cid":1,"nationality":"asdasdas","lastname":"dasdsa","gender":0,"account":"96426141358","firstname":"sdads","backstory":"placeholder backstory"}', '{"label":"LSPD","payment":2500,"onduty":true,"grade":{"level":1,"name":"Officer I"},"name":"police","type":"leo","isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-376.73406982421877,"y":-1632.4747314453126,"z":2.89306640625}', '{"armor":0,"thirst":100,"inlaststand":false,"pkelepce":false,"ishandcuffed":false,"phonedata":{"SerialNumber":8074,"InstalledApps":[]},"isdead":false,"inside":{"apartment":[]},"status":[],"licences":{"driver":true,"weapon":false,"business":false},"criminalrecord":{"hasRecord":false},"phone":[],"jobrep":{"hotdog":0,"trucker":0,"taxi":0,"tow":0},"injail":0,"stress":0,"fingerprint":"qW274v64WDB7500","commandbinds":[],"jailitems":[],"fitbit":[],"callsign":"NO CALLSIGN","attachmentcraftingrep":0,"walletid":"2377","dealerrep":0,"bloodtype":"A+","kelepce":false,"communityservice":0,"hunger":100,"tracker":false,"craftingrep":0}', '[{"name":"id_card","info":{"nationality":"asdasdas","gender":0,"lastname":"dasdsa","citizenid":"EPT80110","birthdate":"2024-01-12","firstname":"sdads"},"amount":1,"slot":1,"type":"item"},{"name":"cash","info":[],"amount":5008000,"slot":2,"type":"item"},{"name":"driver_license","info":{"firstname":"sdads","type":"Class C Driver License","birthdate":"2024-01-12","lastname":"dasdsa"},"amount":1,"slot":3,"type":"item"},{"name":"phone","info":[],"amount":1,"slot":4,"type":"item"},{"name":"weapon_assaultrifle_mk2","info":{"ammo":204,"serie":"78GSV2IQ888nNZB","quality":95.34999999999983},"amount":1,"slot":5,"type":"weapon"}]', '2024-01-12 17:20:16', 'QB6481', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(1240, 'FWH76480', 1, 'license:2108202c852c99cd591973bccee56febaadc6083', 'root', '{"cash":8000,"bank":5040,"crypto":0,"blackmoney":0}', '{"phone":"837612","birthdate":"2024-01-12","firstname":"asdas","nationality":"asdasdas","lastname":"asdasd","gender":0,"account":"23142487751","cid":1,"backstory":"placeholder backstory"}', '{"label":"Civilian","payment":10,"onduty":true,"grade":{"level":0,"name":"Freelancer"},"name":"unemployed","type":"none","isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-422.5978088378906,"y":-1637.9208984375,"z":9.734130859375}', '{"armor":0,"thirst":100,"inlaststand":false,"phone":[],"pkelepce":false,"ishandcuffed":false,"phonedata":{"SerialNumber":9809,"InstalledApps":[]},"isdead":false,"inside":{"apartment":[]},"status":[],"licences":{"driver":true,"weapon":false,"business":false},"criminalrecord":{"hasRecord":false},"skill":{"Ciğer Kapasitesi":{"RemoveAmount":0,"Current":5,"Stat":"MP0_LUNG_CAPACITY","Menu":true},"Kondisyon":{"RemoveAmount":0,"Current":10,"Stat":"MP0_STAMINA","Menu":true},"Güç":{"RemoveAmount":0,"Current":5,"Stat":"MP0_STRENGTH","Menu":true},"Ön Kaldırma Yeteneği":{"RemoveAmount":0,"Current":0,"Stat":"MP0_WHEELIE_ABILITY","Menu":true},"Sürüş Yeteneği":{"RemoveAmount":0,"Current":0.1,"Stat":"MP0_DRIVING_ABILITY","Menu":true}},"jobrep":{"hotdog":0,"trucker":0,"taxi":0,"tow":0},"injail":0,"stress":0,"fingerprint":"Yn856N31dbD9944","commandbinds":[],"jailitems":[],"fitbit":[],"callsign":"NO CALLSIGN","attachmentcraftingrep":0,"walletid":"9666","dealerrep":0,"bloodtype":"AB-","kelepce":false,"communityservice":0,"hunger":100,"tracker":false,"craftingrep":0}', '[{"name":"weapon_minigun","info":{"ammo":49,"serie":"04UIn0Xx201WMrr","quality":97.14999999999989},"amount":1,"slot":1,"type":"weapon"},{"name":"cash","info":[],"amount":8000,"slot":2,"type":"item"},{"name":"weapon_minigun","info":{"serie":"17rPa1MV214TSaV","quality":100},"amount":1,"slot":3,"type":"weapon"},{"name":"phone","info":[],"amount":1,"slot":4,"type":"item"},{"name":"weapon_dagger","info":{"serie":"04anB8Bw416Vvux","quality":100},"amount":1,"slot":5,"type":"weapon"},{"name":"weapon_dagger","info":{"serie":"21zDi9eW006Oqxl","quality":100},"amount":1,"slot":6,"type":"weapon"},{"name":"weapon_dagger","info":{"serie":"85ZOg8aY345xanK","quality":100},"amount":1,"slot":7,"type":"weapon"},{"name":"weapon_dagger","info":{"serie":"24YkR8Sw548dduh","quality":100},"amount":1,"slot":8,"type":"weapon"},{"name":"id_card","info":{"nationality":"asdasdas","gender":0,"lastname":"asdasd","citizenid":"FWH76480","birthdate":"2024-01-12","firstname":"asdas"},"amount":1,"slot":9,"type":"item"},{"name":"driver_license","info":{"firstname":"asdas","type":"Class C Driver License","birthdate":"2024-01-12","lastname":"asdasd"},"amount":1,"slot":10,"type":"item"}]', '2024-01-12 17:19:34', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(1262, 'MLP99833', 1, 'license:01d91850ee248a58622fdeca23909912244a50eb', 'tuts2yançek', '{"cash":8000,"bank":5050,"crypto":0,"blackmoney":0}', '{"phone":"792181","birthdate":"2024-01-12","firstname":"dede","nationality":"dede","lastname":"deed","gender":0,"account":"42216339767","cid":1,"backstory":"placeholder backstory"}', '{"label":"Civilian","payment":10,"onduty":true,"grade":{"level":0,"name":"Freelancer"},"name":"unemployed","type":"none","isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":527.6439819335938,"y":-195.90328979492188,"z":52.7178955078125}', '{"armor":0,"thirst":100,"inlaststand":false,"pkelepce":false,"ishandcuffed":false,"phonedata":{"SerialNumber":9733,"InstalledApps":[]},"isdead":false,"inside":{"apartment":[]},"status":[],"licences":{"driver":true,"weapon":false,"business":false},"criminalrecord":{"hasRecord":false},"phone":[],"jobrep":{"hotdog":0,"trucker":0,"taxi":0,"tow":0},"injail":0,"stress":2,"fingerprint":"dm485r80CkP5108","commandbinds":[],"jailitems":[],"fitbit":[],"callsign":"NO CALLSIGN","attachmentcraftingrep":0,"walletid":"6574","dealerrep":0,"bloodtype":"B-","kelepce":false,"communityservice":0,"hunger":100,"tracker":false,"craftingrep":0}', '[{"name":"weapon_glock17","info":{"ammo":58,"serie":"93OpT4ou285StQV","quality":45.09999999999882},"amount":1,"slot":1,"type":"weapon"},{"name":"cash","info":[],"amount":8000,"slot":2,"type":"item"},{"name":"pistol_ammo","info":[],"amount":4,"slot":3,"type":"item"},{"name":"phone","info":[],"amount":1,"slot":4,"type":"item"},{"name":"weapon_machinepistol","info":{"ammo":61,"serie":"26NXI3fu355woxt","quality":89.79999999999962},"amount":1,"slot":5,"type":"weapon"},{"name":"id_card","info":{"nationality":"dede","gender":0,"lastname":"deed","citizenid":"MLP99833","birthdate":"2024-01-12","firstname":"dede"},"amount":1,"slot":7,"type":"item"},{"name":"driver_license","info":{"firstname":"dede","type":"Class C Driver License","birthdate":"2024-01-12","lastname":"deed"},"amount":1,"slot":8,"type":"item"}]', '2024-01-12 17:59:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(1060, 'QUZ31879', 1, 'license:9ddf064155f7acc32fc39a884049a1026e383b7e', 'Ellunati', '{"cash":1661160.0,"blackmoney":0,"crypto":0,"bank":605020}', '{"backstory":"placeholder backstory","firstname":"Sully","birthdate":"2000-05-15","nationality":"ABD","lastname":"Cliff","account":"15278390111","cid":1,"phone":"343438","gender":0}', '{"type":"leo","payment":10000,"grade":{"level":16,"name":"Cheif Of Trooper"},"onduty":true,"isboss":true,"label":"SASP","name":"sasp"}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"level":0,"name":"none"}}', '{"x":-62.03076553344726,"y":-932.4527587890625,"z":28.6395263671875}', '{"hunger":74.79999999999999,"fitbit":[],"isdead":false,"ishandcuffed":false,"jobrep":{"taxi":0,"hotdog":0,"tow":0,"trucker":0},"bloodtype":"B+","tracker":false,"walletid":"2923","licences":{"driver":true,"business":false,"weapon":false},"craftingrep":0,"kelepce":false,"attachmentcraftingrep":0,"phone":{"background":"b12"},"status":[],"thirst":77.20000000000002,"jailitems":[],"pkelepce":false,"dealerrep":0,"communityservice":0,"stress":0,"inside":{"apartment":[]},"phonedata":{"SerialNumber":4795,"InstalledApps":[]},"skill":{"Kondisyon":{"Stat":"MP0_STAMINA","RemoveAmount":0,"Menu":true,"Current":10},"Güç":{"Stat":"MP0_STRENGTH","RemoveAmount":0,"Menu":true,"Current":5},"Sürüş Yeteneği":{"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":0,"Menu":true,"Current":3.49999999999999},"Ön Kaldırma Yeteneği":{"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":0,"Menu":true,"Current":0},"Ciğer Kapasitesi":{"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":0,"Menu":true,"Current":5}},"callsign":"400","armor":36,"commandbinds":[],"criminalrecord":{"hasRecord":false},"fingerprint":"fQ431K65yTr3775","injail":0,"inlaststand":false}', '[{"type":"weapon","amount":1,"info":{"quality":97.89999999999992,"ammo":109,"serie":"18dPf6cG049aJYQ"},"slot":1,"name":"weapon_glock17"},{"type":"weapon","amount":1,"info":{"quality":100.0,"ammo":227,"serie":"95lWH3Pt573xpUT"},"slot":2,"name":"weapon_beanbagshotgun"},{"type":"item","amount":6,"info":[],"slot":3,"name":"pistol_ammo"},{"type":"item","amount":50,"info":[],"slot":4,"name":"bandage"},{"type":"item","amount":2,"info":[],"slot":5,"name":"heavyarmor"},{"type":"item","amount":14,"info":[],"slot":6,"name":"firstaid"},{"type":"item","amount":5,"info":[],"slot":7,"name":"empty_evidence_bag"},{"type":"item","amount":1,"info":[],"slot":8,"name":"drone_flyer_7"},{"type":"item","amount":1,"info":[],"slot":9,"name":"bodycam"},{"type":"item","amount":1,"info":[],"slot":10,"name":"radio"},{"type":"item","amount":1,"info":[],"slot":11,"name":"megaphone"},{"type":"weapon","amount":1,"info":{"quality":100,"serie":"16piP4Ry892zQKG"},"slot":12,"name":"weapon_flashlight"},{"type":"item","amount":1,"info":[],"slot":13,"name":"phone"},{"type":"item","amount":5,"info":[],"slot":14,"name":"pkelepce"},{"type":"item","amount":1,"info":[],"slot":15,"name":"gps"},{"type":"item","amount":1,"info":{"lock":4321,"model":" PD Tahot","plate":"ST  6425"},"slot":133,"name":"vehiclekey"},{"type":"item","amount":1,"info":{"type":"Class C Driver License","firstname":"Sully","birthdate":"2000-05-15","lastname":"Cliff"},"slot":36,"name":"driver_license"},{"type":"item","amount":1,"info":[],"slot":37,"name":"badge"},{"type":"item","amount":1,"info":{"lock":4321,"model":" PD Challgargent","plate":"PD  7298"},"slot":136,"name":"vehiclekey"},{"type":"item","amount":1661160.0,"info":[],"slot":39,"name":"cash"},{"type":"item","amount":1,"info":{"firstname":"Sully","lastname":"Cliff","nationality":"ABD","citizenid":"QUZ31879","birthdate":"2000-05-15","gender":0},"slot":40,"name":"id_card"},{"type":"item","amount":1,"info":{"lock":4321,"model":" PD Stgang","plate":"ST  4519"},"slot":134,"name":"vehiclekey"},{"type":"item","amount":1,"info":{"lock":4321,"model":" PD Cruiser","plate":"PD  8618"},"slot":135,"name":"vehiclekey"}]', '2024-01-12 21:45:04', 'QB5653', 1234, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	(1210, 'XYP48353', 1, 'license:6902f4394b00ce8d6cb3b21c8c8ff1a27ff4125d', 'jakted', '{"bank":95550,"crypto":0,"cash":7875.0,"blackmoney":0}', '{"account":"65333400858","lastname":"korkmaz","backstory":"placeholder backstory","nationality":"türk ","firstname":"cabbar","cid":1,"phone":"714280","birthdate":"1989-09-22","gender":0}', '{"label":"LSPD","isboss":true,"onduty":true,"name":"police","grade":{"name":"Ast. Chief","level":15},"type":"leo","payment":9500}', '{"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"name":"none","isboss":false}', '{"x":-1826.927490234375,"y":-1223.6834716796876,"z":13.0029296875}', '{"criminalrecord":{"hasRecord":false},"craftingrep":0,"tracker":false,"commandbinds":[],"jobrep":{"trucker":0,"tow":0,"taxi":0,"hotdog":0},"jailitems":[],"communityservice":0,"ishandcuffed":false,"attachmentcraftingrep":0,"skill":{"Güç":{"RemoveAmount":0,"Menu":true,"Current":5,"Stat":"MP0_STRENGTH"},"Ön Kaldırma Yeteneği":{"RemoveAmount":0,"Menu":true,"Current":0,"Stat":"MP0_WHEELIE_ABILITY"},"Ciğer Kapasitesi":{"RemoveAmount":0,"Menu":true,"Current":5,"Stat":"MP0_LUNG_CAPACITY"},"Sürüş Yeteneği":{"RemoveAmount":0,"Menu":true,"Current":0.89999999999999,"Stat":"MP0_DRIVING_ABILITY"},"Kondisyon":{"RemoveAmount":0,"Menu":true,"Current":10,"Stat":"MP0_STAMINA"}},"pkelepce":false,"phonedata":{"InstalledApps":[],"SerialNumber":5254},"armor":0,"injail":0,"fingerprint":"Zb249J19hKm5018","inside":{"apartment":[]},"licences":{"driver":true,"business":false,"weapon":false},"isdead":false,"bloodtype":"B-","walletid":"1906","callsign":"NO CALLSIGN","fitbit":[],"stress":0,"thirst":54.40000000000003,"phone":[],"inlaststand":false,"hunger":49.59999999999996,"status":[],"kelepce":false,"dealerrep":0}', '[{"name":"weapon_scarh","amount":1,"type":"weapon","info":{"quality":89.64999999999961,"serie":"93yFJ5pC564xdwk","ammo":95},"slot":1},{"name":"weapon_m9","amount":1,"type":"weapon","info":{"quality":92.34999999999971,"serie":"88Qwo7mz968UFuA","ammo":213},"slot":2},{"name":"pistol_ammo","amount":4,"type":"item","info":[],"slot":3},{"name":"pkelepce","amount":1,"type":"item","info":[],"slot":4},{"name":"pkelepceanahtar","amount":1,"type":"item","info":[],"slot":5},{"name":"megaphone","amount":1,"type":"item","info":[],"slot":10},{"name":"gps","amount":1,"type":"item","info":[],"slot":11},{"name":"badge","amount":1,"type":"item","info":[],"slot":12},{"name":"bodycam","amount":1,"type":"item","info":[],"slot":13},{"name":"cash","amount":7875.0,"type":"item","info":[],"slot":14},{"name":"radio","amount":1,"type":"item","info":[],"slot":15},{"name":"vehiclekey","amount":1,"type":"item","info":{"model":" PD Stgang","lock":4321,"plate":"PD  5459"},"slot":125}]', '2024-01-12 18:59:21', 'QB6538', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- tablo yapısı dökülüyor elused.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.playerskins: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(23, 'UWX63047', 'mp_m_freemode_01', '{"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"headBlend":{"shapeMix":0,"skinFirst":0,"skinSecond":0,"shapeSecond":0,"shapeFirst":0,"thirdMix":0,"skinMix":0,"shapeThird":0,"skinThird":0},"headOverlays":{"blemishes":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"secondColor":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"complexion":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"blush":{"style":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0}},"eyeColor":-1,"model":"mp_m_freemode_01","faceFeatures":{"noseWidth":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"nosePeakHigh":0,"chinBoneSize":0,"nosePeakLowering":0,"chinBoneLenght":0,"noseBoneHigh":0,"chinBoneLowering":0,"eyeBrownForward":0,"eyesOpening":0,"chinHole":0,"jawBoneWidth":0,"nosePeakSize":0,"noseBoneTwist":0,"lipsThickness":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"neckThickness":0,"cheeksWidth":0},"tattoos":[],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"hair":{"texture":0,"color":0,"highlight":0,"style":0}}', 1),
	(29, 'QUZ31879', 'mp_m_freemode_01', '{"hair":{"color":13,"texture":0,"highlight":0,"style":17},"faceFeatures":{"cheeksBoneWidth":0,"cheeksWidth":0,"eyeBrownForward":0,"jawBoneWidth":0,"eyesOpening":0,"chinHole":0,"chinBoneLowering":0,"nosePeakHigh":0,"chinBoneSize":0,"noseBoneTwist":0,"noseWidth":0,"neckThickness":0,"lipsThickness":0,"eyeBrownHigh":0,"nosePeakLowering":0,"cheeksBoneHigh":0,"nosePeakSize":0,"noseBoneHigh":0,"jawBoneBackSize":0,"chinBoneLenght":0},"headBlend":{"skinThird":0,"shapeMix":0,"shapeSecond":0,"thirdMix":0,"skinFirst":0,"shapeFirst":0,"skinSecond":0,"shapeThird":0,"skinMix":0},"model":"mp_m_freemode_01","components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":17,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":8,"component_id":7},{"texture":0,"drawable":150,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":324,"component_id":11},{"texture":0,"drawable":179,"component_id":4},{"texture":1,"drawable":17,"component_id":6}],"eyeColor":0,"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"tattoos":[],"headOverlays":{"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"style":0,"opacity":0},"blush":{"color":0,"style":0,"opacity":0},"complexion":{"color":0,"style":0,"opacity":0},"lipstick":{"color":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0},"sunDamage":{"color":0,"style":0,"opacity":0},"eyebrows":{"color":0,"style":0,"opacity":0},"blemishes":{"color":0,"style":0,"opacity":0},"beard":{"color":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0},"chestHair":{"color":0,"style":0,"opacity":0}}}', 1),
	(30, 'EPT80110', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"complexion":{"style":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"blemishes":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"color":0,"secondColor":0,"opacity":0},"blush":{"style":0,"opacity":0,"color":0}},"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"faceFeatures":{"chinBoneSize":0,"chinBoneLowering":0,"jawBoneWidth":0,"nosePeakSize":0,"jawBoneBackSize":0,"cheeksWidth":0,"nosePeakHigh":0,"noseWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"nosePeakLowering":0,"neckThickness":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"lipsThickness":0,"eyesOpening":0,"chinHole":0,"noseBoneTwist":0},"tattoos":[],"headBlend":{"shapeMix":0,"shapeFirst":0,"thirdMix":0,"skinSecond":0,"skinFirst":0,"skinMix":0,"shapeThird":0,"shapeSecond":0,"skinThird":0},"hair":{"highlight":0,"style":0,"texture":0,"color":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11},{"texture":0,"drawable":1,"component_id":4}]}', 1),
	(31, 'FWH76480', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"complexion":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"blemishes":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0},"blush":{"style":0,"opacity":0,"color":0}},"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"faceFeatures":{"chinBoneSize":0,"chinBoneLowering":0,"jawBoneWidth":0,"nosePeakSize":0,"jawBoneBackSize":0,"cheeksWidth":0,"nosePeakHigh":0,"noseWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"nosePeakLowering":0,"neckThickness":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"noseBoneTwist":0,"eyesOpening":0,"lipsThickness":0,"eyeBrownHigh":0,"chinHole":0},"tattoos":[],"headBlend":{"shapeSecond":0,"shapeFirst":0,"thirdMix":0,"shapeThird":0,"skinFirst":0,"skinMix":0,"shapeMix":0,"skinSecond":0,"skinThird":0},"hair":{"texture":0,"highlight":0,"style":0,"color":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}]}', 1),
	(32, 'MLP99833', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"complexion":{"style":0,"color":0,"opacity":0},"makeUp":{"style":0,"color":0,"secondColor":0,"opacity":0},"ageing":{"style":0,"color":0,"opacity":0},"blemishes":{"style":0,"color":0,"opacity":0},"eyebrows":{"style":0,"color":0,"opacity":0},"sunDamage":{"style":0,"color":0,"opacity":0},"chestHair":{"style":0,"color":0,"opacity":0},"lipstick":{"style":0,"color":0,"opacity":0},"beard":{"style":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"color":0,"opacity":0},"blush":{"style":0,"color":0,"opacity":0}},"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"faceFeatures":{"chinBoneSize":0,"chinBoneLowering":0,"jawBoneWidth":0,"nosePeakSize":0,"jawBoneBackSize":0,"cheeksWidth":0,"nosePeakHigh":0,"noseWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"nosePeakLowering":0,"neckThickness":0,"noseBoneHigh":0,"eyeBrownHigh":0,"cheeksBoneHigh":0,"lipsThickness":0,"eyesOpening":0,"noseBoneTwist":0,"chinHole":0},"tattoos":[],"headBlend":{"shapeMix":0,"shapeFirst":0,"thirdMix":0,"shapeThird":0,"skinFirst":0,"skinMix":0,"skinSecond":0,"shapeSecond":0,"skinThird":0},"hair":{"texture":0,"style":0,"highlight":0,"color":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}]}', 1),
	(33, 'XYP48353', 'mp_m_freemode_01', '{"headOverlays":{"blemishes":{"color":0,"style":0,"opacity":0},"sunDamage":{"color":0,"style":0,"opacity":0},"eyebrows":{"color":0,"style":0,"opacity":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"blush":{"color":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0},"chestHair":{"color":0,"style":0,"opacity":0},"complexion":{"color":0,"style":0,"opacity":0},"lipstick":{"color":0,"style":0,"opacity":0},"ageing":{"color":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0},"beard":{"color":0,"style":0,"opacity":0}},"faceFeatures":{"cheeksBoneHigh":0,"noseWidth":0,"lipsThickness":0,"nosePeakLowering":0,"chinBoneLenght":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"jawBoneWidth":0,"chinHole":0,"eyesOpening":0,"chinBoneLowering":0,"nosePeakHigh":0,"noseBoneHigh":0,"chinBoneSize":0,"nosePeakSize":0,"cheeksWidth":0,"eyeBrownHigh":0,"neckThickness":0,"eyeBrownForward":0,"noseBoneTwist":0},"hair":{"color":0,"texture":0,"style":0,"highlight":0},"eyeColor":0,"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"tattoos":[],"headBlend":{"shapeSecond":0,"shapeFirst":0,"shapeMix":0,"skinMix":0,"thirdMix":0,"shapeThird":0,"skinThird":0,"skinFirst":0,"skinSecond":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":10},{"drawable":321,"texture":0,"component_id":11},{"drawable":17,"texture":0,"component_id":8},{"drawable":143,"texture":2,"component_id":4},{"drawable":130,"texture":0,"component_id":6},{"drawable":14,"texture":0,"component_id":9},{"drawable":42,"texture":1,"component_id":5}],"model":"mp_m_freemode_01"}', 1);

-- tablo yapısı dökülüyor elused.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.player_contacts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.player_houses: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.player_mails: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.player_outfits: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `nosColour` text DEFAULT NULL,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `lock` int(11) DEFAULT 4321,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.player_vehicles: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `nosColour`, `noslevel`, `hasnitro`, `fuel`, `engine`, `body`, `state`, `depotprice`, `lock`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
	(9, 'license:9ddf064155f7acc32fc39a884049a1026e383b7e', 'QUZ31879', 'npolchal', '-1585218235', '{"modCustomTiresF":false,"modAPlate":-1,"modTank":0,"headlightColor":255,"tankHealth":1000.0592475178704,"modDoorSpeaker":-1,"modBackWheels":-1,"wheelColor":0,"modVanityPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modArmor":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modHorns":-1,"modHydrolic":-1,"windowTint":1,"engineHealth":999.2649192831461,"modFrame":1,"color2":141,"modStruts":-1,"modSteeringWheel":-1,"modSpeakers":-1,"model":1949729657,"oilLevel":4.76596940834568,"dirtLevel":0.79432823472428,"modBrakes":-1,"modArchCover":4,"modEngine":4,"modRearBumper":-1,"modKit21":-1,"modFender":9,"fuelLevel":50.04267878762973,"wheelSize":1.0,"modDashboard":0,"modTrimB":0,"plateIndex":2,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"interiorColor":111,"modFrontBumper":-1,"wheelWidth":1.0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":3,"modTrimA":-1,"modRightFender":8,"modAerials":0,"modXenon":false,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modOrnaments":0,"modKit47":-1,"modKit17":-1,"modCustomTiresR":false,"modSuspension":3,"dashboardColor":111,"modKit19":-1,"modRoof":-1,"modShifterLeavers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDial":0,"modFrontWheels":-1,"modTrunk":2,"modGrille":0,"modSideSkirt":-1,"neonColor":[255,0,255],"modKit49":-1,"modHood":-1,"modTurbo":1,"modPlateHolder":-1,"color1":141,"modWindows":-1,"plate":"PD  7298","pearlescentColor":70,"modSeats":-1,"extras":{"4":true,"3":true,"6":true,"5":true,"2":true,"1":true},"tyreSmokeColor":[255,255,255],"modLivery":2,"modAirFilter":-1,"modExhaust":-1,"liveryRoof":-1,"modSmokeEnabled":false,"wheels":7,"modSpoilers":0,"xenonColor":255,"bodyHealth":998.4705910484217}', 'PD  7298', NULL, 'pdgarage5', NULL, 0, 0, 94, 1000, 999, 1, 0, 4321, 5675, NULL, 0, 0, 0, 0),
	(10, 'license:9ddf064155f7acc32fc39a884049a1026e383b7e', 'QUZ31879', 'clrgtahoe', '-801110751', '{"modCustomTiresF":false,"modAPlate":-1,"modTank":0,"headlightColor":255,"tankHealth":999.2649192831461,"modDoorSpeaker":-1,"modBackWheels":-1,"wheelColor":0,"modVanityPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modArmor":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modHorns":-1,"modHydrolic":-1,"windowTint":1,"engineHealth":996.8819345789732,"modFrame":0,"color2":0,"modStruts":-1,"modSteeringWheel":-1,"modSpeakers":-1,"model":429909980,"oilLevel":4.76596940834568,"dirtLevel":0.0,"modBrakes":-1,"modArchCover":5,"modEngine":4,"modRearBumper":-1,"modKit21":-1,"modFender":-1,"fuelLevel":50.04267878762973,"wheelSize":1.0,"modDashboard":0,"modTrimB":0,"plateIndex":2,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"interiorColor":0,"modFrontBumper":1,"wheelWidth":1.0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":3,"modTrimA":-1,"modRightFender":-1,"modAerials":1,"modXenon":false,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modOrnaments":0,"modKit47":-1,"modKit17":-1,"modCustomTiresR":false,"modSuspension":3,"dashboardColor":111,"modKit19":-1,"modRoof":-1,"modShifterLeavers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDial":-1,"modFrontWheels":-1,"modTrunk":2,"modGrille":-1,"modSideSkirt":-1,"neonColor":[255,0,255],"modKit49":-1,"modHood":-1,"modTurbo":1,"modPlateHolder":-1,"color1":0,"modWindows":-1,"plate":"ST  6425","pearlescentColor":0,"modSeats":-1,"extras":{"11":true,"3":true,"6":true,"5":true,"4":true,"7":true,"2":true,"1":true},"tyreSmokeColor":[255,255,255],"modLivery":4,"modAirFilter":-1,"modExhaust":-1,"liveryRoof":-1,"modSmokeEnabled":false,"wheels":1,"modSpoilers":1,"xenonColor":255,"bodyHealth":996.8819345789732}', 'ST  6425', NULL, 'pdgarage5', NULL, 0, 0, 99, 997, 997, 1, 0, 4321, 192, NULL, 0, 0, 0, 0),
	(11, 'license:9ddf064155f7acc32fc39a884049a1026e383b7e', 'QUZ31879', 'npolstang', '1726520743', '{"modSpeakers":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTransmission":3,"model":-1336796853,"headlightColor":255,"modDashboard":0,"modEngineBlock":-1,"modTrimA":-1,"modTrunk":2,"wheelColor":0,"modKit21":-1,"neonColor":[255,0,255],"modDial":0,"modVanityPlate":-1,"modAirFilter":-1,"modExhaust":-1,"modFrontBumper":4,"modCustomTiresR":false,"color2":141,"modHorns":-1,"wheelWidth":1.0,"modKit49":-1,"interiorColor":111,"modSuspension":3,"modRightFender":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"modFrame":1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit17":-1,"modStruts":-1,"modBackWheels":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modRearBumper":2,"modSteeringWheel":-1,"plateIndex":2,"plate":"ST  4519","neonEnabled":[false,false,false,false],"modArchCover":5,"modEngine":4,"pearlescentColor":66,"modKit19":-1,"wheels":7,"modOrnaments":0,"modCustomTiresF":false,"bodyHealth":1000.0592475178704,"dirtLevel":0.0,"modXenon":false,"liveryRoof":-1,"modPlateHolder":-1,"modTrimB":0,"wheelSize":1.0,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"modKit47":-1,"modTurbo":1,"dashboardColor":111,"modSideSkirt":2,"modBrakes":-1,"modSeats":-1,"modFrontWheels":-1,"tankHealth":4000.2369900714818,"modAerials":0,"modWindows":-1,"modSmokeEnabled":false,"modArmor":-1,"windowTint":1,"modTank":0,"modShifterLeavers":-1,"xenonColor":255,"modSpoilers":2,"modHydrolic":-1,"modGrille":0,"modDoorSpeaker":-1,"oilLevel":4.76596940834568,"extras":{"2":true,"3":true,"4":true,"5":true,"6":true,"1":true},"modHood":4,"color1":141,"modLivery":0,"engineHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAPlate":-1,"modRoof":-1}', 'ST  4519', NULL, NULL, NULL, 0, 0, 100, 1000, 1000, 0, 0, 4321, 4362, NULL, 0, 0, 0, 0);

-- tablo yapısı dökülüyor elused.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.player_warns: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.qb_banking_societies
CREATE TABLE IF NOT EXISTS `qb_banking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.qb_banking_societies: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

-- tablo yapısı dökülüyor elused.qb_banking_transactions
CREATE TABLE IF NOT EXISTS `qb_banking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.qb_banking_transactions: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `qb_banking_transactions` (`id`, `receiver_identifier`, `receiver_name`, `sender_identifier`, `sender_name`, `date`, `value`, `type`) VALUES
	(9, 'bank', 'Bank (PIN)', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:17:27', 0, 'transfer'),
	(10, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:17:31', 155, 'deposit'),
	(11, 'QUZ31879', 'Sully Cliff', 'bank', 'Banka Hesabı', '2023-12-31 19:17:34', 155, 'withdraw'),
	(12, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:18:06', 1500, 'deposit'),
	(13, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:18:32', 8000, 'deposit'),
	(14, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:18:36', 8000, 'deposit'),
	(15, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:18:38', 8000, 'deposit'),
	(16, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:18:40', 8000, 'deposit'),
	(17, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:18:59', 8000, 'deposit'),
	(18, 'QUZ31879', 'Sully Cliff', 'bank', 'Banka Hesabı', '2023-12-31 19:42:26', 1500, 'withdraw'),
	(19, 'bank', 'Banka Hesabı', 'QUZ31879', 'Sully Cliff', '2023-12-31 19:42:31', 9500, 'deposit'),
	(20, 'QUZ31879', 'Sully Cliff', 'bank', 'Banka Hesabı', '2023-12-31 19:43:04', 80000, 'withdraw');

-- tablo yapısı dökülüyor elused.qb_fishing
CREATE TABLE IF NOT EXISTS `qb_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.qb_fishing: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `qb_fishing` (`citizenid`, `currentXP`, `tasks`, `time`) VALUES
	('XYP48353', 0, '[{"requiredCount":40,"hasCount":0,"fishName":"smallbluefish","taken":false},{"requiredCount":30,"hasCount":0,"fishName":"bluefish","taken":false},{"requiredCount":20,"hasCount":0,"fishName":"bonitosfish","taken":false},{"requiredCount":15,"hasCount":0,"fishName":"garfish","taken":false},{"requiredCount":10,"hasCount":0,"fishName":"perch","taken":false},{"requiredCount":20,"hasCount":0,"fishName":"sharkfish","taken":false}]', NULL);

-- tablo yapısı dökülüyor elused.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.stashitems: ~9 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(95, 'FWH76480', '[]'),
	(61, 'Glovebox-09DCE077', '[]'),
	(70, 'PD 8325', '[]'),
	(64, 'Police_QUZ31879', '[{"slot":1,"info":{"plate":"PD  8325","model":" PD Cruiser","lock":4322},"type":"item","amount":1,"label":"Araç Anahtarı","weight":0,"name":"vehiclekey","image":"carkey.png","useable":true,"unique":true}]'),
	(94, 'Police_XYP48353', '[{"slot":1,"info":{"serie":"08Smf5Og877lqHo","ammo":0,"quality":99.85},"type":"weapon","amount":1,"label":"Marksman Rifle","weight":1000,"name":"weapon_marksmanrifle","image":"weapon_marksmanrifle.png","useable":false,"unique":true},null,null,null,null,null,{"slot":7,"info":{"serie":"49FgD6yw673fYpg","quality":100},"type":"weapon","amount":1,"label":"Marksman Rifle","weight":1000,"name":"weapon_marksmanrifle","image":"weapon_marksmanrifle.png","useable":false,"unique":true}]'),
	(73, 'Polic_QUZ31879', '[]'),
	(65, 'Stash-Police_QUZ31879', '[]'),
	(77, 'stash_6NINE ST_VMO47587', '[]'),
	(96, 'State_QUZ31879', '[]');

-- tablo yapısı dökülüyor elused.transaction_history
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` text NOT NULL,
  `trans_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.transaction_history: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `transaction_history` (`id`, `citizenid`, `trans_id`, `account`, `amount`, `trans_type`, `receiver`, `message`, `date`) VALUES
	(73, 'QUZ31879', 76969, 'personal', -1000, 'withdraw', 'N/A', 'Isplačeno €1,000.', '2023-12-31 16:20:46'),
	(74, 'QUZ31879', 53784, 'personal', 1000, 'deposit', 'N/A', 'Deposited $1,000 cash.', '2023-12-31 16:21:02'),
	(75, 'QUZ31879', 83643, 'personal', 1000, 'deposit', 'N/A', 'Deposited $1,000 cash.', '2023-12-31 16:21:07');

-- tablo yapısı dökülüyor elused.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.trunkitems: ~0 rows (yaklaşık) tablosu için veriler indiriliyor

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
