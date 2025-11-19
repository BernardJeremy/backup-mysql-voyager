-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: dyb_fishing
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
INSERT INTO `Cane` VALUES (1,'Canne en bois','https://i.ibb.co/ccFWmhhm/wooden.png','Une simple canne en bois pour les débutants',0,0,0,0,'2025-11-10 14:41:38.000','2025-11-10 14:41:38.000',0),(2,'Canne en fer','https://i.ibb.co/Q39SgSXt/iron.png','Une canne renforcée en fer',15,-5,5,0,'2025-11-10 14:41:38.000','2025-11-10 14:41:38.000',1),(3,'Canne en carbone','https://i.ibb.co/SXp4r6hC/carbon.png','Une canne de qualité professionnelle en carbonne',100,-15,10,5,'2025-11-10 14:41:38.000','2025-11-10 14:41:38.000',1),(4,'Canne en thorium','https://i.ibb.co/6RYg4KJZ/thorium.png','La canne ultime pour les experts, avec un corps en thorium',300,-30,20,10,'2025-11-10 14:41:38.000','2025-11-10 14:41:38.000',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CaneSkin`
--

LOCK TABLES `CaneSkin` WRITE;
/*!40000 ALTER TABLE `CaneSkin` DISABLE KEYS */;
INSERT INTO `CaneSkin` VALUES (1,'Canne du Rêve','https://i.ibb.co/dst7X5Qf/susu.png','Une canne à pêche reservée aux druides méritants et ensommeillés','2025-11-12 19:44:34.000','2025-11-12 22:39:07.206'),(2,'Cann-a-boom','https://i.ibb.co/mFSv7C3S/anargyres.png','Une canne à pêche qui tire sur les poissons. Ca doit marcher non ?','2025-11-12 19:44:44.000','2025-11-12 22:38:37.795'),(3,'THE Ultra Canne','https://i.ibb.co/PvqvP4Rp/pokedyb.png','Seul un maitre Pokemon peut posséder cette canne à pêche','2025-11-12 22:24:06.572','2025-11-12 22:31:18.637'),(4,'Data-canne','https://i.ibb.co/jvcGcWYd/gsheet.png','Une canne à pêche qui gère trés bien les données','2025-11-12 22:30:32.145','2025-11-12 22:30:32.145');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CaughtFish`
--

LOCK TABLES `CaughtFish` WRITE;
/*!40000 ALTER TABLE `CaughtFish` DISABLE KEYS */;
INSERT INTO `CaughtFish` VALUES (2,2,13,128,3,'2025-11-10 18:53:03.309',1,NULL),(3,4,18,270,1,'2025-11-10 18:53:19.147',1,NULL),(4,3,19,273,1,'2025-11-10 18:53:55.648',1,NULL),(5,7,10,1321,1,'2025-11-10 18:54:00.913',1,NULL),(6,6,7,134,2,'2025-11-10 18:54:00.971',1,NULL),(7,5,3,680,1,'2025-11-10 18:54:02.187',1,NULL),(8,8,7,187,2,'2025-11-10 20:26:11.713',1,NULL),(9,1,2,319,3,'2025-11-10 21:44:22.868',1,NULL),(10,7,7,184,2,'2025-11-10 23:00:51.219',1,NULL),(11,4,13,205,1,'2025-11-10 23:01:05.606',1,NULL),(12,1,5,13889,2,'2025-11-10 23:01:17.989',1,NULL),(13,3,21,18209,1,'2025-11-10 23:02:13.331',1,NULL),(14,2,19,283,1,'2025-11-10 23:02:51.412',1,NULL),(15,8,18,287,2,'2025-11-10 23:03:17.767',1,NULL),(16,9,20,445,2,'2025-11-11 08:39:36.099',1,NULL),(17,5,1,134,1,'2025-11-11 08:40:26.176',1,NULL),(18,10,18,286,1,'2025-11-11 10:18:30.439',1,NULL),(19,4,2,320,1,'2025-11-11 23:08:18.608',1,NULL),(20,1,9,420,1,'2025-11-11 23:18:11.285',1,NULL),(21,10,12,180,1,'2025-11-12 07:02:06.622',1,NULL),(22,5,4,2058,1,'2025-11-12 07:02:29.594',1,NULL),(23,9,8,304,1,'2025-11-12 07:06:32.780',1,NULL),(24,3,20,560,2,'2025-11-12 07:06:49.569',1,NULL),(25,8,15,1765,1,'2025-11-12 08:21:37.438',1,NULL),(26,2,12,139,1,'2025-11-12 09:30:01.490',1,NULL),(27,7,7,243,1,'2025-11-12 12:29:47.550',1,NULL),(28,10,12,167,1,'2025-11-12 23:03:57.332',1,NULL),(29,1,8,320,3,'2025-11-13 07:19:23.082',1,NULL),(30,4,8,300,1,'2025-11-13 07:19:59.302',1,NULL),(31,5,4,3493,1,'2025-11-13 07:20:26.711',1,NULL),(32,9,12,69,2,'2025-11-13 07:20:38.810',1,NULL),(33,8,20,456,1,'2025-11-13 07:27:12.124',1,NULL),(34,7,7,91,2,'2025-11-13 07:44:29.608',1,NULL),(35,2,14,662,2,'2025-11-13 07:54:16.292',1,NULL),(36,3,18,318,1,'2025-11-13 08:39:04.092',1,NULL),(37,11,7,130,1,'2025-11-13 20:49:59.907',1,NULL),(38,9,3,426,1,'2025-11-14 07:17:37.406',1,NULL),(39,4,18,291,2,'2025-11-14 07:18:08.320',1,NULL),(40,3,18,210,2,'2025-11-14 07:18:36.778',1,NULL),(41,8,8,381,3,'2025-11-14 07:45:27.287',1,NULL),(42,7,8,248,1,'2025-11-14 07:46:07.083',1,NULL),(43,10,4,3149,1,'2025-11-14 08:19:01.490',1,NULL),(44,5,13,346,1,'2025-11-14 08:19:30.727',1,NULL),(45,2,12,130,1,'2025-11-14 09:20:52.727',1,NULL),(46,1,81,1189,1,'2025-11-14 09:41:03.654',1,NULL),(47,2,65,7630,2,'2025-11-14 11:30:36.047',1,NULL),(48,9,62,936,1,'2025-11-14 11:30:46.843',1,NULL),(49,3,76,82,2,'2025-11-14 11:31:06.651',1,NULL),(50,10,67,2738,1,'2025-11-14 11:31:11.642',1,NULL),(51,5,18,288,1,'2025-11-14 11:31:14.394',1,NULL),(52,7,53,2861,2,'2025-11-14 11:31:22.762',1,NULL),(53,4,82,14624,1,'2025-11-14 11:32:26.802',1,NULL),(54,1,26,63,1,'2025-11-14 11:33:31.662',1,NULL),(55,8,30,354,1,'2025-11-14 12:19:29.052',1,NULL),(56,11,81,1839,1,'2025-11-14 19:54:57.811',1,NULL),(57,11,3,401,1,'2025-11-14 19:58:10.568',1,NULL),(58,4,7,161,1,'2025-11-14 23:00:25.953',1,NULL),(59,3,80,749,3,'2025-11-14 23:00:25.991',1,NULL),(60,7,60,290,1,'2025-11-14 23:00:40.736',1,NULL),(61,10,67,2073,1,'2025-11-14 23:02:22.810',1,NULL),(62,1,26,58,1,'2025-11-15 00:00:15.660',1,NULL),(63,9,49,2456,2,'2025-11-15 07:09:44.914',1,NULL),(64,8,19,296,1,'2025-11-15 08:18:48.887',1,NULL),(65,5,81,861,1,'2025-11-15 08:58:54.575',1,NULL),(66,2,12,174,1,'2025-11-15 08:59:02.037',1,NULL),(67,11,12,114,2,'2025-11-15 10:13:16.809',1,NULL),(68,7,14,604,1,'2025-11-15 23:04:32.173',1,NULL),(69,4,30,567,2,'2025-11-15 23:04:51.573',1,NULL),(70,10,64,1087,1,'2025-11-15 23:06:43.580',1,NULL),(71,1,64,755,1,'2025-11-15 23:14:00.514',1,NULL),(72,11,59,494,1,'2025-11-16 00:17:55.320',1,NULL),(73,5,79,324,2,'2025-11-16 07:18:46.249',1,NULL),(74,8,68,4123,2,'2025-11-16 08:27:07.016',1,NULL),(75,9,78,1042,2,'2025-11-16 08:27:52.818',1,NULL),(76,3,77,209,2,'2025-11-16 09:16:08.098',1,NULL),(77,2,58,184,1,'2025-11-16 11:57:47.408',1,NULL),(78,4,61,1526,2,'2025-11-16 23:01:40.303',1,NULL),(79,3,84,1395,1,'2025-11-16 23:02:08.138',1,NULL),(80,9,34,1715,1,'2025-11-16 23:02:08.769',1,NULL),(81,7,64,1435,1,'2025-11-16 23:07:39.772',1,NULL),(82,1,75,172,2,'2025-11-17 06:22:54.474',1,NULL),(83,10,60,309,1,'2025-11-17 06:23:15.039',1,NULL),(84,5,43,411,1,'2025-11-17 07:26:38.036',1,NULL),(85,2,13,181,2,'2025-11-17 08:57:41.349',1,NULL),(86,3,76,56,2,'2025-11-17 21:03:35.128',1,NULL),(87,7,61,1269,1,'2025-11-17 21:03:48.844',1,NULL),(88,1,63,214,1,'2025-11-17 21:04:04.067',1,NULL),(89,4,87,16641,1,'2025-11-17 21:04:06.535',1,NULL),(90,2,60,383,2,'2025-11-17 21:04:40.614',1,NULL),(91,4,5,6953,1,'2025-11-17 23:02:09.902',1,NULL),(92,3,76,66,1,'2025-11-17 23:02:28.306',1,NULL),(93,1,12,111,1,'2025-11-17 23:04:18.175',1,NULL),(94,7,46,1413,1,'2025-11-17 23:11:25.424',1,NULL),(95,5,64,1203,2,'2025-11-18 07:03:34.166',1,NULL),(96,9,26,52,1,'2025-11-18 07:05:27.752',1,NULL),(97,9,65,2966,1,'2025-11-18 07:05:36.702',1,NULL),(98,10,50,1363,1,'2025-11-18 09:52:51.782',1,NULL),(99,2,12,79,1,'2025-11-18 09:56:44.353',1,NULL),(100,4,68,2575,1,'2025-11-18 23:01:02.740',1,NULL),(101,3,19,320,1,'2025-11-18 23:01:47.882',1,NULL);
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
INSERT INTO `Fish` VALUES (1,'Bouche-noire huileux','https://wow.zamimg.com/images/wow/icons/large/inv_misc_monsterhead_04.jpg','Un poisson gras des eaux profondes, utilisé en alchimie',100,300,'COMMON','OCEAN','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(2,'Maquereau de Baie-du-Butin','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_24.jpg','Un poisson argenté commun dans les eaux côtières',150,400,'COMMON','OCEAN','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(3,'Saumon de Lordamere','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_20.jpg','Un saumon robuste des mers du nord',300,800,'UNCOMMON','OCEAN','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(4,'Requin des mers du sud','https://wow.zamimg.com/images/wow/icons/large/inv_pet_babyshark.jpg','Un prédateur redoutable des profondeurs abyssales',2000,5000,'RARE','OCEAN','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(5,'Poisson-Dragon des Abysses','https://wow.zamimg.com/images/wow/icons/large/inv_azj-kahetslumshark_cyan.jpg','Une créature légendaire bioluminescente des fosses marines',5000,15000,'EPIC','OCEAN','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(6,'Trident des océans','https://wow.zamimg.com/images/wow/icons/large/inv_polearm_2h_kthirrelic_d_01.jpg','Un trident magique des profondeurs marines. Magique ou juste magnifique ?',5000,15000,'LEGENDARY','OCEAN','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(7,'Poisson-Chat Tacheté','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_29.jpg','Un poisson-chat commun des rivières tranquilles',80,250,'COMMON','RIVER','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(8,'Truite Arc-en-ciel','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_02.jpg','Une truite colorée prisée des pêcheurs',150,400,'COMMON','RIVER','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(9,'Perche du Lac Darrowmere','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_03.jpg','Un carnassier agile des eaux douces',200,600,'UNCOMMON','RIVER','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(10,'Brochet de la Forêt','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_91.jpg','Un prédateur féroce des rivières de la forêt',500,1500,'RARE','RIVER','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(11,'Carpe Dorée Mystique','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_103.jpg','Une carpe légendaire qui porte chance à celui qui la pêche',3000,8000,'LEGENDARY','RIVER','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(12,'Poisson de Sang','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_34.jpg','Un petit poisson aux écailles rouges des lacs pollués',60,200,'COMMON','LAKE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(13,'Poisson de Montagne','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_93.jpg','Un poisson robuste adapté aux lacs en altitude',120,350,'COMMON','LAKE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(14,'Sandre de Cristal','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_iridescentamberjack.jpg','Un poisson aux écailles translucides des lacs enchantés',250,700,'UNCOMMON','LAKE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(15,'Canatracien des lacs','https://wow.zamimg.com/images/wow/icons/large/inv_frogduck.jpg','Un batracien au bec de canard, plus malicieux que dangereux',1000,3000,'RARE','LAKE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(16,'Poisson déviant','https://wow.zamimg.com/images/wow/icons/large/inv_misc_monsterhead_01.jpg','Un poisson trés rare et trés recherché pour ses ... propriété',4000,12000,'EPIC','LAKE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(17,'Serpent lacustre','https://wow.zamimg.com/images/wow/icons/large/achievement_faction_serpentriders.jpg','Un serpent des lacs aux écailles éclatantes',9000,24000,'LEGENDARY','LAKE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(18,'Saumon Glaciaire','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_48.jpg','Un saumon adapté aux eaux gelées de Norfendre',150,400,'COMMON','ICE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(19,'Morue du Nord','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_87.jpg','Une morue robuste des mers arctiques',200,500,'UNCOMMON','ICE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(20,'Poisson de Glace Museau-froid','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_gulper1.jpg','Un poisson aux écailles givrées prisé pour sa chair délicate',300,800,'RARE','ICE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(21,'Tortuga des Glaces Éternelles','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_turtle_01.jpg','Une créature marine qui a enfin pu atteindre l\'océan',8000,20000,'EPIC','ICE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(22,'Sirene des lacs gelés','https://wow.zamimg.com/images/wow/icons/large/achievement_boss_zuldazar_jaina.jpg','Une sirène mystique des lacs du Nord',1500,4000,'LEGENDARY','ICE','2025-11-10 14:41:38.000','2025-11-10 14:41:38.000'),(23,'Hareng des récifs','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_redtailloach.jpg','Petit poisson argenté vivant près des coraux, très courant dans les filets des pêcheurs côtiers.',80,250,'COMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(24,'Gobie des marées','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_69.jpg','Minuscule poisson tacheté qui se cache dans les flaques à marée basse, facile à attraper pour les apprentis pêcheurs.',40,120,'COMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(25,'Mulet écumeux','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_saberfish2.jpg','Poisson robuste qui suit les bateaux de pêche, se nourrissant des restes jetés par-dessus bord.',150,400,'COMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(26,'Sardine lunaire','https://wow.zamimg.com/images/wow/icons/large/inv_magicalfishpet.jpg','Bancs scintillants qui illuminent la surface la nuit, prisés pour leurs écailles nacrées.',30,90,'COMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(27,'Rouget à nageoires pourpres','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_22.jpg','Poisson côtier aux nageoires rouges, dont la chair est appréciée des tavernes portuaires.',300,800,'UNCOMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(28,'Bar rayé des abysses','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_100.jpg','Poisson nerveux vivant entre deux eaux, connu pour ses bandes sombres et ses brusques accélérations.',600,1500,'UNCOMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(29,'Raie à pointes nacrées','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_59.jpg','Raie discrète qui se tapit dans le sable, ses pointes nacrées valent quelques pièces d\'or.',800,2000,'UNCOMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(30,'Calmar à anneaux bleus','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_70.jpg','Petit calmar aux anneaux luminescents, souvent utilisé par les mages comme composant alchimique.',200,600,'UNCOMMON','OCEAN','2025-11-14 09:40:31.048','2025-11-14 15:55:18.096'),(31,'Mérou cuirasse de corail','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_61.jpg','Poisson massif à la peau rugueuse, presque aussi dure que la pierre de corail.',3000,7000,'RARE','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(32,'Thon tempête','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_60.jpg','Puissant nageur qui apparaît avant les orages, dit porter la colère des mers dans sa chair.',5000,11000,'RARE','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(33,'Dragonnet des mers profondes','https://wow.zamimg.com/images/wow/icons/large/inv_chromaticdragonpet2.jpg','Petit reptile marin écailleux qui crache parfois de minuscules jets d\'eau brûlante.',1200,2500,'RARE','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(34,'Murène aux yeux d\'ambre','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_76.jpg','Prédateur des crevasses rocheuses, ses yeux brillent d\'un éclat inquiétant dans l\'obscurité.',1500,3500,'RARE','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(35,'Serpent de mer fulgurant','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_80.jpg','Créature allongée parcourue de décharges électriques, capable de foudroyer un marin imprudent.',8000,18000,'EPIC','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(36,'Raie-fantôme azur','https://wow.zamimg.com/images/wow/icons/large/inv_fish_stormraygreen.jpg','Raie translucide qui glisse silencieusement dans les abysses, laissant derrière elle une traînée lumineuse.',6000,14000,'EPIC','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(37,'Requin runique','https://wow.zamimg.com/images/wow/icons/large/inv_sharkraymount_3.jpg','Requin marqué de runes anciennes, attiré par la magie et les artefacts engloutis.',10000,22000,'EPIC','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(38,'Léviathan des Mille Vagues','https://wow.zamimg.com/images/wow/icons/large/inv_pet_leviathan_green.jpg','Titan des océans dont le dos est parfois pris pour une île, craint par tous les navigateurs.',250000,450000,'LEGENDARY','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(39,'Kraken aux chaînes brisées','https://wow.zamimg.com/images/wow/icons/large/inv_helm_misc_squidpartyhat.jpg','Monstre tentaculaire légendaire, les vestiges de chaînes anciennes pendent encore de ses membres.',180000,350000,'LEGENDARY','OCEAN','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(40,'Gardon tacheté','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_whiptail3.jpg','Petit poisson de rivière très commun, facile à pêcher même avec une ligne grossière.',50,150,'COMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(41,'Perche de ruisseau','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_74.jpg','Poisson rayé qui vit dans les eaux claires et peu profondes, apprécié des enfants pêcheurs.',70,220,'COMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(42,'Truitelle argentée','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_sturgeon3.jpg','Jeune truite vive et brillante, difficile à attraper sans une bonne discrétion.',60,200,'COMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(43,'Carpe des plaines','https://wow.zamimg.com/images/wow/icons/large/inv_fish_silvermackerelsilver.jpg','Poisson robuste des rivières lentes, souvent élevé dans les bassins des villages.',300,900,'COMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(44,'Silure moustachu','https://wow.zamimg.com/images/wow/icons/large/inv_fish_mossgillperchblue.jpg','Gros poisson de fond, reconnaissable à ses longues moustaches sensorielles.',1000,4000,'UNCOMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(45,'Brochet aux crocs d\'ombre','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_12.jpg','Prédateur rapide qui attaque depuis les herbiers, ses crocs sombres marquent profondément la chair.',1200,5000,'UNCOMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(46,'Anguille de crue','https://wow.zamimg.com/images/wow/icons/large/inv_misc_food_163_fish_91.jpg','Anguille vive qui remonte les torrents lors des crues, difficile à tenir une fois sortie de l\'eau.',500,1500,'UNCOMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(47,'Saumon des collines','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_27.jpg','Poisson migrateur qui remonte les rivières escarpées, symbole de persévérance pour les clans montagnards.',800,2500,'UNCOMMON','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(48,'Carpe dorée impériale','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_43.jpg','Carpe brillante élevée jadis dans les jardins d\'un empire disparu, censée porter bonheur.',2000,6000,'RARE','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(49,'Truite arcane','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_23.jpg','Poisson infusé de magie, ses écailles changent de couleur selon les courants mystiques.',1500,3500,'RARE','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(50,'Ombre fluviale','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_54.jpg','Poisson sombre qui ne laisse que sa silhouette apparaître sous la surface agitée.',900,2400,'RARE','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(51,'Silure cuirassé','https://wow.zamimg.com/images/wow/icons/large/inv_misc_food_164_fish_seadog.jpg','Poisson massif recouvert de plaques osseuses, presque insensible aux hameçons ordinaires.',3000,8000,'RARE','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(52,'Hydrelette de rivière','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_seascorpion1.jpg','Créature à plusieurs petites têtes, encore jeune mais déjà redoutée des pêcheurs.',7000,15000,'EPIC','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(53,'Esprit aquatique lié','https://wow.zamimg.com/images/wow/icons/large/ability_mount_progenitorjellyfish_darkred.jpg','Manifestation élémentaire liée à un ancien pacte, parfois attirée par les offrandes jetées à l\'eau.',2000,5000,'EPIC','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(54,'Saumon du roi-loup','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_98.jpg','Saumon gigantesque honoré par certaines tribus, sa capture est un rite de passage guerrier.',4000,9000,'EPIC','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(55,'Hydre des anciens remous','https://wow.zamimg.com/images/wow/icons/large/trade_archaeology_whitehydrafigurine.jpg','Monstre fluvial aux nombreuses têtes, chaque coup mal porté en fait repousser une nouvelle.',25000,60000,'LEGENDARY','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(56,'Gardien des Ponts engloutis','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_lure_starfish.jpg','Esprit-serpent qui hante les ponts effondrés, attaquant ceux qui profanent les eaux sacrées.',30000,80000,'LEGENDARY','RIVER','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(57,'Ablette miroir','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_lure_frogfish.jpg','Petit poisson de banc dont les écailles reflètent la lumière comme de minuscules miroirs.',30,110,'COMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(58,'Perche rayée de lac','https://wow.zamimg.com/images/wow/icons/large/inv_crystalinefish_pink.jpg','Poisson agile qui chasse les insectes tombés à la surface des lacs calmes.',80,260,'COMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(59,'Poisson-chat boueux','https://wow.zamimg.com/images/wow/icons/large/inv_whiskerfish_orange.jpg','Habitant des fonds vaseux, reconnaissable à ses barbillons et à son odeur tenace.',200,700,'COMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(60,'Carassin paisible','https://wow.zamimg.com/images/wow/icons/large/inv_10_fishing_fishdecayed_color2.jpg','Poisson placide vivant près des roseaux, rarement effrayé par la présence des bateaux.',150,500,'COMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(61,'Sandre ombrageux','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_sturgeon2.jpg','Prédateur nocturne qui se cache dans les structures immergées, chassant à la tombée de la nuit.',800,2500,'UNCOMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(62,'Tanche émeraude','https://wow.zamimg.com/images/wow/icons/large/inv_misc_scales_fishgreen01.jpg','Poisson aux reflets verts, réputé pour sa résistance et sa chair délicate.',600,1800,'UNCOMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(63,'Perche-soleil chatoyante','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_50.jpg','Petit poisson coloré, souvent gardé comme ornement vivant dans les bassins enchantés.',100,300,'UNCOMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(64,'Omble des brumes','https://wow.zamimg.com/images/wow/icons/large/inv_fish_oodelfjiskgreen.jpg','Poisson discret qui apparaît au lever du jour, lorsque la brume recouvre encore le lac.',500,1500,'UNCOMMON','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(65,'Brochet royal de lac','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_96.jpg','Prédateur solitaire de grande taille, au museau effilé et aux yeux perçants.',2500,8000,'RARE','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(66,'Carpe lune','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_92.jpg','Carpe massive aux écailles pâles qui brillent sous la lumière des étoiles.',2000,5500,'RARE','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(67,'Lotte des profondeurs','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_84.jpg','Poisson difforme vivant dans les trous les plus sombres du fond lacustre.',1500,4000,'RARE','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(68,'Truite marbrée','https://wow.zamimg.com/images/wow/icons/large/inv_10_tracking_fishing.jpg','Truite tachetée au motif unique, très recherchée par les collectionneurs de trophées.',1800,4200,'RARE','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(69,'Tortue mordorée géante','https://wow.zamimg.com/images/wow/icons/large/inv_turtlemount2_blue.jpg','Tortue ancienne portant parfois de la mousse et de petits arbustes sur sa carapace.',12000,30000,'EPIC','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(70,'Serpent lacustre aux mille yeux','https://wow.zamimg.com/images/wow/icons/large/inv_lunarsnakemountclassic.jpg','Long reptile aquatique couvert d\'yeux luisants, chacun semblant observer un monde différent.',15000,35000,'EPIC','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(71,'Nymphe des eaux stagnantes','https://wow.zamimg.com/images/wow/icons/large/inv_pet_reliquarydesire.jpg','Esprit fragile et capricieux, parfois visible sous forme de silhouette lumineuse à la surface.',3000,8000,'EPIC','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(72,'Bête du lac Voilé','https://wow.zamimg.com/images/wow/icons/large/inv_misc_monsterhead_03.jpg','Créature colossale dont on n\'aperçoit que la silhouette sous la brume épaisse.',40000,90000,'LEGENDARY','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(73,'Ancien Koi du prophète','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_102.jpg','Poisson sacré qui aurait écouté les confidences d\'un prophète, vénéré par plusieurs cultes.',15000,35000,'LEGENDARY','LAKE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(74,'Éperlan givré','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_10.jpg','Petit poisson translucide adapté aux eaux glacées, souvent mangé grillé par les trappeurs.',40,120,'COMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(75,'Capelan des glaces','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_07.jpg','Poisson de banc qui longe les banquises, attirant les phoques et les ours polaires.',60,180,'COMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(76,'Gobie polaire','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_94.jpg','Minuscule poisson se faufilant entre les blocs de glace, supportant des températures extrêmes.',30,90,'COMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(77,'Hareng gelé','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_35.jpg','Hareng robuste des mers froides, souvent pris au piège dans la glace de surface.',80,220,'COMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(78,'Morue des banquises','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_78.jpg','Poisson blanc charnu, ressource essentielle des villages côtiers du nord.',400,1500,'UNCOMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(79,'Truite des neiges','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_77.jpg','Truite tachetée vivant dans les torrents glacés, réputée pour sa chair ferme.',300,900,'UNCOMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(80,'Omble cristal','https://wow.zamimg.com/images/wow/icons/large/inv_crystalinefish_blue.jpg','Poisson étincelant semblable à un éclat de glace, difficile à repérer dans l\'eau claire.',250,800,'UNCOMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(81,'Raie de glace','https://wow.zamimg.com/images/wow/icons/large/inv_fish_stormray.jpg','Raie pâle qui se déplace lentement sous la surface gelée, presque invisible vue du dessus.',700,2000,'UNCOMMON','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(82,'Flétan boréal','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_whiptail2.jpg','Poisson plat de grande taille vivant sur les plateaux glacés des fonds marins.',5000,15000,'RARE','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(83,'Requin du givre','https://wow.zamimg.com/images/wow/icons/large/inv_babymurlo3frost.jpg','Requin massif au souffle glacé, ses nageoires laissent des traînées de givre dans l\'eau.',7000,18000,'RARE','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(84,'Anguille de givre runique','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_whiptail1.jpg','Anguille marquée de runes de glace, utilisée comme catalyseur dans certains rituels.',1000,2500,'RARE','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(85,'Carpe gelécaille','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_89.jpg','Carpe robuste aux écailles givrées, vivant dans les lacs pris par les glaces la majeure partie de l\'année.',1500,3500,'RARE','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(86,'Mégalodon des glaces éternelles','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_skulker3.jpg','Prédateur gigantesque des profondeurs polaires, rarement vu et encore plus rarement survécu.',50000,120000,'EPIC','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(87,'Dragonnet de givre','https://wow.zamimg.com/images/wow/icons/large/inv_pet_dkwhelplingfrost.jpg','Petit dragon aquatique aux ailes membraneuses gelées, capable de souffler un souffle glacé.',8000,20000,'EPIC','ICE','2025-11-14 09:40:31.048','2025-11-17 22:28:25.541'),(88,'Esprit des eaux gelées','https://wow.zamimg.com/images/wow/icons/large/inv_misc_fish_64.jpg','Entité élémentaire gardienne des fjords, se manifestant sous forme de tourbillon de neige et d\'eau.',3000,9000,'EPIC','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(89,'Léviathan des banquises','https://wow.zamimg.com/images/wow/icons/large/inv_fishing_f_ammonite1.jpg','Colosse marin qui brise la glace à son passage, annonçant parfois la fin des hivers maudits.',200000,400000,'LEGENDARY','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000'),(90,'Avatar de la Mer gelée','https://wow.zamimg.com/images/wow/icons/large/inv_eyeballjellyfish.jpg','Incarnation quasi divine du froid océanique, entourée d\'un halo de neige tourbillonnante.',60000,150000,'LEGENDARY','ICE','2025-11-14 09:40:31.048','2025-11-14 09:40:31.000');
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OngoingFishingSession`
--

LOCK TABLES `OngoingFishingSession` WRITE;
/*!40000 ALTER TABLE `OngoingFishingSession` DISABLE KEYS */;
INSERT INTO `OngoingFishingSession` VALUES (86,'357999004757262347','1440084391953957087','2025-11-17 21:01:14.707','2025-11-17 21:01:14.707',11,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'275376364197117952',1,'2025-11-10 14:42:39.379','2025-11-17 21:03:53.496',1,0,'Silverlord',NULL,0),(2,'199531497613557762',1,'2025-11-10 18:52:55.686','2025-11-17 21:04:24.869',0,0,'Anargyres',2,0),(3,'391986007777738757',1,'2025-11-10 18:53:07.790','2025-11-17 21:03:29.418',0,0,'Susu',1,0),(4,'141263676207267840',1,'2025-11-10 18:53:14.177','2025-11-17 21:04:04.533',0,0,'Equinoxuu',3,0),(5,'323418122357047296',1,'2025-11-10 18:53:32.306','2025-11-17 21:03:14.936',0,0,'Skrull',NULL,1),(6,'393424661855207424',1,'2025-11-10 18:53:45.179','2025-11-17 21:03:14.947',0,0,'Rokeez',NULL,2),(7,'349902253752320009',1,'2025-11-10 18:53:51.278','2025-11-17 21:03:44.823',0,0,'Kurax',4,0),(8,'520973877216542730',1,'2025-11-10 20:25:56.555','2025-11-17 21:03:14.968',0,0,'Naiiade',NULL,1),(9,'290537318526353410',1,'2025-11-11 08:38:50.407','2025-11-18 07:05:34.741',0,0,'Ollrrikk',NULL,0),(10,'386254910800265218',1,'2025-11-11 10:18:24.501','2025-11-17 21:03:14.991',0,0,'Palmypède',NULL,1),(11,'357999004757262347',1,'2025-11-13 20:49:47.335','2025-11-17 21:03:15.002',0,0,'Kira',NULL,1);
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
INSERT INTO `_prisma_migrations` VALUES ('15525058-cdac-40f0-a38a-d1e1938dc92b','c5e2c88e059ba85e61602c358c6bb30dc40c55b4180d9134461b9d70e16a0953','2025-11-14 11:28:17.932','20251114094426_add_extrafish_to_user',NULL,NULL,'2025-11-14 11:28:17.891',1),('1fba244b-6a92-4bc5-bf19-7ed102dd0d3b','d766bcb4bc5a69ede0feeead9aeb5e8908f17254359859aa229cbf7a93230427','2025-11-11 11:31:50.798','20251111105250_add_discord_name_used_cane',NULL,NULL,'2025-11-11 11:31:50.710',1),('30226038-8eb2-4571-9a2b-b83c5a366b8e','ec67fb05246d59813f6a755590cfcf17caa15a994f4b62734c94b9e9c070efca','2025-11-10 14:41:38.500','20251110123805_add_ongoing_fishing_sessions_tables',NULL,NULL,'2025-11-10 14:41:38.485',1),('36d6a4f3-9950-40f0-afa2-f5eff64f37a9','db2a8ac56b2cf1e5b61b69c51668cdc57844bd8f05e4a270ae0536034f79058a','2025-11-10 14:41:38.475','20251110074644_seed_basic_canes',NULL,NULL,'2025-11-10 14:41:38.468',1),('495455d6-94b2-4aec-bbc0-a8c4e2e44e93','5ed1303558d9988e50f9023e299e2f9baa691f982d6fd262178ce98a45c51243','2025-11-10 14:41:38.466','20251110071747_init_db',NULL,NULL,'2025-11-10 14:41:38.178',1),('4d9e5fd0-cccb-4cf2-8fea-f3d2c3416654','e17a7f300cbf0b90c4c7e68e12f5a75c78c9bc984ed39a3f168a5259cc704ec7','2025-11-10 14:41:38.483','20251110075229_seed_basic_fishes',NULL,NULL,'2025-11-10 14:41:38.476',1),('76a3c160-2d77-479b-bd29-9a4a8c454476','72cd457cb1a7af58e8d4ede707cde2c23bd3467f5adbd68aea795018ebd6b631','2025-11-11 11:31:50.871','20251111105711_add_relation_user_ongoing_fishing',NULL,NULL,'2025-11-11 11:31:50.802',1),('c4582bf7-cd43-4f29-a95c-d0de235c3b1f','e2be54d23c5c334e5a2b6061d8c4cfbf585b96a6425d3e5c290f8e008b8a4708','2025-11-12 19:43:52.874','20251112192620_add_cane_skin_table',NULL,NULL,'2025-11-12 19:43:52.780',1),('e9b97250-4e2c-45b0-80da-e1605dbc1eb0','18410a858b115608a4ff86899e2ef29571cb3c60991920796007ca0b9efb22b0','2025-11-15 15:58:07.197','20251115095832_add_lure_to_ongoing_session',NULL,NULL,'2025-11-15 15:58:07.111',1),('fc087087-1127-4347-98e1-8c64ae5edad2','d444fcf39bb4b253c9bf708cd40572e9e61c528d5ae14f4d3237ee937fbf11ca','2025-11-15 15:58:07.108','20251115093458_add_lures_table',NULL,NULL,'2025-11-15 15:58:06.963',1);
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

-- Dump completed on 2025-11-19  1:00:02
