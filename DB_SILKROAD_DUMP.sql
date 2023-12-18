-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SILKROAD
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auction_items`
--

DROP TABLE IF EXISTS `auction_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `char_inventory` bigint unsigned NOT NULL,
  `until` timestamp NULL DEFAULT NULL,
  `price` bigint NOT NULL,
  `price_instead` bigint DEFAULT NULL,
  `bids` bigint DEFAULT '0',
  `current_bid_user_id` bigint unsigned DEFAULT NULL,
  `current_user_bid_amount` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auction_items_user_id_foreign` (`user_id`),
  KEY `auction_items_current_bid_user_id_foreign` (`current_bid_user_id`),
  KEY `auction_items_char_inventory_foreign` (`char_inventory`),
  CONSTRAINT `auction_items_char_inventory_foreign` FOREIGN KEY (`char_inventory`) REFERENCES `char_inventories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auction_items_current_bid_user_id_foreign` FOREIGN KEY (`current_bid_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auction_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction_items`
--

LOCK TABLES `auction_items` WRITE;
/*!40000 ALTER TABLE `auction_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_house_logs`
--

DROP TABLE IF EXISTS `auctions_house_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_house_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `price_sold` int DEFAULT NULL,
  `seller_user_id` bigint unsigned NOT NULL,
  `buyer_user_id` bigint unsigned DEFAULT NULL,
  `state` enum('sold','notsold') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auctions_house_logs_seller_user_id_foreign` (`seller_user_id`),
  KEY `auctions_house_logs_buyer_user_id_foreign` (`buyer_user_id`),
  CONSTRAINT `auctions_house_logs_buyer_user_id_foreign` FOREIGN KEY (`buyer_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `auctions_house_logs_seller_user_id_foreign` FOREIGN KEY (`seller_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_house_logs`
--

LOCK TABLES `auctions_house_logs` WRITE;
/*!40000 ALTER TABLE `auctions_house_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions_house_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_house_settings`
--

DROP TABLE IF EXISTS `auctions_house_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_house_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_house_settings`
--

LOCK TABLES `auctions_house_settings` WRITE;
/*!40000 ALTER TABLE `auctions_house_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions_house_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backlinks`
--

DROP TABLE IF EXISTS `backlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backlinks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backlinks_image_id_foreign` (`image_id`),
  CONSTRAINT `backlinks_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backlinks`
--

LOCK TABLES `backlinks` WRITE;
/*!40000 ALTER TABLE `backlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `backlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `char_gold`
--

DROP TABLE IF EXISTS `char_gold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `char_gold` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `gold` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `char_gold_user_id_unique` (`user_id`),
  CONSTRAINT `char_gold_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_gold`
--

LOCK TABLES `char_gold` WRITE;
/*!40000 ALTER TABLE `char_gold` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_gold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `char_gold_logs`
--

DROP TABLE IF EXISTS `char_gold_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `char_gold_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `from_charid` int NOT NULL,
  `deposit` bigint DEFAULT NULL,
  `withdraw` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `char_gold_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `char_gold_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_gold_logs`
--

LOCK TABLES `char_gold_logs` WRITE;
/*!40000 ALTER TABLE `char_gold_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_gold_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `char_inventories`
--

DROP TABLE IF EXISTS `char_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `char_inventories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `from_charid` bigint NOT NULL,
  `serial64` bigint NOT NULL,
  `item_id64` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgpath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `optlevel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `sort` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unknown',
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int NOT NULL,
  `npc_price` int NOT NULL DEFAULT '0',
  `race` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `char_inventories_user_id_foreign` (`user_id`),
  CONSTRAINT `char_inventories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_inventories`
--

LOCK TABLES `char_inventories` WRITE;
/*!40000 ALTER TABLE `char_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `char_inventory_logs`
--

DROP TABLE IF EXISTS `char_inventory_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `char_inventory_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `from_charid` int NOT NULL,
  `serial64` bigint NOT NULL,
  `item_id64` bigint NOT NULL,
  `state` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `char_inventory_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `char_inventory_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_inventory_logs`
--

LOCK TABLES `char_inventory_logs` WRITE;
/*!40000 ALTER TABLE `char_inventory_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `char_inventory_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_methods`
--

DROP TABLE IF EXISTS `donation_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` enum('USD','EUR','TL') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `donation_methods_method_unique` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_methods`
--

LOCK TABLES `donation_methods` WRITE;
/*!40000 ALTER TABLE `donation_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_paypals`
--

DROP TABLE IF EXISTS `donation_paypals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_paypals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `silk` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_paypals`
--

LOCK TABLES `donation_paypals` WRITE;
/*!40000 ALTER TABLE `donation_paypals` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_paypals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_stripes`
--

DROP TABLE IF EXISTS `donation_stripes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_stripes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `silk` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_stripes`
--

LOCK TABLES `donation_stripes` WRITE;
/*!40000 ALTER TABLE `donation_stripes` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_stripes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` int unsigned DEFAULT NULL,
  `file_size` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` VALUES (2,'TẢI FONT','https://drive.google.com/file/d/1SeX5yF1fX1QJTYla5Pj1sqcR05WeDQ14/edit',NULL,'1MB','2022-06-18 04:25:53','2022-10-03 10:58:59'),(7,'Sbot (tự động đánh trong game)','https://drive.google.com/file/d/1752xX87rpJz84GkqBnyg6YbsR8ZhIGzX/view?usp=sharing',NULL,'12MB','2022-10-14 08:14:29','2023-08-25 13:31:26'),(8,'Mbot (Tự động đánh trong game)','https://mega.nz/file/ItsxCADL#A9u-j-5nQ4Du3nE5EyQNpBh8X_eMXgK6MAwLo-7SJYY',NULL,'12MB','2022-10-14 08:14:50','2022-10-14 08:14:50'),(11,'TẢI GAME (DRIVER)','https://drive.google.com/file/d/1k1WPyggMsVJrxeWcOLal8SIOMKp9CKAZ/view?usp=sharing',NULL,'2GB','2023-08-25 13:32:35','2023-12-11 15:20:52'),(14,'TẢI GAME (MEGA)','https://mega.nz/file/UnImySxB#E5JDE_0OmvvwYFSqtfy5tZuuaqhaRKtqfvoS-VVbrbE',NULL,'2GB','2023-12-11 15:29:23','2023-12-11 15:29:23');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hide_ranking_guilds`
--

DROP TABLE IF EXISTS `hide_ranking_guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hide_ranking_guilds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guild` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guild_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hide_ranking_guilds`
--

LOCK TABLES `hide_ranking_guilds` WRITE;
/*!40000 ALTER TABLE `hide_ranking_guilds` DISABLE KEYS */;
/*!40000 ALTER TABLE `hide_ranking_guilds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hide_rankings`
--

DROP TABLE IF EXISTS `hide_rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hide_rankings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `charname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hide_rankings`
--

LOCK TABLES `hide_rankings` WRITE;
/*!40000 ALTER TABLE `hide_rankings` DISABLE KEYS */;
INSERT INTO `hide_rankings` VALUES (1,'d','2022-10-16 03:59:52','2022-10-16 03:59:52'),(2,'[GM]SHIVA','2022-10-16 04:00:09','2022-10-16 04:00:09'),(3,'222','2022-11-06 05:03:33','2022-11-06 05:03:33'),(4,'[GM]FOXIE','2022-11-06 05:04:06','2022-11-06 05:04:06'),(5,'SHIVA','2023-03-25 09:47:38','2023-03-25 09:47:38'),(6,'SIDA','2023-03-25 09:47:42','2023-03-25 09:47:42'),(7,'SHIVA_XAO_KE','2023-03-25 09:47:48','2023-03-25 09:47:48'),(8,'dummy','2023-09-01 05:00:52','2023-09-01 05:00:52'),(9,'ROBOT_SIDA','2023-09-01 05:00:59','2023-09-01 05:00:59');
/*!40000 ALTER TABLE `hide_rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_mall_item_categories`
--

DROP TABLE IF EXISTS `item_mall_item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_mall_item_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TypeID2` int NOT NULL,
  `TypeID3` int NOT NULL,
  `category` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `TypeID4` int NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `race` smallint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_mall_item_categories`
--

LOCK TABLES `item_mall_item_categories` WRITE;
/*!40000 ALTER TABLE `item_mall_item_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_mall_item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_web_mall`
--

DROP TABLE IF EXISTS `item_web_mall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_web_mall` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodeName128` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` smallint NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `silk_price` int NOT NULL DEFAULT '0',
  `item_quantity` int NOT NULL DEFAULT '1',
  `item_plus` int NOT NULL DEFAULT '0',
  `tooltip` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_web_mall_category_id_foreign` (`category_id`),
  CONSTRAINT `item_web_mall_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `item_mall_item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_web_mall`
--

LOCK TABLES `item_web_mall` WRITE;
/*!40000 ALTER TABLE `item_web_mall` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_web_mall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_web_mall_admin_logs`
--

DROP TABLE IF EXISTS `item_web_mall_admin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_web_mall_admin_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('add','delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_web_mall_admin_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `item_web_mall_admin_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_web_mall_admin_logs`
--

LOCK TABLES `item_web_mall_admin_logs` WRITE;
/*!40000 ALTER TABLE `item_web_mall_admin_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_web_mall_admin_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_web_mall_purchase_logs`
--

DROP TABLE IF EXISTS `item_web_mall_purchase_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_web_mall_purchase_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `plus` int NOT NULL,
  `total_paid` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_web_mall_purchase_logs_item_id_foreign` (`item_id`),
  KEY `item_web_mall_purchase_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `item_web_mall_purchase_logs_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `item_web_mall` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_web_mall_purchase_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_web_mall_purchase_logs`
--

LOCK TABLES `item_web_mall_purchase_logs` WRITE;
/*!40000 ALTER TABLE `item_web_mall_purchase_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_web_mall_purchase_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maxi_card_epin`
--

DROP TABLE IF EXISTS `maxi_card_epin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maxi_card_epin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `silk` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maxi_card_epin_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maxi_card_epin`
--

LOCK TABLES `maxi_card_epin` WRITE;
/*!40000 ALTER TABLE `maxi_card_epin` DISABLE KEYS */;
/*!40000 ALTER TABLE `maxi_card_epin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maxi_card_epin_log`
--

DROP TABLE IF EXISTS `maxi_card_epin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maxi_card_epin_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `epin_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `epin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `epin_amount_id` bigint unsigned DEFAULT NULL,
  `epin_amount` bigint unsigned NOT NULL,
  `commission` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maxi_card_epin_log_user_id_foreign` (`user_id`),
  KEY `maxi_card_epin_log_epin_amount_id_foreign` (`epin_amount_id`),
  CONSTRAINT `maxi_card_epin_log_epin_amount_id_foreign` FOREIGN KEY (`epin_amount_id`) REFERENCES `maxi_card_epin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `maxi_card_epin_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maxi_card_epin_log`
--

LOCK TABLES `maxi_card_epin_log` WRITE;
/*!40000 ALTER TABLE `maxi_card_epin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `maxi_card_epin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2020_01_06_205609_create_permission_tables',1),(4,'2020_01_12_144720_create_downloads_table',1),(5,'2020_01_15_194520_create_images_table',1),(6,'2020_01_18_030910_create_news_table',1),(7,'2020_01_18_039511_create_news_comments_table',1),(8,'2020_01_20_222053_create_users_created_counts',1),(9,'2020_02_07_213326_create_ticket_categories_table',1),(10,'2020_02_07_213506_create_tickets_table',1),(11,'2020_02_07_213659_create_ticket_prioritys_table',1),(12,'2020_02_07_214122_create_ticket_status_table',1),(13,'2020_02_13_003531_create_ticket_answers_table',1),(14,'2020_03_08_231039_create_hide_rankings_table',1),(15,'2020_03_09_141309_create_onlineofflinelog_table',1),(16,'2020_03_10_161809_create_loginhistorylog_table',1),(17,'2020_04_16_174118_create_backlinks_table',1),(18,'2020_04_18_160542_create_magopts_table',1),(19,'2020_04_21_185814_create_site_settings_table',1),(20,'2020_04_25_021512_create_chargolds_table',1),(21,'2020_04_25_022353_create_chargold_logs_table',1),(22,'2020_04_26_224805_create_char_inventory_table',1),(23,'2020_04_26_224816_create_char_inventory_logs_table',1),(24,'2020_05_27_210543_create_auction_items_table',1),(25,'2020_06_06_160314_create_auctions_house_settings_table',1),(26,'2020_06_09_172654_create_auctions_house_log_table',1),(27,'2020_06_09_193138_create_supportersonline_table',1),(28,'2020_06_14_144000_create_notifications_table',1),(29,'2020_06_19_163023_create_server_gold_table',1),(30,'2020_06_19_170506_create_todos_table',1),(31,'2020_06_20_022306_create_server_informations_table',1),(32,'2020_07_09_003243_create_vouchers_table',1),(33,'2020_09_22_231202_create_donations_methods_table',1),(34,'2020_09_23_011139_create_donations_paypal_table',1),(35,'2020_09_23_232126_create_paypal_invoices_table',1),(36,'2020_10_03_035423_create_itempoolname_table',1),(37,'2020_10_10_005910_create_hide_ranking_guilds_table',1),(38,'2020_10_12_010028_create_rules_table',1),(39,'2020_10_18_145531_create_uniquekilllogs_table',1),(40,'2020_10_18_145933_create_uniquekillogs_procedure',1),(41,'2020_10_25_011139_create_donations_stripe_table',1),(42,'2020_10_26_194626_create_stripe_invoices_table',1),(43,'2020_10_27_134742_create_pvp_records_table',1),(44,'2020_10_31_022910_create_fortress_status_table',1),(45,'2020_10_31_022911_create_webcms_procedure',1),(46,'2020_11_06_190830_create_pages_table',1),(47,'2020_12_10_033543_create_item_mall_item_categories_table',1),(48,'2020_12_10_033544_create_item_web_mall_table',1),(49,'2020_12_10_075335_create_item_web_mall_purchase_logs_table',1),(50,'2020_12_10_075349_create_item_web_mall_add_logs_table',1),(51,'2021_04_20_080600_create_maxi_card_epin_table',1),(52,'2021_04_20_081004_create_maxi_card_epin_log_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (3,'App\\User',1),(3,'App\\User',2),(3,'App\\User',3);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` int unsigned DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'⭐️⭐️⭐️Chào Mừng anh em tham gia server Thần Nông Open vào 10h 23/12/2023⭐️⭐️⭐️','welcome','<div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Trang chủ:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">sro-thannong.us</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><br></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Group FB:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv xzsf02u x1s688f\" href=\"https://www.facebook.com/groups/1075056413356108?__cft__[0]=AZWBA7qXfSPxDvSrj1e-YXo25xUBVOY_zQljRxXrg7R0DqqYCOCsR0iVD1kVDzpYcIGtbkX1P6g5ePF-n1tWnxRZsabFNseL-O1FpfLXWXdSHGatmDmOiIeqEyfJ0WCNGRsNbU6B3YPgTW3YintZzfxi&amp;__tn__=-UK-R\" role=\"link\" tabindex=\"0\" style=\"cursor: pointer; margin: 0px; text-align: inherit; padding: 0px; outline: none; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; list-style: none; touch-action: manipulation; display: inline;\">https://www.facebook.com/groups/1075056413356108</a></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Discord:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><a href=\"https://discord.com/invite/7ZwK7NxYcT\" target=\"_blank\">https://discord.com/invite/7ZwK7NxYcT</a><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://discord.com/invite/7ZwK7NxYcT?fbclid=IwAR02VV1s2n1tQ1EDQsGwd4mXI3EGSngwVMJgkPxcr5PX1dREbPKC0ycBPcg\" rel=\"nofollow noopener\" role=\"link\" tabindex=\"0\" target=\"_blank\" style=\"cursor: pointer; margin: 0px; text-align: inherit; padding: 0px; outline: none; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; list-style: none; touch-action: manipulation; display: inline;\"></a></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><br></span></div><h2 style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><b>⭐️⭐️⭐️Open vào 10h 23/12/2023</b></span><b>⭐️⭐️⭐️</b></h2><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Thông Tin Sever :</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span></span><span style=\"font-size: 1rem;\">💁🏻CAP: 110 ASIA + EU</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span style=\"font-size: 1rem;\">&nbsp; &nbsp; 💁🏻</span>&nbsp;Hỗ trợ tự động găm đồ SUN (đến D9) khi lên level,</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span></span><span style=\"font-size: 1rem;\">💰&nbsp;Online 1h / 5silk</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻&nbsp;Giới hạn : 12 acc/PC , 24 acc/PC</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻&nbsp;Rate exp : x20</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻&nbsp;Rate drop : x1</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻Rate mix đồ : Max +12</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">1-3: 90%&nbsp;</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 4: 70%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 5: 60%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 6: 50%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 7: 20%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 8: 10%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 9: 5%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 10: 3%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 11: 2%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 12: 1%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻&nbsp;Rate mix Nasrun: Max +10</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">1-3: 80% - 70% - 60%</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 4: 50%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 5: 40%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 6: 30%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 7: 25%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 8: 25%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 9: 25%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 10: 25%</div></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻D11 Son drop tại SMM hoặc nhận được từ đánh boss.</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻Đồ Son A B Mua trong shop bằng XU.</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"></span>💁🏻Job 3 thành TA &lt;&gt; HD &lt;&gt; Cons.</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><br></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333; background-color: rgb(255, 156, 0); color: rgb(247, 247, 247);\"><b style=\"\">&nbsp; HỆ THỐNG BOX ĐẶC THÙ&nbsp;&nbsp;</b></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><img src=\"https://i.ibb.co/P68vRNW/box-boss.jpg\" style=\"width: 359px;\"></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">Box Boss nhận được sau khi giết boss hoặc hoàn thành chuyến hàng trong khung giờ vàng (20:00 ~ 00:00)</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">Khi mở box boss sẽ có cơ hội nhận được item:&nbsp; hỗ trợ nhân vật, đá astral, xu...</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">Đặc biệt nhận được 5 điểm hoạt động khi mở 1 box, điểm này dùng để mua đá MM trong shop.</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><br></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span style=\"background-color: rgb(255, 156, 0); color: rgb(255, 255, 255);\">&nbsp; <span style=\"font-weight: bold;\">HỆ THỐNG JOB CỰC CHẤT&nbsp;&nbsp;</span></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">Server buôn 3 thành từ Trường An &lt;=&gt; Hoà Điền &lt;=&gt; Cons</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">Sau khi hoàn thành chuyến job bán hàng full thồ thì sẽ nhận được thưởng job tương ứng với 2 khung giờ (giờ thường, giờ vàng)</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><br></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span style=\"background-color: rgb(57, 132, 198); color: rgb(255, 255, 255);\">Giờ thường:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">- Thêm 100m gold cho mỗi chuyến job. (trader / hunter / thief)</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">- 2 box boss</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">- 20 điểm thưởng.</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><br></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span style=\"background-color: rgb(57, 132, 198); color: rgb(255, 255, 255);\">Giờ vàng: (8h tối đến 12h đêm hàng ngày)</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">- Thêm 200m Gold cho Trader / Hunter / Thief</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">- 4 box boss</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">- 3 đá astral</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">- 50 điểm thưởng</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><br></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span style=\"background-color: rgb(206, 0, 0); color: rgb(255, 255, 255);\">Chú ý: 1 ngày chỉ nhận được 10 lần thưởng job (Tránh lạm phát gold hay spam buôn tự động)</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><br></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">Cùng nhiều chức năng khác nữa GM sẽ update bài hướng dẫn dần đến anh em.</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><br></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">Chúc anh em có chơi game vui vẻ :D</div>',NULL,'2023-12-06 16:20:41','2023-12-06 16:21:29','2023-12-13 17:10:24',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_comments`
--

DROP TABLE IF EXISTS `news_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `news_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_comments_user_id_foreign` (`user_id`),
  KEY `news_comments_news_id_foreign` (`news_id`),
  CONSTRAINT `news_comments_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `news_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_comments`
--

LOCK TABLES `news_comments` WRITE;
/*!40000 ALTER TABLE `news_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_content`
--

DROP TABLE IF EXISTS `pages_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_content` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pages_id` bigint unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_content_pages_id_foreign` (`pages_id`),
  CONSTRAINT `pages_content_pages_id_foreign` FOREIGN KEY (`pages_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_content`
--

LOCK TABLES `pages_content` WRITE;
/*!40000 ALTER TABLE `pages_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('linhvilong1998@gmail.com','$2y$10$MYXg0y95F9i2lagKydG4feaQIqDB0gL9X/5irHixy5uM9y9iM8UfG','2022-10-16 06:24:00'),('chi127@gmail.com','$2y$10$jfHIoW0cM6wRHL6AtKwqpOCDsTyjbwKxjGxoog4lRlfJzzw5w.t2u','2022-11-09 04:37:48'),('phuong123@gmail.com','$2y$10$3qcjI9vNatu6hD9DmbeMvu7bk.6UdmAESoBR0gL0OMwE5MzVPPcMS','2022-11-10 00:53:32'),('vaikhiep23@gmail.com','$2y$10$qh9cSrmvV8rGjyDgyvsmx.6Yywm/SEn6BIZh3hJLlDnpBl7JoqXEC','2022-11-13 06:35:00'),('phongdknyy2406@gmail.com','$2y$10$G4Aq4SA0eb.aEEdh59jMTe32w0fno8xkRh44SjtmUOpL7zERXLFRe','2022-12-19 08:01:57'),('nhok111@gmail.com','$2y$10$CuEVHmXYNDXdzGfQWWD9neVR8yhpSKcK9qlv21oHd6Eko9l3GfCfu','2022-12-24 17:23:06'),('mjssm00n01@gmail.com','$2y$10$qxu.MHvJKK0G3gFuuPjjEeaW67tsaJBAfjMQTCtd2AQ70HKSsIujy','2023-03-20 01:14:41'),('callmeblackwind@gmail.com','$2y$10$Z06in.CvZVFlCzLHSCP/5O.yafi3VFrML5fR.gfCcR4kr982WnjYC','2023-03-20 02:30:31'),('badat09062016@gmail.com','$2y$10$s4gA02voE22v68qBCYic4eITJ2eCwaBAEFNx3fkZKROtRRuzH0o9e','2023-06-17 19:22:14'),('Nguyenhailtvp@icloud.com','$2y$10$t2322ot8MYD1Sw0Cd60lcuZCdp.0umcqbsot3BtX.Rh7fmB.ol6xO','2023-06-27 09:10:02'),('thaootsk01@gmail.com','$2y$10$G/3KS4mjr3/5SE4Rn2W8Eei64RO03TXLbOS8M0g6oxRO1VJgCsbb.','2023-08-23 09:52:18');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_invoices`
--

DROP TABLE IF EXISTS `paypal_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `silk` int NOT NULL,
  `state` enum('pending','canceled','paid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_invoices_user_id_foreign` (`user_id`),
  CONSTRAINT `paypal_invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_invoices`
--

LOCK TABLES `paypal_invoices` WRITE;
/*!40000 ALTER TABLE `paypal_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'supporter','web','2022-06-10 04:57:44','2022-06-10 04:57:44'),(2,'moderator','web','2022-06-10 04:57:44','2022-06-10 04:57:44'),(3,'administrator','web','2022-06-10 04:57:44','2022-06-10 04:57:44');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules`
--

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` VALUES (1,'<p><font color=\"#dcddde\" face=\"gg sans, Noto Sans, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"white-space: break-spaces;\">1- Trường hợp mặc JOB hoặc trong sự kiện của server. </span></font><span style=\"color: rgb(220, 221, 222); font-family: &quot;gg sans&quot;, &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 1rem; white-space: break-spaces;\">Cấm đánh theo chủ pt. (tố cáo bằng cách chụp ảnh quay phim. vi phạm không đi tù nữa mà ban acc)</span></p><p><font color=\"#dcddde\" face=\"gg sans, Noto Sans, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"white-space: break-spaces;\">      lần 1: ban 1 ngày\r\n      lần 2: ban 1 tuần\r\n      lần 3: ban vĩnh viễn\r\n5- Phe thief và Trade/Hunter sẽ cử ra 1 người host event BigJOB,đua ngựa... theo tuần (tuần này phe hunter host thì tuần tới phe thief host)\r\n\r\n7- Bắt buộc 1 job / IP. phát hiện ra nhiều job / IP sẽ cảnh cáo và phạt như dưới\r\n       1 IP có thể có trade và hunter\r\n       Nhưng 1 IP không thể có trade và thief hoặc hunter và thief.\r\n    lần 1 : cảnh cáo thu hồi gold, bắt đổi job\r\n    lần 2 : Xóa toàn bộ đồ ban vĩnh viễn\r\n    phát hiện dựa vào tố cáo của member\r\n\r\n8- Phát hiện thả hàng:\r\n    Xóa toàn bộ đồ ban vĩnh viễn\r\n    phát hiện dựa vào tố cáo của member\r\n\r\nToàn bộ tố cáo cần có clip làm bằng chứng</span></font><br></p>','2022-12-11 04:04:08','2022-12-16 08:13:21');
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_gold`
--

DROP TABLE IF EXISTS `server_gold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_gold` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gold` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_gold`
--

LOCK TABLES `server_gold` WRITE;
/*!40000 ALTER TABLE `server_gold` DISABLE KEYS */;
INSERT INTO `server_gold` VALUES (1,0,'2023-08-25 10:48:26','2023-08-25 10:48:26');
/*!40000 ALTER TABLE `server_gold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_information`
--

DROP TABLE IF EXISTS `server_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_information`
--

LOCK TABLES `server_information` WRITE;
/*!40000 ALTER TABLE `server_information` DISABLE KEYS */;
INSERT INTO `server_information` VALUES (1,'⚡️Thông tin Server Thần Nông','<div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Trang chủ:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://vienduonglaosro.online/?fbclid=IwAR3S__dUUpD3IK21IDU9t99pg_bKEpW6uO5yJTStgnkOC6i1_Fw_EedXeTU\" rel=\"nofollow noopener\" role=\"link\" tabindex=\"0\" target=\"_blank\" style=\"cursor: pointer; margin: 0px; text-align: inherit; padding: 0px; outline: none; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; list-style: none; touch-action: manipulation; display: inline;\">https://sro-thannong.us/</a></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Đăng ký:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://vienduonglaosro.online/register?fbclid=IwAR3WH8q8WPLkwdTWRGzqxAZvEoiexxcnzppyj430eOTc4w943c6kKLKdAf0\" rel=\"nofollow noopener\" role=\"link\" tabindex=\"0\" target=\"_blank\" style=\"cursor: pointer; margin: 0px; text-align: inherit; padding: 0px; outline: none; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; list-style: none; touch-action: manipulation; display: inline;\">https://sro-thannong.us/register</a></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Group FB:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv xzsf02u x1s688f\" href=\"https://www.facebook.com/groups/1075056413356108?__cft__[0]=AZWBA7qXfSPxDvSrj1e-YXo25xUBVOY_zQljRxXrg7R0DqqYCOCsR0iVD1kVDzpYcIGtbkX1P6g5ePF-n1tWnxRZsabFNseL-O1FpfLXWXdSHGatmDmOiIeqEyfJ0WCNGRsNbU6B3YPgTW3YintZzfxi&amp;__tn__=-UK-R\" role=\"link\" tabindex=\"0\" style=\"cursor: pointer; margin: 0px; text-align: inherit; padding: 0px; outline: none; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; list-style: none; touch-action: manipulation; display: inline;\">https://www.facebook.com/groups/1075056413356108</a></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Discord:</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><a href=\"https://discord.com/invite/7ZwK7NxYcT\" target=\"_blank\">https://discord.com/invite/7ZwK7NxYcT</a><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" href=\"https://discord.com/invite/7ZwK7NxYcT?fbclid=IwAR02VV1s2n1tQ1EDQsGwd4mXI3EGSngwVMJgkPxcr5PX1dREbPKC0ycBPcg\" rel=\"nofollow noopener\" role=\"link\" tabindex=\"0\" target=\"_blank\" style=\"cursor: pointer; margin: 0px; text-align: inherit; padding: 0px; outline: none; border-width: 0px; border-style: initial; border-color: initial; -webkit-tap-highlight-color: transparent; list-style: none; touch-action: manipulation; display: inline;\"></a></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><br></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><br></span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">Thông Tin Sever :</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;CAP: 110 ASIA + EU</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Hỗ trợ tự động găm đồ SUN (đến D9) khi lên level,</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Online 1h / 5silk</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Giới hạn : 12 acc/PC , 24 acc/PC</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Rate exp : x20</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Rate drop : x1</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Rate mix đồ : Max +12</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">1-3: 90%&nbsp;</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 4: 70%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 5: 60%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 6: 50%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 7: 20%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 8: 10%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 9: 5%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 10: 3%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 11: 2%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 12: 1%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Rate mix Nasrun: Max +10</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\">1-3: 80% - 70% - 60%</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 4: 50%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 5: 40%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 6: 30%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 7: 25%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 8: 25%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 9: 25%</div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\">&nbsp; &nbsp; &nbsp; &nbsp; 10: 25%</div></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;D11 Son drop tại SMM</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>&nbsp;Đồ Son A B Mua trong shop bằng XU.</span></div><div class=\"x1e56ztr\" style=\"margin-bottom: 8px;\"><span class=\"x193iq5w xeuugli x13faqbe x1vvkbs xlh3980 xvmahel x1n0sxbx x6prxxf xvq8zen xo1l8bm xzsf02u\" style=\"word-break: break-word; max-width: 100%; overflow-wrap: break-word; min-width: 0px; -webkit-font-smoothing: antialiased; line-height: 1.3333;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle;\"><img height=\"16\" width=\"16\" alt=\"✔️\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/td2/2/16/2714.png\" style=\"border: 0px;\"></span>Job 3 thành TA &lt;&gt; HD &lt;&gt; Cons</span></div>',1,'2022-10-12 11:11:40','2023-12-06 16:18:45');
/*!40000 ALTER TABLE `server_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'{\"sro_silk_name\":\"Silk\",\"sro_silk_gift_name\":\"\\u0110i\\u1ec3m Th\\u01b0\\u1edfng\",\"discord_id\":\"956177818637697084\",\"facebook_url\":\"https:\\/\\/www.facebook.com\\/groups\\/1075056413356108\\/?multi_permalinks=1300668250794922&notif_id=1680152431529572&notif_t=feedback_reaction_generic&ref=notif\",\"youtube_url\":\"\",\"contact_email\":\"\",\"registration_close\":false,\"jangan_fortress\":false,\"bandit_fortress\":false,\"hotan_fortress\":false,\"constantinople_fortress\":false,\"char_ranking\":true,\"guild_ranking\":true,\"job_ranking\":true,\"trader_ranking\":true,\"hunter_ranking\":true,\"thief_ranking\":true,\"unique_ranking\":true,\"free_pvp_ranking\":true,\"job_pvp_ranking\":true,\"sro_content_id\":\"22\",\"sro_max_server\":\"1000\",\"sro_cap\":\"110\",\"sro_exp\":\"20\",\"sro_exp_gold\":\"1\",\"sro_exp_drop\":\"1\",\"sro_exp_job\":\"1\",\"sro_exp_party\":\"20\",\"sro_ip_limit\":\"24\",\"sro_hwid_limit\":\"12\",\"signature\":\"\",\"hide_gamemaster_char\":true,\"voteforsilk\":false}');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe_invoices`
--

DROP TABLE IF EXISTS `stripe_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stripe_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `payment_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `silk` int NOT NULL,
  `state` enum('pending','canceled','paid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stripe_invoices_user_id_foreign` (`user_id`),
  CONSTRAINT `stripe_invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_invoices`
--

LOCK TABLES `stripe_invoices` WRITE;
/*!40000 ALTER TABLE `stripe_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supporters_online`
--

DROP TABLE IF EXISTS `supporters_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supporters_online` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `charname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CharID` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supporters_online`
--

LOCK TABLES `supporters_online` WRITE;
/*!40000 ALTER TABLE `supporters_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `supporters_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_answers`
--

DROP TABLE IF EXISTS `ticket_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_answers_ticket_id_foreign` (`ticket_id`),
  CONSTRAINT `ticket_answers_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_answers`
--

LOCK TABLES `ticket_answers` WRITE;
/*!40000 ALTER TABLE `ticket_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_categories`
--

DROP TABLE IF EXISTS `ticket_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_categories`
--

LOCK TABLES `ticket_categories` WRITE;
/*!40000 ALTER TABLE `ticket_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_prioritys`
--

DROP TABLE IF EXISTS `ticket_prioritys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_prioritys` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` enum('primary','secondary','success','danger','warning','info','light','dark') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_prioritys`
--

LOCK TABLES `ticket_prioritys` WRITE;
/*!40000 ALTER TABLE `ticket_prioritys` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_prioritys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` enum('primary','secondary','success','danger','warning','info','light','dark') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_assigned_id` bigint unsigned DEFAULT '0',
  `ticket_categories_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_prioritys_id` int unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_status_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('done','progress') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'progress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todos_user_id_foreign` (`user_id`),
  CONSTRAINT `todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todos`
--

LOCK TABLES `todos` WRITE;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vouchers`
--

DROP TABLE IF EXISTS `user_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_vouchers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `voucher_id` bigint unsigned NOT NULL,
  `redeemed_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_vouchers_user_id_foreign` (`user_id`),
  KEY `user_vouchers_voucher_id_foreign` (`voucher_id`),
  CONSTRAINT `user_vouchers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_vouchers_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vouchers`
--

LOCK TABLES `user_vouchers` WRITE;
/*!40000 ALTER TABLE `user_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `silkroad_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_map` tinyint(1) NOT NULL DEFAULT '1',
  `reflink` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referrer_id` bigint unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_silkroad_id_unique` (`silkroad_id`),
  UNIQUE KEY `users_jid_unique` (`jid`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_reflink_unique` (`reflink`),
  KEY `users_referrer_id_foreign` (`referrer_id`),
  CONSTRAINT `users_referrer_id_foreign` FOREIGN KEY (`referrer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thannonggm','thannonggm',1,'thannonggm@mail.com',NULL,'$2y$10$tB.vMUsHfmXkyS78Ocsd7.qFqKLSRGLg8HCqT4sQWMZBrBXaebya2',0,'dea7de30-bca8-4f25-b7bd-79f07442b3b0',NULL,'YpqsIiAGY2Ska9mVHZT31hIb1fKyvsHk4Pp4xc7pWU08c57uQjea5Ilit9cR','2023-12-06 15:30:20','2023-12-06 15:30:20'),(2,'thannongbot','thannongbot',2,'thannongbot@mail.com',NULL,'$2y$10$/Y/HGiL578Ftd7Z/gjpWCuZl4Tf.cO/9056lk/VxVOLXNNssmcFvq',0,'29598a7d-e642-4bb8-a9f7-8a4e9af42b5b',NULL,NULL,'2023-12-06 15:35:22','2023-12-06 15:35:22'),(3,'thannongsmc','thannongsmc',3,'thannongsmc@mail.com',NULL,'$2y$10$gFAPY7SzmA3ayuMrjowHruAS28tbVrdvqOaNUn8UnuEkLht/3j3EK',0,'e6cffaa5-1da2-490c-a396-a9380ae15221',NULL,'l8YclyEQyfVRZbrSAt4rF7wH9wkZUws6pgXD90WzApCdAsQUByJni5Pi0izj','2023-12-06 15:35:59','2023-12-06 15:35:59'),(4,'hieulavua1','hieulavua1',4,'hieulavua1@gmail.com',NULL,'$2y$10$6twZ3m1oN8yM1v1t.NRDp.1eERbowohzslvx9dvgD2Y/Tcl87z5GS',0,'6cafe686-0ad4-4e8b-82f7-e91831072755',NULL,NULL,'2023-12-07 00:13:30','2023-12-07 00:13:30'),(5,'bienphihiep','bienphihiep',5,'chathangnau@gmail.com',NULL,'$2y$10$Bz2rXU1HpLYbU23YNwra8eBdUKj0shMzDK2Lmifxbgv07KszWAZyC',0,'7dfae6ea-7549-46c0-b839-366c402c5f8b',NULL,NULL,'2023-12-07 01:03:32','2023-12-07 01:03:32'),(6,'thaootsk01','thaootsk01',6,'thaootsk01@gmail.com',NULL,'$2y$10$0AakDc8TBhT3PPqgq4NC/uygey4JaCeDAcSXs9MaJuNkP/dptIjVu',0,'6ce629a6-30d9-4f63-9373-17074848a076',NULL,NULL,'2023-12-07 01:09:48','2023-12-07 01:09:48'),(7,'vanloi1','vanloi1',7,'nguyenvanloi601505@gmail.com',NULL,'$2y$10$TRIDOCiBCkeJVfArv3PDXeb3dvGms/7AdWge1ZmaXTkPx6tZXAo5y',0,'3dd18581-f3e4-4c51-8304-25ecd3dd78b9',NULL,NULL,'2023-12-07 01:20:42','2023-12-07 01:20:42'),(8,'saothichthe','saothichthe',8,'saothichthe@yahoo.com.vn',NULL,'$2y$10$MxI3QSMa13Iehafd09WzUegf5/nRw7bPKff2FWfp1ToUDeGFtg/3O',0,'dbce828c-6f98-45e5-8826-69176e8d38a3',NULL,NULL,'2023-12-07 04:01:58','2023-12-07 04:01:58'),(9,'hzlinkinpark','hzlinkinpark',9,'hzlinkinpark@gmail.com',NULL,'$2y$10$uluwp2eJDCl8yQaL4yZZmuuRIUwWebE3Yi0.IN7C0F8cjsFji1Ote',0,'a6e1cc55-9539-41e3-bb59-c825351fe9ab',NULL,NULL,'2023-12-07 04:03:33','2023-12-07 04:03:33'),(10,'thanhngan','thanhngan',10,'thanhngan@yahoo.com',NULL,'$2y$10$HLnNWUenMOyVbXJmquxQvebMKLDyPOkCyguxyzcc5SlmWsJb9Jlbi',0,'bc2f4432-738b-4207-ac79-080bc1cb6820',NULL,NULL,'2023-12-07 04:03:43','2023-12-07 04:03:43'),(11,'vudien1','vudien1',11,'vudien1@gmail.com',NULL,'$2y$10$0zilfpyC6HlGEtutzeg.Oup.jYGyg0yso0OHmm3B6EzEKl/lYU4Q2',0,'ac531b83-64f2-42ce-8975-25118aa529e8',NULL,NULL,'2023-12-07 06:16:53','2023-12-07 06:16:53'),(12,'vudien2','vudien2',12,'vudien2@gmail.com',NULL,'$2y$10$YVzOwx71eh4opw.OrTOsRuqzbgTNaBRGgJNZJh5X06iJpjK3a22ca',0,'af8e479e-1469-4370-8441-4e919f24e52a',NULL,NULL,'2023-12-07 06:18:14','2023-12-07 06:18:14'),(13,'vudien3','vudien3',13,'vudien3@gmail.com',NULL,'$2y$10$V6f3mgkky1EYZqwV9pIoHuZ4tdUpsd3ARff9SFjEeOo8EnSljhgW.',0,'6bc0b8ac-1c89-49f9-8bb8-e67c77caa7ba',NULL,NULL,'2023-12-07 06:20:03','2023-12-07 06:20:03'),(14,'vudien4','vudien4',14,'vudien4@gmail.com',NULL,'$2y$10$9Z8hyvhn9IDsuYbmQhI91eTOg1cHxYzx2ju.SsFrdcfQpIAAW3MpC',0,'114fb6b8-9abe-4bc0-990e-181c3ca7036e',NULL,NULL,'2023-12-07 06:22:05','2023-12-07 06:22:05'),(15,'vudien5','vudien5',15,'vudien5@gmail.com',NULL,'$2y$10$RjCUxcc1F8CzTvk5/MClu.cXJSFt.oyWYpiJvVj8qJWwD1v1h/H7a',0,'02d9197a-d23b-43e3-ab83-783a3396707f',NULL,NULL,'2023-12-07 06:22:59','2023-12-07 06:22:59'),(16,'vudien6','vudien6',16,'vudien6@gmail.com',NULL,'$2y$10$fWJyAZEwYvyHjh7sDXPUfeA73yAgR/ApLs1tj9k1QydGdDvn/FlNe',0,'39bd09c4-d6ae-4479-8d9b-d670748e565c',NULL,NULL,'2023-12-07 06:24:06','2023-12-07 06:24:06'),(17,'vudien7','vudien7',17,'vudien7@gmail.com',NULL,'$2y$10$./cm.wbsSiBw8rnx8cpFkeIUTb23xIIRJEHM7wjfi6Pp3ZfylMAZS',0,'80afb205-95b7-4412-b9e6-23ac68ccbc0d',NULL,NULL,'2023-12-07 06:24:59','2023-12-07 06:24:59'),(18,'marabu01','marabu01',18,'marabu01@hmail.com',NULL,'$2y$10$v0qSoaINcQqhQFk/o.gGSOY78yTQgOFSKcI2n5Q48GX4Bg33WLz66',0,'f4177dc2-9b68-4075-8ac7-4e33277afa27',NULL,NULL,'2023-12-07 06:25:56','2023-12-07 06:25:56'),(19,'vudien8','vudien8',19,'vudien8@gmail.com',NULL,'$2y$10$qG/nE24Ch6eH3nO.vePgOeCjek.ctXN8mN6Hcyk0KXGhfhU3LRMHC',0,'3a2fb2ae-93c9-403c-8f7e-2373094d5679',NULL,NULL,'2023-12-07 06:26:16','2023-12-07 06:26:16'),(20,'vudien9','vudien9',20,'vudien9@gmail.com',NULL,'$2y$10$MWZfoJPBWokSmJuhbrpmu.cuASeFCdl7bcwz1EnyDalfRQqYNsaeu',0,'bd3e5b6b-fa5f-4783-bee0-e262ccda6677',NULL,NULL,'2023-12-07 06:27:14','2023-12-07 06:27:14'),(21,'marabu03','marabu03',21,'marabu03@gmail.com',NULL,'$2y$10$cfpW2rVzr9huhIGBxFAaIO22g1uUg3or1KaWc5/.nIbqtKcBCxIB6',0,'9b41c191-6fab-4fb9-8bd5-6d1302aa17f7',NULL,NULL,'2023-12-07 06:27:36','2023-12-07 06:27:36'),(22,'vudien10','vudien10',22,'vudien10@gmail.com',NULL,'$2y$10$qc1ATevJSW8InAS8VhCex.Nc0GBxI1q/KXgJTSJ9DMvrHTfF4FKSO',0,'5d6fbce5-cc86-436c-9d5a-b44b6931035e',NULL,NULL,'2023-12-07 06:28:26','2023-12-07 06:28:26'),(23,'vudien11','vudien11',23,'vudien11@gmail.com',NULL,'$2y$10$CKfwTBRaDCYqzPXgyOXkTu0/HDLEVmhbTqjKVhwXEflkJLfog2MIG',0,'3971e42f-67fe-45db-8732-e2faa3e9c510',NULL,NULL,'2023-12-07 06:29:19','2023-12-07 06:29:19'),(24,'vudien12','vudien12',24,'vudien12@gmail.com',NULL,'$2y$10$hFoetg2.7LsBFnEq3tN3d..15Y1amQQGje2nw48DQgD5BCqfUE4oS',0,'523b2563-bb09-4da0-ac16-04981cbbf044',NULL,NULL,'2023-12-07 06:30:40','2023-12-07 06:30:40'),(25,'dangxuat','dangxuat',25,'khacmanh060389@gmail.com',NULL,'$2y$10$7f/m4Y5Gk0HlqzAPIRCb/epEYW5QEdHQU8POspt/CWKZt/CXTfYNG',0,'b1635549-f45f-4ee4-8562-068911577061',NULL,NULL,'2023-12-07 06:34:35','2023-12-07 06:34:35'),(26,'dangxuat1','dangxuat1',26,'khacmanh0160389@gmail.com',NULL,'$2y$10$9BSNPKskQo0A.kmgl2kJcu69.sTraGQza0Rd/TcY5fYwW7Ci3HyD6',0,'76cf733e-0ee6-443a-b5e3-36cbacac882f',NULL,NULL,'2023-12-07 06:35:43','2023-12-07 06:35:43'),(27,'dangxuat2','dangxuat2',27,'khacmanh0260389@gmail.com',NULL,'$2y$10$BfXn8d0j/z1jHBB7PUjl8.hfHILiiyjYfyLPJJBpzy1.wzt3djVt6',0,'12e4fed7-2ef8-41b2-aa62-40e07d688000',NULL,NULL,'2023-12-07 06:39:45','2023-12-07 06:39:45'),(28,'dangxuat3','dangxuat3',28,'khacmanh0360389@gmail.com',NULL,'$2y$10$XpgH/HGjTyTgz1dk21yxQ.P0TkaLh3Mnf4Y8tZ6LimLcCnpAQodYe',0,'52b6e36a-f49d-4993-8d59-fdb2f63c4b81',NULL,NULL,'2023-12-07 06:40:30','2023-12-07 06:40:30'),(29,'dangxuat4','dangxuat4',29,'khacmanh0460389@gmail.com',NULL,'$2y$10$pI75tPk7BILo1SPjJhcg3uuDWyqZ/4cZ7AIECDcxJ6gXi0X5aGWMq',0,'5f92281e-5cea-4d79-95cd-42776324aa12',NULL,NULL,'2023-12-07 06:41:05','2023-12-07 06:41:05'),(30,'dangxuat5','dangxuat5',30,'khacmanh0560389@gmail.com',NULL,'$2y$10$ZiOScSgbnvS1o3UNGnQlqejNpMlKEjWd3M9BQF6HqyK9t6/3cB0z2',0,'c402ebf3-96d7-4ab2-b8a6-c75507ec6803',NULL,NULL,'2023-12-07 06:41:37','2023-12-07 06:41:37'),(31,'dangxuat6','dangxuat6',31,'khacmanh0660389@gmail.com',NULL,'$2y$10$I33z5yY/HYRCuEFNTWvmle.FJ2frRAPM5bx3VXdzSIPmrUBmKE5E2',0,'81e258af-5222-4533-8393-7a4371dcb90d',NULL,NULL,'2023-12-07 06:42:14','2023-12-07 06:42:14'),(32,'dangxuat7','dangxuat7',32,'khacmanh0760389@gmail.com',NULL,'$2y$10$fdhEt8IwBjTqc3fDJDzv9eKyMJOT.mJ2cNFo9a7oPIynfQ0q.A5mC',0,'299c73e5-c75a-4795-8b66-b4b1b2a2c0c4',NULL,NULL,'2023-12-07 06:42:48','2023-12-07 06:42:48'),(33,'dicodanganh2','dicodanganh2',33,'nguyendai280820@gmail.com',NULL,'$2y$10$FkpdugC8TOOlqldSI6GhTumcOEmRWhzkEo6ueIII22nDOemoGX5mG',0,'a1582d70-4a46-4dfd-92f9-e40d0e47b683',NULL,NULL,'2023-12-07 08:54:41','2023-12-07 08:54:41'),(34,'dicodanganh3','dicodanganh3',34,'nguyendai280821@gmail.com',NULL,'$2y$10$Nnbwg9AWzeLvmjLCdep4zO8szrREbnOqkrVTISyqwbnWexocZbmj2',0,'028f9bd8-84a7-4040-8f1a-c918bc100114',NULL,NULL,'2023-12-07 08:55:13','2023-12-07 08:55:13'),(35,'fulltrue','fulltrue',35,'vanuoc9000@gmail.com',NULL,'$2y$10$6zK3MCfyPGdg3kNuzTJmI.qiEV6LtF7cD.hzwEBb5GIfi3Im8WJ.C',0,'fc471707-5e63-4e5b-a55a-6b772b639192',NULL,NULL,'2023-12-07 09:16:24','2023-12-07 09:16:24'),(36,'honn00','honn00',36,'phannhatnamgiang1999@gmail.com',NULL,'$2y$10$/D5CSyEHR44Qv3tvHSmSleRMeTcbOOl5f48XA/Ox/uUgx52Ki97Ym',0,'0ee53869-130e-4862-9b99-455927406831',NULL,NULL,'2023-12-07 11:16:13','2023-12-07 11:16:13'),(37,'anhminh1','anhminh1',37,'tuoitresangtao.av@gmail.com',NULL,'$2y$10$s9YQqI5EiS30F4kZuMcuDe1kbxgsWJq4RzdEc17xox6.vITBLp3.y',0,'292b9973-a154-4f44-8724-6992e5a73c94',NULL,NULL,'2023-12-07 11:19:22','2023-12-07 11:19:22'),(38,'maituan','maituan',38,'maituan87tn@gmail.com',NULL,'$2y$10$1O5AtLwHr9.QcF8vrdUE/OkyA0we6r2HoGGdqycXmM8m8eg9fmw1S',0,'a0e8ec55-a01e-40e4-abb5-5079b8adf282',NULL,NULL,'2023-12-07 11:50:50','2023-12-07 11:50:50'),(39,'cutehehe','cutehehe',39,'adadada@gmail.com',NULL,'$2y$10$kd7HO4Elkye8ex0WuLhdr.YqxniDWuspCCq7B/gdCkDOt/QTI1F5K',0,'31413bee-1425-458c-9e6b-d57e85c50d87',NULL,NULL,'2023-12-07 12:27:24','2023-12-07 12:27:24'),(40,'duongaia','duongaia',40,'hoangthaiduongpt@gmail.com',NULL,'$2y$10$cdbHc8KQ1pwP2rVv.Im/WukzUo7LBW5CIDWmIXGPmy7yu/ZvVipW2',0,'64bf4e24-8d8a-4f52-82e3-169cdb35363e',NULL,NULL,'2023-12-07 14:40:11','2023-12-07 14:40:11'),(41,'tuan00','tuan00',41,'maituan87tn0@gmail.com',NULL,'$2y$10$iaaASDsnTU6SsBliaST/PeSNyvYXoj3nAsdzgBXup.HZSJIorkz4e',0,'21cb6cea-555d-426a-93c2-3a813af259b9',NULL,NULL,'2023-12-07 15:22:10','2023-12-07 15:22:10'),(42,'tuan01','tuan01',42,'maituan87tn1@gmail.com',NULL,'$2y$10$roPvAH9sAQ5GjaeVjndDRuf6/AomCZai2lV6bKpzj08yxVh9Ghtmy',0,'c20efe78-5df7-4c0c-adad-948749cff119',NULL,NULL,'2023-12-07 15:22:52','2023-12-07 15:22:52'),(43,'tuan02','tuan02',43,'maituan87tn2@gmail.com',NULL,'$2y$10$51KNzUjq8hEsJu7Z4pWFAOpZbXifWNXNuSBUN7nZceqBC0i6T5Xzm',0,'28555705-c77f-46b6-bd32-7ee559e0ffe7',NULL,NULL,'2023-12-07 15:23:37','2023-12-07 15:23:37'),(44,'tuan03','tuan03',44,'maituan87tn3@gmail.com',NULL,'$2y$10$wqxO0m88UI5H/3Ln.7oU6OE9hLhO7Gig9PuSb1lE0hUsCy7CYvuE.',0,'f417116a-14b3-4ad9-878b-d881f1fee2f5',NULL,NULL,'2023-12-07 15:25:41','2023-12-07 15:25:41'),(45,'tuan04','tuan04',45,'maituan87tn4@gmail.com',NULL,'$2y$10$Zp3GdGVFXG4EisBnsETPYe13aPPnXJH3TtevaZlOtQIkRoqlgomby',0,'4c19f0ac-c7f9-4ec5-85cc-68f74d7ef852',NULL,NULL,'2023-12-07 15:27:03','2023-12-07 15:27:03'),(46,'tuan05','tuan05',46,'maituan87tn5@gmail.com',NULL,'$2y$10$q7dZgbfdYCWV8k/MJf.pkeNm4xYbyF76KWyc6h/ghqgiHuX6B/L..',0,'e84be3c3-615f-4f3e-af55-3bcbbb16a07e',NULL,NULL,'2023-12-07 15:27:54','2023-12-07 15:27:54'),(47,'tuan06','tuan06',47,'maituan87tn6@gmail.com',NULL,'$2y$10$MEtl7/rQl3AdDz8pe.P8K.aGr/xGuTuWU8BUyzJER33l4VUL36cvK',0,'10788459-2df1-47ec-96a3-a602b24d78c5',NULL,NULL,'2023-12-07 15:28:37','2023-12-07 15:28:37'),(48,'tuan07','tuan07',48,'maituan87tn7@gmail.com',NULL,'$2y$10$ppb3dKAtyzLnGEKYut4jRuQ.afKOJeX3DSPeTKFPVW6dudpVSUU3m',0,'182e62d0-d022-4c97-97a1-4adb351e6cf4',NULL,NULL,'2023-12-07 15:29:27','2023-12-07 15:29:27'),(49,'tuan08','tuan08',49,'maituan87tn9@gmail.com',NULL,'$2y$10$FAs54ye8Ww2WkTk1re/XRumPZvcURpGc9hZkcWwsExCnq/DX23DEC',0,'16e66825-6f7c-41e9-8b25-55d42e5c9d1d',NULL,NULL,'2023-12-07 15:30:18','2023-12-07 15:30:18'),(50,'tuan09','tuan09',50,'maituan87tn09@gmail.com',NULL,'$2y$10$eDb8BzXGNLai9slpopBNSOxSSlJ6zrLi5x2PKrg.0uPQ7cKB1hk3q',0,'e39b2ada-bb14-4992-a350-56c72f3c009a',NULL,NULL,'2023-12-07 15:31:38','2023-12-07 15:31:38'),(51,'dong90','dong90',51,'dsfdsgs@gmail.com',NULL,'$2y$10$i3K8YQsQnMssrt/L1VbMneffEU2a55iiVeJqLBpNNbxcuuSOdyoL2',0,'8b6196b4-50dd-4145-991b-948765485a9e',NULL,NULL,'2023-12-07 17:20:48','2023-12-07 17:20:48'),(52,'dong91','dong91',52,'dsgdss1@gmail.com',NULL,'$2y$10$QNvy/LNq62RE.4f2/VkLxecs/a14i7uvxCOF4jgYu50C9ZCk7ELBC',0,'01155a49-9236-4564-aa3b-1964bc4bb908',NULL,NULL,'2023-12-07 17:21:25','2023-12-07 17:21:25'),(53,'dong92','dong92',53,'ssafs124@gmail.com',NULL,'$2y$10$oFiQjauGt0eKnuuGtOxhmu6BqzxA6uG61Rz31y0zMP52sL4hs7vQq',0,'fcd6b84a-d64d-414e-a9c9-71fc0225a7f0',NULL,NULL,'2023-12-07 17:21:55','2023-12-07 17:21:55'),(54,'dong93','dong93',54,'dssgdss12@gmail.com',NULL,'$2y$10$HrlgP.SoXg4YE.2GuSbkqeEkKdz6SGWfxlpTHxcTxqSOjX2LmIj/2',0,'384a5a6c-e67b-480d-9316-57ca1d20d13b',NULL,NULL,'2023-12-07 17:23:07','2023-12-07 17:23:07'),(55,'dong94','dong94',55,'dsafsaga@gmail.com',NULL,'$2y$10$Ia8RLtmLzxSQ2B0LDjS6NeHKyRGCE2z9qAgk0ei0KAq4SpNaZ24cS',0,'a76b73e7-d815-41af-b1ed-0fc8d7dca0c9',NULL,NULL,'2023-12-07 17:23:45','2023-12-07 17:23:45'),(56,'anhminh2','anhminh2',56,'tuoitreAsangtao.av@gmail.com',NULL,'$2y$10$dcgaLodpp4PubMcJsLhAF.7vgw/kh4s0gJKR5rK4A3mIUL.YDXB3a',0,'7f8a4031-2aa7-4f83-bea0-e83737bb59da',NULL,NULL,'2023-12-07 20:10:58','2023-12-07 20:10:58'),(57,'20091991','20091991',57,'tnnguyendat94@gmail.com',NULL,'$2y$10$70bLI2yy5U2uTvDdhsQ6p.IFWaGLMOjuTC8DzcLFAAIDiT8Jc4z6C',0,'b7e36ad5-16f8-41ad-898f-d5eecd8b02ff',NULL,NULL,'2023-12-07 20:44:20','2023-12-07 20:44:20'),(58,'20091992','20091992',58,'tnnguyevndat94@gmail.com',NULL,'$2y$10$PQblKvOgh64sstcN4vS5M.pnqB9YuQgkDd81kyvvcu23KnuvaoZ/6',0,'2cbfdf5b-8a03-4938-95e3-e0d1067d3e8b',NULL,NULL,'2023-12-07 20:45:19','2023-12-07 20:45:19'),(59,'20091993','20091993',59,'tnnguyenrdat94@gmail.com',NULL,'$2y$10$C.K22JJa5LcJlaNsT1tkOeaGahkk.Tlsi6hViuIy7w820pkFIHvFW',0,'275a97b9-b386-4480-ad97-6c0a93eb7e82',NULL,NULL,'2023-12-07 20:46:00','2023-12-07 20:46:00'),(60,'emojngudj1','emojngudj1',60,'cdsadsadsad@yahoo.com',NULL,'$2y$10$dhKnebTx82AOtC2HMKnlmunHt1GTEsHW4v9tu.LTfMCtAVSTJ4KUi',0,'c1960fa6-8a63-418e-a0c3-9ec53a19e52b',NULL,NULL,'2023-12-08 00:03:14','2023-12-08 00:03:14'),(61,'tn0001','tn0001',61,'khongcan@gmail.com',NULL,'$2y$10$N0HzTc3xcBT42ZPQlbhdnOrU9MArFo559YuhH1T07mpkX8sz7Rrji',0,'ab8c1811-1da4-4141-917d-d393c1c34d16',NULL,NULL,'2023-12-08 00:45:37','2023-12-08 00:45:37'),(62,'tien19','tien19',62,'anhchang@gmail.com.vn',NULL,'$2y$10$SJ5St5/AkXUDXSj7zqe.9ex0gOoNuR80mPHYibV5Kc/4lCNGr6TLa',0,'3d450f08-218b-4bd6-bb3e-c3ca9f62c470',NULL,NULL,'2023-12-08 01:18:40','2023-12-08 01:18:40'),(63,'marabu2000','marabu2000',63,'marabu2000@gmail.com',NULL,'$2y$10$LvVAVCMwEE3nMvhZNk1bSuDcQUxdhA2KjBxEusG2wkvKKeWIizVVO',0,'256f2723-b3b1-403e-8714-b528223b5015',NULL,NULL,'2023-12-08 02:16:04','2023-12-08 02:16:04'),(64,'nhoclucky101','nhoclucky101',64,'kendylee101@gmail.com',NULL,'$2y$10$EWQIICetUjPW0OkoMq/DX.J9J3vgXRQ6zdshl04RxMLmhx9CbOKHC',0,'77d85ffc-4272-43d1-b1bb-f47410e09d2d',NULL,NULL,'2023-12-08 02:48:49','2023-12-08 02:48:49'),(65,'nhoclucky102','nhoclucky102',65,'kendylee102@gmail.com',NULL,'$2y$10$gtZ0VuS2srrTwz5.3n7//uaOd4D050OyUYrx9vypzc6cl270FH3xS',0,'5274927c-034e-41ea-bbde-66e752636e7c',NULL,NULL,'2023-12-08 02:50:47','2023-12-08 02:50:47'),(66,'nhoclucky103','nhoclucky103',66,'kendylee103@gmail.com',NULL,'$2y$10$h8BnK4cywt38FploVF5yBOefwf.UxQkdn3YF56xKDsNxvxGlnLmjq',0,'9172e0e4-d3c8-435e-b01e-b83e27fd59e6',NULL,NULL,'2023-12-08 02:51:40','2023-12-08 02:51:40'),(67,'nhoclucky104','nhoclucky104',67,'kendylee104@gmail.com',NULL,'$2y$10$WKDNBYZBqAegAxvSheaG2OSg84TWfxswRHpZQ9oXVatvat3Y8K7Dy',0,'ee8ad1cf-41da-4622-8769-5f45cb6f182e',NULL,NULL,'2023-12-08 02:53:34','2023-12-08 02:53:34'),(68,'nhoclucky106','nhoclucky106',68,'kendylee106@gmail.com',NULL,'$2y$10$c9aFtVWxyiI.TUcbFQxL.u63Yey6KsY8OHByLygOR535v3fG17YTm',0,'0252bd69-7139-4fa1-8f61-e6427f438f4e',NULL,NULL,'2023-12-08 02:56:50','2023-12-08 02:56:50'),(69,'nhoclucky107','nhoclucky107',69,'kendylee107@gmail.com',NULL,'$2y$10$DK10xsetVk00mKWZyYnetewCs5jHcbUhu1VA/P/337RJUH8cgrNnG',0,'3e6bb981-a901-4e21-85c1-42cd60861295',NULL,NULL,'2023-12-08 02:57:48','2023-12-08 02:57:48'),(70,'nhoclucky108','nhoclucky108',70,'kendylee108@gmail.com',NULL,'$2y$10$r0g2m568.NSzjoKw7FiQlerEKfDxjfV1ub0ggwMVbfFIFi42rsAy2',0,'ae2d145f-b063-429f-add7-1211fd11fbc2',NULL,NULL,'2023-12-08 02:58:32','2023-12-08 02:58:32'),(71,'nhoclucky109','nhoclucky109',71,'kendylee109@gmail.com',NULL,'$2y$10$q5sCEd3XjaD4E85Jvx3s8.Za2ND/ONg6GFraaAM7y3kcTjun9rB9K',0,'57d77958-a38a-41b8-87d9-1cedf4e72b7d',NULL,NULL,'2023-12-08 02:59:25','2023-12-08 02:59:25'),(72,'nhoclucky110','nhoclucky110',72,'kendylee110@gmail.com',NULL,'$2y$10$AvDNNqOhaQfYS4xk38sbHOFidLcSPqvbk7zr6IeEPT6vVeOGgubWG',0,'92222b26-76bd-4488-ac0a-2b83965f2561',NULL,NULL,'2023-12-08 03:00:08','2023-12-08 03:00:08'),(73,'nhoclucky111','nhoclucky111',73,'kendylee111@gmail.com',NULL,'$2y$10$/U.9YU14nHxGn1kXLRe0o.ZQb7eCV2jlCUGKEqvO.9kmOVfxfjOwm',0,'f330fb2f-d3f7-4fa1-a4d6-420e426d2e86',NULL,NULL,'2023-12-08 03:00:55','2023-12-08 03:00:55'),(74,'nhoclucky112','nhoclucky112',74,'kendylee112@gmail.com',NULL,'$2y$10$uJnlYGYdug9GWl13lIlvgesSSDKg2.P3IBX4ocpX12uNefF/6OEiq',0,'035924f9-ae74-47bb-a4ae-7210c171f808',NULL,NULL,'2023-12-08 03:02:10','2023-12-08 03:02:10'),(75,'hihi2023','hihi2023',75,'denhactst@gmail.com',NULL,'$2y$10$ygae5eG/46P2POM0b5q2/uFiubAy.DYpNWi.W94mOUWAh3lfI6jKi',0,'0275a03b-69f4-4339-9338-ff9bfe41effe',NULL,NULL,'2023-12-08 03:44:48','2023-12-08 03:44:48'),(76,'hihi2024','hihi2024',76,'atrvbhr4ith4oyj4@gmail.com',NULL,'$2y$10$GRLMgywXoswdZae/D8O9JuhuJZsIvI4rlE8p8fQiT2byaRptr4lFO',0,'27f7a844-c6e1-4c15-8a70-01e73e38f85a',NULL,NULL,'2023-12-08 03:45:46','2023-12-08 03:45:46'),(77,'hihi2025','hihi2025',77,'atrhr4ieethcvbnvtb345royj4@gmail.com',NULL,'$2y$10$xCfN8VuJBUJRAO2nerxopua1a2AORzgLiF2lVdBwdGBuwv2OmmLdG',0,'837f49df-0546-4391-9fb7-2f458eaf31a6',NULL,NULL,'2023-12-08 03:46:36','2023-12-08 03:46:36'),(78,'hihi2026','hihi2026',78,'atrhr4ieevghthcvvtb345royj4@gmail.com',NULL,'$2y$10$G8RlyHwvQWwY8W2Vl3.gYOoUeuXevcmLkR6wh/1nYuApAivUxPbdO',0,'2ee3af82-9713-4f8e-a2d9-def06fed997b',NULL,NULL,'2023-12-08 03:47:27','2023-12-08 03:47:27'),(79,'phuonganh2021','phuonganh2021',79,'doanthanhnguyen19951995@gmail.com',NULL,'$2y$10$fuHekTkA8C27VQgzGa6Fte4ZpnFq7bqXI5TEwWIQG0D9AYl7oa4h2',0,'fa22b343-f0a1-4646-a041-5f9546399473',NULL,NULL,'2023-12-08 04:45:18','2023-12-08 04:45:18'),(80,'phuonganh1','phuonganh1',80,'rnwkjhrwikrw@gmail.com',NULL,'$2y$10$mGQ0X0bJC/aEYU1LzQSKk.SfPzCQf83BGqe78BjfOBdU.B7LgTrbe',0,'dfa4dfbd-7489-4c64-9852-29eed5ed66a5',NULL,NULL,'2023-12-08 04:46:12','2023-12-08 04:46:12'),(81,'tuan10','tuan10',81,'maituan87tn10@gmail.com',NULL,'$2y$10$ANA8ep1Sa.OkfsDv3jVX1OpTZaFn6j6XEsWwhx/2jy6ZaMtq.1Pf2',0,'ecf5e05b-6df1-4dbb-842b-c84f07e0335e',NULL,NULL,'2023-12-08 04:49:23','2023-12-08 04:49:23'),(82,'hungde1','hungde1',82,'boysacce95@yahoo.com.vn',NULL,'$2y$10$KakiHU9TqxsKes0mBvgQLejrzj5MXsLq5vJO/zNb.oosqyqqJRvDG',0,'cf79f4f2-ae61-419b-9718-14a7741fea5c',NULL,NULL,'2023-12-08 05:22:15','2023-12-08 05:22:15'),(83,'marabu02','marabu02',83,'marabu02@gmail.com',NULL,'$2y$10$9G7/l/kAHP9MQEitmoh0GOH7olphdahbWN05YM1TpTqFbWN7obDp6',0,'e9e3494c-edb1-4a74-8520-444da4630649',NULL,NULL,'2023-12-08 07:32:22','2023-12-08 07:32:22'),(84,'quangbeoo','quangbeoo',84,'qn833825@gmail.com',NULL,'$2y$10$8j/eKXQGbIFMp3xdVKbm9uhx3d5AtBXiDoSOqt8t9w.lNlMEtq946',0,'f4725c7c-09c8-40f9-a16c-531b40527e33',NULL,NULL,'2023-12-08 07:51:04','2023-12-08 07:51:04'),(85,'hungde2','hungde2',85,'123456@yahoo.com',NULL,'$2y$10$x6jvNb92JydaM1GnfYGtEeEyALZlazZQHjNUwu8OiYmDdBlVH4jeG',0,'4ce8500d-d8bb-4bb4-8717-78f05f1f7b8c',NULL,NULL,'2023-12-08 09:20:22','2023-12-08 09:20:22'),(86,'hunter','hunter',86,'hunter1997@Gmail.com',NULL,'$2y$10$JHT2RNC2pasI56wwn3Xxe.A4xMdDrt94TC8Yme9GDQ5kRrSgja4Lq',0,'52fd42c0-c61e-42a3-b3ce-181cc08ff940',NULL,NULL,'2023-12-08 09:39:01','2023-12-08 09:39:01'),(87,'thang1','thang1',87,'thang1@gmail.com',NULL,'$2y$10$GN4ZButoLei.3un8QnRLX.sg/lDNkZniFXGN5CVaT3ZQLqvCTilg2',0,'afc43d01-cec3-4907-b190-03177af0c638',NULL,NULL,'2023-12-08 10:03:26','2023-12-08 10:03:26'),(88,'hihi2027','hihi2027',88,'atrhr4ieethcvvvvtb345royj4@gmail.com',NULL,'$2y$10$MVu.ZGLqJEtqMHJ0HLlQWeA/EnSiFSJVg.zwfNewHkld8p.hg1c2C',0,'bd89f474-aeec-47c4-a93b-648391538583',NULL,NULL,'2023-12-08 10:55:56','2023-12-08 10:55:56'),(89,'dangxuat8','dangxuat8',89,'khacmanh0860389@gmail.com',NULL,'$2y$10$mCHwf70T/BTKv5sWhX8SXOU3VAXW9F..6GPRhkGP29hGeVYfDUyiy',0,'665a2b68-1b33-454c-8e2e-493375c025f6',NULL,NULL,'2023-12-08 11:22:21','2023-12-08 11:22:21'),(90,'sieuchemgio','sieuchemgio',90,'k3nz0oq12@gmail.com',NULL,'$2y$10$ekVjqQZ1.L9RQnKfGnMHR.xx178.I5EMOuK8cq1dfxUfJq67/So9W',0,'e93469bb-7935-4a7f-9914-6e080a0bbcb7',NULL,NULL,'2023-12-08 11:42:47','2023-12-08 11:42:47'),(91,'ngocmy01','ngocmy01',91,'mynguyen1993.com@gmail.com',NULL,'$2y$10$hqBxJwAq/r2.EjHTYSNzv.pVcEeQ6w9rbHnZuSM3Eff3JSP0fqEym',0,'572bea4c-4fcc-4502-b1de-6e5950ae2b12',NULL,NULL,'2023-12-08 11:48:34','2023-12-08 11:48:34'),(92,'sieuchemgio1','sieuchemgio1',92,'k23nz0oq12@gmail.com',NULL,'$2y$10$P9s3ZVg.n3WYs3keQ33Pi.jR8V9sEDTR.Y6.HZ0MUlgH8pFd4Hnby',0,'42ffbec0-9c7e-4f20-b977-f383f42f0b98',NULL,NULL,'2023-12-08 12:53:47','2023-12-08 12:53:47'),(93,'sieuchemgio2','sieuchemgio2',93,'k3nz0oq212@gmail.com',NULL,'$2y$10$AZ3G3jXdOHmm6AEGoFm29Olf6svvvY5KzA9bg3I3/pWd/DSepf/TK',0,'06a77599-760f-488b-917e-100fd9a7d466',NULL,NULL,'2023-12-08 12:55:45','2023-12-08 12:55:45'),(94,'sieuchemgio3','sieuchemgio3',94,'minhquan12@gmail.com',NULL,'$2y$10$NuoLI/Om0pY86Ontu7rUruZUcYueFUvPzhMApR7B14/9hkeMvozRC',0,'a7fb13e4-d12c-4cc1-a932-b59bd5b91301',NULL,NULL,'2023-12-08 12:59:18','2023-12-08 12:59:18'),(95,'sieuchemgio4','sieuchemgio4',95,'k3nz0oqc12@gmail.com',NULL,'$2y$10$23eGgqsuRQMPsN9TUIYQL.PGWp6WAJouZK.PbS9H/i3uMb/GJ9ouC',0,'c97078bf-5541-4b04-bce9-fb8e2405ec96',NULL,NULL,'2023-12-08 13:00:26','2023-12-08 13:00:26'),(96,'doiphieubac','doiphieubac',96,'sadfahdfah@gmail.com',NULL,'$2y$10$dOT4ngCdEQNAwTrIknn0juvIRI9RegVU94ukjPh0kiz0hLi.jPtYa',0,'cc0d1c46-e68a-455d-9a2a-c73a6be8ec40',NULL,NULL,'2023-12-08 13:00:47','2023-12-08 13:00:47'),(97,'sieuchemgio5','sieuchemgio5',97,'k3nz0333oq123@gmail.com',NULL,'$2y$10$.7d.tl45CFZFye5oFWLiQuqd4IUCd3Cdfp/8U80hpfz/fHHuJq2ny',0,'859a1d82-7edb-49b7-bc1e-5465948e1060',NULL,NULL,'2023-12-08 13:00:58','2023-12-08 13:00:58'),(98,'sieuchemgio6','sieuchemgio6',98,'k3nz0333oq3123@gmail.com',NULL,'$2y$10$laygdB/Ydm2KzRC2lnz2burPqL8j2UpbFgPiSIJiR/2NJg5AkxNe6',0,'a4cee7e0-a7f9-4c66-9b0f-0dc99a935bcc',NULL,NULL,'2023-12-08 13:01:26','2023-12-08 13:01:26'),(99,'doiphieubac1','doiphieubac1',99,'wqewqsavcsvcs@gmail.com',NULL,'$2y$10$MpkKaDpvKOYpdNHYi5Ahf.Dz1Ak1THdAep.P6t2GeZcT1FZ15TPaS',0,'e95e95a3-6fd9-4e05-a7d1-60aaf40cef10',NULL,NULL,'2023-12-08 13:01:56','2023-12-08 13:01:56'),(100,'sieuchemgio7','sieuchemgio7',100,'k3nzs0oq12@gmail.com',NULL,'$2y$10$6EjixC6UtT3TtYmUhJbvMO9vH94ZecJQcqRrIwsDm.s.sQQeN5mBi',0,'ecaea812-e83f-4e97-a7bd-36c4fc111f69',NULL,NULL,'2023-12-08 13:02:17','2023-12-08 13:02:17'),(101,'doiphieubac2','doiphieubac2',101,'weqesczcamsdamba@gmail.com',NULL,'$2y$10$RqPY6odF2SuS02bzsry.Nue3gOu8RAM.WPWBveOqIhXokCMkIDLG2',0,'fc1a299a-4ac5-4f8f-8fae-cdacd4f96698',NULL,NULL,'2023-12-08 13:02:43','2023-12-08 13:02:43'),(102,'doiphieubac3','doiphieubac3',102,'wqeczxcgfsdbxcsz@gmail.com',NULL,'$2y$10$jB.yxJA/IbAh73QXoZCxyuV4QNVOB.446so/4k7BQ3llOJJeVAHXW',0,'66142af7-4ff3-4922-8f6d-9b2bb98c81ee',NULL,NULL,'2023-12-08 13:03:23','2023-12-08 13:03:23'),(103,'thang','thang',103,'thang@gmail.com',NULL,'$2y$10$jGgA1mFzDiDbz52DxKER0OKpJ0KvVrQkFaoCzpz7iPhCfkZ2uJPPK',0,'2ab0f365-444e-4eb8-8b25-220e86a60e5c',NULL,NULL,'2023-12-08 13:19:42','2023-12-08 13:19:42'),(104,'thang2','thang2',104,'thang2@gmail.com',NULL,'$2y$10$w.GPr/N0sIDgD24Uto5F.ukqy4UYSfENnAW6oXnGNHQLN5VEz8a7O',0,'d7121040-6651-4459-8356-b2f1bb969bb5',NULL,NULL,'2023-12-08 13:20:24','2023-12-08 13:20:24'),(105,'thang3','thang3',105,'thang3@gmail.com',NULL,'$2y$10$fArvS7/YWbYtIykaGHsTNeL3FUakTbeTcwtCrwyr/AuIsWtzZimgi',0,'a673963a-3dd4-4c8e-9e69-f4e02682dac1',NULL,NULL,'2023-12-08 13:20:54','2023-12-08 13:20:54'),(106,'thang4','thang4',106,'thang4@gmail.com',NULL,'$2y$10$MGYoihCZsX3RfI/vRphzr.Xl0CmEeI7DdCouhFVZyOsPdfooOHn8i',0,'08987244-71c5-46b3-b316-e9ec1cdcab75',NULL,NULL,'2023-12-08 13:21:23','2023-12-08 13:21:23'),(107,'thang5','thang5',107,'thang5@gmail.com',NULL,'$2y$10$WyEw1uOcDE75mzsGZtkeCO3EX0jNl20W7hjlRVfSOPFEjhldzQpp.',0,'321f4a8c-40b0-432f-8581-7f77e306e9f6',NULL,NULL,'2023-12-08 13:21:50','2023-12-08 13:21:50'),(108,'thang6','thang6',108,'thang6@gmail.com',NULL,'$2y$10$Af1GnxjoCxC2AQATwfyJvedO6tcgJ9qHh5QBuNzrL3v34Ju.i4oVO',0,'25842aeb-9885-4078-944e-76086beb53ec',NULL,NULL,'2023-12-08 13:22:14','2023-12-08 13:22:14'),(109,'thang7','thang7',109,'thang7@gmail.com',NULL,'$2y$10$kchBwwUeVhdV4rT/I.EDMuMWZiUEQnHXygkrsP1TAVyZfTvzlUQ1W',0,'6286a512-c7a4-4beb-89d4-81ff0dd83ca1',NULL,NULL,'2023-12-08 13:22:39','2023-12-08 13:22:39'),(110,'thang8','thang8',110,'thang8@gmail.com',NULL,'$2y$10$lEVcCE0Om9F4Bo70FPGNeeIatWdEl8vTMS7y1QMYQlCIa6evB3swC',0,'f0cccb00-19bd-46e5-8934-da203a311e75',NULL,NULL,'2023-12-08 13:23:04','2023-12-08 13:23:04'),(111,'honn01','honn01',111,'phannhatnamgiang2000@gmail.com',NULL,'$2y$10$buhxBd23T/lxMetxYx78OOd2tXLcePfc1eUEDRCoVu.GKKpn1Q9eC',0,'7658a765-197e-4a8d-a8c9-4e299484ab12',NULL,NULL,'2023-12-08 16:25:22','2023-12-08 16:25:22'),(112,'honn02','honn02',112,'phannhatnamgiang2001@gmail.com',NULL,'$2y$10$4D0XHMvWmBVGpZ0wFAo//.YgDHO4/ysq7Ig3aXA9lCYiF.DR6s4oK',0,'394d16f0-c68f-4a71-b795-e64a6870b9b0',NULL,NULL,'2023-12-08 16:27:18','2023-12-08 16:27:18'),(113,'honn03','honn03',113,'phannhatnamgiang2002@gmail.com',NULL,'$2y$10$xY2q/Sj7B2lNP4hKtPZtYuJcSbOOCNzHJfnGoQ93cwMj24EgyFoTm',0,'bce4efff-ae33-42ee-a475-2e6fb3d21322',NULL,NULL,'2023-12-08 16:27:20','2023-12-08 16:27:20'),(114,'honn04','honn04',114,'phannhatnamgiang2003@gmail.com',NULL,'$2y$10$D8Gqs47j8SwzXYiNsY6kteuX7R.ggFQtucy03B5/uwAJjCkxsQt2q',0,'437efc8e-22ba-43c7-a2f3-ba2ae03cfd16',NULL,NULL,'2023-12-08 16:27:21','2023-12-08 16:27:21'),(115,'honn05','honn05',115,'phannhatnamgiang2004@gmail.com',NULL,'$2y$10$IlMPzFy1vrdkV0z9ajQvRO7T31SNrm.Uw31ZcHJCT2DOsVtXci3WO',0,'f85850e8-9fba-469b-96ed-ed0c409286b4',NULL,NULL,'2023-12-08 16:27:23','2023-12-08 16:27:23'),(116,'honn06','honn06',116,'phannhatnamgiang2005@gmail.com',NULL,'$2y$10$upVH83lBEd15bRokLBWl1eWMzF3kuDRErTZ6Jm3lQIr5ZUk1NmjgK',0,'619d36fa-e363-4586-b0ca-4ed80e82feb9',NULL,NULL,'2023-12-08 16:29:52','2023-12-08 16:29:52'),(117,'honn07','honn07',117,'phannhatnamgiang2006@gmail.com',NULL,'$2y$10$iGb3FdETc2JsWq36ZH53a.QHFlJbIbFNu4EY.KFZeOIaXei3KB4Ha',0,'0f5e2075-6712-46e4-83cd-ec47311f3aaa',NULL,NULL,'2023-12-08 16:29:53','2023-12-08 16:29:53'),(118,'honn08','honn08',118,'phannhatnamgiang2007@gmail.com',NULL,'$2y$10$76LxyOobWYX3N.JgW39rnemOZ/8XiDIdxeRS/0da0Q0UXmwmraiTe',0,'a22a7a41-3a4a-445c-982b-cf2e5f21a7e0',NULL,NULL,'2023-12-08 16:29:54','2023-12-08 16:29:54'),(119,'honn09','honn09',119,'phannhatnamgiang2008@gmail.com',NULL,'$2y$10$u.84DSCH55ajHDcbBx1p9.cdFkdWSXb1ZuNpAQfIIwnA9AchOT/s2',0,'92b377cd-ed7a-4a58-a4b3-68992c4c4487',NULL,NULL,'2023-12-08 16:29:55','2023-12-08 16:29:55'),(120,'honn12','honn12',120,'phannhatnamgiang2011@gmail.com',NULL,'$2y$10$PCnxC2dqMW647OwVqgkJ9O27adySmhfITvJS9Q86YijA8Pk7WvWpO',0,'6cccae20-bfdb-432a-a8ef-b8937558c22a',NULL,NULL,'2023-12-08 16:31:41','2023-12-08 16:31:41'),(121,'honn11','honn11',121,'phannhatnamgiang2010@gmail.com',NULL,'$2y$10$rVCtLrZS03B6dD5tblw9eem1fWWL2YzmFJIsqzdTyE61BLKRYxrei',0,'20dd62b4-d946-4215-b62f-3d3891c32298',NULL,NULL,'2023-12-08 16:31:47','2023-12-08 16:31:47'),(122,'honn10','honn10',122,'phannhatnamgiang2009@gmail.com',NULL,'$2y$10$EnxCvfoL2.Y8X/QxYIwrJ.SKNMlblFNY8fSH70L8TNi2aKJSucZke',0,'7a568370-a563-4d06-93f3-8140c6b6dddf',NULL,NULL,'2023-12-08 16:31:52','2023-12-08 16:31:52'),(123,'sonwin1','sonwin1',123,'sonwin1@gmail.com',NULL,'$2y$10$nIYwaI.9xh9Ds5ogsfqlfuk1BLBZfrutic7mjZOdDajsy12ExNBGq',0,'dd7da5f7-2647-44d7-ae5b-6ee3780341ff',NULL,NULL,'2023-12-09 03:47:05','2023-12-09 03:47:05'),(124,'sonwin','sonwin',124,'sonwin@gmail.com',NULL,'$2y$10$JKiqw.Zxa1VEq8/JOBN5huzPAJalLcLEbDJLivSE1U4bNdh2879gC',0,'0b3bd604-7bcf-48ee-a62d-493570944c5c',NULL,NULL,'2023-12-09 03:49:03','2023-12-09 03:49:03'),(125,'sonwin2','sonwin2',125,'sonwin2@gmail.com',NULL,'$2y$10$0u9C4H7MdnnxNXAHozo2X.hi.4bhldUEmYwTMsjYEmSMgKBGgyivW',0,'d30e18b3-6bdc-4f5a-b14f-5cb9394bb265',NULL,NULL,'2023-12-09 03:49:18','2023-12-09 03:49:18'),(126,'sonwin3','sonwin3',126,'sonwin3@gmail.com',NULL,'$2y$10$DWs71yZqZFdI9UPzdvjXzuyL.goPKYUU/RPhpY1NhV0KftXS5Gmu.',0,'99d886b9-e384-4ec4-ad61-2f848568635f',NULL,NULL,'2023-12-09 03:49:34','2023-12-09 03:49:34'),(127,'sonwin4','sonwin4',127,'sonwin4@gmail.com',NULL,'$2y$10$Fq6QneKTX3DhjbTJsHWTQOFi324Mr/Hj/Dzyz5vWQnmJ/FvBYKLwG',0,'5c6c5981-8020-4289-bd4b-9d49dec3258b',NULL,NULL,'2023-12-09 03:49:51','2023-12-09 03:49:51'),(128,'sonwin5','sonwin5',128,'sonwin5@gmail.com',NULL,'$2y$10$E8tMmHefOf2aAgMMtWQQ3.BeL5bKhTK8gQ0UJ1eVyttexYl4/cTJK',0,'3a57cdff-2494-4664-aae9-014d73b339d0',NULL,NULL,'2023-12-09 03:50:09','2023-12-09 03:50:09'),(129,'sonwin6','sonwin6',129,'sonwin6@gmail.com',NULL,'$2y$10$yjv4U65DMlm0j2pp1LodB.om9ReHTakWoKgiqwdsiGlUycWVj4w4a',0,'855876a7-8573-42c5-993e-724e698878db',NULL,NULL,'2023-12-09 03:50:25','2023-12-09 03:50:25'),(130,'sonwin7','sonwin7',130,'sonwin7@gmail.com',NULL,'$2y$10$oUzo1UbGMZ8h6chtZ0AMu.BRZW38PiV5JDtF6dZwWTzQdjgqDSY3y',0,'4f9c6f72-3a9b-4f86-bdbb-b2b36915b91f',NULL,NULL,'2023-12-09 03:50:40','2023-12-09 03:50:40'),(131,'sonwin8','sonwin8',131,'sonwin8@gmail.com',NULL,'$2y$10$CPCEbMm6fL0I19bcmdsmE.FApGzeod367TT84Yi6lw1yKeEUTLKZO',0,'b15a68df-40f9-4cf6-b114-74d52b8da4c2',NULL,NULL,'2023-12-09 03:51:15','2023-12-09 03:51:15'),(132,'sonwin9','sonwin9',132,'sonwin9@gmail.com',NULL,'$2y$10$ZYW9BYXSxdS7s/7QiOfg3O/yjqIqM.DjUFZLr1737DqTc84bK2v/m',0,'177bae30-06d9-4584-9155-500155239b90',NULL,NULL,'2023-12-09 03:51:35','2023-12-09 03:51:35'),(133,'sonwin10','sonwin10',133,'sonwin10@gmail.com',NULL,'$2y$10$u8fGfGUuK8A3eWNIQEtCtehVgQIVmwjIsSeziYIrLIdrH7pq4ugVW',0,'6ddb57ed-5328-4934-89f6-f13b683f6616',NULL,NULL,'2023-12-09 03:51:50','2023-12-09 03:51:50'),(134,'sonwin11','sonwin11',134,'sonwin11@gmail.com',NULL,'$2y$10$xN8.FkKJTI8PtEFr9/6eHeCZL2Hlmq.kiOFuS8JPwGDpTHoPRrsOK',0,'a6c1386e-a2cc-4684-88ef-b0ac192848ca',NULL,NULL,'2023-12-09 03:52:06','2023-12-09 03:52:06'),(135,'sonwin12','sonwin12',135,'sonwin12@gmail.com',NULL,'$2y$10$SxIvAvx1xJTh/azxxkwmLOzNdJ.Ha1YsSG2pY8s2lT1kgpPTKmDdm',0,'6ef20f40-920e-49f5-9f3b-214fa75d0e30',NULL,NULL,'2023-12-09 03:52:33','2023-12-09 03:52:33'),(136,'sonwin13','sonwin13',136,'sonwin13@gmail.com',NULL,'$2y$10$R6K2vD7XklP4n0NaA8uZ.OKRgDG8.Tv45so5o4R7Zb61O5aJS8Qrq',0,'965027d5-3f8f-4834-807b-545fe071dafd',NULL,NULL,'2023-12-09 03:52:46','2023-12-09 03:52:46'),(137,'sonwin14','sonwin14',137,'sonwin14@gmail.com',NULL,'$2y$10$vPzhWPIqjWJRGtcpVEOjqOz0SjSgjISqem1v1UVzfBjoLqlo9WRl2',0,'c30bcb25-b9d9-47a5-974b-5d82357f6723',NULL,NULL,'2023-12-09 03:53:00','2023-12-09 03:53:00'),(138,'sonwin15','sonwin15',138,'sonwin15@gmail.com',NULL,'$2y$10$E4Xn5MPUcYfMg16uv9iCreTgsFnucokxWmqj53Y0N.qBwp3F/6aZO',0,'35d7ceed-bca2-496a-abb0-f1d1d328cbba',NULL,NULL,'2023-12-09 03:53:14','2023-12-09 03:53:14'),(139,'pgaruoi','pgaruoi',139,'pgaruoi1234@gmail.com',NULL,'$2y$10$/cc2hMib4mAo4nYewPGxmuI.Yww5jt4Xx5VEIWxkONairQjXimDkC',0,'72e46432-b09f-48b1-9d1c-e2fd187e5bbe',NULL,NULL,'2023-12-09 04:36:04','2023-12-09 04:36:04'),(140,'nguyenductoan','nguyenductoan',140,'toanmunmun@gmail.com',NULL,'$2y$10$AhCcwuPDbilB55USE8WWgeJjXYqyEmRYis.6tPULijFuODw/I2YDS',0,'9988c798-15bb-4904-a432-60a5b22e2b56',NULL,NULL,'2023-12-09 04:48:58','2023-12-09 04:48:58'),(141,'levantuy1','levantuy1',141,'levantuy123@gmail.com',NULL,'$2y$10$zZXEmtKTtGBMUGBxAs5H3O2P7OpUNobS2cTJAgIum3PV/iBBK35Zu',0,'1efdd60a-d779-4e3b-9aed-e86484f15152',NULL,NULL,'2023-12-09 04:50:23','2023-12-09 04:50:23'),(142,'nguyenhaphuong','nguyenhaphuong',142,'nguyenhaphuong@gmail.com',NULL,'$2y$10$bVxsDW25hEwYxOaIDin.KewF6.dN4EN0gY8xjdPI27jSmMN88Nv1e',0,'9778fece-9256-4375-8189-274c4154bb28',NULL,NULL,'2023-12-09 05:10:06','2023-12-09 05:10:06'),(143,'nguyenductoan1','nguyenductoan1',143,'nguyenductoan01@gmail.com',NULL,'$2y$10$fRgg1jFtT9R/zdZ8.ZACu.FP3q3Enq.7DSGardf2k72IEaIXtbYyq',0,'74692adb-947d-4f75-85b8-75701cf4bdce',NULL,NULL,'2023-12-09 05:10:45','2023-12-09 05:10:45'),(144,'pgaruoi1','pgaruoi1',144,'kskasasl@gamail.com',NULL,'$2y$10$7LQ7YuW0fwy5VK7p0hY7pOjewXX83uGzHV5Joo6JK7SiZZyHPwXUC',0,'55f14099-9afc-42d1-8d4b-47a77bdf5408',NULL,NULL,'2023-12-09 05:51:26','2023-12-09 05:51:26'),(145,'thang9','thang9',145,'thang9@gmail.com',NULL,'$2y$10$S.8LWpwt7.ZDpJuogqq3OuYD4N7JU24VKiLmgyftytJ4BqeFGF1qO',0,'8767ad70-2a70-4b71-a82b-1fa88a6f4044',NULL,NULL,'2023-12-09 07:22:45','2023-12-09 07:22:45'),(146,'thang10','thang10',146,'thang10@gmail.com',NULL,'$2y$10$w3qvOD3MJzjrf7/ywizBi.DT3X08/RBwmwClXYnaU4tRGwXbJKQZe',0,'6da6351a-daae-45ed-93fe-350f76122a39',NULL,NULL,'2023-12-09 07:23:22','2023-12-09 07:23:22'),(147,'thang11','thang11',147,'thang11@gmail.com',NULL,'$2y$10$PZAcnMXVZ02338sf8JPBfO1LsRRLhbPaX0c4W6FYFJDUGYqSMe/CW',0,'05fef192-88bc-4a0e-9561-9650e9318471',NULL,NULL,'2023-12-09 07:23:45','2023-12-09 07:23:45'),(148,'20091994','20091994',148,'tnnguyen4dat94@gmail.com',NULL,'$2y$10$UIcjyIt.VYMWHWreRTP13e.YNTSJ74B6URMF1Z.yRP0U7iHgyP9lq',0,'8f80694c-1aa9-4efb-ab45-6750d2fd0192',NULL,NULL,'2023-12-09 09:07:28','2023-12-09 09:07:28'),(149,'20091995','20091995',149,'tnnguyen4da5t94@gmail.com',NULL,'$2y$10$kAdVRAaJH1wyQ.UEs1oLxuFS2wmFeFL6heAo6RXe0uDoEaegd7U1y',0,'11071df0-3101-4d84-b83e-329a58213f7a',NULL,NULL,'2023-12-09 09:08:16','2023-12-09 09:08:16'),(150,'hungde3','hungde3',150,'12345@yahoo.com',NULL,'$2y$10$ASDcyLzsaHF5IARlM7szFutAVippxbyVuKlgxnPawGUvq8KJYHBwS',0,'b03e7645-d5d7-48e3-8fba-b508c8c3bbdb',NULL,NULL,'2023-12-09 09:10:45','2023-12-09 09:10:45'),(151,'20091996','20091996',151,'tnnguyen4datf94@gmail.com',NULL,'$2y$10$AaRCkSCNJhpSq2WuEBaKqukalk80b4EAKnK8rw1tYXmVmGZ7x2dtW',0,'984a938d-49ab-42cf-8275-d5c5f55784fe',NULL,NULL,'2023-12-09 09:10:49','2023-12-09 09:10:49'),(152,'hungde4','hungde4',152,'1234@yahoo.com.vn',NULL,'$2y$10$LdptiuWKv7u/S8q1pXaNvOmVe5IyTSrvfaei9tEUBmFj3MHhtNh.u',0,'053b9104-0e0f-4ef0-83ee-cd32ad7dc1cf',NULL,NULL,'2023-12-09 09:11:52','2023-12-09 09:11:52'),(153,'hungde5','hungde5',153,'1234567@yahoo.com.vn',NULL,'$2y$10$gB9A8D6BIYnzOP6RNc6IbuRbJBzH.Z/mo.oHuFVg4UPCaiAKHxa3G',0,'61c41e67-51c0-48b4-baea-554c0bf7ac08',NULL,NULL,'2023-12-09 09:13:09','2023-12-09 09:13:09'),(154,'20091997','20091997',154,'tnnguyen4rda5t94@gmail.com',NULL,'$2y$10$KfaU2aKldayUjHj8Pa9tq.28eBQ7On3RXznzZPu1pfN.4lG8l1mz2',0,'64ab2dcc-9581-4446-b6b6-bcc31cfef013',NULL,NULL,'2023-12-09 09:17:18','2023-12-09 09:17:18'),(155,'20091998','20091998',155,'tnnguyen4da8tf94@gmail.com',NULL,'$2y$10$266y8ZEeNYR28PuaVqUe/ehiFum6xAYp/dEU3PwmFiX0vt95nFE9e',0,'ecd297cf-bbbc-490b-ae92-40f0308f39e2',NULL,NULL,'2023-12-09 09:17:51','2023-12-09 09:17:51'),(156,'20091999','20091999',156,'tnnguyenda9t94@gmail.com',NULL,'$2y$10$9YMeqOPl/D3fYxaAL5a/zeAK/toRVxDbfPT1yCrt5hSiXoUSCwUkC',0,'7a9729e4-d315-41d9-b8ae-b215eb6c9e9c',NULL,NULL,'2023-12-09 09:18:33','2023-12-09 09:18:33'),(157,'hungde6','hungde6',157,'132@yahoo.com',NULL,'$2y$10$L5IbRISAdefwqEMMx3Qh9uJwBG2JeLBLH1LinEbuVTB9JhgdlyzvG',0,'864b6025-0a21-4123-9410-12ab87c45b42',NULL,NULL,'2023-12-09 09:19:16','2023-12-09 09:19:16'),(158,'200919911','200919911',158,'tnnguyen4dat9114@gmail.com',NULL,'$2y$10$9TfHBOWBobxuCH7vlT0l8.3d0DrQlXB4kGHx1MHUm9jgPrgqjCZ.O',0,'c5da9a7c-1f2b-4466-aade-606cc9a2a9c0',NULL,NULL,'2023-12-09 09:19:32','2023-12-09 09:19:32'),(159,'hungde7','hungde7',159,'134@yahoo.com',NULL,'$2y$10$2XwC1KoaeVTZs8C8ovpf6.SRGLoV3pkB2dRhEFiP1tmPyQFM6m4i.',0,'60a6ce4e-bfa0-4212-bc33-b05dc35ea80f',NULL,NULL,'2023-12-09 09:20:02','2023-12-09 09:20:02'),(160,'200919912','200919912',160,'tnnguyen4da12t94@gmail.com',NULL,'$2y$10$RPekLbEuwxcx9U.1t1hlteNl9m1BDjCGdgkH.FTfaleSFnX5FP1Me',0,'af229b6b-6e50-45bb-bf60-76d473032db8',NULL,NULL,'2023-12-09 09:20:04','2023-12-09 09:20:04'),(161,'hungde8','hungde8',161,'135@yahoo.com',NULL,'$2y$10$BrSMjluGS9tc9NgjrgIzGOST0T5.R5XsnklPlki/YMpd6nHeyNZyC',0,'cd88eb64-eb17-436c-82df-aa215400e14b',NULL,NULL,'2023-12-09 09:20:36','2023-12-09 09:20:36'),(162,'20091990','20091990',162,'tnnguyen4d0a8tf94@gmail.com',NULL,'$2y$10$cEnrYqwPBoVMvbt.L8xnsO/fkk3NNV9zF0m3ctzURrXcfiTa7hTdC',0,'2fe629d8-f0cc-4fb3-b511-130905f75e39',NULL,NULL,'2023-12-09 09:25:20','2023-12-09 09:25:20'),(163,'200919910','200919910',163,'tnnguyen4d10a8tf94@gmail.com',NULL,'$2y$10$CTEYZcWIfVmG8TB9uw0WXun1yB3VHoZUl.inhuOoDceIm4e5drh4O',0,'163f5ba7-b652-4ac8-8f89-7971333d39cd',NULL,NULL,'2023-12-09 10:33:48','2023-12-09 10:33:48'),(164,'baoansro','baoansro',164,'hbien867@gmail.com',NULL,'$2y$10$V8H79mgVDphrm4140Ou8IuRClcioOIvrSW7Ar7tI.iimlIkjZJQZa',0,'35320ef8-374b-4a02-826a-50d52dc8de73',NULL,NULL,'2023-12-09 11:12:19','2023-12-09 11:12:19'),(165,'thangno1','thangno1',165,'buithangchannel@gmail.com',NULL,'$2y$10$pVtMYrrSBlIj.lX7cPRYguz7b6aNMlanuhZYE0DShRy2XmuZpyA6i',0,'03318cec-2eb2-4b2c-adbf-11b86ec0a249',NULL,NULL,'2023-12-09 12:18:00','2023-12-09 12:18:00'),(166,'thangno2','thangno2',166,'buithangchannel2@gmail.com',NULL,'$2y$10$hJdfQOuf86pF0wkVpJCjK.1dwK1693TqzB1MISbm/nCRWohS9t0ku',0,'5f7f9ff6-1b7f-4bc7-9fe2-45e76263a500',NULL,NULL,'2023-12-09 12:18:53','2023-12-09 12:18:53'),(167,'thangno3','thangno3',167,'buithangchannel3@gmail.com',NULL,'$2y$10$0BOCDqQ07bh7H/KvKeCLCu/RL5J1iaY0xf1HxKLIeSqfWJFqcTJZ.',0,'b9cb6acc-5e68-494e-b227-fe54b6e67631',NULL,NULL,'2023-12-09 12:19:23','2023-12-09 12:19:23'),(168,'thangno4','thangno4',168,'buithangchannel4@gmail.com',NULL,'$2y$10$AWwqi3UhGmUAtjdb3Mh37.UxOLl1mceT3UhOYIgHLR8cY22nhk/7q',0,'3cb3874a-f74c-4a3b-bee9-826c82534ad5',NULL,NULL,'2023-12-09 12:19:56','2023-12-09 12:19:56'),(169,'thangno5','thangno5',169,'buithangchannel5@gmail.com',NULL,'$2y$10$C5GpW02BR86OMXHSHvAm0e/iE3d.R6qos518iJ5A/LOs7wXm5cBzm',0,'5cc320b0-a158-4b27-a7f5-2eff3ff11390',NULL,NULL,'2023-12-09 12:20:22','2023-12-09 12:20:22'),(170,'thangno6','thangno6',170,'buithangchannel6@gmail.com',NULL,'$2y$10$nvT8/xEbsOBcShAvlJgC5urOH3HsfYJWDnUMKxNM7a.Km8c.XxSpq',0,'a6475ccb-6744-4435-88cb-b72ad808410e',NULL,NULL,'2023-12-09 12:20:47','2023-12-09 12:20:47'),(171,'thangno7','thangno7',171,'buithangchannel7@gmail.com',NULL,'$2y$10$hccpBTRuzw9zZIVYGfdCH.w4TNc0dUS7.9pAljv1OS2NQZDaWS88C',0,'63bb1df0-1608-41d9-ba76-e43b3fc41b05',NULL,NULL,'2023-12-09 12:21:14','2023-12-09 12:21:14'),(172,'1srovo','1srovo',172,'13232212121djjd@email.com.vn',NULL,'$2y$10$5TkS8wOgD/JHnCwdPw52WePldjnjFZBuNPizR5c9rmylMwvuPG2rS',0,'15e33034-dc6d-47d4-8c86-a51e383e88ad',NULL,NULL,'2023-12-09 13:18:42','2023-12-09 13:18:42'),(173,'vivo11','vivo11',173,'ekulv111@gmail.com',NULL,'$2y$10$XpDgjnHeOPNzyCISrEaj0uerFxfgBp3DsUixNsuaVUxB.cRD1eeqm',0,'8757d43f-62e6-4a8f-8cb3-e4b12d9a31d9',NULL,NULL,'2023-12-10 10:51:07','2023-12-10 10:51:07'),(174,'leanhkhoa1','leanhkhoa1',174,'leanhkhoa1@gmail.com',NULL,'$2y$10$iXmReQ6MQQewUmtdBM7gL.bRntElcfz/T2bQxoW9.I6IyNLQt/eOK',0,'ea500e61-bc12-4d9b-81a6-9c0eb7eebcce',NULL,NULL,'2023-12-10 13:33:14','2023-12-10 13:33:14'),(175,'trex89','trex89',176,'trex89@mail.com',NULL,'$2y$10$Y9Bry7vzdn6JYLS70hptEetcNbWoQkOtJ3XxxQVV0JGzQ4wx1jRGe',0,'44e004a2-d551-4098-bb39-82652a8b1361',NULL,NULL,'2023-12-10 18:21:41','2023-12-10 18:21:41'),(176,'longthanh','longthanh',177,'dsghgdsjhdfjfhsdj@gmail.com',NULL,'$2y$10$FSWStSV9etFgx5lQebkgye5an4lILfhBIf1MQjujzVUcAExjJOdGG',0,'0a95b384-4aba-48ab-90ee-63f7105941a5',NULL,NULL,'2023-12-11 03:40:06','2023-12-11 03:40:06'),(177,'sonzenbi','sonzenbi',178,'sonzenbi2@gmail.com',NULL,'$2y$10$pjFgntEyFPyon1Z/B8UCyO0MN3JR4dXpmB.zNotgIAjvYQYZsLfiO',0,'0dfc54a6-8c54-490d-a62a-f2a5cdefdc2c',NULL,NULL,'2023-12-11 05:41:54','2023-12-11 05:41:54'),(178,'sonzenbi2','sonzenbi2',179,'sonzenbi3@gmail.com',NULL,'$2y$10$8bB2frJ84bOjZfPle3lHBuLRuFd.Ae7.ItjlDJ2Mv5ht3Crhcp6bW',0,'390b44c3-6fa1-4ba2-9e1d-c1e046c30888',NULL,NULL,'2023-12-11 06:22:56','2023-12-11 06:22:56'),(179,'baoduy2015','baoduy2015',180,'vuongtrieumahan21@gmail.com',NULL,'$2y$10$AFzhpSeemNj6PluoQFKWrOsOijnqvWozmyXe55VhQwo/.4bxL1SSi',0,'a57bd57a-a1ae-4df3-9841-ccc6aab1faaf',NULL,NULL,'2023-12-11 07:27:13','2023-12-11 07:27:13'),(180,'lupanh','lupanh',181,'lupanh.riot@gmail.com',NULL,'$2y$10$B.KUI3SIQsP4DSP1xnFpeuGQLb3V4OBOEeJuj.MKvGZy2FtzKNCD.',0,'031ba8b5-5c2d-4ec9-bcb7-aeb9af52ca3e',NULL,NULL,'2023-12-11 15:50:06','2023-12-11 15:50:06'),(181,'hungde9','hungde9',182,'137@yahoo.com',NULL,'$2y$10$Mov8/hMriTQF/8MtYx8duuFMZBOIESCrpRn1VgRR3NtkNBnaQFRIW',0,'c16349f7-e2fc-472d-a53d-826097620a03',NULL,NULL,'2023-12-11 16:58:13','2023-12-11 16:58:13'),(182,'hehesro1','hehesro1',183,'hehesro1@gmail.com',NULL,'$2y$10$T0UNdXupThZ4FBVlSPkB4eQ1W4gRVwCN1kNftYFUDHFPvNpYE9tGy',0,'07ea6019-0541-4107-8db4-e29328d64e67',NULL,NULL,'2023-12-12 08:26:50','2023-12-12 08:26:50'),(183,'anhkuno1','anhkuno1',184,'tradathuocla16@gmail.com',NULL,'$2y$10$e9777UU80LD.wQXzn.BonuLkSzSkqV8BhAXzVSEQgpyBNuIsJI7ai',0,'542bbac8-db47-42a8-817d-44e1d4878740',NULL,NULL,'2023-12-12 09:11:35','2023-12-12 09:11:35'),(184,'leanhkhoa2','leanhkhoa2',185,'levantuy2@gmail.com',NULL,'$2y$10$P0wZ3eQMADqWuXqQE52VC.ifxWQpVH8wFWh37CTSnlVS6vM.ObLUC',0,'35302384-1d9e-42a7-a580-2e60fb377b74',NULL,NULL,'2023-12-12 11:38:12','2023-12-12 11:38:12'),(185,'leanhkhoa3','leanhkhoa3',186,'levantuy3@gmail.com',NULL,'$2y$10$CVj4nmTYb1XDMZz7eXfHS.2mYOTniC1bL.ucQE0ccuPIuGlQkBBK6',0,'8fdd7604-d4e6-4e8e-af7f-fbd00a3bb286',NULL,NULL,'2023-12-12 11:44:21','2023-12-12 11:44:21'),(186,'leanhkhoa4','leanhkhoa4',187,'levantuy4@gmail.com',NULL,'$2y$10$eoFS2vmXtoo1h6Ok.fsiY.OLX7jAvTDPUMqKYX9MKKHsadLXFdZu6',0,'ae512d03-453d-466a-82ee-cd60cc3e8cb4',NULL,NULL,'2023-12-12 11:46:24','2023-12-12 11:46:24'),(187,'leanhkhoa5','leanhkhoa5',188,'levantuy5@gmail.com',NULL,'$2y$10$2c/8FOoc/wLoNXV15yzsyuzSlbBxmD9BczJfQZmrZ13j9XD1EGdwO',0,'bf52de8b-db2e-4011-a4e7-ce8474c2032b',NULL,NULL,'2023-12-12 12:07:16','2023-12-12 12:07:16'),(188,'leanhkhoa6','leanhkhoa6',189,'levantuy6@gmail.com',NULL,'$2y$10$0BQywYz9fQfy0iTlVpDRqeFntksnsp3tC4jDyqqmn0GJGviq.fjGO',0,'f15d2b41-e261-4ac2-a6d6-91689ab8a8da',NULL,NULL,'2023-12-12 12:08:09','2023-12-12 12:08:09'),(189,'leanhkhoa7','leanhkhoa7',190,'levantuy7@gmail.com',NULL,'$2y$10$QCSZZmhrf2p86lcyvBjXQe1mv6H73JZlCHls7l36dZ3nmlQCkjai2',0,'a970ef28-6524-438f-b47d-0982da77503d',NULL,NULL,'2023-12-12 12:08:42','2023-12-12 12:08:42'),(190,'leanhkhoa8','leanhkhoa8',191,'levantuy8@gmail.com',NULL,'$2y$10$3ImsrE9XJRhPxkY/8wVVbudU5aXBIRyI/ekXHeE8QGVhz61ICoZTm',0,'19913921-0048-4276-ab07-a251a35a4c90',NULL,NULL,'2023-12-12 12:09:18','2023-12-12 12:09:18'),(191,'fulltrue1','fulltrue1',192,'vanuoc9@gmail.com',NULL,'$2y$10$QiHWA7tANjPTmbzvvb6iCOwEbLaiXg5Tpr4zQXnWAjngsR3Y07hnm',0,'81b87206-116f-49d9-abe7-cf61404516a3',NULL,NULL,'2023-12-12 12:43:38','2023-12-12 12:43:38'),(192,'wallentime01','wallentime01',193,'wallentime01@yahoo.com.vn',NULL,'$2y$10$5I/xSvewjELiEJvr6yvXS.p1MjnDlCPYjohEF.J0WUAiZXr5DZ3Mi',0,'2796be51-6b22-47f2-8c67-61a54f4ee0d4',NULL,NULL,'2023-12-12 16:19:27','2023-12-12 16:19:27'),(193,'wallentime02','wallentime02',194,'wallentime02@yahoo.com.vn',NULL,'$2y$10$ESaPANdKnna41cWCxA3haei0sh9bBCVRHHEF04CjB2ziNe9nDH9hC',0,'22ec2003-008a-4427-907a-f43736b731b2',NULL,NULL,'2023-12-12 16:19:49','2023-12-12 16:19:49'),(194,'wallentime03','wallentime03',195,'wallentime03@yahoo.com.vn',NULL,'$2y$10$Z8aXL4tE12PE.yQjjbF00erF/Z2GECFwR9KEgOkt7x/YrkQD7Pg16',0,'8d767202-62ea-46bf-8be3-a6287616ae4e',NULL,NULL,'2023-12-12 16:20:11','2023-12-12 16:20:11'),(195,'wallentime04','wallentime04',196,'wallentime04@yahoo.com.vn',NULL,'$2y$10$8JhAwNeHPwDRvW6xR0eLPOVcpcEneTuUhTJO/EuN4sHefvkg2D3c.',0,'410b9b68-de9b-4f79-9186-ebcf6e860459',NULL,NULL,'2023-12-12 16:20:31','2023-12-12 16:20:31'),(196,'wallentime05','wallentime05',197,'wallentime05@yahoo.com.vn',NULL,'$2y$10$UZvDtWwsEsbaM2dWAdOubu3hEeCWJQQE4W7MJc3RgX7oXYuZxW60O',0,'78be0ced-999b-4d2d-9d48-66daf4880772',NULL,NULL,'2023-12-12 16:20:52','2023-12-12 16:20:52'),(197,'wallentime06','wallentime06',198,'wallentime06@yahoo.com.vn',NULL,'$2y$10$ZXP3EFKe.DeyWf4GClxmSefM2PwfQnZiJx4KT5rvfy3Z6fuAbxrIq',0,'b2c0eaf7-2b23-4bca-8b0f-7a28bbc547c5',NULL,NULL,'2023-12-12 16:21:13','2023-12-12 16:21:13'),(198,'wallentime07','wallentime07',199,'wallentime07@yahoo.com.vn',NULL,'$2y$10$X1sC0VKTX0sJEflcw.49rOpGKQfN1cjgNhzpqgMKeuCo9RSONIAH6',0,'b63fe862-fbc2-4765-9878-a9a0a9bbad57',NULL,NULL,'2023-12-12 16:21:32','2023-12-12 16:21:32'),(199,'wallentime08','wallentime08',200,'wallentime08@yahoo.com.vn',NULL,'$2y$10$ManoVhP1yGdWD3wFOu1z3O3E1SMat2g.zz4qsSRt5PMglHsq5Y7Py',0,'ca89b56e-e9f7-43ab-8e36-bc343bb21438',NULL,NULL,'2023-12-12 16:21:50','2023-12-12 16:21:50'),(200,'wallentime09','wallentime09',201,'wallentime09@yahoo.com.vn',NULL,'$2y$10$ayC//gwTOTMDP.DHzlNA8uq.ls4PKsN8x3090A3SScqASq6RYBQnW',0,'c7230f02-4e2b-44f0-b807-c269ecb7dc07',NULL,NULL,'2023-12-12 16:22:15','2023-12-12 16:22:15'),(201,'wallentime10','wallentime10',202,'wallentime10@yahoo.com.vn',NULL,'$2y$10$IcH3YlbVkd6kAN.X/5Bqmu1gIDGoGlCIN58CtbmebnUEc9pY8PU4G',0,'75e0cce0-ce7f-40e4-9af5-a6ce146883cc',NULL,NULL,'2023-12-12 16:22:35','2023-12-12 16:22:35'),(202,'wallentime11','wallentime11',203,'wallentime11@yahoo.com.vn',NULL,'$2y$10$9dhU3/qg65pVmO04bSHO4ePr5rmx.IrtnOLGtIKHtvSTeoUkZdN/.',0,'6ac440bf-dbe7-4cfd-aaa8-eb6080f00299',NULL,NULL,'2023-12-12 16:22:52','2023-12-12 16:22:52'),(203,'wallentime12','wallentime12',204,'wallentime12@yahoo.com.vn',NULL,'$2y$10$fCVm/h2G2gGKxtI5/ozsKu.SNFDg3Ez1mzFLNihSeCnStrgs9V9ly',0,'d443e534-848f-4c98-9382-06674e5f9239',NULL,NULL,'2023-12-12 16:23:09','2023-12-12 16:23:09'),(204,'mrquy111','mrquy111',205,'quyphuchung18@gmail.com',NULL,'$2y$10$nu5gH.9S3bAStOZ/Wq97W.7sioBGhhPlMgS7mRU0qWb5iEBpOrFuW',0,'2fbe60c5-b2a9-44cc-a8a6-773a5ad13bfa',NULL,NULL,'2023-12-13 01:19:42','2023-12-13 01:19:42'),(205,'mrquy112','mrquy112',206,'buiquy1994@gmail.com',NULL,'$2y$10$cDXnu3TOCd7ZHMztFVgOOO4stgHevFjMx5A1qwf3yn8A2K5NndZRm',0,'03d58f42-c19b-4b05-8f8e-c80b1c936780',NULL,NULL,'2023-12-13 01:20:48','2023-12-13 01:20:48'),(206,'nophan1','nophan1',207,'flagsfha@gmail.com',NULL,'$2y$10$YWiH1VsOs9Au7NrfnkjTPuwETKtx0YuE7/49EnfzitE6CQrpO/mJi',0,'0dffd2ef-3b59-433a-aa7c-dc58daa2048d',NULL,NULL,'2023-12-13 10:57:42','2023-12-13 10:57:42'),(207,'nophan2','nophan2',208,'asklfhasfjkh@gamil.com',NULL,'$2y$10$6o88JQgnHBF0YjtMU6t8aeoOV65Xio9UKoCGCQuQphd3nkiyaAxlG',0,'ce4297ba-c980-4a8c-924a-8da995f97840',NULL,NULL,'2023-12-13 10:58:05','2023-12-13 10:58:05'),(208,'nophan3','nophan3',209,'asklfhgasfjkh@gamil.com',NULL,'$2y$10$jtl0kRQZ92abww37z5LI8OZ2Fuo8PbZiHMSYmAUrH0dk7Q6eoq.uK',0,'6841883a-6253-4296-8259-792bdf056877',NULL,NULL,'2023-12-13 10:58:39','2023-12-13 10:58:39'),(209,'nophan4','nophan4',210,'asklfhgdasfjkh@gamil.com',NULL,'$2y$10$2D/CsbWISnkzz07s3/4yE.ZvLvFWBa99EDQzgGwN.vjypE2QGK5am',0,'bc56ecaa-5a25-4aa4-aaea-651576733eda',NULL,NULL,'2023-12-13 10:59:02','2023-12-13 10:59:02'),(210,'nophan5','nophan5',211,'asklfhafsgfjdkh@gamil.com',NULL,'$2y$10$Z2s9M6CmBN08SgZjIIjod.YmSuv0MQfcp1z37QnaOsBK6yYBJRwQq',0,'d2ac8323-ca06-4bb8-ba47-c5d99fef10f0',NULL,NULL,'2023-12-13 11:00:38','2023-12-13 11:00:38'),(211,'nophan7','nophan7',212,'asklhfhdasfjkh@gamil.com',NULL,'$2y$10$GlR2fPkCzXQle2NdODXgruxEEriqWDJxa3X0FKaZ.jAI6BrFkB/CC',0,'95f90b34-8a5e-4962-9a89-26dd8785406d',NULL,NULL,'2023-12-13 11:01:31','2023-12-13 11:01:31'),(212,'nophan8','nophan8',213,'asjjklfhgdasfjkh@gamil.com',NULL,'$2y$10$LWm2FCldQogTvq.Q8dCj/ehegeRgvcelrdE3I13GrWzoobDN74li.',0,'71163fd7-ace6-4572-a392-46fc80a435f2',NULL,NULL,'2023-12-13 11:01:57','2023-12-13 11:01:57'),(213,'nophan9','nophan9',214,'asklfhafsfjdkh@gamil.com',NULL,'$2y$10$esjakf4r3/CqEQExNONEZuYPxbRMAr4JBQzfdEud50KTPBKMLkJU.',0,'dd2c0e0a-a1d8-4c65-bc79-6d66f2e74646',NULL,NULL,'2023-12-13 11:05:19','2023-12-13 11:05:19'),(214,'nophan10','nophan10',215,'asklfhafsfjkh@gamil.com',NULL,'$2y$10$GR35MRZOp9tad8D9uywyRuHzvO/k5YcjgP38IPbyPVQp0RuOHFzky',0,'8cf65117-78e7-4b80-acbe-1f9bf31e5e86',NULL,NULL,'2023-12-13 11:05:39','2023-12-13 11:05:39'),(215,'hungtrason','hungtrason',216,'tavanvuong1993vn@yahoo.com',NULL,'$2y$10$mnO8Gov2uRUDDOvZw6JI9epb54yEQEfDgUItLkDMUN.0XfMFKRwwu',0,'b2b764b4-c5a8-44aa-a5d9-5ad66bce8c65',NULL,NULL,'2023-12-13 11:47:35','2023-12-13 11:47:35'),(216,'hantn','hantn',217,'abbc@gmail.com',NULL,'$2y$10$v/jiZVmnNOI3.Gjip5Zq0uj7b1xXlJ4ksIB/sSfeipbYUD35nLJbG',0,'a3f29c4a-2882-4981-b93f-fac7901115fa',NULL,NULL,'2023-12-14 01:31:56','2023-12-14 01:31:56'),(217,'hantn1','hantn1',218,'abbqc@gmail.com',NULL,'$2y$10$ho9FAvzRoyw8NMGCaS6JvOROH6BVRiDaC6zrOAYgFyDiA8r8T4Wxq',0,'06ebd448-0b3c-4d2f-9c84-76f123b654e8',NULL,NULL,'2023-12-14 01:33:17','2023-12-14 01:33:17'),(218,'hantn2','hantn2',219,'asds@gmail.com',NULL,'$2y$10$2jh2p7l4o/zWAf5dRpBrP.Qa84cMx63BltKw3xucmocZButlrAEa2',0,'1ab80f68-607c-41af-81e2-868546e2cd17',NULL,NULL,'2023-12-14 01:34:25','2023-12-14 01:34:25'),(219,'hantn3','hantn3',220,'abacac@gmail.com',NULL,'$2y$10$XCGr8UWToOSf5sBwb9Ua5.1ziwdkG/jCf.p59Ga0omiptxIeYoZV2',0,'7e55d539-8d9d-4421-8217-0cf96fa8f212',NULL,NULL,'2023-12-14 01:34:57','2023-12-14 01:34:57'),(220,'hantn4','hantn4',221,'aabbsc@gmail.com',NULL,'$2y$10$RwgVbdbVFQrpe9Fi5nHRsuaLsS2Ok6bd.b57z1CZwMA2cvBmPgBVO',0,'e1b30ce1-7775-4be9-893e-7c5e14340656',NULL,NULL,'2023-12-14 01:35:24','2023-12-14 01:35:24'),(221,'hantn5','hantn5',222,'aabc1@gmail.com',NULL,'$2y$10$BQby2OQb7ONh9.nhz7in3ObVCdlF7xNTG9zdbGlmzjhAAYL6m/M5W',0,'ca5dbf15-6eee-49ba-a1bc-8b0bffaab035',NULL,NULL,'2023-12-14 01:35:52','2023-12-14 01:35:52'),(222,'hantn6','hantn6',223,'abaca1c@gmail.com',NULL,'$2y$10$7r4bvjwt8kauncWFdR32C.kR4M9iDkjdVYKcsB7py09qC4jk232sa',0,'6dc6c087-af46-42dd-8a3a-71143db0fa3f',NULL,NULL,'2023-12-14 01:36:50','2023-12-14 01:36:50'),(223,'hantn7','hantn7',224,'aabbsac@gmail.com',NULL,'$2y$10$uIqbBarRT4PophL48X.JK.s/6Y0a5lUL5BLnV.vxeStNEil6kH14O',0,'aef9a98d-64ec-4799-80db-ec71db183e9e',NULL,NULL,'2023-12-14 01:37:23','2023-12-14 01:37:23'),(224,'hantn8','hantn8',225,'absabc@gmail.com',NULL,'$2y$10$0CxxyUirNs6FJokiwa8s..4ocIwAKI9UrFN0jW8WVYGPhhvnLk8Oy',0,'0c168049-b84b-42bb-a247-b5bd992c03da',NULL,NULL,'2023-12-14 01:37:52','2023-12-14 01:37:52'),(225,'changnho','changnho',226,'nth0976843950@gmail.com',NULL,'$2y$10$9Nbf3Gf6..bQ1HKTE/ycTuKy1aMM5RFU/rbCCYrtxBdl3pOSdvMES',0,'09a02852-bece-4413-9580-1d6dc3a1b71f',NULL,NULL,'2023-12-14 02:59:15','2023-12-14 02:59:15'),(226,'mrquy113','mrquy113',227,'buiquy1997@gmail.com',NULL,'$2y$10$QsaRkcR6Y9e5DNiakCXk/OZ50zF.oHqVPg9uWKdSuPK78GPQAq/ky',0,'9eedb05b-25b0-4e01-8bf7-00a46cf3268d',NULL,NULL,'2023-12-14 09:05:14','2023-12-14 09:05:14'),(227,'lnanh2','lnanh2',228,'lnanh020192@gmail.com',NULL,'$2y$10$3L7aTZ1eT/yp1hPbxdvDuuhJrGQ8LsS1AHzzM1nu2lsZRg2mtjJ.e',0,'e4640b64-6d45-4457-a12e-15cfe99d86ed',NULL,NULL,'2023-12-14 14:30:27','2023-12-14 14:30:27'),(228,'cocacola1','cocacola1',229,'tuanmax98@gmail.com',NULL,'$2y$10$07v3G1CismSohmp6KnEKOeKVpljC52mhXQXI2UQSa/Dam0k9Bslky',0,'b7837cce-affd-4712-9c80-07e3cd29e415',NULL,NULL,'2023-12-14 16:13:32','2023-12-14 16:13:32'),(229,'denladon','denladon',230,'hieuviplb@gmail.com',NULL,'$2y$10$KzwFElPcvNfq3RVU65mhree2KqSd69SAJTYS9nXgoYyH/eati4EYu',0,'65b0e77b-7bfd-4e8c-bcc0-f453f1f420bf',NULL,NULL,'2023-12-14 23:51:22','2023-12-14 23:51:22'),(230,'anhluongbg1','anhluongbg1',231,'quangluongleon@gmail.com',NULL,'$2y$10$P6nZPwMWiL0MrXVaGIHyK.zLlUGudpvcuP.lIKB4yqMPDvvOc3che',0,'efb48c6a-486b-4c3e-9f7f-07ba734d0a93',NULL,NULL,'2023-12-15 01:43:13','2023-12-15 01:43:13'),(231,'khuay1','khuay1',232,'abu2232@gmail.com',NULL,'$2y$10$Vye/ZK1dt33rcntPzOHjie8hqnk5cAYyU3/tlX4JUuBx4Nw7CtHke',0,'e2ab3611-235f-4495-b3f4-67bc401642bc',NULL,NULL,'2023-12-15 04:00:05','2023-12-15 04:00:05'),(232,'tho123','tho123',233,'bocubon05@gmail.com',NULL,'$2y$10$igRr.gQ.xRrPGVlADPuKDuZM0oiM4cS6pAllHDlYHVKife3xSqHy6',0,'19e59d9c-bb21-4055-859d-f249dba2e5b5',NULL,NULL,'2023-12-15 05:38:20','2023-12-15 05:38:20'),(233,'chinh891','chinh891',234,'nguyenvanchjnh19891991@gmail.com',NULL,'$2y$10$yjTdaytILem6IYEZ.2wZe.gB3mwPpy/cEFjGSVnCS.Pv9CulIxxti',0,'0c75913c-6b07-4d7c-8d3d-c5e72515a17b',NULL,NULL,'2023-12-15 06:04:56','2023-12-15 06:04:56'),(234,'chinh892','chinh892',235,'nguyenvanchjnh1989@gmail.com',NULL,'$2y$10$JaGeokk2RfU4jmoE0ZDhEefmdQnce08JuKUy2xZbYWkRltGyR1PU6',0,'13327fa2-5927-419b-aa3a-89bfb5cec506',NULL,NULL,'2023-12-15 06:08:33','2023-12-15 06:08:33'),(235,'cubuoils1','cubuoils1',236,'tieutudaigia_bn9x@yahoo.com',NULL,'$2y$10$Dg8oUTyMLTTcn0K61S958Oo0MXZA0x2xqohuxC9yHioDHogfKQnr.',0,'a2e3e584-b4bf-4280-9c85-b7ec89004ce4',NULL,NULL,'2023-12-15 06:19:51','2023-12-15 06:19:51'),(236,'cubuoils2','cubuoils2',237,'tehcgmfdgm34sdf@yahoo.com',NULL,'$2y$10$ZOe5ioYlbTMdxYzvvWhp1er9NhL7eiXRyCrSXSVmMmL7kg6Qya59i',0,'73e72bb8-c13a-4bfc-b5c8-915dd219a3ac',NULL,NULL,'2023-12-15 06:36:50','2023-12-15 06:36:50'),(237,'cubuoils3','cubuoils3',238,'a435fdgbfd34@yahoo.com',NULL,'$2y$10$Pm737GCdJUvoMZBjVa5AZ.0ob3DJSKAL0AWeE7frJBHUGU/qh/94G',0,'060bdfa1-2346-4c1a-92c0-95be3b89f483',NULL,NULL,'2023-12-15 06:37:18','2023-12-15 06:37:18'),(238,'cubuoils4','cubuoils4',239,'anhyeuem123te35@yhaoo.com',NULL,'$2y$10$93HhdTJR4k/27fS4fMgJ.eq5by.D0DLdHRIpX6MIaeMGexlMP8pPS',0,'01d6d9cf-0291-421a-9ebd-87946c9b58ed',NULL,NULL,'2023-12-15 07:12:08','2023-12-15 07:12:08'),(239,'cubuoils5','cubuoils5',240,'ertjhfgn35me@yahoo.com',NULL,'$2y$10$DXg9cMCjHw4e0u9fuULmEeFaIUgxlZT5lkSZ3IWzkD6OTg7u99APW',0,'f58610a0-eb67-4c3c-8b09-79639a4445a9',NULL,NULL,'2023-12-15 07:12:34','2023-12-15 07:12:34'),(240,'luccongtu','luccongtu',241,'macvandienro@gmail.com',NULL,'$2y$10$UZLwVM0REdmrx5bXa/QYYufi2Vd/6//teDY5lI1HM1sG2sUTPSHN.',0,'33b844a6-c00a-414e-a947-8521d26960b6',NULL,NULL,'2023-12-15 07:22:00','2023-12-15 07:22:00'),(241,'ngocvy','ngocvy',242,'khoahp1104@gmail.com',NULL,'$2y$10$BSZG0Wn.NkW5auu8wvZ3AO9xaiuJGQ6gJjlzBUHmjI2HOh4ol4orm',0,'3f20f117-0412-4490-b7a3-61cd292eca84',NULL,NULL,'2023-12-15 07:24:34','2023-12-15 07:24:34'),(242,'ngocvy1','ngocvy1',243,'khoahp110@gmail.com',NULL,'$2y$10$4N6CgI1ti7vX/RfYs4vKl.3DcVBFUWctlHFJBMDgGh9Rhz7U9Y5me',0,'7702cb6c-a123-4338-8e4f-2727fd9c93eb',NULL,NULL,'2023-12-15 07:30:54','2023-12-15 07:30:54'),(243,'bachdangtn','bachdangtn',244,'khatvongyeuTN@gmail.com',NULL,'$2y$10$mGWJL9iuhmLDhXTPHLfiq.6x9BhufD3MBMtzVoXbGDTXQVTykhNMi',0,'df138845-975a-4c2d-bccf-51df2cdcf356',NULL,NULL,'2023-12-15 08:47:12','2023-12-15 08:47:12'),(244,'makiem6123','makiem6123',245,'minhban_87_2012@yahoo.com',NULL,'$2y$10$aZ6fJ66UvK6eMT8muNuW6O9vjbLC2yOFz.Ty2cHPd8w4j1ukJELkW',0,'43529265-5690-41c2-981d-0fa422530434',NULL,NULL,'2023-12-15 09:01:57','2023-12-15 09:01:57'),(245,'tkm1990','tkm1990',246,'thainam199@gmail.com',NULL,'$2y$10$qt9lM1cABzDgoipBJ9h3euB4So8KhIQJxkXPg5Ve6rtUijcPtrOem',0,'aaee6c54-0dba-4e4e-882d-0a11b48552cc',NULL,NULL,'2023-12-15 09:26:32','2023-12-15 09:26:32'),(246,'del111','del111',247,'doandel@gamil.com',NULL,'$2y$10$W6oYy78/bZf2wac97dnsqeCdTtPKKBJQDdfqrvN6XmdkZbXzsbQwO',0,'f4d137b6-3ac7-430a-a5f8-375581d45cc7',NULL,NULL,'2023-12-15 10:20:46','2023-12-15 10:20:46'),(247,'noname','noname',248,'macvandienro@gmial.com',NULL,'$2y$10$PN91P/vAN3nJ8ntqiU7go..7ghDU8Ad1BZtOmCcbFMr4.6L7w1O/m',0,'e24a565a-86a0-448f-a9ee-3d70781b549c',NULL,NULL,'2023-12-15 11:38:08','2023-12-15 11:38:08'),(248,'p3bjn1','p3bjn1',249,'thanh.truongminh@gmail.com',NULL,'$2y$10$hiLjZuVpNrouf35yYl9l3OIMYGizyuSlrQeEfSZuX4EylsSbAEiPy',0,'b14710e5-0c19-4638-8c02-7e0640ce7f66',NULL,NULL,'2023-12-15 12:25:12','2023-12-15 12:25:12'),(249,'diepcom','diepcom',250,'diepcom9x@gmail.com',NULL,'$2y$10$MUJAGdkb3AF8E5IdLgu.hecVuq.LDTiGp5wSPBujX2.whFdyVeFBG',0,'cb35c293-7863-43ff-9482-0d42f034f170',NULL,NULL,'2023-12-15 13:48:25','2023-12-15 13:48:25'),(250,'khanh98','khanh98',251,'xuank1998@gmail.com',NULL,'$2y$10$V/O/0eg0Ph55YOveYkfIJ.Sar8jhoaekrUz7apNl7hLkdR8uuksiS',0,'009d463a-db48-4a9e-847f-c7cf8fdf4795',NULL,NULL,'2023-12-16 01:28:20','2023-12-16 01:28:20'),(251,'truongxeom','truongxeom',252,'aosdhgfasodfghaloh@gamil.com',NULL,'$2y$10$EzDMZZdMF8wMEqCYyPRoQ.3Wf3grDwXot7k/jrErUHX8k4yD3kUvW',0,'63083631-215d-4e86-ad28-4d8a119607f2',NULL,NULL,'2023-12-16 02:45:21','2023-12-16 02:45:21'),(252,'0335301737','0335301737',253,'dfklnasfbasfn@gmail.com',NULL,'$2y$10$Bf1GSPBUwzJ6NIG0PDIUduzVoGbXFtL2esYeqvbywrMBVoYurNI.y',0,'a433bc7d-3fe1-4341-8b59-6bc58fc50fee',NULL,NULL,'2023-12-16 03:30:53','2023-12-16 03:30:53'),(253,'anhlt04','anhlt04',254,'leanh110495@gmail.com',NULL,'$2y$10$AQP41rpDxcUjjXS3ETopL.nDk7QM9Bud5dn1rqN.TsHw6QRWR.x.u',0,'61275fcf-22fe-4877-a1b3-d6a538dd14e5',NULL,NULL,'2023-12-16 03:38:28','2023-12-16 03:38:28'),(254,'anhdanbn1','anhdanbn1',255,'sdbghsdkj@gmail.com',NULL,'$2y$10$FaLRCQsCl.f86uZJ2yi13eZD0RYW7REdf9vktKoSvLi4/4BNtdl0K',0,'6bcb9785-c375-4382-95d5-a7841e186eea',NULL,NULL,'2023-12-16 05:11:54','2023-12-16 05:11:54'),(255,'doan320','doan320',256,'onlydoan321@gmail.com',NULL,'$2y$10$soSf5b8QexXeoCOYRXGGSOv/jUjVItw3Y4xFl7Dpa4kWJwCNYt46e',0,'05860f3d-2437-4435-9d5f-fd966def7bcf',NULL,NULL,'2023-12-16 07:19:23','2023-12-16 07:19:23'),(256,'doan321','doan321',257,'onlydoan3211@gmail.com',NULL,'$2y$10$OUHGrAqFPjefUYV88JQwpeijmsVbal.a2bIY6uMPX1wlp0928jc6m',0,'d08f9f3a-32a4-48aa-829b-a702f822afed',NULL,NULL,'2023-12-16 07:58:21','2023-12-16 07:58:21'),(257,'noname1','noname1',258,'macvandienro@gmai.coml.com',NULL,'$2y$10$gESK96NgxD5zYx3oRQ5fnez1Sx3ZrUoGDRMkNAw04.KC5sYgOM61i',0,'d4a4a6c2-2374-4f78-960b-5ce5eae3929e',NULL,NULL,'2023-12-16 09:17:23','2023-12-16 09:17:23'),(258,'soiemga12','soiemga12',259,'fewwfwewf@gmail.com',NULL,'$2y$10$BzL.RCPcuWeoVbA/wd1riOosr4VJrQ/hM1SAgGvX/.iKR1R7kGjti',0,'c47c3b7d-9f9e-4bcb-9e58-91a1081968dd',NULL,NULL,'2023-12-16 09:58:47','2023-12-16 09:58:47'),(259,'kisssummer','kisssummer',260,'sadasd@yahoo.com',NULL,'$2y$10$kbh5aRNHrYrN6L0obz9xtOIGir49hnsSXJIVcVFdTcNpQ/b5mfLTa',0,'cde1f09b-b0f0-454e-950b-85ef54e02cc1',NULL,NULL,'2023-12-16 10:31:00','2023-12-16 10:31:00'),(260,'gauheo1','gauheo1',261,'thuytrang1995@gmail.com',NULL,'$2y$10$GsQ4JwZel2UXiTEAGbaKNOh7L2ztls/1WeYqF3q9qksBm2uFbxsYS',0,'0114e472-c117-4a74-887c-12d89e0dce37',NULL,NULL,'2023-12-16 10:42:57','2023-12-16 10:42:57'),(261,'ahung1','ahung1',262,'aahfgqir3@gmai.com',NULL,'$2y$10$Gn1zSl2Nj1Ne1LAqTzAUXuJ.UK1dkyboyKDyoXSOBvXnmBpNVqIm2',0,'0f7bc488-2247-4db6-92c5-d312dfdc8dc7',NULL,NULL,'2023-12-16 11:42:39','2023-12-16 11:42:39'),(262,'choidao1','choidao1',263,'dangphattta@gmail.com',NULL,'$2y$10$WknKnRh7r08BDkXkE3NOOOgPzomlGlxxf46WQW.3tlITgCBicgbJi',0,'ee01f5ab-4a71-4656-b6e4-0bbca2d1e001',NULL,NULL,'2023-12-16 11:53:50','2023-12-16 11:53:50'),(263,'ongninhday1','ongninhday1',264,'anhninh@gmail.com',NULL,'$2y$10$x4ctMivo9ttO0lJfcumH5elT6VnOkliTjlm77cIP9rAG./FjJK9wy',0,'7ed72c94-340d-4b42-a926-1e7c7b85f4ec',NULL,NULL,'2023-12-16 12:29:43','2023-12-16 12:29:43'),(264,'zhoang1996z','zhoang1996z',265,'adadadadadadaf@gmail.com',NULL,'$2y$10$XRvuGUQH/1PtI0tgWXVKzOvtA9TgvM3WRQMxuB9c5Qo9xrZ6/gN3C',0,'56a0d0b8-1d0f-46e4-aa65-80866ef38aaa',NULL,NULL,'2023-12-16 12:30:18','2023-12-16 12:30:18'),(265,'nguyenthi1','nguyenthi1',266,'djshgfdjsgbdf@gmail.com',NULL,'$2y$10$ItMbriQRFhLHDUvuI.eK0.1y70/g7f.iROhh3bAgsKb.Ho8j7kIaW',0,'b9808484-8bac-4c91-999a-fd803bd2cacb',NULL,NULL,'2023-12-16 12:55:41','2023-12-16 12:55:41'),(266,'firstlove','firstlove',267,'firstlovect8@gmail.com',NULL,'$2y$10$cwtSsVtiXCSGBlKYTRNtv.HDkuCbAq7yZvJcGXb4G3dgq.N7LV6CK',0,'1542860a-3e4c-46ed-a34f-b65974097ef9',NULL,NULL,'2023-12-16 13:32:28','2023-12-16 13:32:28'),(267,'trinhvanduy1','trinhvanduy1',268,'trinhvanduy2411@gmail.com',NULL,'$2y$10$WSnyzGkvfLA6.8b6mI27rOJPJYc810o1Y2wx0s5CInCSs.7thBGHq',0,'757af50b-0daa-4baf-9487-69331343c191',NULL,NULL,'2023-12-16 13:40:50','2023-12-16 13:40:50'),(268,'quocanh1','quocanh1',269,'sdgsfgfsdghfsd@gmail.com',NULL,'$2y$10$XzXZ36dGtPbfusv19TcmXebDoSvBtckQVy5/Q9EfgixXSuDbZxg5.',0,'10019f94-e6e1-4b1c-be1f-843ad145eb4e',NULL,NULL,'2023-12-16 13:52:54','2023-12-16 13:52:54'),(269,'kiemkhach','kiemkhach',270,'forever210519922221@gmail.com',NULL,'$2y$10$Yl3IZymow4QqZGkH8mYSmuFsD0RuGPQ7P4s/lbXUvTGpYtTwohjx6',0,'813b8653-0d82-4b87-b6fe-c418c9a75ad7',NULL,NULL,'2023-12-16 14:48:01','2023-12-16 14:48:01'),(270,'kiemkhach1','kiemkhach1',271,'forever21051992222@gmail.com',NULL,'$2y$10$RIDF9Hc85pD0eOvYrorGF..NK16zczZC164kOtNhHDpUswgrSUR4O',0,'d30ff9bf-509c-4fcc-b514-75134f578a08',NULL,NULL,'2023-12-16 14:50:37','2023-12-16 14:50:37'),(271,'thanhsin95','thanhsin95',272,'congthanhqvn@gmail.com',NULL,'$2y$10$asPicoEahoQED84OPk7DJ.mZ4gi0pG4BXaJEnuVmaE8kSz37BzYBm',0,'3252bf8a-16c1-4247-8a7f-d73edc2ab832',NULL,NULL,'2023-12-16 15:05:32','2023-12-16 15:05:32'),(272,'teoabm','teoabm',273,'asdasdasdasc@yahoo.com',NULL,'$2y$10$z1mwSkrw5wrwJ1PE2knkke7jZerNWSxtbEY4iutNAq0fg5jqpwAvy',0,'347e4f69-291f-4db8-b8cf-cd3379f2ae9f',NULL,NULL,'2023-12-16 17:08:26','2023-12-16 17:08:26'),(273,'tkm1991','tkm1991',274,'trinhvanbinh0947747995@gmail.com',NULL,'$2y$10$xo9T7DcyvTM.pC4KfBCW3.UcdAes6htdNVPlNYV4QqXRzZQlbFJaG',0,'051e7e3d-9558-41d3-a06b-3856d6800a32',NULL,NULL,'2023-12-16 17:22:23','2023-12-16 17:22:23'),(274,'tranthieng','tranthieng',275,'tranthiengaragong@gmail.com',NULL,'$2y$10$JDJVQBcPsm54zqd8bxEIB.kiim9COXrjP0UxnbSyi7shOT/uvwB6W',0,'7adbc049-2cbe-4eed-af7a-b7e263d038cf',NULL,NULL,'2023-12-16 22:19:07','2023-12-16 22:19:07'),(275,'caytomn','caytomn',276,'choivolam@gmail.com',NULL,'$2y$10$DLV080/pJfg0bKEhBOrBHOZgWNAfhH6UTdAwT1dBNJM1RRnwuN4Ma',0,'ea7ac9cd-d4f7-4a0d-895b-4bb4c666ae7a',NULL,NULL,'2023-12-16 23:17:42','2023-12-16 23:17:42'),(276,'huuduan1','huuduan1',277,'duan@gmail.com',NULL,'$2y$10$pjKKsB71mEBWjtzMn6U5u.JRKw9NHxyL5G017HPqKahX6xxEdiPTa',0,'41e35978-3711-4b40-ad89-3cc854d49741',NULL,NULL,'2023-12-17 00:20:34','2023-12-17 00:20:34'),(277,'huuduan2','huuduan2',278,'duan1@gmail.com',NULL,'$2y$10$BlKiH9E.xLdTHzkK0h5DveP/fXxAkUT0OVcj.Z00WgfqMBqVFPf7G',0,'f8136e29-1793-4e42-ae18-2fdfed0b0a0a',NULL,NULL,'2023-12-17 00:21:26','2023-12-17 00:21:26'),(278,'huuduan3','huuduan3',279,'duan2@gmail.com',NULL,'$2y$10$iXT8s76eLdZ7Z9yP2pcPE..e3r5D7awLSNo3tQ6iv29Oe0KpY6nUi',0,'b3d22d7f-b874-424c-9aff-9e8c4d20b4cd',NULL,NULL,'2023-12-17 00:22:30','2023-12-17 00:22:30'),(279,'huuduan4','huuduan4',280,'duan123@gmail.com',NULL,'$2y$10$kFS33qqZ7aY8y2p4uBaKKetaNZRX/EpRm5.c9NiXBzywvzMJWpM.e',0,'34120b98-4b89-4091-8335-d51b20de4367',NULL,NULL,'2023-12-17 00:23:42','2023-12-17 00:23:42'),(280,'cuckicool1','cuckicool1',281,'hai.vu.van92vn@gmail.com',NULL,'$2y$10$/4lofyHTTR//j.gWHdeBd.w07F3k2OOOTEhRacWF1fQtQi1PGcWOe',0,'7d431f7a-c020-45bd-ac0e-38cd66d0a3cc',NULL,NULL,'2023-12-17 01:25:57','2023-12-17 01:25:57'),(281,'maipn01','maipn01',282,'maipn01@gmail.com',NULL,'$2y$10$yxSgDrm141Ksa7b4rLpbVuHww6AVnyLgxw8hcAz0tDUrZ9NHYmCeO',0,'0ad4836a-0730-48a6-ab6d-306924b2698d',NULL,NULL,'2023-12-17 02:38:09','2023-12-17 02:38:09'),(282,'maipn02','maipn02',283,'maipn02@gmail.com',NULL,'$2y$10$glRD83GInWL4A.iMS97BLOgs1JK/GZssXH1afWJp1IXfEHCdyu0Gy',0,'3694fc5d-67f5-4eba-89a6-fbde2ce86e36',NULL,NULL,'2023-12-17 02:39:08','2023-12-17 02:39:08'),(283,'maipn03','maipn03',284,'maipn03@gmail.com',NULL,'$2y$10$DU9iQHiNSIAEDJ4QaR.YPO2ttmycqpDj2RmkBHHO8A61csVuVxgFG',0,'d4394196-24a5-4922-a25a-bb0d6ff89fbf',NULL,NULL,'2023-12-17 02:40:05','2023-12-17 02:40:05'),(284,'maipn04','maipn04',285,'maipn04@gmail.com',NULL,'$2y$10$gUFg/Blu1orohyRSstQazOygb.e7f0D9ylDB/iWwlZ2m3nzD2qRrm',0,'789937ea-b996-408f-9658-8fbf9ff06a4e',NULL,NULL,'2023-12-17 02:40:44','2023-12-17 02:40:44'),(285,'maipn05','maipn05',286,'maipn05@gmail.com',NULL,'$2y$10$EU9TxLKTl9f76Ykxg7Nh4eQsrOB68JuF9sZHfkKpzaA2kX7VJR7cS',0,'12d5be9c-f9ce-43a1-ab27-c3d73300a52f',NULL,NULL,'2023-12-17 02:41:24','2023-12-17 02:41:24'),(286,'maipn06','maipn06',287,'maipn06@gmail.com',NULL,'$2y$10$CoaFGbug90NdZ1KQ.fCM/ejlXjUlg1sGENLG8nnpOVVRbQ2fxEgeu',0,'5f11a820-8567-4ae4-9959-c4b9697854fc',NULL,NULL,'2023-12-17 02:42:13','2023-12-17 02:42:13'),(287,'maipn07','maipn07',288,'maipn07@gmail.com',NULL,'$2y$10$7ztY8RPgcLO4Mx/4H3E2OeAE53Un8U0aGHwDzlkNNA/8BrLJ6o8nu',0,'18259316-4dbe-4fca-8479-22bac2a328b9',NULL,NULL,'2023-12-17 02:42:52','2023-12-17 02:42:52'),(288,'maipn08','maipn08',289,'maipn08@gmail.com',NULL,'$2y$10$oTNqmXGo7hwQS/zCM0JLAeEp9HZWH8njlDh3ucc.1zJ5fLBc9SIQO',0,'977f171e-930e-4d36-a629-5b1317c036ce',NULL,NULL,'2023-12-17 02:43:53','2023-12-17 02:43:53'),(289,'maipn09','maipn09',290,'maipn09@gmail.com',NULL,'$2y$10$7L3z0I6cX4qTbD46SeDrWeOeCey.pbFHBuMLM2YYUGrx5uFR.ucVy',0,'28815d5d-1555-4a9f-9098-86feaabdfc91',NULL,NULL,'2023-12-17 02:44:36','2023-12-17 02:44:36'),(290,'del222','del222',291,'doandel413@gmail.com',NULL,'$2y$10$SvJRxE7keW3IMi5C9ReAEOPNlyD0YirrRmQvG5ePh1f6myX.1FTMC',0,'9b12a0ae-faf7-44fc-ac85-b93593077f0e',NULL,NULL,'2023-12-17 02:50:20','2023-12-17 02:50:20'),(291,'cricuong','cricuong',293,'hoc_sinh490@gmail.com',NULL,'$2y$10$4fM3/PhE56F0HL7BzzIN5Oh1.KYCPioojO2thDM.ZgLWTlc8vwdQy',0,'718daeac-ae77-406c-aa63-3270ef9f5111',NULL,NULL,'2023-12-17 04:30:45','2023-12-17 04:30:45'),(293,'hoangvu1','hoangvu1',294,'vuhoang071297@gmail.com',NULL,'$2y$10$0qMe6NscyvrVOPZ11jW8perAFoHZWeGAmhx/uXktfpnAAh0f2q3I.',0,'0b3a7284-5fca-4c57-8d03-6bae82704f47',NULL,NULL,'2023-12-17 05:55:38','2023-12-17 05:55:38'),(294,'0942768803','0942768803',295,'phamnguyenhungvp196@gmail.com',NULL,'$2y$10$geeDFu.WgD4JuzT/Kf14q.dyJr51KdPp.IwmnKqTHG/vL91uuCZeS',0,'c6d2f219-62e4-4795-9b1c-649f5fda92d0',NULL,NULL,'2023-12-17 07:11:34','2023-12-17 07:11:34'),(295,'09427688031','09427688031',296,'phamnguyenhungvp1967@gmail.com',NULL,'$2y$10$MV52koqw2oOKZWo.DhvydetHGq5l8T9sxtXkcUyaGhXk8KnOeUwhC',0,'63397594-d368-4932-a437-e981a9139333',NULL,NULL,'2023-12-17 07:35:09','2023-12-17 07:35:09'),(296,'cubuoibn','cubuoibn',297,'tcvnmnmer@yahoo.com',NULL,'$2y$10$OMzjTYu9JPXViH5d4ZrusO2kh1mCFFQWcpmYv6puTQK/bWBE0qXQS',0,'67895b4a-dae4-4057-80a7-96b0bda28257',NULL,NULL,'2023-12-17 08:15:30','2023-12-17 08:15:30'),(297,'cubuoibn1','cubuoibn1',298,'fgf45cvgvc23@yahoo.com',NULL,'$2y$10$e512TFiw/6MwEYaG1whKAufpBcx9MYgBqIzIqi9LlGDykh08txsMu',0,'32471746-a0f8-4484-a04b-21fef6e1b1f8',NULL,NULL,'2023-12-17 08:16:04','2023-12-17 08:16:04'),(298,'cubuoibn2','cubuoibn2',299,'354hdfgndfm24@yahoo.com',NULL,'$2y$10$tXiRRAFQjLRj8E1DA2u9hurgFuX/S6eJJfgT1b3Q2RfmRIpHpsvVy',0,'ee098e55-1c51-4a68-a2e9-561508b9ced3',NULL,NULL,'2023-12-17 08:16:32','2023-12-17 08:16:32'),(299,'cubuoibn3','cubuoibn3',300,'34dfdf3535r2sr@yahoo.com',NULL,'$2y$10$ryAgIKsfGe7AMtfEoY1gw.pCEBc86dIHL.MrChZyEz6AQYHb.gbSq',0,'144dd9fa-d162-4d1f-8c77-5b2a64137a78',NULL,NULL,'2023-12-17 08:17:02','2023-12-17 08:17:02'),(300,'cubuoibn4','cubuoibn4',301,'2345jkdmgd@yahoo.com',NULL,'$2y$10$RL/6nioT8o/FxDiJtj7B4.1HypbLzo9O1ivDlDKmN2ze5fmGRukLq',0,'cc317abf-c94d-4deb-a731-baac3a9e2ca9',NULL,NULL,'2023-12-17 08:17:42','2023-12-17 08:17:42'),(301,'alesso','alesso',302,'asdasdas@yahoo.com',NULL,'$2y$10$HGwdMh3ljzi0nsfWG1wJW.tmrG/1Sul5pXqBVt2WrfboEONyWyA/.',0,'182f3486-bd68-41f3-9f78-bf451e32fcb8',NULL,NULL,'2023-12-17 09:18:09','2023-12-17 09:18:09'),(302,'hoavosac01','hoavosac01',303,'vu7482988@gmail.com',NULL,'$2y$10$/7eYaCd2OViKksUQMac3tu171XnpAYIXedzboi0Ea4//XidnSURuq',0,'afe4af32-8924-4885-a011-ec37f54a4f06',NULL,NULL,'2023-12-17 09:40:12','2023-12-17 09:40:12'),(303,'hoavosac02','hoavosac02',304,'tvu708298@gmail.com',NULL,'$2y$10$gs0Jw2pqmJFRaIdr.vCnrO8K4a9RGWRaeZFo8ohuG0NNyUievQrHe',0,'0a1a7cb3-aa87-4327-954b-b42ce4ec6cf3',NULL,NULL,'2023-12-17 09:41:50','2023-12-17 09:41:50'),(304,'hoavosac03','hoavosac03',305,'0374382450@gmail.com',NULL,'$2y$10$IQ1Bo8Le7Mi5mDL0mfUxwem84SGOwzU/wSqwqYmXBGF7.B3hjB2ia',0,'4be3e5ac-a435-499d-a1b9-5042cd181600',NULL,NULL,'2023-12-17 09:42:47','2023-12-17 09:42:47'),(305,'hoavosac04','hoavosac04',306,'0394654504@gmail.com',NULL,'$2y$10$ZYWaKvHFgTFDgqKPGxXtF.vq1kKLivzlbXRwWnBz/wtqrjzmwO8Aa',0,'812d2e5a-ab7d-4236-8e5e-46fa9bfbb896',NULL,NULL,'2023-12-17 09:43:34','2023-12-17 09:43:34'),(306,'hoavosac05','hoavosac05',307,'0905974133@gmailcom',NULL,'$2y$10$hEWWZenPDMHJYc3d5x48TeZKCQVPFnY4TnpNSjpktMy7afhI1mbSy',0,'55f1ac4e-a811-40a3-8c67-acf0eb16eed6',NULL,NULL,'2023-12-17 09:44:13','2023-12-17 09:44:13'),(307,'hoavosac06','hoavosac06',308,'3432424@gmail.com',NULL,'$2y$10$TRI/F3dkJcB0/eLRVelLaO9Mc5HE4.F0S7JHuHyfSPf5j3WuNh3/W',0,'490f031a-8bb1-4389-a2ac-fc8fc48f52fa',NULL,NULL,'2023-12-17 09:45:05','2023-12-17 09:45:05'),(308,'hoavosac07','hoavosac07',309,'76756@gmail.com',NULL,'$2y$10$TGFgFwGy9FMcAHFq5giWdO7K3kPdWSHTPgX5bd4QHXdQ7QqQk7gOW',0,'465eeb14-a9b4-4da4-9e76-1b1469ab5226',NULL,NULL,'2023-12-17 09:45:43','2023-12-17 09:45:43'),(309,'hoavosac08','hoavosac08',310,'0908@gmail.com',NULL,'$2y$10$.U6LAYDqp/rxPNIy83vEsu9XejySEQbgqUzy908lMIZKm58Vqjhb6',0,'c2ad9ba4-8b8b-460e-bb89-32f7a51753fe',NULL,NULL,'2023-12-17 09:46:23','2023-12-17 09:46:23'),(310,'hoavosac09','hoavosac09',311,'56464@gmail.com',NULL,'$2y$10$UhQusizqWHEccpzkzIqr1.Nc9O1Fa62m11j6Gh/RPH5hnHDGSUjWi',0,'2ad5112f-8909-4d35-a055-7d6e8b1fc41a',NULL,NULL,'2023-12-17 09:47:08','2023-12-17 09:47:08'),(311,'hoavosac00','hoavosac00',312,'34654564@gmail.com',NULL,'$2y$10$RSl8xNWw6nK9hHFG0IgkLeDjE0LvAj5df10KF2XT1qgbJk2m.9ENC',0,'34382262-4936-4776-b707-276ef8fd0a38',NULL,NULL,'2023-12-17 09:47:44','2023-12-17 09:47:44'),(312,'09427688032','09427688032',313,'phamnguyenhungvp1962@gmail.com',NULL,'$2y$10$gtPupSQyH7rC3Fi5BW9bG.y/Jlf7rXbQHjMYXzJoV73G1Pga2r.oO',0,'01465c26-eb9b-4f1c-957f-4d3cf40aa7cb',NULL,NULL,'2023-12-17 10:49:15','2023-12-17 10:49:15'),(313,'chaolong','chaolong',314,'qn833829@gmail.com',NULL,'$2y$10$IVrKdn3g24a2Q8v2IxiODOI3sYpcjxehxPR2P5pXu.g0piWikQIvG',0,'c1ae448b-37e1-4920-8143-fced7d09b495',NULL,NULL,'2023-12-17 12:08:25','2023-12-17 12:08:25'),(314,'beokiller','beokiller',315,'beokiller@gmail.com',NULL,'$2y$10$yviFhTstbC8dIc9Su3x0y.cB1ne/jy45xWhDvkeN.yRbAIbgHbvF2',0,'80596e70-aabc-48ed-a893-a40bcad3c4e9',NULL,NULL,'2023-12-17 12:10:54','2023-12-17 12:10:54'),(315,'beokiller1','beokiller1',316,'beokiller1@gmail.com',NULL,'$2y$10$aoHN.KayRAo5Kv6rItZHNOuwKDGm.jsMuifdStBZwW2o8dsMq1N26',0,'7ac10e78-4d30-4d3e-90c5-b8b82ec11dff',NULL,NULL,'2023-12-17 12:11:21','2023-12-17 12:11:21'),(316,'beokiller2','beokiller2',317,'beokiller2@gmail.com',NULL,'$2y$10$LAeVng5INge45xIFjCeXtutaqPQTRYRDz75br7IHMgVl5LY5cVi8m',0,'08162d2e-28d5-40fc-977f-822f0ce9ac76',NULL,NULL,'2023-12-17 12:11:54','2023-12-17 12:11:54'),(317,'beokiller3','beokiller3',318,'beokiller3@gmail.com',NULL,'$2y$10$.Tpbr6UlEPEKVqJ0wkSBmu.xnWe/Lljn.9LYI5pE8fFAk1Eu9Tfpu',0,'a9ac195f-3d86-465e-ae4a-94d9be1d53a9',NULL,NULL,'2023-12-17 12:12:14','2023-12-17 12:12:14'),(318,'beokiller4','beokiller4',319,'beokiller4@gmail.com',NULL,'$2y$10$my0EckJAVGJrOJeTfhtpcuLbAmnZXxdIAarPyBwFuiFrth2eZRuU2',0,'89af1027-f24a-4e1f-9f94-3ac1135e795d',NULL,NULL,'2023-12-17 12:12:56','2023-12-17 12:12:56'),(319,'beokiller5','beokiller5',320,'beokiller5@gmail.com',NULL,'$2y$10$W9yHtAxXEMoOEnDuTrwliuUQ6oJbT9Y5xNfzEmIBqof3slfIunmWW',0,'ba76ddea-004c-40de-9edb-32ca8660de1a',NULL,NULL,'2023-12-17 12:13:15','2023-12-17 12:13:15'),(320,'beokiller6','beokiller6',321,'beokiller6@gmail.com',NULL,'$2y$10$UXmB7DLkAadPUUWpUuK/m.Kby4enazrqp2QjCyhdZ.RmCyjN47ZhO',0,'eea8ab85-06a8-42e9-8933-fe8ab257c7fe',NULL,NULL,'2023-12-17 12:13:35','2023-12-17 12:13:35'),(321,'beokiller7','beokiller7',322,'beokiller7@gmail.com',NULL,'$2y$10$2ZGonQO3WjplfT3HbxbALu/grBOTzf.cBDUB.anzrMiI/wgMWcK12',0,'7c182f7f-24a6-445f-ac15-20c5d1579df3',NULL,NULL,'2023-12-17 12:14:05','2023-12-17 12:14:05'),(322,'beokiller8','beokiller8',323,'beokiller8@gmail.com',NULL,'$2y$10$6Y4Su1zNChiEjx6qYB01B.NwgxUCQv5F2/LHJzzwBNEzGWt7vrHFa',0,'fd234149-2928-4482-94e2-8f3fe6918091',NULL,NULL,'2023-12-17 12:14:33','2023-12-17 12:14:33'),(323,'beokiller9','beokiller9',324,'beokiller9@gmail.com',NULL,'$2y$10$F/7vOo2qEsb0HwgJktJIp.UfsjT3Cz/1z6uGAZ11cxLWpZ2nfLyMu',0,'d210e5f9-e2dc-4757-b139-dc00b4a213e3',NULL,NULL,'2023-12-17 12:14:51','2023-12-17 12:14:51'),(324,'beokiller10','beokiller10',325,'beokiller10@gmail.com',NULL,'$2y$10$MkwACV0Ob/KDADPPcY3tUO5tfG7VADgHGvbs3WZzIbi/AuUwlkuNy',0,'8fb5f1de-63e0-45a6-9759-778e0f021133',NULL,NULL,'2023-12-17 12:15:11','2023-12-17 12:15:11'),(325,'tuan11','tuan11',326,'maituan87tn11@gmail.com',NULL,'$2y$10$fYSUwokvcpH1XBT0y13/Le7JlM5GgbTEHyQ/wts8OD0tLaIuhLB5m',0,'74717d02-a9fe-43e6-899d-ce00b67e3234',NULL,NULL,'2023-12-17 13:19:45','2023-12-17 13:19:45'),(326,'duykuvt','duykuvt',327,'xchvmxcvh@gmail.com',NULL,'$2y$10$a4.NLeCJ1gHzriWVT6vYHutxCCPoMS0Dz8ypGsL5N3/0yRdHCIzde',0,'7891ab07-e15d-46e9-9e63-f57a8ebbe443',NULL,NULL,'2023-12-17 15:35:03','2023-12-17 15:35:03'),(327,'boycuoi182','boycuoi182',328,'thanhson.hp1997@gmail.com',NULL,'$2y$10$eoGKs8ZSobwYp.Pu1F4zUesti7phwRcZFGQt6WXCpMQFM626wX5NS',0,'31d9241b-983d-42b4-bcee-b1cec889e9ee',NULL,NULL,'2023-12-17 17:08:13','2023-12-17 17:08:13'),(328,'buong1','buong1',329,'anhcuonga237112@gmail.com',NULL,'$2y$10$RgXgmmO/wVfpGZuahncYBevO1otZyDTPsn4iBFQo4TwGiFBEoXlt6',0,'99329c42-3659-4a69-a1bf-65248126ecaa',NULL,NULL,'2023-12-17 18:10:17','2023-12-17 18:10:17'),(329,'buong2','buong2',330,'anhcuonga23711a2@gmail.com',NULL,'$2y$10$Tsy5sdZrKZaC5GKObqCawus6fAhZEn6ue2i.UlSz2Io1SAAOe/hwi',0,'569abc8c-cd13-48f0-a0cc-ab695439b6f6',NULL,NULL,'2023-12-17 18:52:22','2023-12-17 18:52:22'),(330,'buong03','buong03',331,'anhcuongasfddsss23d711a2@gmail.com',NULL,'$2y$10$ERPCMnZi/EdLX7UZC6BMs.HVLNuhjBAO67BVRbvFnqNn.4cWj/bQW',0,'f9f24781-6fba-424d-9931-f1eecc0cec3e',NULL,NULL,'2023-12-17 19:00:26','2023-12-17 19:00:26'),(331,'buong4','buong4',332,'anhcuongasfddssdsss23d711a2@gmail.com',NULL,'$2y$10$xuwFYpuIIVfkBlFHTguujOraWRSe98X6dMg93Wgm/PFirgbecV.OW',0,'3224bc77-cc8f-4e7c-8faa-110f2f6d4e6a',NULL,NULL,'2023-12-17 19:02:55','2023-12-17 19:02:55'),(332,'buong5','buong5',333,'anhcuongaass237112@gmail.com',NULL,'$2y$10$jsyNpppHcE6i5DPpXW7wLe.oTzz4GEJ4aEUnV3kzVNl53EQUrOe4W',0,'207dc5b4-3ff2-4139-ad45-2c21a3097988',NULL,NULL,'2023-12-17 19:07:59','2023-12-17 19:07:59'),(333,'buong6','buong6',334,'anhcuonga23a7112@gmail.com',NULL,'$2y$10$K3nXfLUxyJb7SJlUJ9Cpo.B8j0/B29XNunaDPACVB3/2zAIHdMUPq',0,'a9241512-9f93-4001-a0cb-874e9522ebad',NULL,NULL,'2023-12-17 19:20:39','2023-12-17 19:20:39'),(334,'buong7','buong7',335,'anhcuonga23ss7112@gmail.com',NULL,'$2y$10$ww.al1m4iz2okDq5pQCmLeEk4wzr02BBivSQapb50tyFENTUZUdTG',0,'e52f7cbe-0468-4425-ba1f-0cfbd0949663',NULL,NULL,'2023-12-17 19:26:00','2023-12-17 19:26:00'),(335,'buong8','buong8',336,'anhcuongsa23ss7112@gmail.com',NULL,'$2y$10$YkBmYLAa3zj6JhoajPr4oOFJDRYl/6VYIumrdaNLs2DkoNS3FDE5m',0,'d7e744f1-d2b6-4579-aa3a-38f7b2ea3669',NULL,NULL,'2023-12-17 19:38:36','2023-12-17 19:38:36'),(336,'ledong91','ledong91',337,'dong0938041326@gmail.com',NULL,'$2y$10$rmWYjA1h4.BqQEB3HKBWyuMdNo5DxPKkuL3BngNPaDu4kU23HdKNO',0,'5c22b9db-f074-4d5d-828b-06168cadca4c',NULL,NULL,'2023-12-17 23:46:12','2023-12-17 23:46:12'),(337,'fam111','fam111',338,'nguyenduymanh9699@gmail.com',NULL,'$2y$10$6gXevNsv833owF1wg.cNn.kBJ83.MZWmUGVb4TX8QM3m82NLQPAhq',0,'a29e43a1-0e15-4142-8f1d-d9556a51dcb6',NULL,NULL,'2023-12-18 01:25:42','2023-12-18 01:25:42'),(338,'cuong1','cuong1',339,'anhcuonga2371s12@gmail.com',NULL,'$2y$10$tI1Wq8YYUbZIG/C09byPZOamBd0aXOiTkJYd0OenbuHJFsQZhrM2O',0,'73e18f5c-c0b0-4941-88c2-492ec2164ef9',NULL,NULL,'2023-12-18 03:55:00','2023-12-18 03:55:00'),(339,'cuong2','cuong2',340,'anhcuonsga237112@gmail.com',NULL,'$2y$10$zadE.AIIeUuv9ltgUP9J1eJs7ZtpN7eCQQTRHds5aWL6PIuGREziK',0,'be0e071d-4290-400c-a211-fa327db90628',NULL,NULL,'2023-12-18 03:55:43','2023-12-18 03:55:43'),(340,'cuong3','cuong3',341,'anhcuonga2s37112@gmail.com',NULL,'$2y$10$ly13LRQbu0amMHSQ8rHtrujZ/2VjTpURn.HD.AzdTMIBzUDvxooKm',0,'5aa03f31-6449-4776-802d-d0efa58e5b83',NULL,NULL,'2023-12-18 03:56:11','2023-12-18 03:56:11'),(341,'cuong4','cuong4',342,'anhcuonga23s7112@gmail.com',NULL,'$2y$10$/8XHxGRz2aNpGGROWkh2weAvQlMT8eOIO5PjA4jPDQTlF22TUQ1aS',0,'e45976d3-f98e-46cc-80b0-3f8e6e9f3359',NULL,NULL,'2023-12-18 03:56:35','2023-12-18 03:56:35'),(342,'cuong5','cuong5',343,'anhcuongassss237112@gmail.com',NULL,'$2y$10$uc21nvA.SWh/gnmJBAuFl.ycrOcd2tjZhPU0h/EgTwJpc7Ik9gWDu',0,'dba320f0-4425-4ea1-aa1b-1b73a605964f',NULL,NULL,'2023-12-18 03:57:02','2023-12-18 03:57:02'),(343,'cuong6','cuong6',344,'anhcuonga23711ssss2@gmail.com',NULL,'$2y$10$8ogmGKwiLY/6DLI3ghYx4OuENuHiSYDDcLJK5/L73w/.UjuV2kvpK',0,'0d58170c-4c6f-45e6-98fd-8eecf30689c4',NULL,NULL,'2023-12-18 03:57:29','2023-12-18 03:57:29'),(344,'cuong7','cuong7',345,'anhcuonga237112s@gmail.com',NULL,'$2y$10$IdaR0TglQsKMgzHJQvr0AeJNkcGPL4.5RZvf5ti7Quhcc.M3u9Lia',0,'3f5ef8f7-9e17-45a0-981d-0049854156b8',NULL,NULL,'2023-12-18 03:57:55','2023-12-18 03:57:55'),(345,'cuong8','cuong8',346,'anhcuonga2371ss12@gmail.com',NULL,'$2y$10$oJ6cyRr4ZnD8rEgK31vIEedooxFkXVp/F2V7dtkLirc64J3M0SNBa',0,'d5feb575-3dc8-44a5-94c3-6dddb404892c',NULL,NULL,'2023-12-18 03:58:25','2023-12-18 03:58:25'),(346,'pro1xtz','pro1xtz',347,'loidanhtienlaphudu@gmail.com',NULL,'$2y$10$5sDqs5Svjfpnsvck9Rk0rOh5nncUVbpAM6fDg19W0CNGxOJAatBJC',0,'a6eb9fcb-3a7e-46a7-9fa7-095e18ea3299',NULL,NULL,'2023-12-18 04:00:11','2023-12-18 04:00:11'),(347,'quantpa','quantpa',348,'nguyenquan@gmail.com',NULL,'$2y$10$eG/eWuF6DD6wCWE1dCLc3.KLVbYHlyv4qin/8jpyLTJLMQjZi2bli',0,'9cb77d5d-4eb9-4034-8459-7dee1a0c01b0',NULL,NULL,'2023-12-18 04:01:05','2023-12-18 04:01:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_created_counts`
--

DROP TABLE IF EXISTS `users_created_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_created_counts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `cached_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_created_counts`
--

LOCK TABLES `users_created_counts` WRITE;
/*!40000 ALTER TABLE `users_created_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_created_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `expires_at` timestamp NULL DEFAULT NULL,
  `redeemed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vouchers_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-18 11:13:40
