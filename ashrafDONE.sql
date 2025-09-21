-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ashrafbase
CREATE DATABASE IF NOT EXISTS `ashrafbase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ashrafbase`;

-- Dumping structure for table ashrafbase.bill_items
CREATE TABLE IF NOT EXISTS `bill_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `qty` int DEFAULT '1',
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ashrafbase.bill_items: ~0 rows (approximately)

-- Dumping structure for table ashrafbase.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ashrafbase.categories: ~1 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `description`) VALUES
	(10, 'clothes', 'ashraf slik center\r\n');

-- Dumping structure for table ashrafbase.general_log
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='General log';

-- Dumping data for table ashrafbase.general_log: 2 rows
/*!40000 ALTER TABLE `general_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_log` ENABLE KEYS */;

-- Dumping structure for table ashrafbase.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(50) NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` float NOT NULL,
  `order_number` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ashrafbase.orders: ~12 rows (approximately)
INSERT INTO `orders` (`id`, `ref_no`, `total_amount`, `amount_tendered`, `order_number`, `date_created`) VALUES
	(7, '545153905246', 3000, 5000, 1, '2025-09-20 19:14:11'),
	(8, '581168485600', 11200, 12000, 269390, '2025-09-20 21:09:17'),
	(9, '297002695724', 2520, 3000, 647983, '2025-09-20 22:41:57'),
	(10, '099788230428', 37600, 6.9901e24, 160140, '2025-09-20 22:46:21'),
	(11, '788816521605', 6400, 20000, 109668, '2025-09-20 22:51:06'),
	(12, '950458871291', 7800, 17000, 966659, '2025-09-20 22:53:06'),
	(13, '228987317893', 600, 600, 753090, '2025-09-20 22:56:26'),
	(14, '480201316145', 2200, 21112, 708311, '2025-09-20 22:57:14'),
	(15, '718537658320', 105754, 108887, 426974, '2025-09-20 23:39:09'),
	(16, '469837522211', 900, 0, 143747, '2025-09-21 00:52:06'),
	(17, '921099265653', 1500, 0, 633611, '2025-09-21 00:53:56'),
	(18, '922931798731', 300, 222, 794611, '2025-09-21 01:21:25'),
	(19, '273457871426', 998, 4444, 954731, '2025-09-21 01:29:52'),
	(20, '594379375046', 3996, 4000, 772299, '2025-09-21 09:19:34'),
	(21, '621385685359', 200, 222, 237189, '2025-09-21 09:41:25'),
	(22, '679386184494', 29300, 222111, 229362, '2025-09-21 10:15:19'),
	(23, '268692123129', 10300, 100000, 149126, '2025-09-21 13:14:56'),
	(24, '654019497763', 301362, 2222110, 226819, '2025-09-21 13:42:18');

-- Dumping structure for table ashrafbase.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ashrafbase.order_items: ~23 rows (approximately)
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `amount`) VALUES
	(16, 7, 1, 10, 300, 3000),
	(17, 8, 12, 2, 5600, 11200),
	(18, 9, 13, 1, 2000, 2000),
	(19, 9, 3, 1, 520, 520),
	(20, 10, 13, 16, 2000, 32000),
	(21, 10, 12, 1, 5600, 5600),
	(22, 11, 12, 1, 5600, 5600),
	(23, 11, 14, 4, 200, 800),
	(24, 12, 14, 1, 200, 200),
	(25, 12, 13, 1, 2000, 2000),
	(26, 12, 12, 1, 5600, 5600),
	(27, 13, 14, 3, 200, 600),
	(28, 13, 13, 5, 2000, 10000),
	(29, 13, 12, 5, 5600, 28000),
	(30, 14, 14, 1, 200, 200),
	(31, 14, 13, 1, 2000, 2000),
	(32, 15, 12, 1, 300, 300),
	(33, 15, 13, 1, 5000, 5000),
	(34, 15, 14, 1, 100454, 100454),
	(35, 16, 19, 3, 200, 600),
	(36, 16, 12, 1, 300, 300),
	(37, 17, 12, 5, 300, 1500),
	(38, 18, 12, 1, 300, 300),
	(39, 19, 15, 1, 998, 998),
	(40, 20, 17, 1, 2000, 2000),
	(41, 20, 15, 2, 998, 1996),
	(42, 21, 19, 1, 200, 200),
	(43, 22, 12, 1, 300, 300),
	(44, 22, 18, 1, 29000, 29000),
	(45, 23, 12, 1, 300, 300),
	(46, 23, 13, 2, 5000, 10000),
	(47, 24, 14, 3, 100454, 301362);

-- Dumping structure for table ashrafbase.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Unavailable,1=Available',
  `product_id` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ashrafbase.products: ~9 rows (approximately)
INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `status`, `product_id`, `image`) VALUES
	(12, 10, 'zarta', 'sasdasdas', 7700, 0, 'PRD3400', NULL),
	(13, 10, 'sirtaj', 'wvswfdcvs', 5000, 3, 'PRD5723', NULL),
	(14, 10, 'lond cotton suit', '120 rs per meter', 100454, 1, 'PRD4667', NULL),
	(15, 10, 'cotton white suit', '2000 wala thana', 998, 1, 'PRD2172', NULL),
	(16, 10, 'marya b', '3 pice ', 2000, 1, 'PRD9000', NULL),
	(17, 10, 'sana yousf', '3 pice', 2000, 1, 'PRD7857', NULL),
	(18, 10, 'mardna karndi', 'karandiiii', 29000, 1, 'PRD4739', NULL),
	(19, 10, 'sana b', '2 piece suit', 200, 1, 'PRD7643', NULL),
	(20, 10, 'gdz', 'dss', 28987, 1, 'PRD4609', NULL),
	(21, 10, 'Zasacsc', 'sascss', 39999, 1, 'PRD6189', NULL);

-- Dumping structure for table ashrafbase.slow_log
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='Slow log';

-- Dumping data for table ashrafbase.slow_log: 2 rows
/*!40000 ALTER TABLE `slow_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `slow_log` ENABLE KEYS */;

-- Dumping structure for table ashrafbase.system_settings
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ashrafbase.system_settings: ~1 rows (approximately)
INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
	(1, 'Ashraf mall', 'ashrafmall@gmail.com', '9000000000', '1758395820_ashraf.jpg', '&lt;p&gt;By hassan Ehsan&lt;/p&gt;');

-- Dumping structure for table ashrafbase.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1=Admin,2=Staff',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table ashrafbase.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
	(3, 'hassan ehsan', 'hassanchandia792@gmail.com', 'cd92a26534dba48cd785cdcc0b3e6bd1', 1),
	(4, 'ashrafbhai', 'admin@gmail.com', '93f93da44b5377a0e1bdd95c925d113b', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
