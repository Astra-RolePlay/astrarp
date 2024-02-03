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

-- elused.adminmenu: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `adminmenu`;

-- tablo yapısı dökülüyor elused.ak4y_fishing
CREATE TABLE IF NOT EXISTS `ak4y_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.ak4y_fishing: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `ak4y_fishing`;

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

-- elused.bank_statements: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `bank_statements`;

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

-- elused.codem-hud-data: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `codem-hud-data`;

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

-- elused.crypto: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
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

-- tablo yapısı dökülüyor elused.gacha_playlists
CREATE TABLE IF NOT EXISTS `gacha_playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `owner` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.gacha_playlists: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_playlists`;

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

-- elused.gacha_playlists_users: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_playlists_users`;

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

-- elused.gacha_playlist_songs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_playlist_songs`;

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

-- elused.gacha_songs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gacha_songs`;

-- tablo yapısı dökülüyor elused.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.gloveboxitems: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `gloveboxitems`;

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

-- elused.houselocations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `houselocations`;

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

-- elused.management_funds: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `management_funds`;

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

-- elused.mdt_config: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `mdt_config`;

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

-- elused.npwd_calls: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_calls`;

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

-- elused.npwd_darkchat_channels: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_darkchat_channels`;

-- tablo yapısı dökülüyor elused.npwd_darkchat_channel_members
CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_darkchat_channel_members: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_darkchat_channel_members`;

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

-- elused.npwd_darkchat_messages: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_darkchat_messages`;

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

-- elused.npwd_match_profiles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_match_profiles`;

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

-- elused.npwd_match_views: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_match_views`;

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

-- elused.npwd_messages: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_messages`;

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

-- elused.npwd_messages_conversations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_messages_conversations`;

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

-- elused.npwd_messages_participants: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_messages_participants`;

-- tablo yapısı dökülüyor elused.npwd_notes
CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.npwd_notes: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_notes`;

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

-- elused.npwd_phone_gallery: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_phone_gallery`;

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

-- elused.npwd_twitter_likes: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_twitter_likes`;

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

-- elused.npwd_twitter_profiles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_twitter_profiles`;

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

-- elused.npwd_twitter_tweets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npwd_twitter_tweets`;

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

-- elused.pefcl_accounts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_accounts`;

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

-- elused.pefcl_shared_accounts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_shared_accounts`;

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

-- elused.pefcl_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `pefcl_transactions`;

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

-- elused.phone_invoices: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_invoices`;

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

-- elused.players: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `players`;

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

-- elused.playerskins: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `playerskins`;

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

-- elused.player_houses: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_houses`;

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

-- elused.player_mails: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_mails`;

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

-- elused.player_outfits: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_outfits`;

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

-- elused.player_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_vehicles`;

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

-- elused.qb_banking_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `qb_banking_transactions`;

-- tablo yapısı dökülüyor elused.qb_fishing
CREATE TABLE IF NOT EXISTS `qb_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- elused.qb_fishing: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `qb_fishing`;

-- tablo yapısı dökülüyor elused.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.stashitems: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `stashitems`;

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

-- elused.transaction_history: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `transaction_history`;

-- tablo yapısı dökülüyor elused.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- elused.trunkitems: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `trunkitems`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
