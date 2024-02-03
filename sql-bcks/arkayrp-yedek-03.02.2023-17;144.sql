-- --------------------------------------------------------
-- Sunucu:                       45.94.171.135
-- Sunucu sürümü:                10.3.39-MariaDB-0ubuntu0.20.04.2 - Ubuntu 20.04
-- Sunucu İşletim Sistemi:       debian-linux-gnu
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
CREATE DATABASE IF NOT EXISTS `elused` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
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
DELETE FROM `adminmenu`;
INSERT INTO `adminmenu` (`id`, `name`, `license`, `citizenid`, `permission`) VALUES
	(1, 'Elused', 'license:9ddf064155f7acc32fc39a884049a1026e383b7e', 'QUZ31879', 'god'),
	(2, 'hasan585758h', 'license:208c2e2aedc86d1eaf35941a3fefdd36de247a16', NULL, 'god'),
	(3, 'root', 'license:2108202c852c99cd591973bccee56febaadc6083', NULL, 'god'),
	(4, 'tuts2yançek', 'license:01d91850ee248a58622fdeca23909912244a50eb', NULL, 'god');

-- tablo yapısı dökülüyor elused.ak4y_fishing
CREATE TABLE IF NOT EXISTS `ak4y_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.ak4y_fishing: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `ak4y_fishing`;
INSERT INTO `ak4y_fishing` (`citizenid`, `currentXP`, `tasks`, `time`) VALUES
	('PAE72962', 1000020, '[{"requiredCount":40,"hasCount":0,"fishName":"smallbluefish","taken":false},{"requiredCount":30,"hasCount":0,"fishName":"bluefish","taken":false},{"requiredCount":20,"hasCount":0,"fishName":"bonitosfish","taken":false},{"requiredCount":15,"hasCount":0,"fishName":"garfish","taken":false},{"requiredCount":10,"hasCount":0,"fishName":"perch","taken":false},{"requiredCount":20,"hasCount":0,"fishName":"sharkfish","taken":false}]', NULL),
	('BMS02698', 0, '[{"hasCount":0,"fishName":"smallbluefish","requiredCount":40,"taken":false},{"hasCount":0,"fishName":"bluefish","requiredCount":30,"taken":false},{"hasCount":0,"fishName":"bonitosfish","requiredCount":20,"taken":false},{"hasCount":0,"fishName":"garfish","requiredCount":15,"taken":false},{"hasCount":0,"fishName":"perch","requiredCount":10,"taken":false},{"hasCount":0,"fishName":"sharkfish","requiredCount":20,"taken":false}]', NULL),
	('XRK76375', 0, '[{"fishName":"smallbluefish","requiredCount":40,"taken":false,"hasCount":0},{"fishName":"bluefish","requiredCount":30,"taken":false,"hasCount":0},{"fishName":"bonitosfish","requiredCount":20,"taken":false,"hasCount":0},{"fishName":"garfish","requiredCount":15,"taken":false,"hasCount":0},{"fishName":"perch","requiredCount":10,"taken":false,"hasCount":0},{"fishName":"sharkfish","requiredCount":20,"taken":false,"hasCount":0}]', NULL);

-- tablo yapısı dökülüyor elused.an_engine
CREATE TABLE IF NOT EXISTS `an_engine` (
  `plate` varchar(64) NOT NULL DEFAULT '',
  `exhaust` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.an_engine: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `an_engine`;

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
DELETE FROM `apartments`;

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
DELETE FROM `bank_accounts`;

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
DELETE FROM `bank_cards`;

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
DELETE FROM `bank_statements`;
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
DELETE FROM `bans`;

-- tablo yapısı dökülüyor elused.codem-hud-data
CREATE TABLE IF NOT EXISTS `codem-hud-data` (
  `identifier` varchar(65) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `stress` int(11) DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.codem-hud-data: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `codem-hud-data`;
INSERT INTO `codem-hud-data` (`identifier`, `data`, `stress`) VALUES
	('XBQ11226', '{"hud":"radial","maptype":"rectangle","showHideBox":false,"hudSize":1.0,"speedometerSize":1.0,"showCompass":true,"positionsData":{"hudTopRight":{"top":"35px","left":"1672.40625px","position":"absolute"}},"hudColors":{"classic":{"thirst":"#2F549C","parachute":"#48ffde","oxy":"#48A7FFac","stamina":"#c4ff48","nitro":"#8eff48","hunger":"#B3743A","altitude":"#48deff","armor":"#2E3893","health":"#9F2929","stress":"#AA35A6"},"radial":{"thirst":"#4886FFac","parachute":"#48FFBDac","oxy":"#48A7FFac","stamina":"#C4FF48ac","nitro":"#AFFF48ac","hunger":"#FFA048ac","altitude":"#00FFF0ac","armor":"#FFFFFFac","health":"#FF4848ac","stress":"#48A7FFac"},"text":{"thirst":"#4886FFac","parachute":"#48FFBDac","oxy":"#48A7FFac","stamina":"#C4FF48ac","nitro":"#AFFF48ac","hunger":"#FFA048ac","altitude":"#00FFF0ac","armor":"#FFFFFFac","health":"#FF4848ac","stress":"#48A7FFac"}},"refreshRate":200,"hide":false,"hideBoxData":{"health":100,"hunger":100,"stress":100,"stamina":100,"armor":100,"water":100},"speedtype":"kmh"}', 0),
	('BMS02698', '{"hud":"radial","maptype":"radial","showHideBox":false,"speedtype":"kmh","showCompass":true,"hudColors":{"text":{"thirst":"#4886FFac","health":"#FF4848ac","oxy":"#48A7FFac","stamina":"#C4FF48ac","nitro":"#AFFF48ac","armor":"#FFFFFFac","altitude":"#00FFF0ac","parachute":"#48FFBDac","hunger":"#FFA048ac","stress":"#48A7FFac"},"radial":{"thirst":"#4886FFac","health":"#FF4848ac","oxy":"#48A7FFac","stamina":"#C4FF48ac","nitro":"#AFFF48ac","armor":"#FFFFFFac","altitude":"#00FFF0ac","parachute":"#48FFBDac","hunger":"#FFA048ac","stress":"#48A7FFac"},"classic":{"thirst":"#2F549C","health":"#9F2929","oxy":"#48A7FFac","stamina":"#c4ff48","nitro":"#8eff48","armor":"#2E3893","altitude":"#48deff","parachute":"#48ffde","hunger":"#B3743A","stress":"#AA35A6"}},"positionsData":[],"hudSize":"0.9","refreshRate":200,"speedometerSize":1.0,"hideBoxData":{"health":100,"stress":100,"hunger":100,"stamina":100,"armor":100,"water":100},"hide":false}', 0),
	('HGO75866', '{"showCompass":true,"showHideBox":false,"speedometerSize":1.0,"hudSize":1.0,"speedtype":"kmh","hideBoxData":{"health":100,"armor":100,"hunger":100,"stamina":100,"water":100,"stress":100},"hudColors":{"radial":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"},"classic":{"thirst":"#2F549C","parachute":"#48ffde","stamina":"#c4ff48","health":"#9F2929","altitude":"#48deff","oxy":"#48A7FFac","nitro":"#8eff48","stress":"#AA35A6","armor":"#2E3893","hunger":"#B3743A"},"text":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"}},"hide":false,"refreshRate":200,"positionsData":[],"hud":"radial","maptype":"radial"}', 0),
	('XRK76375', '{"showCompass":true,"showHideBox":false,"speedometerSize":1.0,"hudSize":1.0,"speedtype":"kmh","hideBoxData":{"health":100,"armor":100,"hunger":100,"stamina":100,"water":100,"stress":100},"hudColors":{"radial":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"},"classic":{"thirst":"#2F549C","parachute":"#48ffde","stamina":"#c4ff48","health":"#9F2929","altitude":"#48deff","oxy":"#48A7FFac","nitro":"#8eff48","stress":"#AA35A6","armor":"#2E3893","hunger":"#B3743A"},"text":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"}},"hide":false,"refreshRate":200,"positionsData":[],"hud":"radial","maptype":"radial"}', 0),
	('SVN81090', '{"showCompass":true,"showHideBox":false,"speedometerSize":1.0,"hudSize":1.0,"speedtype":"kmh","hideBoxData":{"health":100,"armor":100,"hunger":100,"stamina":100,"water":100,"stress":100},"hudColors":{"radial":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"},"classic":{"thirst":"#2F549C","parachute":"#48ffde","stamina":"#c4ff48","health":"#9F2929","altitude":"#48deff","oxy":"#48A7FFac","nitro":"#8eff48","stress":"#AA35A6","armor":"#2E3893","hunger":"#B3743A"},"text":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"}},"hide":false,"refreshRate":200,"positionsData":[],"hud":"radial","maptype":"radial"}', 0),
	('QUZ31879', '{"showCompass":true,"showHideBox":false,"speedometerSize":1.0,"hudSize":1.0,"speedtype":"kmh","hideBoxData":{"health":100,"armor":100,"hunger":100,"stamina":100,"water":100,"stress":100},"hudColors":{"radial":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"},"classic":{"thirst":"#2F549C","parachute":"#48ffde","stamina":"#c4ff48","health":"#9F2929","altitude":"#48deff","oxy":"#48A7FFac","nitro":"#8eff48","stress":"#AA35A6","armor":"#2E3893","hunger":"#B3743A"},"text":{"thirst":"#4886FFac","parachute":"#48FFBDac","stamina":"#C4FF48ac","health":"#FF4848ac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","stress":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac"}},"hide":false,"refreshRate":200,"positionsData":[],"hud":"radial","maptype":"radial"}', 0);

-- tablo yapısı dökülüyor elused.crafting_benches
CREATE TABLE IF NOT EXISTS `crafting_benches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchId` varchar(50) NOT NULL,
  `blueprints` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `benchId` (`benchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.crafting_benches: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `crafting_benches`;

-- tablo yapısı dökülüyor elused.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.crypto: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `crypto`;
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1039, '[{"PreviousWorth":1038,"NewWorth":1038},{"PreviousWorth":1038,"NewWorth":1038},{"PreviousWorth":1038,"NewWorth":1038},{"PreviousWorth":1038,"NewWorth":1039}]');

-- tablo yapısı dökülüyor elused.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.crypto_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `crypto_transactions`;

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
DELETE FROM `darkchat_messages`;

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
DELETE FROM `dealers`;

-- tablo yapısı dökülüyor elused.ds_blipcreator
CREATE TABLE IF NOT EXISTS `ds_blipcreator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- elused.ds_blipcreator: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `ds_blipcreator`;
INSERT INTO `ds_blipcreator` (`id`, `name`, `data`) VALUES
	(1, 'Test', '{"tickb":true,"items":0,"groups":{"adminn":0},"scale":1,"colors":0,"bflash":true,"coords":{"x":338.5318603515625,"y":-2722.839599609375,"z":5.959716796875},"scImg":"rgb(113, 203, 113)","SpriteImg":"https://docs.fivem.net/blips/radar_rampage.png","Sprite":84,"hideb":false,"sRange":false,"outline":true,"ftimer":50000,"alpha":255,"sColor":2}'),
	(2, 'aaaaa', '{"tickb":false,"items":0,"scale":1,"colors":0,"bflash":false,"coords":{"x":338.5318603515625,"y":-2722.839599609375,"z":5.959716796875},"scImg":"","SpriteImg":"","Sprite":0,"hideb":false,"sRange":false,"outline":false,"ftimer":50000,"alpha":255,"sColor":0}'),
	(3, 'aaaa', '{"tickb":false,"items":0,"scale":13,"colors":0,"bflash":false,"coords":{"x":338.5318603515625,"y":-2722.839599609375,"z":5.959716796875},"scImg":"rgb(254, 254, 254)","SpriteImg":"https://docs.fivem.net/blips/radar_police_plane_move.png","Sprite":16,"sRange":false,"outline":false,"ftimer":50000,"hideb":false,"alpha":255}'),
	(4, 'aaaaa', '{"tickb":false,"items":0,"scale":10,"colors":0,"bflash":false,"coords":{"x":337.5428466796875,"y":-2723.69677734375,"z":5.9765625},"scImg":"rgb(113, 203, 113)","SpriteImg":"https://docs.fivem.net/blips/radar_cable_car.png","Sprite":36,"hideb":false,"sRange":false,"outline":false,"ftimer":50000,"alpha":255,"sColor":2}');

-- tablo yapısı dökülüyor elused.gacha_playlists
CREATE TABLE IF NOT EXISTS `gacha_playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `owner` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.gacha_playlists: ~9 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_playlists`;
INSERT INTO `gacha_playlists` (`id`, `name`, `owner`) VALUES
	(1, 'test', 'license:1b08d417a013b97236eb4941ed577c2aa22f4973'),
	(2, 'Best', 'license:64038a7810c56288850ab0e5cc75768c0b817337'),
	(3, 'a', 'license:1b08d417a013b97236eb4941ed577c2aa22f4973'),
	(4, 'aaaa', 'license:1b08d417a013b97236eb4941ed577c2aa22f4973'),
	(5, 'ASTRA PLAYLIST', 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6'),
	(6, 'Efe in the hause', 'license:759f35b0a5e54b71040546417277a6471bac20df'),
	(7, 'greengang', 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6'),
	(8, 'piyasa', 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6'),
	(9, 'greengang', 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6');

-- tablo yapısı dökülüyor elused.gacha_playlists_users
CREATE TABLE IF NOT EXISTS `gacha_playlists_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) NOT NULL DEFAULT '',
  `playlist` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `FK__gacha_playlists_users` (`playlist`),
  CONSTRAINT `FK__gacha_playlists_users` FOREIGN KEY (`playlist`) REFERENCES `gacha_playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.gacha_playlists_users: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_playlists_users`;
INSERT INTO `gacha_playlists_users` (`id`, `license`, `playlist`) VALUES
	(1, 'license:1b08d417a013b97236eb4941ed577c2aa22f4973', 1),
	(2, 'license:64038a7810c56288850ab0e5cc75768c0b817337', 2),
	(3, 'license:1b08d417a013b97236eb4941ed577c2aa22f4973', 3),
	(4, 'license:1b08d417a013b97236eb4941ed577c2aa22f4973', 4),
	(6, 'license:759f35b0a5e54b71040546417277a6471bac20df', 6),
	(9, 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 9);

-- tablo yapısı dökülüyor elused.gacha_playlist_songs
CREATE TABLE IF NOT EXISTS `gacha_playlist_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist` int(11) NOT NULL DEFAULT 0,
  `song` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK__gacha_playlists` (`playlist`),
  KEY `FK__gacha_songs` (`song`),
  CONSTRAINT `FK__gacha_playlists` FOREIGN KEY (`playlist`) REFERENCES `gacha_playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__gacha_songs` FOREIGN KEY (`song`) REFERENCES `gacha_songs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.gacha_playlist_songs: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_playlist_songs`;
INSERT INTO `gacha_playlist_songs` (`id`, `playlist`, `song`) VALUES
	(3, 2, 3),
	(4, 2, 4),
	(5, 1, 1),
	(6, 2, 5),
	(7, 3, 6),
	(8, 2, 6),
	(10, 2, 7),
	(11, 4, 8),
	(13, 5, 9),
	(14, 6, 10),
	(15, 7, 11),
	(16, 8, 12),
	(17, 9, 11);

-- tablo yapısı dökülüyor elused.gacha_songs
CREATE TABLE IF NOT EXISTS `gacha_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '0',
  `author` varchar(50) NOT NULL DEFAULT '0',
  `maxDuration` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.gacha_songs: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_songs`;
INSERT INTO `gacha_songs` (`id`, `url`, `name`, `author`, `maxDuration`) VALUES
	(1, 'ZpHD-EvJPRw', 'ER TURAN - TÜRK KANI (Türkiye Türkçesiyle)', 'gokturkthefilm', 290),
	(2, '-7cGOnFH0Kc', 'Alışamadım - Aytaç Doğan Kanun Performansı', 'Kaan Erişik', 300),
	(3, 'mq7bd-9_N58', 'The Myth Theme Song "Endless Love" Jackie Chan & Kim Hee Sun - 美麗的神話 - 成龍', 'AylluRecords', 267),
	(4, '8CadnxQnMIA', 'Transformers Medley | Imperial Orchestra', 'Imperial Orchestra', 493),
	(5, 'VFavRtSz9-E', 'TURAN - DOMBYRA / music by Arslanbek Sultanbek', 'TURAN ethno-folk ensemble', 301),
	(6, 'MdLII-xyLFI', 'Hani Gökbörü? | Bozkurt Nerede?', 'Emintzsche', 393),
	(7, 'yPsUxLLeV1E', 'ARSLANBEK SULTANBEKOV - DOMBRA', 'Emre Aktürk', 206),
	(8, 'S9bCLPwzSC0', 'Eminem - Mockingbird [Official Music Video]', 'EminemVEVO', 258),
	(9, 'Da2Uz-3QAsI', 'Yung Şaban - Green Gang (Official Music Video) (VORP)', 'TwitchRP', 0),
	(10, 'reJDxJ66Bgs', 'Azer Bülbül - Dünyam Dönüyor Tersine (Trap Remix) w/@EmirhanTurans', 'Arabesk Remixci', 152),
	(11, '7evT2yiA2uA', 'Yung Şaban - Green Gang (Official Audio)', 'Yung Şaban', 113),
	(12, 'jg-K_M_JzPM', 'Up In', 'Aykut Closer - Topic', 169);

-- tablo yapısı dökülüyor elused.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.gloveboxitems: ~44 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gloveboxitems`;
INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(103, '1JQ494ON', '[]'),
	(214, '28WQR314', '[]'),
	(84, '2ZH856PP', '[]'),
	(163, '3PK726PO', '[{"label":"Araç Anahtarı","amount":1,"info":{"plate":"7UU531RN","model":"Pegassi Bati 801","lock":4322},"weight":0,"type":"item","name":"vehiclekey","unique":true,"slot":1,"useable":true,"image":"carkey.png"},{"label":"Araç Anahtarı","amount":1,"info":{"plate":"8WH393JB","model":"Pegassi Bati 801","lock":4322},"weight":0,"type":"item","name":"vehiclekey","unique":true,"slot":2,"useable":true,"image":"carkey.png"}]'),
	(225, '43GLP495', '[]'),
	(217, '44UIW143', '[]'),
	(207, '61PTI046', '[]'),
	(125, '64AFY955', '[]'),
	(71, '67XDM645', '[]'),
	(93, '6GU752TV', '[]'),
	(162, '7UU531RN', '[]'),
	(220, '83VMI443', '[]'),
	(35, '86XFC839', '[]'),
	(157, '8WH393JB', '[]'),
	(142, '9NT171QP', '[]'),
	(206, 'AWGB8302', '[]'),
	(204, 'AXHU7828', '[]'),
	(213, 'FBWWAAOE', '[]'),
	(212, 'HTNK1061', '[]'),
	(201, 'PD  1475', '[]'),
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
	(224, 'PD  9049', '[{"weight":10,"info":[],"label":"Boş Teneke","useable":false,"image":"can.png","slot":1,"amount":1,"type":"item","name":"can","unique":false}]'),
	(75, 'PD  9490', '[]'),
	(80, 'PD  9669', '[]'),
	(202, 'QBDT3074', '[]'),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.houselocations: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `houselocations`;
INSERT INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `tier`, `garage`) VALUES
	(4, 'grove st2', 'Grove St 2', '{"cam":{"x":118.3388442993164,"z":21.32347297668457,"y":-1921.110107421875,"h":253.3255615234375,"yaw":-10.0},"enter":{"h":253.3255615234375,"x":118.3388442993164,"z":21.32347297668457,"y":-1921.110107421875}}', 1, 21, 3, NULL),
	(5, 'grove st3', 'Grove St 3', '{"enter":{"z":21.40742874145507,"h":329.59478759765627,"x":100.8169174194336,"y":-1912.144775390625},"cam":{"yaw":-10.0,"x":100.8169174194336,"y":-1912.144775390625,"z":21.40742874145507,"h":329.59478759765627}}', 1, 100000000, 3, NULL);

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
DELETE FROM `house_plants`;

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
DELETE FROM `instagram_account`;

-- tablo yapısı dökülüyor elused.instagram_followers
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.instagram_followers: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `instagram_followers`;

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
DELETE FROM `instagram_posts`;

-- tablo yapısı dökülüyor elused.instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- elused.instagram_stories: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `instagram_stories`;

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
DELETE FROM `insta_stories`;

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
DELETE FROM `lapraces`;

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
DELETE FROM `logs`;

-- tablo yapısı dökülüyor elused.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.management_funds: ~13 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `management_funds`;
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 56000, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang'),
	(37, 'mechanic5', 50100, 'boss');

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
DELETE FROM `management_outfits`;

-- tablo yapısı dökülüyor elused.mdt_config
CREATE TABLE IF NOT EXISTS `mdt_config` (
  `citizenid` varchar(10) NOT NULL,
  `theme` int(11) NOT NULL,
  `sidebar` int(11) NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_config: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `mdt_config`;
INSERT INTO `mdt_config` (`citizenid`, `theme`, `sidebar`) VALUES
	('BMS02698', 0, 1),
	('DXH34648', 1, 1),
	('QUZ31879', 1, 1),
	('XBQ11226', 1, 1);

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
DELETE FROM `mdt_evidences`;

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
DELETE FROM `mdt_incidents`;

-- tablo yapısı dökülüyor elused.mdt_profiles
CREATE TABLE IF NOT EXISTS `mdt_profiles` (
  `citizenid` varchar(10) NOT NULL,
  `notes` text NOT NULL,
  `image` text NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_profiles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `mdt_profiles`;
INSERT INTO `mdt_profiles` (`citizenid`, `notes`, `image`) VALUES
	('DFK22197', '', '');

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
DELETE FROM `mdt_reports`;

-- tablo yapısı dökülüyor elused.mdt_vehicles
CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
  `plate` varchar(10) NOT NULL,
  `image` text NOT NULL,
  `notes` text NOT NULL,
  UNIQUE KEY `plate` (`plate`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- elused.mdt_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `mdt_vehicles`;

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
DELETE FROM `mdt_warrants`;

-- tablo yapısı dökülüyor elused.multichars_slots
CREATE TABLE IF NOT EXISTS `multichars_slots` (
  `identifier` varchar(60) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.multichars_slots: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `multichars_slots`;

-- tablo yapısı dökülüyor elused.npwd_calls
CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `isAnonymous` tinyint(4) NOT NULL DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_calls: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_calls`;
INSERT INTO `npwd_calls` (`id`, `identifier`, `transmitter`, `receiver`, `is_accepted`, `isAnonymous`, `start`, `end`) VALUES
	(1, '656265c1-f293-480b-8a72-2d2e32c5d17c', '429841', '820532', 0, 1, '1705866148', '1705866153'),
	(2, '3cfa6eab-b92a-45b0-bf57-3fa794327b3d', '429841', '820532', 0, 1, '1705867253', '1705867259'),
	(3, 'fcb43f74-d32d-4591-b6dc-7b8bf8a6482a', '429841', '820532', 1, 1, '1705867302', '1705867418'),
	(4, 'a02f098e-4b06-4c1c-9fba-b6ab9b82307f', '429841', '820532', 0, 1, '1705867522', '1705867525'),
	(5, '8c0cc840-7a5e-44f2-805f-bb82d7dc941d', '820532', '429841', 0, 0, '1705867533', '1705867536'),
	(6, 'a57346bd-e2de-4a88-8a92-43a1006fd4f8', '429841', '820532', 1, 1, '1705867538', '1705867581'),
	(7, '2a4a374e-9d46-4d99-b255-69c5655b3499', '820532', '429841', 0, 0, '1705867538', '1705867539'),
	(8, '43394998-93e8-4171-ab6d-b4cb4b153dc4', '738822', '820532', 0, 0, '1706186344', '1706186354');

-- tablo yapısı dökülüyor elused.npwd_crypto_transactions
CREATE TABLE IF NOT EXISTS `npwd_crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `worth` float DEFAULT NULL,
  `sentTo` varchar(20) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_crypto_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_crypto_transactions`;

-- tablo yapısı dökülüyor elused.npwd_darkchat_channels
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_darkchat_channels: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_darkchat_channels`;
INSERT INTO `npwd_darkchat_channels` (`id`, `channel_identifier`, `label`) VALUES
	(22, '123', '123'),
	(23, 'altıngemi', 'altıngemi');

-- tablo yapısı dökülüyor elused.npwd_darkchat_channel_members
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_darkchat_channel_members: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_darkchat_channel_members`;
INSERT INTO `npwd_darkchat_channel_members` (`channel_id`, `user_identifier`, `is_owner`) VALUES
	(22, 'XBQ11226', 1),
	(22, 'BMS02698', 0),
	(23, 'XBQ11226', 1);

-- tablo yapısı dökülüyor elused.npwd_darkchat_messages
CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_darkchat_messages: ~9 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_darkchat_messages`;
INSERT INTO `npwd_darkchat_messages` (`id`, `channel_id`, `message`, `user_identifier`, `createdAt`, `is_image`) VALUES
	(34, 22, '31', 'BMS02698', '2024-01-22 16:46:09', 0),
	(35, 22, 'uuuu', 'XBQ11226', '2024-01-22 16:46:12', 0),
	(36, 22, 'U', 'BMS02698', '2024-01-22 16:46:17', 0),
	(37, 22, '\nU', 'BMS02698', '2024-01-22 16:46:17', 0),
	(38, 22, '\nU', 'BMS02698', '2024-01-22 16:46:17', 0),
	(39, 22, '\nU', 'BMS02698', '2024-01-22 16:46:18', 0),
	(40, 22, '\nU', 'BMS02698', '2024-01-22 16:46:18', 0),
	(41, 22, '\nU', 'BMS02698', '2024-01-22 16:46:18', 0),
	(42, 22, 'https://r2.fivemanage.com/images/3wsL6qSupMBr.webp', 'XBQ11226', '2024-01-22 16:46:19', 1),
	(43, 22, 'https://r2.fivemanage.com/images/X7XNdSZHdIg8.webp', 'BMS02698', '2024-01-22 16:46:40', 1),
	(44, 23, 'anonim chat', 'XBQ11226', '2024-01-23 01:34:13', 0);

-- tablo yapısı dökülüyor elused.npwd_marketplace_listings
CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_marketplace_listings: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_marketplace_listings`;

-- tablo yapısı dökülüyor elused.npwd_match_profiles
CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_match_profiles: ~23 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_match_profiles`;
INSERT INTO `npwd_match_profiles` (`id`, `identifier`, `name`, `image`, `bio`, `location`, `job`, `tags`, `voiceMessage`, `createdAt`, `updatedAt`) VALUES
	(1, 'XBQ11226', 'Vidarr Odinson', 'https://r2.fivemanage.com/images/3wsL6qSupMBr.webp', '', '', '', '', NULL, '2024-01-21 00:22:19', '2024-01-21 19:24:57'),
	(2, 'BMS02698', 'VADM CANTAS', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-21 19:40:43', '2024-01-21 19:40:43'),
	(3, 'FYH40953', 'Charles Roda', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-21 20:28:45', '2024-01-21 20:28:45'),
	(4, 'BIK10757', 'max schmitt', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-25 12:52:18', '2024-01-25 12:52:18'),
	(5, 'HGO75866', 'Tommy Edison', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-27 13:26:50', '2024-01-27 13:26:50'),
	(6, 'HTB94113', 'Arthur Morgan', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-27 13:34:38', '2024-01-27 13:34:38'),
	(7, 'MCV49941', 'Luis Miller', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-27 13:36:08', '2024-01-27 13:36:08'),
	(8, 'RQT13252', 'BYK MOTOVLOG', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-31 10:27:34', '2024-01-31 10:27:34'),
	(9, 'XRK76375', 'Daryl Crannell', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-31 14:21:55', '2024-01-31 14:21:55'),
	(10, 'UQL52088', 'Abdulkadir Nanealan', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-31 15:59:45', '2024-01-31 15:59:45'),
	(11, 'DXH34648', 'Walter Black', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-31 17:40:29', '2024-01-31 17:40:29'),
	(12, 'JGI72397', 'Vidarr Odinson', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-31 18:56:39', '2024-01-31 18:56:39'),
	(13, 'KLG51886', 'Vidarr Odinson', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-31 19:39:13', '2024-01-31 19:39:13'),
	(14, 'CMW31394', 'Vidarr Odinson', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-01-31 20:20:51', '2024-01-31 20:20:51'),
	(15, 'SRK03290', 'Lucifer henderson', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-01 14:02:33', '2024-02-01 14:02:33'),
	(16, 'CDR37384', 'Swex Toe', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-01 14:05:18', '2024-02-01 14:05:18'),
	(17, 'ARR98822', 'Sabri soyan', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-01 14:42:26', '2024-02-01 14:42:26'),
	(18, 'RZP73312', 'Sabri soyan', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-01 14:54:54', '2024-02-01 14:54:54'),
	(19, 'PAE72962', 'V A', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-01 15:35:06', '2024-02-01 15:35:06'),
	(20, 'DFK22197', 'Luis Miller', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-01 17:50:14', '2024-02-01 17:50:14'),
	(21, 'WZB65598', 'Sabri soyan', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-01 20:28:23', '2024-02-01 20:28:23'),
	(22, 'JXV15913', 'a a', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-02 02:10:24', '2024-02-02 02:10:24'),
	(23, 'SEV41363', 'AHJME SDFDFSDFSSSDFDSF', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-02 15:01:08', '2024-02-02 15:01:08'),
	(24, 'RNG21283', 'Arthur Morgan', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-02 15:05:52', '2024-02-02 15:05:52'),
	(25, 'EUN05205', 'rekzy capone', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2024-02-02 20:06:17', '2024-02-02 20:06:17');

-- tablo yapısı dökülüyor elused.npwd_match_views
CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_match_views: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_match_views`;
INSERT INTO `npwd_match_views` (`id`, `identifier`, `profile`, `liked`, `createdAt`, `updatedAt`) VALUES
	(1, 'XBQ11226', 3, 1, '2024-01-23 01:17:27', '2024-01-23 01:17:27'),
	(2, 'XBQ11226', 2, 1, '2024-01-23 01:17:28', '2024-01-23 01:17:28'),
	(3, 'FYH40953', 2, 1, '2024-01-25 12:36:56', '2024-01-25 12:36:56'),
	(4, 'FYH40953', 1, 1, '2024-01-25 12:36:58', '2024-01-25 12:36:58'),
	(5, 'WZB65598', 17, 1, '2024-02-01 20:34:01', '2024-02-01 20:34:01');

-- tablo yapısı dökülüyor elused.npwd_messages
CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `user_identifier` varchar(48) NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_messages: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_messages`;
INSERT INTO `npwd_messages` (`id`, `message`, `user_identifier`, `conversation_id`, `isRead`, `createdAt`, `updatedAt`, `visible`, `author`, `is_embed`, `embed`) VALUES
	(3, 'tefon calıyor mu', 'BMS02698', '1', 0, '2024-01-21 20:01:05', '2024-01-21 20:01:05', 1, '429841', 0, ''),
	(4, 'konuşuyon mu', 'BMS02698', '1', 0, '2024-01-21 20:01:56', '2024-01-21 20:01:56', 1, '429841', 0, ''),
	(5, 'Naber yavrum', 'XBQ11226', '2', 0, '2024-01-25 12:37:19', '2024-01-25 12:37:19', 1, '820532', 0, ''),
	(6, 'fıstık gibisin', 'XBQ11226', '2', 0, '2024-01-25 12:37:21', '2024-01-25 12:37:21', 1, '820532', 0, ''),
	(7, 'tinderda', 'XBQ11226', '2', 0, '2024-01-25 12:37:23', '2024-01-25 12:37:23', 1, '820532', 0, ''),
	(8, 'Oturturum', 'FYH40953', '2', 0, '2024-01-25 12:37:28', '2024-01-25 12:37:28', 1, '738822', 0, ''),
	(9, 'Location shared', 'XBQ11226', '2', 0, '2024-01-25 12:38:17', '2024-01-25 12:38:17', 1, '820532', 1, '{"type":"location","coords":[-346.29888916015625,-39.67911911010742,48.859375],"phoneNumber":"820532"}');

-- tablo yapısı dökülüyor elused.npwd_messages_conversations
CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_messages_conversations: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_messages_conversations`;
INSERT INTO `npwd_messages_conversations` (`id`, `conversation_list`, `label`, `createdAt`, `updatedAt`, `last_message_id`, `is_group_chat`) VALUES
	(1, '429841+820532', '', '2024-01-21 20:00:11', '2024-01-21 20:01:56', NULL, 0),
	(2, '738822+820532', '', '2024-01-25 12:37:13', '2024-01-25 12:38:17', NULL, 0);

-- tablo yapısı dökülüyor elused.npwd_messages_participants
CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_messages_participants: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_messages_participants`;
INSERT INTO `npwd_messages_participants` (`id`, `conversation_id`, `participant`, `unread_count`) VALUES
	(1, 1, '429841', 0),
	(3, 1, '820532', 0),
	(4, 2, '738822', 3),
	(5, 2, '820532', 0);

-- tablo yapısı dökülüyor elused.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_notes: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_notes`;
INSERT INTO `npwd_notes` (`id`, `identifier`, `title`, `content`) VALUES
	(1, 'BMS02698', 'sa', 'sa'),
	(2, 'BMS02698', 'assaasasasas', 'sasaasasasasasasasasasasas'),
	(3, 'FYH40953', 'asdsada', 'dasdadsa');

-- tablo yapısı dökülüyor elused.npwd_phone_contacts
CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_phone_contacts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_phone_contacts`;
INSERT INTO `npwd_phone_contacts` (`id`, `identifier`, `avatar`, `number`, `display`) VALUES
	(1, 'XBQ11226', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '429841', 'Arda');

-- tablo yapısı dökülüyor elused.npwd_phone_gallery
CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_phone_gallery: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_phone_gallery`;
INSERT INTO `npwd_phone_gallery` (`id`, `identifier`, `image`) VALUES
	(1, 'XBQ11226', 'https://r2.fivemanage.com/images/JktyySkvVJOb.webp'),
	(2, 'XBQ11226', 'https://r2.fivemanage.com/images/3wsL6qSupMBr.webp'),
	(3, 'FYH40953', 'https://r2.fivemanage.com/images/CO5LMERM5EB7.webp'),
	(4, 'BMS02698', 'https://r2.fivemanage.com/images/X7XNdSZHdIg8.webp'),
	(5, 'BMS02698', 'https://r2.fivemanage.com/images/EQCplUoGpQ7w.webp'),
	(6, 'FYH40953', 'https://r2.fivemanage.com/images/C6gqDW8JwA4G.webp'),
	(8, 'DXH34648', 'https://r2.fivemanage.com/images/PnDXrjjc43J3.webp'),
	(9, 'SRK03290', 'https://r2.fivemanage.com/images/J7rkllzCSWCp.webp'),
	(10, 'DFK22197', 'https://r2.fivemanage.com/images/UxHnlGm4CwXm.webp'),
	(11, 'DFK22197', 'https://r2.fivemanage.com/images/ycmXP4x641DX.webp'),
	(12, 'WZB65598', 'https://r2.fivemanage.com/images/X5Ql1OBLqtc2.webp'),
	(13, 'XRK76375', 'https://r2.fivemanage.com/images/4riIozs60UCV.webp');

-- tablo yapısı dökülüyor elused.npwd_twitter_likes
CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_twitter_likes: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_twitter_likes`;
INSERT INTO `npwd_twitter_likes` (`id`, `profile_id`, `tweet_id`) VALUES
	(3, 46, 9),
	(2, 46, 10);

-- tablo yapısı dökülüyor elused.npwd_twitter_profiles
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_twitter_profiles: ~18 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_twitter_profiles`;
INSERT INTO `npwd_twitter_profiles` (`id`, `profile_name`, `identifier`, `avatar_url`, `createdAt`, `updatedAt`) VALUES
	(1, 'Vidarr_Odinson', 'XBQ11226', 'https://r2.fivemanage.com/images/3wsL6qSupMBr.webp', '2024-01-21 00:22:19', '2024-01-21 19:22:01'),
	(2, 'VADM_CANTAS', 'BMS02698', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-21 19:40:43', '2024-01-21 19:40:43'),
	(3, 'Charles_Roda', 'FYH40953', 'https://r2.fivemanage.com/images/CO5LMERM5EB7.webp', '2024-01-21 20:28:45', '2024-01-22 15:40:47'),
	(4, 'max_schmitt', 'BIK10757', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-25 12:52:18', '2024-01-25 12:52:18'),
	(5, 'Tommy_Edison', 'HGO75866', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-27 13:26:50', '2024-01-27 13:26:50'),
	(6, 'Arthur_Morgan', 'HTB94113', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-27 13:34:38', '2024-01-27 13:34:38'),
	(7, 'Luis_Miller', 'MCV49941', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-27 13:36:08', '2024-01-27 13:36:08'),
	(8, 'BYK_MOTOVLOG', 'RQT13252', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-31 10:27:34', '2024-01-31 10:27:34'),
	(9, 'Daryl_Crannell', 'XRK76375', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-31 14:21:55', '2024-01-31 14:21:55'),
	(10, 'Abdulkadir_Nanealan', 'UQL52088', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-31 15:59:45', '2024-01-31 15:59:45'),
	(11, 'Walter_Black', 'DXH34648', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-01-31 17:40:29', '2024-01-31 17:40:29'),
	(36, 'Lucifer_henderson', 'SRK03290', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-02-01 14:02:33', '2024-02-01 14:02:33'),
	(37, 'Swex_Toe', 'CDR37384', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-02-01 14:05:18', '2024-02-01 14:05:18'),
	(38, 'Sabri_soyan', 'ARR98822', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-02-01 14:42:26', '2024-02-01 14:42:26'),
	(43, 'V_A', 'PAE72962', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-02-01 15:35:06', '2024-02-01 15:35:06'),
	(46, 'Sabri soyan', 'WZB65598', 'https://r2.fivemanage.com/images/X5Ql1OBLqtc2.webp', '2024-02-01 20:32:52', '2024-02-01 20:33:35'),
	(50, 'a_a', 'JXV15913', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-02-02 02:10:24', '2024-02-02 02:10:24'),
	(51, 'AHJME_SDFDFSDFSSSDFDSF', 'SEV41363', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-02-02 15:01:08', '2024-02-02 15:01:08'),
	(55, 'rekzy_capone', 'EUN05205', 'https://i.fivemanage.com/images/3ClWwmpwkFhL.png', '2024-02-02 20:06:17', '2024-02-02 20:06:17');

-- tablo yapısı dökülüyor elused.npwd_twitter_reports
CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_twitter_reports: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_twitter_reports`;

-- tablo yapısı dökülüyor elused.npwd_twitter_tweets
CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_twitter_tweets: ~11 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_twitter_tweets`;
INSERT INTO `npwd_twitter_tweets` (`id`, `message`, `createdAt`, `updatedAt`, `likes`, `identifier`, `visible`, `images`, `retweet`, `profile_id`) VALUES
	(1, 'test', '2024-01-21 00:41:10', '2024-01-21 00:41:12', 0, 'XBQ11226', 1, '', NULL, 1),
	(2, '@Vidarr_Odinson  aaa', '2024-01-21 00:41:16', '2024-01-21 00:41:16', 0, 'XBQ11226', 1, '', NULL, 1),
	(3, 'test', '2024-01-21 19:20:19', '2024-01-21 19:20:19', 0, 'XBQ11226', 1, '', NULL, 1),
	(4, 'aaa', '2024-01-21 19:20:33', '2024-01-21 19:20:33', 0, 'XBQ11226', 1, 'https://r2.fivemanage.com/images/JktyySkvVJOb.webp', NULL, 1),
	(5, 'new pp hayırlı olsun', '2024-01-21 19:21:50', '2024-01-21 19:21:50', 0, 'XBQ11226', 1, '', NULL, 1),
	(6, 'test', '2024-01-21 19:22:06', '2024-01-21 19:22:06', 0, 'XBQ11226', 1, '', NULL, 1),
	(7, 'sa', '2024-01-22 15:40:23', '2024-01-22 15:40:23', 0, 'FYH40953', 1, '', NULL, 3),
	(8, 'as', '2024-01-22 15:40:56', '2024-01-22 15:40:56', 0, 'FYH40953', 1, '', NULL, 3),
	(9, 'Sabri iniş yaptı', '2024-02-01 20:33:17', '2024-02-01 20:35:06', 1, 'WZB65598', 1, '', NULL, 46),
	(10, 'Sabi soyan geliyor şehir zazırlan', '2024-02-01 20:35:00', '2024-02-01 20:35:05', 1, 'WZB65598', 1, 'https://r2.fivemanage.com/images/X5Ql1OBLqtc2.webp', NULL, 46),
	(11, 'iyah', '2024-02-02 11:06:11', '2024-02-02 11:06:11', 0, 'HGO75866', 1, '', NULL, 5),
	(12, 'Daryl BABAAAA', '2024-02-02 14:53:04', '2024-02-02 14:53:04', 0, 'XRK76375', 1, 'https://r2.fivemanage.com/images/4riIozs60UCV.webp', NULL, 9),
	(13, 'daryl baban benim', '2024-02-02 14:53:29', '2024-02-02 14:53:29', 0, 'WZB65598', 1, '', NULL, 46);

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
DELETE FROM `occasion_vehicles`;

-- tablo yapısı dökülüyor elused.pefcl_accounts
CREATE TABLE IF NOT EXISTS `pefcl_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT 0,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int(11) DEFAULT 25000,
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `number_2` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.pefcl_accounts: ~28 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_accounts`;
INSERT INTO `pefcl_accounts` (`id`, `number`, `accountName`, `isDefault`, `ownerIdentifier`, `role`, `balance`, `type`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
	(1, '920,3082-0242-1331', 'Personal account', 1, 'XBQ11226', 'owner', 72018, 'personal', '2024-01-25 11:36:09', '2024-01-25 20:05:07', NULL),
	(2, '920,8847-1380-3734', 'Personal account', 1, 'FYH40953', 'owner', 999990530, 'personal', '2024-01-25 12:10:06', '2024-01-25 15:10:39', NULL),
	(3, '920,5252-1608-0503', 'Los Santos Police', 1, 'police', 'owner', 500, 'shared', '2024-01-25 12:17:01', '2024-01-25 12:17:01', NULL),
	(4, '920,5031-2181-0736', 'Personal account', 1, 'BIK10757', 'owner', 4860, 'personal', '2024-01-25 12:52:18', '2024-01-25 13:00:56', NULL),
	(5, '920,6833-0702-3822', 'BALLAS', 0, 'XBQ11226', 'owner', 1500, 'shared', '2024-01-25 15:05:24', '2024-01-25 15:07:16', NULL),
	(6, '920,1201-0437-3322', 'test', 0, 'XBQ11226', 'owner', 500, 'personal', '2024-01-25 15:06:32', '2024-01-25 15:06:32', NULL),
	(7, '920,5755-0448-2243', 'Personal account', 1, 'BMS02698', 'owner', 179969, 'personal', '2024-01-25 18:15:27', '2024-02-02 00:13:00', NULL),
	(8, '920,5110-2000-3411', 'Personal account', 1, 'HGO75866', 'owner', 1630, 'personal', '2024-01-27 13:26:49', '2024-02-03 13:27:21', NULL),
	(9, '920,5807-0014-2857', 'Personal account', 1, 'HTB94113', 'owner', 2860, 'personal', '2024-01-27 13:34:38', '2024-01-27 13:44:28', NULL),
	(10, '920,4701-2780-2710', 'Personal account', 1, 'MCV49941', 'owner', 5000, 'personal', '2024-01-27 13:36:08', '2024-01-27 13:36:08', NULL),
	(11, '920,5145-1530-2845', 'Personal account', 1, 'RQT13252', 'owner', 5000, 'personal', '2024-01-31 10:27:34', '2024-01-31 10:27:34', NULL),
	(12, '920,4652-0222-1658', 'Personal account', 1, 'XRK76375', 'owner', 171518, 'personal', '2024-01-31 14:21:55', '2024-02-02 12:59:27', NULL),
	(13, '920,6331-2722-3441', 'Personal account', 1, 'UQL52088', 'owner', -120996301, 'personal', '2024-01-31 15:59:44', '2024-01-31 18:59:02', NULL),
	(14, '920,1645-1447-1578', 'Personal account', 1, 'DXH34648', 'owner', 1005000, 'personal', '2024-01-31 17:40:29', '2024-02-01 18:59:52', NULL),
	(15, '920,2507-0051-1454', 'Personal account', 1, 'JGI72397', 'owner', 5000, 'personal', '2024-01-31 18:56:39', '2024-01-31 18:56:39', NULL),
	(16, '920,6141-3347-1118', 'Personal account', 1, 'KLG51886', 'owner', 5000, 'personal', '2024-01-31 19:39:12', '2024-01-31 19:39:12', NULL),
	(17, '920,2438-3851-1072', 'Personal account', 1, 'CMW31394', 'owner', 5020, 'personal', '2024-01-31 20:20:50', '2024-02-01 13:04:30', NULL),
	(18, '920,4516-1212-2135', 'Personal account', 1, 'SRK03290', 'owner', 5000, 'personal', '2024-02-01 14:02:32', '2024-02-01 14:02:32', NULL),
	(19, '920,7027-3554-2043', 'Personal account', 1, 'CDR37384', 'owner', 3510, 'personal', '2024-02-01 14:05:18', '2024-02-03 13:20:40', NULL),
	(20, '920,3648-2533-3130', 'Personal account', 1, 'ARR98822', 'owner', 5000, 'personal', '2024-02-01 14:42:26', '2024-02-01 14:42:26', NULL),
	(21, '920,7615-1355-2738', 'Personal account', 1, 'RZP73312', 'owner', 5000, 'personal', '2024-02-01 14:54:54', '2024-02-01 14:54:54', NULL),
	(22, '920,2746-1876-0323', 'Personal account', 1, 'PAE72962', 'owner', 49060, 'personal', '2024-02-01 15:35:06', '2024-02-02 23:27:01', NULL),
	(23, '920,2622-2042-3860', 'Personal account', 1, 'DFK22197', 'owner', 5000, 'personal', '2024-02-01 17:50:13', '2024-02-01 17:50:13', NULL),
	(24, '920,8341-1410-2465', 'Personal account', 1, 'WZB65598', 'owner', 5000, 'personal', '2024-02-01 20:28:23', '2024-02-01 20:28:23', NULL),
	(25, '920,8850-3556-3765', 'Personal account', 1, 'JXV15913', 'owner', 5000, 'personal', '2024-02-02 02:10:24', '2024-02-02 02:10:24', NULL),
	(26, '920,1272-3080-3503', 'Los Santos EMS', 1, 'ambulance', 'owner', 500, 'shared', '2024-02-02 12:07:35', '2024-02-02 12:07:35', NULL),
	(27, '920,4048-3812-2826', 'Personal account', 1, 'SEV41363', 'owner', 5000, 'personal', '2024-02-02 15:01:08', '2024-02-02 15:01:08', NULL),
	(28, '920,0248-1854-0237', 'Personal account', 1, 'RNG21283', 'owner', 4560, 'personal', '2024-02-02 15:05:52', '2024-02-02 20:39:39', NULL),
	(29, '920,8533-0380-0556', 'Personal account', 1, 'EUN05205', 'owner', 5000, 'personal', '2024-02-02 20:06:17', '2024-02-02 20:06:17', NULL);

-- tablo yapısı dökülüyor elused.pefcl_cash
CREATE TABLE IF NOT EXISTS `pefcl_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT 2000,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.pefcl_cash: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_cash`;

-- tablo yapısı dökülüyor elused.pefcl_external_accounts
CREATE TABLE IF NOT EXISTS `pefcl_external_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.pefcl_external_accounts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_external_accounts`;

-- tablo yapısı dökülüyor elused.pefcl_invoices
CREATE TABLE IF NOT EXISTS `pefcl_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.pefcl_invoices: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_invoices`;

-- tablo yapısı dökülüyor elused.pefcl_shared_accounts
CREATE TABLE IF NOT EXISTS `pefcl_shared_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIdentifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'contributor',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `pefcl_shared_accounts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.pefcl_shared_accounts: ~9 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_shared_accounts`;
INSERT INTO `pefcl_shared_accounts` (`id`, `userIdentifier`, `name`, `role`, `createdAt`, `updatedAt`, `deletedAt`, `accountId`) VALUES
	(2, 'FYH40953', 'Charles Roda', 'admin', '2024-01-25 12:17:27', '2024-01-25 12:17:27', NULL, 3),
	(3, 'XBQ11226', 'Vidarr Odinson', 'owner', '2024-01-25 15:05:24', '2024-01-25 15:05:24', NULL, 5),
	(5, 'BMS02698', 'VADİM  CANTAS', 'admin', '2024-01-30 23:34:54', '2024-01-30 23:34:54', NULL, 3),
	(6, 'CMW31394', 'Vidarr Odinson', 'admin', '2024-01-31 20:24:19', '2024-01-31 20:24:19', NULL, 3),
	(7, 'HGO75866', 'Tommy Edison', 'admin', '2024-02-01 14:37:39', '2024-02-01 14:37:39', NULL, 3),
	(8, 'XRK76375', 'Daryl Crannell', 'admin', '2024-02-01 18:54:13', '2024-02-01 18:54:13', NULL, 3),
	(9, 'DXH34648', 'Walter Black', 'admin', '2024-02-01 19:12:53', '2024-02-01 19:12:53', NULL, 3),
	(10, 'CDR37384', 'Swex  Toe', 'admin', '2024-02-01 19:18:38', '2024-02-01 19:18:38', NULL, 3),
	(11, 'PAE72962', 'V A', 'admin', '2024-02-01 22:15:47', '2024-02-01 22:15:47', NULL, 3);

-- tablo yapısı dökülüyor elused.pefcl_transactions
CREATE TABLE IF NOT EXISTS `pefcl_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `type` varchar(255) DEFAULT 'Outgoing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `toAccountId` int(11) DEFAULT NULL,
  `fromAccountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAccountId` (`toAccountId`),
  KEY `fromAccountId` (`fromAccountId`),
  CONSTRAINT `pefcl_transactions_ibfk_1` FOREIGN KEY (`toAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pefcl_transactions_ibfk_2` FOREIGN KEY (`fromAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.pefcl_transactions: ~153 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_transactions`;
INSERT INTO `pefcl_transactions` (`id`, `message`, `amount`, `type`, `createdAt`, `updatedAt`, `toAccountId`, `fromAccountId`) VALUES
	(1, 'Withdrew 500 from an ATM. #1', 500, 'Outgoing', '2024-01-25 11:36:35', '2024-01-25 11:36:35', NULL, 1),
	(2, 'Withdrew 500 from an ATM. #2', 500, 'Outgoing', '2024-01-25 11:36:36', '2024-01-25 11:36:36', NULL, 1),
	(3, 'Withdrew 500 from an ATM. #3', 500, 'Outgoing', '2024-01-25 11:36:37', '2024-01-25 11:36:37', NULL, 1),
	(4, 'Withdrew 500 from an ATM. #4', 500, 'Outgoing', '2024-01-25 11:36:38', '2024-01-25 11:36:38', NULL, 1),
	(5, 'Withdrew 500 from an ATM. #5', 500, 'Outgoing', '2024-01-25 11:36:38', '2024-01-25 11:36:38', NULL, 1),
	(6, 'Withdrew 500 from an ATM. #6', 500, 'Outgoing', '2024-01-25 11:36:39', '2024-01-25 11:36:39', NULL, 1),
	(7, 'Withdrew 500 from an ATM. #7', 500, 'Outgoing', '2024-01-25 11:36:39', '2024-01-25 11:36:39', NULL, 1),
	(8, 'Withdrew 500 from an ATM. #8', 500, 'Outgoing', '2024-01-25 11:36:40', '2024-01-25 11:36:40', NULL, 1),
	(9, 'Withdrew 7500 from an ATM. #9', 7500, 'Outgoing', '2024-01-25 11:36:46', '2024-01-25 11:36:46', NULL, 1),
	(10, 'Withdrew 7500 from an ATM. #10', 7500, 'Outgoing', '2024-01-25 11:36:48', '2024-01-25 11:36:48', NULL, 1),
	(11, 'Withdrew 7500 from an ATM. #11', 7500, 'Outgoing', '2024-01-25 11:36:49', '2024-01-25 11:36:49', NULL, 1),
	(12, 'Withdrew 7500 from an ATM. #12', 7500, 'Outgoing', '2024-01-25 12:02:34', '2024-01-25 12:02:34', NULL, 1),
	(13, 'Deposited $221,505 into account. #13', 221505, 'Incoming', '2024-01-25 12:03:02', '2024-01-25 12:03:02', 1, NULL),
	(14, 'Deposited $45 into account. #14', 45, 'Incoming', '2024-01-25 12:03:07', '2024-01-25 12:03:07', 1, NULL),
	(15, 'unknown #15', 10, 'Incoming', '2024-01-25 12:03:23', '2024-01-25 12:03:23', 1, NULL),
	(16, 'Withdrew $1 from account. #16', 1, 'Outgoing', '2024-01-25 12:04:48', '2024-01-25 12:04:48', NULL, 1),
	(17, 'paycheck #17', 10, 'Incoming', '2024-01-25 12:09:55', '2024-01-25 12:09:55', 1, NULL),
	(18, 'paycheck #18', 10000, 'Incoming', '2024-01-25 12:19:55', '2024-01-25 12:19:55', 1, NULL),
	(19, 'paycheck #19', 10000, 'Incoming', '2024-01-25 12:19:55', '2024-01-25 12:19:55', 2, NULL),
	(20, 'paycheck #20', 2500, 'Incoming', '2024-01-25 12:29:55', '2024-01-25 12:29:55', 1, NULL),
	(21, 'paycheck #21', 10000, 'Incoming', '2024-01-25 12:29:55', '2024-01-25 12:29:55', 2, NULL),
	(22, 'paycheck #22', 2500, 'Incoming', '2024-01-25 12:50:56', '2024-01-25 12:50:56', 1, NULL),
	(23, 'rent-car #23', 150, 'Outgoing', '2024-01-25 12:54:48', '2024-01-25 12:54:48', NULL, 4),
	(24, 'paycheck #24', 10, 'Incoming', '2024-01-25 13:00:56', '2024-01-25 13:00:56', 4, NULL),
	(25, 'paycheck #25', 2500, 'Incoming', '2024-01-25 13:00:56', '2024-01-25 13:00:56', 1, NULL),
	(26, 'paycheck #26', 2500, 'Incoming', '2024-01-25 13:10:56', '2024-01-25 13:10:56', 1, NULL),
	(27, 'paycheck #27', 2500, 'Incoming', '2024-01-25 14:50:56', '2024-01-25 14:50:56', 1, NULL),
	(28, 'paycheck #28', 10000, 'Incoming', '2024-01-25 14:50:56', '2024-01-25 14:50:56', 2, NULL),
	(29, 'Opened a new account #29', 1000, 'Outgoing', '2024-01-25 15:05:24', '2024-01-25 15:05:24', NULL, 1),
	(30, 'Opened a new account #30', 1000, 'Outgoing', '2024-01-25 15:06:32', '2024-01-25 15:06:32', NULL, 1),
	(31, 'Internal transfer #31', 1000, 'Transfer', '2024-01-25 15:07:16', '2024-01-25 15:07:16', 5, 1),
	(32, 'paycheck #32', 2500, 'Incoming', '2024-01-25 15:10:39', '2024-01-25 15:10:39', 1, NULL),
	(33, 'paycheck #33', 10000, 'Incoming', '2024-01-25 15:10:39', '2024-01-25 15:10:39', 2, NULL),
	(34, 'paycheck #34', 2500, 'Incoming', '2024-01-25 15:20:39', '2024-01-25 15:20:39', 1, NULL),
	(35, 'paycheck #35', 2500, 'Incoming', '2024-01-25 15:30:39', '2024-01-25 15:30:39', 1, NULL),
	(36, 'paycheck #36', 2500, 'Incoming', '2024-01-25 15:40:39', '2024-01-25 15:40:39', 1, NULL),
	(37, 'paycheck #37', 2500, 'Incoming', '2024-01-25 15:50:39', '2024-01-25 15:50:39', 1, NULL),
	(38, 'paycheck #38', 2500, 'Incoming', '2024-01-25 16:00:39', '2024-01-25 16:00:39', 1, NULL),
	(39, 'paycheck #39', 2500, 'Incoming', '2024-01-25 16:10:39', '2024-01-25 16:10:39', 1, NULL),
	(40, 'paycheck #40', 2500, 'Incoming', '2024-01-25 16:20:39', '2024-01-25 16:20:39', 1, NULL),
	(41, 'paycheck #41', 2500, 'Incoming', '2024-01-25 16:30:39', '2024-01-25 16:30:39', 1, NULL),
	(42, 'paycheck #42', 2500, 'Incoming', '2024-01-25 16:40:39', '2024-01-25 16:40:39', 1, NULL),
	(43, 'paycheck #43', 2500, 'Incoming', '2024-01-25 18:10:40', '2024-01-25 18:10:40', 1, NULL),
	(44, 'paycheck #44', 2500, 'Incoming', '2024-01-25 18:20:40', '2024-01-25 18:20:40', 1, NULL),
	(45, 'paycheck #45', 25, 'Incoming', '2024-01-25 18:30:40', '2024-01-25 18:30:40', 7, NULL),
	(46, 'paycheck #46', 2500, 'Incoming', '2024-01-25 18:30:40', '2024-01-25 18:30:40', 1, NULL),
	(47, 'paycheck #47', 2500, 'Incoming', '2024-01-25 18:40:40', '2024-01-25 18:40:40', 1, NULL),
	(48, 'paycheck #48', 25, 'Incoming', '2024-01-25 18:40:40', '2024-01-25 18:40:40', 7, NULL),
	(49, 'paycheck #49', 25, 'Incoming', '2024-01-25 18:50:40', '2024-01-25 18:50:40', 7, NULL),
	(50, 'paycheck #50', 25, 'Incoming', '2024-01-25 19:00:40', '2024-01-25 19:00:40', 7, NULL),
	(51, 'paycheck #51', 2500, 'Incoming', '2024-01-25 19:00:40', '2024-01-25 19:00:40', 1, NULL),
	(52, 'paycheck #52', 25, 'Incoming', '2024-01-25 19:10:40', '2024-01-25 19:10:40', 7, NULL),
	(53, 'paycheck #53', 2500, 'Incoming', '2024-01-25 19:10:40', '2024-01-25 19:10:40', 1, NULL),
	(54, 'paycheck #54', 25, 'Incoming', '2024-01-25 19:20:40', '2024-01-25 19:20:40', 7, NULL),
	(55, 'paycheck #55', 2500, 'Incoming', '2024-01-25 19:20:40', '2024-01-25 19:20:40', 1, NULL),
	(56, 'paycheck #56', 25, 'Incoming', '2024-01-25 19:30:40', '2024-01-25 19:30:40', 7, NULL),
	(57, 'paycheck #57', 2500, 'Incoming', '2024-01-25 19:30:40', '2024-01-25 19:30:40', 1, NULL),
	(58, 'paycheck #58', 25, 'Incoming', '2024-01-25 19:40:40', '2024-01-25 19:40:40', 7, NULL),
	(59, 'paycheck #59', 2500, 'Incoming', '2024-01-25 19:40:40', '2024-01-25 19:40:40', 1, NULL),
	(60, 'paycheck #60', 2500, 'Incoming', '2024-01-25 19:55:07', '2024-01-25 19:55:07', 1, NULL),
	(61, 'paycheck #61', 2500, 'Incoming', '2024-01-25 20:05:07', '2024-01-25 20:05:07', 1, NULL),
	(62, 'paycheck #62', 25, 'Incoming', '2024-01-26 17:13:36', '2024-01-26 17:13:36', 7, NULL),
	(63, 'paycheck #63', 10, 'Incoming', '2024-01-27 13:33:39', '2024-01-27 13:33:39', 8, NULL),
	(64, 'rent-car #64', 150, 'Outgoing', '2024-01-27 13:36:21', '2024-01-27 13:36:21', NULL, 9),
	(65, 'paycheck #65', 10, 'Incoming', '2024-01-27 13:43:39', '2024-01-27 13:43:39', 8, NULL),
	(66, 'paycheck #66', 10, 'Incoming', '2024-01-27 13:43:39', '2024-01-27 13:43:39', 9, NULL),
	(67, 'respawned-at-hospital #67', 2000, 'Outgoing', '2024-01-27 13:44:26', '2024-01-27 13:44:26', NULL, 8),
	(68, 'respawned-at-hospital #68', 2000, 'Outgoing', '2024-01-27 13:44:28', '2024-01-27 13:44:28', NULL, 9),
	(69, 'paycheck #69', 10, 'Incoming', '2024-01-27 13:53:39', '2024-01-27 13:53:39', 8, NULL),
	(70, 'paycheck #70', 10, 'Incoming', '2024-01-27 14:03:39', '2024-01-27 14:03:39', 8, NULL),
	(71, 'paycheck #71', 10, 'Incoming', '2024-01-27 14:13:39', '2024-01-27 14:13:39', 8, NULL),
	(72, 'paycheck #72', 25, 'Incoming', '2024-01-27 17:43:40', '2024-01-27 17:43:40', 7, NULL),
	(73, 'paycheck #73', 25, 'Incoming', '2024-01-27 17:53:40', '2024-01-27 17:53:40', 7, NULL),
	(74, 'paycheck #74', 25, 'Incoming', '2024-01-27 18:03:40', '2024-01-27 18:03:40', 7, NULL),
	(75, 'paycheck #75', 25, 'Incoming', '2024-01-27 18:13:40', '2024-01-27 18:13:40', 7, NULL),
	(76, 'paycheck #76', 25, 'Incoming', '2024-01-27 18:23:40', '2024-01-27 18:23:40', 7, NULL),
	(77, 'paycheck #77', 25, 'Incoming', '2024-01-30 22:43:52', '2024-01-30 22:43:52', 7, NULL),
	(78, 'paycheck #78', 25, 'Incoming', '2024-01-30 23:03:52', '2024-01-30 23:03:52', 7, NULL),
	(79, 'paycheck #79', 25, 'Incoming', '2024-01-30 23:13:52', '2024-01-30 23:13:52', 7, NULL),
	(80, 'paycheck #80', 25, 'Incoming', '2024-01-30 23:23:52', '2024-01-30 23:23:52', 7, NULL),
	(81, 'unknown #81', 10000, 'Outgoing', '2024-01-31 13:24:14', '2024-01-31 13:24:14', NULL, 7),
	(82, 'paycheck #82', 5000, 'Incoming', '2024-01-31 13:37:37', '2024-01-31 13:37:37', 7, NULL),
	(83, 'paycheck #83', 5000, 'Incoming', '2024-01-31 14:07:37', '2024-01-31 14:07:37', 7, NULL),
	(84, 'paycheck #84', 5000, 'Incoming', '2024-01-31 14:37:37', '2024-01-31 14:37:37', 7, NULL),
	(85, 'paycheck #85', 10, 'Incoming', '2024-01-31 14:37:37', '2024-01-31 14:37:37', 12, NULL),
	(86, 'paycheck #86', 5000, 'Incoming', '2024-01-31 15:07:37', '2024-01-31 15:07:37', 7, NULL),
	(87, 'paycheck #87', 5000, 'Incoming', '2024-01-31 15:37:37', '2024-01-31 15:37:37', 7, NULL),
	(88, 'rent-car #88', 300, 'Outgoing', '2024-01-31 16:06:34', '2024-01-31 16:06:34', NULL, 13),
	(89, 'bought-house #89', 121000001, 'Outgoing', '2024-01-31 18:49:01', '2024-01-31 18:49:01', NULL, 13),
	(90, 'bought-furniture #90', 300, 'Outgoing', '2024-01-31 18:54:33', '2024-01-31 18:54:33', NULL, 13),
	(91, 'bought-house #91', 26, 'Outgoing', '2024-01-31 18:56:05', '2024-01-31 18:56:05', NULL, 12),
	(92, 'bought-house #92', 26, 'Outgoing', '2024-01-31 18:56:07', '2024-01-31 18:56:07', NULL, 12),
	(93, 'bought-furniture #93', 700, 'Outgoing', '2024-01-31 18:59:02', '2024-01-31 18:59:02', NULL, 13),
	(94, 'paycheck #94', 10, 'Incoming', '2024-01-31 20:22:11', '2024-01-31 20:22:11', 17, NULL),
	(95, 'paycheck #95', 5000, 'Incoming', '2024-01-31 21:07:43', '2024-01-31 21:07:43', 17, NULL),
	(96, 'paycheck #96', 5000, 'Incoming', '2024-01-31 21:37:43', '2024-01-31 21:37:43', 17, NULL),
	(97, 'paycheck #97', 5000, 'Incoming', '2024-01-31 23:08:54', '2024-01-31 23:08:54', 17, NULL),
	(98, 'paycheck #98', 5000, 'Incoming', '2024-01-31 23:08:54', '2024-01-31 23:08:54', 7, NULL),
	(99, 'paycheck #99', 5000, 'Incoming', '2024-01-31 23:38:54', '2024-01-31 23:38:54', 7, NULL),
	(100, 'paycheck #100', 5000, 'Incoming', '2024-02-01 00:34:30', '2024-02-01 00:34:30', 7, NULL),
	(101, 'paycheck #101', 10, 'Incoming', '2024-02-01 00:34:30', '2024-02-01 00:34:30', 17, NULL),
	(102, 'paycheck #102', 10, 'Incoming', '2024-02-01 13:04:30', '2024-02-01 13:04:30', 17, NULL),
	(103, 'Withdrew 3000 from an ATM. #103', 3000, 'Outgoing', '2024-02-01 13:17:54', '2024-02-01 13:17:54', NULL, 12),
	(104, 'rent-car #104', 1500, 'Outgoing', '2024-02-01 14:14:38', '2024-02-01 14:14:38', NULL, 19),
	(105, 'rent-car #105', 1500, 'Outgoing', '2024-02-01 14:14:39', '2024-02-01 14:14:39', NULL, 19),
	(106, 'rent-car #106', 1500, 'Outgoing', '2024-02-01 14:16:00', '2024-02-01 14:16:00', NULL, 19),
	(107, 'vehicle-shop #107', 100000, 'Outgoing', '2024-02-01 14:19:33', '2024-02-01 14:19:33', NULL, 14),
	(108, 'vehicle-shop #108', 316000, 'Outgoing', '2024-02-01 14:23:32', '2024-02-01 14:23:32', NULL, 14),
	(109, 'vehicle-shop #109', 316000, 'Outgoing', '2024-02-01 14:24:49', '2024-02-01 14:24:49', NULL, 14),
	(110, 'vehicle-shop #110', 316000, 'Outgoing', '2024-02-01 14:25:53', '2024-02-01 14:25:53', NULL, 14),
	(111, 'vehicle-shop #111', 316000, 'Outgoing', '2024-02-01 14:27:47', '2024-02-01 14:27:47', NULL, 14),
	(112, 'vehicle-shop #112', 2200000, 'Outgoing', '2024-02-01 14:28:33', '2024-02-01 14:28:33', NULL, 14),
	(113, 'vehicle-shop #113', 2250000, 'Outgoing', '2024-02-01 14:29:49', '2024-02-01 14:29:49', NULL, 14),
	(114, 'rent-car #114', 10000, 'Outgoing', '2024-02-01 18:48:10', '2024-02-01 18:48:10', NULL, 22),
	(115, 'rent-car #115', 10000, 'Outgoing', '2024-02-01 18:49:14', '2024-02-01 18:49:14', NULL, 22),
	(116, 'rent-car #116', 10000, 'Outgoing', '2024-02-01 18:49:50', '2024-02-01 18:49:50', NULL, 22),
	(117, 'rent-car #117', 10000, 'Outgoing', '2024-02-01 18:50:42', '2024-02-01 18:50:42', NULL, 22),
	(118, 'rent-car #118', 10000, 'Outgoing', '2024-02-01 18:51:45', '2024-02-01 18:51:45', NULL, 22),
	(119, 'rent-car #119', 10000, 'Outgoing', '2024-02-01 18:54:33', '2024-02-01 18:54:33', NULL, 22),
	(120, 'rent-car #120', 10000, 'Outgoing', '2024-02-01 18:55:25', '2024-02-01 18:55:25', NULL, 22),
	(121, 'rent-car #121', 150, 'Outgoing', '2024-02-01 18:58:44', '2024-02-01 18:58:44', NULL, 22),
	(122, 'rent-car #122', 150, 'Outgoing', '2024-02-01 18:59:25', '2024-02-01 18:59:25', NULL, 22),
	(123, 'paycheck #123', 50, 'Incoming', '2024-02-01 18:59:52', '2024-02-01 18:59:52', 12, NULL),
	(124, 'paycheck #124', 5000, 'Incoming', '2024-02-01 18:59:52', '2024-02-01 18:59:52', 14, NULL),
	(125, 'paycheck #125', 10, 'Incoming', '2024-02-01 18:59:52', '2024-02-01 18:59:52', 22, NULL),
	(126, 'rent-car #126', 150, 'Outgoing', '2024-02-01 19:00:21', '2024-02-01 19:00:21', NULL, 22),
	(127, 'rent-car #127', 150, 'Outgoing', '2024-02-01 19:00:53', '2024-02-01 19:00:53', NULL, 22),
	(128, 'rent-car #128', 150, 'Outgoing', '2024-02-01 19:01:19', '2024-02-01 19:01:19', NULL, 22),
	(129, 'rent-car #129', 150, 'Outgoing', '2024-02-01 19:01:41', '2024-02-01 19:01:41', NULL, 22),
	(130, 'rent-car #130', 150, 'Outgoing', '2024-02-01 19:02:19', '2024-02-01 19:02:19', NULL, 22),
	(131, 'paycheck #131', 5000, 'Incoming', '2024-02-01 22:42:57', '2024-02-01 22:42:57', 22, NULL),
	(132, 'paycheck #132', 5000, 'Incoming', '2024-02-02 00:13:00', '2024-02-02 00:13:00', 7, NULL),
	(133, 'paycheck #133', 25, 'Incoming', '2024-02-02 00:43:00', '2024-02-02 00:43:00', 22, NULL),
	(134, 'paycheck #134', 50, 'Incoming', '2024-02-02 00:43:00', '2024-02-02 00:43:00', 12, NULL),
	(135, 'paycheck #135', 5000, 'Incoming', '2024-02-02 01:44:38', '2024-02-02 01:44:38', 12, NULL),
	(136, 'paycheck #136', 25, 'Incoming', '2024-02-02 05:33:26', '2024-02-02 05:33:26', 22, NULL),
	(137, 'paycheck #137', 25, 'Incoming', '2024-02-02 06:03:26', '2024-02-02 06:03:26', 22, NULL),
	(138, 'paycheck #138', 5000, 'Incoming', '2024-02-02 09:33:26', '2024-02-02 09:33:26', 8, NULL),
	(139, 'paycheck #139', 5000, 'Incoming', '2024-02-02 10:03:26', '2024-02-02 10:03:26', 8, NULL),
	(140, 'paycheck #140', 25, 'Incoming', '2024-02-02 10:03:26', '2024-02-02 10:03:26', 22, NULL),
	(141, 'sold-casino-chips #141', 975, 'Incoming', '2024-02-02 12:59:22', '2024-02-02 12:59:22', 12, NULL),
	(142, 'sold-casino-chips #142', 4995, 'Incoming', '2024-02-02 12:59:25', '2024-02-02 12:59:25', 12, NULL),
	(143, 'sold-casino-chips #143', 9990, 'Incoming', '2024-02-02 12:59:25', '2024-02-02 12:59:25', 12, NULL),
	(144, 'sold-casino-chips #144', 49950, 'Incoming', '2024-02-02 12:59:26', '2024-02-02 12:59:26', 12, NULL),
	(145, 'sold-casino-chips #145', 99900, 'Incoming', '2024-02-02 12:59:27', '2024-02-02 12:59:27', 12, NULL),
	(146, 'rent-car #146', 150, 'Outgoing', '2024-02-02 20:26:30', '2024-02-02 20:26:30', NULL, 28),
	(147, 'rent-car #147', 300, 'Outgoing', '2024-02-02 20:29:03', '2024-02-02 20:29:03', NULL, 28),
	(148, 'paycheck #148', 10, 'Incoming', '2024-02-02 20:39:39', '2024-02-02 20:39:39', 28, NULL),
	(149, 'paycheck #149', 5000, 'Incoming', '2024-02-02 22:27:01', '2024-02-02 22:27:01', 22, NULL),
	(150, 'paycheck #150', 10, 'Incoming', '2024-02-02 22:27:01', '2024-02-02 22:27:01', 19, NULL),
	(151, 'paycheck #151', 5000, 'Incoming', '2024-02-02 22:57:01', '2024-02-02 22:57:01', 22, NULL),
	(152, 'paycheck #152', 5000, 'Incoming', '2024-02-02 23:27:01', '2024-02-02 23:27:01', 22, NULL),
	(153, 'unknown #153', 2500, 'Outgoing', '2024-02-03 10:54:33', '2024-02-03 10:54:33', NULL, 8),
	(154, 'respawned-at-hospital #154', 2000, 'Outgoing', '2024-02-03 13:06:40', '2024-02-03 13:06:40', NULL, 8),
	(155, 'respawned-at-hospital #155', 2000, 'Outgoing', '2024-02-03 13:09:41', '2024-02-03 13:09:41', NULL, 19),
	(156, 'paycheck #156', 10, 'Incoming', '2024-02-03 13:20:40', '2024-02-03 13:20:40', 8, NULL),
	(157, 'paycheck #157', 5000, 'Incoming', '2024-02-03 13:20:40', '2024-02-03 13:20:40', 19, NULL),
	(158, 'respawned-at-hospital #158', 2000, 'Outgoing', '2024-02-03 13:21:24', '2024-02-03 13:21:24', NULL, 8),
	(159, 'respawned-at-hospital #159', 2000, 'Outgoing', '2024-02-03 13:27:21', '2024-02-03 13:27:21', NULL, 8);

-- tablo yapısı dökülüyor elused.pets
CREATE TABLE IF NOT EXISTS `pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(60) DEFAULT NULL,
  `modelname` varchar(250) DEFAULT NULL,
  `health` tinyint(4) NOT NULL DEFAULT 100,
  `illnesses` varchar(60) NOT NULL DEFAULT 'none',
  `name` varchar(255) DEFAULT 'Pet',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- elused.pets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pets`;
INSERT INTO `pets` (`id`, `owner`, `modelname`, `health`, `illnesses`, `name`) VALUES
	(220, 'HGO75866', 'a_c_rottweiler', 100, 'none', 'Pet');

-- tablo yapısı dökülüyor elused.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.phone_gallery: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_gallery`;
INSERT INTO `phone_gallery` (`citizenid`, `image`, `date`) VALUES
	('BMS02698', 'https://media.discordapp.net/attachments/998219156522553405/1198056001421705316/screenshot.jpg?ex=65bd8399&is=65ab0e99&hm=bfdda3609f1dc7e9786930b85300236b814192fd3a08715a5b7dcbcb736e57aa&', '2024-01-20 00:06:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.phone_invoices: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_invoices`;
INSERT INTO `phone_invoices` (`id`, `citizenid`, `amount`, `society`, `sender`, `sendercitizenid`) VALUES
	(1, 'XYP48353', 250, 'Garaj', 'Vale', 'Garaj'),
	(2, 'QUZ31879', 10000000, 'police', 'cabbar', 'XYP48353'),
	(6, 'FYH40953', 100, 'police', 'Vidarr', 'XBQ11226'),
	(12, 'FYH40953', 100, 'police', 'Vidarr', 'XBQ11226'),
	(13, 'FYH40953', 100, 'police', 'Vidarr', 'XBQ11226'),
	(14, 'FYH40953', 100, 'police', 'Vidarr', 'XBQ11226'),
	(15, 'FYH40953', 100, 'police', 'Vidarr', 'XBQ11226'),
	(16, 'FYH40953', 100, 'police', 'Vidarr', 'XBQ11226'),
	(17, 'HGO75866', 25000, 'police', 'Daryl', 'XRK76375');

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
DELETE FROM `phone_messages`;

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
DELETE FROM `phone_tweets`;

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
  `disabled` tinyint(1) DEFAULT 0,
  `phone_number` varchar(20) DEFAULT NULL,
  `skills` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=4632 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.players: ~23 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `players`;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `iban`, `pincode`, `daily`, `aranma`, `photo`, `photos`, `apps`, `widget`, `bt`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `disabled`, `phone_number`, `skills`) VALUES
	(2653, 'BIK10757', 1, 'license:04ae8dc8e8d8d5b3d105ab826228a29090e7182e', 'crystal566', '{"bank":4860,"blackmoney":0,"cash":8000,"crypto":0}', '{"nationality":"180","backstory":"placeholder backstory","phone":"776290","lastname":"schmitt","birthdate":"2024-01-17","account":"83433498534","gender":0,"cid":1,"firstname":"max"}', '{"onduty":true,"grade":{"name":"Freelancer","level":0},"payment":10,"label":"Civilian","type":"none","name":"unemployed","isboss":false}', '{"grade":{"name":"none","level":0},"label":"No Gang Affiliaton","name":"none","isboss":false}', '{"x":452.4527587890625,"y":-681.2439575195313,"z":27.207275390625}', '{"walletid":"3157","callsign":"NO CALLSIGN","communityservice":0,"pkelepce":false,"phone":[],"kelepce":false,"commandbinds":[],"fitbit":[],"ishandcuffed":false,"phonedata":{"SerialNumber":4356,"InstalledApps":[]},"craftingrep":0,"skill":{"Ciğer Kapasitesi":{"Menu":true,"RemoveAmount":0,"Current":5,"Stat":"MP0_LUNG_CAPACITY"},"Kondisyon":{"Menu":true,"RemoveAmount":0,"Current":10,"Stat":"MP0_STAMINA"},"Ön Kaldırma Yeteneği":{"Menu":true,"RemoveAmount":0,"Current":0,"Stat":"MP0_WHEELIE_ABILITY"},"Güç":{"Menu":true,"RemoveAmount":0,"Current":5,"Stat":"MP0_STRENGTH"},"Sürüş Yeteneği":{"Menu":true,"RemoveAmount":0,"Current":0.1,"Stat":"MP0_DRIVING_ABILITY"}},"licences":{"business":false,"driver":true,"weapon":false},"inside":{"apartment":[]},"criminalrecord":{"hasRecord":false},"stress":0,"bloodtype":"A-","tracker":false,"isdead":false,"status":[],"jobrep":{"hotdog":0,"tow":0,"trucker":0,"taxi":0},"fingerprint":"eW394p43rhZ7406","dealerrep":0,"injail":0,"inlaststand":false,"armor":0,"attachmentcraftingrep":0,"jailitems":[],"thirst":88.59999999999946,"hunger":87.39999999999782}', '[{"slot":1,"name":"cash","type":"item","info":[],"amount":8000},{"slot":2,"name":"id_card","type":"item","info":{"nationality":"180","birthdate":"2024-01-17","lastname":"schmitt","firstname":"max","citizenid":"BIK10757","gender":0},"amount":1},{"slot":3,"name":"phone","type":"item","info":[],"amount":1},{"slot":8,"name":"driver_license","type":"item","info":{"birthdate":"2024-01-17","firstname":"max","lastname":"schmitt","type":"Class C Driver License"},"amount":1}]', '2024-01-25 13:06:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '776290', '{"Electrical":{"Current":0,"icon":"fas fa-bolt","Stat":"ELECTRICAL_ABILITY","RemoveAmount":0},"Hacking":{"Current":0,"icon":"fas fa-laptop-code","Stat":"HACK_ABILITY","RemoveAmount":0},"Street Reputation":{"Current":0,"icon":"fas fa-cannabis","Stat":"DRUGREP_ABILITY","RemoveAmount":0},"Sprint Driving":{"Current":0,"icon":"fas fa-car-alt","Stat":"DRIVER_ABILITY","RemoveAmount":0},"Searching":{"Current":0,"icon":"fas fa-trash","Stat":"BINDIVE_ABILITY","RemoveAmount":0},"Hitman":{"Current":0,"icon":"fas fa-skull","Stat":"HITMAN_ABILITY","RemoveAmount":0},"Driving":{"Current":0,"icon":"fas fa-car-side","Stat":"MP0_DRIVING_ABILITY","RemoveAmount":-0.5},"Scraping":{"Current":0,"icon":"fas fa-screwdriver","Stat":"SCRAP_ABILITY","RemoveAmount":0},"Strength":{"Current":0,"icon":"fas fa-dumbbell","Stat":"MP0_STRENGTH","RemoveAmount":-0.3},"Diving":{"Current":0,"icon":"fas fa-water","Stat":"DIVING_ABILITY","RemoveAmount":0},"Lung Capacity":{"Current":0,"icon":"fas fa-heartbeat","Stat":"MP0_LUNG_CAPACITY","RemoveAmount":-0.1},"Wheelie":{"Current":0,"icon":"fas fa-wheelchair","Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":-0.2},"Heist Reputation":{"Current":0,"icon":"fa-solid fa-user-secret","Stat":"HEIST_ABILITY","RemoveAmount":0},"Shooting":{"Current":0,"icon":"fas fa-bullseye","Stat":"MP0_SHOOTING_ABILITY","RemoveAmount":-0.1},"Delivery Runner":{"Current":0,"icon":"fas fa-car","Stat":"RUNNER_ABILITY","RemoveAmount":0},"Stamina":{"Current":0,"icon":"fas fa-walking","Stat":"MP0_STAMINA","RemoveAmount":-0.3},"Lumberjack":{"Current":0,"icon":"fas fa-tree","Stat":"TREE_ABILITY","RemoveAmount":0},"Drug Manufacture":{"Current":0,"icon":"fas fa-pills","Stat":"DRUGMAKE_ABILITY","RemoveAmount":0}}'),
	(1367, 'BMS02698', 1, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'RedViper', '{"bank":275069,"cash":232740.0,"crypto":0,"blackmoney":0}', '{"birthdate":"2024-01-08","gender":0,"backstory":"placeholder backstory","firstname":"VADİM ","cid":1,"phone":"429841","nationality":"182","lastname":"CANTAS","account":"87800258536"}', '{"name":"police","isboss":false,"payment":5000,"type":"leo","grade":{"name":"Lieutenant I","level":10},"label":"LSPD","onduty":true}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"}}', '{"x":2196.659423828125,"y":5606.42626953125,"z":53.4761962890625}', '{"inside":{"apartment":[]},"walletid":"9261","dealerrep":0,"pkelepce":false,"injail":0,"commandbinds":[],"hunger":74.79999999999564,"callsign":"NO CALLSIGN","phone":[],"fitbit":[],"armor":0,"isdead":false,"status":[],"jailitems":[],"licences":{"weapon":false,"business":false,"driver":true},"tracker":false,"fingerprint":"Ts438g74ayB7528","ishandcuffed":false,"phonedata":{"SerialNumber":7661,"InstalledApps":[]},"skill":{"Ciğer Kapasitesi":{"Menu":true,"Stat":"MP0_LUNG_CAPACITY","Current":5.39999999999999,"RemoveAmount":0},"Sürüş Yeteneği":{"Menu":true,"Stat":"MP0_DRIVING_ABILITY","Current":6.59999999999995,"RemoveAmount":0},"Kondisyon":{"Menu":true,"Stat":"MP0_STAMINA","Current":10.07999999999999,"RemoveAmount":0},"Ön Kaldırma Yeteneği":{"Menu":true,"Stat":"MP0_WHEELIE_ABILITY","Current":0,"RemoveAmount":0},"Güç":{"Menu":true,"Stat":"MP0_STRENGTH","Current":5,"RemoveAmount":0}},"attachmentcraftingrep":0,"criminalrecord":{"hasRecord":false},"kelepce":false,"inlaststand":false,"jobrep":{"trucker":0,"hotdog":0,"taxi":0,"tow":0},"thirst":77.19999999999891,"stress":0,"communityservice":0,"craftingrep":0,"bloodtype":"A-"}', '[{"amount":1,"type":"item","name":"blackmarket_vip_card","slot":1,"info":[]},{"amount":1,"type":"weapon","name":"weapon_heavypistol","slot":2,"info":{"quality":62.05000000000575,"serie":"68Uhp7nH464lXXj","ammo":122}},{"amount":1,"type":"weapon","name":"weapon_machete","slot":3,"info":{"quality":100,"serie":"28GYx1bd259NBRj","ammo":0}},{"amount":1,"type":"weapon","name":"weapon_battleaxe","slot":4,"info":{"quality":100,"serie":"23Wda5Ma208SwCN","ammo":0}},{"amount":1,"type":"item","name":"fishingrod1","slot":5,"info":[]},{"amount":1,"type":"item","name":"bottle","slot":6,"info":[]},{"amount":1,"type":"item","name":"anchovy","slot":7,"info":[]},{"amount":1,"type":"weapon","name":"weapon_vintagepistol","slot":8,"info":{"quality":4.60000000001445,"serie":"55NQC5TC659IdcS","ammo":0}},{"amount":1,"type":"weapon","name":"weapon_petrolcan","slot":9,"info":{"quality":100,"serie":"47Clr1Vu712dLMa"}},{"amount":1,"type":"weapon","name":"weapon_machete","slot":10,"info":{"serie":"95UDz0HO566OZev","quality":100}},{"amount":232740.0,"type":"item","name":"cash","slot":11,"info":[]},{"amount":1,"type":"weapon","name":"weapon_machete","slot":12,"info":{"quality":100,"serie":"33TUz8ha727hBAj"}},{"amount":1,"type":"weapon","name":"weapon_machete","slot":13,"info":{"serie":"51SdR1dK986LtbB","quality":100}},{"amount":1,"type":"weapon","name":"weapon_machete","slot":14,"info":{"quality":100,"serie":"13aBk0SM856ifuS"}},{"amount":1,"type":"weapon","name":"weapon_battleaxe","slot":15,"info":{"quality":100,"serie":"95gFt0Fp374SdIq"}},{"amount":1,"type":"weapon","name":"weapon_machete","slot":19,"info":{"serie":"32QWb2uw385yJYL","quality":100}},{"amount":1,"type":"item","name":"snikkel_candy","slot":26,"info":[]},{"amount":1,"type":"item","name":"twerks_candy","slot":27,"info":[]},{"amount":1,"type":"item","name":"kurkakola","slot":28,"info":[]},{"amount":1,"type":"item","name":"water_bottle","slot":29,"info":[]},{"amount":1,"type":"item","name":"tosti","slot":30,"info":[]},{"amount":1,"type":"item","name":"phone","slot":31,"info":[]},{"amount":1,"type":"item","name":"vodka","slot":32,"info":[]},{"amount":1,"type":"item","name":"whiskey","slot":33,"info":[]},{"amount":1,"type":"item","name":"beer","slot":34,"info":[]},{"amount":1,"type":"item","name":"sandwich","slot":35,"info":[]}]', '2024-02-03 14:41:10', 'QB8442', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '429841', '{"Lung Capacity":{"RemoveAmount":-0.1,"icon":"fas fa-heartbeat","Stat":"MP0_LUNG_CAPACITY","Current":0},"Sprint Driving":{"RemoveAmount":0,"icon":"fas fa-car-alt","Stat":"DRIVER_ABILITY","Current":0},"Hacking":{"RemoveAmount":0,"icon":"fas fa-laptop-code","Stat":"HACK_ABILITY","Current":0},"Wheelie":{"RemoveAmount":-0.2,"icon":"fas fa-wheelchair","Stat":"MP0_WHEELIE_ABILITY","Current":0},"Delivery Runner":{"RemoveAmount":0,"icon":"fas fa-car","Stat":"RUNNER_ABILITY","Current":0},"Strength":{"RemoveAmount":-0.3,"icon":"fas fa-dumbbell","Stat":"MP0_STRENGTH","Current":0},"Street Reputation":{"RemoveAmount":0,"icon":"fas fa-cannabis","Stat":"DRUGREP_ABILITY","Current":0},"Shooting":{"RemoveAmount":-0.1,"icon":"fas fa-bullseye","Stat":"MP0_SHOOTING_ABILITY","Current":0},"Drug Manufacture":{"RemoveAmount":0,"icon":"fas fa-pills","Stat":"DRUGMAKE_ABILITY","Current":0},"Scraping":{"RemoveAmount":0,"icon":"fas fa-screwdriver","Stat":"SCRAP_ABILITY","Current":0},"Driving":{"RemoveAmount":-0.5,"icon":"fas fa-car-side","Stat":"MP0_DRIVING_ABILITY","Current":0},"Diving":{"RemoveAmount":0,"icon":"fas fa-water","Stat":"DIVING_ABILITY","Current":0},"Searching":{"RemoveAmount":0,"icon":"fas fa-trash","Stat":"BINDIVE_ABILITY","Current":0},"Heist Reputation":{"RemoveAmount":0,"icon":"fa-solid fa-user-secret","Stat":"HEIST_ABILITY","Current":0},"Hitman":{"RemoveAmount":0,"icon":"fas fa-skull","Stat":"HITMAN_ABILITY","Current":0},"Electrical":{"RemoveAmount":0,"icon":"fas fa-bolt","Stat":"ELECTRICAL_ABILITY","Current":0},"Lumberjack":{"RemoveAmount":0,"icon":"fas fa-tree","Stat":"TREE_ABILITY","Current":0},"Stamina":{"RemoveAmount":-0.3,"icon":"fas fa-walking","Stat":"MP0_STAMINA","Current":0}}'),
	(3257, 'CDR37384', 1, 'license:759f35b0a5e54b71040546417277a6471bac20df', 'Efe keskin', '{"bank":97161675,"cash":10030009702771,"crypto":0,"blackmoney":0}', '{"birthdate":"1997-05-05","gender":0,"backstory":"placeholder backstory","firstname":"Swex ","lastname":"Toe","phone":"677991","nationality":"Türkiye","cid":1,"account":"92451175313"}', '{"onduty":true,"grade":{"level":16,"name":"Cheif Of Police"},"payment":5000,"isboss":true,"name":"police","label":"LSPD","type":"leo"}', '{"grade":{"level":0,"name":"none"},"isboss":false,"label":"No Gang Affiliaton","name":"none"}', '{"x":415.96484375,"y":-1056.6988525390626,"z":28.6395263671875}', '{"inside":{"apartment":[]},"walletid":"3873","dealerrep":0,"pkelepce":false,"injail":0,"commandbinds":[],"hunger":83.19999999999709,"callsign":"NO CALLSIGN","phone":[],"fitbit":[],"armor":0,"craftingrep":0,"status":[],"jailitems":[],"licences":{"weapon":false,"business":false,"driver":true},"stress":0,"fingerprint":"nW481C86ibg4380","ishandcuffed":false,"phonedata":{"SerialNumber":4607,"InstalledApps":[]},"criminalrecord":{"hasRecord":false},"attachmentcraftingrep":0,"communityservice":0,"kelepce":false,"inlaststand":false,"thirst":84.79999999999927,"jobrep":{"trucker":0,"tow":0,"taxi":0,"hotdog":0},"tracker":false,"bloodtype":"A+","skill":{"Ciğer Kapasitesi":{"Stat":"MP0_LUNG_CAPACITY","Menu":true,"Current":5.29999999999999,"RemoveAmount":0},"Sürüş Yeteneği":{"Stat":"MP0_DRIVING_ABILITY","Menu":true,"Current":2.99999999999999,"RemoveAmount":0},"Kondisyon":{"Stat":"MP0_STAMINA","Menu":true,"Current":10.05999999999999,"RemoveAmount":0},"Ön Kaldırma Yeteneği":{"Stat":"MP0_WHEELIE_ABILITY","Menu":true,"Current":0,"RemoveAmount":0},"Güç":{"Stat":"MP0_STRENGTH","Menu":true,"Current":5.1,"RemoveAmount":0}},"isdead":false}', '[{"amount":10030009702771,"type":"item","name":"cash","slot":1,"info":[]},{"amount":1,"type":"weapon","name":"weapon_hk416","slot":2,"info":{"serie":"","quality":64.75000000000535,"ammo":306,"attachments":[]}},{"amount":36,"type":"item","name":"rifle_ammo","slot":3,"info":[]}]', '2024-02-03 13:32:53', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '677991', '{"Shooting":{"Stat":"MP0_SHOOTING_ABILITY","icon":"fas fa-bullseye","Current":0,"RemoveAmount":-0.1},"Searching":{"Stat":"BINDIVE_ABILITY","icon":"fas fa-trash","Current":0,"RemoveAmount":0},"Hacking":{"Stat":"HACK_ABILITY","icon":"fas fa-laptop-code","Current":0,"RemoveAmount":0},"Hitman":{"Stat":"HITMAN_ABILITY","icon":"fas fa-skull","Current":0,"RemoveAmount":0},"Scraping":{"Stat":"SCRAP_ABILITY","icon":"fas fa-screwdriver","Current":0,"RemoveAmount":0},"Electrical":{"Stat":"ELECTRICAL_ABILITY","icon":"fas fa-bolt","Current":0,"RemoveAmount":0},"Diving":{"Stat":"DIVING_ABILITY","icon":"fas fa-water","Current":0,"RemoveAmount":0},"Lung Capacity":{"Stat":"MP0_LUNG_CAPACITY","icon":"fas fa-heartbeat","Current":0,"RemoveAmount":-0.1},"Strength":{"Stat":"MP0_STRENGTH","icon":"fas fa-dumbbell","Current":0,"RemoveAmount":-0.3},"Delivery Runner":{"Stat":"RUNNER_ABILITY","icon":"fas fa-car","Current":0,"RemoveAmount":0},"Street Reputation":{"Stat":"DRUGREP_ABILITY","icon":"fas fa-cannabis","Current":0,"RemoveAmount":0},"Wheelie":{"Stat":"MP0_WHEELIE_ABILITY","icon":"fas fa-wheelchair","Current":0,"RemoveAmount":-0.2},"Driving":{"Stat":"MP0_DRIVING_ABILITY","icon":"fas fa-car-side","Current":0,"RemoveAmount":-0.5},"Sprint Driving":{"Stat":"DRIVER_ABILITY","icon":"fas fa-car-alt","Current":0,"RemoveAmount":0},"Heist Reputation":{"Stat":"HEIST_ABILITY","icon":"fa-solid fa-user-secret","Current":0,"RemoveAmount":0},"Stamina":{"Stat":"MP0_STAMINA","icon":"fas fa-walking","Current":1.09999999999997,"RemoveAmount":-0.3},"Lumberjack":{"Stat":"TREE_ABILITY","icon":"fas fa-tree","Current":0,"RemoveAmount":0},"Drug Manufacture":{"Stat":"DRUGMAKE_ABILITY","icon":"fas fa-pills","Current":0,"RemoveAmount":0}}'),
	(3536, 'DFK22197', 1, 'license:e0fd544a7980b4ca90db4b4d5ebb0564de65eb5d', 'AdsNinja', '{"cash":7000,"blackmoney":0,"crypto":0,"bank":15010}', '{"account":"37181406273","cid":1,"nationality":"Fıransız Türk","gender":0,"birthdate":"2000-02-22","phone":"717150","firstname":"Luis","lastname":"Miller","backstory":"placeholder backstory"}', '{"payment":5000,"isboss":true,"type":"leo","label":"LSPD","grade":{"name":"Cheif Of Police","level":16},"name":"police","onduty":true}', '{"isboss":false,"grade":{"name":"none","level":0},"name":"none","label":"No Gang Affiliaton"}', '{"x":-450.6197814941406,"y":-1532.6636962890626,"z":10.5260009765625}', '{"injail":0,"communityservice":0,"thirst":96.19999999999982,"tracker":false,"armor":0,"craftingrep":0,"inside":{"apartment":[]},"attachmentcraftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":9660},"pkelepce":false,"stress":0,"status":[],"hunger":95.79999999999927,"walletid":"4677","fingerprint":"kj469A80NKx0408","criminalrecord":{"hasRecord":false},"callsign":"NO CALLSIGN","kelepce":false,"ishandcuffed":false,"fitbit":[],"skill":{"Ön Kaldırma Yeteneği":{"Menu":true,"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":0,"Current":0},"Güç":{"Menu":true,"Stat":"MP0_STRENGTH","RemoveAmount":0,"Current":5},"Sürüş Yeteneği":{"Menu":true,"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":0,"Current":0.3},"Ciğer Kapasitesi":{"Menu":true,"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":0,"Current":5},"Kondisyon":{"Menu":true,"Stat":"MP0_STAMINA","RemoveAmount":0,"Current":10}},"dealerrep":0,"jailitems":[],"phone":[],"bloodtype":"O+","inlaststand":false,"jobrep":{"trucker":0,"taxi":0,"tow":0,"hotdog":0},"isdead":false,"licences":{"weapon":false,"business":false,"driver":false},"commandbinds":[]}', '[]', '2024-02-01 22:11:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '717150', '{"Delivery Runner":{"RemoveAmount":0,"Current":0,"icon":"fas fa-car","Stat":"RUNNER_ABILITY"},"Strength":{"RemoveAmount":-0.3,"Current":0,"icon":"fas fa-dumbbell","Stat":"MP0_STRENGTH"},"Drug Manufacture":{"RemoveAmount":0,"Current":0,"icon":"fas fa-pills","Stat":"DRUGMAKE_ABILITY"},"Lung Capacity":{"RemoveAmount":-0.1,"Current":0,"icon":"fas fa-heartbeat","Stat":"MP0_LUNG_CAPACITY"},"Shooting":{"RemoveAmount":-0.1,"Current":0,"icon":"fas fa-bullseye","Stat":"MP0_SHOOTING_ABILITY"},"Heist Reputation":{"RemoveAmount":0,"Current":0,"icon":"fa-solid fa-user-secret","Stat":"HEIST_ABILITY"},"Street Reputation":{"RemoveAmount":0,"Current":0,"icon":"fas fa-cannabis","Stat":"DRUGREP_ABILITY"},"Hacking":{"RemoveAmount":0,"Current":0,"icon":"fas fa-laptop-code","Stat":"HACK_ABILITY"},"Electrical":{"RemoveAmount":0,"Current":0,"icon":"fas fa-bolt","Stat":"ELECTRICAL_ABILITY"},"Wheelie":{"RemoveAmount":-0.2,"Current":0,"icon":"fas fa-wheelchair","Stat":"MP0_WHEELIE_ABILITY"},"Driving":{"RemoveAmount":-0.5,"Current":0.2,"icon":"fas fa-car-side","Stat":"MP0_DRIVING_ABILITY"},"Stamina":{"RemoveAmount":-0.3,"Current":0,"icon":"fas fa-walking","Stat":"MP0_STAMINA"},"Diving":{"RemoveAmount":0,"Current":0,"icon":"fas fa-water","Stat":"DIVING_ABILITY"},"Sprint Driving":{"RemoveAmount":0,"Current":0,"icon":"fas fa-car-alt","Stat":"DRIVER_ABILITY"},"Lumberjack":{"RemoveAmount":0,"Current":0,"icon":"fas fa-tree","Stat":"TREE_ABILITY"},"Scraping":{"RemoveAmount":0,"Current":0,"icon":"fas fa-screwdriver","Stat":"SCRAP_ABILITY"},"Hitman":{"RemoveAmount":0,"Current":0,"icon":"fas fa-skull","Stat":"HITMAN_ABILITY"},"Searching":{"RemoveAmount":0,"Current":0,"icon":"fas fa-trash","Stat":"BINDIVE_ABILITY"}}'),
	(2999, 'DXH34648', 1, 'license:987ed547c73270ca6274c4ee61400b5dbcc85e4c', 'BlueFail18', '{"bank":455050,"blackmoney":0,"crypto":0,"cash":5545}', '{"phone":"756765","firstname":"Walter","backstory":"placeholder backstory","lastname":"Black","cid":1,"birthdate":"1990-05-25","nationality":"USA","gender":0,"account":"79247135636"}', '{"isboss":true,"label":"LSPD","grade":{"name":"Cheif Of Police","level":16},"onduty":true,"type":"leo","name":"police","payment":5000}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"x":757.7538452148438,"y":-1584.6856689453126,"z":9.7003173828125}', '{"bloodtype":"A+","thirst":77.19999999999891,"status":[],"pkelepce":false,"attachmentcraftingrep":0,"fingerprint":"zT801N97LEh9535","inlaststand":false,"ishandcuffed":false,"walletid":"7403","dealerrep":0,"skill":{"Kondisyon":{"Stat":"MP0_STAMINA","RemoveAmount":0,"Current":10.07999999999999,"Menu":true},"Güç":{"Stat":"MP0_STRENGTH","RemoveAmount":0,"Current":5,"Menu":true},"Ciğer Kapasitesi":{"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":0,"Current":5.39999999999999,"Menu":true},"Ön Kaldırma Yeteneği":{"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":0,"Current":0,"Menu":true},"Sürüş Yeteneği":{"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":0,"Current":1.99999999999999,"Menu":true}},"callsign":"NO CALLSIGN","isdead":false,"criminalrecord":{"hasRecord":false},"injail":0,"phonedata":{"SerialNumber":5196,"InstalledApps":[]},"jobrep":{"taxi":0,"trucker":0,"tow":0,"hotdog":0},"hunger":74.79999999999565,"phone":[],"licences":{"weapon":false,"business":false,"driver":true},"jailitems":[],"commandbinds":[],"communityservice":0,"armor":0,"fitbit":[],"kelepce":false,"tracker":false,"inside":{"apartment":[]},"craftingrep":0,"stress":0}', '[{"name":"weapon_m9","slot":1,"amount":1,"type":"weapon","info":{"quality":0,"ammo":151,"serie":"42IFr0px501IoSX"}},{"name":"weapon_ak47","slot":2,"amount":1,"type":"weapon","info":{"quality":60.400000000006,"ammo":0,"serie":"27kRz2hM878DyPc"}},{"name":"heavyarmor","slot":3,"amount":13,"type":"item","info":[]},{"name":"bandage","slot":4,"amount":14,"type":"item","info":[]},{"name":"weapon_scarh","slot":5,"amount":1,"type":"weapon","info":{"quality":96.7000000000005,"ammo":237,"serie":"96SZx2lN010acyd"}},{"name":"cash","slot":6,"amount":5545,"type":"item","info":[]},{"name":"pistol_ammo","slot":7,"amount":32,"type":"item","info":[]},{"name":"rifle_ammo","slot":8,"amount":2,"type":"item","info":[]},{"name":"weapon_appistol","slot":10,"amount":1,"type":"weapon","info":{"quality":76.9000000000035,"ammo":14,"serie":"08Mby8hL994GlPM"}},{"name":"pkelepce","slot":13,"amount":5,"type":"item","info":[]}]', '2024-02-03 12:07:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '756765', '{"Drug Manufacture":{"icon":"fas fa-pills","RemoveAmount":0,"Current":0,"Stat":"DRUGMAKE_ABILITY"},"Lung Capacity":{"icon":"fas fa-heartbeat","RemoveAmount":-0.1,"Current":0,"Stat":"MP0_LUNG_CAPACITY"},"Delivery Runner":{"icon":"fas fa-car","RemoveAmount":0,"Current":0,"Stat":"RUNNER_ABILITY"},"Hacking":{"icon":"fas fa-laptop-code","RemoveAmount":0,"Current":0,"Stat":"HACK_ABILITY"},"Electrical":{"icon":"fas fa-bolt","RemoveAmount":0,"Current":0,"Stat":"ELECTRICAL_ABILITY"},"Wheelie":{"icon":"fas fa-wheelchair","RemoveAmount":-0.2,"Current":0,"Stat":"MP0_WHEELIE_ABILITY"},"Stamina":{"icon":"fas fa-walking","RemoveAmount":-0.3,"Current":0,"Stat":"MP0_STAMINA"},"Hitman":{"icon":"fas fa-skull","RemoveAmount":0,"Current":0,"Stat":"HITMAN_ABILITY"},"Strength":{"icon":"fas fa-dumbbell","RemoveAmount":-0.3,"Current":0,"Stat":"MP0_STRENGTH"},"Driving":{"icon":"fas fa-car-side","RemoveAmount":-0.5,"Current":0,"Stat":"MP0_DRIVING_ABILITY"},"Scraping":{"icon":"fas fa-screwdriver","RemoveAmount":0,"Current":0,"Stat":"SCRAP_ABILITY"},"Sprint Driving":{"icon":"fas fa-car-alt","RemoveAmount":0,"Current":0,"Stat":"DRIVER_ABILITY"},"Diving":{"icon":"fas fa-water","RemoveAmount":0,"Current":0,"Stat":"DIVING_ABILITY"},"Searching":{"icon":"fas fa-trash","RemoveAmount":0,"Current":0,"Stat":"BINDIVE_ABILITY"},"Lumberjack":{"icon":"fas fa-tree","RemoveAmount":0,"Current":0,"Stat":"TREE_ABILITY"},"Shooting":{"icon":"fas fa-bullseye","RemoveAmount":-0.1,"Current":0,"Stat":"MP0_SHOOTING_ABILITY"},"Heist Reputation":{"icon":"fa-solid fa-user-secret","RemoveAmount":0,"Current":0,"Stat":"HEIST_ABILITY"},"Street Reputation":{"icon":"fas fa-cannabis","RemoveAmount":0,"Current":0,"Stat":"DRUGREP_ABILITY"}}'),
	(1237, 'EPT80110', 1, 'license:208c2e2aedc86d1eaf35941a3fefdd36de247a16', 'hasan585758h', '{"cash":5008000,"bank":15010,"crypto":0,"blackmoney":0}', '{"phone":"666666","birthdate":"2024-01-12","cid":1,"nationality":"asdasdas","lastname":"dasdsa","gender":0,"account":"96426141358","firstname":"sdads","backstory":"placeholder backstory"}', '{"label":"LSPD","payment":2500,"onduty":true,"grade":{"level":1,"name":"Officer I"},"name":"police","type":"leo","isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-376.73406982421877,"y":-1632.4747314453126,"z":2.89306640625}', '{"armor":0,"thirst":100,"inlaststand":false,"pkelepce":false,"ishandcuffed":false,"phonedata":{"SerialNumber":8074,"InstalledApps":[]},"isdead":false,"inside":{"apartment":[]},"status":[],"licences":{"driver":true,"weapon":false,"business":false},"criminalrecord":{"hasRecord":false},"phone":[],"jobrep":{"hotdog":0,"trucker":0,"taxi":0,"tow":0},"injail":0,"stress":0,"fingerprint":"qW274v64WDB7500","commandbinds":[],"jailitems":[],"fitbit":[],"callsign":"NO CALLSIGN","attachmentcraftingrep":0,"walletid":"2377","dealerrep":0,"bloodtype":"A+","kelepce":false,"communityservice":0,"hunger":100,"tracker":false,"craftingrep":0}', '[{"name":"id_card","info":{"nationality":"asdasdas","gender":0,"lastname":"dasdsa","citizenid":"EPT80110","birthdate":"2024-01-12","firstname":"sdads"},"amount":1,"slot":1,"type":"item"},{"name":"cash","info":[],"amount":5008000,"slot":2,"type":"item"},{"name":"driver_license","info":{"firstname":"sdads","type":"Class C Driver License","birthdate":"2024-01-12","lastname":"dasdsa"},"amount":1,"slot":3,"type":"item"},{"name":"phone","info":[],"amount":1,"slot":4,"type":"item"},{"name":"weapon_assaultrifle_mk2","info":{"ammo":204,"serie":"78GSV2IQ888nNZB","quality":95.34999999999983},"amount":1,"slot":5,"type":"weapon"}]', '2024-01-12 17:20:16', 'QB6481', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
	(4405, 'EUN05205', 1, 'license:60116bd583afa9c9ecd41a060f6d85de03990755', 'rekzy the numberone', '{"blackmoney":0,"crypto":0,"cash":8000,"bank":5000}', '{"lastname":"capone","cid":1,"birthdate":"2024-02-02","account":"36055969188","firstname":"rekzy","phone":"379460","nationality":"ABD","backstory":"placeholder backstory","gender":0}', '{"onduty":true,"name":"unemployed","isboss":false,"label":"Civilian","payment":10,"type":"none","grade":{"name":"Freelancer","level":0}}', '{"grade":{"name":"none","level":0},"name":"none","isboss":false,"label":"No Gang Affiliaton"}', '{"x":-991.002197265625,"y":-2692.510009765625,"z":13.82861328125}', '{"licences":{"driver":true,"business":false,"weapon":false},"attachmentcraftingrep":0,"injail":0,"hunger":87.39999999999783,"dealerrep":0,"stress":0,"fingerprint":"zM431q39QoI9344","kelepce":false,"phone":[],"callsign":"NO CALLSIGN","armor":0,"walletid":"1543","communityservice":0,"commandbinds":[],"bloodtype":"B-","jailitems":[],"isdead":false,"status":[],"fitbit":[],"jobrep":{"taxi":0,"tow":0,"hotdog":0,"trucker":0},"thirst":88.59999999999946,"craftingrep":0,"inside":{"apartment":[]},"phonedata":{"SerialNumber":8834,"InstalledApps":[]},"pkelepce":false,"ishandcuffed":false,"tracker":false,"criminalrecord":{"hasRecord":false},"inlaststand":false}', '[{"info":{"lastname":"capone","firstname":"rekzy","birthdate":"2024-02-02","type":"Class C Driver License"},"name":"driver_license","slot":1,"type":"item","amount":1},{"info":[],"name":"phone","slot":2,"type":"item","amount":1},{"info":{"citizenid":"EUN05205","nationality":"ABD","lastname":"capone","gender":0,"birthdate":"2024-02-02","firstname":"rekzy"},"name":"id_card","slot":3,"type":"item","amount":1},{"info":[],"name":"cash","slot":4,"type":"item","amount":8000}]', '2024-02-02 20:21:52', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '379460', '{"Hitman":{"Current":0,"Stat":"HITMAN_ABILITY","RemoveAmount":0,"icon":"fas fa-skull"},"Hacking":{"Current":0,"Stat":"HACK_ABILITY","RemoveAmount":0,"icon":"fas fa-laptop-code"},"Street Reputation":{"Current":0,"Stat":"DRUGREP_ABILITY","RemoveAmount":0,"icon":"fas fa-cannabis"},"Heist Reputation":{"Current":0,"Stat":"HEIST_ABILITY","RemoveAmount":0,"icon":"fa-solid fa-user-secret"},"Lung Capacity":{"Current":0,"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":-0.1,"icon":"fas fa-heartbeat"},"Scraping":{"Current":0,"Stat":"SCRAP_ABILITY","RemoveAmount":0,"icon":"fas fa-screwdriver"},"Stamina":{"Current":0.2,"Stat":"MP0_STAMINA","RemoveAmount":-0.3,"icon":"fas fa-walking"},"Electrical":{"Current":0,"Stat":"ELECTRICAL_ABILITY","RemoveAmount":0,"icon":"fas fa-bolt"},"Diving":{"Current":0,"Stat":"DIVING_ABILITY","RemoveAmount":0,"icon":"fas fa-water"},"Drug Manufacture":{"Current":0,"Stat":"DRUGMAKE_ABILITY","RemoveAmount":0,"icon":"fas fa-pills"},"Delivery Runner":{"Current":0,"Stat":"RUNNER_ABILITY","RemoveAmount":0,"icon":"fas fa-car"},"Wheelie":{"Current":0,"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":-0.2,"icon":"fas fa-wheelchair"},"Shooting":{"Current":0.0,"Stat":"MP0_SHOOTING_ABILITY","RemoveAmount":-0.1,"icon":"fas fa-bullseye"},"Lumberjack":{"Current":0,"Stat":"TREE_ABILITY","RemoveAmount":0,"icon":"fas fa-tree"},"Strength":{"Current":0,"Stat":"MP0_STRENGTH","RemoveAmount":-0.3,"icon":"fas fa-dumbbell"},"Searching":{"Current":0,"Stat":"BINDIVE_ABILITY","RemoveAmount":0,"icon":"fas fa-trash"},"Sprint Driving":{"Current":0,"Stat":"DRIVER_ABILITY","RemoveAmount":0,"icon":"fas fa-car-alt"},"Driving":{"Current":0,"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":-0.5,"icon":"fas fa-car-side"}}'),
	(1240, 'FWH76480', 1, 'license:2108202c852c99cd591973bccee56febaadc6083', 'root', '{"cash":8000,"bank":5040,"crypto":0,"blackmoney":0}', '{"phone":"837612","birthdate":"2024-01-12","firstname":"asdas","nationality":"asdasdas","lastname":"asdasd","gender":0,"account":"23142487751","cid":1,"backstory":"placeholder backstory"}', '{"label":"Civilian","payment":10,"onduty":true,"grade":{"level":0,"name":"Freelancer"},"name":"unemployed","type":"none","isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-422.5978088378906,"y":-1637.9208984375,"z":9.734130859375}', '{"armor":0,"thirst":100,"inlaststand":false,"phone":[],"pkelepce":false,"ishandcuffed":false,"phonedata":{"SerialNumber":9809,"InstalledApps":[]},"isdead":false,"inside":{"apartment":[]},"status":[],"licences":{"driver":true,"weapon":false,"business":false},"criminalrecord":{"hasRecord":false},"skill":{"Ciğer Kapasitesi":{"RemoveAmount":0,"Current":5,"Stat":"MP0_LUNG_CAPACITY","Menu":true},"Kondisyon":{"RemoveAmount":0,"Current":10,"Stat":"MP0_STAMINA","Menu":true},"Güç":{"RemoveAmount":0,"Current":5,"Stat":"MP0_STRENGTH","Menu":true},"Ön Kaldırma Yeteneği":{"RemoveAmount":0,"Current":0,"Stat":"MP0_WHEELIE_ABILITY","Menu":true},"Sürüş Yeteneği":{"RemoveAmount":0,"Current":0.1,"Stat":"MP0_DRIVING_ABILITY","Menu":true}},"jobrep":{"hotdog":0,"trucker":0,"taxi":0,"tow":0},"injail":0,"stress":0,"fingerprint":"Yn856N31dbD9944","commandbinds":[],"jailitems":[],"fitbit":[],"callsign":"NO CALLSIGN","attachmentcraftingrep":0,"walletid":"9666","dealerrep":0,"bloodtype":"AB-","kelepce":false,"communityservice":0,"hunger":100,"tracker":false,"craftingrep":0}', '[{"name":"weapon_minigun","info":{"ammo":49,"serie":"04UIn0Xx201WMrr","quality":97.14999999999989},"amount":1,"slot":1,"type":"weapon"},{"name":"cash","info":[],"amount":8000,"slot":2,"type":"item"},{"name":"weapon_minigun","info":{"serie":"17rPa1MV214TSaV","quality":100},"amount":1,"slot":3,"type":"weapon"},{"name":"phone","info":[],"amount":1,"slot":4,"type":"item"},{"name":"weapon_dagger","info":{"serie":"04anB8Bw416Vvux","quality":100},"amount":1,"slot":5,"type":"weapon"},{"name":"weapon_dagger","info":{"serie":"21zDi9eW006Oqxl","quality":100},"amount":1,"slot":6,"type":"weapon"},{"name":"weapon_dagger","info":{"serie":"85ZOg8aY345xanK","quality":100},"amount":1,"slot":7,"type":"weapon"},{"name":"weapon_dagger","info":{"serie":"24YkR8Sw548dduh","quality":100},"amount":1,"slot":8,"type":"weapon"},{"name":"id_card","info":{"nationality":"asdasdas","gender":0,"lastname":"asdasd","citizenid":"FWH76480","birthdate":"2024-01-12","firstname":"asdas"},"amount":1,"slot":9,"type":"item"},{"name":"driver_license","info":{"firstname":"asdas","type":"Class C Driver License","birthdate":"2024-01-12","lastname":"asdasd"},"amount":1,"slot":10,"type":"item"}]', '2024-01-12 17:19:34', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
	(1726, 'FYH40953', 1, 'license:64038a7810c56288850ab0e5cc75768c0b817337', 'Kyrien', '{"bank":1000000530,"blackmoney":0,"cash":1000003380.0,"crypto":0}', '{"firstname":"Charles","account":"77234465626","cid":1,"lastname":"Roda","gender":0,"backstory":"placeholder backstory","birthdate":"1998-03-01","phone":"738822","nationality":"Batı Sahilleri"}', '{"grade":{"name":"Müdür Yrd.","level":1},"label":"Mekanik","onduty":false,"isboss":true,"type":"mechanic","payment":50,"name":"mechanic5"}', '{"isboss":false,"name":"none","grade":{"name":"none","level":0},"label":"No Gang Affiliaton"}', '{"x":477.19122314453127,"y":-26.99340438842773,"z":81.3458251953125}', '{"stress":0,"status":[],"callsign":"NO CALLSIGN","phonedata":{"SerialNumber":7909,"InstalledApps":[]},"fingerprint":"DN041V80YiK7476","inlaststand":false,"phone":[],"jailitems":[],"ishandcuffed":false,"commandbinds":[],"pkelepce":false,"licences":{"driver":false,"business":false,"weapon":false},"hunger":100,"jobrep":{"taxi":0,"trucker":0,"hotdog":0,"tow":0},"tracker":false,"attachmentcraftingrep":0,"dealerrep":0,"craftingrep":0,"skill":{"Sürüş Yeteneği":{"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":0,"Menu":true,"Current":5.19999999999997},"Güç":{"Stat":"MP0_STRENGTH","RemoveAmount":0,"Menu":true,"Current":5},"Ön Kaldırma Yeteneği":{"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":0,"Menu":true,"Current":0},"Ciğer Kapasitesi":{"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":0,"Menu":true,"Current":5},"Kondisyon":{"Stat":"MP0_STAMINA","RemoveAmount":0,"Menu":true,"Current":10}},"walletid":"9454","fitbit":[],"inside":{"apartment":[]},"criminalrecord":{"hasRecord":false},"bloodtype":"B-","armor":0,"communityservice":0,"thirst":100,"injail":0,"isdead":false,"kelepce":false}', '[{"info":[],"slot":1,"amount":1,"type":"item","name":"phone"},{"info":{"ammo":89,"serie":"00OuF3jm132Itld","quality":67.45000000000492},"slot":2,"amount":1,"type":"weapon","name":"weapon_pistol"},{"info":[],"slot":4,"amount":8,"type":"item","name":"advancedlockpick"},{"info":[],"slot":5,"amount":200,"type":"item","name":"casino_whitechip"},{"info":{"birthdate":"1998-03-01","gender":0,"firstname":"Charles","lastname":"Roda","citizenid":"FYH40953","nationality":"Batı Sahilleri"},"slot":6,"amount":1,"type":"item","name":"id_card"},{"info":[],"slot":7,"amount":1000003380.0,"type":"item","name":"cash"},{"info":{"birthdate":"1998-03-01","type":"Class C Driver License","lastname":"Roda","firstname":"Charles"},"slot":9,"amount":1,"type":"item","name":"driver_license"},{"info":[],"slot":10,"amount":300,"type":"item","name":"casino_bluechip"},{"info":[],"slot":12,"amount":679,"type":"item","name":"casino_blackchip"}]', '2024-02-02 05:48:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '738822', '{"Searching":{"icon":"fas fa-trash","Stat":"BINDIVE_ABILITY","RemoveAmount":0,"Current":0},"Electrical":{"icon":"fas fa-bolt","Stat":"ELECTRICAL_ABILITY","RemoveAmount":0,"Current":0},"Sprint Driving":{"icon":"fas fa-car-alt","Stat":"DRIVER_ABILITY","RemoveAmount":0,"Current":0},"Lumberjack":{"icon":"fas fa-tree","Stat":"TREE_ABILITY","RemoveAmount":0,"Current":0},"Scraping":{"icon":"fas fa-screwdriver","Stat":"SCRAP_ABILITY","RemoveAmount":0,"Current":0},"Wheelie":{"icon":"fas fa-wheelchair","Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":-0.2,"Current":0},"Driving":{"icon":"fas fa-car-side","Stat":"MP0_DRIVING_ABILITY","RemoveAmount":-0.5,"Current":0},"Strength":{"icon":"fas fa-dumbbell","Stat":"MP0_STRENGTH","RemoveAmount":-0.3,"Current":0},"Shooting":{"icon":"fas fa-bullseye","Stat":"MP0_SHOOTING_ABILITY","RemoveAmount":-0.1,"Current":0},"Hitman":{"icon":"fas fa-skull","Stat":"HITMAN_ABILITY","RemoveAmount":0,"Current":0},"Hacking":{"icon":"fas fa-laptop-code","Stat":"HACK_ABILITY","RemoveAmount":0,"Current":0},"Street Reputation":{"icon":"fas fa-cannabis","Stat":"DRUGREP_ABILITY","RemoveAmount":0,"Current":0},"Heist Reputation":{"icon":"fa-solid fa-user-secret","Stat":"HEIST_ABILITY","RemoveAmount":0,"Current":0},"Delivery Runner":{"icon":"fas fa-car","Stat":"RUNNER_ABILITY","RemoveAmount":0,"Current":0},"Lung Capacity":{"icon":"fas fa-heartbeat","Stat":"MP0_LUNG_CAPACITY","RemoveAmount":-0.1,"Current":0},"Stamina":{"icon":"fas fa-walking","Stat":"MP0_STAMINA","RemoveAmount":-0.3,"Current":0.1},"Diving":{"icon":"fas fa-water","Stat":"DIVING_ABILITY","RemoveAmount":0,"Current":0},"Drug Manufacture":{"icon":"fas fa-pills","Stat":"DRUGMAKE_ABILITY","RemoveAmount":0,"Current":0}}'),
	(1458, 'HGO75866', 1, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'Eymenp06', '{"bank":66670,"cash":0,"crypto":0,"blackmoney":0}', '{"birthdate":"2000-03-03","gender":0,"backstory":"placeholder backstory","firstname":"Tommy","cid":1,"phone":"518937","nationality":"İngiliz","lastname":"Edison","account":"42671790688"}', '{"isboss":false,"grade":{"name":"No Grades","level":0},"type":"none","payment":30,"name":"unemployed","label":"Sivil","onduty":true}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"}}', '{"x":456.8175964355469,"y":-1024.18017578125,"z":28.5384521484375}', '{"inside":{"apartment":[]},"walletid":"2653","dealerrep":0,"skill":{"Ciğer Kapasitesi":{"Stat":"MP0_LUNG_CAPACITY","Menu":true,"Current":5.1,"RemoveAmount":0},"Ön Kaldırma Yeteneği":{"Stat":"MP0_WHEELIE_ABILITY","Menu":true,"Current":0,"RemoveAmount":0},"Sürüş Yeteneği":{"Stat":"MP0_DRIVING_ABILITY","Menu":true,"Current":4.59999999999998,"RemoveAmount":0},"Kondisyon":{"Stat":"MP0_STAMINA","Menu":true,"Current":10.21999999999999,"RemoveAmount":0},"Güç":{"Stat":"MP0_STRENGTH","Menu":true,"Current":5.1,"RemoveAmount":0}},"isdead":false,"commandbinds":[],"criminalrecord":{"hasRecord":true,"date":{"min":37,"month":2,"yday":34,"isdst":false,"sec":45,"wday":7,"year":2024,"day":3,"hour":12}},"callsign":"NO CALLSIGN","phone":[],"fitbit":[],"armor":0,"bloodtype":"O+","status":[],"jailitems":[{"name":"cash","image":"cash.png","slot":1,"info":[],"amount":10030009702691,"useable":false,"weight":0,"description":"Nakit Para","shouldClose":true,"type":"item","label":"Nakit Para","unique":false}],"licences":{"business":false,"driver":false},"stress":0,"fingerprint":"dv160X08mwW8688","ishandcuffed":false,"phonedata":{"SerialNumber":9943,"InstalledApps":[]},"tracker":false,"attachmentcraftingrep":0,"hunger":95.79999999999927,"kelepce":false,"inlaststand":false,"jobrep":{"trucker":0,"hotdog":0,"taxi":0,"tow":0},"thirst":96.19999999999982,"communityservice":0,"pkelepce":false,"craftingrep":0,"injail":0}', '[]', '2024-02-03 13:35:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '518937', '{"Lung Capacity":{"icon":"fas fa-heartbeat","Current":0,"RemoveAmount":-0.1,"Stat":"MP0_LUNG_CAPACITY"},"Strength":{"icon":"fas fa-dumbbell","Current":0,"RemoveAmount":-0.3,"Stat":"MP0_STRENGTH"},"Scraping":{"icon":"fas fa-screwdriver","Current":0,"RemoveAmount":0,"Stat":"SCRAP_ABILITY"},"Electrical":{"icon":"fas fa-bolt","Current":0,"RemoveAmount":0,"Stat":"ELECTRICAL_ABILITY"},"Delivery Runner":{"icon":"fas fa-car","Current":0,"RemoveAmount":0,"Stat":"RUNNER_ABILITY"},"Searching":{"icon":"fas fa-trash","Current":0,"RemoveAmount":0,"Stat":"BINDIVE_ABILITY"},"Hitman":{"icon":"fas fa-skull","Current":0,"RemoveAmount":0,"Stat":"HITMAN_ABILITY"},"Street Reputation":{"icon":"fas fa-cannabis","Current":0,"RemoveAmount":0,"Stat":"DRUGREP_ABILITY"},"Wheelie":{"icon":"fas fa-wheelchair","Current":0,"RemoveAmount":-0.2,"Stat":"MP0_WHEELIE_ABILITY"},"Diving":{"icon":"fas fa-water","Current":0,"RemoveAmount":0,"Stat":"DIVING_ABILITY"},"Sprint Driving":{"icon":"fas fa-car-alt","Current":0,"RemoveAmount":0,"Stat":"DRIVER_ABILITY"},"Hacking":{"icon":"fas fa-laptop-code","Current":0,"RemoveAmount":0,"Stat":"HACK_ABILITY"},"Shooting":{"icon":"fas fa-bullseye","Current":0,"RemoveAmount":-0.1,"Stat":"MP0_SHOOTING_ABILITY"},"Drug Manufacture":{"icon":"fas fa-pills","Current":0,"RemoveAmount":0,"Stat":"DRUGMAKE_ABILITY"},"Stamina":{"icon":"fas fa-walking","Current":0,"RemoveAmount":-0.3,"Stat":"MP0_STAMINA"},"Heist Reputation":{"icon":"fa-solid fa-user-secret","Current":0,"RemoveAmount":0,"Stat":"HEIST_ABILITY"},"Lumberjack":{"icon":"fas fa-tree","Current":0,"RemoveAmount":0,"Stat":"TREE_ABILITY"},"Driving":{"icon":"fas fa-car-side","Current":0.1,"RemoveAmount":-0.5,"Stat":"MP0_DRIVING_ABILITY"}}'),
	(3917, 'JXV15913', 2, 'license:1b08d417a013b97236eb4941ed577c2aa22f4973', 'DRAGON', '{"cash":8000,"bank":5000,"blackmoney":0,"crypto":0}', '{"phone":"319651","backstory":"placeholder backstory","nationality":"a","cid":2,"lastname":"a","gender":0,"firstname":"a","account":"32028345147","birthdate":"2024-02-02"}', '{"type":"none","payment":10,"name":"unemployed","grade":{"level":0,"name":"Freelancer"},"label":"Civilian","isboss":false,"onduty":true}', '{"grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","isboss":false,"name":"none"}', '{"x":-1027.4637451171876,"y":-2733.283447265625,"z":20.0966796875}', '{"armor":0,"jailitems":[],"ishandcuffed":false,"craftingrep":0,"kelepce":false,"inside":{"apartment":[]},"licences":{"weapon":false,"driver":true,"business":false},"criminalrecord":{"hasRecord":false},"phone":[],"hunger":100,"jobrep":{"tow":0,"taxi":0,"trucker":0,"hotdog":0},"communityservice":0,"callsign":"NO CALLSIGN","bloodtype":"B-","pkelepce":false,"dealerrep":0,"fingerprint":"EW071H69Pyl1385","injail":0,"attachmentcraftingrep":0,"thirst":100,"tracker":false,"fitbit":[],"phonedata":{"InstalledApps":[],"SerialNumber":7842},"commandbinds":[],"stress":0,"inlaststand":false,"isdead":false,"walletid":"7109","status":[]}', '[{"name":"cash","info":[],"amount":8000,"type":"item","slot":1},{"name":"phone","info":[],"amount":1,"type":"item","slot":2},{"name":"driver_license","info":{"lastname":"a","firstname":"a","type":"Class C Driver License","birthdate":"2024-02-02"},"amount":1,"type":"item","slot":3},{"name":"id_card","info":{"gender":0,"firstname":"a","birthdate":"2024-02-02","nationality":"a","lastname":"a","citizenid":"JXV15913"},"amount":1,"type":"item","slot":4}]', '2024-02-02 02:13:13', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '319651', NULL),
	(1262, 'MLP99833', 1, 'license:01d91850ee248a58622fdeca23909912244a50eb', 'tuts2yançek', '{"cash":8000,"bank":5050,"crypto":0,"blackmoney":0}', '{"phone":"792181","birthdate":"2024-01-12","firstname":"dede","nationality":"dede","lastname":"deed","gender":0,"account":"42216339767","cid":1,"backstory":"placeholder backstory"}', '{"label":"Civilian","payment":10,"onduty":true,"grade":{"level":0,"name":"Freelancer"},"name":"unemployed","type":"none","isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":527.6439819335938,"y":-195.90328979492188,"z":52.7178955078125}', '{"armor":0,"thirst":100,"inlaststand":false,"pkelepce":false,"ishandcuffed":false,"phonedata":{"SerialNumber":9733,"InstalledApps":[]},"isdead":false,"inside":{"apartment":[]},"status":[],"licences":{"driver":true,"weapon":false,"business":false},"criminalrecord":{"hasRecord":false},"phone":[],"jobrep":{"hotdog":0,"trucker":0,"taxi":0,"tow":0},"injail":0,"stress":2,"fingerprint":"dm485r80CkP5108","commandbinds":[],"jailitems":[],"fitbit":[],"callsign":"NO CALLSIGN","attachmentcraftingrep":0,"walletid":"6574","dealerrep":0,"bloodtype":"B-","kelepce":false,"communityservice":0,"hunger":100,"tracker":false,"craftingrep":0}', '[{"name":"weapon_glock17","info":{"ammo":58,"serie":"93OpT4ou285StQV","quality":45.09999999999882},"amount":1,"slot":1,"type":"weapon"},{"name":"cash","info":[],"amount":8000,"slot":2,"type":"item"},{"name":"pistol_ammo","info":[],"amount":4,"slot":3,"type":"item"},{"name":"phone","info":[],"amount":1,"slot":4,"type":"item"},{"name":"weapon_machinepistol","info":{"ammo":61,"serie":"26NXI3fu355woxt","quality":89.79999999999962},"amount":1,"slot":5,"type":"weapon"},{"name":"id_card","info":{"nationality":"dede","gender":0,"lastname":"deed","citizenid":"MLP99833","birthdate":"2024-01-12","firstname":"dede"},"amount":1,"slot":7,"type":"item"},{"name":"driver_license","info":{"firstname":"dede","type":"Class C Driver License","birthdate":"2024-01-12","lastname":"deed"},"amount":1,"slot":8,"type":"item"}]', '2024-01-12 17:59:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
	(3387, 'PAE72962', 1, 'license:1b08d417a013b97236eb4941ed577c2aa22f4973', 'DRAGON', '{"bank":104180,"cash":87159,"crypto":0,"blackmoney":0}', '{"birthdate":"2024-02-01","gender":0,"backstory":"placeholder backstory","firstname":"V","cid":1,"phone":"839901","nationality":"A","lastname":"A","account":"54049857018"}', '{"isboss":false,"name":"unemployed","payment":10,"onduty":true,"type":"none","label":"Sivil","grade":{"name":"Vatandaş","level":0}}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"x":177.95603942871095,"y":1684.140625,"z":228.84912109375}', '{"inside":{"apartment":[]},"walletid":"7440","dealerrep":0,"pkelepce":false,"injail":0,"commandbinds":[],"hunger":91.59999999999855,"callsign":"NO CALLSIGN","phone":[],"fitbit":[],"armor":0,"tracker":false,"status":[],"craftingrep":0,"licences":{"weapon":false,"business":false,"driver":true},"stress":0,"fingerprint":"vT610c80uCG0151","ishandcuffed":false,"phonedata":{"SerialNumber":9106,"InstalledApps":[]},"isdead":false,"attachmentcraftingrep":0,"skill":{"Ciğer Kapasitesi":{"Stat":"MP0_LUNG_CAPACITY","Menu":true,"Current":5,"RemoveAmount":0},"Ön Kaldırma Yeteneği":{"Stat":"MP0_WHEELIE_ABILITY","Menu":true,"Current":0,"RemoveAmount":0},"Sürüş Yeteneği":{"Stat":"MP0_DRIVING_ABILITY","Menu":true,"Current":0.1,"RemoveAmount":0},"Kondisyon":{"Stat":"MP0_STAMINA","Menu":true,"Current":10,"RemoveAmount":0},"Güç":{"Stat":"MP0_STRENGTH","Menu":true,"Current":5,"RemoveAmount":0}},"kelepce":false,"inlaststand":false,"jobrep":{"trucker":0,"hotdog":0,"taxi":0,"tow":0},"thirst":92.39999999999964,"criminalrecord":{"hasRecord":false},"communityservice":0,"jailitems":[],"bloodtype":"AB+"}', '[{"amount":87159,"type":"item","name":"cash","slot":1,"info":[]},{"amount":1,"type":"weapon","name":"weapon_battleaxe","slot":2,"info":{"serie":"69wcf7vG765xBNA","quality":100}},{"amount":1,"type":"weapon","name":"weapon_bat","slot":3,"info":{"quality":100,"serie":"99TvN8GY648GiwP"}},{"amount":1,"type":"item","name":"blackmarket_vip_card","slot":4,"info":[]}]', '2024-02-03 14:41:16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '839901', '{"Scraping":{"Stat":"SCRAP_ABILITY","RemoveAmount":0,"icon":"fas fa-screwdriver","Current":0},"Drug Manufacture":{"Stat":"DRUGMAKE_ABILITY","RemoveAmount":0,"icon":"fas fa-pills","Current":0},"Sprint Driving":{"Stat":"DRIVER_ABILITY","RemoveAmount":0,"icon":"fas fa-car-alt","Current":0},"Lung Capacity":{"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":-0.1,"icon":"fas fa-heartbeat","Current":0},"Hitman":{"Stat":"HITMAN_ABILITY","RemoveAmount":0,"icon":"fas fa-skull","Current":0},"Strength":{"Stat":"MP0_STRENGTH","RemoveAmount":-0.3,"icon":"fas fa-dumbbell","Current":0},"Diving":{"Stat":"DIVING_ABILITY","RemoveAmount":0,"icon":"fas fa-water","Current":0},"Searching":{"Stat":"BINDIVE_ABILITY","RemoveAmount":0,"icon":"fas fa-trash","Current":0},"Shooting":{"Stat":"MP0_SHOOTING_ABILITY","RemoveAmount":-0.1,"icon":"fas fa-bullseye","Current":0},"Heist Reputation":{"Stat":"HEIST_ABILITY","RemoveAmount":0,"icon":"fa-solid fa-user-secret","Current":0},"Delivery Runner":{"Stat":"RUNNER_ABILITY","RemoveAmount":0,"icon":"fas fa-car","Current":0},"Lumberjack":{"Stat":"TREE_ABILITY","RemoveAmount":0,"icon":"fas fa-tree","Current":0},"Stamina":{"Stat":"MP0_STAMINA","RemoveAmount":-0.3,"icon":"fas fa-walking","Current":0},"Street Reputation":{"Stat":"DRUGREP_ABILITY","RemoveAmount":0,"icon":"fas fa-cannabis","Current":0},"Electrical":{"Stat":"ELECTRICAL_ABILITY","RemoveAmount":0,"icon":"fas fa-bolt","Current":0},"Driving":{"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":-0.5,"icon":"fas fa-car-side","Current":0},"Wheelie":{"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":-0.2,"icon":"fas fa-wheelchair","Current":0},"Hacking":{"Stat":"HACK_ABILITY","RemoveAmount":0,"icon":"fas fa-laptop-code","Current":0}}'),
	(1060, 'QUZ31879', 1, 'license:9ddf064155f7acc32fc39a884049a1026e383b7e', 'Ellunati', '{"crypto":0,"blackmoney":0,"cash":1661160.0,"bank":605020}', '{"cid":1,"nationality":"ABD","gender":0,"account":"15278390111","backstory":"placeholder backstory","firstname":"Sully","phone":"343438","birthdate":"2000-05-15","lastname":"Cliff"}', '{"grade":{"level":16,"name":"Cheif Of Trooper"},"onduty":true,"isboss":true,"label":"SASP","payment":10000,"name":"sasp","type":"leo"}', '{"name":"none","grade":{"level":0,"name":"none"},"isboss":false,"label":"No Gang Affiliaton"}', '{"x":-28.91868209838867,"y":-942.2637329101563,"z":29.4146728515625}', '{"stress":0,"inlaststand":false,"jobrep":{"tow":0,"taxi":0,"hotdog":0,"trucker":0},"isdead":false,"bloodtype":"B+","craftingrep":0,"dealerrep":0,"licences":{"weapon":false,"driver":true,"business":false},"fitbit":[],"injail":0,"communityservice":0,"phone":{"background":"b12"},"fingerprint":"fQ431K65yTr3775","walletid":"2923","inside":{"apartment":[]},"kelepce":false,"jailitems":[],"tracker":false,"hunger":70.59999999999926,"attachmentcraftingrep":0,"status":[],"criminalrecord":{"hasRecord":false},"commandbinds":[],"armor":36,"ishandcuffed":false,"thirst":73.39999999999984,"callsign":"400","skill":{"Kondisyon":{"Stat":"MP0_STAMINA","Current":10,"Menu":true,"RemoveAmount":0},"Ön Kaldırma Yeteneği":{"Stat":"MP0_WHEELIE_ABILITY","Current":0,"Menu":true,"RemoveAmount":0},"Güç":{"Stat":"MP0_STRENGTH","Current":5,"Menu":true,"RemoveAmount":0},"Ciğer Kapasitesi":{"Stat":"MP0_LUNG_CAPACITY","Current":5,"Menu":true,"RemoveAmount":0},"Sürüş Yeteneği":{"Stat":"MP0_DRIVING_ABILITY","Current":3.49999999999999,"Menu":true,"RemoveAmount":0}},"phonedata":{"SerialNumber":4795,"InstalledApps":[]},"pkelepce":false}', '[{"name":"weapon_glock17","amount":1,"slot":1,"type":"weapon","info":{"ammo":109,"serie":"18dPf6cG049aJYQ","quality":97.89999999999992}},{"name":"weapon_beanbagshotgun","amount":1,"slot":2,"type":"weapon","info":{"ammo":227,"serie":"95lWH3Pt573xpUT","quality":100.0}},{"name":"pistol_ammo","amount":6,"slot":3,"type":"item","info":[]},{"name":"bandage","amount":50,"slot":4,"type":"item","info":[]},{"name":"heavyarmor","amount":2,"slot":5,"type":"item","info":[]},{"name":"firstaid","amount":14,"slot":6,"type":"item","info":[]},{"name":"empty_evidence_bag","amount":5,"slot":7,"type":"item","info":[]},{"name":"drone_flyer_7","amount":1,"slot":8,"type":"item","info":[]},{"name":"bodycam","amount":1,"slot":9,"type":"item","info":[]},{"name":"radio","amount":1,"slot":10,"type":"item","info":[]},{"name":"megaphone","amount":1,"slot":11,"type":"item","info":[]},{"name":"weapon_flashlight","amount":1,"slot":12,"type":"weapon","info":{"quality":100,"serie":"16piP4Ry892zQKG"}},{"name":"phone","amount":1,"slot":13,"type":"item","info":[]},{"name":"pkelepce","amount":5,"slot":14,"type":"item","info":[]},{"name":"gps","amount":1,"slot":15,"type":"item","info":[]},{"name":"vehiclekey","amount":1,"slot":133,"type":"item","info":{"model":" PD Tahot","plate":"ST  6425","lock":4321}},{"name":"driver_license","amount":1,"slot":36,"type":"item","info":{"firstname":"Sully","birthdate":"2000-05-15","type":"Class C Driver License","lastname":"Cliff"}},{"name":"badge","amount":1,"slot":37,"type":"item","info":[]},{"name":"vehiclekey","amount":1,"slot":136,"type":"item","info":{"model":" PD Challgargent","plate":"PD  7298","lock":4321}},{"name":"cash","amount":1661160.0,"slot":39,"type":"item","info":[]},{"name":"id_card","amount":1,"slot":40,"type":"item","info":{"citizenid":"QUZ31879","nationality":"ABD","birthdate":"2000-05-15","gender":0,"lastname":"Cliff","firstname":"Sully"}},{"name":"vehiclekey","amount":1,"slot":135,"type":"item","info":{"model":" PD Cruiser","plate":"PD  8618","lock":4321}},{"name":"vehiclekey","amount":1,"slot":134,"type":"item","info":{"model":" PD Stgang","plate":"ST  4519","lock":4321}}]', '2024-01-20 17:28:06', 'QB5653', 1234, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL),
	(4235, 'RNG21283', 1, 'license:93d12f54207d0e7f6451b8a015c3a16597e70ff6', 'AM SORİ GOTODE', '{"crypto":0,"cash":7900,"bank":130,"blackmoney":0}', '{"lastname":"Morgan","cid":1,"birthdate":"1999-05-19","account":"12852232696","firstname":"Arthur","phone":"914746","backstory":"placeholder backstory","nationality":"türk","gender":0}', '{"payment":10,"name":"unemployed","isboss":false,"grade":{"name":"Freelancer","level":0},"onduty":true,"type":"none","label":"Civilian"}', '{"grade":{"name":"none","level":0},"name":"none","isboss":false,"label":"No Gang Affiliaton"}', '{"x":548.5186767578125,"y":-191.76263427734376,"z":53.880615234375}', '{"licences":{"business":false,"driver":true,"weapon":false},"attachmentcraftingrep":0,"injail":0,"hunger":45.39999999999054,"dealerrep":0,"stress":0,"fingerprint":"Gi092r04PPg5723","kelepce":false,"jailitems":[],"ishandcuffed":false,"callsign":"NO CALLSIGN","armor":0,"walletid":"4788","phone":[],"communityservice":0,"bloodtype":"O+","commandbinds":[],"isdead":false,"thirst":50.59999999999763,"skill":{"Kondisyon":{"Menu":true,"Stat":"MP0_STAMINA","RemoveAmount":0,"Current":10},"Ciğer Kapasitesi":{"Menu":true,"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":0,"Current":5},"Ön Kaldırma Yeteneği":{"Menu":true,"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":0,"Current":0},"Sürüş Yeteneği":{"Menu":true,"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":0,"Current":1.09999999999999},"Güç":{"Menu":true,"Stat":"MP0_STRENGTH","RemoveAmount":0,"Current":5}},"phonedata":{"SerialNumber":9887,"InstalledApps":[]},"inlaststand":false,"criminalrecord":{"hasRecord":false},"inside":{"apartment":[]},"jobrep":{"tow":0,"taxi":0,"hotdog":0,"trucker":0},"craftingrep":0,"tracker":false,"fitbit":[],"status":[],"pkelepce":false}', '[{"info":[],"name":"cash","slot":1,"type":"item","amount":7900},{"info":[],"name":"sprunklight","slot":2,"type":"item","amount":1}]', '2024-02-02 20:39:52', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '914746', '{"Stamina":{"RemoveAmount":-0.3,"icon":"fas fa-walking","Stat":"MP0_STAMINA","Current":0},"Electrical":{"RemoveAmount":0,"icon":"fas fa-bolt","Stat":"ELECTRICAL_ABILITY","Current":0},"Strength":{"RemoveAmount":-0.3,"icon":"fas fa-dumbbell","Stat":"MP0_STRENGTH","Current":0},"Scraping":{"RemoveAmount":0,"icon":"fas fa-screwdriver","Stat":"SCRAP_ABILITY","Current":0},"Shooting":{"RemoveAmount":-0.1,"icon":"fas fa-bullseye","Stat":"MP0_SHOOTING_ABILITY","Current":0},"Drug Manufacture":{"RemoveAmount":0,"icon":"fas fa-pills","Stat":"DRUGMAKE_ABILITY","Current":0},"Delivery Runner":{"RemoveAmount":0,"icon":"fas fa-car","Stat":"RUNNER_ABILITY","Current":0},"Street Reputation":{"RemoveAmount":0,"icon":"fas fa-cannabis","Stat":"DRUGREP_ABILITY","Current":0},"Lumberjack":{"RemoveAmount":0,"icon":"fas fa-tree","Stat":"TREE_ABILITY","Current":0},"Searching":{"RemoveAmount":0,"icon":"fas fa-trash","Stat":"BINDIVE_ABILITY","Current":0},"Wheelie":{"RemoveAmount":-0.2,"icon":"fas fa-wheelchair","Stat":"MP0_WHEELIE_ABILITY","Current":0},"Driving":{"RemoveAmount":-0.5,"icon":"fas fa-car-side","Stat":"MP0_DRIVING_ABILITY","Current":0.6},"Lung Capacity":{"RemoveAmount":-0.1,"icon":"fas fa-heartbeat","Stat":"MP0_LUNG_CAPACITY","Current":0},"Diving":{"RemoveAmount":0,"icon":"fas fa-water","Stat":"DIVING_ABILITY","Current":0},"Hacking":{"RemoveAmount":0,"icon":"fas fa-laptop-code","Stat":"HACK_ABILITY","Current":0},"Heist Reputation":{"RemoveAmount":0,"icon":"fa-solid fa-user-secret","Stat":"HEIST_ABILITY","Current":0},"Hitman":{"RemoveAmount":0,"icon":"fas fa-skull","Stat":"HITMAN_ABILITY","Current":0},"Sprint Driving":{"RemoveAmount":0,"icon":"fas fa-car-alt","Stat":"DRIVER_ABILITY","Current":0}}'),
	(2860, 'RQT13252', 1, 'license:828acebc7786271b15676e325957b7b3e38ea018', 'CloudFloreİsComeback', '{"blackmoney":0,"cash":8000,"crypto":0,"bank":5000}', '{"gender":0,"birthdate":"2024-01-31","phone":"997272","backstory":"placeholder backstory","nationality":"ADANA","account":"37101759954","cid":1,"lastname":"MOTOVLOG","firstname":"BYK"}', '{"label":"Civilian","payment":10,"type":"none","onduty":true,"name":"unemployed","grade":{"name":"Freelancer","level":0},"isboss":false}', '{"name":"none","label":"No Gang Affiliaton","isboss":false,"grade":{"name":"none","level":0}}', '{"x":-1066.20654296875,"y":-2579.67041015625,"z":20.0966796875}', '{"armor":0,"communityservice":0,"kelepce":false,"walletid":"7703","jobrep":{"tow":0,"taxi":0,"hotdog":0,"trucker":0},"commandbinds":[],"ishandcuffed":false,"dealerrep":0,"phonedata":{"SerialNumber":5084,"InstalledApps":[]},"criminalrecord":{"hasRecord":false},"attachmentcraftingrep":0,"thirst":92.39999999999964,"inside":{"apartment":[]},"licences":{"business":false,"weapon":false,"driver":true},"injail":0,"inlaststand":false,"bloodtype":"A-","stress":0,"callsign":"NO CALLSIGN","isdead":false,"hunger":91.59999999999855,"tracker":false,"craftingrep":0,"pkelepce":false,"fingerprint":"js396T12DuH1147","phone":[],"status":[],"jailitems":[],"fitbit":[]}', '[{"info":{"gender":0,"firstname":"BYK","lastname":"MOTOVLOG","citizenid":"RQT13252","birthdate":"2024-01-31","nationality":"ADANA"},"slot":1,"name":"id_card","type":"item","amount":1},{"info":[],"slot":2,"name":"phone","type":"item","amount":1},{"info":{"type":"Class C Driver License","firstname":"BYK","lastname":"MOTOVLOG","birthdate":"2024-01-31"},"slot":3,"name":"driver_license","type":"item","amount":1},{"info":[],"slot":4,"name":"cash","type":"item","amount":8000}]', '2024-01-31 10:33:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '{"Searching":{"icon":"fas fa-trash","RemoveAmount":0,"Current":0,"Stat":"BINDIVE_ABILITY"},"Shooting":{"icon":"fas fa-bullseye","RemoveAmount":-0.1,"Current":0,"Stat":"MP0_SHOOTING_ABILITY"},"Scraping":{"icon":"fas fa-screwdriver","RemoveAmount":0,"Current":0,"Stat":"SCRAP_ABILITY"},"Sprint Driving":{"icon":"fas fa-car-alt","RemoveAmount":0,"Current":0,"Stat":"DRIVER_ABILITY"},"Hitman":{"icon":"fas fa-skull","RemoveAmount":0,"Current":0,"Stat":"HITMAN_ABILITY"},"Heist Reputation":{"icon":"fa-solid fa-user-secret","RemoveAmount":0,"Current":0,"Stat":"HEIST_ABILITY"},"Stamina":{"icon":"fas fa-walking","RemoveAmount":-0.3,"Current":0,"Stat":"MP0_STAMINA"},"Lung Capacity":{"icon":"fas fa-heartbeat","RemoveAmount":-0.1,"Current":0,"Stat":"MP0_LUNG_CAPACITY"},"Hacking":{"icon":"fas fa-laptop-code","RemoveAmount":0,"Current":0,"Stat":"HACK_ABILITY"},"Lumberjack":{"icon":"fas fa-tree","RemoveAmount":0,"Current":0,"Stat":"TREE_ABILITY"},"Street Reputation":{"icon":"fas fa-cannabis","RemoveAmount":0,"Current":0,"Stat":"DRUGREP_ABILITY"},"Strength":{"icon":"fas fa-dumbbell","RemoveAmount":-0.3,"Current":0,"Stat":"MP0_STRENGTH"},"Drug Manufacture":{"icon":"fas fa-pills","RemoveAmount":0,"Current":0,"Stat":"DRUGMAKE_ABILITY"},"Wheelie":{"icon":"fas fa-wheelchair","RemoveAmount":-0.2,"Current":0,"Stat":"MP0_WHEELIE_ABILITY"},"Driving":{"icon":"fas fa-car-side","RemoveAmount":-0.5,"Current":0,"Stat":"MP0_DRIVING_ABILITY"},"Electrical":{"icon":"fas fa-bolt","RemoveAmount":0,"Current":0,"Stat":"ELECTRICAL_ABILITY"},"Diving":{"icon":"fas fa-water","RemoveAmount":0,"Current":0,"Stat":"DIVING_ABILITY"},"Delivery Runner":{"icon":"fas fa-car","RemoveAmount":0,"Current":0,"Stat":"RUNNER_ABILITY"}}'),
	(4228, 'SEV41363', 2, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'RedViper', '{"bank":5020,"cash":8000,"blackmoney":0,"crypto":0}', '{"phone":"523554","firstname":"AHJME","gender":0,"nationality":"DFSSDFDFSDFS","backstory":"placeholder backstory","account":"62166769893","cid":2,"lastname":"SDFDFSDFSSSDFDSF","birthdate":"2024-02-06"}', '{"label":"Civilian","isboss":false,"grade":{"name":"Freelancer","level":0},"payment":10,"type":"none","name":"unemployed","onduty":true}', '{"grade":{"name":"none","level":0},"label":"No Gang Affiliaton","name":"none","isboss":false}', '{"x":-1036.7076416015626,"y":-2860.12744140625,"z":49.3648681640625}', '{"armor":0,"inlaststand":false,"fitbit":[],"tracker":false,"ishandcuffed":false,"hunger":49.59999999999127,"isdead":false,"phonedata":{"InstalledApps":[],"SerialNumber":1287},"inside":{"apartment":[]},"callsign":"NO CALLSIGN","jailitems":[],"status":[],"stress":0,"criminalrecord":{"hasRecord":false},"kelepce":false,"commandbinds":[],"attachmentcraftingrep":0,"fingerprint":"zk769C59STm0386","licences":{"weapon":false,"driver":true,"business":false},"walletid":"9167","phone":[],"communityservice":0,"dealerrep":0,"injail":0,"bloodtype":"O-","craftingrep":0,"jobrep":{"tow":0,"taxi":0,"hotdog":0,"trucker":0},"thirst":54.39999999999782,"pkelepce":false}', '[{"slot":1,"amount":1,"type":"item","info":{"nationality":"DFSSDFDFSDFS","citizenid":"SEV41363","firstname":"AHJME","lastname":"SDFDFSDFSSSDFDSF","gender":0,"birthdate":"2024-02-06"},"name":"id_card"},{"slot":2,"amount":1,"type":"item","info":{"birthdate":"2024-02-06","lastname":"SDFDFSDFSSSDFDSF","type":"Class C Driver License","firstname":"AHJME"},"name":"driver_license"},{"slot":3,"amount":1,"type":"item","info":[],"name":"phone"},{"slot":4,"amount":8000,"type":"item","info":[],"name":"cash"}]', '2024-02-02 16:01:10', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '523554', '{"Wheelie":{"Stat":"MP0_WHEELIE_ABILITY","icon":"fas fa-wheelchair","Current":0,"RemoveAmount":-0.2},"Driving":{"Stat":"MP0_DRIVING_ABILITY","icon":"fas fa-car-side","Current":0,"RemoveAmount":-0.5},"Hitman":{"Stat":"HITMAN_ABILITY","icon":"fas fa-skull","Current":0,"RemoveAmount":0},"Sprint Driving":{"Stat":"DRIVER_ABILITY","icon":"fas fa-car-alt","Current":0,"RemoveAmount":0},"Searching":{"Stat":"BINDIVE_ABILITY","icon":"fas fa-trash","Current":0,"RemoveAmount":0},"Delivery Runner":{"Stat":"RUNNER_ABILITY","icon":"fas fa-car","Current":0,"RemoveAmount":0},"Drug Manufacture":{"Stat":"DRUGMAKE_ABILITY","icon":"fas fa-pills","Current":0,"RemoveAmount":0},"Street Reputation":{"Stat":"DRUGREP_ABILITY","icon":"fas fa-cannabis","Current":0,"RemoveAmount":0},"Scraping":{"Stat":"SCRAP_ABILITY","icon":"fas fa-screwdriver","Current":0,"RemoveAmount":0},"Shooting":{"Stat":"MP0_SHOOTING_ABILITY","icon":"fas fa-bullseye","Current":0,"RemoveAmount":-0.1},"Lumberjack":{"Stat":"TREE_ABILITY","icon":"fas fa-tree","Current":0,"RemoveAmount":0},"Diving":{"Stat":"DIVING_ABILITY","icon":"fas fa-water","Current":0,"RemoveAmount":0},"Electrical":{"Stat":"ELECTRICAL_ABILITY","icon":"fas fa-bolt","Current":0,"RemoveAmount":0},"Lung Capacity":{"Stat":"MP0_LUNG_CAPACITY","icon":"fas fa-heartbeat","Current":0,"RemoveAmount":-0.1},"Strength":{"Stat":"MP0_STRENGTH","icon":"fas fa-dumbbell","Current":0,"RemoveAmount":-0.3},"Stamina":{"Stat":"MP0_STAMINA","icon":"fas fa-walking","Current":0,"RemoveAmount":-0.3},"Heist Reputation":{"Stat":"HEIST_ABILITY","icon":"fa-solid fa-user-secret","Current":0,"RemoveAmount":0},"Hacking":{"Stat":"HACK_ABILITY","icon":"fas fa-laptop-code","Current":0,"RemoveAmount":0}}'),
	(3250, 'SRK03290', 1, 'license:080c53b8c8313f800462a8232ee7a920e015c654', 'Gamers', '{"cash":8000,"blackmoney":0,"crypto":0,"bank":5060}', '{"firstname":"Lucifer","cid":1,"nationality":"kurd","gender":0,"phone":"778860","birthdate":"2024-02-01","account":"23330736715","lastname":"henderson","backstory":"placeholder backstory"}', '{"isboss":false,"type":"mechanic","label":"Mekanik","onduty":false,"grade":{"name":"No Grades","level":0},"name":"mechanic","payment":30}', '{"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"name":"none","isboss":false}', '{"x":311.1692199707031,"y":-401.6835021972656,"z":45.236572265625}', '{"injail":0,"communityservice":0,"commandbinds":[],"stress":0,"armor":0,"skill":{"Ön Kaldırma Yeteneği":{"Current":0,"Menu":true,"RemoveAmount":0,"Stat":"MP0_WHEELIE_ABILITY"},"Güç":{"Current":5,"Menu":true,"RemoveAmount":0,"Stat":"MP0_STRENGTH"},"Sürüş Yeteneği":{"Current":0.89999999999999,"Menu":true,"RemoveAmount":0,"Stat":"MP0_DRIVING_ABILITY"},"Ciğer Kapasitesi":{"Current":5.1,"Menu":true,"RemoveAmount":0,"Stat":"MP0_LUNG_CAPACITY"},"Kondisyon":{"Current":10.02,"Menu":true,"RemoveAmount":0,"Stat":"MP0_STAMINA"}},"inside":{"apartment":[]},"attachmentcraftingrep":0,"tracker":false,"pkelepce":false,"isdead":false,"status":[],"hunger":100,"thirst":100,"craftingrep":0,"criminalrecord":{"hasRecord":false},"callsign":"NO CALLSIGN","kelepce":false,"bloodtype":"A-","fitbit":[],"phone":[],"dealerrep":0,"jailitems":[],"ishandcuffed":false,"phonedata":{"InstalledApps":[],"SerialNumber":9491},"fingerprint":"VH236I47CAU7230","jobrep":{"trucker":0,"taxi":0,"tow":0,"hotdog":0},"walletid":"5789","licences":{"weapon":false,"driver":true,"business":false},"inlaststand":false}', '[{"type":"item","name":"phone","amount":1,"slot":1,"info":[]},{"type":"item","name":"cash","amount":8000,"slot":3,"info":[]}]', '2024-02-01 19:57:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '778860', '{"Delivery Runner":{"RemoveAmount":0,"icon":"fas fa-car","Current":0,"Stat":"RUNNER_ABILITY"},"Electrical":{"RemoveAmount":0,"icon":"fas fa-bolt","Current":0,"Stat":"ELECTRICAL_ABILITY"},"Hacking":{"RemoveAmount":0,"icon":"fas fa-laptop-code","Current":0,"Stat":"HACK_ABILITY"},"Lumberjack":{"RemoveAmount":0,"icon":"fas fa-tree","Current":0,"Stat":"TREE_ABILITY"},"Scraping":{"RemoveAmount":0,"icon":"fas fa-screwdriver","Current":0,"Stat":"SCRAP_ABILITY"},"Strength":{"RemoveAmount":-0.3,"icon":"fas fa-dumbbell","Current":0,"Stat":"MP0_STRENGTH"},"Lung Capacity":{"RemoveAmount":-0.1,"icon":"fas fa-heartbeat","Current":0,"Stat":"MP0_LUNG_CAPACITY"},"Diving":{"RemoveAmount":0,"icon":"fas fa-water","Current":0,"Stat":"DIVING_ABILITY"},"Street Reputation":{"RemoveAmount":0,"icon":"fas fa-cannabis","Current":0,"Stat":"DRUGREP_ABILITY"},"Drug Manufacture":{"RemoveAmount":0,"icon":"fas fa-pills","Current":0,"Stat":"DRUGMAKE_ABILITY"},"Sprint Driving":{"RemoveAmount":0,"icon":"fas fa-car-alt","Current":0,"Stat":"DRIVER_ABILITY"},"Hitman":{"RemoveAmount":0,"icon":"fas fa-skull","Current":0,"Stat":"HITMAN_ABILITY"},"Shooting":{"RemoveAmount":-0.1,"icon":"fas fa-bullseye","Current":0,"Stat":"MP0_SHOOTING_ABILITY"},"Driving":{"RemoveAmount":-0.5,"icon":"fas fa-car-side","Current":0,"Stat":"MP0_DRIVING_ABILITY"},"Searching":{"RemoveAmount":0,"icon":"fas fa-trash","Current":0,"Stat":"BINDIVE_ABILITY"},"Stamina":{"RemoveAmount":-0.3,"icon":"fas fa-walking","Current":0.1,"Stat":"MP0_STAMINA"},"Heist Reputation":{"RemoveAmount":0,"icon":"fa-solid fa-user-secret","Current":0,"Stat":"HEIST_ABILITY"},"Wheelie":{"RemoveAmount":-0.2,"icon":"fas fa-wheelchair","Current":0,"Stat":"MP0_WHEELIE_ABILITY"}}'),
	(1468, 'SVN81090', 4, 'license:080c53b8c8313f800462a8232ee7a920e015c654', 'yowaimo19', '{"bank":1060,"blackmoney":0,"cash":8000,"crypto":0}', '{"lastname":"sas","nationality":"saa","gender":0,"account":"75308767058","backstory":"placeholder backstory","cid":4,"phone":"637142","birthdate":"2024-01-19","firstname":"sa"}', '{"name":"unemployed","onduty":true,"isboss":false,"label":"Civilian","payment":10,"grade":{"name":"Freelancer","level":0},"type":"none"}', '{"name":"none","grade":{"name":"none","level":0},"isboss":false,"label":"No Gang Affiliaton"}', '{"x":2941.87255859375,"y":2759.287841796875,"z":42.5069580078125}', '{"commandbinds":[],"jobrep":{"tow":0,"taxi":0,"hotdog":0,"trucker":0},"isdead":false,"bloodtype":"AB+","craftingrep":0,"dealerrep":0,"inlaststand":true,"fitbit":[],"callsign":"NO CALLSIGN","communityservice":0,"injail":0,"phonedata":{"SerialNumber":8540,"InstalledApps":[]},"walletid":"3833","inside":{"apartment":[]},"kelepce":false,"jailitems":[],"tracker":false,"hunger":100,"attachmentcraftingrep":0,"status":[],"licences":{"weapon":false,"driver":true,"business":false},"criminalrecord":{"hasRecord":false},"fingerprint":"NM917u65wbq9881","ishandcuffed":false,"thirst":100,"stress":0,"armor":0,"phone":[],"pkelepce":false}', '[{"name":"cash","amount":8000,"slot":1,"type":"item","info":[]},{"name":"weapon_glock17","amount":1,"slot":2,"type":"weapon","info":{"serie":"61lAG2bQ603Stxm","ammo":96,"quality":66.10000000000514}},{"name":"weapon_bottle","amount":1,"slot":3,"type":"weapon","info":{"serie":"85FdW9Sw625cjYQ","ammo":0,"quality":100}},{"name":"pistol_ammo","amount":13,"slot":4,"type":"item","info":[]},{"name":"bandage","amount":2,"slot":9,"type":"item","info":[]}]', '2024-01-20 16:44:24', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
	(2914, 'UQL52088', 1, 'license:e207f3efbd5ce9740fb0023c63e1bc98a00e162b', 'cetin01', '{"bank":1000039879003785,"blackmoney":0,"cash":79999999999967710,"crypto":0}', '{"cid":1,"firstname":"Abdulkadir","gender":0,"account":"61189306641","phone":"320644","backstory":"placeholder backstory","birthdate":"2024-01-31","nationality":"Afrika","lastname":"Naneçalan"}', '{"payment":10,"name":"unemployed","isboss":false,"onduty":true,"label":"Sivil","type":"none","grade":{"level":0,"name":"Vatandaş"}}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":287.1164855957031,"y":-521.1956176757813,"z":43.2989501953125}', '{"commandbinds":[],"ishandcuffed":false,"phone":[],"inlaststand":false,"criminalrecord":{"hasRecord":false},"fitbit":[],"bloodtype":"O+","craftingrep":0,"inside":{"apartment":[]},"skill":{"Güç":{"RemoveAmount":0,"Menu":true,"Stat":"MP0_STRENGTH","Current":5},"Ön Kaldırma Yeteneği":{"RemoveAmount":0,"Menu":true,"Stat":"MP0_WHEELIE_ABILITY","Current":0},"Kondisyon":{"RemoveAmount":0,"Menu":true,"Stat":"MP0_STAMINA","Current":10},"Sürüş Yeteneği":{"RemoveAmount":0,"Menu":true,"Stat":"MP0_DRIVING_ABILITY","Current":0.4},"Ciğer Kapasitesi":{"RemoveAmount":0,"Menu":true,"Stat":"MP0_LUNG_CAPACITY","Current":5}},"thirst":73.39999999999873,"hunger":70.5999999999949,"status":[],"tracker":false,"pkelepce":false,"stress":0,"jobrep":{"hotdog":0,"taxi":0,"tow":0,"trucker":0},"fingerprint":"IF913Q49Taq1611","licences":{"driver":true,"weapon":false,"business":false},"jailitems":[],"phonedata":{"InstalledApps":[],"SerialNumber":6311},"kelepce":false,"injail":0,"dealerrep":0,"isdead":false,"attachmentcraftingrep":0,"callsign":"NO CALLSIGN","communityservice":0,"walletid":"5523","armor":0}', '[{"info":[],"name":"cash","slot":1,"amount":79999999999967710,"type":"item"},{"info":[],"name":"fishingrod2","slot":2,"amount":1,"type":"item"},{"info":[],"name":"anchovy","slot":3,"amount":1,"type":"item"},{"info":{"quality":100,"ammo":0,"serie":"70NEV5eX244mSth"},"name":"weapon_katana","slot":4,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"48BUF5Mr220kEwU","ammo":0},"name":"weapon_carbinerifle_mk2","slot":5,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"57diX7Bo755peUQ"},"name":"weapon_machete","slot":6,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"18gEH6Wl682aRIX"},"name":"weapon_ak47","slot":7,"amount":1,"type":"weapon"},{"info":{"quality":100,"ammo":0,"serie":"06EmS1fh897LMNk"},"name":"weapon_machete","slot":8,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"15KHI5Qn599zDdQ"},"name":"weapon_carbinerifle_mk2","slot":11,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"53jtf5uk535NUUu"},"name":"weapon_carbinerifle_mk2","slot":12,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"47tSJ3ne818cwLi"},"name":"weapon_carbinerifle_mk2","slot":13,"amount":1,"type":"weapon"},{"info":[],"name":"goldbar","slot":15,"amount":8,"type":"item"},{"info":{"quality":100,"serie":"05DPF7Zk096YKrz"},"name":"weapon_carbinerifle_mk2","slot":16,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"03xYW9UB419mVzw"},"name":"weapon_carbinerifle_mk2","slot":17,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"07JyJ7XW731zebh"},"name":"weapon_carbinerifle_mk2","slot":18,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"84tel4em178rAan"},"name":"weapon_carbinerifle_mk2","slot":19,"amount":1,"type":"weapon"},{"info":{"quality":100,"ammo":0,"serie":"42DSm7Cd353NUEv"},"name":"weapon_katana","slot":20,"amount":1,"type":"weapon"},{"info":[],"name":"trojan_usb","slot":22,"amount":3,"type":"item"},{"info":[],"name":"stone","slot":23,"amount":4,"type":"item"},{"info":{"quality":100,"ammo":0,"serie":"27PUo3SQ247ObGQ"},"name":"weapon_ak47","slot":24,"amount":1,"type":"weapon"}]', '2024-02-01 15:11:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '320644', '{"Heist Reputation":{"Stat":"HEIST_ABILITY","RemoveAmount":0,"Current":0,"icon":"fa-solid fa-user-secret"},"Driving":{"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":-0.5,"Current":0,"icon":"fas fa-car-side"},"Lumberjack":{"Stat":"TREE_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-tree"},"Stamina":{"Stat":"MP0_STAMINA","RemoveAmount":-0.3,"Current":0,"icon":"fas fa-walking"},"Diving":{"Stat":"DIVING_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-water"},"Hacking":{"Stat":"HACK_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-laptop-code"},"Scraping":{"Stat":"SCRAP_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-screwdriver"},"Drug Manufacture":{"Stat":"DRUGMAKE_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-pills"},"Delivery Runner":{"Stat":"RUNNER_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-car"},"Searching":{"Stat":"BINDIVE_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-trash"},"Street Reputation":{"Stat":"DRUGREP_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-cannabis"},"Electrical":{"Stat":"ELECTRICAL_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-bolt"},"Hitman":{"Stat":"HITMAN_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-skull"},"Shooting":{"Stat":"MP0_SHOOTING_ABILITY","RemoveAmount":-0.1,"Current":0,"icon":"fas fa-bullseye"},"Wheelie":{"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":-0.2,"Current":0,"icon":"fas fa-wheelchair"},"Lung Capacity":{"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":-0.1,"Current":0,"icon":"fas fa-heartbeat"},"Strength":{"Stat":"MP0_STRENGTH","RemoveAmount":-0.3,"Current":0,"icon":"fas fa-dumbbell"},"Sprint Driving":{"Stat":"DRIVER_ABILITY","RemoveAmount":0,"Current":0,"icon":"fas fa-car-alt"}}'),
	(3683, 'WZB65598', 1, 'license:e0583589f7ca5650689105802df0bd4975d2d06f', 'Kaslızenci', '{"bank":530,"cash":1002780,"crypto":0,"blackmoney":0}', '{"phone":"117948","firstname":"Sabri","gender":0,"lastname":"soyan","backstory":"placeholder backstory","cid":1,"nationality":"kürdistan","account":"13667140657","birthdate":"2024-02-06"}', '{"label":"Civilian","isboss":false,"name":"unemployed","type":"none","payment":10,"grade":{"name":"Freelancer","level":0},"onduty":true}', '{"isboss":false,"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"name":"none"}', '{"x":-685.3054809570313,"y":-2120.4658203125,"z":5.9765625}', '{"armor":0,"fingerprint":"wm608W47mOd6981","attachmentcraftingrep":0,"inside":{"apartment":[]},"skill":{"Güç":{"Menu":true,"Current":5,"Stat":"MP0_STRENGTH","RemoveAmount":0},"Ön Kaldırma Yeteneği":{"Menu":true,"Current":0,"Stat":"MP0_WHEELIE_ABILITY","RemoveAmount":0},"Sürüş Yeteneği":{"Menu":true,"Current":0.89999999999999,"Stat":"MP0_DRIVING_ABILITY","RemoveAmount":0},"Ciğer Kapasitesi":{"Menu":true,"Current":5,"Stat":"MP0_LUNG_CAPACITY","RemoveAmount":0},"Kondisyon":{"Menu":true,"Current":10,"Stat":"MP0_STAMINA","RemoveAmount":0}},"ishandcuffed":false,"hunger":100,"isdead":false,"phonedata":{"SerialNumber":1386,"InstalledApps":[]},"jailitems":[],"callsign":"NO CALLSIGN","criminalrecord":{"hasRecord":false},"tracker":false,"stress":0,"inlaststand":false,"kelepce":false,"commandbinds":[],"phone":[],"bloodtype":"A-","licences":{"weapon":false,"driver":true,"business":false},"walletid":"1542","dealerrep":0,"communityservice":0,"fitbit":[],"injail":0,"pkelepce":false,"craftingrep":0,"jobrep":{"tow":0,"taxi":0,"hotdog":0,"trucker":0},"thirst":100,"status":[]}', '[{"slot":1,"amount":1,"type":"item","info":[],"name":"fishingrod1"},{"slot":2,"amount":10,"type":"item","info":[],"name":"illegalfishbait"},{"slot":4,"amount":38,"type":"item","info":[],"name":"fishbait"},{"slot":6,"amount":1,"type":"item","info":{"birthdate":"2024-02-06","lastname":"soyan","type":"Class C Driver License","firstname":"Sabri"},"name":"driver_license"},{"slot":7,"amount":1,"type":"item","info":[],"name":"phone"},{"slot":8,"amount":1002780,"type":"item","info":[],"name":"cash"},{"slot":9,"amount":1,"type":"item","info":{"nationality":"kürdistan","citizenid":"WZB65598","firstname":"Sabri","lastname":"soyan","gender":0,"birthdate":"2024-02-06"},"name":"id_card"}]', '2024-02-02 15:32:42', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '117948', '{"Street Reputation":{"Stat":"DRUGREP_ABILITY","Current":0,"icon":"fas fa-cannabis","RemoveAmount":0},"Scraping":{"Stat":"SCRAP_ABILITY","Current":0,"icon":"fas fa-screwdriver","RemoveAmount":0},"Hitman":{"Stat":"HITMAN_ABILITY","Current":0,"icon":"fas fa-skull","RemoveAmount":0},"Electrical":{"Stat":"ELECTRICAL_ABILITY","Current":0,"icon":"fas fa-bolt","RemoveAmount":0},"Stamina":{"Stat":"MP0_STAMINA","Current":0.1,"icon":"fas fa-walking","RemoveAmount":-0.3},"Shooting":{"Stat":"MP0_SHOOTING_ABILITY","Current":0,"icon":"fas fa-bullseye","RemoveAmount":-0.1},"Searching":{"Stat":"BINDIVE_ABILITY","Current":0,"icon":"fas fa-trash","RemoveAmount":0},"Hacking":{"Stat":"HACK_ABILITY","Current":0,"icon":"fas fa-laptop-code","RemoveAmount":0},"Lumberjack":{"Stat":"TREE_ABILITY","Current":0,"icon":"fas fa-tree","RemoveAmount":0},"Heist Reputation":{"Stat":"HEIST_ABILITY","Current":0,"icon":"fa-solid fa-user-secret","RemoveAmount":0},"Diving":{"Stat":"DIVING_ABILITY","Current":0,"icon":"fas fa-water","RemoveAmount":0},"Sprint Driving":{"Stat":"DRIVER_ABILITY","Current":0,"icon":"fas fa-car-alt","RemoveAmount":0},"Wheelie":{"Stat":"MP0_WHEELIE_ABILITY","Current":0,"icon":"fas fa-wheelchair","RemoveAmount":-0.2},"Strength":{"Stat":"MP0_STRENGTH","Current":0,"icon":"fas fa-dumbbell","RemoveAmount":-0.3},"Delivery Runner":{"Stat":"RUNNER_ABILITY","Current":0,"icon":"fas fa-car","RemoveAmount":0},"Driving":{"Stat":"MP0_DRIVING_ABILITY","Current":0.1,"icon":"fas fa-car-side","RemoveAmount":-0.5},"Drug Manufacture":{"Stat":"DRUGMAKE_ABILITY","Current":0,"icon":"fas fa-pills","RemoveAmount":0},"Lung Capacity":{"Stat":"MP0_LUNG_CAPACITY","Current":0,"icon":"fas fa-heartbeat","RemoveAmount":-0.1}}'),
	(1461, 'XRK76375', 1, 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'slaugh', '{"blackmoney":0,"crypto":0,"cash":19969989628779,"bank":1100000244607}', '{"nationality":"Fransız","gender":0,"phone":"197265","backstory":"placeholder backstory","birthdate":"2024-01-20","account":"82569652951","lastname":"Crannell","cid":1,"firstname":"Daryl"}', '{"payment":5000,"grade":{"level":16,"name":"Cheif Of Police"},"label":"LSPD","type":"leo","name":"police","onduty":true,"isboss":true}', '{"name":"none","grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","isboss":false}', '{"x":-428.0439453125,"y":1110.3560791015626,"z":327.6732177734375}', '{"bloodtype":"B-","fitbit":[],"dealerrep":0,"skill":{"Kondisyon":{"Current":10.07999999999999,"Menu":true,"RemoveAmount":0,"Stat":"MP0_STAMINA"},"Sürüş Yeteneği":{"Current":2.39999999999999,"Menu":true,"RemoveAmount":0,"Stat":"MP0_DRIVING_ABILITY"},"Güç":{"Current":5,"Menu":true,"RemoveAmount":0,"Stat":"MP0_STRENGTH"},"Ciğer Kapasitesi":{"Current":5.39999999999999,"Menu":true,"RemoveAmount":0,"Stat":"MP0_LUNG_CAPACITY"},"Ön Kaldırma Yeteneği":{"Current":0.5,"Menu":true,"RemoveAmount":0,"Stat":"MP0_WHEELIE_ABILITY"}},"phonedata":{"SerialNumber":3645,"InstalledApps":[]},"isdead":false,"callsign":"NO CALLSIGN","status":[],"stress":0,"walletid":"7248","jailitems":[],"fingerprint":"yr947L00uTN8695","armor":0,"pkelepce":false,"communityservice":0,"licences":{"business":false,"driver":false},"kelepce":false,"craftingrep":0,"commandbinds":[],"criminalrecord":{"hasRecord":false},"hunger":91.59999999999855,"phone":[],"inside":{"apartment":[]},"thirst":92.39999999999964,"jobrep":{"tow":0,"trucker":0,"hotdog":0,"taxi":0},"attachmentcraftingrep":0,"injail":0,"tracker":false,"inlaststand":false,"ishandcuffed":false}', '[{"slot":1,"amount":1,"type":"weapon","info":{"quality":100,"serie":"63zgD3KI808RKru","ammo":-1},"name":"weapon_stungun"},{"slot":2,"amount":1,"type":"item","info":[],"name":"speaker"},{"slot":7,"amount":1,"type":"item","info":[],"name":"phone"},{"slot":8,"amount":19969989628779,"type":"item","info":[],"name":"cash"}]', '2024-02-02 19:28:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '197265', '{"Delivery Runner":{"Current":0,"RemoveAmount":0,"icon":"fas fa-car","Stat":"RUNNER_ABILITY"},"Stamina":{"Current":0,"RemoveAmount":-0.3,"icon":"fas fa-walking","Stat":"MP0_STAMINA"},"Lumberjack":{"Current":0,"RemoveAmount":0,"icon":"fas fa-tree","Stat":"TREE_ABILITY"},"Drug Manufacture":{"Current":0,"RemoveAmount":0,"icon":"fas fa-pills","Stat":"DRUGMAKE_ABILITY"},"Diving":{"Current":0,"RemoveAmount":0,"icon":"fas fa-water","Stat":"DIVING_ABILITY"},"Searching":{"Current":0,"RemoveAmount":0,"icon":"fas fa-trash","Stat":"BINDIVE_ABILITY"},"Scraping":{"Current":0,"RemoveAmount":0,"icon":"fas fa-screwdriver","Stat":"SCRAP_ABILITY"},"Hacking":{"Current":0,"RemoveAmount":0,"icon":"fas fa-laptop-code","Stat":"HACK_ABILITY"},"Hitman":{"Current":0,"RemoveAmount":0,"icon":"fas fa-skull","Stat":"HITMAN_ABILITY"},"Shooting":{"Current":0,"RemoveAmount":-0.1,"icon":"fas fa-bullseye","Stat":"MP0_SHOOTING_ABILITY"},"Wheelie":{"Current":0,"RemoveAmount":-0.2,"icon":"fas fa-wheelchair","Stat":"MP0_WHEELIE_ABILITY"},"Lung Capacity":{"Current":0,"RemoveAmount":-0.1,"icon":"fas fa-heartbeat","Stat":"MP0_LUNG_CAPACITY"},"Strength":{"Current":0,"RemoveAmount":-0.3,"icon":"fas fa-dumbbell","Stat":"MP0_STRENGTH"},"Street Reputation":{"Current":0,"RemoveAmount":0,"icon":"fas fa-cannabis","Stat":"DRUGREP_ABILITY"},"Sprint Driving":{"Current":0,"RemoveAmount":0,"icon":"fas fa-car-alt","Stat":"DRIVER_ABILITY"},"Driving":{"Current":0,"RemoveAmount":-0.5,"icon":"fas fa-car-side","Stat":"MP0_DRIVING_ABILITY"},"Electrical":{"Current":0,"RemoveAmount":0,"icon":"fas fa-bolt","Stat":"ELECTRICAL_ABILITY"},"Heist Reputation":{"Current":0,"RemoveAmount":0,"icon":"fa-solid fa-user-secret","Stat":"HEIST_ABILITY"}}'),
	(1210, 'XYP48353', 1, 'license:6902f4394b00ce8d6cb3b21c8c8ff1a27ff4125d', 'jakted', '{"bank":95550,"crypto":0,"cash":7875.0,"blackmoney":0}', '{"account":"65333400858","lastname":"korkmaz","backstory":"placeholder backstory","nationality":"türk ","firstname":"cabbar","cid":1,"phone":"714280","birthdate":"1989-09-22","gender":0}', '{"label":"LSPD","isboss":true,"onduty":true,"name":"police","grade":{"name":"Ast. Chief","level":15},"type":"leo","payment":9500}', '{"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"name":"none","isboss":false}', '{"x":-1826.927490234375,"y":-1223.6834716796876,"z":13.0029296875}', '{"criminalrecord":{"hasRecord":false},"craftingrep":0,"tracker":false,"commandbinds":[],"jobrep":{"trucker":0,"tow":0,"taxi":0,"hotdog":0},"jailitems":[],"communityservice":0,"ishandcuffed":false,"attachmentcraftingrep":0,"skill":{"Güç":{"RemoveAmount":0,"Menu":true,"Current":5,"Stat":"MP0_STRENGTH"},"Ön Kaldırma Yeteneği":{"RemoveAmount":0,"Menu":true,"Current":0,"Stat":"MP0_WHEELIE_ABILITY"},"Ciğer Kapasitesi":{"RemoveAmount":0,"Menu":true,"Current":5,"Stat":"MP0_LUNG_CAPACITY"},"Sürüş Yeteneği":{"RemoveAmount":0,"Menu":true,"Current":0.89999999999999,"Stat":"MP0_DRIVING_ABILITY"},"Kondisyon":{"RemoveAmount":0,"Menu":true,"Current":10,"Stat":"MP0_STAMINA"}},"pkelepce":false,"phonedata":{"InstalledApps":[],"SerialNumber":5254},"armor":0,"injail":0,"fingerprint":"Zb249J19hKm5018","inside":{"apartment":[]},"licences":{"driver":true,"business":false,"weapon":false},"isdead":false,"bloodtype":"B-","walletid":"1906","callsign":"NO CALLSIGN","fitbit":[],"stress":0,"thirst":54.40000000000003,"phone":[],"inlaststand":false,"hunger":49.59999999999996,"status":[],"kelepce":false,"dealerrep":0}', '[{"name":"weapon_scarh","amount":1,"type":"weapon","info":{"quality":89.64999999999961,"serie":"93yFJ5pC564xdwk","ammo":95},"slot":1},{"name":"weapon_m9","amount":1,"type":"weapon","info":{"quality":92.34999999999971,"serie":"88Qwo7mz968UFuA","ammo":213},"slot":2},{"name":"pistol_ammo","amount":4,"type":"item","info":[],"slot":3},{"name":"pkelepce","amount":1,"type":"item","info":[],"slot":4},{"name":"pkelepceanahtar","amount":1,"type":"item","info":[],"slot":5},{"name":"megaphone","amount":1,"type":"item","info":[],"slot":10},{"name":"gps","amount":1,"type":"item","info":[],"slot":11},{"name":"badge","amount":1,"type":"item","info":[],"slot":12},{"name":"bodycam","amount":1,"type":"item","info":[],"slot":13},{"name":"cash","amount":7875.0,"type":"item","info":[],"slot":14},{"name":"radio","amount":1,"type":"item","info":[],"slot":15},{"name":"vehiclekey","amount":1,"type":"item","info":{"model":" PD Stgang","lock":4321,"plate":"PD  5459"},"slot":125}]', '2024-01-12 18:59:21', 'QB6538', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.playerskins: ~27 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `playerskins`;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(23, 'UWX63047', 'mp_m_freemode_01', '{"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"headBlend":{"shapeMix":0,"skinFirst":0,"skinSecond":0,"shapeSecond":0,"shapeFirst":0,"thirdMix":0,"skinMix":0,"shapeThird":0,"skinThird":0},"headOverlays":{"blemishes":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"secondColor":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"complexion":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"blush":{"style":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0}},"eyeColor":-1,"model":"mp_m_freemode_01","faceFeatures":{"noseWidth":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"nosePeakHigh":0,"chinBoneSize":0,"nosePeakLowering":0,"chinBoneLenght":0,"noseBoneHigh":0,"chinBoneLowering":0,"eyeBrownForward":0,"eyesOpening":0,"chinHole":0,"jawBoneWidth":0,"nosePeakSize":0,"noseBoneTwist":0,"lipsThickness":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"neckThickness":0,"cheeksWidth":0},"tattoos":[],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"hair":{"texture":0,"color":0,"highlight":0,"style":0}}', 1),
	(29, 'QUZ31879', 'mp_m_freemode_01', '{"hair":{"color":13,"texture":0,"highlight":0,"style":17},"faceFeatures":{"cheeksBoneWidth":0,"cheeksWidth":0,"eyeBrownForward":0,"jawBoneWidth":0,"eyesOpening":0,"chinHole":0,"chinBoneLowering":0,"nosePeakHigh":0,"chinBoneSize":0,"noseBoneTwist":0,"noseWidth":0,"neckThickness":0,"lipsThickness":0,"eyeBrownHigh":0,"nosePeakLowering":0,"cheeksBoneHigh":0,"nosePeakSize":0,"noseBoneHigh":0,"jawBoneBackSize":0,"chinBoneLenght":0},"headBlend":{"skinThird":0,"shapeMix":0,"shapeSecond":0,"thirdMix":0,"skinFirst":0,"shapeFirst":0,"skinSecond":0,"shapeThird":0,"skinMix":0},"model":"mp_m_freemode_01","components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":17,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":8,"component_id":7},{"texture":0,"drawable":150,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":324,"component_id":11},{"texture":0,"drawable":179,"component_id":4},{"texture":1,"drawable":17,"component_id":6}],"eyeColor":0,"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"tattoos":[],"headOverlays":{"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"style":0,"opacity":0},"blush":{"color":0,"style":0,"opacity":0},"complexion":{"color":0,"style":0,"opacity":0},"lipstick":{"color":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0},"sunDamage":{"color":0,"style":0,"opacity":0},"eyebrows":{"color":0,"style":0,"opacity":0},"blemishes":{"color":0,"style":0,"opacity":0},"beard":{"color":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0},"chestHair":{"color":0,"style":0,"opacity":0}}}', 1),
	(30, 'EPT80110', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"complexion":{"style":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"blemishes":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"color":0,"secondColor":0,"opacity":0},"blush":{"style":0,"opacity":0,"color":0}},"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"faceFeatures":{"chinBoneSize":0,"chinBoneLowering":0,"jawBoneWidth":0,"nosePeakSize":0,"jawBoneBackSize":0,"cheeksWidth":0,"nosePeakHigh":0,"noseWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"nosePeakLowering":0,"neckThickness":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"lipsThickness":0,"eyesOpening":0,"chinHole":0,"noseBoneTwist":0},"tattoos":[],"headBlend":{"shapeMix":0,"shapeFirst":0,"thirdMix":0,"skinSecond":0,"skinFirst":0,"skinMix":0,"shapeThird":0,"shapeSecond":0,"skinThird":0},"hair":{"highlight":0,"style":0,"texture":0,"color":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11},{"texture":0,"drawable":1,"component_id":4}]}', 1),
	(31, 'FWH76480', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"complexion":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"blemishes":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0},"blush":{"style":0,"opacity":0,"color":0}},"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"faceFeatures":{"chinBoneSize":0,"chinBoneLowering":0,"jawBoneWidth":0,"nosePeakSize":0,"jawBoneBackSize":0,"cheeksWidth":0,"nosePeakHigh":0,"noseWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"nosePeakLowering":0,"neckThickness":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"noseBoneTwist":0,"eyesOpening":0,"lipsThickness":0,"eyeBrownHigh":0,"chinHole":0},"tattoos":[],"headBlend":{"shapeSecond":0,"shapeFirst":0,"thirdMix":0,"shapeThird":0,"skinFirst":0,"skinMix":0,"shapeMix":0,"skinSecond":0,"skinThird":0},"hair":{"texture":0,"highlight":0,"style":0,"color":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}]}', 1),
	(32, 'MLP99833', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"complexion":{"style":0,"color":0,"opacity":0},"makeUp":{"style":0,"color":0,"secondColor":0,"opacity":0},"ageing":{"style":0,"color":0,"opacity":0},"blemishes":{"style":0,"color":0,"opacity":0},"eyebrows":{"style":0,"color":0,"opacity":0},"sunDamage":{"style":0,"color":0,"opacity":0},"chestHair":{"style":0,"color":0,"opacity":0},"lipstick":{"style":0,"color":0,"opacity":0},"beard":{"style":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"color":0,"opacity":0},"blush":{"style":0,"color":0,"opacity":0}},"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"faceFeatures":{"chinBoneSize":0,"chinBoneLowering":0,"jawBoneWidth":0,"nosePeakSize":0,"jawBoneBackSize":0,"cheeksWidth":0,"nosePeakHigh":0,"noseWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"chinBoneLenght":0,"nosePeakLowering":0,"neckThickness":0,"noseBoneHigh":0,"eyeBrownHigh":0,"cheeksBoneHigh":0,"lipsThickness":0,"eyesOpening":0,"noseBoneTwist":0,"chinHole":0},"tattoos":[],"headBlend":{"shapeMix":0,"shapeFirst":0,"thirdMix":0,"shapeThird":0,"skinFirst":0,"skinMix":0,"skinSecond":0,"shapeSecond":0,"skinThird":0},"hair":{"texture":0,"style":0,"highlight":0,"color":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}]}', 1),
	(33, 'XYP48353', 'mp_m_freemode_01', '{"headOverlays":{"blemishes":{"color":0,"style":0,"opacity":0},"sunDamage":{"color":0,"style":0,"opacity":0},"eyebrows":{"color":0,"style":0,"opacity":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"blush":{"color":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0},"chestHair":{"color":0,"style":0,"opacity":0},"complexion":{"color":0,"style":0,"opacity":0},"lipstick":{"color":0,"style":0,"opacity":0},"ageing":{"color":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0},"beard":{"color":0,"style":0,"opacity":0}},"faceFeatures":{"cheeksBoneHigh":0,"noseWidth":0,"lipsThickness":0,"nosePeakLowering":0,"chinBoneLenght":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"jawBoneWidth":0,"chinHole":0,"eyesOpening":0,"chinBoneLowering":0,"nosePeakHigh":0,"noseBoneHigh":0,"chinBoneSize":0,"nosePeakSize":0,"cheeksWidth":0,"eyeBrownHigh":0,"neckThickness":0,"eyeBrownForward":0,"noseBoneTwist":0},"hair":{"color":0,"texture":0,"style":0,"highlight":0},"eyeColor":0,"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"tattoos":[],"headBlend":{"shapeSecond":0,"shapeFirst":0,"shapeMix":0,"skinMix":0,"thirdMix":0,"shapeThird":0,"skinThird":0,"skinFirst":0,"skinSecond":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":10},{"drawable":321,"texture":0,"component_id":11},{"drawable":17,"texture":0,"component_id":8},{"drawable":143,"texture":2,"component_id":4},{"drawable":130,"texture":0,"component_id":6},{"drawable":14,"texture":0,"component_id":9},{"drawable":42,"texture":1,"component_id":5}],"model":"mp_m_freemode_01"}', 1),
	(38, 'SVN81090', 'mp_m_freemode_01', '{"eyeColor":0,"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"headOverlays":{"bodyBlemishes":{"opacity":0,"color":0,"style":0},"blush":{"opacity":0,"color":0,"style":0},"eyebrows":{"opacity":0,"color":0,"style":0},"makeUp":{"opacity":0,"secondColor":0,"color":0,"style":0},"moleAndFreckles":{"opacity":0,"color":0,"style":0},"beard":{"opacity":0,"color":0,"style":0},"chestHair":{"opacity":0,"color":0,"style":0},"lipstick":{"opacity":0,"color":0,"style":0},"blemishes":{"opacity":0,"color":0,"style":0},"complexion":{"opacity":0,"color":0,"style":0},"ageing":{"opacity":0,"color":0,"style":0},"sunDamage":{"opacity":0,"color":0,"style":0}},"faceFeatures":{"nosePeakHigh":0,"jawBoneWidth":0,"noseWidth":0,"nosePeakSize":0,"neckThickness":0,"cheeksBoneHigh":0,"noseBoneHigh":0,"nosePeakLowering":0,"chinBoneSize":0,"chinBoneLenght":0,"jawBoneBackSize":0,"chinHole":0,"eyesOpening":0,"eyeBrownHigh":0,"cheeksBoneWidth":0,"cheeksWidth":0,"eyeBrownForward":0,"chinBoneLowering":0,"noseBoneTwist":0,"lipsThickness":0},"model":"mp_m_freemode_01","props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"hair":{"highlight":0,"texture":0,"color":0,"style":0},"headBlend":{"shapeMix":0,"skinThird":0,"shapeSecond":0,"skinSecond":0,"skinFirst":0,"thirdMix":0,"shapeThird":0,"skinMix":0,"shapeFirst":0},"tattoos":[]}', 1),
	(40, 'BIK10757', 'mp_m_freemode_01', '{"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"hair":{"style":0,"color":0,"texture":0,"highlight":0},"tattoos":[],"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"model":"mp_m_freemode_01","eyeColor":-1,"headOverlays":{"blemishes":{"style":0,"opacity":0,"color":0},"sunDamage":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"blush":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"secondColor":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"complexion":{"style":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0}},"faceFeatures":{"jawBoneBackSize":0,"jawBoneWidth":0,"lipsThickness":0,"nosePeakSize":0,"noseBoneTwist":0,"noseBoneHigh":0,"cheeksWidth":0,"chinBoneLowering":0,"chinBoneLenght":0,"nosePeakLowering":0,"cheeksBoneHigh":0,"nosePeakHigh":0,"eyesOpening":0,"chinBoneSize":0,"cheeksBoneWidth":0,"chinHole":0,"eyeBrownHigh":0,"noseWidth":0,"eyeBrownForward":0,"neckThickness":0},"headBlend":{"shapeThird":0,"shapeFirst":0,"thirdMix":0,"skinFirst":0,"shapeSecond":0,"skinThird":0,"skinMix":0,"shapeMix":0,"skinSecond":0}}', 1),
	(43, 'RQT13252', 'mp_m_freemode_01', '{"headBlend":{"skinFirst":0,"shapeMix":0,"thirdMix":0,"shapeSecond":0,"skinSecond":0,"skinMix":0,"shapeThird":0,"skinThird":0,"shapeFirst":0},"eyeColor":-1,"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":0,"texture":0}],"headOverlays":{"blemishes":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"ageing":{"color":0,"opacity":0,"style":0},"makeUp":{"color":0,"opacity":0,"style":0,"secondColor":0},"beard":{"color":0,"opacity":0,"style":0},"complexion":{"color":0,"opacity":0,"style":0},"eyebrows":{"color":0,"opacity":0,"style":0},"sunDamage":{"color":0,"opacity":0,"style":0},"chestHair":{"color":0,"opacity":0,"style":0},"lipstick":{"color":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0}},"hair":{"color":0,"highlight":0,"style":0,"texture":0},"tattoos":[],"faceFeatures":{"chinBoneLenght":0,"chinBoneSize":0,"noseBoneTwist":0,"eyesOpening":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"jawBoneBackSize":0,"chinHole":0,"neckThickness":0,"jawBoneWidth":0,"chinBoneLowering":0,"cheeksWidth":0,"noseWidth":0,"nosePeakLowering":0,"eyeBrownHigh":0,"lipsThickness":0,"noseBoneHigh":0,"eyeBrownForward":0,"nosePeakSize":0,"nosePeakHigh":0}}', 1),
	(44, 'UQL52088', 'mp_m_freemode_01', '{"faceFeatures":{"chinBoneLenght":1,"chinBoneSize":1,"noseBoneTwist":-1,"nosePeakHigh":1,"cheeksBoneWidth":-1,"cheeksBoneHigh":0.3,"jawBoneBackSize":1,"chinHole":1,"neckThickness":1,"jawBoneWidth":1,"eyesOpening":-1,"cheeksWidth":1,"noseWidth":1,"nosePeakLowering":1,"chinBoneLowering":1,"lipsThickness":-1,"noseBoneHigh":-1,"eyeBrownForward":1,"nosePeakSize":-1,"eyeBrownHigh":1},"eyeColor":-1,"model":"mp_m_freemode_01","props":[{"prop_id":0,"drawable":-1,"texture":0},{"prop_id":1,"drawable":0,"texture":0},{"prop_id":2,"drawable":-1,"texture":0},{"prop_id":6,"drawable":0,"texture":0},{"prop_id":7,"drawable":6,"texture":0}],"headBlend":{"skinFirst":1,"shapeMix":0,"thirdMix":0,"skinThird":0,"skinSecond":0,"shapeSecond":0,"shapeFirst":1,"skinMix":0,"shapeThird":0},"headOverlays":{"blemishes":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"ageing":{"color":0,"opacity":1,"style":0},"makeUp":{"color":0,"opacity":0,"style":0,"secondColor":0},"beard":{"color":0,"opacity":1,"style":11},"complexion":{"color":0,"opacity":0,"style":0},"eyebrows":{"color":0,"opacity":1,"style":0},"sunDamage":{"color":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0},"lipstick":{"color":0,"opacity":0,"style":0},"chestHair":{"color":0,"opacity":1,"style":0}},"hair":{"color":0,"highlight":0,"style":0,"texture":0},"tattoos":[],"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":5,"texture":0},{"component_id":3,"drawable":5,"texture":0},{"component_id":8,"drawable":15,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":4,"drawable":5,"texture":0},{"component_id":6,"drawable":6,"texture":0}]}', 1),
	(49, 'CMW31394', 'mp_m_freemode_01', '{"faceFeatures":{"cheeksBoneWidth":0,"neckThickness":0,"nosePeakHigh":0,"noseBoneTwist":0,"chinBoneLenght":0,"cheeksBoneHigh":0,"chinBoneSize":0,"eyeBrownHigh":0,"chinHole":0,"nosePeakSize":0,"noseBoneHigh":0,"jawBoneWidth":0,"cheeksWidth":0,"lipsThickness":0,"eyeBrownForward":0,"eyesOpening":0,"chinBoneLowering":0,"nosePeakLowering":0,"noseWidth":0,"jawBoneBackSize":0},"eyeColor":-1,"model":"mp_m_freemode_01","hair":{"style":2,"texture":0,"color":15,"highlight":15},"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7},{"drawable":5,"texture":6,"prop_id":1}],"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":69},{"component_id":8,"texture":0,"drawable":177},{"component_id":4,"texture":0,"drawable":4},{"component_id":6,"texture":1,"drawable":42}],"headOverlays":{"complexion":{"style":0,"opacity":0,"color":0},"blemishes":{"style":0,"opacity":0,"color":0},"lipstick":{"style":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0},"beard":{"style":0,"opacity":0,"color":0},"makeUp":{"style":0,"opacity":0,"color":0,"secondColor":0},"sunDamage":{"style":0,"opacity":0,"color":0},"blush":{"style":0,"opacity":0,"color":0},"ageing":{"style":0,"opacity":0,"color":0},"eyebrows":{"style":0,"opacity":0,"color":0},"chestHair":{"style":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0}},"tattoos":{"ZONE_HAIR":[{"collection":"multiplayer_overlays","hashMale":"FM_M_Hair_005_a","name":"hair-0-156","zone":"ZONE_HAIR","label":"hair-0-156","hashFemale":"FM_F_Hair_005_a"}]},"headBlend":{"thirdMix":0,"skinFirst":0,"skinSecond":0,"shapeMix":0,"skinThird":0,"shapeSecond":0,"shapeFirst":0,"skinMix":0,"shapeThird":0}}', 1),
	(50, 'SRK03290', 'mp_m_freemode_01', '{"faceFeatures":{"nosePeakSize":0,"eyeBrownHigh":0,"chinBoneSize":0,"chinBoneLenght":0,"neckThickness":0,"cheeksWidth":0,"noseBoneHigh":0,"nosePeakLowering":0,"jawBoneWidth":0,"noseWidth":0,"noseBoneTwist":0,"lipsThickness":0,"nosePeakHigh":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"chinHole":0,"chinBoneLowering":0,"eyesOpening":0,"cheeksBoneHigh":0,"eyeBrownForward":0},"eyeColor":-1,"tattoos":[],"headBlend":{"shapeFirst":0,"shapeSecond":0,"thirdMix":0,"shapeThird":0,"skinThird":0,"shapeMix":0,"skinFirst":0,"skinSecond":0,"skinMix":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":36},{"component_id":11,"texture":0,"drawable":20},{"component_id":8,"texture":0,"drawable":10},{"component_id":3,"texture":0,"drawable":6},{"component_id":6,"texture":0,"drawable":2},{"component_id":4,"texture":0,"drawable":3}],"headOverlays":{"sunDamage":{"color":0,"opacity":0,"style":0},"eyebrows":{"color":0,"opacity":0,"style":0},"complexion":{"color":0,"opacity":0,"style":0},"ageing":{"color":0,"opacity":0,"style":0},"chestHair":{"color":0,"opacity":0,"style":0},"blemishes":{"color":0,"opacity":0,"style":0},"beard":{"color":0,"opacity":0,"style":0},"lipstick":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"makeUp":{"color":0,"style":0,"opacity":0,"secondColor":0}},"hair":{"color":0,"highlight":0,"texture":0,"style":9},"model":"mp_m_freemode_01","props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}]}', 1),
	(52, 'ARR98822', 'mp_m_freemode_01', '{"faceFeatures":{"nosePeakSize":0.7,"eyeBrownHigh":0,"chinBoneSize":0,"chinBoneLenght":0,"neckThickness":0,"cheeksWidth":0,"noseBoneHigh":0.1,"nosePeakLowering":0,"jawBoneWidth":0,"noseWidth":1,"noseBoneTwist":0,"lipsThickness":0,"nosePeakHigh":-1,"cheeksBoneWidth":0,"jawBoneBackSize":0,"chinHole":0,"eyesOpening":0,"chinBoneLowering":0,"cheeksBoneHigh":0,"eyeBrownForward":0},"eyeColor":12,"tattoos":[],"headBlend":{"shapeFirst":0,"shapeSecond":0,"thirdMix":0,"skinFirst":3,"skinThird":0,"shapeMix":0,"shapeThird":0,"skinSecond":0,"skinMix":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":8,"drawable":26},{"texture":0,"component_id":11,"drawable":76},{"texture":0,"component_id":4,"drawable":28},{"texture":1,"component_id":6,"drawable":18}],"headOverlays":{"sunDamage":{"color":0,"opacity":0,"style":0},"eyebrows":{"color":0,"opacity":1,"style":12},"complexion":{"color":0,"opacity":0,"style":2},"ageing":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"blemishes":{"color":0,"opacity":0,"style":0},"beard":{"color":0,"opacity":1,"style":27},"lipstick":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0},"chestHair":{"color":34,"opacity":1,"style":3},"makeUp":{"color":0,"opacity":0,"style":0,"secondColor":0}},"hair":{"color":0,"highlight":0,"style":24,"texture":0},"model":"mp_m_freemode_01","props":[{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":0,"texture":0,"drawable":88},{"prop_id":1,"texture":4,"drawable":25},{"prop_id":7,"texture":0,"drawable":0}]}', 1),
	(54, 'RZP73312', 'mp_m_freemode_01', '{"faceFeatures":{"nosePeakSize":1,"eyeBrownHigh":0,"chinBoneSize":0,"chinBoneLenght":0,"neckThickness":0,"cheeksWidth":0,"noseBoneHigh":0,"nosePeakLowering":0,"jawBoneWidth":0,"noseWidth":1,"noseBoneTwist":0,"lipsThickness":0,"nosePeakHigh":-1,"cheeksBoneWidth":0,"jawBoneBackSize":0,"chinHole":0,"chinBoneLowering":0,"eyesOpening":0,"cheeksBoneHigh":0,"eyeBrownForward":0},"eyeColor":12,"tattoos":[],"headBlend":{"shapeFirst":0,"shapeSecond":0,"thirdMix":0,"skinFirst":3,"skinThird":0,"shapeMix":0,"skinSecond":2,"shapeThird":0,"skinMix":1},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":63},{"component_id":4,"texture":0,"drawable":28},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":1,"drawable":18},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":21},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":76},{"component_id":3,"texture":0,"drawable":1}],"model":"mp_m_freemode_01","hair":{"color":0,"highlight":0,"texture":0,"style":63},"headOverlays":{"sunDamage":{"color":0,"opacity":0,"style":0},"eyebrows":{"color":0,"opacity":1,"style":12},"complexion":{"color":0,"opacity":0,"style":0},"ageing":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"blemishes":{"color":0,"opacity":0,"style":0},"beard":{"color":0,"opacity":1,"style":27},"lipstick":{"color":0,"opacity":0,"style":0},"chestHair":{"color":34,"opacity":1,"style":4},"moleAndFreckles":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0},"makeUp":{"color":0,"style":0,"opacity":0,"secondColor":0}},"props":[{"prop_id":0,"texture":0,"drawable":87},{"prop_id":1,"texture":4,"drawable":25},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":0,"drawable":0}]}', 1),
	(59, 'DFK22197', 'mp_m_freemode_01', '{"tattoos":[],"eyeColor":0,"model":"mp_m_freemode_01","hair":{"style":39,"texture":0,"highlight":0,"color":12},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":2,"texture":0,"drawable":41},{"prop_id":7,"texture":0,"drawable":-1},{"prop_id":1,"texture":0,"drawable":5}],"faceFeatures":{"eyeBrownForward":0,"chinBoneSize":0,"chinHole":0,"neckThickness":0,"cheeksBoneHigh":0,"noseWidth":0,"cheeksBoneWidth":0,"jawBoneWidth":0,"chinBoneLenght":0,"jawBoneBackSize":0,"chinBoneLowering":0,"lipsThickness":0,"cheeksWidth":0,"nosePeakSize":0,"eyeBrownHigh":0,"eyesOpening":0,"nosePeakLowering":0,"noseBoneHigh":0,"nosePeakHigh":0,"noseBoneTwist":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":42,"component_id":9,"texture":0},{"drawable":72,"component_id":11,"texture":1},{"drawable":33,"component_id":4,"texture":0},{"drawable":7,"component_id":6,"texture":0},{"drawable":38,"component_id":8,"texture":0},{"drawable":30,"component_id":3,"texture":0}],"headOverlays":{"blush":{"color":0,"style":0,"opacity":0},"makeUp":{"secondColor":0,"color":0,"style":0,"opacity":0},"eyebrows":{"color":0,"style":30,"opacity":1},"chestHair":{"color":0,"style":0,"opacity":0},"beard":{"color":0,"style":0,"opacity":0},"lipstick":{"color":0,"style":0,"opacity":0},"blemishes":{"color":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0},"sunDamage":{"color":0,"style":0,"opacity":0},"complexion":{"color":0,"style":0,"opacity":0},"ageing":{"color":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0}},"headBlend":{"skinFirst":0,"thirdMix":0,"shapeFirst":0,"skinMix":0,"shapeMix":0,"shapeThird":0,"skinThird":0,"skinSecond":0,"shapeSecond":0}}', 1),
	(68, 'JXV15913', 'mp_m_freemode_01', '{"headBlend":{"skinThird":0,"shapeMix":0,"skinMix":0,"skinFirst":0,"thirdMix":0,"shapeSecond":0,"skinSecond":0,"shapeFirst":0,"shapeThird":0},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"model":"mp_m_freemode_01","components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":24,"component_id":11},{"texture":0,"drawable":22,"component_id":8}],"headOverlays":{"lipstick":{"color":0,"opacity":0,"style":0},"beard":{"color":0,"opacity":0,"style":0},"sunDamage":{"color":0,"opacity":0,"style":0},"ageing":{"color":0,"opacity":0,"style":0},"makeUp":{"style":0,"color":0,"opacity":0,"secondColor":0},"eyebrows":{"color":0,"opacity":0,"style":0},"blush":{"color":0,"opacity":0,"style":0},"chestHair":{"color":0,"opacity":0,"style":0},"complexion":{"color":0,"opacity":0,"style":0},"blemishes":{"color":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0}},"faceFeatures":{"nosePeakSize":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"eyeBrownHigh":0,"nosePeakLowering":0,"jawBoneBackSize":0,"jawBoneWidth":0,"chinBoneLenght":0,"neckThickness":0,"chinHole":0,"lipsThickness":0,"noseWidth":0,"noseBoneHigh":0,"chinBoneSize":0,"cheeksBoneHigh":0,"cheeksWidth":0,"nosePeakHigh":0,"eyesOpening":0,"noseBoneTwist":0,"eyeBrownForward":0},"eyeColor":-1,"tattoos":[],"hair":{"texture":0,"color":0,"highlight":0,"style":0}}', 1),
	(72, 'FYH40953', 'mp_m_freemode_01', '{"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":4},{"texture":0,"component_id":4,"drawable":1},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":58},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":15}],"tattoos":[],"hair":{"color":0,"texture":0,"highlight":0,"style":0},"faceFeatures":{"nosePeakHigh":0.0,"eyeBrownForward":0.0,"cheeksBoneHigh":0.0,"noseBoneHigh":0.0,"eyeBrownHigh":0.0,"nosePeakLowering":0.0,"noseBoneTwist":0.0,"chinBoneLowering":0.0,"noseWidth":-1.0,"cheeksWidth":0.0,"neckThickness":0.0,"eyesOpening":0.0,"jawBoneBackSize":-1.0,"cheeksBoneWidth":0.0,"nosePeakSize":0.0,"chinHole":0.0,"lipsThickness":0.0,"jawBoneWidth":0.0,"chinBoneLenght":0.0,"chinBoneSize":0.3},"model":"mp_m_freemode_01","eyeColor":0,"headBlend":{"skinMix":0.2,"shapeSecond":10,"skinSecond":1,"thirdMix":0.0,"shapeThird":0,"shapeFirst":19,"skinThird":0,"skinFirst":2,"shapeMix":0.0},"headOverlays":{"lipstick":{"secondColor":0,"style":0,"color":0,"opacity":0},"sunDamage":{"secondColor":0,"style":0,"color":0,"opacity":0},"blush":{"secondColor":0,"style":0,"color":0,"opacity":0},"chestHair":{"secondColor":0,"style":0,"color":0,"opacity":0},"eyebrows":{"secondColor":0,"style":0,"color":0,"opacity":0},"blemishes":{"secondColor":0,"style":0,"color":0,"opacity":0},"ageing":{"secondColor":0,"style":0,"color":0,"opacity":0},"makeUp":{"secondColor":0,"style":0,"color":0,"opacity":0},"moleAndFreckles":{"secondColor":0,"style":0,"color":0,"opacity":0},"bodyBlemishes":{"secondColor":0,"style":0,"color":0,"opacity":0},"complexion":{"secondColor":0,"style":0,"color":0,"opacity":0},"beard":{"secondColor":0,"style":0,"color":0,"opacity":0}},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}]}', 1),
	(73, 'HGO75866', 'mp_m_freemode_01', '{"faceFeatures":{"noseBoneHigh":0,"cheeksWidth":0,"lipsThickness":0,"jawBoneWidth":0,"noseWidth":0,"chinHole":0,"nosePeakLowering":0,"noseBoneTwist":0,"eyesOpening":0,"chinBoneLowering":0,"jawBoneBackSize":0,"cheeksBoneHigh":0,"eyeBrownForward":0,"neckThickness":0,"nosePeakSize":0,"cheeksBoneWidth":0,"chinBoneSize":0,"chinBoneLenght":0,"nosePeakHigh":0,"eyeBrownHigh":0},"tattoos":{"ZONE_HAIR":[{"name":"hair-0-186","zone":"ZONE_HAIR","hashMale":"FM_M_Hair_003_a","collection":"multiplayer_overlays","label":"hair-0-186","hashFemale":"FM_F_Hair_003_a"}]},"headOverlays":{"ageing":{"style":0,"opacity":0,"color":0,"secondColor":0},"makeUp":{"style":0,"opacity":0,"color":0,"secondColor":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0,"secondColor":0},"eyebrows":{"style":0,"opacity":0.6,"color":0,"secondColor":0},"blemishes":{"style":0,"opacity":0,"color":0,"secondColor":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0,"secondColor":0},"blush":{"style":0,"opacity":0,"color":0,"secondColor":0},"beard":{"style":0,"opacity":0,"color":0,"secondColor":0},"lipstick":{"style":0,"opacity":0,"color":0,"secondColor":0},"chestHair":{"style":0,"opacity":0,"color":0,"secondColor":0},"sunDamage":{"style":0,"opacity":0,"color":0,"secondColor":0},"complexion":{"style":0,"opacity":0,"color":0,"secondColor":0}},"hair":{"style":12,"highlight":0,"color":2,"texture":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":12,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":1},{"texture":5,"drawable":39,"component_id":4},{"texture":0,"drawable":111,"component_id":11},{"texture":0,"drawable":17,"component_id":6}],"headBlend":{"shapeThird":0,"shapeMix":0,"skinFirst":0,"shapeFirst":0,"skinMix":0,"thirdMix":0,"skinThird":0,"skinSecond":0,"shapeSecond":0},"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":0,"prop_id":1,"drawable":2},{"texture":0,"prop_id":2,"drawable":2},{"texture":0,"prop_id":6,"drawable":10},{"texture":-1,"prop_id":7,"drawable":-1}],"eyeColor":-1,"model":"mp_m_freemode_01"}', 1),
	(74, 'PAE72962', 'mp_m_freemode_01', '{"headOverlays":{"complexion":{"opacity":0,"color":0,"secondColor":0,"style":0},"bodyBlemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"moleAndFreckles":{"opacity":0,"color":0,"secondColor":0,"style":0},"sunDamage":{"opacity":0,"color":0,"secondColor":0,"style":0},"lipstick":{"opacity":0,"color":0,"secondColor":0,"style":0},"blush":{"opacity":0,"color":0,"secondColor":0,"style":0},"ageing":{"opacity":0,"color":0,"secondColor":0,"style":0},"blemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"chestHair":{"opacity":0,"color":0,"secondColor":0,"style":0},"beard":{"opacity":0,"color":0,"secondColor":0,"style":0},"eyebrows":{"opacity":0,"color":0,"secondColor":0,"style":0},"makeUp":{"opacity":0,"color":0,"secondColor":0,"style":0}},"faceFeatures":{"lipsThickness":0,"chinBoneSize":0,"cheeksBoneWidth":0,"noseWidth":0,"jawBoneBackSize":0,"eyesOpening":0,"neckThickness":0,"eyeBrownHigh":0,"nosePeakLowering":0,"chinHole":0,"cheeksWidth":0,"chinBoneLowering":0,"chinBoneLenght":0,"eyeBrownForward":0,"nosePeakSize":0,"noseBoneTwist":0,"noseBoneHigh":0,"nosePeakHigh":0,"jawBoneWidth":0,"cheeksBoneHigh":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":3},{"texture":0,"component_id":3,"drawable":4},{"texture":0,"component_id":4,"drawable":1},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":58},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":15}],"headBlend":{"skinSecond":0,"shapeFirst":0,"skinMix":0,"shapeMix":0,"shapeThird":0,"skinFirst":0,"shapeSecond":0,"skinThird":0,"thirdMix":0},"eyeColor":-1,"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"model":"mp_m_freemode_01","hair":{"texture":0,"color":0,"highlight":0,"style":3},"tattoos":[]}', 1),
	(76, 'BMS02698', 'mp_m_freemode_01', '{"headOverlays":{"complexion":{"opacity":0,"color":0,"secondColor":0,"style":0},"bodyBlemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"moleAndFreckles":{"opacity":0,"color":0,"secondColor":0,"style":0},"sunDamage":{"opacity":0,"color":0,"secondColor":0,"style":0},"eyebrows":{"opacity":0.6,"color":0,"secondColor":0,"style":7},"blush":{"opacity":0,"color":0,"secondColor":0,"style":0},"makeUp":{"opacity":0,"color":0,"secondColor":0,"style":0},"beard":{"opacity":0.8,"color":0,"secondColor":0,"style":10},"chestHair":{"opacity":0,"color":0,"secondColor":0,"style":0},"blemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"ageing":{"opacity":0,"color":0,"secondColor":0,"style":0},"lipstick":{"opacity":0,"color":0,"secondColor":0,"style":0}},"faceFeatures":{"lipsThickness":0,"chinBoneSize":0,"cheeksBoneWidth":0,"noseWidth":0,"jawBoneBackSize":0,"nosePeakSize":0,"neckThickness":0,"eyeBrownHigh":0,"nosePeakLowering":0,"chinHole":0,"noseBoneTwist":0,"noseBoneHigh":0,"chinBoneLenght":0,"eyeBrownForward":0,"nosePeakHigh":0,"cheeksWidth":0,"eyesOpening":0,"chinBoneLowering":0,"jawBoneWidth":0,"cheeksBoneHigh":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":2,"drawable":110},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":11,"drawable":205},{"texture":0,"component_id":8,"drawable":150},{"texture":0,"component_id":9,"drawable":70},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":6,"drawable":130},{"texture":1,"component_id":4,"drawable":242}],"headBlend":{"skinSecond":0,"shapeFirst":0,"skinMix":0,"shapeMix":0,"shapeThird":0,"skinFirst":0,"thirdMix":0,"skinThird":0,"shapeSecond":0},"eyeColor":0,"props":[{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":0,"drawable":47},{"prop_id":7,"texture":-1,"drawable":-1},{"prop_id":1,"texture":0,"drawable":-1},{"prop_id":0,"texture":0,"drawable":-1}],"model":"mp_m_freemode_01","hair":{"highlight":0,"color":0,"texture":0,"style":110},"tattoos":{"ZONE_HEAD":[{"collection":"mpbeach_overlays","opacity":0.1,"name":"TAT_BB_021","zone":"ZONE_HEAD","hashFemale":"","label":"Pirate Skull","hashMale":"MP_Bea_M_Head_000"}]}}', 1),
	(79, 'WZB65598', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"headOverlays":{"beard":{"secondColor":0,"color":0,"opacity":1,"style":27},"complexion":{"secondColor":0,"color":0,"opacity":1,"style":2},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":35,"opacity":1,"style":2},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":1,"style":12},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0}},"faceFeatures":{"eyeBrownHigh":0,"nosePeakSize":1,"nosePeakHigh":-1,"chinHole":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseWidth":1,"chinBoneSize":0,"eyeBrownForward":0,"cheeksBoneHigh":0,"cheeksWidth":0,"eyesOpening":0,"noseBoneTwist":0,"jawBoneWidth":0,"lipsThickness":0,"noseBoneHigh":-1,"chinBoneLowering":0,"nosePeakLowering":0.7,"cheeksBoneWidth":0,"neckThickness":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":25,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":27,"texture":0,"component_id":3},{"drawable":15,"texture":0,"component_id":8},{"drawable":91,"texture":3,"component_id":11},{"drawable":71,"texture":1,"component_id":4},{"drawable":55,"texture":0,"component_id":6},{"drawable":22,"texture":2,"component_id":1}],"headBlend":{"skinThird":0,"skinMix":1,"shapeSecond":0,"thirdMix":0,"skinSecond":3,"skinFirst":1,"shapeFirst":0,"shapeMix":0,"shapeThird":0},"hair":{"texture":0,"color":0,"highlight":0,"style":157},"eyeColor":-1,"tattoos":{"ZONE_RIGHT_LEG":[{"label":"American Made","name":"TAT_BI_040","collection":"mpbiker_overlays","zone":"ZONE_RIGHT_LEG","hashMale":"MP_MP_Biker_Tat_040_M","hashFemale":"MP_MP_Biker_Tat_040_F"}],"ZONE_LEFT_ARM":[{"label":"Macabre Tree","name":"TAT_BI_016","collection":"mpbiker_overlays","zone":"ZONE_LEFT_ARM","hashMale":"MP_MP_Biker_Tat_016_M","hashFemale":"MP_MP_Biker_Tat_016_F"}],"ZONE_HEAD":[{"label":"Little Fish","name":"TAT_BB_028","collection":"mpbeach_overlays","zone":"ZONE_HEAD","hashMale":"MP_Bea_M_Neck_000","hashFemale":""},{"label":"Surfs Up","name":"TAT_BB_029","collection":"mpbeach_overlays","zone":"ZONE_HEAD","hashMale":"MP_Bea_M_Neck_001","hashFemale":""},{"label":"Script Dollar Sign","name":"TAT_BUS_007","collection":"mpbusiness_overlays","zone":"ZONE_HEAD","hashMale":"MP_Buis_M_Neck_002","hashFemale":""}],"ZONE_LEFT_LEG":[{"label":"Engulfed Skull","name":"TAT_BI_036","collection":"mpbiker_overlays","zone":"ZONE_LEFT_LEG","hashMale":"MP_MP_Biker_Tat_036_M","hashFemale":"MP_MP_Biker_Tat_036_F"}],"ZONE_RIGHT_ARM":[{"label":"Eagle Emblem","name":"TAT_BI_033","collection":"mpbiker_overlays","zone":"ZONE_RIGHT_ARM","hashMale":"MP_MP_Biker_Tat_033_M","hashFemale":"MP_MP_Biker_Tat_033_F"}],"ZONE_TORSO":[{"label":"Ship Arms","name":"TAT_BB_018","collection":"mpbeach_overlays","zone":"ZONE_TORSO","hashMale":"MP_Bea_M_Back_000","hashFemale":""}]}}', 1),
	(80, 'SEV41363', 'mp_f_freemode_01', '{"model":"mp_f_freemode_01","props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"hair":{"texture":0,"color":0,"highlight":0,"style":21},"faceFeatures":{"eyeBrownHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"chinHole":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseBoneHigh":0,"chinBoneSize":0,"eyesOpening":0,"cheeksBoneHigh":0,"cheeksWidth":0,"lipsThickness":0,"noseBoneTwist":0,"jawBoneWidth":0,"eyeBrownForward":0,"cheeksBoneWidth":0,"noseWidth":0,"nosePeakLowering":0,"chinBoneLowering":0,"neckThickness":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":1},{"drawable":1,"texture":0,"component_id":7},{"drawable":16,"texture":0,"component_id":11},{"drawable":5,"texture":0,"component_id":3},{"drawable":6,"texture":0,"component_id":8},{"drawable":11,"texture":0,"component_id":9}],"eyeColor":-1,"headOverlays":{"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0.6,"style":3},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0}},"headBlend":{"skinThird":0,"shapeMix":0.3,"shapeSecond":21,"thirdMix":0,"skinSecond":15,"skinFirst":20,"shapeThird":0,"skinMix":0.1,"shapeFirst":45},"tattoos":[]}', 1),
	(83, 'RNG21283', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"headBlend":{"skinThird":0,"shapeMix":0,"shapeSecond":0,"shapeFirst":0,"skinSecond":0,"skinFirst":0,"shapeThird":0,"skinMix":0,"thirdMix":0},"faceFeatures":{"eyeBrownHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"chinHole":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseBoneHigh":0,"chinBoneSize":0,"noseWidth":0,"cheeksBoneHigh":0,"cheeksWidth":0,"lipsThickness":0,"noseBoneTwist":0,"jawBoneWidth":0,"eyeBrownForward":0,"chinBoneLowering":0,"cheeksBoneWidth":0,"nosePeakLowering":0,"eyesOpening":0,"neckThickness":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":7},{"drawable":7,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":3},{"drawable":10,"texture":8,"component_id":4},{"drawable":3,"texture":5,"component_id":6},{"drawable":6,"texture":0,"component_id":8},{"drawable":11,"texture":2,"component_id":11}],"hair":{"color":29,"texture":0,"highlight":29,"style":14},"headOverlays":{"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0}},"eyeColor":-1,"tattoos":[]}', 1),
	(91, 'CDR37384', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"eyeColor":8,"faceFeatures":{"eyeBrownHigh":-0.3,"nosePeakSize":0.5,"nosePeakHigh":0,"chinHole":0,"jawBoneBackSize":-0.4,"chinBoneLenght":-0.9,"noseBoneHigh":0.5,"cheeksBoneWidth":0,"noseWidth":0,"chinBoneLowering":0.7,"cheeksWidth":0,"lipsThickness":0.8,"noseBoneTwist":0,"jawBoneWidth":-0.3,"eyeBrownForward":-0.6,"cheeksBoneHigh":0,"eyesOpening":0,"nosePeakLowering":-0.3,"chinBoneSize":-0.5,"neckThickness":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":21},{"component_id":3,"texture":0,"drawable":25},{"component_id":4,"texture":0,"drawable":32},{"component_id":5,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":2},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":126},{"component_id":6,"texture":3,"drawable":258}],"headBlend":{"skinThird":0,"shapeMix":0.69,"shapeSecond":0,"shapeFirst":4,"skinSecond":0,"skinFirst":0,"skinMix":0,"thirdMix":0,"shapeThird":0},"hair":{"color":61,"texture":0,"highlight":61,"style":21},"headOverlays":{"beard":{"secondColor":0,"color":0,"opacity":1,"style":16},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":61,"opacity":1,"style":29},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0}},"tattoos":{"ZONE_HAIR":[{"hashMale":"FM_M_Hair_003_a","name":"hair-0-186","collection":"multiplayer_overlays","zone":"ZONE_HAIR","label":"hair-0-186","hashFemale":"FM_F_Hair_003_a"}]}}', 1),
	(92, 'XRK76375', 'mp_m_freemode_01', '{"model":"mp_m_freemode_01","props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"eyeColor":-1,"faceFeatures":{"eyeBrownHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"chinHole":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseWidth":0,"chinBoneSize":0,"eyeBrownForward":0,"chinBoneLowering":0,"cheeksWidth":0,"lipsThickness":0,"noseBoneTwist":0,"jawBoneWidth":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"cheeksBoneWidth":0,"nosePeakLowering":0,"eyesOpening":0,"neckThickness":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":134},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":8},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":15},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":258},{"component_id":4,"texture":0,"drawable":312},{"component_id":3,"texture":0,"drawable":12}],"headOverlays":{"beard":{"opacity":0,"color":0,"secondColor":0,"style":0},"eyebrows":{"opacity":1,"color":61,"secondColor":0,"style":3},"blush":{"opacity":0,"color":0,"secondColor":0,"style":0},"moleAndFreckles":{"opacity":0,"color":0,"secondColor":0,"style":0},"chestHair":{"opacity":0,"color":0,"secondColor":0,"style":0},"sunDamage":{"opacity":0,"color":0,"secondColor":0,"style":0},"complexion":{"opacity":0,"color":0,"secondColor":0,"style":0},"ageing":{"opacity":0,"color":0,"secondColor":0,"style":0},"makeUp":{"opacity":0,"color":0,"secondColor":0,"style":0},"lipstick":{"opacity":0,"color":0,"secondColor":0,"style":0},"bodyBlemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"blemishes":{"opacity":0,"color":0,"secondColor":0,"style":0}},"hair":{"color":61,"texture":0,"highlight":61,"style":134},"headBlend":{"skinThird":0,"shapeThird":0,"shapeSecond":0,"thirdMix":0,"skinSecond":0,"skinFirst":0,"shapeFirst":0,"skinMix":0,"shapeMix":0},"tattoos":[]}', 1),
	(93, 'EUN05205', 'mp_m_freemode_01', '{"headBlend":{"thirdMix":0,"shapeFirst":0,"skinSecond":0,"shapeThird":0,"shapeSecond":0,"skinThird":0,"skinFirst":0,"skinMix":0,"shapeMix":0},"hair":{"color":0,"texture":0,"highlight":0,"style":0},"headOverlays":{"beard":{"secondColor":0,"opacity":0,"color":0,"style":0},"blush":{"secondColor":0,"opacity":0,"color":0,"style":0},"ageing":{"secondColor":0,"opacity":0,"color":0,"style":0},"chestHair":{"secondColor":0,"opacity":0,"color":0,"style":0},"eyebrows":{"secondColor":0,"opacity":0,"color":0,"style":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"color":0,"style":0},"lipstick":{"secondColor":0,"opacity":0,"color":0,"style":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"color":0,"style":0},"makeUp":{"secondColor":0,"opacity":0,"color":0,"style":0},"complexion":{"secondColor":0,"opacity":0,"color":0,"style":0},"blemishes":{"secondColor":0,"opacity":0,"color":0,"style":0},"sunDamage":{"secondColor":0,"opacity":0,"color":0,"style":0}},"model":"mp_m_freemode_01","components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"tattoos":[],"eyeColor":-1,"faceFeatures":{"chinBoneLowering":0,"nosePeakHigh":0,"chinHole":0,"eyesOpening":0,"nosePeakSize":0,"noseBoneHigh":0,"nosePeakLowering":0,"jawBoneBackSize":0,"lipsThickness":0,"noseBoneTwist":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"chinBoneSize":0,"chinBoneLenght":0,"eyeBrownHigh":0,"neckThickness":0,"eyeBrownForward":0,"noseWidth":0,"cheeksBoneWidth":0},"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}]}', 1),
	(95, 'DXH34648', 'mp_m_freemode_01', '{"faceFeatures":{"jawBoneBackSize":0,"noseBoneHigh":0,"chinBoneLowering":0,"eyeBrownForward":0,"chinBoneLenght":0,"eyesOpening":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"chinHole":0,"nosePeakLowering":0,"nosePeakSize":0,"noseWidth":0,"neckThickness":0,"noseBoneTwist":0,"nosePeakHigh":0,"cheeksWidth":0,"lipsThickness":0,"jawBoneWidth":0,"chinBoneSize":0},"hair":{"color":61,"style":22,"texture":0,"highlight":61},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":22,"component_id":2,"texture":0},{"drawable":56,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":8,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":2,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":97,"component_id":11,"texture":0},{"drawable":4,"component_id":3,"texture":0}],"eyeColor":-1,"model":"mp_m_freemode_01","headOverlays":{"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":61,"style":16,"secondColor":0,"opacity":1},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0}},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"tattoos":{"ZONE_HAIR":[{"hashFemale":"FM_F_Hair_003_a","collection":"multiplayer_overlays","zone":"ZONE_HAIR","name":"hair-0-186","label":"hair-0-186","hashMale":"FM_M_Hair_003_a"}]},"headBlend":{"skinFirst":0,"skinSecond":0,"shapeFirst":0,"skinThird":0,"shapeSecond":0,"thirdMix":0,"shapeMix":0,"skinMix":0,"shapeThird":0}}', 1);

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
DELETE FROM `player_contacts`;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.player_houses: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_houses`;
INSERT INTO `player_houses` (`id`, `house`, `identifier`, `citizenid`, `keyholders`, `decorations`, `stash`, `outfit`, `logout`) VALUES
	(3, 'grove st3', 'license:e207f3efbd5ce9740fb0023c63e1bc98a00e162b', 'UQL52088', '["UQL52088"]', '[{"rotx":0.0,"hashname":"p_mbbed_s","x":108.50495147705078,"roty":-0.0,"y":-1913.999755859375,"object":688898,"rotz":0.0,"z":-7.29420614242553,"objectId":1}]', NULL, NULL, NULL),
	(4, 'grove st2', 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'XRK76375', '["XRK76375"]', NULL, NULL, NULL, NULL),
	(5, 'grove st2', 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'XRK76375', '["XRK76375"]', NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.player_mails: ~19 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_mails`;
INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(3, 'SVN81090', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. sas, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 395867, '2024-01-20 15:57:09', '[]'),
	(4, 'SVN81090', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. sas, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 787013, '2024-01-20 15:57:12', '[]'),
	(5, 'HGO75866', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. Edison, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 305422, '2024-01-20 16:19:59', '[]'),
	(10, 'FYH40953', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 932987, '2024-01-22 18:26:05', '[]'),
	(15, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Vidarr Odinson<br />Phone Number: <strong>820532</strong><br><br>Kind regards,<br>Township Los Santos', 0, 337826, '2024-01-23 14:39:52', '[]'),
	(16, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Vidarr Odinson<br />Phone Number: <strong>820532</strong><br><br>Kind regards,<br>Township Los Santos', 0, 639710, '2024-01-23 14:39:52', '[]'),
	(17, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Vidarr Odinson<br />Phone Number: <strong>820532</strong><br><br>Kind regards,<br>Township Los Santos', 0, 242675, '2024-01-23 14:39:52', '[]'),
	(18, 'HGO75866', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. Edison, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 932987, '2024-01-27 13:44:29', '[]'),
	(20, 'XRK76375', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 932987, '2024-02-01 18:51:21', '[]'),
	(21, 'XRK76375', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 756519, '2024-02-01 18:54:21', '[]'),
	(22, 'XRK76375', 'Bay Smith', 'IT CEO', 'İyi iş! Parayı almak için şirkete geri dön.', 0, 337826, '2024-02-01 19:26:17', '[]'),
	(23, 'PAE72962', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 208696, '2024-02-01 21:28:01', '[]'),
	(24, 'PAE72962', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 601202, '2024-02-01 21:29:22', '[]'),
	(25, 'PAE72962', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 551363, '2024-02-01 21:39:29', '[]'),
	(26, 'HGO75866', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 902210, '2024-02-02 11:55:50', '[]'),
	(27, 'HGO75866', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 403581, '2024-02-02 11:57:19', '[]'),
	(28, 'XRK76375', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 932987, '2024-02-02 12:55:20', '[]'),
	(29, 'HGO75866', 'The Diamond Casino', 'Hosgeldiniz!', 'Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir.', 0, 756519, '2024-02-02 12:55:20', '[]'),
	(30, 'RNG21283', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. Morgan, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 208218, '2024-02-02 15:18:36', '[]'),
	(31, 'HGO75866', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. Edison, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 813715, '2024-02-03 13:06:43', '[]'),
	(32, 'CDR37384', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. Toe, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 547775, '2024-02-03 13:09:45', '[]'),
	(33, 'HGO75866', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. Edison, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 497008, '2024-02-03 13:21:28', '[]'),
	(34, 'HGO75866', 'Hastane', 'Hastane Maliyetleri', 'Sayın Mr. Edison, <br /><br />Son hastane ziyaretinin masraflarını içeren bir e-posta aldınız.<br />Nihai maliyetler ortaya çıktı: <strong>$2000</strong><br /><br />Gecmiş Olsun!', 0, 346865, '2024-02-03 13:27:25', '[]');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.player_outfits: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_outfits`;
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `props`, `components`) VALUES
	(27, 'PAE72962', 'a', 'mp_m_freemode_01', '[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}]', '[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":3},{"texture":0,"component_id":3,"drawable":4},{"texture":0,"component_id":4,"drawable":1},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":58},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":15}]'),
	(28, 'FYH40953', 'confirm', 'mp_m_freemode_01', '[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}]', '[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":3},{"texture":0,"component_id":3,"drawable":4},{"texture":0,"component_id":4,"drawable":1},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":58},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":15}]');

-- tablo yapısı dökülüyor elused.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.player_outfit_codes: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_outfit_codes`;
INSERT INTO `player_outfit_codes` (`id`, `outfitid`, `code`) VALUES
	(1, 27, '9MbwptYllF');

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
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` text DEFAULT NULL,
  `paymentamount` text DEFAULT NULL,
  `datetimein` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.player_vehicles: ~28 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_vehicles`;
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `datetimein`) VALUES
	(4, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'bf400', '86520421', '{"modSpoilers":-1,"wheels":6,"modTrimB":-1,"modSideSkirt":-1,"modXenon":false,"modExhaust":-1,"engineHealth":1000.0592475178704,"modSpeakers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrame":-1,"liveryRoof":-1,"neonColor":[0,0,0],"modKit17":-1,"modRearBumper":-1,"tyreSmokeColor":[255,255,255],"oilLevel":4.76596940834568,"modSteeringWheel":-1,"color1":[255,255,255],"modCustomTiresR":false,"modPlateHolder":-1,"modTrunk":-1,"modEngine":-1,"modTransmission":-1,"wheelWidth":0.0,"modSuspension":-1,"modArmor":-1,"modWindows":-1,"plate":"PRTZ4551","modGrille":-1,"modStruts":-1,"plateIndex":0,"modHorns":-1,"modHood":-1,"modTurbo":false,"modBrakes":-1,"modAerials":-1,"dashboardColor":111,"modCustomTiresF":false,"headlightColor":255,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"neonEnabled":[false,false,false,false],"modKit49":-1,"modDoorSpeaker":-1,"modAPlate":-1,"modDial":-1,"fuelLevel":65.13491524739108,"extras":[],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":5,"windowTint":-1,"modOrnaments":-1,"modTank":-1,"model":86520421,"modArchCover":-1,"tankHealth":1000.0592475178704,"wheelColor":112,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"color2":[255,255,255],"modRightFender":-1,"modLivery":-1,"modFender":-1,"interiorColor":111,"modEngineBlock":-1,"modFrontWheels":-1,"dirtLevel":14.29790822503706,"modKit19":-1,"modAirFilter":-1,"modSeats":-1,"xenonColor":255,"modKit21":-1,"modTrimA":-1,"modShifterLeavers":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modFrontBumper":-1,"modSmokeEnabled":false,"modKit47":-1,"modVanityPlate":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"modRoof":-1,"modDashboard":-1,"modBackWheels":-1}', 'PRTZ4551', NULL, NULL, 100, 1000, 1000, 1, 0, 2032, NULL, NULL, NULL, NULL),
	(5, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'sanctus', '1491277511', '{"modSpoilers":-1,"wheels":6,"modTrimB":-1,"modSideSkirt":-1,"modXenon":false,"modExhaust":-1,"engineHealth":1000.0592475178704,"modSpeakers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrame":-1,"liveryRoof":-1,"neonColor":[0,0,0],"modKit17":-1,"modRearBumper":-1,"tyreSmokeColor":[255,255,255],"oilLevel":4.76596940834568,"modSteeringWheel":-1,"color1":[255,255,255],"modCustomTiresR":false,"modPlateHolder":-1,"modTrunk":-1,"modEngine":-1,"modTransmission":-1,"wheelWidth":0.0,"modSuspension":-1,"modArmor":-1,"modWindows":-1,"plate":"DGQP6468","modGrille":-1,"modStruts":-1,"plateIndex":0,"modHorns":-1,"modHood":-1,"modTurbo":false,"modBrakes":-1,"modAerials":-1,"dashboardColor":111,"modCustomTiresF":false,"headlightColor":255,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"neonEnabled":[false,false,false,false],"modKit49":-1,"modDoorSpeaker":-1,"modAPlate":-1,"modDial":-1,"fuelLevel":65.13491524739108,"extras":[],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":27,"windowTint":-1,"modOrnaments":-1,"modTank":-1,"model":1491277511,"modArchCover":-1,"tankHealth":1000.0592475178704,"wheelColor":33,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"color2":[255,255,255],"modRightFender":-1,"modLivery":-1,"modFender":-1,"interiorColor":111,"modEngineBlock":-1,"modFrontWheels":-1,"dirtLevel":0.0,"modKit19":-1,"modAirFilter":-1,"modSeats":-1,"xenonColor":255,"modKit21":-1,"modTrimA":-1,"modShifterLeavers":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modFrontBumper":-1,"modSmokeEnabled":false,"modKit47":-1,"modVanityPlate":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"modRoof":-1,"modDashboard":-1,"modBackWheels":-1}', 'DGQP6468', NULL, NULL, 100, 1000, 1000, 1, 0, 2101, NULL, NULL, NULL, NULL),
	(7, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'vigero2', '-1758379524', '{"modSpoilers":-1,"wheels":1,"modTrimB":-1,"modSideSkirt":-1,"modXenon":false,"modExhaust":-1,"engineHealth":1000.0592475178704,"modSpeakers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrame":-1,"liveryRoof":-1,"neonColor":[0,0,0],"modKit17":-1,"modRearBumper":-1,"tyreSmokeColor":[255,255,255],"oilLevel":4.76596940834568,"modSteeringWheel":-1,"color1":[255,255,255],"modCustomTiresR":false,"modPlateHolder":-1,"modTrunk":-1,"modEngine":-1,"modTransmission":-1,"wheelWidth":0.0,"modSuspension":-1,"modArmor":-1,"modWindows":-1,"plate":"CWQL8070","modGrille":-1,"modStruts":-1,"plateIndex":0,"modHorns":-1,"modHood":-1,"modTurbo":false,"modBrakes":-1,"modAerials":-1,"dashboardColor":134,"modCustomTiresF":false,"headlightColor":255,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"neonEnabled":[false,false,false,false],"modKit49":-1,"modDoorSpeaker":-1,"modAPlate":-1,"modDial":-1,"fuelLevel":65.13491524739108,"extras":[],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":73,"windowTint":-1,"modOrnaments":-1,"modTank":-1,"model":-1758379524,"modArchCover":-1,"tankHealth":1000.0592475178704,"wheelColor":0,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"color2":[255,255,255],"modRightFender":-1,"modLivery":-1,"modFender":-1,"interiorColor":93,"modEngineBlock":-1,"modFrontWheels":-1,"dirtLevel":0.0,"modKit19":-1,"modAirFilter":-1,"modSeats":-1,"xenonColor":255,"modKit21":-1,"modTrimA":-1,"modShifterLeavers":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":true,"5":true,"6":true,"7":true,"0":true},"modFrontBumper":-1,"modSmokeEnabled":false,"modKit47":-1,"modVanityPlate":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"modRoof":-1,"modDashboard":-1,"modBackWheels":-1}', 'CWQL8070', NULL, NULL, 100, 1000, 1000, 1, 0, 2039, NULL, NULL, NULL, NULL),
	(9, 'license:64038a7810c56288850ab0e5cc75768c0b817337', 'FYH40953', 'drafter', '686471183', '{"headlightColor":2,"windowTint":1,"interiorColor":53,"modVanityPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modWindows":-1,"modPlateHolder":-1,"modHorns":-1,"modSideSkirt":1,"modSeats":-1,"modAirFilter":-1,"color1":70,"modHydrolic":-1,"modHood":6,"modSteeringWheel":-1,"modXenon":1,"modBrakes":2,"fuelLevel":50.04267878762973,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"modLivery":4,"modTank":-1,"modKit49":-1,"dashboardColor":111,"plateIndex":2,"model":686471183,"modEngine":3,"tankHealth":1000.0592475178704,"modRightFender":1,"modCustomTiresF":false,"wheelColor":111,"modKit19":-1,"liveryRoof":-1,"tyreSmokeColor":[0,150,255],"modRoof":4,"modFender":0,"modTrimB":-1,"wheelWidth":1.01905560493469,"modKit21":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit17":-1,"modExhaust":1,"modAPlate":-1,"modDoorSpeaker":-1,"wheels":0,"modKit47":-1,"modSpoilers":7,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modTrunk":-1,"modRearBumper":1,"plate":"61PTI046","engineHealth":1000.0592475178704,"pearlescentColor":4,"modGrille":0,"dirtLevel":0.0,"wheelSize":1.14004623889923,"modFrontWheels":60,"bodyHealth":1000.0592475178704,"modArmor":4,"oilLevel":6.35462587779425,"modTurbo":1,"modEngineBlock":-1,"color2":0,"modSmokeEnabled":1,"modSpeakers":-1,"modFrame":-1,"modDial":-1,"modCustomTiresR":false,"modFrontBumper":1,"neonEnabled":[1,1,1,1],"extras":[],"xenonColor":2,"modAerials":-1,"modOrnaments":-1,"modArchCover":-1,"modSuspension":4,"modTrimA":-1,"modBackWheels":-1,"neonColor":[3,83,255],"modTransmission":3,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"modShifterLeavers":-1}', '61PTI046', NULL, 'pinkcagegarage', 62, 1000, 1000, 1, 0, 24561, NULL, NULL, NULL, NULL),
	(17, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'caracara', '1254014755', '{"modSideSkirt":-1,"modTrimB":-1,"modSteeringWheel":-1,"wheelSize":0.0,"color2":[255,255,255],"modKit49":-1,"dashboardColor":156,"modAPlate":-1,"modSpoilers":-1,"modDashboard":-1,"modOrnaments":-1,"modKit19":-1,"neonColor":[0,0,0],"dirtLevel":0.0,"modRoof":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":-1,"modVanityPlate":-1,"pearlescentColor":6,"modTrunk":-1,"modPlateHolder":-1,"tankHealth":1000.0592475178704,"modKit17":-1,"modDial":-1,"modHorns":-1,"modTrimA":-1,"modAirFilter":-1,"modSmokeEnabled":false,"engineHealth":1000.0592475178704,"modBrakes":-1,"modTank":-1,"modExhaust":-1,"plateIndex":0,"interiorColor":0,"liveryRoof":-1,"modXenon":false,"modDoorSpeaker":-1,"modHydrolic":-1,"windowTint":-1,"modArmor":-1,"xenonColor":255,"modTransmission":-1,"modSpeakers":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modEngineBlock":-1,"modRightFender":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"modKit47":-1,"modStruts":-1,"modCustomTiresF":false,"modRearBumper":-1,"wheels":3,"modCustomTiresR":false,"modSuspension":-1,"wheelWidth":0.0,"modWindows":-1,"modFrame":-1,"extras":[],"modKit21":-1,"plate":"YRML7689","tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"bodyHealth":1000.0592475178704,"neonEnabled":[false,false,false,false],"model":1254014755,"oilLevel":4.76596940834568,"color1":[255,255,255],"modFrontWheels":-1,"modAerials":-1,"modHood":-1,"wheelColor":0,"modEngine":-1,"modFrontBumper":-1,"modFender":-1,"modShifterLeavers":-1,"modSeats":-1,"modBackWheels":-1,"modGrille":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTurbo":false,"modArchCover":-1,"headlightColor":255}', 'YRML7689', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, NULL, NULL, NULL),
	(18, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'everon', '-1756021720', '{"modSideSkirt":-1,"modTrimB":-1,"modSteeringWheel":-1,"wheelSize":0.0,"color2":[255,255,255],"modKit49":-1,"dashboardColor":156,"modAPlate":-1,"modSpoilers":-1,"modDashboard":-1,"modOrnaments":-1,"modKit19":-1,"neonColor":[0,0,0],"dirtLevel":14.29790822503706,"modRoof":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":-1,"modVanityPlate":-1,"pearlescentColor":27,"modTrunk":-1,"modPlateHolder":-1,"tankHealth":1000.0592475178704,"modKit17":-1,"modDial":-1,"modHorns":-1,"modTrimA":-1,"modAirFilter":-1,"modSmokeEnabled":false,"engineHealth":1000.0592475178704,"modBrakes":-1,"modTank":-1,"modExhaust":-1,"plateIndex":0,"interiorColor":8,"liveryRoof":-1,"modXenon":false,"modDoorSpeaker":-1,"modHydrolic":-1,"windowTint":-1,"modArmor":-1,"xenonColor":255,"modTransmission":-1,"modSpeakers":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modEngineBlock":-1,"modRightFender":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"modKit47":-1,"modStruts":-1,"modCustomTiresF":false,"modRearBumper":-1,"wheels":3,"modCustomTiresR":false,"modSuspension":-1,"wheelWidth":0.0,"modWindows":-1,"modFrame":-1,"extras":[],"modKit21":-1,"plate":"HTNK1061","tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"bodyHealth":1000.0592475178704,"neonEnabled":[false,false,false,false],"model":-1756021720,"oilLevel":4.76596940834568,"color1":[255,255,255],"modFrontWheels":-1,"modAerials":-1,"modHood":-1,"wheelColor":0,"modEngine":-1,"modFrontBumper":-1,"modFender":-1,"modShifterLeavers":-1,"modSeats":-1,"modBackWheels":-1,"modGrille":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTurbo":false,"modArchCover":-1,"headlightColor":255}', 'HTNK1061', NULL, NULL, 100, 1000, 1000, 1, 0, 14823, NULL, NULL, NULL, NULL),
	(19, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'dubsta3', '-1237253773', '{"modFrame":-1,"interiorColor":0,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"extras":[],"modTrimB":-1,"modDashboard":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"tankHealth":996.0876063442489,"wheels":4,"modFrontWheels":-1,"wheelSize":0.0,"modCustomTiresF":false,"xenonColor":255,"modAerials":-1,"modExhaust":-1,"modArchCover":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"liveryRoof":-1,"modKit17":-1,"modAirFilter":-1,"modRoof":-1,"modRightFender":-1,"bodyHealth":958.7541793122077,"modPlateHolder":-1,"headlightColor":255,"model":-1237253773,"modTrunk":-1,"neonColor":[0,0,0],"modRearBumper":-1,"modTrimA":-1,"modBackWheels":-1,"modSuspension":-1,"plate":"87XMF097","wheelWidth":0.0,"modDoorSpeaker":-1,"modSteeringWheel":-1,"fuelLevel":50.04267878762973,"modDial":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":156,"modSpeakers":-1,"dashboardColor":0,"modHydrolic":-1,"oilLevel":7.94328234724281,"modShifterLeavers":-1,"modKit49":-1,"plateIndex":0,"modWindows":-1,"modTransmission":-1,"modLivery":-1,"modBrakes":-1,"neonEnabled":[false,false,false,false],"modFender":-1,"modSideSkirt":-1,"modKit19":-1,"engineHealth":938.1016452093764,"modCustomTiresR":false,"modKit21":-1,"modOrnaments":-1,"modTank":-1,"color1":1,"modSpoilers":-1,"modEngineBlock":-1,"modKit47":-1,"modArmor":-1,"dirtLevel":0.0,"modSmokeEnabled":false,"color2":1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"windowTint":-1,"modEngine":-1,"modFrontBumper":-1,"modStruts":-1,"modVanityPlate":-1,"pearlescentColor":18,"modSeats":-1,"modGrille":-1,"modHorns":-1,"modHood":-1,"modAPlate":-1,"modTurbo":false,"tyreSmokeColor":[255,255,255]}', '87XMF097', NULL, 'Out', 30, 939, 959, 1, 0, 335717, NULL, NULL, NULL, NULL),
	(24, 'license:64038a7810c56288850ab0e5cc75768c0b817337', 'FYH40953', 'jugular', '-208911803', '{"modKit17":-1,"modPlateHolder":-1,"windowTint":1,"color1":143,"modXenon":1,"modAPlate":-1,"dashboardColor":111,"fuelLevel":50.04267878762973,"color2":143,"modHorns":-1,"modKit49":-1,"modAerials":-1,"wheels":0,"neonColor":[255,1,1],"modWindows":-1,"modTrimA":-1,"modAirFilter":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":1,"interiorColor":34,"modBrakes":2,"tankHealth":991.3216369359033,"modOrnaments":-1,"model":-208911803,"modGrille":2,"extras":{"1":false},"plate":"20DII679","oilLevel":6.35462587779425,"modSideSkirt":0,"wheelColor":111,"modSuspension":3,"dirtLevel":0.79432823472428,"modTank":-1,"neonEnabled":[1,1,1,1],"modEngineBlock":-1,"engineHealth":1000.0592475178704,"modHood":6,"modTurbo":1,"modVanityPlate":-1,"modSpoilers":6,"modExhaust":1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireHealth":{"1":995.152587890625,"2":1000.0,"3":1000.0,"0":999.6755981445313},"modArchCover":-1,"modKit21":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"modEngine":3,"headlightColor":8,"modBackWheels":-1,"modSteeringWheel":-1,"modLivery":-1,"modHydrolic":-1,"modRearBumper":0,"modSmokeEnabled":1,"modKit47":-1,"modSpeakers":-1,"modCustomTiresF":false,"modRightFender":-1,"modFender":-1,"pearlescentColor":28,"xenonColor":8,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"tyreSmokeColor":[255,10,10],"wheelSize":1.20613586902618,"modCustomTiresR":false,"liveryRoof":-1,"modDoorSpeaker":-1,"wheelWidth":1.11004269123077,"modKit19":-1,"modFrontWheels":60,"bodyHealth":953.1938816691378,"modTransmission":3,"modSeats":-1,"modStruts":-1,"modRoof":-1,"modArmor":-1,"modTrunk":-1,"modDial":-1,"modFrame":-1,"modShifterLeavers":-1,"modTrimB":-1,"modFrontBumper":1}', '20DII679', NULL, 'delperrogarage', 64, 1000, 954, 1, 0, 9476, NULL, NULL, NULL, NULL),
	(31, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'npolexp', '401086930', '{}', 'PD  7461', NULL, NULL, 100, 1000, 1000, 1, 0, 5185, NULL, NULL, NULL, NULL),
	(32, 'license:52b101e073da3b76bb2218931ce6fb5e38c2bd69', 'BMS02698', 'issi8', '1550581940', '{"plateIndex":0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngineBlock":-1,"color2":[255,255,255],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"wheels":7,"modTurbo":false,"modFrontWheels":-1,"neonColor":[255,0,255],"modAerials":-1,"modFrontBumper":-1,"oilLevel":4.76596940834568,"modEngine":-1,"modSideSkirt":-1,"modKit49":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSeats":-1,"modVanityPlate":-1,"modSpoilers":-1,"plate":"YHKC7718","modCustomTiresF":false,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"modSpeakers":-1,"modRearBumper":-1,"dashboardColor":134,"modExhaust":-1,"liveryRoof":-1,"modTrimA":-1,"tyreSmokeColor":[255,255,255],"modSmokeEnabled":false,"modDoorSpeaker":-1,"modTransmission":-1,"wheelWidth":0.0,"modAPlate":-1,"modHood":-1,"modArmor":-1,"modKit47":-1,"windowTint":-1,"engineHealth":1000.0592475178704,"modTank":-1,"modKit17":-1,"modSteeringWheel":-1,"modRoof":-1,"modGrille":-1,"modKit19":-1,"headlightColor":255,"modAirFilter":-1,"modSuspension":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"extras":[],"modArchCover":-1,"modFender":-1,"tankHealth":1000.0592475178704,"modTrimB":-1,"modBackWheels":-1,"modKit21":-1,"model":1550581940,"modOrnaments":-1,"modLivery":-1,"modShifterLeavers":-1,"modBrakes":-1,"modWindows":-1,"modFrame":-1,"xenonColor":255,"modCustomTiresR":false,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"modPlateHolder":-1,"modDial":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":0,"modRightFender":-1,"dirtLevel":3.17731293889712,"modHorns":-1,"modDashboard":-1,"modStruts":-1,"modTrunk":-1,"pearlescentColor":2,"fuelLevel":65.13491524739108,"color1":[255,255,255],"interiorColor":93}', 'YHKC7718', NULL, NULL, 100, 1000, 1000, 1, 0, 579, NULL, NULL, NULL, NULL),
	(38, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'npolvette', '-1109563416', '{"modKit47":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modHorns":-1,"modAirFilter":-1,"wheels":0,"plateIndex":4,"pearlescentColor":66,"headlightColor":255,"tankHealth":3989.9107230200659,"modBackWheels":-1,"windowTint":-1,"liveryRoof":-1,"modAerials":-1,"wheelWidth":1.0,"modSpeakers":-1,"plate":"62MXK248","modXenon":false,"modArchCover":-1,"modSteeringWheel":-1,"modHood":0,"modKit19":-1,"color2":141,"modFender":-1,"xenonColor":255,"modAPlate":-1,"wheelSize":1.0,"modPlateHolder":-1,"modKit17":-1,"modVanityPlate":-1,"dashboardColor":63,"modSuspension":2,"modGrille":-1,"modTrunk":-1,"dirtLevel":0.79432823472428,"neonColor":[255,0,255],"modDoorSpeaker":-1,"modRearBumper":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"engineHealth":852.314195859154,"modArmor":-1,"modStruts":-1,"fuelLevel":50.04267878762973,"modCustomTiresR":false,"neonEnabled":[false,false,false,false],"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":true,"0":false},"modTrimA":-1,"modSideSkirt":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSmokeEnabled":false,"modFrontWheels":-1,"tyreSmokeColor":[255,255,255],"modRoof":0,"modCustomTiresF":false,"modFrame":-1,"modBrakes":2,"oilLevel":7.14895411251853,"modKit21":-1,"modTank":-1,"modExhaust":-1,"modEngine":4,"modDashboard":0,"modTransmission":3,"extras":{"6":false,"5":false,"4":false,"3":false,"2":true,"1":true},"modFrontBumper":-1,"modOrnaments":0,"modKit49":-1,"modWindows":-1,"color1":141,"modTrimB":-1,"modSpoilers":-1,"modRightFender":-1,"modSeats":-1,"modEngineBlock":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":-1,"model":-1109563416,"modHydrolic":-1,"bodyHealth":900.7682181773351,"wheelColor":0,"modTurbo":1,"modDial":0,"interiorColor":111}', '62MXK248', NULL, 'pdgarage2', 80, 853, 902, 0, 0, 1439, NULL, NULL, NULL, NULL),
	(39, 'license:759f35b0a5e54b71040546417277a6471bac20df', 'CDR37384', 'tezeract', '1031562256', '{"tyreSmokeColor":[255,255,255],"neonColor":[255,0,255],"modCustomTiresR":false,"modKit49":-1,"modBrakes":-1,"wheelWidth":1.0,"tankHealth":997.6762628136975,"modAirFilter":-1,"oilLevel":4.76596940834568,"modKit19":-1,"headlightColor":255,"plateIndex":0,"color1":1,"interiorColor":0,"liveryRoof":-1,"dirtLevel":11.91492352086422,"modDial":-1,"modKit21":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"dashboardColor":0,"modSuspension":-1,"xenonColor":255,"bodyHealth":996.8819345789732,"modSeats":-1,"modShifterLeavers":-1,"modWindows":-1,"modFender":-1,"modDoorSpeaker":-1,"modAPlate":-1,"modSteeringWheel":-1,"modTrimA":-1,"modSpoilers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"modHydrolic":-1,"modRearBumper":-1,"modSideSkirt":-1,"extras":[],"modVanityPlate":-1,"modHorns":-1,"modGrille":-1,"modKit47":-1,"modEngine":-1,"modFrontBumper":-1,"modSmokeEnabled":false,"modXenon":false,"wheelSize":1.0,"modStruts":-1,"modRightFender":-1,"neonEnabled":[false,false,false,false],"model":1031562256,"modRoof":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrame":-1,"modAerials":-1,"modTrunk":-1,"pearlescentColor":3,"modTank":-1,"modTransmission":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modKit17":-1,"plate":"KKNDEDLN","wheels":7,"modCustomTiresF":false,"color2":38,"modBackWheels":-1,"modEngineBlock":-1,"modArmor":-1,"modHood":-1,"windowTint":-1,"wheelColor":0,"modPlateHolder":-1,"modTurbo":false,"modExhaust":-1,"modTrimB":-1,"engineHealth":1000.0592475178704,"modSpeakers":-1,"modArchCover":-1,"modOrnaments":-1,"modFrontWheels":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"fuelLevel":65.13491524739108,"modLivery":-1}', 'KKNDEDLN', '', '', 100, 1000, 1000, 0, 0, 2202, '', NULL, NULL, NULL),
	(40, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'npolvette', '-1109563416', '{"modKit17":-1,"modPlateHolder":-1,"windowTint":-1,"color1":141,"modXenon":false,"modFrontBumper":-1,"dashboardColor":63,"fuelLevel":50.04267878762973,"color2":141,"modArmor":4,"modKit49":-1,"modAerials":-1,"wheels":0,"neonColor":[255,0,255],"modWindows":-1,"modBackWheels":-1,"modAirFilter":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":4,"interiorColor":111,"modBrakes":2,"tankHealth":926.9810499232365,"modOrnaments":-1,"model":-1109563416,"modGrille":-1,"headlightColor":255,"plate":"83VMI443","modCustomTiresR":false,"modSideSkirt":-1,"wheelSize":1.0,"modSuspension":3,"modArchCover":-1,"modTank":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"engineHealth":603.6894583904539,"modHood":-1,"modTurbo":1,"modVanityPlate":-1,"extras":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false},"modExhaust":-1,"oilLevel":7.14895411251853,"windowStatus":{"1":true,"2":true,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modTrunk":-1,"wheelWidth":1.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"modEngine":4,"modHorns":-1,"modSteeringWheel":-1,"tireHealth":{"1":986.6502685546875,"2":996.0899658203125,"3":997.5946655273438,"0":970.3438720703125},"modDial":-1,"modStruts":-1,"modRearBumper":-1,"modSmokeEnabled":false,"modDoorSpeaker":-1,"modSpeakers":-1,"pearlescentColor":66,"modAPlate":-1,"dirtLevel":9.53193881669137,"modHydrolic":-1,"xenonColor":255,"doorStatus":{"1":false,"2":false,"3":false,"4":true,"5":false,"0":true},"tyreSmokeColor":[255,255,255],"modLivery":-1,"liveryRoof":-1,"modFrontWheels":-1,"wheelColor":0,"modFender":-1,"modKit19":-1,"modCustomTiresF":false,"bodyHealth":664.8527324642236,"modTransmission":3,"modSeats":-1,"modRightFender":-1,"modRoof":-1,"modKit21":-1,"modKit47":-1,"modTrimA":-1,"modFrame":-1,"modShifterLeavers":-1,"modTrimB":-1,"modSpoilers":-1}', '83VMI443', NULL, 'motelgaraj', 65, 604, 665, 1, 0, 124280, NULL, NULL, NULL, NULL),
	(41, 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'XRK76375', 'zentorno', '-1403128555', '{"modSpeakers":-1,"modDial":-1,"modRearBumper":0,"modDashboard":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimB":-1,"modBrakes":-1,"modFrame":1,"modCustomTiresF":false,"modXenon":false,"interiorColor":0,"modEngineBlock":-1,"modHorns":5,"modKit21":-1,"dirtLevel":0.0,"modTrunk":-1,"modTank":-1,"modVanityPlate":-1,"modSuspension":-1,"plateIndex":1,"modLivery":8,"xenonColor":1,"liveryRoof":-1,"modArmor":-1,"modWindows":-1,"modArchCover":-1,"modOrnaments":-1,"modTransmission":2,"modCustomTiresR":false,"wheelColor":156,"engineHealth":1000.0592475178704,"color1":1,"modPlateHolder":-1,"modExhaust":5,"modSeats":-1,"windowTint":1,"tyreSmokeColor":[255,255,255],"modKit19":-1,"modAirFilter":-1,"modAerials":-1,"modFrontWheels":-1,"modBackWheels":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"oilLevel":4.76596940834568,"bodyHealth":1000.0592475178704,"headlightColor":1,"modRoof":0,"modEngine":3,"modAPlate":-1,"modTurbo":1,"modSpoilers":4,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHood":1,"extras":[],"modFender":0,"modTrimA":-1,"model":-1403128555,"neonEnabled":[1,1,1,1],"dashboardColor":0,"tankHealth":4000.2369900714818,"color2":41,"fuelLevel":65.13491524739108,"wheelWidth":1.0,"modStruts":-1,"modGrille":0,"modHydrolic":-1,"pearlescentColor":7,"modSmokeEnabled":false,"plate":"28WQR314","modSideSkirt":1,"wheels":7,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"neonColor":[35,1,255],"modKit47":-1,"modRightFender":1,"modFrontBumper":2,"modKit49":-1,"modKit17":-1,"wheelSize":1.0,"modShifterLeavers":-1,"modDoorSpeaker":-1,"modSteeringWheel":-1}', '28WQR314', NULL, NULL, 100, 1000, 1000, 1, 0, 328196, NULL, NULL, NULL, NULL),
	(42, 'license:759f35b0a5e54b71040546417277a6471bac20df', 'CDR37384', 'futo', '2016857647', '{"modTurbo":false,"modDial":-1,"modRearBumper":-1,"modDashboard":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDoorSpeaker":-1,"modBrakes":-1,"modFrame":-1,"modHydrolic":-1,"modXenon":false,"interiorColor":0,"modEngineBlock":-1,"modHorns":-1,"modKit21":-1,"dirtLevel":0.0,"modTrunk":-1,"modTank":-1,"modVanityPlate":-1,"modSuspension":-1,"plateIndex":2,"modLivery":-1,"modStruts":-1,"liveryRoof":-1,"modArmor":-1,"wheels":5,"modSideSkirt":-1,"modOrnaments":-1,"modTransmission":-1,"modCustomTiresR":false,"wheelColor":156,"engineHealth":989.7329804664547,"color1":0,"modPlateHolder":-1,"modExhaust":-1,"modSmokeEnabled":false,"windowTint":-1,"tyreSmokeColor":[255,255,255],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAirFilter":-1,"modArchCover":-1,"tireHealth":{"1":1000.0,"2":999.0224609375,"3":895.4056396484375,"0":1000.0},"modBackWheels":-1,"neonColor":[0,0,0],"modSteeringWheel":-1,"bodyHealth":923.8037369843394,"headlightColor":255,"modRoof":-1,"wheelSize":1.0,"modAPlate":-1,"modAerials":-1,"modSpeakers":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHood":-1,"modKit47":-1,"plate":"07OMP382","modTrimA":-1,"model":2016857647,"neonEnabled":[false,false,false,false],"dashboardColor":0,"tankHealth":991.3216369359033,"modFrontWheels":-1,"fuelLevel":50.04267878762973,"wheelWidth":1.0,"modWindows":-1,"modGrille":-1,"modSeats":-1,"modKit17":-1,"modTrimB":-1,"xenonColor":255,"modSpoilers":-1,"pearlescentColor":26,"oilLevel":4.76596940834568,"windowStatus":{"1":false,"2":true,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"color2":0,"modEngine":-1,"modRightFender":-1,"modFrontBumper":-1,"modKit49":-1,"modFender":-1,"modKit19":-1,"modShifterLeavers":-1,"modCustomTiresF":false,"extras":{"1":false}}', '07OMP382', NULL, NULL, 100, 1000, 1000, 0, 0, 5052, NULL, NULL, NULL, NULL),
	(43, 'license:e0583589f7ca5650689105802df0bd4975d2d06f', 'WZB65598', 'panto', '-431692672', 'null', 'QOMQJFFD', '', '', 100, 1000, 1000, 1, 0, 33129, '', NULL, NULL, NULL),
	(44, 'license:759f35b0a5e54b71040546417277a6471bac20df', 'CDR37384', 'npolexp', '417470901', '{}', 'PD  5413', NULL, NULL, 100, 1000, 1000, 0, 0, 2734, NULL, NULL, NULL, NULL),
	(45, 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'XRK76375', 'npolvette', '1184623429', '{}', 'PD  9059', NULL, NULL, 100, 1000, 1000, 1, 0, 192, NULL, NULL, NULL, NULL),
	(47, 'license:1b08d417a013b97236eb4941ed577c2aa22f4973', 'PAE72962', 't20', '1663218586', '{"windowTint":-1,"oilLevel":4.76596940834568,"modTank":-1,"modArchCover":-1,"modFrontWheels":-1,"modPlateHolder":-1,"engineHealth":1000.0592475178704,"modKit21":-1,"modKit19":-1,"headlightColor":255,"modGrille":-1,"dashboardColor":0,"modTrimB":-1,"pearlescentColor":3,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"modKit47":-1,"model":1663218586,"modRightFender":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBrakes":-1,"modDial":-1,"modTransmission":-1,"wheelColor":0,"modAerials":-1,"modFrontBumper":-1,"modDashboard":-1,"modFrame":-1,"modHood":-1,"xenonColor":255,"modTurbo":false,"modXenon":false,"color1":0,"liveryRoof":-1,"modBackWheels":-1,"interiorColor":0,"modSuspension":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":0,"modSpeakers":-1,"modSideSkirt":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modAPlate":-1,"wheels":7,"dirtLevel":0.0,"modEngine":-1,"extras":[],"modDoorSpeaker":-1,"modAirFilter":-1,"modSeats":-1,"modShifterLeavers":-1,"modTrunk":-1,"neonColor":[255,0,255],"tyreSmokeColor":[255,255,255],"modTrimA":-1,"modRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngineBlock":-1,"modSpoilers":-1,"modSmokeEnabled":false,"bodyHealth":1000.0592475178704,"plate":"47FKH122","wheelWidth":1.0,"modKit17":-1,"wheelSize":1.0,"modCustomTiresF":false,"modArmor":-1,"modStruts":-1,"modCustomTiresR":false,"modKit49":-1,"modLivery":-1,"modVanityPlate":-1,"tankHealth":1000.0592475178704,"modFender":-1,"modRearBumper":-1,"modWindows":-1,"modExhaust":-1,"modOrnaments":-1,"fuelLevel":50.04267878762973,"modHorns":-1,"modHydrolic":-1,"color2":0}', '47FKH122', NULL, 'spanishavegaraj', 40, 1000, 1000, 1, 0, 552600, NULL, NULL, NULL, NULL),
	(48, 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'XRK76375', 'nightblade', '-1606187161', 'null', 'WEXPZXTI', '', '', 100, 1000, 1000, 1, 0, 98, '', NULL, NULL, NULL),
	(49, 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'XRK76375', 'double', '-1670998136', 'null', 'PBVJSOXI', '', '', 100, 1000, 1000, 1, 0, 6052, '', NULL, NULL, NULL),
	(50, 'license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6', 'XRK76375', 'broadway', '-1933242328', '{"wheelWidth":1.0,"modSpeakers":-1,"wheelColor":0,"neonColor":[255,1,1],"modEngineBlock":-1,"modExhaust":0,"pearlescentColor":88,"engineHealth":1000.0592475178704,"oilLevel":4.76596940834568,"modHydrolic":-1,"modBackWheels":-1,"modHorns":2,"modHood":5,"modArmor":4,"modSpoilers":-1,"tankHealth":1000.0592475178704,"modFender":2,"modAirFilter":-1,"modKit19":-1,"model":-1933242328,"modKit21":-1,"modBrakes":2,"modDial":-1,"modSideSkirt":4,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"dirtLevel":0.0,"color1":27,"modDoorSpeaker":-1,"bodyHealth":1000.0592475178704,"modTrimB":-1,"wheels":1,"modRearBumper":4,"liveryRoof":-1,"modKit49":-1,"plate":"44UIW143","headlightColor":8,"modFrontWheels":-1,"modCustomTiresR":false,"modPlateHolder":-1,"wheelSize":1.0,"modGrille":-1,"modKit17":-1,"modSteeringWheel":-1,"modLivery":2,"modStruts":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modEngine":3,"extras":{"1":true,"2":true},"tyreSmokeColor":[255,255,255],"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"windowTint":1,"modSmokeEnabled":false,"xenonColor":8,"modFrontBumper":5,"modTurbo":1,"modOrnaments":-1,"modRightFender":1,"modAPlate":-1,"modCustomTiresF":false,"interiorColor":13,"fuelLevel":50.04267878762973,"modShifterLeavers":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":true,"0":true},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modVanityPlate":-1,"modKit47":-1,"plateIndex":1,"modTransmission":2,"modAerials":-1,"neonEnabled":[1,1,1,1],"modTank":-1,"color2":111,"modTrunk":-1,"modArchCover":-1,"modRoof":1,"modSuspension":3,"modFrame":2,"modWindows":-1,"modTrimA":-1,"modXenon":false,"dashboardColor":111,"modSeats":-1}', '44UIW143', NULL, 'Out', 100, 1000, 1000, 1, 0, 61232, NULL, NULL, NULL, NULL),
	(51, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'npolchal', '-912082138', '{"modLivery":2,"modExhaust":-1,"modTrimB":-1,"modSteeringWheel":-1,"dirtLevel":4.76596940834568,"windowTint":1,"modPlateHolder":-1,"modEngine":4,"modCustomTiresR":false,"dashboardColor":11,"pearlescentColor":66,"modKit47":-1,"extras":{"6":true,"5":true,"4":true,"3":false,"2":false,"1":true},"modSuspension":2,"modSpoilers":0,"doorStatus":{"1":true,"2":false,"3":false,"4":true,"5":false,"0":false},"modSpeakers":-1,"modGrille":0,"modRoof":0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":1,"0":false},"modArchCover":-1,"modHorns":-1,"headlightColor":255,"liveryRoof":-1,"engineHealth":902.3568746467837,"modEngineBlock":-1,"modSmokeEnabled":1,"plateIndex":1,"modDoorSpeaker":-1,"modBrakes":2,"modArmor":-1,"plate":"PD  9049","interiorColor":111,"modTank":-1,"color2":141,"model":1949729657,"modKit19":-1,"tankHealth":3947.8113265796789,"modAirFilter":-1,"modOrnaments":0,"modFender":-1,"modSeats":-1,"modTransmission":3,"modFrontWheels":10,"modDial":0,"wheels":0,"modXenon":false,"oilLevel":4.76596940834568,"modFrontBumper":-1,"modBackWheels":-1,"modAPlate":-1,"modStruts":-1,"color1":141,"modRightFender":-1,"modAerials":-1,"wheelWidth":0.64347940683364,"modTurbo":1,"windowStatus":{"1":false,"2":false,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false},"xenonColor":255,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":1,"0":false},"modTrunk":1,"modSideSkirt":-1,"neonColor":[255,0,255],"neonEnabled":[false,false,false,false],"bodyHealth":269.2772715715314,"fuelLevel":50.04267878762973,"modTrimA":-1,"tyreSmokeColor":[1,1,1],"modHydrolic":-1,"modShifterLeavers":-1,"modKit17":-1,"modDashboard":0,"modKit21":-1,"modVanityPlate":-1,"modWindows":-1,"modKit49":-1,"modRearBumper":-1,"modHood":-1,"wheelColor":0,"modFrame":1,"modCustomTiresF":false,"tireHealth":{"1":998.75,"2":999.75,"3":943.334716796875,"0":1000.0},"wheelSize":0.71115499734878}', 'PD  9049', NULL, 'pdmgarage', 85, 903, 269, 0, 0, 11252, NULL, NULL, NULL, NULL),
	(52, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'dubsta3', '-1237253773', '{"modKit17":-1,"modPlateHolder":-1,"windowTint":1,"color1":0,"modXenon":false,"modFrontBumper":4,"dashboardColor":11,"fuelLevel":50.04267878762973,"color2":147,"modArmor":-1,"modKit49":-1,"modAerials":-1,"wheels":0,"neonColor":[2,21,255],"modWindows":-1,"modBackWheels":-1,"modAirFilter":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":1,"interiorColor":0,"modBrakes":2,"tankHealth":4000.2369900714818,"modOrnaments":-1,"model":-1237253773,"modGrille":1,"headlightColor":0,"plate":"JCZMCUEL","modCustomTiresR":false,"modSideSkirt":-1,"wheelSize":0.93999999761581,"modSuspension":2,"modArchCover":-1,"modTank":-1,"neonEnabled":[1,1,false,1],"modEngineBlock":-1,"engineHealth":1000.0592475178704,"modHood":0,"modTurbo":1,"modVanityPlate":-1,"extras":[],"modExhaust":-1,"oilLevel":7.94328234724281,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modTrunk":-1,"wheelWidth":0.84855896234512,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"modEngine":3,"modHorns":2,"modSteeringWheel":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modDial":-1,"modStruts":-1,"modRearBumper":0,"modSmokeEnabled":false,"modDoorSpeaker":-1,"modSpeakers":-1,"pearlescentColor":118,"modAPlate":-1,"dirtLevel":0.0,"modHydrolic":-1,"xenonColor":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tyreSmokeColor":[255,255,255],"modLivery":-1,"liveryRoof":-1,"modFrontWheels":9,"wheelColor":1,"modFender":-1,"modKit19":-1,"modCustomTiresF":false,"bodyHealth":1000.0592475178704,"modTransmission":2,"modSeats":-1,"modRightFender":-1,"modRoof":3,"modKit21":-1,"modKit47":-1,"modTrimA":-1,"modFrame":-1,"modShifterLeavers":-1,"modTrimB":-1,"modSpoilers":-1}', 'JCZMCUEL', '', 'pdmgarage', 11, 1000, 1000, 1, 0, 3550, '', NULL, NULL, NULL),
	(53, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'thrax', '1044193113', '{"modKit47":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modHorns":-1,"modAirFilter":-1,"wheels":7,"plateIndex":0,"modEngine":-1,"headlightColor":255,"tankHealth":1000.0592475178704,"modBackWheels":-1,"windowTint":-1,"liveryRoof":-1,"modAerials":-1,"wheelWidth":1.0,"modSpeakers":-1,"plate":"43GLP495","modXenon":false,"modArchCover":-1,"modSteeringWheel":-1,"modHood":-1,"modKit19":-1,"color2":143,"modFender":-1,"xenonColor":255,"modSideSkirt":-1,"wheelSize":1.0,"modPlateHolder":-1,"modKit17":-1,"modDial":-1,"dashboardColor":65,"modSuspension":-1,"modGrille":-1,"modTrunk":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimB":-1,"modDoorSpeaker":-1,"neonColor":[255,0,255],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"oilLevel":4.76596940834568,"modArmor":-1,"modStruts":-1,"fuelLevel":50.04267878762973,"modFrontWheels":-1,"modTurbo":false,"modDashboard":-1,"modHydrolic":-1,"modTrimA":-1,"modTransmission":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"color1":16,"tyreSmokeColor":[255,255,255],"modRoof":-1,"modBrakes":-1,"modCustomTiresF":false,"modSmokeEnabled":false,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"engineHealth":1000.0592475178704,"modTank":-1,"modRightFender":-1,"modCustomTiresR":false,"modKit49":-1,"modSeats":-1,"extras":[],"modAPlate":-1,"modOrnaments":-1,"modFrontBumper":-1,"modWindows":-1,"pearlescentColor":144,"modFrame":-1,"modSpoilers":-1,"bodyHealth":1000.0592475178704,"wheelColor":21,"modEngineBlock":-1,"modVanityPlate":-1,"modLivery":-1,"model":1044193113,"modExhaust":-1,"neonEnabled":[false,false,false,false],"modKit21":-1,"modRearBumper":-1,"dirtLevel":0.0,"interiorColor":22}', '43GLP495', NULL, 'northrockfordgaraj', 100, 1000, 1000, 1, 0, 0, NULL, NULL, NULL, NULL),
	(54, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'ignus', '-1444114309', '{"modKit47":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modHorns":-1,"modAirFilter":-1,"wheels":7,"plateIndex":0,"pearlescentColor":94,"headlightColor":255,"tankHealth":994.4989498748004,"modBackWheels":-1,"windowTint":-1,"liveryRoof":-1,"modAerials":-1,"wheelWidth":1.0,"modSpeakers":-1,"plate":"45MZC261","modXenon":false,"modArchCover":-1,"modSteeringWheel":-1,"modHood":-1,"modKit19":-1,"color2":88,"modFender":-1,"xenonColor":255,"modAPlate":-1,"wheelSize":1.0,"modPlateHolder":-1,"modKit17":-1,"modVanityPlate":-1,"dashboardColor":156,"modSuspension":-1,"modGrille":-1,"modTrunk":-1,"dirtLevel":0.79432823472428,"neonColor":[255,0,255],"modDoorSpeaker":-1,"modRearBumper":-1,"tireHealth":{"1":995.0995483398438,"2":1000.0,"3":999.4765014648438,"0":998.0607299804688},"engineHealth":999.2649192831461,"modArmor":-1,"modStruts":-1,"fuelLevel":50.04267878762973,"modCustomTiresR":false,"neonEnabled":[false,false,false,false],"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modTrimA":-1,"modSideSkirt":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSmokeEnabled":false,"modFrontWheels":-1,"tyreSmokeColor":[255,255,255],"modRoof":-1,"modCustomTiresF":false,"modFrame":-1,"modBrakes":-1,"oilLevel":4.76596940834568,"modKit21":-1,"modTank":-1,"modExhaust":-1,"modEngine":-1,"modDashboard":-1,"modTransmission":-1,"extras":[],"modFrontBumper":-1,"modOrnaments":-1,"modKit49":-1,"modWindows":-1,"color1":59,"modTrimB":-1,"modSpoilers":-1,"modRightFender":-1,"modSeats":-1,"modEngineBlock":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":-1,"model":-1444114309,"modHydrolic":-1,"bodyHealth":961.1371640163806,"wheelColor":158,"modTurbo":false,"modDial":-1,"interiorColor":17}', '45MZC261', NULL, 'pdgarage2', 90, 1000, 962, 1, 0, 14317, NULL, NULL, NULL, NULL),
	(55, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'npolchal', '1824095463', '{"modXenon":false,"modTrimA":-1,"modKit49":-1,"modTrimB":-1,"modTank":-1,"wheelWidth":1.0,"model":1949729657,"modTurbo":1,"modKit17":-1,"modCustomTiresF":false,"engineHealth":1000.0592475178704,"modEngine":4,"modFrontWheels":-1,"modHorns":-1,"liveryRoof":-1,"modTransmission":3,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modExhaust":-1,"modLivery":-1,"wheels":7,"xenonColor":255,"windowTint":-1,"plate":"PD  4914","modDashboard":0,"modSpoilers":-1,"modDoorSpeaker":-1,"modRoof":-1,"tyreSmokeColor":[255,255,255],"modGrille":-1,"color1":141,"modArmor":-1,"modCustomTiresR":false,"modKit47":-1,"modHydrolic":-1,"modSmokeEnabled":false,"modOrnaments":-1,"modEngineBlock":-1,"modArchCover":-1,"modVanityPlate":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"pearlescentColor":66,"tankHealth":1000.0592475178704,"modKit21":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBrakes":2,"wheelColor":0,"extras":{"5":false,"6":false,"1":false,"2":false,"3":false,"4":true},"interiorColor":111,"modSeats":-1,"dashboardColor":111,"fuelLevel":50.04267878762973,"modKit19":-1,"color2":141,"modAPlate":-1,"headlightColor":255,"neonEnabled":[false,false,false,false],"modBackWheels":-1,"modPlateHolder":-1,"modFender":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSpeakers":-1,"modAerials":-1,"modStruts":-1,"bodyHealth":1000.0592475178704,"modDial":-1,"plateIndex":1,"oilLevel":4.76596940834568,"modWindows":-1,"modSuspension":2,"neonColor":[255,0,255],"modTrunk":-1,"modAirFilter":-1,"modHood":-1,"wheelSize":1.0,"modFrame":-1,"dirtLevel":0.0,"modShifterLeavers":-1,"modSideSkirt":-1,"modRightFender":-1}', 'PD  4914', NULL, NULL, 100, 1000, 1000, 0, 0, 20675, NULL, NULL, NULL, NULL),
	(56, 'license:987ed547c73270ca6274c4ee61400b5dbcc85e4c', 'DXH34648', 'ardent', '159274291', '{"modKit47":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modHorns":-1,"modAirFilter":-1,"modCustomTiresR":false,"plateIndex":0,"pearlescentColor":87,"headlightColor":255,"tankHealth":1000.0592475178704,"modBackWheels":-1,"windowTint":-1,"liveryRoof":-1,"engineHealth":1000.0592475178704,"wheelWidth":0.0,"modKit21":-1,"plate":"CIDKHEOH","modXenon":false,"modArchCover":-1,"modSteeringWheel":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modKit19":-1,"color2":0,"modFender":-1,"xenonColor":255,"modSideSkirt":-1,"wheelSize":0.0,"modPlateHolder":-1,"modKit17":-1,"modVanityPlate":-1,"dashboardColor":93,"modSuspension":-1,"modGrille":-1,"modTrunk":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonColor":[0,0,0],"color1":88,"modCustomTiresF":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"wheels":1,"modArmor":-1,"modStruts":-1,"fuelLevel":50.04267878762973,"modDashboard":-1,"modDoorSpeaker":-1,"neonEnabled":[false,false,false,false],"modFrontWheels":-1,"modFrame":-1,"oilLevel":6.35462587779425,"modTrimB":-1,"modTank":-1,"tyreSmokeColor":[255,255,255],"modRoof":-1,"modSeats":-1,"modTrimA":-1,"modBrakes":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRightFender":-1,"modKit49":-1,"modRearBumper":-1,"modHydrolic":-1,"bodyHealth":1000.0592475178704,"modTransmission":-1,"extras":[],"modSmokeEnabled":false,"modOrnaments":-1,"modSpeakers":-1,"modWindows":-1,"modAPlate":-1,"interiorColor":93,"modSpoilers":-1,"modHood":-1,"modFrontBumper":-1,"modEngineBlock":-1,"modDial":-1,"modLivery":-1,"model":159274291,"modExhaust":-1,"modAerials":-1,"modTurbo":false,"dirtLevel":6.35462587779425,"modEngine":-1,"wheelColor":112}', 'CIDKHEOH', '', 'pdmgarage', 53, 1000, 1000, 1, 0, 2779, '', NULL, NULL, NULL),
	(57, 'license:21f668b3835e9bcd1f243a28d0ee5358330f41f6', 'HGO75866', 'npolchal', '1496122471', '{"modXenon":false,"modTrimA":-1,"modKit49":-1,"modTrimB":-1,"modTank":-1,"wheelWidth":0.64347940683364,"model":1949729657,"modTurbo":1,"modKit17":-1,"modCustomTiresF":1,"engineHealth":1000.0592475178704,"modEngine":4,"modFrontWheels":3,"modHorns":-1,"liveryRoof":-1,"modTransmission":3,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modExhaust":-1,"modLivery":2,"wheels":0,"xenonColor":255,"windowTint":1,"plate":"PD  8393","modDashboard":0,"modSpoilers":0,"modDoorSpeaker":-1,"modRoof":0,"tyreSmokeColor":[0,150,255],"modGrille":0,"color1":147,"modArmor":-1,"modCustomTiresR":false,"modKit47":-1,"modHydrolic":-1,"modSmokeEnabled":1,"modOrnaments":0,"modEngineBlock":-1,"modArchCover":-1,"modVanityPlate":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"pearlescentColor":8,"tankHealth":1000.0592475178704,"modKit21":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBrakes":2,"wheelColor":0,"extras":{"5":true,"6":false,"1":true,"2":false,"3":false,"4":false},"interiorColor":111,"modSeats":-1,"dashboardColor":111,"fuelLevel":50.04267878762973,"modKit19":-1,"color2":0,"modAPlate":-1,"headlightColor":255,"neonEnabled":[1,1,1,1],"modBackWheels":-1,"modPlateHolder":-1,"modFender":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSpeakers":-1,"modAerials":-1,"modStruts":-1,"bodyHealth":1000.0592475178704,"modDial":0,"plateIndex":1,"oilLevel":4.76596940834568,"modWindows":-1,"modSuspension":2,"neonColor":[3,83,255],"modTrunk":-1,"modAirFilter":-1,"modHood":-1,"wheelSize":0.71115499734878,"modFrame":1,"dirtLevel":0.0,"modShifterLeavers":-1,"modSideSkirt":-1,"modRightFender":-1}', 'PD  8393', NULL, NULL, 100, 1000, 1000, 0, 0, 5115, NULL, NULL, NULL, NULL),
	(58, 'license:987ed547c73270ca6274c4ee61400b5dbcc85e4c', 'DXH34648', 'npolchal', '631388782', '{"modXenon":1,"modTrimA":-1,"modKit49":-1,"modTrimB":-1,"modTank":-1,"wheelWidth":0.64347940683364,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modTurbo":1,"modKit17":-1,"modCustomTiresF":false,"engineHealth":1000.0592475178704,"modEngine":4,"modFrontWheels":24,"modHorns":-1,"liveryRoof":-1,"modTransmission":3,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modStruts":-1,"modAirFilter":-1,"wheels":0,"xenonColor":2,"windowTint":1,"plate":"PD  1399","modTrunk":2,"modSpoilers":0,"modDoorSpeaker":-1,"modRoof":0,"tyreSmokeColor":[0,150,255],"modPlateHolder":-1,"color1":11,"modArmor":-1,"modCustomTiresR":false,"modKit47":-1,"fuelLevel":50.04267878762973,"modSmokeEnabled":1,"modOrnaments":0,"modEngineBlock":-1,"modArchCover":-1,"modVanityPlate":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"pearlescentColor":66,"tankHealth":4000.2369900714818,"modKit21":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBrakes":2,"wheelColor":0,"extras":{"5":true,"6":true,"1":true,"2":true,"3":true,"4":true},"interiorColor":111,"modSeats":-1,"color2":11,"modSpeakers":-1,"bodyHealth":1000.0592475178704,"modWindows":-1,"modAPlate":-1,"modGrille":0,"neonEnabled":[1,1,1,1],"modBackWheels":-1,"wheelSize":0.71115499734878,"modFender":1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSuspension":3,"dashboardColor":111,"headlightColor":2,"modAerials":-1,"modRightFender":8,"modDial":0,"modLivery":2,"plateIndex":3,"modHydrolic":-1,"modKit19":-1,"model":1949729657,"modDashboard":0,"neonColor":[3,83,255],"modExhaust":-1,"modHood":-1,"modShifterLeavers":-1,"modFrame":0,"dirtLevel":0.0,"oilLevel":4.76596940834568,"modSideSkirt":-1,"modRearBumper":-1}', 'PD  1399', NULL, NULL, 100, 1000, 1000, 1, 0, 9020, NULL, NULL, NULL, NULL),
	(59, 'license:759f35b0a5e54b71040546417277a6471bac20df', 'CDR37384', 'npolchal', '2016698056', '{}', 'PD  7148', NULL, NULL, 100, 1000, 1000, 0, 0, 437, NULL, NULL, NULL, NULL);

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
DELETE FROM `player_warns`;

-- tablo yapısı dökülüyor elused.qb_banking_societies
CREATE TABLE IF NOT EXISTS `qb_banking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.qb_banking_societies: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `qb_banking_societies`;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.qb_banking_transactions: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `qb_banking_transactions`;
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
	(20, 'QUZ31879', 'Sully Cliff', 'bank', 'Banka Hesabı', '2023-12-31 19:43:04', 80000, 'withdraw'),
	(21, 'bank', 'Bank (PIN)', 'XBQ11226', 'Vidarr Odinson', '2024-01-23 23:27:39', 0, 'transfer'),
	(22, 'XBQ11226', 'Vidarr Odinson', 'bank', 'Banka Hesabı', '2024-01-25 11:44:32', 84346, 'withdraw');

-- tablo yapısı dökülüyor elused.qb_fishing
CREATE TABLE IF NOT EXISTS `qb_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.qb_fishing: ~7 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `qb_fishing`;
INSERT INTO `qb_fishing` (`citizenid`, `currentXP`, `tasks`, `time`) VALUES
	('XYP48353', 0, '[{"requiredCount":40,"hasCount":0,"fishName":"smallbluefish","taken":false},{"requiredCount":30,"hasCount":0,"fishName":"bluefish","taken":false},{"requiredCount":20,"hasCount":0,"fishName":"bonitosfish","taken":false},{"requiredCount":15,"hasCount":0,"fishName":"garfish","taken":false},{"requiredCount":10,"hasCount":0,"fishName":"perch","taken":false},{"requiredCount":20,"hasCount":0,"fishName":"sharkfish","taken":false}]', NULL),
	('BMS02698', 11, '[{"requiredCount":40,"taken":false,"fishName":"smallbluefish","hasCount":0},{"requiredCount":30,"taken":false,"fishName":"bluefish","hasCount":0},{"requiredCount":20,"taken":false,"fishName":"bonitosfish","hasCount":0},{"requiredCount":15,"taken":false,"fishName":"garfish","hasCount":0},{"requiredCount":10,"taken":false,"fishName":"perch","hasCount":0},{"requiredCount":20,"taken":false,"fishName":"sharkfish","hasCount":0}]', NULL),
	('UQL52088', 12, '[{"fishName":"smallbluefish","hasCount":0,"requiredCount":40,"taken":false},{"fishName":"bluefish","hasCount":0,"requiredCount":30,"taken":false},{"fishName":"bonitosfish","hasCount":0,"requiredCount":20,"taken":false},{"fishName":"garfish","hasCount":0,"requiredCount":15,"taken":false},{"fishName":"perch","hasCount":0,"requiredCount":10,"taken":false},{"fishName":"sharkfish","hasCount":0,"requiredCount":20,"taken":false}]', NULL),
	('DXH34648', 0, '[{"taken":false,"fishName":"smallbluefish","requiredCount":40,"hasCount":0},{"taken":false,"fishName":"bluefish","requiredCount":30,"hasCount":0},{"taken":false,"fishName":"bonitosfish","requiredCount":20,"hasCount":0},{"taken":false,"fishName":"garfish","requiredCount":15,"hasCount":0},{"taken":false,"fishName":"perch","requiredCount":10,"hasCount":0},{"taken":false,"fishName":"sharkfish","requiredCount":20,"hasCount":0}]', NULL),
	('PAE72962', 0, '[{"taken":false,"fishName":"smallbluefish","requiredCount":40,"hasCount":0},{"taken":false,"fishName":"bluefish","requiredCount":30,"hasCount":0},{"taken":false,"fishName":"bonitosfish","requiredCount":20,"hasCount":0},{"taken":false,"fishName":"garfish","requiredCount":15,"hasCount":0},{"taken":false,"fishName":"perch","requiredCount":10,"hasCount":0},{"taken":false,"fishName":"sharkfish","requiredCount":20,"hasCount":0}]', NULL),
	('WZB65598', 64, '[{"hasCount":0,"fishName":"smallbluefish","requiredCount":40,"taken":false},{"hasCount":0,"fishName":"bluefish","requiredCount":30,"taken":false},{"hasCount":0,"fishName":"bonitosfish","requiredCount":20,"taken":false},{"hasCount":0,"fishName":"garfish","requiredCount":15,"taken":false},{"hasCount":0,"fishName":"perch","requiredCount":10,"taken":false},{"hasCount":0,"fishName":"sharkfish","requiredCount":20,"taken":false}]', NULL),
	('XRK76375', 98, '[{"requiredCount":40,"hasCount":0,"taken":false,"fishName":"smallbluefish"},{"requiredCount":30,"hasCount":0,"taken":false,"fishName":"bluefish"},{"requiredCount":20,"hasCount":0,"taken":false,"fishName":"bonitosfish"},{"requiredCount":15,"hasCount":0,"taken":false,"fishName":"garfish"},{"requiredCount":10,"hasCount":0,"taken":false,"fishName":"perch"},{"requiredCount":20,"hasCount":0,"taken":false,"fishName":"sharkfish"}]', NULL);

-- tablo yapısı dökülüyor elused.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.stashitems: ~42 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `stashitems`;
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(109, 'BMS02698', '[]'),
	(173, 'boss_mechanic5', '[]'),
	(125, 'CDR37384', '[{"info":{"quality":100,"serie":"67oAl3rv791EfJL"},"slot":1,"image":"weapon_militaryrifle.png","label":"Military Rifle","unique":true,"weight":1000,"name":"weapon_militaryrifle","useable":true,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"00DeT4qL166RTrp"},"slot":2,"image":"weapon_hk416.png","label":"HK-416","unique":true,"weight":13000,"name":"weapon_hk416","useable":false,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"27IUK6XO836LTFV"},"slot":3,"image":"weapon_militaryrifle.png","label":"Military Rifle","unique":true,"weight":1000,"name":"weapon_militaryrifle","useable":true,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"27kpD1wQ811OrHz"},"slot":4,"image":"weapon_assaultrifle_mk2.png","label":"Assault Rifle Mk II","unique":true,"weight":1000,"name":"weapon_assaultrifle_mk2","useable":true,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"51YTq8sy665XpFD"},"slot":5,"image":"weapon_mg.png","label":"Machinegun","unique":true,"weight":1000,"name":"weapon_mg","useable":false,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"38Djj4Oi408wuVl"},"slot":6,"image":"weapon_hatchet.png","label":"Balta","unique":true,"weight":1000,"name":"weapon_hatchet","useable":false,"amount":1,"type":"weapon"},{"info":{"quality":100,"serie":"55Jmf9nh351qrac"},"slot":7,"image":"weapon_knife.png","label":"Bıçak","unique":true,"weight":1000,"name":"weapon_knife","useable":false,"amount":1,"type":"weapon"}]'),
	(104, 'Fridge', '[]'),
	(95, 'FWH76480', '[]'),
	(61, 'Glovebox-09DCE077', '[]'),
	(183, 'Gunner_Depo_1', '[]'),
	(70, 'PD 8325', '[]'),
	(174, 'Pizza_Tezgah_1', '[]'),
	(121, 'Police_BMS02698', '[]'),
	(156, 'Police_HGO75866', '[]'),
	(64, 'Police_QUZ31879', '[{"slot":1,"info":{"plate":"PD  8325","model":" PD Cruiser","lock":4322},"type":"item","amount":1,"label":"Araç Anahtarı","weight":0,"name":"vehiclekey","image":"carkey.png","useable":true,"unique":true}]'),
	(94, 'Police_XYP48353', '[{"slot":1,"info":{"serie":"08Smf5Og877lqHo","ammo":0,"quality":99.85},"type":"weapon","amount":1,"label":"Marksman Rifle","weight":1000,"name":"weapon_marksmanrifle","image":"weapon_marksmanrifle.png","useable":false,"unique":true},null,null,null,null,null,{"slot":7,"info":{"serie":"49FgD6yw673fYpg","quality":100},"type":"weapon","amount":1,"label":"Marksman Rifle","weight":1000,"name":"weapon_marksmanrifle","image":"weapon_marksmanrifle.png","useable":false,"unique":true}]'),
	(73, 'Polic_QUZ31879', '[]'),
	(65, 'Stash-Police_QUZ31879', '[]'),
	(77, 'stash_6NINE ST_VMO47587', '[]'),
	(166, 'stash_BLANCOS_CDR37384', '[{"type":"weapon","name":"weapon_beanbagshotgun","amount":1,"unique":true,"weight":1000,"info":{"quality":100.0,"ammo":49,"serie":"04VRf2QJ672bEyJ"},"slot":1,"image":"weapon_beanbeng.png","label":"PD BEANBAG","useable":false},{"type":"weapon","name":"weapon_beanbagshotgun","amount":1,"unique":true,"weight":1000,"info":{"quality":100.0,"ammo":65,"serie":"50PKX8Zz506TgCG"},"slot":2,"image":"weapon_beanbeng.png","label":"PD BEANBAG","useable":false},{"type":"item","name":"markedbills","amount":15948,"unique":true,"weight":0,"info":[],"slot":3,"image":"markedbills.png","label":"Kara Para","useable":false},{"type":"item","name":"pistol_ammo","amount":45,"unique":false,"weight":200,"info":[],"slot":4,"image":"pistol_ammo.png","label":"Tabanca Mermisi","useable":true},{"type":"weapon","name":"weapon_dagger","amount":1,"unique":true,"weight":1000,"info":{"quality":100,"ammo":0,"serie":"68LZq5fF492cXYX"},"slot":5,"image":"weapon_dagger.png","label":"Hançer","useable":false},{"type":"weapon","name":"weapon_machete","amount":1,"unique":true,"weight":1000,"info":{"quality":100,"ammo":0,"serie":"52xBv4Gz507fzPJ"},"slot":6,"image":"weapon_machete.png","label":"Pala","useable":false},{"type":"weapon","name":"weapon_machete","amount":1,"unique":true,"weight":1000,"info":{"quality":99.85000000000002,"ammo":0,"serie":"27Sdu2iz697Jmfr"},"slot":7,"image":"weapon_machete.png","label":"Pala","useable":false},{"type":"item","name":"goldbar","amount":4,"unique":false,"weight":7000,"info":[],"slot":8,"image":"goldbar.png","label":"Altın Külçe","useable":false},{"type":"weapon","name":"weapon_assaultrifle_mk2","amount":1,"unique":true,"weight":1000,"info":{"quality":100,"ammo":0,"serie":"05TBW5hl447fdhV"},"slot":9,"image":"weapon_assaultrifle_mk2.png","label":"Assault Rifle Mk II","useable":true},{"type":"item","name":"stickynote","amount":1,"unique":true,"weight":0,"info":{"label":"Kasa Şifresi: 5593"},"slot":10,"image":"stickynote.png","label":"Yapışkan Not","useable":false},{"type":"item","name":"smg_ammo","amount":50,"unique":false,"weight":500,"info":[],"slot":11,"image":"smg_ammo.png","label":"SMG Mermisi","useable":true},{"type":"weapon","name":"weapon_stungun","amount":1,"unique":true,"weight":1000,"info":{"quality":100,"ammo":-1,"serie":"00EDw9Db014YNaq"},"slot":12,"image":"weapon_stungun.png","label":"Taser","useable":false},{"type":"weapon","name":"weapon_machete","amount":1,"unique":true,"weight":1000,"info":{"quality":100,"ammo":0,"serie":"99fhi7Tm448IHaO"},"slot":13,"image":"weapon_machete.png","label":"Pala","useable":false}]'),
	(114, 'stash_BLANCOS_XBQ11226', '[]'),
	(165, 'stash_BLANCOS_XRK76375', '[]'),
	(178, 'stash_BOLYHOOD_RNG21283', '[]'),
	(124, 'stash_BOLYHOOD_SRK03290', '[]'),
	(99, 'stash_CONTA_XRK76375', '[]'),
	(122, 'stash_Favela Blackmarket_XRK76375', '[]'),
	(96, 'State_QUZ31879', '[]'),
	(163, 'Trash_109314', '[]'),
	(162, 'Trash_110082', '[]'),
	(108, 'Trash_141826', '[]'),
	(115, 'Trash_1457666', '[]'),
	(116, 'Trash_1558274', '[]'),
	(111, 'Trash_1991682', '[]'),
	(112, 'Trash_2254082', '[]'),
	(113, 'Trash_28', '[]'),
	(98, 'Trash_331266', '[]'),
	(170, 'Trash_5199630', '[]'),
	(118, 'Trash_60674', '[]'),
	(106, 'Trash_635138', '[]'),
	(97, 'Trash_71682', '[]'),
	(119, 'Trash_87298', '[]'),
	(103, 'Tray1', '[{"info":[],"slot":1,"image":"tomato.png","label":"Domates","unique":false,"weight":350,"name":"tomato","useable":false,"amount":10,"type":"item"},{"info":[],"slot":2,"image":"coffee_beans.png","label":"Kahve Fasulyesi","unique":false,"weight":350,"name":"coffee_beans","useable":false,"amount":10,"type":"item"},{"info":[],"slot":3,"image":"potato.png","label":"Patates","unique":false,"weight":350,"name":"potato","useable":false,"amount":10,"type":"item"}]'),
	(107, 'Tray2', '[]'),
	(181, 'UwUCafe_Tezgah', '[]'),
	(180, 'UwUCafe_Tezgah2', '[]'),
	(182, 'UwUCafe_Tezgah3', '[]'),
	(101, 'XRK76375', '[]');

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
DELETE FROM `transaction_history`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.trunkitems: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `trunkitems`;
INSERT INTO `trunkitems` (`id`, `plate`, `items`) VALUES
	(2, '61PTI046', '[]'),
	(4, 'FBWWAAOE', '[]'),
	(1, 'QBDT3074', '[]');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
