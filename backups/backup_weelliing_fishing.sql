-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: weelliing_fishing
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `Cane`
--

DROP TABLE IF EXISTS `Cane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cane` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catchNbr` int NOT NULL,
  `bonus_1s_percent` double NOT NULL,
  `bonus_2s_percent` double NOT NULL,
  `bonus_3s_percent` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `lureNbr` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Cane_name_key` (`name`),
  UNIQUE KEY `Cane_catchNbr_key` (`catchNbr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cane`
--

LOCK TABLES `Cane` WRITE;
/*!40000 ALTER TABLE `Cane` DISABLE KEYS */;
INSERT INTO `Cane` VALUES (1,'Canne en bois','https://i.ibb.co/ccFWmhhm/wooden.png','Une simple canne en bois pour les débutants',0,0,0,0,'2025-11-10 15:06:58.000','2025-11-10 15:06:58.000',0),(2,'Canne en fer','https://i.ibb.co/Q39SgSXt/iron.png','Une canne renforcée en fer',15,-5,5,0,'2025-11-10 15:06:58.000','2025-11-10 15:06:58.000',1),(3,'Canne en carbone','https://i.ibb.co/SXp4r6hC/carbon.png','Une canne de qualité professionnelle en carbonne',100,-15,10,5,'2025-11-10 15:06:58.000','2025-11-10 15:06:58.000',1),(4,'Canne en thorium','https://i.ibb.co/6RYg4KJZ/thorium.png','La canne ultime pour les experts, avec un corps en thorium',300,-30,20,10,'2025-11-10 15:06:58.000','2025-11-10 15:06:58.000',2);
/*!40000 ALTER TABLE `Cane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CaneSkin`
--

DROP TABLE IF EXISTS `CaneSkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CaneSkin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CaneSkin_name_key` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CaneSkin`
--

LOCK TABLES `CaneSkin` WRITE;
/*!40000 ALTER TABLE `CaneSkin` DISABLE KEYS */;
INSERT INTO `CaneSkin` VALUES (1,'Cannageaoire','https://i.ibb.co/yB7gBKfm/shiro.png','Une canne à pêche maitrisée seulement par le peuple des sirènes','2025-11-12 22:34:38.374','2025-11-12 22:34:38.374');
/*!40000 ALTER TABLE `CaneSkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CaughtFish`
--

DROP TABLE IF EXISTS `CaughtFish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CaughtFish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `fishId` int NOT NULL,
  `weight` int NOT NULL,
  `quality` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `caneId` int NOT NULL DEFAULT '1',
  `lureId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CaughtFish_userId_fkey` (`userId`),
  KEY `CaughtFish_fishId_fkey` (`fishId`),
  KEY `CaughtFish_caneId_fkey` (`caneId`),
  KEY `CaughtFish_lureId_fkey` (`lureId`),
  CONSTRAINT `CaughtFish_caneId_fkey` FOREIGN KEY (`caneId`) REFERENCES `Cane` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CaughtFish_fishId_fkey` FOREIGN KEY (`fishId`) REFERENCES `Fish` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CaughtFish_lureId_fkey` FOREIGN KEY (`lureId`) REFERENCES `Lure` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CaughtFish_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CaughtFish`
--

LOCK TABLES `CaughtFish` WRITE;
/*!40000 ALTER TABLE `CaughtFish` DISABLE KEYS */;
INSERT INTO `CaughtFish` VALUES (2,3,21,18556,1,'2025-11-10 15:34:05.210',1,NULL),(4,2,5,5032,1,'2025-11-10 15:45:43.904',1,NULL),(5,1,20,584,1,'2025-11-10 15:45:55.360',1,NULL),(6,4,19,353,1,'2025-11-10 16:15:31.897',1,NULL),(7,5,2,297,1,'2025-11-10 16:48:20.618',1,NULL),(8,5,2,369,2,'2025-11-11 04:10:38.155',1,NULL),(9,2,12,105,2,'2025-11-11 06:27:34.775',1,NULL),(10,3,9,214,2,'2025-11-11 12:03:47.454',1,NULL),(11,4,12,197,1,'2025-11-11 12:04:07.425',1,NULL),(12,6,1,180,2,'2025-11-11 14:36:52.025',1,NULL),(13,1,20,469,1,'2025-11-11 14:37:30.114',1,NULL),(14,1,1,115,1,'2025-11-11 23:18:25.690',1,NULL),(15,2,13,257,1,'2025-11-11 23:23:26.697',1,NULL),(16,3,15,1339,1,'2025-11-11 23:23:44.075',1,NULL),(17,4,5,6807,1,'2025-11-11 23:30:17.567',1,NULL),(18,6,22,2036,2,'2025-11-12 11:49:18.790',1,NULL),(19,5,17,17333,1,'2025-11-12 17:49:33.685',1,NULL),(20,1,8,354,2,'2025-11-12 23:00:34.278',1,NULL),(21,3,1,145,2,'2025-11-12 23:01:06.844',1,NULL),(22,5,8,307,1,'2025-11-12 23:13:08.625',1,NULL),(23,4,8,339,1,'2025-11-12 23:24:21.542',1,NULL),(24,2,22,2085,2,'2025-11-12 23:26:16.519',1,NULL),(25,6,14,417,3,'2025-11-13 07:33:18.517',1,NULL),(26,2,19,276,1,'2025-11-13 23:00:47.784',1,NULL),(27,3,19,451,1,'2025-11-13 23:41:20.121',1,NULL),(28,1,7,250,1,'2025-11-13 23:42:53.374',1,NULL),(29,4,10,950,3,'2025-11-13 23:45:46.822',1,NULL),(30,5,21,12136,2,'2025-11-14 00:43:09.876',1,NULL),(31,6,42,188,2,'2025-11-14 13:45:49.178',1,NULL),(32,2,47,2481,1,'2025-11-14 15:15:11.743',1,NULL),(33,2,14,508,2,'2025-11-14 15:15:52.349',1,NULL),(34,3,78,406,1,'2025-11-14 15:15:59.248',1,NULL),(35,6,20,301,2,'2025-11-14 15:17:40.233',1,NULL),(36,4,63,227,1,'2025-11-14 15:22:29.410',1,NULL),(37,5,23,161,1,'2025-11-14 15:35:10.871',1,NULL),(38,5,25,324,1,'2025-11-14 23:41:10.265',1,NULL),(39,1,60,496,1,'2025-11-14 23:55:25.235',1,NULL),(40,1,75,142,1,'2025-11-14 23:55:37.536',1,NULL),(41,3,7,84,2,'2025-11-14 23:55:38.892',1,NULL),(42,2,2,379,1,'2025-11-15 00:06:05.273',1,NULL),(43,4,3,502,2,'2025-11-15 02:19:32.502',1,NULL),(44,6,76,57,3,'2025-11-15 12:43:57.988',1,NULL),(45,4,74,93,1,'2025-11-15 23:11:36.401',1,NULL),(46,3,25,205,1,'2025-11-15 23:12:01.431',1,NULL),(47,2,46,651,1,'2025-11-15 23:12:40.896',1,NULL),(48,5,23,82,1,'2025-11-16 00:14:04.320',1,NULL),(49,1,2,334,1,'2025-11-16 09:48:07.880',1,NULL),(50,6,66,3279,1,'2025-11-16 11:23:32.077',1,NULL),(51,4,18,186,1,'2025-11-17 00:29:58.886',1,NULL),(52,3,83,17093,2,'2025-11-17 00:33:06.296',1,NULL),(53,5,28,1147,2,'2025-11-17 01:17:38.878',1,NULL),(54,1,68,3513,2,'2025-11-17 05:46:19.394',1,NULL),(55,2,23,126,2,'2025-11-17 06:36:00.909',1,NULL),(56,6,2,363,1,'2025-11-17 08:35:59.130',1,NULL),(57,1,81,1740,2,'2025-11-17 23:01:01.042',1,NULL),(58,2,50,1893,2,'2025-11-17 23:01:05.646',1,NULL),(59,3,77,115,1,'2025-11-17 23:01:33.920',1,NULL),(60,2,21,13027,2,'2025-11-17 23:05:14.833',1,NULL),(61,2,26,58,1,'2025-11-17 23:05:28.669',1,NULL),(62,2,71,3217,3,'2025-11-17 23:05:41.378',1,NULL),(63,2,9,494,2,'2025-11-17 23:05:57.344',1,NULL),(64,2,81,1938,1,'2025-11-17 23:07:53.402',2,2),(65,1,9,258,2,'2025-11-17 23:08:42.316',1,NULL),(66,1,58,230,2,'2025-11-17 23:08:47.002',1,NULL),(67,1,78,1004,1,'2025-11-17 23:08:52.221',1,NULL),(68,1,71,6523,1,'2025-11-17 23:08:58.146',1,NULL),(69,1,57,73,1,'2025-11-17 23:09:05.125',1,NULL),(70,1,8,380,1,'2025-11-17 23:10:03.939',2,NULL),(71,4,1,156,1,'2025-11-17 23:20:34.491',1,NULL),(72,4,12,200,1,'2025-11-17 23:20:40.585',1,NULL),(73,4,50,1647,1,'2025-11-17 23:20:45.201',1,NULL),(74,4,75,114,1,'2025-11-17 23:20:49.898',1,NULL),(75,4,65,3624,1,'2025-11-17 23:20:54.072',1,NULL),(76,4,46,736,1,'2025-11-17 23:20:58.260',1,NULL),(77,3,83,12805,2,'2025-11-17 23:28:39.751',1,NULL),(78,3,59,244,2,'2025-11-17 23:28:51.865',1,NULL),(79,3,5,8728,1,'2025-11-17 23:29:16.338',1,NULL),(80,3,15,2705,1,'2025-11-17 23:29:34.674',1,NULL),(81,7,9,350,1,'2025-11-17 23:32:07.318',1,NULL),(82,6,47,2486,1,'2025-11-18 17:22:02.984',1,NULL),(83,6,80,639,1,'2025-11-18 17:22:12.948',1,NULL),(84,6,75,180,1,'2025-11-18 17:22:21.915',1,NULL),(85,6,1,170,1,'2025-11-18 17:22:30.618',1,NULL),(86,6,46,1024,1,'2025-11-18 17:22:41.897',1,NULL),(87,6,1,117,1,'2025-11-18 17:22:50.550',1,NULL),(88,3,44,1657,1,'2025-11-18 17:24:25.674',1,NULL),(89,3,61,2310,1,'2025-11-18 17:25:12.157',2,2),(90,5,25,161,2,'2025-11-18 21:10:15.673',1,NULL),(91,5,28,713,1,'2025-11-18 21:10:31.019',1,NULL),(92,5,4,4525,2,'2025-11-18 21:10:39.655',1,NULL),(93,5,32,10269,2,'2025-11-18 21:10:44.354',1,NULL),(94,5,1,281,1,'2025-11-18 21:10:48.406',1,NULL),(95,5,26,42,2,'2025-11-18 21:10:54.486',1,NULL),(96,4,5,8946,2,'2025-11-19 00:10:44.428',2,1),(97,3,44,2408,2,'2025-11-19 00:18:33.683',2,1),(98,1,3,614,1,'2025-11-19 05:55:39.139',2,2),(99,2,24,90,2,'2025-11-19 07:32:45.025',2,1),(100,6,43,377,1,'2025-11-19 16:02:18.560',1,NULL),(101,2,4,3735,2,'2025-11-19 23:48:42.918',2,1),(102,1,46,1150,2,'2025-11-19 23:49:17.204',2,1),(103,7,8,301,2,'2025-11-20 00:06:45.450',1,NULL),(104,3,5,6938,2,'2025-11-20 02:15:13.950',2,2),(105,4,67,3982,2,'2025-11-20 08:13:36.046',2,1),(106,6,1,139,2,'2025-11-20 12:45:39.019',2,1),(107,5,27,339,1,'2025-11-20 16:53:25.676',2,2),(108,1,31,5730,2,'2025-11-20 23:03:15.581',2,1),(109,2,31,5129,1,'2025-11-20 23:19:11.060',2,2),(110,3,32,5459,2,'2025-11-20 23:38:22.318',2,1),(111,4,30,485,1,'2025-11-21 00:16:47.049',2,2),(112,5,30,500,1,'2025-11-21 00:31:42.354',2,2),(113,7,40,79,1,'2025-11-21 02:18:41.760',1,NULL),(114,6,67,3789,1,'2025-11-21 22:09:04.481',2,2),(115,5,28,612,1,'2025-11-22 00:28:02.536',2,2),(116,4,43,731,2,'2025-11-22 00:29:32.413',2,1),(117,3,61,2171,2,'2025-11-22 00:39:46.224',2,2),(118,1,7,98,2,'2025-11-22 08:15:45.855',2,1),(119,2,33,2331,2,'2025-11-22 11:45:10.326',2,1),(120,6,37,17927,3,'2025-11-22 15:16:22.866',2,2),(121,1,19,451,2,'2025-11-22 23:24:52.439',2,1),(122,4,15,2129,1,'2025-11-22 23:39:01.694',2,2),(123,3,46,679,2,'2025-11-22 23:43:55.984',2,2),(124,5,28,1020,2,'2025-11-23 02:26:28.966',2,1),(125,2,29,1396,1,'2025-11-23 06:57:12.866',2,2),(126,6,79,881,2,'2025-11-23 12:46:15.146',2,2),(127,5,71,6597,2,'2025-11-24 01:11:39.978',2,1),(128,4,74,80,2,'2025-11-24 01:17:09.678',2,1),(129,3,63,109,2,'2025-11-24 02:09:57.620',2,2),(130,2,1,273,2,'2025-11-24 06:24:59.758',2,1),(131,1,3,310,2,'2025-11-24 06:26:42.071',2,1),(132,6,27,310,2,'2025-11-24 13:24:34.312',2,1),(133,7,48,3531,2,'2025-11-24 21:22:53.551',1,NULL),(134,6,46,1418,1,'2025-11-24 23:03:12.904',2,2),(135,1,30,265,2,'2025-11-24 23:09:21.789',2,1),(136,7,41,129,1,'2025-11-24 23:13:07.128',1,NULL),(137,2,29,1847,2,'2025-11-24 23:27:57.718',2,1),(138,4,3,782,2,'2025-11-24 23:33:42.296',2,2);
/*!40000 ALTER TABLE `CaughtFish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fish`
--

DROP TABLE IF EXISTS `Fish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_weight` int NOT NULL,
  `max_weight` int NOT NULL,
  `rarity` enum('COMMON','UNCOMMON','RARE','EPIC','LEGENDARY') COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` enum('OCEAN','RIVER','LAKE','ICE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Fish_name_key` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fish`
--

LOCK TABLES `Fish` WRITE;
/*!40000 ALTER TABLE `Fish` DISABLE KEYS */;
INSERT INTO `Fish` VALUES (1,'Bouche-noire huileux','https://wow.zamimg.com/images/wow/icons/large/inv_misc_monsterhead_04.jpg','Un poisson gras des eaux profondes, utilisé en alchimie',100,300,'COMMON','OCEAN','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(2,'Maquereau de Baie-du-Butin','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_24.jpg','Un poisson argenté commun dans les eaux côtières',150,400,'COMMON','OCEAN','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(3,'Saumon de Lordamere','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_20.jpg','Un saumon robuste des mers du nord',300,800,'UNCOMMON','OCEAN','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(4,'Requin des mers du sud','https://wow.zamimg.com/images/wow/icons/large/inv_pet_babyshark.jpg','Un prédateur redoutable des profondeurs abyssales',2000,5000,'RARE','OCEAN','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(5,'Poisson-Dragon des Abysses','https://wow.zamimg.com/images/wow/icons/large/inv_azj-kahetslumshark_cyan.jpg','Une créature légendaire bioluminescente des fosses marines',5000,15000,'EPIC','OCEAN','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(6,'Trident des océans','https://wow.zamimg.com/images/wow/icons/large/inv_polearm_2h_kthirrelic_d_01.jpg','Un trident magique des profondeurs marines. Magique ou juste magnifique ?',5000,15000,'LEGENDARY','OCEAN','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(7,'Poisson-Chat Tacheté','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_29.jpg','Un poisson-chat commun des rivières tranquilles',80,250,'COMMON','RIVER','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(8,'Truite Arc-en-ciel','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_02.jpg','Une truite colorée prisée des pêcheurs',150,400,'COMMON','RIVER','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(9,'Perche du Lac Darrowmere','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_03.jpg','Un carnassier agile des eaux douces',200,600,'UNCOMMON','RIVER','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(10,'Brochet de la Forêt','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_91.jpg','Un prédateur féroce des rivières de la forêt',500,1500,'RARE','RIVER','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(11,'Carpe Dorée Mystique','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_103.jpg','Une carpe légendaire qui porte chance à celui qui la pêche',3000,8000,'LEGENDARY','RIVER','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(12,'Poisson de Sang','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_34.jpg','Un petit poisson aux écailles rouges des lacs pollués',60,200,'COMMON','LAKE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(13,'Poisson de Montagne','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_93.jpg','Un poisson robuste adapté aux lacs en altitude',120,350,'COMMON','LAKE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(14,'Sandre de Cristal','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_iridescentamberjack.jpg','Un poisson aux écailles translucides des lacs enchantés',250,700,'UNCOMMON','LAKE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(15,'Canatracien des lacs','https://wow.zamimg.com/images/wow/icons/large/inv_frogduck.jpg','Un batracien au bec de canard, plus malicieux que dangereux',1000,3000,'RARE','LAKE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(16,'Poisson déviant','https://wow.zamimg.com/images/wow/icons/large/inv_misc_monsterhead_01.jpg','Un poisson trés rare et trés recherché pour ses ... propriété',4000,12000,'EPIC','LAKE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(17,'Serpent lacustre','https://wow.zamimg.com/images/wow/icons/large/achievement_faction_serpentriders.jpg','Un serpent des lacs aux écailles éclatantes',9000,24000,'LEGENDARY','LAKE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(18,'Saumon Glaciaire','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_48.jpg','Un saumon adapté aux eaux gelées de Norfendre',150,400,'COMMON','ICE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(19,'Morue du Nord','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_87.jpg','Une morue robuste des mers arctiques',200,500,'UNCOMMON','ICE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(20,'Poisson de Glace Museau-froid','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_gulper1.jpg','Un poisson aux écailles givrées prisé pour sa chair délicate',300,800,'RARE','ICE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(21,'Tortuga des Glaces Éternelles','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_turtle_01.jpg','Une créature marine qui a enfin pu atteindre l\'océan',8000,20000,'EPIC','ICE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(22,'Sirene des lacs gelés','https://wow.zamimg.com/images/wow/icons/large/achievement_boss_zuldazar_jaina.jpg','Une sirène mystique des lacs du Nord',1500,4000,'LEGENDARY','ICE','2025-11-10 15:06:58.000','2025-11-10 15:06:58.000'),(23,'Hareng des récifs','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_redtailloach.jpg','Petit poisson argenté vivant près des coraux, très courant dans les filets des pêcheurs côtiers.',80,250,'COMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(24,'Gobie des marées','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_69.jpg','Minuscule poisson tacheté qui se cache dans les flaques à marée basse, facile à attraper pour les apprentis pêcheurs.',40,120,'COMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(25,'Mulet écumeux','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_saberfish2.jpg','Poisson robuste qui suit les bateaux de pêche, se nourrissant des restes jetés par-dessus bord.',150,400,'COMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(26,'Sardine lunaire','https://wow.zamimg.com/images/wow/icons/large/inv_magicalfishpet.jpg','Bancs scintillants qui illuminent la surface la nuit, prisés pour leurs écailles nacrées.',30,90,'COMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(27,'Rouget à nageoires pourpres','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_22.jpg','Poisson côtier aux nageoires rouges, dont la chair est appréciée des tavernes portuaires.',300,800,'UNCOMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(28,'Bar rayé des abysses','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_100.jpg','Poisson nerveux vivant entre deux eaux, connu pour ses bandes sombres et ses brusques accélérations.',600,1500,'UNCOMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(29,'Raie à pointes nacrées','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_59.jpg','Raie discrète qui se tapit dans le sable, ses pointes nacrées valent quelques pièces d\'or.',800,2000,'UNCOMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(30,'Calmar à anneaux bleus','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_70.jpg','Petit calmar aux anneaux luminescents, souvent utilisé par les mages comme composant alchimique.',200,600,'UNCOMMON','OCEAN','2025-11-14 09:42:06.681','2025-11-14 15:56:11.241'),(31,'Mérou cuirasse de corail','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_61.jpg','Poisson massif à la peau rugueuse, presque aussi dure que la pierre de corail.',3000,7000,'RARE','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(32,'Thon tempête','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_60.jpg','Puissant nageur qui apparaît avant les orages, dit porter la colère des mers dans sa chair.',5000,11000,'RARE','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(33,'Dragonnet des mers profondes','https://wow.zamimg.com/images/wow/icons/large/inv_chromaticdragonpet2.jpg','Petit reptile marin écailleux qui crache parfois de minuscules jets d\'eau brûlante.',1200,2500,'RARE','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(34,'Murène aux yeux d\'ambre','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_76.jpg','Prédateur des crevasses rocheuses, ses yeux brillent d\'un éclat inquiétant dans l\'obscurité.',1500,3500,'RARE','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(35,'Serpent de mer fulgurant','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_80.jpg','Créature allongée parcourue de décharges électriques, capable de foudroyer un marin imprudent.',8000,18000,'EPIC','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(36,'Raie-fantôme azur','https://wow.zamimg.com/images/wow/icons/large/inv_fish_stormraygreen.jpg','Raie translucide qui glisse silencieusement dans les abysses, laissant derrière elle une traînée lumineuse.',6000,14000,'EPIC','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(37,'Requin runique','https://wow.zamimg.com/images/wow/icons/large/inv_sharkraymount_3.jpg','Requin marqué de runes anciennes, attiré par la magie et les artefacts engloutis.',10000,22000,'EPIC','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(38,'Léviathan des Mille Vagues','https://wow.zamimg.com/images/wow/icons/large/inv_pet_leviathan_green.jpg','Titan des océans dont le dos est parfois pris pour une île, craint par tous les navigateurs.',250000,450000,'LEGENDARY','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(39,'Kraken aux chaînes brisées','https://wow.zamimg.com/images/wow/icons/large/inv_helm_misc_squidpartyhat.jpg','Monstre tentaculaire légendaire, les vestiges de chaînes anciennes pendent encore de ses membres.',180000,350000,'LEGENDARY','OCEAN','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(40,'Gardon tacheté','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_whiptail3.jpg','Petit poisson de rivière très commun, facile à pêcher même avec une ligne grossière.',50,150,'COMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(41,'Perche de ruisseau','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_74.jpg','Poisson rayé qui vit dans les eaux claires et peu profondes, apprécié des enfants pêcheurs.',70,220,'COMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(42,'Truitelle argentée','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_sturgeon3.jpg','Jeune truite vive et brillante, difficile à attraper sans une bonne discrétion.',60,200,'COMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(43,'Carpe des plaines','https://wow.zamimg.com/images/wow/icons/large/inv_fish_silvermackerelsilver.jpg','Poisson robuste des rivières lentes, souvent élevé dans les bassins des villages.',300,900,'COMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(44,'Silure moustachu','https://wow.zamimg.com/images/wow/icons/large/inv_fish_mossgillperchblue.jpg','Gros poisson de fond, reconnaissable à ses longues moustaches sensorielles.',1000,4000,'UNCOMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(45,'Brochet aux crocs d\'ombre','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_12.jpg','Prédateur rapide qui attaque depuis les herbiers, ses crocs sombres marquent profondément la chair.',1200,5000,'UNCOMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(46,'Anguille de crue','https://wow.zamimg.com/images/wow/icons/large/inv_misc_food_163_fish_91.jpg','Anguille vive qui remonte les torrents lors des crues, difficile à tenir une fois sortie de l\'eau.',500,1500,'UNCOMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(47,'Saumon des collines','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_27.jpg','Poisson migrateur qui remonte les rivières escarpées, symbole de persévérance pour les clans montagnards.',800,2500,'UNCOMMON','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(48,'Carpe dorée impériale','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_43.jpg','Carpe brillante élevée jadis dans les jardins d\'un empire disparu, censée porter bonheur.',2000,6000,'RARE','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(49,'Truite arcane','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_23.jpg','Poisson infusé de magie, ses écailles changent de couleur selon les courants mystiques.',1500,3500,'RARE','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(50,'Ombre fluviale','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_54.jpg','Poisson sombre qui ne laisse que sa silhouette apparaître sous la surface agitée.',900,2400,'RARE','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(51,'Silure cuirassé','https://wow.zamimg.com/images/wow/icons/large/inv_misc_food_164_fish_seadog.jpg','Poisson massif recouvert de plaques osseuses, presque insensible aux hameçons ordinaires.',3000,8000,'RARE','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(52,'Hydrelette de rivière','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_seascorpion1.jpg','Créature à plusieurs petites têtes, encore jeune mais déjà redoutée des pêcheurs.',7000,15000,'EPIC','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(53,'Esprit aquatique lié','https://wow.zamimg.com/images/wow/icons/large/ability_mount_progenitorjellyfish_darkred.jpg','Manifestation élémentaire liée à un ancien pacte, parfois attirée par les offrandes jetées à l\'eau.',2000,5000,'EPIC','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(54,'Saumon du roi-loup','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_98.jpg','Saumon gigantesque honoré par certaines tribus, sa capture est un rite de passage guerrier.',4000,9000,'EPIC','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(55,'Hydre des anciens remous','https://wow.zamimg.com/images/wow/icons/large/trade_archaeology_whitehydrafigurine.jpg','Monstre fluvial aux nombreuses têtes, chaque coup mal porté en fait repousser une nouvelle.',25000,60000,'LEGENDARY','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(56,'Gardien des Ponts engloutis','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_lure_starfish.jpg','Esprit-serpent qui hante les ponts effondrés, attaquant ceux qui profanent les eaux sacrées.',30000,80000,'LEGENDARY','RIVER','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(57,'Ablette miroir','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_lure_frogfish.jpg','Petit poisson de banc dont les écailles reflètent la lumière comme de minuscules miroirs.',30,110,'COMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(58,'Perche rayée de lac','https://wow.zamimg.com/images/wow/icons/large/inv_crystalinefish_pink.jpg','Poisson agile qui chasse les insectes tombés à la surface des lacs calmes.',80,260,'COMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(59,'Poisson-chat boueux','https://wow.zamimg.com/images/wow/icons/large/inv_whiskerfish_orange.jpg','Habitant des fonds vaseux, reconnaissable à ses barbillons et à son odeur tenace.',200,700,'COMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(60,'Carassin paisible','https://wow.zamimg.com/images/wow/icons/large/inv_10_fishing_fishdecayed_color2.jpg','Poisson placide vivant près des roseaux, rarement effrayé par la présence des bateaux.',150,500,'COMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(61,'Sandre ombrageux','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_sturgeon2.jpg','Prédateur nocturne qui se cache dans les structures immergées, chassant à la tombée de la nuit.',800,2500,'UNCOMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(62,'Tanche émeraude','https://wow.zamimg.com/images/wow/icons/large/inv_misc_scales_fishgreen01.jpg','Poisson aux reflets verts, réputé pour sa résistance et sa chair délicate.',600,1800,'UNCOMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(63,'Perche-soleil chatoyante','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_50.jpg','Petit poisson coloré, souvent gardé comme ornement vivant dans les bassins enchantés.',100,300,'UNCOMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(64,'Omble des brumes','https://wow.zamimg.com/images/wow/icons/large/inv_fish_oodelfjiskgreen.jpg','Poisson discret qui apparaît au lever du jour, lorsque la brume recouvre encore le lac.',500,1500,'UNCOMMON','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(65,'Brochet royal de lac','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_96.jpg','Prédateur solitaire de grande taille, au museau effilé et aux yeux perçants.',2500,8000,'RARE','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(66,'Carpe lune','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_92.jpg','Carpe massive aux écailles pâles qui brillent sous la lumière des étoiles.',2000,5500,'RARE','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(67,'Lotte des profondeurs','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_84.jpg','Poisson difforme vivant dans les trous les plus sombres du fond lacustre.',1500,4000,'RARE','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(68,'Truite marbrée','https://wow.zamimg.com/images/wow/icons/large/inv_10_tracking_fishing.jpg','Truite tachetée au motif unique, très recherchée par les collectionneurs de trophées.',1800,4200,'RARE','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(69,'Tortue mordorée géante','https://wow.zamimg.com/images/wow/icons/large/inv_turtlemount2_blue.jpg','Tortue ancienne portant parfois de la mousse et de petits arbustes sur sa carapace.',12000,30000,'EPIC','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(70,'Serpent lacustre aux mille yeux','https://wow.zamimg.com/images/wow/icons/large/inv_lunarsnakemountclassic.jpg','Long reptile aquatique couvert d\'yeux luisants, chacun semblant observer un monde différent.',15000,35000,'EPIC','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(71,'Nymphe des eaux stagnantes','https://wow.zamimg.com/images/wow/icons/large/inv_pet_reliquarydesire.jpg','Esprit fragile et capricieux, parfois visible sous forme de silhouette lumineuse à la surface.',3000,8000,'EPIC','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(72,'Bête du lac Voilé','https://wow.zamimg.com/images/wow/icons/large/inv_misc_monsterhead_03.jpg','Créature colossale dont on n\'aperçoit que la silhouette sous la brume épaisse.',40000,90000,'LEGENDARY','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(73,'Ancien Koi du prophète','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_102.jpg','Poisson sacré qui aurait écouté les confidences d\'un prophète, vénéré par plusieurs cultes.',15000,35000,'LEGENDARY','LAKE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(74,'Éperlan givré','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_10.jpg','Petit poisson translucide adapté aux eaux glacées, souvent mangé grillé par les trappeurs.',40,120,'COMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(75,'Capelan des glaces','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_07.jpg','Poisson de banc qui longe les banquises, attirant les phoques et les ours polaires.',60,180,'COMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(76,'Gobie polaire','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_94.jpg','Minuscule poisson se faufilant entre les blocs de glace, supportant des températures extrêmes.',30,90,'COMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(77,'Hareng gelé','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_35.jpg','Hareng robuste des mers froides, souvent pris au piège dans la glace de surface.',80,220,'COMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(78,'Morue des banquises','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_78.jpg','Poisson blanc charnu, ressource essentielle des villages côtiers du nord.',400,1500,'UNCOMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(79,'Truite des neiges','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_77.jpg','Truite tachetée vivant dans les torrents glacés, réputée pour sa chair ferme.',300,900,'UNCOMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(80,'Omble cristal','https://wow.zamimg.com/images/wow/icons/large/inv_crystalinefish_blue.jpg','Poisson étincelant semblable à un éclat de glace, difficile à repérer dans l\'eau claire.',250,800,'UNCOMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(81,'Raie de glace','https://wow.zamimg.com/images/wow/icons/large/inv_fish_stormray.jpg','Raie pâle qui se déplace lentement sous la surface gelée, presque invisible vue du dessus.',700,2000,'UNCOMMON','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(82,'Flétan boréal','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_whiptail2.jpg','Poisson plat de grande taille vivant sur les plateaux glacés des fonds marins.',5000,15000,'RARE','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(83,'Requin du givre','https://wow.zamimg.com/images/wow/icons/large/inv_babymurlo3frost.jpg','Requin massif au souffle glacé, ses nageoires laissent des traînées de givre dans l\'eau.',7000,18000,'RARE','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(84,'Anguille de givre runique','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_whiptail1.jpg','Anguille marquée de runes de glace, utilisée comme catalyseur dans certains rituels.',1000,2500,'RARE','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(85,'Carpe gelécaille','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_89.jpg','Carpe robuste aux écailles givrées, vivant dans les lacs pris par les glaces la majeure partie de l\'année.',1500,3500,'RARE','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(86,'Mégalodon des glaces éternelles','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_skulker3.jpg','Prédateur gigantesque des profondeurs polaires, rarement vu et encore plus rarement survécu.',50000,120000,'EPIC','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(87,'Dragonnet de givre','https://wow.zamimg.com/images/wow/icons/large/inv_pet_dkwhelplingfrost.jpg','Petit dragon aquatique aux ailes membraneuses gelées, capable de souffler un souffle glacé.',8000,20000,'EPIC','ICE','2025-11-14 09:42:06.681','2025-11-17 22:29:04.654'),(88,'Esprit des eaux gelées','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_64.jpg','Entité élémentaire gardienne des fjords, se manifestant sous forme de tourbillon de neige et d\'eau.',3000,9000,'EPIC','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(89,'Léviathan des banquises','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_ammonite1.jpg','Colosse marin qui brise la glace à son passage, annonçant parfois la fin des hivers maudits.',200000,400000,'LEGENDARY','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000'),(90,'Avatar de la Mer gelée','https://wow.zamimg.com/images/wow/icons/large/inv_eyeballjellyfish.jpg','Incarnation quasi divine du froid océanique, entourée d\'un halo de neige tourbillonnante.',60000,150000,'LEGENDARY','ICE','2025-11-14 09:42:06.681','2025-11-14 09:42:06.000');
/*!40000 ALTER TABLE `Fish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lure`
--

DROP TABLE IF EXISTS `Lure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emoji` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Lure_name_key` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lure`
--

LOCK TABLES `Lure` WRITE;
/*!40000 ALTER TABLE `Lure` DISABLE KEYS */;
INSERT INTO `Lure` VALUES (1,'2 ⭐ ou +','🪝','Un leurre doré qui attire les poissons de bonne qualité',1,'2025-11-15 09:38:29.000','2025-11-15 09:38:29.000'),(2,'🟩 ou +','🪝','Un leurre prismatique qui repousse les poissons basiques',1,'2025-11-15 09:38:29.000','2025-11-15 09:38:29.000'),(3,'🆕 🐟','🪝','Un leurre customisé spécialement pour attirer un nouveau poisson ',0,'2025-11-15 09:38:29.000','2025-11-15 09:38:29.000');
/*!40000 ALTER TABLE `Lure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OngoingFishingSession`
--

DROP TABLE IF EXISTS `OngoingFishingSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OngoingFishingSession` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerDiscordId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discordMessageId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `userId` int NOT NULL,
  `lureId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OngoingFishingSession_userId_fkey` (`userId`),
  KEY `OngoingFishingSession_lureId_fkey` (`lureId`),
  CONSTRAINT `OngoingFishingSession_lureId_fkey` FOREIGN KEY (`lureId`) REFERENCES `Lure` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OngoingFishingSession_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OngoingFishingSession`
--

LOCK TABLES `OngoingFishingSession` WRITE;
/*!40000 ALTER TABLE `OngoingFishingSession` DISABLE KEYS */;
/*!40000 ALTER TABLE `OngoingFishingSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discordId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caneId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `flaggedForDeletion` tinyint(1) NOT NULL DEFAULT '0',
  `discordName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unknown',
  `caneSkinId` int DEFAULT NULL,
  `extraFishNbr` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_discordId_key` (`discordId`),
  KEY `User_caneId_fkey` (`caneId`),
  KEY `User_caneSkinId_fkey` (`caneSkinId`),
  CONSTRAINT `User_caneId_fkey` FOREIGN KEY (`caneId`) REFERENCES `Cane` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `User_caneSkinId_fkey` FOREIGN KEY (`caneSkinId`) REFERENCES `CaneSkin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'275376364197117952',2,'2025-11-10 15:33:05.911','2025-11-17 23:09:20.663',1,0,'Silverlord',NULL,0),(2,'264701644879560704',2,'2025-11-10 15:33:17.812','2025-11-17 23:06:21.831',0,0,'Alithegood',NULL,0),(3,'245669484470337539',2,'2025-11-10 15:34:02.283','2025-11-18 17:25:07.443',0,0,'Zolock',NULL,0),(4,'464828922656325653',2,'2025-11-10 16:15:17.185','2025-11-17 23:20:58.557',0,0,'JohnApache',NULL,0),(5,'221295049097478145',2,'2025-11-10 16:48:07.246','2025-11-18 21:10:54.724',0,0,'mytix',NULL,0),(6,'717114512880435291',2,'2025-11-11 14:36:47.843','2025-11-19 16:02:18.893',0,0,'ShiroYuno',1,0),(7,'455449164369625088',1,'2025-11-17 23:31:58.452','2025-11-17 23:31:58.452',0,0,'Liocas',NULL,0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('01757c7f-9b8c-4b98-8f13-2dd235e3245a','18410a858b115608a4ff86899e2ef29571cb3c60991920796007ca0b9efb22b0','2025-11-15 15:58:06.944','20251115095832_add_lure_to_ongoing_session',NULL,NULL,'2025-11-15 15:58:06.869',1),('2276d3eb-56fe-4894-9729-09b44ed02863','5ed1303558d9988e50f9023e299e2f9baa691f982d6fd262178ce98a45c51243','2025-11-10 15:06:58.526','20251110071747_init_db',NULL,NULL,'2025-11-10 15:06:58.332',1),('246974ba-1d36-4699-8e4a-ca3a4b2cedac','c5e2c88e059ba85e61602c358c6bb30dc40c55b4180d9134461b9d70e16a0953','2025-11-14 11:28:18.043','20251114094426_add_extrafish_to_user',NULL,NULL,'2025-11-14 11:28:18.012',1),('43a0b0e5-940c-4d76-a2bd-386ea0698d5f','db2a8ac56b2cf1e5b61b69c51668cdc57844bd8f05e4a270ae0536034f79058a','2025-11-10 15:06:58.538','20251110074644_seed_basic_canes',NULL,NULL,'2025-11-10 15:06:58.529',1),('5e08251f-5bf6-45e7-8f78-590bb74150a7','72cd457cb1a7af58e8d4ede707cde2c23bd3467f5adbd68aea795018ebd6b631','2025-11-11 11:31:50.698','20251111105711_add_relation_user_ongoing_fishing',NULL,NULL,'2025-11-11 11:31:50.645',1),('6a29a0aa-9f48-4ab4-aad9-2d2f574bbb90','d766bcb4bc5a69ede0feeead9aeb5e8908f17254359859aa229cbf7a93230427','2025-11-11 11:31:50.644','20251111105250_add_discord_name_used_cane',NULL,NULL,'2025-11-11 11:31:50.555',1),('75c71ac7-b556-4d1d-9f64-3ad2d7f5bea8','e17a7f300cbf0b90c4c7e68e12f5a75c78c9bc984ed39a3f168a5259cc704ec7','2025-11-10 15:06:58.549','20251110075229_seed_basic_fishes',NULL,NULL,'2025-11-10 15:06:58.540',1),('c2f744a8-3377-4553-bc2e-03fe2100830d','d444fcf39bb4b253c9bf708cd40572e9e61c528d5ae14f4d3237ee937fbf11ca','2025-11-15 15:58:06.867','20251115093458_add_lures_table',NULL,NULL,'2025-11-15 15:58:06.733',1),('c64efd23-731c-4d01-af17-f1cbd903e967','ec67fb05246d59813f6a755590cfcf17caa15a994f4b62734c94b9e9c070efca','2025-11-10 15:06:58.568','20251110123805_add_ongoing_fishing_sessions_tables',NULL,NULL,'2025-11-10 15:06:58.551',1),('e0fec8b4-f68a-4eda-8e53-5187e370f3df','e2be54d23c5c334e5a2b6061d8c4cfbf585b96a6425d3e5c290f8e008b8a4708','2025-11-12 19:43:52.766','20251112192620_add_cane_skin_table',NULL,NULL,'2025-11-12 19:43:52.678',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-25  1:01:01
