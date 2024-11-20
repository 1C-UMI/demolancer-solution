-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: dev.aposio.ru
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

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
-- Table structure for table `cms3_apiship_orders`
--

DROP TABLE IF EXISTS `cms3_apiship_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_apiship_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` int unsigned NOT NULL,
  `umi_order_ref_number` int unsigned NOT NULL,
  `provider_order_ref_number` varchar(255) DEFAULT NULL,
  `status` enum('pending','delivered','delivering','deliveryCanceled','lost','notApplicable','onPointIn','onPointOut','onWay','partialReturn','problem','readyForRecipient','returned','returnedFromDelivery','returning','returnReady','unknown','uploaded','uploading','uploadingError') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `umi_order_ref_number` (`umi_order_ref_number`),
  KEY `provider_order_ref_number` (`provider_order_ref_number`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_apiship_orders`
--

LOCK TABLES `cms3_apiship_orders` WRITE;
/*!40000 ALTER TABLE `cms3_apiship_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_apiship_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_employee_schedule`
--

DROP TABLE IF EXISTS `cms3_appointment_employee_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_appointment_employee_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `day` enum('0','1','2','3','4','5','6') NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee schedule to employees` FOREIGN KEY (`employee_id`) REFERENCES `cms3_appointment_employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_employee_schedule`
--

LOCK TABLES `cms3_appointment_employee_schedule` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_employee_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_employee_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_employees`
--

DROP TABLE IF EXISTS `cms3_appointment_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_appointment_employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_employees`
--

LOCK TABLES `cms3_appointment_employees` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_employees_services`
--

DROP TABLE IF EXISTS `cms3_appointment_employees_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_appointment_employees_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id and service_id` (`employee_id`,`service_id`),
  KEY `employees services to services` (`service_id`),
  CONSTRAINT `employees services to employees` FOREIGN KEY (`employee_id`) REFERENCES `cms3_appointment_employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees services to services` FOREIGN KEY (`service_id`) REFERENCES `cms3_appointment_services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_employees_services`
--

LOCK TABLES `cms3_appointment_employees_services` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_employees_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_employees_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_orders`
--

DROP TABLE IF EXISTS `cms3_appointment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_appointment_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned NOT NULL,
  `employee_id` int unsigned DEFAULT NULL,
  `create_date` int unsigned NOT NULL,
  `date` int unsigned NOT NULL,
  `time` time NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` mediumtext,
  `status_id` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_orders`
--

LOCK TABLES `cms3_appointment_orders` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_service_groups`
--

DROP TABLE IF EXISTS `cms3_appointment_service_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_appointment_service_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_service_groups`
--

LOCK TABLES `cms3_appointment_service_groups` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_service_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_service_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_appointment_services`
--

DROP TABLE IF EXISTS `cms3_appointment_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_appointment_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `services to service_groups` (`group_id`),
  CONSTRAINT `services to service_groups` FOREIGN KEY (`group_id`) REFERENCES `cms3_appointment_service_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_appointment_services`
--

LOCK TABLES `cms3_appointment_services` WRITE;
/*!40000 ALTER TABLE `cms3_appointment_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_appointment_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_cluster_nodes`
--

DROP TABLE IF EXISTS `cms3_cluster_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_cluster_nodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `node_ip` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `node_id` (`id`),
  KEY `node_ip` (`node_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_cluster_nodes`
--

LOCK TABLES `cms3_cluster_nodes` WRITE;
/*!40000 ALTER TABLE `cms3_cluster_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_cluster_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_cluster_nodes_cache_keys`
--

DROP TABLE IF EXISTS `cms3_cluster_nodes_cache_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_cluster_nodes_cache_keys` (
  `node_id` int DEFAULT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  KEY `node_id` (`node_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_cluster_nodes_cache_keys`
--

LOCK TABLES `cms3_cluster_nodes_cache_keys` WRITE;
/*!40000 ALTER TABLE `cms3_cluster_nodes_cache_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_cluster_nodes_cache_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_data_cache`
--

DROP TABLE IF EXISTS `cms3_data_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_data_cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `create_time` int NOT NULL,
  `expire_time` int NOT NULL,
  `entry_time` int NOT NULL,
  `entries_number` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `Life time` (`expire_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_data_cache`
--

LOCK TABLES `cms3_data_cache` WRITE;
/*!40000 ALTER TABLE `cms3_data_cache` DISABLE KEYS */;
INSERT INTO `cms3_data_cache` VALUES ('620767eae0e8a7d314b53cbbb7ac9ab2','s:202:\"{\"_browser_name\":\"Firefox\",\"_version\":\"110.0\",\"_platform\":\"Windows\",\"_os\":\"unknown\",\"_is_aol\":false,\"_is_mobile\":false,\"_is_tablet\":false,\"_is_robot\":false,\"_is_facebook\":false,\"_aol_version\":\"unknown\"}\";',1678957723,1742116123,0,0),('last-release-revision','i:91974;',1678960894,1679220094,0,0),('last-release-info','s:183:\"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modules>\n  <system>\n    <version>22</version>\n    <revision>91974</revision>\n    <date>2022-10-12T09:13:38+03:00</date>\n  </system>\n</modules>\n\";',1678960894,1679220094,0,0),('last-release-version','i:22;',1678960894,1679220094,0,0),('support-end-time','i:1710482700;',1678960898,1679220098,0,0),('d41d8cd98f00b204e9800998ecf8427e','s:204:\"{\"_browser_name\":\"unknown\",\"_version\":\"unknown\",\"_platform\":\"unknown\",\"_os\":\"unknown\",\"_is_aol\":false,\"_is_mobile\":false,\"_is_tablet\":false,\"_is_robot\":false,\"_is_facebook\":false,\"_aol_version\":\"unknown\"}\";',1678961296,1742119696,0,0),('7d54254077b6be949b1fea5a88f0d06e','s:205:\"{\"_browser_name\":\"Chrome\",\"_version\":\"111.0.0.0\",\"_platform\":\"Windows\",\"_os\":\"unknown\",\"_is_aol\":false,\"_is_mobile\":false,\"_is_tablet\":false,\"_is_robot\":false,\"_is_facebook\":false,\"_aol_version\":\"unknown\"}\";',1678975502,1742133902,0,0);
/*!40000 ALTER TABLE `cms3_data_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_domain_mirrows`
--

DROP TABLE IF EXISTS `cms3_domain_mirrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_domain_mirrows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) DEFAULT NULL,
  `rel` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`),
  KEY `Domain to mirrows relation_FK` (`rel`),
  CONSTRAINT `FK_Domain to mirrows relation` FOREIGN KEY (`rel`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_domain_mirrows`
--

LOCK TABLES `cms3_domain_mirrows` WRITE;
/*!40000 ALTER TABLE `cms3_domain_mirrows` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_domain_mirrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_domains`
--

DROP TABLE IF EXISTS `cms3_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(64) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `default_lang_id` int unsigned DEFAULT NULL,
  `use_ssl` tinyint(1) DEFAULT NULL,
  `favicon` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host` (`host`),
  KEY `Domain to default language relation_FK` (`default_lang_id`),
  CONSTRAINT `FK_Domain to default language relation` FOREIGN KEY (`default_lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_domains`
--

LOCK TABLES `cms3_domains` WRITE;
/*!40000 ALTER TABLE `cms3_domains` DISABLE KEYS */;
INSERT INTO `cms3_domains` VALUES (1,'dev.aposio.ru:18880',1,1,0,NULL);
/*!40000 ALTER TABLE `cms3_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_emarket_top`
--

DROP TABLE IF EXISTS `cms3_emarket_top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_emarket_top` (
  `id` int NOT NULL,
  `date` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_emarket_top`
--

LOCK TABLES `cms3_emarket_top` WRITE;
/*!40000 ALTER TABLE `cms3_emarket_top` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_emarket_top` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_fields_controller`
--

DROP TABLE IF EXISTS `cms3_fields_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_fields_controller` (
  `ord` int DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  KEY `rel to field_FK` (`field_id`),
  KEY `rel to field group_FK` (`group_id`),
  KEY `ord` (`ord`),
  CONSTRAINT `FK_rel to field` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rel to field group` FOREIGN KEY (`group_id`) REFERENCES `cms3_object_field_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_fields_controller`
--

LOCK TABLES `cms3_fields_controller` WRITE;
/*!40000 ALTER TABLE `cms3_fields_controller` DISABLE KEYS */;
INSERT INTO `cms3_fields_controller` VALUES (5,1,1),(5,2,2),(10,3,2),(15,4,2),(20,5,2),(25,6,2),(30,7,2),(5,11,4),(10,12,4),(15,13,4),(20,14,4),(5,15,5),(10,16,5),(5,17,6),(10,18,6),(15,19,6),(20,20,6),(5,21,7),(10,22,7),(5,23,8),(5,2,9),(10,3,9),(15,6,9),(20,5,9),(25,7,9),(30,24,9),(5,11,11),(10,12,11),(15,13,11),(20,14,11),(5,15,12),(10,16,12),(5,17,13),(10,18,13),(15,19,13),(20,20,13),(5,21,14),(10,22,14),(5,25,15),(10,26,15),(15,27,15),(20,28,15),(5,29,16),(5,30,17),(5,31,18),(5,31,19),(5,32,20),(5,32,21),(5,35,24),(10,36,24),(15,37,24),(20,38,24),(25,39,24),(5,41,26),(5,42,27),(10,43,27),(15,44,27),(20,45,27),(5,46,28),(10,47,28),(15,48,28),(20,49,28),(25,50,28),(5,51,29),(10,52,29),(15,53,29),(20,54,29),(25,55,29),(30,56,29),(5,57,30),(10,53,30),(15,58,30),(20,59,30),(25,55,30),(5,57,31),(10,53,31),(15,58,31),(20,59,31),(25,55,31),(5,34,32),(10,60,32),(5,61,33),(10,62,33),(15,63,33),(20,64,33),(5,65,34),(5,66,35),(10,67,35),(15,68,35),(20,69,35),(5,70,36),(5,71,37),(5,72,38),(5,73,39),(10,74,39),(15,75,39),(5,76,40),(10,77,40),(15,78,40),(5,73,42),(10,74,42),(15,75,42),(5,79,43),(5,80,44),(10,81,44),(15,82,44),(20,83,44),(25,84,44),(30,85,44),(35,86,44),(5,87,45),(5,88,46),(10,89,46),(15,90,46),(20,91,46),(25,92,46),(5,93,47),(10,94,47),(15,95,47),(20,96,47),(25,97,47),(30,98,47),(35,99,47),(40,100,47),(45,101,47),(50,102,47),(55,103,47),(60,104,47),(65,105,47),(70,106,47),(75,107,47),(80,108,47),(5,109,48),(5,110,49),(5,40,50),(10,111,50),(5,112,51),(10,113,51),(15,114,51),(5,115,52),(10,116,52),(15,117,52),(5,40,53),(10,111,53),(5,118,54),(10,119,54),(15,120,54),(20,49,54),(25,121,54),(5,122,55),(10,123,55),(15,124,55),(5,125,56),(10,126,56),(15,127,56),(20,128,56),(25,129,56),(30,130,56),(35,131,56),(5,132,57),(10,133,57),(15,134,57),(5,135,58),(10,136,58),(15,137,58),(20,138,58),(25,139,58),(30,140,58),(35,141,58),(40,142,58),(45,143,58),(5,40,59),(10,111,59),(5,144,60),(10,145,60),(15,146,60),(25,148,60),(30,149,60),(35,150,60),(40,151,60),(45,152,60),(50,153,60),(55,154,60),(60,155,60),(65,156,60),(70,157,60),(75,158,60),(80,159,60),(85,160,60),(5,168,62),(10,169,62),(15,170,62),(20,171,62),(25,172,62),(30,173,62),(35,174,62),(40,175,62),(5,176,63),(10,177,63),(15,178,63),(20,179,63),(25,180,63),(30,181,63),(5,182,64),(10,183,64),(15,184,64),(20,185,64),(25,186,64),(30,187,64),(35,188,64),(40,189,64),(45,190,64),(50,191,64),(55,192,64),(60,193,64),(65,194,64),(70,195,64),(75,196,64),(80,197,64),(85,198,64),(90,199,64),(5,200,65),(10,201,65),(5,202,66),(5,203,67),(5,204,68),(10,205,68),(15,206,68),(20,207,68),(25,208,68),(30,209,68),(35,210,68),(40,211,68),(45,212,68),(50,213,68),(55,214,68),(60,215,68),(5,216,69),(10,217,69),(15,218,69),(20,219,69),(25,220,69),(30,221,69),(35,222,69),(40,223,69),(45,224,69),(50,225,69),(55,226,69),(60,227,69),(65,228,69),(70,229,69),(5,230,70),(10,231,70),(15,232,70),(20,233,70),(5,234,72),(10,235,72),(5,236,73),(5,237,74),(10,65,74),(5,70,75),(10,238,75),(5,239,76),(10,240,76),(5,2,77),(10,3,77),(15,6,77),(20,5,77),(25,7,77),(30,241,77),(35,4,77),(5,242,78),(10,243,78),(15,244,78),(20,245,78),(25,246,78),(5,11,80),(10,12,80),(15,13,80),(20,14,80),(5,247,81),(10,248,81),(5,249,82),(5,15,83),(10,16,83),(5,17,84),(10,18,84),(15,19,84),(20,20,84),(5,21,85),(10,22,85),(5,2,86),(10,3,86),(15,6,86),(20,5,86),(25,7,86),(30,4,86),(5,11,88),(10,12,88),(15,13,88),(20,14,88),(5,15,89),(10,16,89),(5,17,90),(10,18,90),(15,19,90),(20,20,90),(5,21,91),(10,22,91),(5,250,92),(10,251,92),(15,252,92),(20,253,92),(25,254,92),(30,255,92),(35,256,92),(40,257,92),(5,2,93),(10,3,93),(15,258,93),(20,5,93),(25,6,93),(30,7,93),(35,259,93),(5,11,95),(10,12,95),(15,13,95),(20,14,95),(5,15,96),(10,16,96),(5,260,97),(10,261,97),(15,262,97),(20,263,97),(25,264,97),(5,4,98),(10,265,98),(15,244,98),(5,15,99),(10,16,99),(5,266,100),(5,2,101),(10,3,101),(15,4,101),(20,5,101),(25,6,101),(30,7,101),(35,244,101),(5,11,103),(10,12,103),(15,13,103),(20,14,103),(5,15,104),(10,16,104),(5,17,105),(10,18,105),(15,19,105),(20,20,105),(5,21,106),(10,22,106),(5,267,107),(5,266,108),(5,2,109),(10,3,109),(15,6,109),(20,5,109),(25,7,109),(30,268,109),(35,269,109),(40,270,109),(45,271,109),(5,11,111),(10,12,111),(15,13,111),(20,14,111),(5,15,112),(10,16,112),(5,17,113),(10,18,113),(15,19,113),(20,20,113),(5,21,114),(10,22,114),(5,2,115),(10,3,115),(15,6,115),(20,7,115),(25,5,115),(30,270,115),(35,271,115),(5,11,117),(10,12,117),(15,13,117),(20,14,117),(5,244,118),(10,265,118),(15,272,118),(5,15,119),(10,16,119),(5,17,120),(10,18,120),(15,19,120),(20,20,120),(5,21,121),(10,22,121),(5,2,122),(10,3,122),(15,6,122),(20,5,122),(25,7,122),(5,11,124),(10,12,124),(15,13,124),(20,14,124),(5,273,125),(10,265,125),(5,15,126),(10,16,126),(5,17,127),(10,18,127),(15,19,127),(20,20,127),(5,21,128),(10,22,128),(5,2,129),(10,3,129),(15,6,129),(20,5,129),(25,7,129),(5,11,131),(10,12,131),(15,13,131),(20,14,131),(5,273,132),(10,244,132),(15,265,132),(5,15,133),(10,16,133),(5,17,134),(10,18,134),(15,19,134),(20,20,134),(5,21,135),(10,22,135),(5,266,136),(5,274,137),(10,275,137),(5,2,138),(10,3,138),(15,6,138),(20,5,138),(25,7,138),(5,11,140),(10,12,140),(15,13,140),(20,14,140),(5,276,141),(10,277,141),(15,244,141),(20,278,141),(25,279,141),(5,15,142),(10,16,142),(5,17,143),(10,18,143),(15,19,143),(20,20,143),(5,21,144),(10,22,144),(5,2,145),(10,3,145),(15,4,145),(20,5,145),(25,6,145),(30,7,145),(5,11,147),(10,12,147),(15,13,147),(20,14,147),(5,15,148),(10,16,148),(5,17,149),(10,18,149),(15,19,149),(20,20,149),(5,21,150),(10,22,150),(5,280,151),(5,281,152),(10,282,152),(15,283,152),(20,284,152),(5,285,153),(10,286,153),(15,287,153),(20,288,153),(5,289,154),(10,290,154),(15,291,154),(20,292,154),(25,293,154),(5,294,155),(5,295,156),(5,296,157),(10,297,157),(15,298,157),(5,2,158),(10,3,158),(15,5,158),(20,6,158),(25,7,158),(5,11,160),(10,12,160),(15,13,160),(20,14,160),(5,268,161),(10,299,161),(15,300,161),(5,15,162),(10,16,162),(5,17,163),(10,18,163),(15,19,163),(20,20,163),(5,21,164),(10,22,164),(5,2,165),(10,3,165),(15,5,165),(20,6,165),(25,7,165),(5,11,167),(10,12,167),(15,13,167),(20,14,167),(5,301,168),(10,268,168),(15,299,168),(20,300,168),(5,15,169),(10,16,169),(5,17,170),(10,18,170),(15,19,170),(20,20,170),(5,21,171),(10,22,171),(5,2,172),(10,3,172),(15,4,172),(20,5,172),(25,6,172),(30,7,172),(5,11,174),(10,12,174),(15,13,174),(20,14,174),(5,15,175),(10,16,175),(5,17,176),(10,18,176),(15,19,176),(20,20,176),(5,21,177),(10,22,177),(5,2,178),(10,3,178),(15,4,178),(20,5,178),(25,6,178),(30,7,178),(5,11,180),(10,12,180),(15,13,180),(20,14,180),(5,15,181),(10,16,181),(5,17,182),(10,18,182),(15,19,182),(20,20,182),(5,21,183),(10,22,183),(5,2,184),(10,3,184),(15,5,184),(20,6,184),(25,7,184),(30,277,184),(35,302,184),(40,265,184),(45,244,184),(5,11,186),(10,12,186),(15,13,186),(20,14,186),(5,17,187),(10,18,187),(15,19,187),(20,20,187),(5,21,188),(10,22,188),(5,266,189),(5,303,190),(10,304,190),(15,305,190),(20,306,190),(25,307,190),(30,308,190),(5,309,191),(10,310,191),(5,311,192),(10,312,192),(15,313,192),(5,314,193),(10,315,193),(15,316,193),(5,317,194),(10,318,194),(15,319,194),(20,320,194),(5,321,195),(10,322,195),(15,323,195),(20,324,195),(25,325,195),(5,326,196),(10,327,196),(15,328,196),(5,2,197),(10,3,197),(15,6,197),(20,5,197),(25,7,197),(5,11,199),(10,12,199),(15,13,199),(20,14,199),(5,268,200),(5,15,201),(10,16,201),(5,17,202),(10,18,202),(15,19,202),(20,20,202),(5,21,203),(10,22,203),(5,330,204),(10,331,204),(15,332,204),(20,333,204),(25,334,204),(5,2,205),(10,3,205),(15,6,205),(20,5,205),(25,7,205),(30,335,205),(5,11,207),(10,14,207),(5,336,208),(10,337,208),(15,338,208),(20,339,208),(5,340,210),(10,341,210),(15,342,210),(5,343,211),(10,344,211),(5,15,212),(10,16,212),(5,17,213),(10,18,213),(15,19,213),(20,20,213),(5,21,214),(10,22,214),(5,47,215),(10,46,215),(15,48,215),(20,345,215),(25,346,215),(30,347,215),(35,348,215),(5,49,216),(10,50,216),(15,349,216),(5,350,217),(5,351,218),(5,65,219),(10,352,219),(5,70,220),(10,353,220),(5,70,221),(10,354,221),(15,355,221),(5,70,222),(10,356,222),(15,357,222),(5,70,223),(10,358,223),(15,359,223),(5,70,224),(10,360,224),(5,70,225),(10,361,225),(5,135,226),(10,136,226),(15,137,226),(20,138,226),(25,139,226),(30,140,226),(35,141,226),(40,142,226),(45,143,226),(5,135,227),(10,136,227),(15,138,227),(20,139,227),(25,140,227),(30,141,227),(35,142,227),(40,143,227),(5,362,228),(10,137,228),(5,135,229),(10,136,229),(15,138,229),(20,139,229),(25,140,229),(30,141,229),(35,142,229),(40,143,229),(5,363,230),(10,364,230),(5,135,231),(10,136,231),(15,138,231),(20,141,231),(25,142,231),(30,143,231),(5,365,232),(10,366,232),(15,367,232),(20,368,232),(25,369,232),(30,370,232),(35,371,232),(40,372,232),(45,139,232),(50,140,232),(5,115,233),(10,116,233),(15,117,233),(5,373,234),(10,374,234),(15,375,234),(20,376,234),(25,377,234),(30,378,234),(5,115,235),(10,116,235),(15,117,235),(5,379,236),(10,380,236),(15,381,236),(20,382,236),(5,115,237),(10,116,237),(15,117,237),(5,115,238),(10,116,238),(15,117,238),(5,383,239),(10,384,239),(15,385,239),(20,386,239),(25,381,239),(5,115,242),(10,116,242),(15,117,242),(5,389,243),(10,390,243),(15,391,243),(20,392,243),(25,393,243),(30,394,243),(35,395,243),(40,396,243),(45,377,243),(50,397,243),(5,115,244),(10,116,244),(15,117,244),(5,398,245),(10,399,245),(15,400,245),(20,401,245),(25,402,245),(30,403,245),(35,381,245),(5,115,246),(10,116,246),(15,117,246),(5,404,247),(10,405,247),(15,406,247),(5,115,253),(10,116,253),(15,117,253),(5,386,254),(10,419,254),(15,420,254),(20,421,254),(5,115,255),(10,116,255),(15,117,255),(5,422,256),(10,423,256),(15,381,256),(20,382,256),(5,424,257),(10,425,257),(15,426,257),(5,427,258),(10,428,258),(5,429,259),(10,430,259),(5,431,260),(10,432,260),(15,433,260),(20,434,260),(25,435,260),(30,436,260),(5,437,261),(10,438,261),(15,439,261),(5,440,262),(10,441,262),(15,442,262),(20,443,262),(25,444,262),(5,445,263),(10,446,263),(5,447,264),(5,427,265),(10,428,265),(5,448,266),(10,449,266),(15,450,266),(20,451,266),(5,429,267),(10,430,267),(5,431,268),(10,432,268),(15,433,268),(20,434,268),(25,435,268),(30,436,268),(5,437,269),(10,438,269),(15,439,269),(5,440,270),(10,441,270),(15,442,270),(20,443,270),(25,444,270),(5,445,271),(10,446,271),(5,447,272),(5,427,273),(10,428,273),(5,452,274),(10,449,274),(15,450,274),(20,453,274),(5,429,275),(10,430,275),(5,431,276),(10,432,276),(15,433,276),(20,434,276),(25,435,276),(30,436,276),(5,437,277),(10,438,277),(15,439,277),(5,440,278),(10,441,278),(15,442,278),(20,443,278),(25,444,278),(5,445,279),(10,446,279),(5,447,280),(5,427,281),(10,428,281),(5,454,282),(5,429,283),(10,430,283),(5,431,284),(10,432,284),(15,433,284),(20,434,284),(25,435,284),(30,436,284),(5,437,285),(10,438,285),(15,439,285),(5,440,286),(10,441,286),(15,442,286),(20,443,286),(25,444,286),(5,445,287),(10,446,287),(5,447,288),(5,455,289),(10,456,289),(5,457,290),(10,458,290),(15,459,290),(20,460,290),(25,461,290),(30,462,290),(5,457,291),(10,458,291),(15,459,291),(20,460,291),(25,461,291),(5,463,292),(10,464,292),(15,465,292),(20,466,292),(5,467,293),(10,468,293),(15,469,293),(20,470,293),(5,471,294),(10,472,294),(15,473,294),(20,474,294),(5,475,295),(10,476,295),(15,477,295),(20,478,295),(25,479,295),(5,2,296),(10,3,296),(15,5,296),(20,6,296),(25,7,296),(30,4,296),(5,11,298),(10,12,298),(15,13,298),(20,14,298),(5,480,299),(10,481,299),(5,15,300),(10,16,300),(5,17,301),(10,18,301),(15,19,301),(20,20,301),(5,21,302),(10,22,302),(5,482,303),(10,483,303),(15,484,303),(5,43,304),(5,43,305),(5,2,306),(10,3,306),(15,4,306),(20,5,306),(25,6,306),(30,7,306),(5,11,308),(10,12,308),(15,13,308),(20,14,308),(5,15,309),(10,16,309),(5,17,310),(10,18,310),(15,19,310),(20,20,310),(5,21,311),(10,22,311),(5,485,312),(10,486,312),(15,487,312),(20,488,312),(25,489,312),(30,490,312),(35,491,312),(40,492,312),(45,493,312),(50,494,312),(55,495,312),(5,281,313),(10,282,313),(15,283,313),(20,284,313),(5,496,314),(10,497,314),(15,498,314),(20,499,314),(5,482,315),(10,483,315),(15,484,315),(5,500,316),(12,501,316),(5,502,317),(10,503,316),(11,504,316),(17,505,316),(5,506,318),(10,507,318),(15,508,318),(5,509,319),(10,510,319),(5,511,320),(5,511,321),(5,511,322),(5,511,323),(5,511,324),(5,511,325),(5,511,326),(5,511,327),(6,511,328),(5,511,329),(5,511,330),(5,511,331),(5,511,332),(5,511,333),(5,511,334),(5,511,335),(5,511,336),(5,511,337),(5,511,338),(5,511,339),(5,511,340),(5,511,341),(5,511,342),(5,511,343),(5,512,344),(10,513,344),(15,514,344),(5,515,345),(10,516,345),(20,517,344),(5,518,328),(5,519,346),(10,520,346),(15,521,346),(5,522,347),(5,2,348),(10,3,348),(15,6,348),(20,5,348),(25,7,348),(30,4,348),(5,11,350),(10,12,350),(15,13,350),(20,14,350),(5,15,351),(10,16,351),(5,17,352),(10,18,352),(15,19,352),(20,20,352),(5,21,353),(10,22,353),(5,511,354),(5,523,355),(11,524,355),(10,525,355),(16,526,355),(25,527,256),(30,528,291),(35,529,291),(65,530,68),(70,531,68),(55,532,232),(60,533,232),(30,382,239),(40,382,245),(20,382,247),(25,382,254),(30,534,256),(35,535,29),(30,536,30),(30,536,31),(15,537,76),(20,538,76),(25,381,247),(85,539,47),(5,540,357),(10,70,357),(75,541,68),(20,542,52),(20,542,233),(20,542,235),(20,542,237),(20,542,238),(20,542,242),(20,542,244),(20,542,246),(20,542,253),(20,542,255),(5,21,358),(10,22,358),(5,21,359),(10,22,359),(5,457,360),(10,458,360),(15,459,360),(20,460,360),(25,461,360),(5,463,361),(10,464,361),(15,465,361),(20,466,361),(5,467,362),(10,468,362),(15,469,362),(20,470,362),(5,471,363),(10,472,363),(15,473,363),(20,543,363);
/*!40000 ALTER TABLE `cms3_fields_controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_52_pages_4`
--

DROP TABLE IF EXISTS `cms3_filter_index_52_pages_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_filter_index_52_pages_4` (
  `id` int unsigned NOT NULL,
  `obj_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `naznachenie` varchar(255) DEFAULT NULL,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `obem_upakovki` double DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `razmer_pitomca` varchar(255) DEFAULT NULL,
  `razmer_ramy_dyujmy` double DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `sostav_napolnitelya` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `ves` double DEFAULT NULL,
  `ves_upakovki` double DEFAULT NULL,
  `ves_velosipeda` double DEFAULT NULL,
  `vid` varchar(255) DEFAULT NULL,
  `vmestimost` bigint DEFAULT NULL,
  `vozrast` varchar(255) DEFAULT NULL,
  `vysota` double DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `naznachenie` (`naznachenie`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `obem_upakovki` (`obem_upakovki`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `razmer_pitomca` (`razmer_pitomca`),
  KEY `razmer_ramy_dyujmy` (`razmer_ramy_dyujmy`),
  KEY `sezon` (`sezon`),
  KEY `sostav_napolnitelya` (`sostav_napolnitelya`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `ves` (`ves`),
  KEY `ves_upakovki` (`ves_upakovki`),
  KEY `ves_velosipeda` (`ves_velosipeda`),
  KEY `vid` (`vid`),
  KEY `vmestimost` (`vmestimost`),
  KEY `vozrast` (`vozrast`),
  KEY `vysota` (`vysota`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_52_pages_4`
--

LOCK TABLES `cms3_filter_index_52_pages_4` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_52_pages_4` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_52_pages_4` VALUES (309,1823,264,177,1,1,NULL,'Черный',NULL,NULL,0,'Мужской',NULL,NULL,14990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,11,'Хардтейл',NULL,NULL,NULL,NULL),(314,1833,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,39900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(327,1849,264,177,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,13990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(328,1852,264,177,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,32900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(329,1855,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,69900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(330,1858,264,177,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,24900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(331,1859,264,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,17990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(332,1860,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(335,1865,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.9,NULL,NULL,NULL,2,NULL,105,NULL),(336,1866,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(337,1868,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5900,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(338,1869,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.14,NULL,NULL,NULL,1,NULL,86,NULL),(339,1871,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2950,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.12,NULL,NULL,NULL,1,NULL,137,NULL),(340,1872,334,184,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2940,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2.9,NULL,NULL,NULL,2,NULL,110,NULL),(345,1879,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(348,1891,343,170,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13900,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(349,1898,344,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(350,1901,343,170,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,49800,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(351,1906,343,170,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,14690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(352,1912,343,170,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,8120,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(353,1915,344,170,1,1,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,NULL,'Victorinox Swiss Army',NULL,34700,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,1918,344,170,1,1,NULL,NULL,'Белый','Нержавеющая сталь',0,NULL,'Seiko',NULL,22900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(355,1921,344,170,1,1,NULL,NULL,'Черный','Керамика',0,NULL,'Candino',NULL,19900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(356,1923,344,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь',0,NULL,'Michael Kors',NULL,11500,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(357,1924,344,170,1,1,NULL,NULL,'Черный','Пластик',1,NULL,'Posio',NULL,3790,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(358,1929,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.5,154,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(359,1933,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.54,119,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,2.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(360,1935,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,10,480,NULL,NULL,NULL,NULL,NULL,'Хлопок',NULL,NULL,NULL,0.96,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(361,1937,283,180,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,16,1790,NULL,NULL,NULL,NULL,NULL,'Глина + мин. добавки',NULL,NULL,NULL,15.87,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(362,1938,273,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(363,1939,273,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(364,1940,273,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(366,1942,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,740,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(367,1943,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(368,1944,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(369,1945,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(370,1946,365,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(371,1952,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,950,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1500,NULL,NULL,NULL,'Взрослые',NULL,NULL),(372,1954,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3200,NULL,NULL,NULL,'Взрослые',NULL,NULL),(373,1956,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000,NULL,NULL,NULL,'Взрослые',NULL,NULL),(374,1959,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2720,NULL,NULL,NULL,'Взрослые',NULL,NULL),(375,1962,284,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3630,NULL,NULL,NULL,'Любой',NULL,NULL),(376,1965,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,810,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1020,NULL,NULL,NULL,'Взрослые',NULL,NULL),(377,1967,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(378,1968,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1320,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2040,NULL,NULL,NULL,'Любой',NULL,NULL),(379,1972,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1190,NULL,NULL,NULL,'Взрослые',NULL,NULL),(380,1973,285,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3840,NULL,NULL,NULL,'Взрослые',NULL,NULL),(381,1974,287,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(382,1976,287,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(383,1977,287,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2610,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(384,1980,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),(385,1982,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,389,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,NULL,NULL,NULL),(394,1991,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,79900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(395,1992,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,49900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(396,1993,264,177,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,38900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(397,1994,264,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,18990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(398,1995,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,32900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(399,1996,264,177,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,19990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(400,1997,264,177,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,56900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(401,1998,264,177,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,22900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(402,1999,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,8900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(403,2000,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,11900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(404,2001,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5500,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(405,2002,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9400,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(406,2003,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(407,2004,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,13000,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(408,2005,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,12000,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(409,2006,268,177,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,12900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(410,2007,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(411,2008,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,2009,344,170,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13400,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,2010,343,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,58055,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,2011,343,170,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,40500,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(415,2012,343,170,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,11690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(416,2013,343,170,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,6190,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(417,2014,343,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(419,2016,343,170,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(420,2017,343,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,78550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,2018,344,82,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,2020,343,170,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,2029,391,185,1,1,'MitLex','Черный',NULL,NULL,0,NULL,NULL,NULL,11900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(425,2035,391,185,1,1,'Mango Man','Бежевый',NULL,NULL,0,NULL,NULL,NULL,9900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(427,2041,391,185,1,1,'Burton Menswear London','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(428,2043,389,185,1,1,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,NULL,NULL,3990,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,2046,391,185,1,1,'Roosevelt','Серый',NULL,NULL,0,NULL,NULL,NULL,10399,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(430,2051,389,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,2052,391,185,1,1,'United Colors of Benetton','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'52-54',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(432,2069,389,185,1,1,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,2070,391,185,1,1,'Only & Sons','Черный',NULL,NULL,0,NULL,NULL,NULL,6500,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(434,2071,389,185,1,1,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,NULL,NULL,3450,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(435,2073,389,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,6590,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(436,2074,391,185,1,1,'Jack & Jones','Черный',NULL,NULL,0,NULL,NULL,NULL,10999,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(437,2077,389,185,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(438,2078,389,185,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(439,2080,391,185,1,1,'Windsor','Черный',NULL,NULL,0,NULL,NULL,NULL,52900,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(440,2084,391,185,1,1,'Trussardi Jeans','Синий',NULL,NULL,0,NULL,NULL,NULL,26900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(442,2090,391,185,1,1,'Berkytt','Коричневый',NULL,NULL,0,NULL,NULL,NULL,12400,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(443,2092,391,185,1,1,'Piazza Italia','Серый',NULL,NULL,0,NULL,NULL,NULL,7399,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(444,2093,389,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6790,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(445,2095,392,185,1,1,'Atributika & Club','Черный',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(446,2096,389,185,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(447,2099,392,185,1,1,'Trespass','Хакки',NULL,NULL,0,NULL,NULL,NULL,18999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(448,2100,389,185,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(449,2103,389,185,1,1,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,NULL,NULL,5690,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(450,2104,392,185,1,1,'EA7','Синий',NULL,NULL,0,NULL,NULL,NULL,22899,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(451,2106,392,185,1,1,'Reebok','Серый',NULL,NULL,0,NULL,NULL,NULL,14690,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(452,2107,389,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(453,2109,392,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,22889,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(454,2110,392,185,1,1,'Bergans of Norway','Черный',NULL,NULL,0,NULL,NULL,NULL,27999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(455,2113,392,185,1,1,'Springfield','Желтый',NULL,NULL,0,NULL,NULL,NULL,7999,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(456,2115,392,185,1,1,'Columbia','Красный',NULL,NULL,0,NULL,NULL,NULL,23999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(457,2116,392,185,1,1,'Columbia','Синий',NULL,NULL,0,NULL,NULL,NULL,12999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(458,2118,392,185,1,1,'Baon','Синий',NULL,NULL,0,NULL,NULL,NULL,12699,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(459,2121,392,185,1,1,'Quiksilver','Черный',NULL,NULL,0,NULL,NULL,NULL,17690,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(460,2124,392,185,1,1,'Columbia','Черный',NULL,NULL,0,NULL,NULL,NULL,9999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(462,2130,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(463,2131,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,2133,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(466,2134,461,191,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(467,2135,461,191,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(468,2138,461,191,1,1,'Maybelline New York',NULL,NULL,NULL,0,NULL,NULL,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(469,2141,461,191,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(470,2143,461,191,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(471,2146,461,191,1,1,'NOUBA',NULL,NULL,NULL,0,NULL,NULL,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(472,2148,461,191,1,1,'MAX FACTOR',NULL,NULL,NULL,0,NULL,NULL,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(473,2150,461,191,1,1,'Revlon',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(474,2151,461,191,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(475,2156,461,191,1,1,'LUXVISAGE',NULL,NULL,NULL,0,NULL,NULL,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,2162,480,200,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,2750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,2163,480,200,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,3400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(483,2164,480,200,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(484,2165,480,200,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,6700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(485,2166,480,200,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,6875,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(486,2168,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,'Малый и средний',NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,'Любой',NULL,NULL),(488,2170,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,99,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,'Любой',NULL,NULL),(489,2172,289,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,80,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(492,2177,490,202,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,18990,'RICCI',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(493,2179,490,202,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,16900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(494,2180,490,202,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,12900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(495,2183,490,202,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,25900,'Bosch',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(496,2185,490,202,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,27900,'Samsung',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(498,2187,497,204,1,1,'LG',NULL,NULL,NULL,0,NULL,NULL,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(499,2190,497,204,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(500,2192,497,204,1,1,'Indesit',NULL,NULL,NULL,0,NULL,NULL,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(501,2199,497,204,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(502,2201,497,204,1,1,'SAMSUNG',NULL,NULL,NULL,0,NULL,NULL,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(503,2203,497,204,1,1,'BEKO',NULL,NULL,NULL,0,NULL,NULL,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(504,2205,497,204,1,1,'ZANUSSI',NULL,NULL,NULL,0,NULL,NULL,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(505,2207,497,204,1,1,'SHARP',NULL,NULL,NULL,0,NULL,NULL,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(507,2209,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(508,2210,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(509,2211,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(510,2212,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,2213,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,2214,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,2215,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,2216,506,206,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(516,2219,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(517,2220,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(518,2221,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(519,2223,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Трехкамерный',NULL,89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(520,2224,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,2225,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,2226,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,2227,515,208,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,2228,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(525,2229,322,185,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,6499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(526,2231,322,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(527,2232,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,8499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(528,2233,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5799,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(529,2234,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(530,2235,322,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(531,2236,322,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2699,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(532,2238,321,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3040,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(533,2239,321,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,2999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(534,2240,321,185,1,1,NULL,'Розовый',NULL,NULL,0,NULL,NULL,NULL,3999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(535,2241,321,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,3370,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(536,2242,321,185,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(537,2244,321,185,1,1,NULL,'Мультиколор',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(538,2245,321,185,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(539,2246,321,185,1,1,NULL,'Желтый',NULL,NULL,0,NULL,NULL,NULL,827,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(540,2247,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(541,2248,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(542,2249,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(543,2250,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(544,2251,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(545,2252,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(546,2253,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(547,2254,326,209,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(548,2255,387,185,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,5033,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(549,2256,387,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,7860,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(550,2258,387,185,1,1,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,NULL,NULL,5190,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(551,2259,387,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,4999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(552,2260,387,185,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,5390,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(553,2261,387,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3458,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(554,2262,387,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3467,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(555,2263,387,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4890,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(556,2264,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2480,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(557,2265,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3500,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(558,2266,388,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,4700,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(559,2267,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,1270,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(560,2268,388,185,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3490,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(561,2269,388,185,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,3090,NULL,'50-52',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(562,2270,388,185,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(563,2271,388,185,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(565,2273,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(566,2274,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(567,2275,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(568,2276,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(569,2277,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(570,2278,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(571,2279,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(572,2280,564,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(574,2282,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(575,2283,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(576,2284,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(577,2285,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(578,2286,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(579,2287,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(580,2288,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(581,2289,573,211,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(583,2292,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(584,2293,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(585,2294,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(586,2295,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(587,2297,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(588,2298,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(589,2299,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(590,2300,582,215,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(592,2304,591,219,1,1,'Yedoo',NULL,NULL,NULL,0,NULL,NULL,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(593,2308,591,219,1,1,'Trolo Raptor',NULL,NULL,NULL,0,NULL,NULL,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(594,2310,591,219,1,1,'MICRO SPEED',NULL,NULL,NULL,0,NULL,NULL,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(595,2312,591,219,1,1,'Micro Suspension',NULL,NULL,NULL,0,NULL,NULL,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(596,2314,591,219,1,1,'Razor',NULL,NULL,NULL,0,NULL,NULL,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(597,2316,591,219,1,1,'Weelz Rock',NULL,NULL,NULL,0,NULL,NULL,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(598,2318,591,219,1,1,'HUDORA',NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(599,2320,591,219,1,1,'Xootr',NULL,NULL,NULL,0,NULL,NULL,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(600,2324,490,202,1,1,NULL,'Антрацит',NULL,NULL,0,NULL,NULL,NULL,145500,'Asko',NULL,NULL,NULL,NULL,NULL,NULL,'Сенсорный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(601,2326,490,202,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,15900,'Darina',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(602,2330,490,202,1,1,NULL,'Лед',NULL,NULL,0,NULL,NULL,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_52_pages_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_1161`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_1161`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_filter_index_56_pages_1161` (
  `id` int unsigned NOT NULL,
  `obj_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `sezon` (`sezon`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_1161`
--

LOCK TABLES `cms3_filter_index_56_pages_1161` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_1161` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_1161` VALUES (934,3945,1181,339,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13900,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(935,3946,1186,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(936,3947,1181,339,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',49800,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(937,3948,1181,339,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',14690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(938,3949,1181,339,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',8120,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(939,3950,1186,339,1,2,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,'Victorinox Swiss Army',34700,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL),(940,3951,1186,339,1,2,NULL,NULL,'Белый','Нержавеющая сталь',0,'Seiko',22900,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL),(941,3952,1186,339,1,2,NULL,NULL,'Черный','Керамика',0,'Candino',19900,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(942,3953,1186,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь',0,'Michael Kors',11500,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(943,3954,1186,339,1,2,NULL,NULL,'Черный','Пластик',1,'Posio',3790,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL),(944,3955,1186,339,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13400,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(945,3956,1181,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',58055,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(946,3957,1181,339,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',40500,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(947,3958,1181,339,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',11690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(948,3959,1181,339,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',6190,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(949,3960,1181,339,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',15000,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(950,3961,1181,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',78550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(951,3962,1181,339,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(1021,4032,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,6999,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(1022,4033,1213,364,1,2,NULL,'Зеленый',NULL,NULL,0,NULL,6499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(1023,4034,1213,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,5499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(1024,4035,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,8499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1025,4036,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,5799,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1026,4037,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1027,4038,1213,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1028,4039,1213,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,2699,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(1029,4040,1212,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3040,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1030,4041,1212,364,1,2,NULL,'Черный',NULL,NULL,0,NULL,2999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1031,4042,1212,364,1,2,NULL,'Розовый',NULL,NULL,0,NULL,3999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1032,4043,1212,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,3370,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1033,4044,1212,364,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,3445,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1034,4045,1212,364,1,2,NULL,'Мультиколор',NULL,NULL,0,NULL,2970,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1035,4046,1212,364,1,2,NULL,'Красный',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Молния+пуговицы'),(1036,4047,1212,364,1,2,NULL,'Желтый',NULL,NULL,0,NULL,827,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1037,4048,1219,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,7860,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1038,4049,1219,364,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,5033,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1039,4050,1219,364,1,2,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,5190,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(1040,4051,1219,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,4999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1041,4052,1219,364,1,2,NULL,'Черный',NULL,NULL,0,NULL,5390,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1042,4053,1219,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3458,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(1043,4054,1219,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,3467,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(1044,4055,1219,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,4890,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(1045,4056,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,2480,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(1046,4057,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3500,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(1047,4058,1220,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,4700,NULL,'52-54','Лето',NULL,NULL,NULL,'Пуговицы'),(1048,4059,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,3490,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(1049,4060,1220,364,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,3090,NULL,'50-52','Лето',NULL,NULL,NULL,'Пуговицы'),(1050,4061,1220,364,1,2,NULL,'Серый',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(1051,4062,1220,364,1,2,NULL,'Голубая',NULL,NULL,0,NULL,2970,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(1052,4063,1220,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,1270,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(1056,3908,1064,364,1,2,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,3990,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(1057,4068,1064,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,5499,NULL,'50-52','Демисезон',NULL,NULL,NULL,NULL),(1058,4069,1064,364,1,2,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,2350,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(1059,4070,1064,364,1,2,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,3450,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1060,3681,1064,364,1,2,NULL,'Черный',NULL,NULL,0,NULL,6590,NULL,'54-56','Демисезон',NULL,NULL,NULL,NULL),(1061,4072,1064,364,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1062,4073,1064,364,1,2,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,5690,NULL,'52-54','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1063,4074,1064,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1065,4076,1064,364,1,2,NULL,'Синий',NULL,NULL,0,NULL,6790,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1066,4077,1064,364,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,2350,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1067,4078,1064,364,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(1068,4079,1064,364,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(1069,4080,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1070,4081,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1071,4082,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1072,4083,1207,365,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1073,4084,1207,365,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1074,4085,1207,365,1,2,'Maybelline New York',NULL,NULL,NULL,0,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1075,4086,1207,365,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1076,4087,1207,365,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1077,4088,1207,365,1,2,'NOUBA',NULL,NULL,NULL,0,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1078,4089,1207,365,1,2,'MAX FACTOR',NULL,NULL,NULL,0,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1079,4090,1207,365,1,2,'Revlon',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1080,4091,1207,365,1,2,'Bell',NULL,NULL,NULL,0,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1081,4092,1207,365,1,2,'LUXVISAGE',NULL,NULL,NULL,0,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1087,4098,1202,372,1,2,NULL,'Черный',NULL,NULL,0,NULL,18990,'RICCI',NULL,NULL,NULL,'Механическое',NULL,NULL),(1088,4099,1202,372,1,2,NULL,'Серый',NULL,NULL,0,NULL,16900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(1089,4100,1202,372,1,2,NULL,'Черный',NULL,NULL,0,NULL,12900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(1090,4101,1202,372,1,2,NULL,'Серый',NULL,NULL,0,NULL,25900,'Bosch',NULL,NULL,NULL,'Электронный',NULL,NULL),(1091,4102,1202,372,1,2,NULL,'Серый',NULL,NULL,0,NULL,27900,'Samsung',NULL,NULL,NULL,'Электронный',NULL,NULL),(1092,4103,1202,372,1,2,NULL,'Антрацит',NULL,NULL,0,NULL,145500,'Asko',NULL,NULL,NULL,'Сенсорный',NULL,NULL),(1093,4104,1202,372,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,15900,'Darina',NULL,NULL,NULL,'Механическое',NULL,NULL),(1094,4105,1202,372,1,2,NULL,'Лед',NULL,NULL,0,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL),(1095,4106,1203,374,1,2,'LG',NULL,NULL,NULL,0,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1096,4107,1203,374,1,2,'Bosch',NULL,NULL,NULL,0,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1097,4108,1203,374,1,2,'Indesit',NULL,NULL,NULL,0,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1098,4109,1203,374,1,2,'Bosch',NULL,NULL,NULL,0,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1099,4110,1203,374,1,2,'SAMSUNG',NULL,NULL,NULL,0,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1100,4111,1203,374,1,2,'BEKO',NULL,NULL,NULL,0,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1101,4112,1203,374,1,2,'ZANUSSI',NULL,NULL,NULL,0,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1102,4113,1203,374,1,2,'SHARP',NULL,NULL,NULL,0,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1103,4114,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1104,4115,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1105,4116,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1106,4117,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1107,4118,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1108,4119,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1109,4120,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1110,4121,1204,375,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1111,4122,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1112,4123,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1113,4124,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1114,4125,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Трехкамерный',89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1115,4126,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1116,4127,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1117,4128,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1118,4129,1205,377,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1119,4130,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1120,4131,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1121,4132,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1122,4133,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1123,4134,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1124,4135,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1125,4136,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1126,4137,1214,378,1,2,NULL,NULL,NULL,NULL,0,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1127,4138,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1128,4139,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1129,4140,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1130,4141,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1131,4142,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1132,4143,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1133,4144,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1134,4145,1208,379,1,2,NULL,NULL,NULL,NULL,0,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1135,4146,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1136,4147,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1137,4148,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1138,4149,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1139,4150,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1140,4151,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1141,4152,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1142,4153,1209,379,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1143,4154,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1144,4155,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1145,4156,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1146,4157,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1147,4158,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1148,4159,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1149,4160,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1150,4161,1210,381,1,2,NULL,NULL,NULL,NULL,0,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1151,4162,1179,383,1,2,'Yedoo',NULL,NULL,NULL,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1152,4163,1179,383,1,2,'Trolo Raptor',NULL,NULL,NULL,0,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1153,4164,1179,383,1,2,'MICRO SPEED',NULL,NULL,NULL,0,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1154,4165,1179,383,1,2,'Micro Suspension',NULL,NULL,NULL,0,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1155,4166,1179,383,1,2,'Razor',NULL,NULL,NULL,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1156,4167,1179,383,1,2,'Weelz Rock',NULL,NULL,NULL,0,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1157,4168,1179,383,1,2,'HUDORA',NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1158,4169,1179,383,1,2,'Xootr',NULL,NULL,NULL,0,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1182,4193,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1183,4194,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1184,4195,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1185,4196,1181,87,1,2,NULL,NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1187,4198,1186,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_1161` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_228`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_228`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_filter_index_56_pages_228` (
  `id` int unsigned NOT NULL,
  `obj_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `naznachenie` varchar(255) DEFAULT NULL,
  `novoe_pole` varchar(255) DEFAULT NULL,
  `obem_upakovki` double DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `razmer_pitomca` varchar(255) DEFAULT NULL,
  `razmer_ramy_dyujmy` double DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `sostav_napolnitelya` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `ves` double DEFAULT NULL,
  `ves_upakovki` double DEFAULT NULL,
  `ves_velosipeda` double DEFAULT NULL,
  `vid` varchar(255) DEFAULT NULL,
  `vmestimost` bigint DEFAULT NULL,
  `vozrast` varchar(255) DEFAULT NULL,
  `vysota` double DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `naznachenie` (`naznachenie`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `obem_upakovki` (`obem_upakovki`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `razmer_pitomca` (`razmer_pitomca`),
  KEY `razmer_ramy_dyujmy` (`razmer_ramy_dyujmy`),
  KEY `sezon` (`sezon`),
  KEY `sostav_napolnitelya` (`sostav_napolnitelya`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `ves` (`ves`),
  KEY `ves_upakovki` (`ves_upakovki`),
  KEY `ves_velosipeda` (`ves_velosipeda`),
  KEY `vid` (`vid`),
  KEY `vmestimost` (`vmestimost`),
  KEY `vozrast` (`vozrast`),
  KEY `vysota` (`vysota`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_228`
--

LOCK TABLES `cms3_filter_index_56_pages_228` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_228` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_228` VALUES (1,1407,248,136,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13900,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1408,253,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1409,248,136,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,49800,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1410,248,136,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,14690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1411,248,136,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,8120,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1412,253,136,1,1,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,NULL,'Victorinox Swiss Army',NULL,34700,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1413,253,136,1,1,NULL,NULL,'Белый','Нержавеющая сталь',0,NULL,'Seiko',NULL,22900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,1414,253,136,1,1,NULL,NULL,'Черный','Керамика',0,NULL,'Candino',NULL,19900,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,1415,253,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь',0,NULL,'Michael Kors',NULL,11500,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1416,253,136,1,1,NULL,NULL,'Черный','Пластик',1,NULL,'Posio',NULL,3790,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,1417,253,136,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,13400,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,1418,248,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,58055,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,1419,248,136,1,1,NULL,NULL,NULL,'Титан',0,NULL,'Hublot',NULL,40500,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1420,248,136,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,NULL,'Suunto',NULL,11690,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,1421,248,136,1,1,NULL,NULL,'Синий','Пластик',0,NULL,'Timex',NULL,6190,NULL,NULL,NULL,NULL,NULL,NULL,'Пластик',NULL,'США',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1422,248,136,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,NULL,'Jacques Lemans',NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1423,248,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,78550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,1424,248,136,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,NULL,'Epos',NULL,70550,NULL,NULL,NULL,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,1367,230,145,1,1,NULL,'Черный',NULL,NULL,0,'Мужской',NULL,NULL,14990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,11,'Хардтейл',NULL,NULL,NULL,NULL),(20,1360,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,39900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(21,1427,230,145,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,13990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(22,1363,230,145,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,32900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(23,1429,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,69900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(24,1430,230,145,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,24900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(25,1431,230,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,17990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(26,1432,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(27,1365,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(28,1434,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5900,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(29,1435,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,79900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(30,1436,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,49900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(31,1372,230,145,1,1,NULL,'Серый',NULL,NULL,0,'Женский',NULL,NULL,38900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,9,'Двухподвес',NULL,NULL,NULL,NULL),(32,1438,230,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,18990,NULL,NULL,NULL,20,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,11,'Двухподвес',NULL,NULL,NULL,NULL),(33,1439,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,32900,NULL,NULL,NULL,19,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Хардтейл',NULL,NULL,NULL,NULL),(34,1440,230,145,1,1,NULL,'Бирюзовый',NULL,NULL,0,'Женский',NULL,NULL,19990,NULL,NULL,NULL,18,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(35,1441,230,145,1,1,NULL,'Зеленый',NULL,NULL,0,'Мужской',NULL,NULL,56900,NULL,NULL,NULL,20,NULL,NULL,NULL,'Горный',NULL,NULL,NULL,13,'Хардтейл',NULL,NULL,NULL,NULL),(36,1442,230,145,1,1,NULL,'Черный',NULL,NULL,0,'Женский',NULL,NULL,22900,NULL,NULL,NULL,21,NULL,NULL,NULL,'Дорожный',NULL,NULL,NULL,12,'Дорожный',NULL,NULL,NULL,NULL),(37,1443,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,8900,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(38,1444,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,11900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(39,1445,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,5500,NULL,NULL,NULL,8,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,6,'Хардтейл',NULL,NULL,NULL,NULL),(40,1446,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,9400,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(41,1447,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,8900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(42,1448,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,13000,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(43,1449,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Женский',NULL,NULL,12000,NULL,NULL,NULL,9,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,5,'Хардтейл',NULL,NULL,NULL,NULL),(44,1450,231,145,1,1,NULL,'Красный',NULL,NULL,0,'Унисекс',NULL,NULL,12900,NULL,NULL,NULL,10,NULL,NULL,NULL,'Городской',NULL,NULL,NULL,4,'Хардтейл',NULL,NULL,NULL,NULL),(45,1451,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,950,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1500,NULL,NULL,NULL,'Взрослые',NULL,NULL),(46,1452,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3200,NULL,NULL,NULL,'Взрослые',NULL,NULL),(47,1453,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000,NULL,NULL,NULL,'Взрослые',NULL,NULL),(48,1454,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2720,NULL,NULL,NULL,'Взрослые',NULL,NULL),(49,1455,258,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3630,NULL,NULL,NULL,'Любой',NULL,NULL),(50,1456,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,810,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1020,NULL,NULL,NULL,'Взрослые',NULL,NULL),(51,1457,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(52,1458,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1320,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2040,NULL,NULL,NULL,'Любой',NULL,NULL),(53,1459,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1190,NULL,NULL,NULL,'Взрослые',NULL,NULL),(54,1460,259,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3840,NULL,NULL,NULL,'Взрослые',NULL,NULL),(55,1461,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,190,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL,NULL),(56,1462,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,389,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,NULL,NULL,NULL),(57,1463,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,'Малый и средний',NULL,NULL,NULL,NULL,NULL,NULL,NULL,700,NULL,NULL,NULL,'Любой',NULL,NULL),(58,1464,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,99,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,'Любой',NULL,NULL),(59,1465,266,151,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,80,NULL,NULL,'Любой размер',NULL,NULL,NULL,NULL,NULL,NULL,NULL,400,NULL,NULL,NULL,'Взрослые',NULL,NULL),(60,1466,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.5,154,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,1467,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,4.54,119,NULL,NULL,NULL,NULL,NULL,'Древесина',NULL,NULL,NULL,2.31,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,1468,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,10,480,NULL,NULL,NULL,NULL,NULL,'Хлопок',NULL,NULL,NULL,0.96,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,1469,257,155,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,16,1790,NULL,NULL,NULL,NULL,NULL,'Глина + мин. добавки',NULL,NULL,NULL,15.87,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,1470,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.9,NULL,NULL,NULL,2,NULL,105,NULL),(65,1471,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.14,NULL,NULL,NULL,1,NULL,86,NULL),(66,1472,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2950,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3.12,NULL,NULL,NULL,1,NULL,137,NULL),(67,1473,239,157,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2940,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2.9,NULL,NULL,NULL,2,NULL,110,NULL),(68,1474,284,161,1,1,'MitLex','Черный',NULL,NULL,0,NULL,NULL,NULL,11900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(69,1475,284,161,1,1,'Mango Man','Бежевый',NULL,NULL,0,NULL,NULL,NULL,9900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(70,1476,284,161,1,1,'Burton Menswear London','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(71,1369,86,161,1,1,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,NULL,NULL,3990,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,1478,284,161,1,1,'Roosevelt','Серый',NULL,NULL,0,NULL,NULL,NULL,10399,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(73,1479,86,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'50-52',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,1480,284,161,1,1,'United Colors of Benetton','Черный',NULL,NULL,0,NULL,NULL,NULL,8900,NULL,'52-54',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(75,1481,86,161,1,1,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,1482,284,161,1,1,'Only & Sons','Черный',NULL,NULL,0,NULL,NULL,NULL,6500,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(77,1483,86,161,1,1,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,NULL,NULL,3450,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(78,749,86,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,6590,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,1485,284,161,1,1,'Jack & Jones','Черный',NULL,NULL,0,NULL,NULL,NULL,10999,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(80,1486,86,161,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(81,1487,86,161,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,8950,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(82,1488,284,161,1,1,'Windsor','Черный',NULL,NULL,0,NULL,NULL,NULL,52900,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,1489,284,161,1,1,'Trussardi Jeans','Синий',NULL,NULL,0,NULL,NULL,NULL,26900,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(84,1490,284,161,1,1,'Berkytt','Коричневый',NULL,NULL,0,NULL,NULL,NULL,12400,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(85,1491,284,161,1,1,'Piazza Italia','Серый',NULL,NULL,0,NULL,NULL,NULL,7399,NULL,'52-54',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(87,1493,86,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6790,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(88,1494,285,161,1,1,'Atributika & Club','Черный',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(89,1495,86,161,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,NULL,NULL,2350,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(90,1496,285,161,1,1,'Trespass','Хакки',NULL,NULL,0,NULL,NULL,NULL,18999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(91,1497,86,161,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(92,1498,86,161,1,1,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,NULL,NULL,5690,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(93,1499,285,161,1,1,'EA7','Синий',NULL,NULL,0,NULL,NULL,NULL,22899,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(94,1500,285,161,1,1,'Reebok','Серый',NULL,NULL,0,NULL,NULL,NULL,14690,NULL,'48-50',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(95,1501,86,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4590,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(96,1502,285,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,22889,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(97,1503,285,161,1,1,'Bergans of Norway','Черный',NULL,NULL,0,NULL,NULL,NULL,27999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(98,1504,285,161,1,1,'Springfield','Желтый',NULL,NULL,0,NULL,NULL,NULL,7999,NULL,'52-54',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(99,1505,285,161,1,1,'Columbia','Красный',NULL,NULL,0,NULL,NULL,NULL,23999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(100,1506,285,161,1,1,'Columbia','Синий',NULL,NULL,0,NULL,NULL,NULL,12999,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(101,1507,285,161,1,1,'Baon','Синий',NULL,NULL,0,NULL,NULL,NULL,12699,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(102,1508,285,161,1,1,'Quiksilver','Черный',NULL,NULL,0,NULL,NULL,NULL,17690,NULL,'50-52',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(103,1509,285,161,1,1,'Columbia','Черный',NULL,NULL,0,NULL,NULL,NULL,9999,NULL,'54-56',NULL,NULL,'Демисезон, зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(104,1510,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,6999,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(105,1511,280,161,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,6499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(106,1512,280,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,5499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(107,1513,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,8499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(108,1514,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,5799,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(109,1515,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(110,1516,280,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,2499,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(111,1517,280,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2699,NULL,'54-56',NULL,NULL,'Зима',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(112,1518,279,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3040,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(113,1519,279,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,2999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(114,1520,279,161,1,1,NULL,'Розовый',NULL,NULL,0,NULL,NULL,NULL,3999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(115,1521,279,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,3370,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(116,1522,279,161,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(117,1523,279,161,1,1,NULL,'Мультиколор',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(118,1524,279,161,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния+пуговицы'),(119,1525,279,161,1,1,NULL,'Желтый',NULL,NULL,0,NULL,NULL,NULL,827,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(120,1526,286,161,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,NULL,NULL,5033,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(121,1527,286,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,7860,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(122,1528,286,161,1,1,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,NULL,NULL,5190,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(123,1529,286,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,4999,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(124,1530,286,161,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,5390,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(125,1531,286,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3458,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(126,1532,286,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3467,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(127,1533,286,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,4890,NULL,'54-56',NULL,NULL,'Демисезон',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Молния'),(128,1534,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2480,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(129,1535,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3500,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(130,1536,287,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,4700,NULL,'52-54',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(131,1537,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,1270,NULL,'54-56',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(132,1538,287,161,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,3490,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(133,1539,287,161,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,3090,NULL,'50-52',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(134,1540,287,161,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,3445,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(135,1541,287,161,1,1,NULL,'Голубая',NULL,NULL,0,NULL,NULL,NULL,2970,NULL,'48-50',NULL,NULL,'Лето',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пуговицы'),(136,1542,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,1543,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,1544,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,1545,274,162,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,1546,274,162,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,NULL,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,1547,274,162,1,1,'Maybelline New York',NULL,NULL,NULL,0,NULL,NULL,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,1548,274,162,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,1549,274,162,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,1550,274,162,1,1,'NOUBA',NULL,NULL,NULL,0,NULL,NULL,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,1551,274,162,1,1,'MAX FACTOR',NULL,NULL,NULL,0,NULL,NULL,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,1552,274,162,1,1,'Revlon',NULL,NULL,NULL,0,NULL,NULL,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,1553,274,162,1,1,'Bell',NULL,NULL,NULL,0,NULL,NULL,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,1554,274,162,1,1,'LUXVISAGE',NULL,NULL,NULL,0,NULL,NULL,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,1555,267,163,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,2750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,1556,267,163,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,NULL,NULL,3400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,1557,267,163,1,1,NULL,'Синий',NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,1558,267,163,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,6700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,1559,267,163,1,1,NULL,'Красный',NULL,NULL,0,NULL,NULL,NULL,6875,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,1560,269,169,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,18990,'RICCI',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(155,1561,269,169,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,16900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,1562,269,169,1,1,NULL,'Черный',NULL,NULL,0,NULL,NULL,NULL,12900,'Hansa',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,1563,269,169,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,25900,'Bosch',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,1564,269,169,1,1,NULL,'Серый',NULL,NULL,0,NULL,NULL,NULL,27900,'Samsung',NULL,NULL,NULL,NULL,NULL,NULL,'Электронный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(159,1565,269,169,1,1,NULL,'Антрацит',NULL,NULL,0,NULL,NULL,NULL,145500,'Asko',NULL,NULL,NULL,NULL,NULL,NULL,'Сенсорный',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,1566,269,169,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,NULL,NULL,15900,'Darina',NULL,NULL,NULL,NULL,NULL,NULL,'Механическое',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,1567,269,169,1,1,NULL,'Лед',NULL,NULL,0,NULL,NULL,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,1568,270,171,1,1,'LG',NULL,NULL,NULL,0,NULL,NULL,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,1569,270,171,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,1570,270,171,1,1,'Indesit',NULL,NULL,NULL,0,NULL,NULL,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,1571,270,171,1,1,'Bosch',NULL,NULL,NULL,0,NULL,NULL,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,1572,270,171,1,1,'SAMSUNG',NULL,NULL,NULL,0,NULL,NULL,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,1573,270,171,1,1,'BEKO',NULL,NULL,NULL,0,NULL,NULL,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(168,1574,270,171,1,1,'ZANUSSI',NULL,NULL,NULL,0,NULL,NULL,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(169,1575,270,171,1,1,'SHARP',NULL,NULL,NULL,0,NULL,NULL,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,1576,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,1577,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,1578,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,1579,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,1580,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,1581,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,1582,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,1583,271,172,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(178,1584,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,1585,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,1586,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,1587,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Трехкамерный',NULL,89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,1588,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,1589,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,1590,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,1591,272,174,1,1,NULL,NULL,NULL,NULL,0,NULL,'Двухкамерный',NULL,24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,1592,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(187,1593,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,1594,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,1595,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(190,1596,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(191,1597,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,1598,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,1599,281,175,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,1600,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(195,1601,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,1602,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,1603,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,1604,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(199,1605,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,1606,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,1607,275,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(202,1608,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,1609,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,1610,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(205,1611,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(206,1612,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,1613,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(208,1614,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(209,1615,276,176,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(210,1616,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,1617,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,1618,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,1619,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,1620,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,1621,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,1622,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,1623,277,178,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,1624,246,180,1,1,'Yedoo',NULL,NULL,NULL,0,NULL,NULL,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,1625,246,180,1,1,'Trolo Raptor',NULL,NULL,NULL,0,NULL,NULL,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,1626,246,180,1,1,'MICRO SPEED',NULL,NULL,NULL,0,NULL,NULL,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,1627,246,180,1,1,'Micro Suspension',NULL,NULL,NULL,0,NULL,NULL,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,1628,246,180,1,1,'Razor',NULL,NULL,NULL,0,NULL,NULL,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,1629,246,180,1,1,'Weelz Rock',NULL,NULL,NULL,0,NULL,NULL,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,1630,246,180,1,1,'HUDORA',NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,1631,246,180,1,1,'Xootr',NULL,NULL,NULL,0,NULL,NULL,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,1641,234,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,780,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,1642,234,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,410,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,1643,234,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,1647,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,740,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(242,1648,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(243,1649,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(244,1650,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2700,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(245,1651,240,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,3300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,1655,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,1656,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(251,1657,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,1658,248,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,1660,253,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,1668,261,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,1669,261,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1750,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(264,1670,261,87,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,2610,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_228` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_539`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_539`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_filter_index_56_pages_539` (
  `id` int unsigned NOT NULL,
  `obj_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `sezon` (`sezon`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_539`
--

LOCK TABLES `cms3_filter_index_56_pages_539` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_539` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_539` VALUES (312,2132,559,209,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13900,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(313,2133,564,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(314,2134,559,209,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',49800,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(315,2135,559,209,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',14690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(316,2136,559,209,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',8120,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(317,2137,564,209,1,2,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,'Victorinox Swiss Army',34700,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL),(318,2138,564,209,1,2,NULL,NULL,'Белый','Нержавеющая сталь',0,'Seiko',22900,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL),(319,2139,564,209,1,2,NULL,NULL,'Черный','Керамика',0,'Candino',19900,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(320,2140,564,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь',0,'Michael Kors',11500,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(321,2141,564,209,1,2,NULL,NULL,'Черный','Пластик',1,'Posio',3790,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL),(322,2142,564,209,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13400,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(323,2143,559,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',58055,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(324,2144,559,209,1,2,NULL,NULL,NULL,'Титан',0,'Hublot',40500,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(325,2145,559,209,1,2,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',11690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(326,2146,559,209,1,2,NULL,NULL,'Синий','Пластик',0,'Timex',6190,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(327,2147,559,209,1,2,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',15000,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(328,2148,559,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',78550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(329,2149,559,209,1,2,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(399,2219,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,6999,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(400,2220,591,234,1,2,NULL,'Зеленый',NULL,NULL,0,NULL,6499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(401,2221,591,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,5499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(402,2222,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,8499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(403,2223,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,5799,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(404,2224,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(405,2225,591,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(406,2226,591,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,2699,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(407,2227,590,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3040,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(408,2228,590,234,1,2,NULL,'Черный',NULL,NULL,0,NULL,2999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(409,2229,590,234,1,2,NULL,'Розовый',NULL,NULL,0,NULL,3999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(410,2230,590,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,3370,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(411,2231,590,234,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,3445,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(412,2232,590,234,1,2,NULL,'Мультиколор',NULL,NULL,0,NULL,2970,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(413,2233,590,234,1,2,NULL,'Красный',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Молния+пуговицы'),(414,2234,590,234,1,2,NULL,'Желтый',NULL,NULL,0,NULL,827,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(415,2235,597,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,7860,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(416,2236,597,234,1,2,NULL,'Коричневый',NULL,NULL,0,NULL,5033,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(417,2237,597,234,1,2,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,5190,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(418,2238,597,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,4999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(419,2239,597,234,1,2,NULL,'Черный',NULL,NULL,0,NULL,5390,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(420,2240,597,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3458,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(421,2241,597,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,3467,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(422,2242,597,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,4890,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(423,2243,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,2480,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(424,2244,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3500,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(425,2245,598,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,4700,NULL,'52-54','Лето',NULL,NULL,NULL,'Пуговицы'),(426,2246,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,3490,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(427,2247,598,234,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,3090,NULL,'50-52','Лето',NULL,NULL,NULL,'Пуговицы'),(428,2248,598,234,1,2,NULL,'Серый',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(429,2249,598,234,1,2,NULL,'Голубая',NULL,NULL,0,NULL,2970,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(430,2250,598,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,1270,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(434,2095,442,234,1,2,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,3990,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(435,2255,442,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,5499,NULL,'50-52','Демисезон',NULL,NULL,NULL,NULL),(436,2256,442,234,1,2,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,2350,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(437,2257,442,234,1,2,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,3450,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(438,1868,442,234,1,2,NULL,'Черный',NULL,NULL,0,NULL,6590,NULL,'54-56','Демисезон',NULL,NULL,NULL,NULL),(439,2259,442,234,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(440,2260,442,234,1,2,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,5690,NULL,'52-54','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(441,2261,442,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(443,2263,442,234,1,2,NULL,'Синий',NULL,NULL,0,NULL,6790,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(444,2264,442,234,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,2350,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(445,2265,442,234,1,2,'Kekker style','Серый',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(446,2266,442,234,1,2,'Kekker style','Синий',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(447,2267,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(448,2268,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(449,2269,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(450,2270,585,235,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(451,2271,585,235,1,2,'L`Oreal',NULL,NULL,NULL,0,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(452,2272,585,235,1,2,'Maybelline New York',NULL,NULL,NULL,0,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(453,2273,585,235,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(454,2274,585,235,1,2,'Rimmel',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(455,2275,585,235,1,2,'NOUBA',NULL,NULL,NULL,0,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(456,2276,585,235,1,2,'MAX FACTOR',NULL,NULL,NULL,0,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(457,2277,585,235,1,2,'Revlon',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(458,2278,585,235,1,2,'Bell',NULL,NULL,NULL,0,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(459,2279,585,235,1,2,'LUXVISAGE',NULL,NULL,NULL,0,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,2285,580,242,1,2,NULL,'Черный',NULL,NULL,0,NULL,18990,'RICCI',NULL,NULL,NULL,'Механическое',NULL,NULL),(466,2286,580,242,1,2,NULL,'Серый',NULL,NULL,0,NULL,16900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(467,2287,580,242,1,2,NULL,'Черный',NULL,NULL,0,NULL,12900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(468,2288,580,242,1,2,NULL,'Серый',NULL,NULL,0,NULL,25900,'Bosch',NULL,NULL,NULL,'Электронный',NULL,NULL),(469,2289,580,242,1,2,NULL,'Серый',NULL,NULL,0,NULL,27900,'Samsung',NULL,NULL,NULL,'Электронный',NULL,NULL),(470,2290,580,242,1,2,NULL,'Антрацит',NULL,NULL,0,NULL,145500,'Asko',NULL,NULL,NULL,'Сенсорный',NULL,NULL),(471,2291,580,242,1,2,NULL,'Бежевый',NULL,NULL,0,NULL,15900,'Darina',NULL,NULL,NULL,'Механическое',NULL,NULL),(472,2292,580,242,1,2,NULL,'Лед',NULL,NULL,0,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL),(473,2293,581,244,1,2,'LG',NULL,NULL,NULL,0,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(474,2294,581,244,1,2,'Bosch',NULL,NULL,NULL,0,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(475,2295,581,244,1,2,'Indesit',NULL,NULL,NULL,0,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(476,2296,581,244,1,2,'Bosch',NULL,NULL,NULL,0,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(477,2297,581,244,1,2,'SAMSUNG',NULL,NULL,NULL,0,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(478,2298,581,244,1,2,'BEKO',NULL,NULL,NULL,0,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(479,2299,581,244,1,2,'ZANUSSI',NULL,NULL,NULL,0,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(480,2300,581,244,1,2,'SHARP',NULL,NULL,NULL,0,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,2301,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,2302,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(483,2303,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(484,2304,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(485,2305,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(486,2306,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(487,2307,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(488,2308,582,245,1,2,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(489,2309,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(490,2310,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(491,2311,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(492,2312,583,247,1,2,NULL,NULL,NULL,NULL,0,'Трехкамерный',89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(493,2313,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(494,2314,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(495,2315,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(496,2316,583,247,1,2,NULL,NULL,NULL,NULL,0,'Двухкамерный',24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(497,2317,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(498,2318,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(499,2319,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(500,2320,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(501,2321,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(502,2322,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(503,2323,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(504,2324,592,248,1,2,NULL,NULL,NULL,NULL,0,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(505,2325,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(506,2326,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(507,2327,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(508,2328,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(509,2329,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(510,2330,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(511,2331,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,2332,586,249,1,2,NULL,NULL,NULL,NULL,0,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,2333,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,2334,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(515,2335,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(516,2336,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(517,2337,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(518,2338,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(519,2339,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(520,2340,587,249,1,2,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,2341,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,2342,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,2343,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,2344,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(525,2345,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(526,2346,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(527,2347,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(528,2348,588,251,1,2,NULL,NULL,NULL,NULL,0,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(529,2349,557,253,1,2,'Yedoo',NULL,NULL,NULL,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(530,2350,557,253,1,2,'Trolo Raptor',NULL,NULL,NULL,0,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,2351,557,253,1,2,'MICRO SPEED',NULL,NULL,NULL,0,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,2352,557,253,1,2,'Micro Suspension',NULL,NULL,NULL,0,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,2353,557,253,1,2,'Razor',NULL,NULL,NULL,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,2354,557,253,1,2,'Weelz Rock',NULL,NULL,NULL,0,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(535,2355,557,253,1,2,'HUDORA',NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(536,2356,557,253,1,2,'Xootr',NULL,NULL,NULL,0,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(560,2380,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(561,2381,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(562,2382,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(563,2383,559,87,1,2,NULL,NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(565,2385,564,87,1,2,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_539` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_filter_index_56_pages_850`
--

DROP TABLE IF EXISTS `cms3_filter_index_56_pages_850`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_filter_index_56_pages_850` (
  `id` int unsigned NOT NULL,
  `obj_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `brend` varchar(255) DEFAULT NULL,
  `cvet` varchar(255) DEFAULT NULL,
  `cvet_korpusa` varchar(255) DEFAULT NULL,
  `material_korpusa` varchar(255) DEFAULT NULL,
  `nalichie_budilnika` tinyint(1) DEFAULT '0',
  `novoe_pole` varchar(255) DEFAULT NULL,
  `price` double DEFAULT '0',
  `proizvoditel` varchar(255) DEFAULT NULL,
  `razmer` varchar(255) DEFAULT NULL,
  `sezon` varchar(255) DEFAULT NULL,
  `steklo` varchar(255) DEFAULT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `tip_mehanizma` varchar(255) DEFAULT NULL,
  `zastezhka` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `parent_id` (`parent_id`),
  KEY `type_id` (`type_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `brend` (`brend`),
  KEY `cvet` (`cvet`),
  KEY `cvet_korpusa` (`cvet_korpusa`),
  KEY `material_korpusa` (`material_korpusa`),
  KEY `novoe_pole` (`novoe_pole`),
  KEY `price` (`price`),
  KEY `proizvoditel` (`proizvoditel`),
  KEY `razmer` (`razmer`),
  KEY `sezon` (`sezon`),
  KEY `steklo` (`steklo`),
  KEY `tip` (`tip`),
  KEY `tip_mehanizma` (`tip_mehanizma`),
  KEY `zastezhka` (`zastezhka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_filter_index_56_pages_850`
--

LOCK TABLES `cms3_filter_index_56_pages_850` WRITE;
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_850` DISABLE KEYS */;
INSERT INTO `cms3_filter_index_56_pages_850` VALUES (623,3223,870,274,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13900,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(624,3224,875,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(625,3225,870,274,1,1,NULL,NULL,NULL,'Титан',0,'Hublot',49800,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(626,3226,870,274,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',14690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(627,3227,870,274,1,1,NULL,NULL,'Синий','Пластик',0,'Timex',8120,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(628,3228,875,274,1,1,NULL,NULL,'Белый','Нержавеющая сталь + PVD покрытие',1,'Victorinox Swiss Army',34700,NULL,NULL,NULL,'Сапфировое',NULL,'США',NULL),(629,3229,875,274,1,1,NULL,NULL,'Белый','Нержавеющая сталь',0,'Seiko',22900,NULL,NULL,NULL,'Сапфировое',NULL,'Япония',NULL),(630,3230,875,274,1,1,NULL,NULL,'Черный','Керамика',0,'Candino',19900,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(631,3231,875,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь',0,'Michael Kors',11500,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(632,3232,875,274,1,1,NULL,NULL,'Черный','Пластик',1,'Posio',3790,NULL,NULL,NULL,'Пластик',NULL,'Япония',NULL),(633,3233,875,274,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',13400,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(634,3234,870,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',58055,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(635,3235,870,274,1,1,NULL,NULL,NULL,'Титан',0,'Hublot',40500,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(636,3236,870,274,1,1,NULL,NULL,'Черный','Нержавеющая сталь',0,'Suunto',11690,NULL,NULL,NULL,'Минеральное',NULL,'Финляндия',NULL),(637,3237,870,274,1,1,NULL,NULL,'Синий','Пластик',0,'Timex',6190,NULL,NULL,NULL,'Пластик',NULL,'США',NULL),(638,3238,870,274,1,1,NULL,NULL,'Серый','Нержавеющая сталь',0,'Jacques Lemans',15000,NULL,NULL,NULL,'Минеральное',NULL,'Китай',NULL),(639,3239,870,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',78550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(640,3240,870,274,1,1,NULL,NULL,'Золотой','Нержавеющая сталь + PVD покрытие',0,'Epos',70550,NULL,NULL,NULL,'Сапфировое',NULL,'Швейцария',NULL),(710,3310,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,6999,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(711,3311,902,299,1,1,NULL,'Зеленый',NULL,NULL,0,NULL,6499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(712,3312,902,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,5499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния+пуговицы'),(713,3313,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,8499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(714,3314,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,5799,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(715,3315,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(716,3316,902,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,2499,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(717,3317,902,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,2699,NULL,'54-56','Зима',NULL,NULL,NULL,'Молния'),(718,3318,901,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3040,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(719,3319,901,299,1,1,NULL,'Черный',NULL,NULL,0,NULL,2999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(720,3320,901,299,1,1,NULL,'Розовый',NULL,NULL,0,NULL,3999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(721,3321,901,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,3370,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(722,3322,901,299,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,3445,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(723,3323,901,299,1,1,NULL,'Мультиколор',NULL,NULL,0,NULL,2970,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(724,3324,901,299,1,1,NULL,'Красный',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Молния+пуговицы'),(725,3325,901,299,1,1,NULL,'Желтый',NULL,NULL,0,NULL,827,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(726,3326,908,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,7860,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(727,3327,908,299,1,1,NULL,'Коричневый',NULL,NULL,0,NULL,5033,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(728,3328,908,299,1,1,NULL,'Темно-синий, малиновый',NULL,NULL,0,NULL,5190,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(729,3329,908,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,4999,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(730,3330,908,299,1,1,NULL,'Черный',NULL,NULL,0,NULL,5390,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(731,3331,908,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3458,NULL,'52-54','Лето',NULL,NULL,NULL,'Молния'),(732,3332,908,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,3467,NULL,'54-56','Лето',NULL,NULL,NULL,'Молния'),(733,3333,908,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,4890,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния'),(734,3334,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,2480,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(735,3335,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3500,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(736,3336,909,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,4700,NULL,'52-54','Лето',NULL,NULL,NULL,'Пуговицы'),(737,3337,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,3490,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(738,3338,909,299,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,3090,NULL,'50-52','Лето',NULL,NULL,NULL,'Пуговицы'),(739,3339,909,299,1,1,NULL,'Серый',NULL,NULL,0,NULL,3445,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(740,3340,909,299,1,1,NULL,'Голубая',NULL,NULL,0,NULL,2970,NULL,'48-50','Лето',NULL,NULL,NULL,'Пуговицы'),(741,3341,909,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,1270,NULL,'54-56','Лето',NULL,NULL,NULL,'Пуговицы'),(745,3186,753,299,1,1,'BRUNO BANANI','Синий',NULL,NULL,0,NULL,3990,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(746,3346,753,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,5499,NULL,'50-52','Демисезон',NULL,NULL,NULL,NULL),(747,3347,753,299,1,1,'RHODE ISLAND','Синий',NULL,NULL,0,NULL,2350,NULL,'52-54','Демисезон',NULL,NULL,NULL,NULL),(748,3348,753,299,1,1,'BRUNO BANANI','Серый',NULL,NULL,0,NULL,3450,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(749,2588,753,299,1,1,NULL,'Черный',NULL,NULL,0,NULL,6590,NULL,'54-56','Демисезон',NULL,NULL,NULL,NULL),(750,3350,753,299,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(751,3351,753,299,1,1,'JOHN DEVIN','Серый',NULL,NULL,0,NULL,5690,NULL,'52-54','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(752,3352,753,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(754,3354,753,299,1,1,NULL,'Синий',NULL,NULL,0,NULL,6790,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(755,3355,753,299,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,2350,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(756,3356,753,299,1,1,'Kekker style','Серый',NULL,NULL,0,NULL,4590,NULL,'54-56','Демисезон, зима',NULL,NULL,NULL,'Молния+пуговицы'),(757,3357,753,299,1,1,'Kekker style','Синий',NULL,NULL,0,NULL,8950,NULL,'54-56','Демисезон',NULL,NULL,NULL,'Молния+пуговицы'),(758,3358,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,2300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(759,3359,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,149,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(760,3360,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,310,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(761,3361,896,300,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,440,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(762,3362,896,300,1,1,'L`Oreal',NULL,NULL,NULL,0,NULL,430,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(763,3363,896,300,1,1,'Maybelline New York',NULL,NULL,NULL,0,NULL,220,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(764,3364,896,300,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(765,3365,896,300,1,1,'Rimmel',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(766,3366,896,300,1,1,'NOUBA',NULL,NULL,NULL,0,NULL,1099,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(767,3367,896,300,1,1,'MAX FACTOR',NULL,NULL,NULL,0,NULL,350,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(768,3368,896,300,1,1,'Revlon',NULL,NULL,NULL,0,NULL,390,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(769,3369,896,300,1,1,'Bell',NULL,NULL,NULL,0,NULL,210,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(770,3370,896,300,1,1,'LUXVISAGE',NULL,NULL,NULL,0,NULL,280,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(776,3376,891,307,1,1,NULL,'Черный',NULL,NULL,0,NULL,18990,'RICCI',NULL,NULL,NULL,'Механическое',NULL,NULL),(777,3377,891,307,1,1,NULL,'Серый',NULL,NULL,0,NULL,16900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(778,3378,891,307,1,1,NULL,'Черный',NULL,NULL,0,NULL,12900,'Hansa',NULL,NULL,NULL,'Механическое',NULL,NULL),(779,3379,891,307,1,1,NULL,'Серый',NULL,NULL,0,NULL,25900,'Bosch',NULL,NULL,NULL,'Электронный',NULL,NULL),(780,3380,891,307,1,1,NULL,'Серый',NULL,NULL,0,NULL,27900,'Samsung',NULL,NULL,NULL,'Электронный',NULL,NULL),(781,3381,891,307,1,1,NULL,'Антрацит',NULL,NULL,0,NULL,145500,'Asko',NULL,NULL,NULL,'Сенсорный',NULL,NULL),(782,3382,891,307,1,1,NULL,'Бежевый',NULL,NULL,0,NULL,15900,'Darina',NULL,NULL,NULL,'Механическое',NULL,NULL),(783,3383,891,307,1,1,NULL,'Лед',NULL,NULL,0,NULL,60999,'Hotpoint-Ariston',NULL,NULL,NULL,'Поворотные переключатели',NULL,NULL),(784,3384,892,309,1,1,'LG',NULL,NULL,NULL,0,NULL,24900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(785,3385,892,309,1,1,'Bosch',NULL,NULL,NULL,0,NULL,22000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(786,3386,892,309,1,1,'Indesit',NULL,NULL,NULL,0,NULL,15499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(787,3387,892,309,1,1,'Bosch',NULL,NULL,NULL,0,NULL,29999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(788,3388,892,309,1,1,'SAMSUNG',NULL,NULL,NULL,0,NULL,27999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(789,3389,892,309,1,1,'BEKO',NULL,NULL,NULL,0,NULL,12499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(790,3390,892,309,1,1,'ZANUSSI',NULL,NULL,NULL,0,NULL,25999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(791,3391,892,309,1,1,'SHARP',NULL,NULL,NULL,0,NULL,184999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(792,3392,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,6999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(793,3393,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,2799,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(794,3394,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,19990,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(795,3395,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,3499,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(796,3396,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(797,3397,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,14999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(798,3398,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,8299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(799,3399,893,310,1,1,NULL,NULL,NULL,NULL,0,NULL,4999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(800,3400,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',17999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(801,3401,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',37999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(802,3402,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',45699,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(803,3403,894,312,1,1,NULL,NULL,NULL,NULL,0,'Трехкамерный',89959,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(804,3404,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',36999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(805,3405,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',32899,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(806,3406,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',76999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(807,3407,894,312,1,1,NULL,NULL,NULL,NULL,0,'Двухкамерный',24299,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(808,3408,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2970,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(809,3409,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2399,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(810,3410,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,3599,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(811,3411,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(812,3412,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,2999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(813,3413,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,3999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(814,3414,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,1999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(815,3415,903,313,1,1,NULL,NULL,NULL,NULL,0,NULL,3337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(816,3416,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,3780,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(817,3417,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,2100,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(818,3418,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,598,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(819,3419,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,1824,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(820,3420,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,708,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(821,3421,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,1297,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(822,3422,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,269,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(823,3423,897,314,1,1,NULL,NULL,NULL,NULL,0,NULL,1084,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(824,3424,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,132,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(825,3425,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(826,3426,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,588,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(827,3427,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(828,3428,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,998,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(829,3429,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(830,3430,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,393,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(831,3431,898,314,1,1,NULL,NULL,NULL,NULL,0,NULL,337,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(832,3432,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,2600,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(833,3433,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,3500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(834,3434,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(835,3435,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,2465,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(836,3436,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,4562,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(837,3437,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,2580,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(838,3438,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(839,3439,899,316,1,1,NULL,NULL,NULL,NULL,0,NULL,9000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(840,3440,868,318,1,1,'Yedoo',NULL,NULL,NULL,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(841,3441,868,318,1,1,'Trolo Raptor',NULL,NULL,NULL,0,NULL,12500,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(842,3442,868,318,1,1,'MICRO SPEED',NULL,NULL,NULL,0,NULL,7860,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(843,3443,868,318,1,1,'Micro Suspension',NULL,NULL,NULL,0,NULL,8999,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(844,3444,868,318,1,1,'Razor',NULL,NULL,NULL,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(845,3445,868,318,1,1,'Weelz Rock',NULL,NULL,NULL,0,NULL,9800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(846,3446,868,318,1,1,'HUDORA',NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(847,3447,868,318,1,1,'Xootr',NULL,NULL,NULL,0,NULL,11800,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(871,3471,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,29200,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(872,3472,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,47900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(873,3473,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(874,3474,870,87,1,1,NULL,NULL,NULL,NULL,0,NULL,17900,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(876,3476,875,87,1,1,NULL,NULL,NULL,NULL,0,NULL,18000,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_filter_index_56_pages_850` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_hierarchy`
--

DROP TABLE IF EXISTS `cms3_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_hierarchy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rel` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `obj_id` int unsigned NOT NULL,
  `ord` int DEFAULT '0',
  `tpl_id` int unsigned DEFAULT NULL,
  `alt_name` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `updatetime` int DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `types rels_FK` (`type_id`),
  KEY `Prefix from lang_id_FK` (`lang_id`),
  KEY `Domain from domain_id relation_FK` (`domain_id`),
  KEY `hierarchy to plain object image_FK` (`obj_id`),
  KEY `Getting template data_FK` (`tpl_id`),
  KEY `is_default` (`is_default`),
  KEY `alt_name` (`alt_name`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `ord` (`ord`),
  KEY `rel` (`rel`),
  KEY `updatetime` (`updatetime`),
  KEY `is_visible` (`is_visible`),
  CONSTRAINT `FK_Domain from domain_id relation` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Getting template data` FOREIGN KEY (`tpl_id`) REFERENCES `cms3_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_hierarchy to plain object image` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Prefix from lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_types rels` FOREIGN KEY (`type_id`) REFERENCES `cms3_hierarchy_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_hierarchy`
--

LOCK TABLES `cms3_hierarchy` WRITE;
/*!40000 ALTER TABLE `cms3_hierarchy` DISABLE KEYS */;
INSERT INTO `cms3_hierarchy` VALUES (1,0,30,1,1,624,1,1,'glavnaya',1,0,1,1560860130,1),(2,0,30,1,1,625,2,1,'obo-mne',1,0,1,1560173941,0),(3,0,46,1,1,626,3,1,'fotogalereya',1,0,1,1560263278,0),(4,0,32,1,1,627,5,1,'blog',1,0,1,1560855778,0),(5,0,42,1,1,630,7,1,'kontakty',1,0,1,1560945546,0),(6,4,35,1,1,632,1,1,'kak-cveta-v-dizajne-internet-magazina-vliyayut-na-prodazhi',1,0,0,1560503088,0),(7,4,35,1,1,633,2,1,'kak-bystro-napolnit-i-zapustit-internet-magazin',1,0,0,1560503114,0),(8,4,35,1,1,634,3,1,'samostoyatelnoe-prodvizhenie-sajta-s-chego-nachat-i-kuda-dvigatsya',1,0,0,1560503160,0),(26,3,47,1,1,658,1,1,'zabochus-o-bezopasnosti-svoih-klientov-i-obespechivayu-nadezhnuyu-zawitu',1,0,0,1560260673,0),(27,3,47,1,1,659,2,1,'na-treninge-povysheniya-kvalifikacii',1,0,0,1560260698,0),(28,3,47,1,1,660,3,1,'ya-lyublyu-svoih-klientov-i-zabochus-o-nih',1,0,0,1560260721,0),(29,3,47,1,1,661,4,1,'ya-ispolzuyu-tolko-sovremennye-tehnologii',1,0,0,1560260772,0),(30,3,47,1,1,662,5,1,'moi-kachestva-nedostayuwie-zveno-vashego-uspeha',1,0,0,1560260827,0),(31,3,47,1,1,663,6,1,'luchshij-v-svoej-professionalnoj-deyatelnosti',1,0,0,1560260865,0),(32,3,47,1,1,664,7,1,'podpisanie-vazhnogo-dogovora',1,0,0,1560260878,0),(33,3,47,1,1,665,8,1,'optimiziruyu-rashody-klienta',1,0,0,1560260949,0),(34,3,47,1,1,666,9,1,'vstrecha-s-klientom',1,0,0,1560260980,0),(35,3,47,1,1,667,10,1,'rabotayu-kachestvenno-eto-pomogaet-mne-bystro-vypolnyat-svoyu-rabotu',1,0,0,1560261006,0),(43,0,1,1,1,682,6,1,'novye-sposoby-zarabotka',1,0,1,1560855766,0),(44,43,29,1,1,683,4,1,'zarabotok-na-fajloobmennikah',1,0,0,1560855650,0),(45,43,29,1,1,684,3,1,'zarabotok-v-internete-na-svoem-sajte',1,0,0,1560855694,0),(46,43,29,1,1,685,2,1,'zarabotok-na-bukmekerskih-kontorah',1,0,0,1560855725,0);
/*!40000 ALTER TABLE `cms3_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_hierarchy_relations`
--

DROP TABLE IF EXISTS `cms3_hierarchy_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_hierarchy_relations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int unsigned DEFAULT NULL,
  `child_id` int unsigned DEFAULT NULL,
  `level` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `child_id` (`child_id`),
  KEY `level` (`level`),
  CONSTRAINT `Hierarchy relation by child_id` FOREIGN KEY (`child_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Hierarchy relation by rel_id` FOREIGN KEY (`rel_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_hierarchy_relations`
--

LOCK TABLES `cms3_hierarchy_relations` WRITE;
/*!40000 ALTER TABLE `cms3_hierarchy_relations` DISABLE KEYS */;
INSERT INTO `cms3_hierarchy_relations` VALUES (1,NULL,1,0),(2,NULL,2,0),(3,NULL,3,0),(4,NULL,4,0),(5,NULL,5,0),(6,NULL,6,1),(7,4,6,1),(8,NULL,7,1),(9,4,7,1),(10,NULL,8,1),(11,4,8,1),(30,NULL,26,1),(31,3,26,1),(32,NULL,27,1),(33,3,27,1),(34,NULL,28,1),(35,3,28,1),(36,NULL,29,1),(37,3,29,1),(38,NULL,30,1),(39,3,30,1),(40,NULL,31,1),(41,3,31,1),(42,NULL,32,1),(43,3,32,1),(44,NULL,33,1),(45,3,33,1),(46,NULL,34,1),(47,3,34,1),(48,NULL,35,1),(49,3,35,1),(84,NULL,43,0),(85,NULL,44,1),(86,43,44,1),(87,NULL,45,1),(88,43,45,1),(89,NULL,46,1),(90,43,46,1);
/*!40000 ALTER TABLE `cms3_hierarchy_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_hierarchy_types`
--

DROP TABLE IF EXISTS `cms3_hierarchy_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_hierarchy_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ext` varchar(48) DEFAULT NULL,
  `hide_pages` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`ext`),
  KEY `title` (`title`),
  KEY `ext` (`ext`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_hierarchy_types`
--

LOCK TABLES `cms3_hierarchy_types` WRITE;
/*!40000 ALTER TABLE `cms3_hierarchy_types` DISABLE KEYS */;
INSERT INTO `cms3_hierarchy_types` VALUES (1,'news','i18n::hierarchy-type-news-rubric','rubric',0),(2,'emarket','i18n::hierarchy-type-emarket-currency','currency',0),(3,'emarket','i18n::hierarchy-type-emarket-discount_type','discount_type',0),(4,'emarket','i18n::hierarchy-type-emarket-discount_modificator_type','discount_modificator_type',0),(5,'emarket','i18n::hierarchy-type-emarket-discount_rule_type','discount_rule_type',0),(6,'social_networks','i18n::hierarchy-type-social_networks-networks','network',0),(7,'social_networks','i18n::hierarchy-type-social_networks-vkontakte','vkontakte',0),(8,'users','i18n::hierarchy-type-users-users','users',0),(9,'emarket','i18n::hierarchy-type-eshop-address','delivery_address',0),(10,'emarket','i18n::hierarchy-type-emarket-item_type','item_type',0),(11,'emarket','i18n::hierarchy-type-emarket-discount','discount',0),(12,'emarket','i18n::hierarchy-type-emarket-item_option','item_option',0),(13,'emarket','i18n::hierarchy-type-emarket-order_item','order_item',0),(14,'emarket','i18n::hierarchy-type-emarket-order_status','order_status',0),(15,'emarket','i18n::hierarchy-type-emarket-payment_type','payment_type',0),(16,'emarket','i18n::hierarchy-type-emarket-payment','payment',0),(17,'emarket','i18n::hierarchy-type-emarket-payment_status','order_payment_status',0),(18,'emarket','i18n::hierarchy-type-emarket-legal_person','legal_person',0),(19,'emarket','i18n::hierarchy-type-emarket-delivery_type','delivery_type',0),(20,'emarket','i18n::hierarchy-type-emarket-delivery','delivery',0),(21,'emarket','i18n::hierarchy-type-emarket-delivery_status','order_delivery_status',0),(22,'emarket','i18n::hierarchy-type-emarket-order','order',0),(23,'users','i18n::hierarchy-type-users-user','user',0),(24,'emarket','i18n::hierarchy-type-emarket-store','store',0),(25,'emarket','i18n::hierarchy-type-emarket-discount_modificator','discount_modificator',0),(26,'emarket','i18n::hierarchy-type-emarket-discount_rule','discount_rule',0),(27,'menu','i18n::hierarchy-type-menu-item_element','item_element',0),(28,'news','i18n::hierarchy-type-news-subject','subject',0),(29,'news','i18n::hierarchy-type-news-item','item',0),(30,'content','i18n::hierarchy-type-content-page','',0),(31,'content','i18n::hierarchy-type-content-ticket','ticket',0),(32,'blogs20','i18n::hierarchy-type-blogs-blog','blog',0),(33,'users','i18n::hierarchy-type-users-author','author',0),(34,'blogs20','i18n::hierarchy-type-blogs20-comment','comment',0),(35,'blogs20','i18n::hierarchy-type-blogs20-post','post',0),(36,'forum','i18n::hierarchy-type-forum-conf','conf',0),(37,'forum','i18n::hierarchy-type-forum-topic','topic',0),(38,'forum','i18n::hierarchy-type-forum-message','message',0),(39,'comments','i18n::hierarchy-type-comments-comment','comment',0),(40,'vote','i18n::hierarchy-type-vote-poll_item','poll_item',0),(41,'vote','i18n::hierarchy-type-vote-poll','poll',0),(42,'webforms','i18n::hierarchy-type-webforms-page','page',0),(43,'webforms','i18n::hierarchy-type-webforms-form','form',0),(44,'webforms','i18n::hierarchy-type-webforms-template','template',0),(45,'webforms','i18n::hierarchy-type-webforms-address','address',0),(46,'photoalbum','i18n::hierarchy-type-photoalbum-album','album',0),(47,'photoalbum','i18n::hierarchy-type-photoalbum-photo','photo',0),(48,'faq','i18n::hierarchy-type-faq-project','project',0),(49,'faq','i18n::hierarchy-type-faq-category','category',0),(50,'faq','i18n::hierarchy-type-faq-question','question',0),(51,'dispatches','i18n::hierarchy-type-dispatches-dispatch','dispatch',0),(52,'dispatches','i18n::hierarchy-type-dispatches-release','release',0),(53,'dispatches','i18n::hierarchy-type-dispatches-message','message',0),(54,'dispatches','i18n::hierarchy-type-dispatches-subscriber','subscriber',0),(55,'catalog','i18n::hierarchy-type-catalog-category','category',0),(56,'catalog','i18n::hierarchy-type-catalog-object','object',0),(57,'emarket','i18n::hierarchy-type-emarket-unregistered_customer','customer',0),(58,'banners','i18n::hierarchy-type-banners-place','place',0),(59,'banners','i18n::hierarchy-type-banners-banner','banner',0),(60,'users','i18n::hierarchy-type-users-avatar','avatar',0),(61,'exchange','i18n::hierarchy-type-exchange-data_exchange_export','export',0),(62,'exchange','i18n::hierarchy-type-exchange-data_exchange_import','import',0),(63,'filemanager','i18n::hierarchy-type-filemanager-shared_file','shared_file',0),(64,'umiSettings','i18n::hierarchy-type-umiSettings-setting','settings',0),(65,'umiStub','i18n::hierarchy-type-umiStub-ip-blacklist','ip-blacklist',0),(66,'umiStub','i18n::hierarchy-type-umiStub-ip-whitelist','ip-whitelist',0),(67,'appointment','i18n::hierarchy-type-appointment-page','page',0),(68,'seo','i18n::hierarchy-type-seo-robots-txt','robots-txt',0);
/*!40000 ALTER TABLE `cms3_hierarchy_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_apiship_orders`
--

DROP TABLE IF EXISTS `cms3_import_apiship_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_apiship_orders` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_apiship_orders_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_apiship_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_apiship_orders_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_apiship_orders`
--

LOCK TABLES `cms3_import_apiship_orders` WRITE;
/*!40000 ALTER TABLE `cms3_import_apiship_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_apiship_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_employee_schedule`
--

DROP TABLE IF EXISTS `cms3_import_appointment_employee_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_appointment_employee_schedule` (
  `external_id` int NOT NULL,
  `internal_id` int NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_employee_schedule_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_employee_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_employee_schedule_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_employee_schedule`
--

LOCK TABLES `cms3_import_appointment_employee_schedule` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_employee_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_employee_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_employees`
--

DROP TABLE IF EXISTS `cms3_import_appointment_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_appointment_employees` (
  `external_id` int NOT NULL,
  `internal_id` int NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_employees_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_employees_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_employees`
--

LOCK TABLES `cms3_import_appointment_employees` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_employees_services`
--

DROP TABLE IF EXISTS `cms3_import_appointment_employees_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_appointment_employees_services` (
  `external_id` int NOT NULL,
  `internal_id` int NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_employees_services_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_employees_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_employees_services_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_employees_services`
--

LOCK TABLES `cms3_import_appointment_employees_services` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_employees_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_employees_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_orders`
--

DROP TABLE IF EXISTS `cms3_import_appointment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_appointment_orders` (
  `external_id` int NOT NULL,
  `internal_id` int NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_orders_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_orders_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_orders`
--

LOCK TABLES `cms3_import_appointment_orders` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_service_groups`
--

DROP TABLE IF EXISTS `cms3_import_appointment_service_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_appointment_service_groups` (
  `external_id` int NOT NULL,
  `internal_id` int NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_service_groups_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_service_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_service_groups_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_service_groups`
--

LOCK TABLES `cms3_import_appointment_service_groups` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_service_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_service_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_appointment_services`
--

DROP TABLE IF EXISTS `cms3_import_appointment_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_appointment_services` (
  `external_id` int NOT NULL,
  `internal_id` int NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_appointment_services_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_appointment_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_appointment_services_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_appointment_services`
--

LOCK TABLES `cms3_import_appointment_services` WRITE;
/*!40000 ALTER TABLE `cms3_import_appointment_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_appointment_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_domain_mirrors`
--

DROP TABLE IF EXISTS `cms3_import_domain_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_domain_mirrors` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_DomainMirrorSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_DomainMirrorId` FOREIGN KEY (`new_id`) REFERENCES `cms3_domain_mirrows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_domain_mirrors`
--

LOCK TABLES `cms3_import_domain_mirrors` WRITE;
/*!40000 ALTER TABLE `cms3_import_domain_mirrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_domain_mirrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_domains`
--

DROP TABLE IF EXISTS `cms3_import_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_domains` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_DomainSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_DomainId` FOREIGN KEY (`new_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_domains`
--

LOCK TABLES `cms3_import_domains` WRITE;
/*!40000 ALTER TABLE `cms3_import_domains` DISABLE KEYS */;
INSERT INTO `cms3_import_domains` VALUES (1,'1',1),(2,'1',1);
/*!40000 ALTER TABLE `cms3_import_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_fields`
--

DROP TABLE IF EXISTS `cms3_import_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_fields` (
  `source_id` int unsigned NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `type_id` int unsigned NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`),
  KEY `type_id` (`type_id`),
  KEY `field_name` (`field_name`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_FieldSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewFieldId_To_ObjectTypeId` FOREIGN KEY (`type_id`) REFERENCES `cms3_import_types` (`new_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_ObjectTypeFieldId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_fields`
--

LOCK TABLES `cms3_import_fields` WRITE;
/*!40000 ALTER TABLE `cms3_import_fields` DISABLE KEYS */;
INSERT INTO `cms3_import_fields` VALUES (1,'publish_status_id',2,1),(1,'title',3,2),(1,'h1',3,3),(1,'content',3,4),(1,'meta_descriptions',3,5),(1,'meta_keywords',3,6),(1,'tags',3,7),(1,'robots_deny',3,11),(1,'show_submenu',3,12),(1,'is_expanded',3,13),(1,'is_unindexed',3,14),(1,'rate_voters',3,15),(1,'rate_sum',3,16),(1,'expiration_date',3,17),(1,'notification_date',3,18),(1,'publish_comments',3,19),(1,'publish_status',3,20),(1,'locktime',3,21),(1,'lockuser',3,22),(1,'charset',6,23),(1,'title',7,2),(1,'h1',7,3),(1,'meta_keywords',7,6),(1,'meta_descriptions',7,5),(1,'tags',7,7),(1,'readme',7,24),(1,'robots_deny',7,11),(1,'show_submenu',7,12),(1,'is_expanded',7,13),(1,'is_unindexed',7,14),(1,'rate_voters',7,15),(1,'rate_sum',7,16),(1,'expiration_date',7,17),(1,'notification_date',7,18),(1,'publish_comments',7,19),(1,'publish_status',7,20),(1,'locktime',7,21),(1,'lockuser',7,22),(1,'rss_type',8,25),(1,'url',8,26),(1,'charset_id',8,27),(1,'news_rubric',8,28),(1,'quality_value',9,29),(1,'country_iso_code',10,30),(1,'identifier',14,31),(1,'identifier',15,31),(1,'number',16,32),(1,'number',17,32),(1,'codename',21,35),(1,'nominal',21,36),(1,'rate',21,37),(1,'prefix',21,38),(1,'suffix',21,39),(1,'platform_identificator',23,41),(1,'active',24,42),(1,'domain_id',24,43),(1,'token',24,44),(1,'platform',24,45),(1,'lname',25,46),(1,'fname',25,47),(1,'father_name',25,48),(1,'email',25,49),(1,'phone',25,50),(1,'yandex_id',27,51),(1,'payonline_id',27,52),(1,'robokassa_id',27,53),(1,'payanyway_id',27,54),(1,'sberbank_id',27,55),(1,'tax',27,56),(1,'yandex_id',28,57),(1,'robokassa_id',28,53),(1,'payanyway_id',28,58),(1,'payonline_id',28,59),(1,'sberbank_id',28,55),(1,'yandex_id',29,57),(1,'robokassa_id',29,53),(1,'payanyway_id',29,58),(1,'payonline_id',29,59),(1,'sberbank_id',29,55),(1,'codename',30,34),(1,'description',30,60),(1,'modificator_codename',31,61),(1,'modificator_type_id',31,62),(1,'modificator_discount_types',31,63),(1,'modificator_type_guid',31,64),(1,'modificator_type_id',32,65),(1,'rule_codename',33,66),(1,'rule_type_id',33,67),(1,'rule_discount_types',33,68),(1,'rule_type_guid',33,69),(1,'rule_type_id',34,70),(1,'sid',35,71),(1,'sid',36,72),(1,'social_id',37,73),(1,'template_id',37,74),(1,'domain_id',37,75),(1,'nazvanie_sajta',38,76),(1,'is_iframe_enabled',38,77),(1,'iframe_pages',38,78),(1,'social_id',38,73),(1,'template_id',38,74),(1,'domain_id',38,75),(1,'nazvanie',39,79),(1,'country',40,80),(1,'index',40,81),(1,'region',40,82),(1,'city',40,83),(1,'street',40,84),(1,'house',40,85),(1,'flat',40,86),(1,'class_name',41,87),(1,'discount_type_id',42,88),(1,'discount_modificator_id',42,89),(1,'discount_rules_id',42,90),(1,'is_active',42,91),(1,'description',42,92),(1,'item_amount',44,93),(1,'item_price',44,94),(1,'item_total_original_price',44,95),(1,'item_actual_price',44,96),(1,'item_total_price',44,97),(1,'item_type_id',44,98),(1,'item_link',44,99),(1,'item_discount_id',44,100),(1,'item_discount_value',44,101),(1,'weight',44,102),(1,'width',44,103),(1,'height',44,104),(1,'length',44,105),(1,'tax_rate_id',44,106),(1,'payment_mode',44,107),(1,'payment_subject',44,108),(1,'options',44,109),(1,'trade_offer',44,110),(1,'codename',45,40),(1,'priority',45,111),(1,'class_name',46,112),(1,'payment_type_id',46,113),(1,'payment_type_guid',46,114),(1,'payment_type_id',47,115),(1,'disabled',47,116),(1,'domain_id_list',47,117),(1,'codename',48,40),(1,'priority',48,111),(1,'contact_person',49,118),(1,'phone_number',49,119),(1,'fax',49,120),(1,'email',49,49),(1,'name',49,121),(1,'legal_address',49,122),(1,'defacto_address',49,123),(1,'post_address',49,124),(1,'inn',49,125),(1,'account',49,126),(1,'bank',49,127),(1,'bank_account',49,128),(1,'bik',49,129),(1,'ogrn',49,130),(1,'kpp',49,131),(1,'class_name',50,132),(1,'delivery_type_id',50,133),(1,'delivery_type_guid',50,134),(1,'description',51,135),(1,'delivery_type_id',51,136),(1,'price',51,137),(1,'tax_rate_id',51,138),(1,'disabled',51,139),(1,'domain_id_list',51,140),(1,'payment_mode',51,141),(1,'payment_subject',51,142),(1,'disabled_types_of_payment',51,143),(1,'codename',52,40),(1,'priority',52,111),(1,'order_items',53,144),(1,'number',53,145),(1,'social_order_id',53,146),(1,'customer_id',53,148),(1,'domain_id',53,149),(1,'manager_id',53,150),(1,'status_id',53,151),(1,'total_original_price',53,152),(1,'total_price',53,153),(1,'total_amount',53,154),(1,'status_change_date',53,155),(1,'order_date',53,156),(1,'order_discount_value',53,157),(1,'is_reserved',53,158),(1,'service_info',53,159),(1,'order_comment',53,160),(1,'http_referer',53,168),(1,'http_target',53,169),(1,'source_domain',53,170),(1,'utm_medium',53,171),(1,'utm_term',53,172),(1,'utm_campaign',53,173),(1,'utm_content',53,174),(1,'order_create_date',53,175),(1,'payment_id',53,176),(1,'payment_name',53,177),(1,'payment_status_id',53,178),(1,'payment_date',53,179),(1,'payment_document_num',53,180),(1,'legal_person',53,181),(1,'delivery_id',53,182),(1,'delivery_name',53,183),(1,'delivery_status_id',53,184),(1,'delivery_address',53,185),(1,'delivery_date',53,186),(1,'pickup_date',53,187),(1,'delivery_provider',53,188),(1,'delivery_tariff',53,189),(1,'delivery_type',53,190),(1,'pickup_type',53,191),(1,'delivery_price',53,192),(1,'delivery_point_in',53,193),(1,'delivery_point_out',53,194),(1,'total_weight',53,195),(1,'total_width',53,196),(1,'total_height',53,197),(1,'total_length',53,198),(1,'delivery_allow_date',53,199),(1,'order_discount_id',53,200),(1,'bonus',53,201),(1,'need_export',53,202),(1,'purchaser_one_click',53,203),(1,'login',54,204),(1,'password',54,205),(1,'groups',54,206),(1,'e-mail',54,207),(1,'activate_code',54,208),(1,'loginza',54,209),(1,'is_activated',54,210),(1,'last_request_time',54,211),(1,'subscribed_pages',54,212),(1,'rated_pages',54,213),(1,'is_online',54,214),(1,'messages_count',54,215),(1,'orders_refs',54,216),(1,'delivery_addresses',54,217),(1,'user_dock',54,218),(1,'preffered_currency',54,219),(1,'user_settings_data',54,220),(1,'last_order',54,221),(1,'bonus',54,222),(1,'legal_persons',54,223),(1,'spent_bonus',54,224),(1,'filemanager_directory',54,225),(1,'appended_file_extensions',54,226),(1,'register_date',54,227),(1,'tickets_color',54,228),(1,'favorite_domain_list',54,229),(1,'lname',54,230),(1,'fname',54,231),(1,'father_name',54,232),(1,'phone',54,233),(1,'referer',54,234),(1,'target',54,235),(1,'primary',55,236),(1,'proc',56,237),(1,'modificator_type_id',56,65),(1,'rule_type_id',57,70),(1,'users',57,238),(1,'menu_id',58,239),(1,'menuhierarchy',58,240),(1,'title',60,2),(1,'h1',60,3),(1,'meta_keywords',60,6),(1,'meta_descriptions',60,5),(1,'tags',60,7),(1,'anons',60,241),(1,'content',60,4),(1,'source',60,242),(1,'source_url',60,243),(1,'publish_time',60,244),(1,'begin_time',60,245),(1,'end_time',60,246),(1,'robots_deny',60,11),(1,'show_submenu',60,12),(1,'is_expanded',60,13),(1,'is_unindexed',60,14),(1,'anons_pic',60,247),(1,'publish_pic',60,248),(1,'subjects',60,249),(1,'rate_voters',60,15),(1,'rate_sum',60,16),(1,'expiration_date',60,17),(1,'notification_date',60,18),(1,'publish_comments',60,19),(1,'publish_status',60,20),(1,'locktime',60,21),(1,'lockuser',60,22),(1,'title',61,2),(1,'h1',61,3),(1,'meta_keywords',61,6),(1,'meta_descriptions',61,5),(1,'tags',61,7),(1,'content',61,4),(1,'robots_deny',61,11),(1,'show_submenu',61,12),(1,'is_expanded',61,13),(1,'is_unindexed',61,14),(1,'rate_voters',61,15),(1,'rate_sum',61,16),(1,'expiration_date',61,17),(1,'notification_date',61,18),(1,'publish_comments',61,19),(1,'publish_status',61,20),(1,'locktime',61,21),(1,'lockuser',61,22),(1,'user_id',62,250),(1,'message',62,251),(1,'x',62,252),(1,'y',62,253),(1,'width',62,254),(1,'height',62,255),(1,'url',62,256),(1,'create_time',62,257),(1,'title',63,2),(1,'h1',63,3),(1,'description',63,258),(1,'meta_descriptions',63,5),(1,'meta_keywords',63,6),(1,'tags',63,7),(1,'friendlist',63,259),(1,'robots_deny',63,11),(1,'show_submenu',63,12),(1,'is_expanded',63,13),(1,'is_unindexed',63,14),(1,'rate_voters',63,15),(1,'rate_sum',63,16),(1,'is_registrated',64,260),(1,'user_id',64,261),(1,'nickname',64,262),(1,'email',64,263),(1,'ip',64,264),(1,'content',65,4),(1,'author_id',65,265),(1,'publish_time',65,244),(1,'rate_voters',65,15),(1,'rate_sum',65,16),(1,'is_spam',65,266),(1,'title',66,2),(1,'h1',66,3),(1,'content',66,4),(1,'meta_descriptions',66,5),(1,'meta_keywords',66,6),(1,'tags',66,7),(1,'publish_time',66,244),(1,'robots_deny',66,11),(1,'show_submenu',66,12),(1,'is_expanded',66,13),(1,'is_unindexed',66,14),(1,'rate_voters',66,15),(1,'rate_sum',66,16),(1,'expiration_date',66,17),(1,'notification_date',66,18),(1,'publish_comments',66,19),(1,'publish_status',66,20),(1,'locktime',66,21),(1,'lockuser',66,22),(1,'only_for_friends',66,267),(1,'is_spam',66,266),(1,'title',67,2),(1,'h1',67,3),(1,'meta_keywords',67,6),(1,'meta_descriptions',67,5),(1,'tags',67,7),(1,'descr',67,268),(1,'topics_count',67,269),(1,'messages_count',67,270),(1,'last_message',67,271),(1,'robots_deny',67,11),(1,'show_submenu',67,12),(1,'is_expanded',67,13),(1,'is_unindexed',67,14),(1,'rate_voters',67,15),(1,'rate_sum',67,16),(1,'expiration_date',67,17),(1,'notification_date',67,18),(1,'publish_comments',67,19),(1,'publish_status',67,20),(1,'locktime',67,21),(1,'lockuser',67,22),(1,'title',68,2),(1,'h1',68,3),(1,'meta_keywords',68,6),(1,'tags',68,7),(1,'meta_descriptions',68,5),(1,'messages_count',68,270),(1,'last_message',68,271),(1,'robots_deny',68,11),(1,'show_submenu',68,12),(1,'is_expanded',68,13),(1,'is_unindexed',68,14),(1,'publish_time',68,244),(1,'author_id',68,265),(1,'last_post_time',68,272),(1,'rate_voters',68,15),(1,'rate_sum',68,16),(1,'expiration_date',68,17),(1,'notification_date',68,18),(1,'publish_comments',68,19),(1,'publish_status',68,20),(1,'locktime',68,21),(1,'lockuser',68,22),(1,'title',69,2),(1,'h1',69,3),(1,'meta_keywords',69,6),(1,'meta_descriptions',69,5),(1,'tags',69,7),(1,'robots_deny',69,11),(1,'show_submenu',69,12),(1,'is_expanded',69,13),(1,'is_unindexed',69,14),(1,'message',69,273),(1,'author_id',69,265),(1,'rate_voters',69,15),(1,'rate_sum',69,16),(1,'expiration_date',69,17),(1,'notification_date',69,18),(1,'publish_comments',69,19),(1,'publish_status',69,20),(1,'locktime',69,21),(1,'lockuser',69,22),(1,'title',70,2),(1,'h1',70,3),(1,'meta_keywords',70,6),(1,'meta_descriptions',70,5),(1,'tags',70,7),(1,'robots_deny',70,11),(1,'show_submenu',70,12),(1,'is_expanded',70,13),(1,'is_unindexed',70,14),(1,'message',70,273),(1,'publish_time',70,244),(1,'author_id',70,265),(1,'rate_voters',70,15),(1,'rate_sum',70,16),(1,'expiration_date',70,17),(1,'notification_date',70,18),(1,'publish_comments',70,19),(1,'publish_status',70,20),(1,'locktime',70,21),(1,'lockuser',70,22),(1,'is_spam',70,266),(1,'count',71,274),(1,'poll_rel',71,275),(1,'title',72,2),(1,'h1',72,3),(1,'meta_keywords',72,6),(1,'meta_descriptions',72,5),(1,'tags',72,7),(1,'robots_deny',72,11),(1,'show_submenu',72,12),(1,'is_expanded',72,13),(1,'is_unindexed',72,14),(1,'is_closed',72,276),(1,'question',72,277),(1,'publish_time',72,244),(1,'answers',72,278),(1,'total_count',72,279),(1,'rate_voters',72,15),(1,'rate_sum',72,16),(1,'expiration_date',72,17),(1,'notification_date',72,18),(1,'publish_comments',72,19),(1,'publish_status',72,20),(1,'locktime',72,21),(1,'lockuser',72,22),(1,'title',73,2),(1,'h1',73,3),(1,'content',73,4),(1,'meta_descriptions',73,5),(1,'meta_keywords',73,6),(1,'tags',73,7),(1,'robots_deny',73,11),(1,'show_submenu',73,12),(1,'is_expanded',73,13),(1,'is_unindexed',73,14),(1,'rate_voters',73,15),(1,'rate_sum',73,16),(1,'expiration_date',73,17),(1,'notification_date',73,18),(1,'publish_comments',73,19),(1,'publish_status',73,20),(1,'locktime',73,21),(1,'lockuser',73,22),(1,'form_id',73,280),(1,'destination_address',74,281),(1,'sender_ip',74,282),(1,'sending_time',74,283),(1,'wf_message',74,284),(1,'from_email_template',75,285),(1,'from_template',75,286),(1,'subject_template',75,287),(1,'master_template',75,288),(1,'autoreply_from_email_template',75,289),(1,'autoreply_from_template',75,290),(1,'autoreply_subject_template',75,291),(1,'autoreply_email_recipient',75,292),(1,'autoreply_template',75,293),(1,'posted_message',75,294),(1,'form_id',75,295),(1,'address_description',76,296),(1,'address_list',76,297),(1,'form_id',76,298),(1,'title',77,2),(1,'h1',77,3),(1,'meta_descriptions',77,5),(1,'meta_keywords',77,6),(1,'tags',77,7),(1,'robots_deny',77,11),(1,'show_submenu',77,12),(1,'is_expanded',77,13),(1,'is_unindexed',77,14),(1,'descr',77,268),(1,'create_time',77,299),(1,'user_id',77,300),(1,'rate_voters',77,15),(1,'rate_sum',77,16),(1,'expiration_date',77,17),(1,'notification_date',77,18),(1,'publish_comments',77,19),(1,'publish_status',77,20),(1,'locktime',77,21),(1,'lockuser',77,22),(1,'title',78,2),(1,'h1',78,3),(1,'meta_descriptions',78,5),(1,'meta_keywords',78,6),(1,'tags',78,7),(1,'robots_deny',78,11),(1,'show_submenu',78,12),(1,'is_expanded',78,13),(1,'is_unindexed',78,14),(1,'photo',78,301),(1,'descr',78,268),(1,'create_time',78,299),(1,'user_id',78,300),(1,'rate_voters',78,15),(1,'rate_sum',78,16),(1,'expiration_date',78,17),(1,'notification_date',78,18),(1,'publish_comments',78,19),(1,'publish_status',78,20),(1,'locktime',78,21),(1,'lockuser',78,22),(1,'title',79,2),(1,'h1',79,3),(1,'content',79,4),(1,'meta_descriptions',79,5),(1,'meta_keywords',79,6),(1,'tags',79,7),(1,'robots_deny',79,11),(1,'show_submenu',79,12),(1,'is_expanded',79,13),(1,'is_unindexed',79,14),(1,'rate_voters',79,15),(1,'rate_sum',79,16),(1,'expiration_date',79,17),(1,'notification_date',79,18),(1,'publish_comments',79,19),(1,'publish_status',79,20),(1,'locktime',79,21),(1,'lockuser',79,22),(1,'title',80,2),(1,'h1',80,3),(1,'content',80,4),(1,'meta_descriptions',80,5),(1,'meta_keywords',80,6),(1,'tags',80,7),(1,'robots_deny',80,11),(1,'show_submenu',80,12),(1,'is_expanded',80,13),(1,'is_unindexed',80,14),(1,'rate_voters',80,15),(1,'rate_sum',80,16),(1,'expiration_date',80,17),(1,'notification_date',80,18),(1,'publish_comments',80,19),(1,'publish_status',80,20),(1,'locktime',80,21),(1,'lockuser',80,22),(1,'title',81,2),(1,'h1',81,3),(1,'meta_descriptions',81,5),(1,'meta_keywords',81,6),(1,'tags',81,7),(1,'question',81,277),(1,'answer',81,302),(1,'author_id',81,265),(1,'publish_time',81,244),(1,'robots_deny',81,11),(1,'show_submenu',81,12),(1,'is_expanded',81,13),(1,'is_unindexed',81,14),(1,'expiration_date',81,17),(1,'notification_date',81,18),(1,'publish_comments',81,19),(1,'publish_status',81,20),(1,'locktime',81,21),(1,'lockuser',81,22),(1,'is_spam',81,266),(1,'disp_last_release',82,303),(1,'disp_description',82,304),(1,'forced_subscribers',82,305),(1,'news_relation',82,306),(1,'is_active',82,307),(1,'load_from_forum',82,308),(1,'days',82,309),(1,'hours',82,310),(1,'status',83,311),(1,'date',83,312),(1,'disp_reference',83,313),(1,'header',84,314),(1,'body',84,315),(1,'release_reference',84,316),(1,'attach_file',84,317),(1,'msg_date',84,318),(1,'short_body',84,319),(1,'new_relation',84,320),(1,'lname',85,321),(1,'fname',85,322),(1,'father_name',85,323),(1,'gender',85,324),(1,'uid',85,325),(1,'subscriber_dispatches',85,326),(1,'sent_release_list',85,327),(1,'subscribe_date',85,328),(1,'title',86,2),(1,'h1',86,3),(1,'meta_keywords',86,6),(1,'meta_descriptions',86,5),(1,'tags',86,7),(1,'robots_deny',86,11),(1,'show_submenu',86,12),(1,'is_expanded',86,13),(1,'is_unindexed',86,14),(1,'descr',86,268),(1,'rate_voters',86,15),(1,'rate_sum',86,16),(1,'expiration_date',86,17),(1,'notification_date',86,18),(1,'publish_comments',86,19),(1,'publish_status',86,20),(1,'locktime',86,21),(1,'lockuser',86,22),(1,'index_source',86,330),(1,'index_state',86,331),(1,'index_date',86,332),(1,'index_choose',86,333),(1,'index_level',86,334),(1,'title',87,2),(1,'h1',87,3),(1,'meta_keywords',87,6),(1,'meta_descriptions',87,5),(1,'tags',87,7),(1,'date_create_object',87,335),(1,'robots_deny',87,11),(1,'is_unindexed',87,14),(1,'tax_rate_id',87,336),(1,'price',87,337),(1,'payment_mode',87,338),(1,'payment_subject',87,339),(1,'stores_state',87,340),(1,'reserved',87,341),(1,'common_quantity',87,342),(1,'trade_offer_image',87,343),(1,'trade_offer_list',87,344),(1,'rate_voters',87,15),(1,'rate_sum',87,16),(1,'expiration_date',87,17),(1,'notification_date',87,18),(1,'publish_comments',87,19),(1,'publish_status',87,20),(1,'locktime',87,21),(1,'lockuser',87,22),(1,'fname',88,47),(1,'lname',88,46),(1,'father_name',88,48),(1,'preffered_currency',88,345),(1,'last_order',88,346),(1,'bonus',88,347),(1,'spent_bonus',88,348),(1,'email',88,49),(1,'phone',88,50),(1,'ip',88,349),(1,'delivery_addresses',88,350),(1,'legal_persons',88,351),(1,'modificator_type_id',89,65),(1,'size',89,352),(1,'rule_type_id',90,70),(1,'catalog_items',90,353),(1,'rule_type_id',91,70),(1,'start_date',91,354),(1,'end_date',91,355),(1,'rule_type_id',92,70),(1,'minimum',92,356),(1,'maximum',92,357),(1,'rule_type_id',93,70),(1,'minimal',93,358),(1,'maximum',93,359),(1,'rule_type_id',94,70),(1,'user_groups',94,360),(1,'rule_type_id',95,70),(1,'related_items',95,361),(1,'description',96,135),(1,'delivery_type_id',96,136),(1,'price',96,137),(1,'tax_rate_id',96,138),(1,'disabled',96,139),(1,'domain_id_list',96,140),(1,'payment_mode',96,141),(1,'payment_subject',96,142),(1,'disabled_types_of_payment',96,143),(1,'description',97,135),(1,'delivery_type_id',97,136),(1,'tax_rate_id',97,138),(1,'disabled',97,139),(1,'domain_id_list',97,140),(1,'payment_mode',97,141),(1,'payment_subject',97,142),(1,'disabled_types_of_payment',97,143),(1,'order_min_price',97,362),(1,'price',97,137),(1,'description',98,135),(1,'delivery_type_id',98,136),(1,'tax_rate_id',98,138),(1,'disabled',98,139),(1,'domain_id_list',98,140),(1,'payment_mode',98,141),(1,'payment_subject',98,142),(1,'disabled_types_of_payment',98,143),(1,'viewpost',98,363),(1,'zip_code',98,364),(1,'description',99,135),(1,'delivery_type_id',99,136),(1,'tax_rate_id',99,138),(1,'payment_mode',99,141),(1,'payment_subject',99,142),(1,'disabled_types_of_payment',99,143),(1,'login',99,365),(1,'password',99,366),(1,'dev_mode',99,367),(1,'keep_log',99,368),(1,'providers',99,369),(1,'delivery_types',99,370),(1,'pickup_types',99,371),(1,'settings',99,372),(1,'disabled',99,139),(1,'domain_id_list',99,140),(1,'payment_type_id',100,115),(1,'disabled',100,116),(1,'domain_id_list',100,117),(1,'reciever',100,373),(1,'reciever_inn',100,374),(1,'reciever_account',100,375),(1,'reciever_bank',100,376),(1,'bik',100,377),(1,'reciever_bank_account',100,378),(1,'payment_type_id',101,115),(1,'disabled',101,116),(1,'domain_id_list',101,117),(1,'merchant_id',101,379),(1,'private_key',101,380),(1,'receipt_data_send_enable',101,381),(1,'keep_log',101,382),(1,'payment_type_id',102,115),(1,'disabled',102,116),(1,'domain_id_list',102,117),(1,'payment_type_id',103,115),(1,'disabled',103,116),(1,'domain_id_list',103,117),(1,'login',103,383),(1,'password1',103,384),(1,'password2',103,385),(1,'test_mode',103,386),(1,'receipt_data_send_enable',103,381),(1,'payment_type_id',105,115),(1,'disabled',105,116),(1,'domain_id_list',105,117),(1,'name',105,389),(1,'legal_address',105,390),(1,'phone_number',105,391),(1,'inn',105,392),(1,'kpp',105,393),(1,'account',105,394),(1,'bank',105,395),(1,'bank_account',105,396),(1,'bik',105,377),(1,'sign_image',105,397),(1,'payment_type_id',106,115),(1,'disabled',106,116),(1,'domain_id_list',106,117),(1,'mnt_system_url',106,398),(1,'mnt_id',106,399),(1,'mnt_success_url',106,400),(1,'mnt_fail_url',106,401),(1,'mnt_data_integrity_code',106,402),(1,'mnt_test_mode',106,403),(1,'receipt_data_send_enable',106,381),(1,'payment_type_id',107,115),(1,'disabled',107,116),(1,'domain_id_list',107,117),(1,'project',107,404),(1,'key',107,405),(1,'source',107,406),(1,'payment_type_id',111,115),(1,'disabled',111,116),(1,'domain_id_list',111,117),(1,'test_mode',111,386),(1,'paypalemail',111,419),(1,'return_success',111,420),(1,'cancel_return',111,421),(1,'payment_type_id',112,115),(1,'disabled',112,116),(1,'domain_id_list',112,117),(1,'shop_id',112,422),(1,'secret_key',112,423),(1,'receipt_data_send_enable',112,381),(1,'keep_log',112,382),(1,'id',113,424),(1,'descr',113,425),(1,'is_show_rand_banner',113,426),(1,'is_active',114,427),(1,'tags',114,428),(1,'url',114,429),(1,'open_in_new_window',114,430),(1,'views_count',114,431),(1,'clicks_count',114,432),(1,'max_views',114,433),(1,'show_start_date',114,434),(1,'show_till_date',114,435),(1,'user_tags',114,436),(1,'view_pages',114,437),(1,'place',114,438),(1,'not_view_pages',114,439),(1,'time_targeting_by_month_days',114,440),(1,'time_targeting_by_month',114,441),(1,'time_targeting_by_week_days',114,442),(1,'time_targeting_by_hours',114,443),(1,'time_targeting_is_active',114,444),(1,'city_targeting_city',114,445),(1,'city_targeting_is_active',114,446),(1,'priority',114,447),(1,'is_active',115,427),(1,'tags',115,428),(1,'image',115,448),(1,'width',115,449),(1,'height',115,450),(1,'alt',115,451),(1,'url',115,429),(1,'open_in_new_window',115,430),(1,'views_count',115,431),(1,'clicks_count',115,432),(1,'max_views',115,433),(1,'show_start_date',115,434),(1,'show_till_date',115,435),(1,'user_tags',115,436),(1,'view_pages',115,437),(1,'place',115,438),(1,'not_view_pages',115,439),(1,'time_targeting_by_month_days',115,440),(1,'time_targeting_by_month',115,441),(1,'time_targeting_by_week_days',115,442),(1,'time_targeting_by_hours',115,443),(1,'time_targeting_is_active',115,444),(1,'city_targeting_city',115,445),(1,'city_targeting_is_active',115,446),(1,'priority',115,447),(1,'is_active',116,427),(1,'tags',116,428),(1,'swf',116,452),(1,'width',116,449),(1,'height',116,450),(1,'swf_quality',116,453),(1,'url',116,429),(1,'open_in_new_window',116,430),(1,'views_count',116,431),(1,'clicks_count',116,432),(1,'max_views',116,433),(1,'show_start_date',116,434),(1,'show_till_date',116,435),(1,'user_tags',116,436),(1,'view_pages',116,437),(1,'place',116,438),(1,'not_view_pages',116,439),(1,'time_targeting_by_month_days',116,440),(1,'time_targeting_by_month',116,441),(1,'time_targeting_by_week_days',116,442),(1,'time_targeting_by_hours',116,443),(1,'time_targeting_is_active',116,444),(1,'city_targeting_city',116,445),(1,'city_targeting_is_active',116,446),(1,'priority',116,447),(1,'is_active',117,427),(1,'tags',117,428),(1,'html_content',117,454),(1,'url',117,429),(1,'open_in_new_window',117,430),(1,'views_count',117,431),(1,'clicks_count',117,432),(1,'max_views',117,433),(1,'show_start_date',117,434),(1,'show_till_date',117,435),(1,'user_tags',117,436),(1,'view_pages',117,437),(1,'place',117,438),(1,'not_view_pages',117,439),(1,'time_targeting_by_month_days',117,440),(1,'time_targeting_by_month',117,441),(1,'time_targeting_by_week_days',117,442),(1,'time_targeting_by_hours',117,443),(1,'time_targeting_is_active',117,444),(1,'city_targeting_city',117,445),(1,'city_targeting_is_active',117,446),(1,'priority',117,447),(1,'picture',118,455),(1,'is_hidden',118,456),(1,'format',119,457),(1,'elements',119,458),(1,'excluded_elements',119,459),(1,'cache_time',119,460),(1,'source_name',119,461),(1,'encoding_export',119,462),(1,'format',120,457),(1,'elements',120,458),(1,'excluded_elements',120,459),(1,'cache_time',120,460),(1,'source_name',120,461),(1,'channel_header',120,463),(1,'channel_description',120,464),(1,'channel_site',120,465),(1,'channel_item_limit',120,466),(1,'web_analytics_type',120,467),(1,'web_analytics_id',120,468),(1,'web_analytics_params',120,469),(1,'web_analytics_pixel_url',120,470),(1,'advertising_type',120,471),(1,'advertising_block_id',120,472),(1,'advertising_place_id',120,473),(1,'advertising_code',120,474),(1,'format',121,475),(1,'file',121,476),(1,'elements',121,477),(1,'encoding_import',121,478),(1,'source_name',121,479),(1,'title',122,2),(1,'h1',122,3),(1,'meta_descriptions',122,5),(1,'meta_keywords',122,6),(1,'tags',122,7),(1,'content',122,4),(1,'robots_deny',122,11),(1,'show_submenu',122,12),(1,'is_expanded',122,13),(1,'is_unindexed',122,14),(1,'fs_file',122,480),(1,'downloads_counter',122,481),(1,'rate_voters',122,15),(1,'rate_sum',122,16),(1,'expiration_date',122,17),(1,'notification_date',122,18),(1,'publish_comments',122,19),(1,'publish_status',122,20),(1,'locktime',122,21),(1,'lockuser',122,22),(1,'custom_id',123,482),(1,'lang_id',123,483),(1,'domain_id',123,484),(1,'domain_id',124,43),(1,'domain_id',125,43),(1,'title',126,2),(1,'h1',126,3),(1,'content',126,4),(1,'meta_descriptions',126,5),(1,'meta_keywords',126,6),(1,'tags',126,7),(1,'robots_deny',126,11),(1,'show_submenu',126,12),(1,'is_expanded',126,13),(1,'is_unindexed',126,14),(1,'rate_voters',126,15),(1,'rate_sum',126,16),(1,'expiration_date',126,17),(1,'notification_date',126,18),(1,'publish_comments',126,19),(1,'publish_status',126,20),(1,'locktime',126,21),(1,'lockuser',126,22),(1,'appoint_service_choice_title',126,485),(1,'appoint_hint_step_text',126,486),(1,'appoint_personal_step_title',126,487),(1,'appoint_personal_choice_title',126,488),(1,'appoint_dont_care_button',126,489),(1,'appoint_dont_care_hint',126,490),(1,'appoint_date_step_title',126,491),(1,'appoint_date_choice_title',126,492),(1,'appoint_confirm_step_title',126,493),(1,'appoint_book_time_button',126,494),(1,'appoint_book_time_hint',126,495),(1,'open_the_payment_result_waiting_page',112,527),(1,'domain_id',120,528),(1,'robots_txt',120,529),(1,'auth_token',54,530),(1,'social_uid',54,531),(1,'include_fees',99,532),(1,'yandex_map_api_key',99,533),(1,'keep_log',103,382),(1,'keep_log',106,382),(1,'keep_log',107,382),(1,'keep_log',111,382),(1,'disable_auto_capture',112,534),(1,'dengionline_id',27,535),(1,'dengionline_id',28,536),(1,'dengionline_id',29,536),(1,'domain_id_list',58,537),(1,'language_id_list',58,538),(1,'receipt_data_send_enable',107,381),(1,'price_type_id',44,539),(1,'promocode',131,540),(1,'rule_type_id',131,70),(1,'is_deactivated_by_manager',54,541),(1,'disabled_user_groups',47,542),(1,'disabled_user_groups',100,542),(1,'disabled_user_groups',101,542),(1,'disabled_user_groups',102,542),(1,'disabled_user_groups',103,542),(1,'disabled_user_groups',105,542),(1,'disabled_user_groups',106,542),(1,'disabled_user_groups',107,542),(1,'disabled_user_groups',111,542),(1,'disabled_user_groups',112,542),(1,'locktime',63,21),(1,'lockuser',63,22),(1,'locktime',65,21),(1,'lockuser',65,22),(1,'format',132,457),(1,'elements',132,458),(1,'excluded_elements',132,459),(1,'cache_time',132,460),(1,'source_name',132,461),(1,'channel_header',132,463),(1,'channel_description',132,464),(1,'channel_site',132,465),(1,'channel_item_limit',132,466),(1,'web_analytics_type',132,467),(1,'web_analytics_id',132,468),(1,'web_analytics_params',132,469),(1,'web_analytics_pixel_url',132,470),(1,'advertising_type',132,471),(1,'advertising_block_id',132,472),(1,'advertising_place_id',132,473),(1,'advertising_code',132,543),(2,'destination_address',74,281),(2,'sender_ip',74,282),(2,'sending_time',74,283),(2,'wf_message',74,284),(2,'destination_address',127,281),(2,'sender_ip',127,282),(2,'sending_time',127,283),(2,'wf_message',127,284),(2,'author',127,496),(2,'email',127,497),(2,'theme',127,498),(2,'message',127,499),(2,'custom_id',123,482),(2,'lang_id',123,483),(2,'domain_id',123,484),(2,'custom_id',128,482),(2,'lang_id',128,483),(2,'domain_id',128,484),(2,'name',128,500),(2,'position',128,503),(2,'description',128,504),(2,'image',128,501),(2,'image_link',128,505),(2,'user_css',128,502),(2,'copyright',128,506),(2,'footer_code',128,507),(2,'social_networks',128,508),(2,'link',129,509),(2,'css_class',129,510),(2,'404_header',128,512),(2,'404_content',128,513),(2,'sitemap_header',128,514),(2,'404_additional_content',128,517),(2,'search_page_header',128,515),(2,'search_page_additional_content',128,516),(2,'post_by_tag_header',128,519),(2,'post_by_tag_main_content',128,520),(2,'post_by_tag_additional_content',128,521),(2,'personal_data_policy_confirmation_text',128,522),(2,'title',3,2),(2,'h1',3,3),(2,'content',3,4),(2,'meta_descriptions',3,5),(2,'meta_keywords',3,6),(2,'tags',3,7),(2,'robots_deny',3,11),(2,'show_submenu',3,12),(2,'is_expanded',3,13),(2,'is_unindexed',3,14),(2,'rate_voters',3,15),(2,'rate_sum',3,16),(2,'expiration_date',3,17),(2,'notification_date',3,18),(2,'publish_comments',3,19),(2,'publish_status',3,20),(2,'publish_status_id',2,1),(2,'locktime',3,21),(2,'lockuser',3,22),(2,'additional_content',3,511),(2,'title',61,2),(2,'h1',61,3),(2,'meta_keywords',61,6),(2,'meta_descriptions',61,5),(2,'tags',61,7),(2,'content',61,4),(2,'robots_deny',61,11),(2,'show_submenu',61,12),(2,'is_expanded',61,13),(2,'is_unindexed',61,14),(2,'rate_voters',61,15),(2,'rate_sum',61,16),(2,'expiration_date',61,17),(2,'notification_date',61,18),(2,'publish_comments',61,19),(2,'publish_status',61,20),(2,'locktime',61,21),(2,'lockuser',61,22),(2,'additional_content',61,511),(2,'title',130,2),(2,'h1',130,3),(2,'meta_keywords',130,6),(2,'meta_descriptions',130,5),(2,'tags',130,7),(2,'content',130,4),(2,'robots_deny',130,11),(2,'show_submenu',130,12),(2,'is_expanded',130,13),(2,'is_unindexed',130,14),(2,'rate_voters',130,15),(2,'rate_sum',130,16),(2,'expiration_date',130,17),(2,'notification_date',130,18),(2,'publish_comments',130,19),(2,'publish_status',130,20),(2,'locktime',130,21),(2,'lockuser',130,22),(2,'first_text_block',130,523),(2,'photo_block_header',130,525),(2,'photo_block_source',130,524),(2,'photo_block_link_text',130,526),(2,'additional_content',130,511),(2,'title',77,2),(2,'h1',77,3),(2,'meta_descriptions',77,5),(2,'meta_keywords',77,6),(2,'tags',77,7),(2,'robots_deny',77,11),(2,'show_submenu',77,12),(2,'is_expanded',77,13),(2,'is_unindexed',77,14),(2,'descr',77,268),(2,'create_time',77,299),(2,'user_id',77,300),(2,'login',54,204),(2,'password',54,205),(2,'groups',54,206),(2,'nazvanie',39,79),(2,'e-mail',54,207),(2,'activate_code',54,208),(2,'loginza',54,209),(2,'is_activated',54,210),(2,'last_request_time',54,211),(2,'subscribed_pages',54,212),(2,'rated_pages',54,213),(2,'is_online',54,214),(2,'messages_count',54,215),(2,'auth_token',54,530),(2,'social_uid',54,531),(2,'is_deactivated_by_manager',54,541),(2,'orders_refs',54,216),(2,'delivery_addresses',54,217),(2,'country',40,80),(2,'country_iso_code',10,30),(2,'index',40,81),(2,'region',40,82),(2,'city',40,83),(2,'street',40,84),(2,'house',40,85),(2,'flat',40,86),(2,'user_dock',54,218),(2,'preffered_currency',54,219),(2,'codename',21,35),(2,'nominal',21,36),(2,'rate',21,37),(2,'prefix',21,38),(2,'suffix',21,39),(2,'user_settings_data',54,220),(2,'last_order',54,221),(2,'order_items',53,144),(2,'item_amount',44,93),(2,'item_price',44,94),(2,'item_total_original_price',44,95),(2,'item_actual_price',44,96),(2,'item_total_price',44,97),(2,'item_type_id',44,98),(2,'class_name',41,87),(2,'item_link',44,99),(2,'item_discount_id',44,100),(2,'discount_type_id',42,88),(2,'codename',30,34),(2,'description',30,60),(2,'discount_modificator_id',42,89),(2,'discount_rules_id',42,90),(2,'is_active',42,91),(2,'description',42,92),(2,'item_discount_value',44,101),(2,'weight',44,102),(2,'width',44,103),(2,'height',44,104),(2,'length',44,105),(2,'tax_rate_id',44,106),(2,'yandex_id',27,51),(2,'payonline_id',27,52),(2,'robokassa_id',27,53),(2,'payanyway_id',27,54),(2,'sberbank_id',27,55),(2,'tax',27,56),(2,'dengionline_id',27,535),(2,'payment_mode',44,107),(2,'yandex_id',29,57),(2,'robokassa_id',29,53),(2,'payanyway_id',29,58),(2,'payonline_id',29,59),(2,'sberbank_id',29,55),(2,'dengionline_id',29,536),(2,'payment_subject',44,108),(2,'yandex_id',28,57),(2,'robokassa_id',28,53),(2,'payanyway_id',28,58),(2,'payonline_id',28,59),(2,'sberbank_id',28,55),(2,'dengionline_id',28,536),(2,'price_type_id',44,539),(2,'options',44,109),(2,'trade_offer',44,110),(2,'number',53,145),(2,'social_order_id',53,146),(2,'customer_id',53,148),(2,'domain_id',53,149),(2,'manager_id',53,150),(2,'status_id',53,151),(2,'codename',45,40),(2,'priority',45,111),(2,'total_original_price',53,152),(2,'total_price',53,153),(2,'total_amount',53,154),(2,'status_change_date',53,155),(2,'order_date',53,156),(2,'order_discount_value',53,157),(2,'is_reserved',53,158),(2,'service_info',53,159),(2,'order_comment',53,160),(2,'http_referer',53,168),(2,'http_target',53,169),(2,'source_domain',53,170),(2,'utm_medium',53,171),(2,'utm_term',53,172),(2,'utm_campaign',53,173),(2,'utm_content',53,174),(2,'order_create_date',53,175),(2,'payment_id',53,176),(2,'payment_type_id',47,115),(2,'class_name',46,112),(2,'payment_type_id',46,113),(2,'payment_type_guid',46,114),(2,'disabled',47,116),(2,'domain_id_list',47,117),(2,'disabled_user_groups',47,542),(2,'payment_name',53,177),(2,'payment_status_id',53,178),(2,'codename',48,40),(2,'priority',48,111),(2,'payment_date',53,179),(2,'payment_document_num',53,180),(2,'legal_person',53,181),(2,'contact_person',49,118),(2,'phone_number',49,119),(2,'fax',49,120),(2,'email',49,49),(2,'name',49,121),(2,'legal_address',49,122),(2,'defacto_address',49,123),(2,'post_address',49,124),(2,'inn',49,125),(2,'account',49,126),(2,'bank',49,127),(2,'bank_account',49,128),(2,'bik',49,129),(2,'ogrn',49,130),(2,'kpp',49,131),(2,'delivery_id',53,182),(2,'description',51,135),(2,'delivery_type_id',51,136),(2,'class_name',50,132),(2,'delivery_type_id',50,133),(2,'delivery_type_guid',50,134),(2,'price',51,137),(2,'tax_rate_id',51,138),(2,'disabled',51,139),(2,'domain_id_list',51,140),(2,'payment_mode',51,141),(2,'payment_subject',51,142),(2,'disabled_types_of_payment',51,143),(2,'delivery_name',53,183),(2,'delivery_status_id',53,184),(2,'codename',52,40),(2,'priority',52,111),(2,'delivery_address',53,185),(2,'delivery_date',53,186),(2,'pickup_date',53,187),(2,'delivery_provider',53,188),(2,'delivery_tariff',53,189),(2,'delivery_type',53,190),(2,'pickup_type',53,191),(2,'delivery_price',53,192),(2,'delivery_point_in',53,193),(2,'delivery_point_out',53,194),(2,'total_weight',53,195),(2,'total_width',53,196),(2,'total_height',53,197),(2,'total_length',53,198),(2,'delivery_allow_date',53,199),(2,'order_discount_id',53,200),(2,'bonus',53,201),(2,'need_export',53,202),(2,'purchaser_one_click',53,203),(2,'lname',25,46),(2,'fname',25,47),(2,'father_name',25,48),(2,'email',25,49),(2,'phone',25,50),(2,'bonus',54,222),(2,'legal_persons',54,223),(2,'spent_bonus',54,224),(2,'filemanager_directory',54,225),(2,'appended_file_extensions',54,226),(2,'register_date',54,227),(2,'tickets_color',54,228),(2,'favorite_domain_list',54,229),(2,'lname',54,230),(2,'fname',54,231),(2,'father_name',54,232),(2,'phone',54,233),(2,'referer',54,234),(2,'target',54,235),(2,'rate_voters',77,15),(2,'rate_sum',77,16),(2,'expiration_date',77,17),(2,'notification_date',77,18),(2,'publish_comments',77,19),(2,'publish_status',77,20),(2,'locktime',77,21),(2,'lockuser',77,22),(2,'additional_content',77,511),(2,'title',73,2),(2,'h1',73,3),(2,'content',73,4),(2,'meta_descriptions',73,5),(2,'meta_keywords',73,6),(2,'tags',73,7),(2,'robots_deny',73,11),(2,'show_submenu',73,12),(2,'is_expanded',73,13),(2,'is_unindexed',73,14),(2,'rate_voters',73,15),(2,'rate_sum',73,16),(2,'expiration_date',73,17),(2,'notification_date',73,18),(2,'publish_comments',73,19),(2,'publish_status',73,20),(2,'locktime',73,21),(2,'lockuser',73,22),(2,'form_id',73,280),(2,'additional_content',73,511),(2,'address_description',76,296),(2,'address_list',76,297),(2,'form_id',76,298),(2,'from_email_template',75,285),(2,'from_template',75,286),(2,'subject_template',75,287),(2,'master_template',75,288),(2,'autoreply_from_email_template',75,289),(2,'autoreply_from_template',75,290),(2,'autoreply_subject_template',75,291),(2,'autoreply_email_recipient',75,292),(2,'autoreply_template',75,293),(2,'posted_message',75,294),(2,'form_id',75,295),(2,'title',78,2),(2,'h1',78,3),(2,'meta_descriptions',78,5),(2,'meta_keywords',78,6),(2,'tags',78,7),(2,'robots_deny',78,11),(2,'show_submenu',78,12),(2,'is_expanded',78,13),(2,'is_unindexed',78,14),(2,'photo',78,301),(2,'descr',78,268),(2,'create_time',78,299),(2,'user_id',78,300),(2,'rate_voters',78,15),(2,'rate_sum',78,16),(2,'expiration_date',78,17),(2,'notification_date',78,18),(2,'publish_comments',78,19),(2,'publish_status',78,20),(2,'locktime',78,21),(2,'lockuser',78,22),(2,'additional_content',78,511),(2,'title',63,2),(2,'h1',63,3),(2,'description',63,258),(2,'meta_descriptions',63,5),(2,'meta_keywords',63,6),(2,'tags',63,7),(2,'friendlist',63,259),(2,'robots_deny',63,11),(2,'show_submenu',63,12),(2,'is_expanded',63,13),(2,'is_unindexed',63,14),(2,'rate_voters',63,15),(2,'rate_sum',63,16),(2,'additional_content',63,511),(2,'locktime',63,21),(2,'lockuser',63,22),(2,'title',66,2),(2,'h1',66,3),(2,'content',66,4),(2,'meta_descriptions',66,5),(2,'meta_keywords',66,6),(2,'tags',66,7),(2,'publish_time',66,244),(2,'robots_deny',66,11),(2,'show_submenu',66,12),(2,'is_expanded',66,13),(2,'is_unindexed',66,14),(2,'rate_voters',66,15),(2,'rate_sum',66,16),(2,'expiration_date',66,17),(2,'notification_date',66,18),(2,'publish_comments',66,19),(2,'publish_status',66,20),(2,'locktime',66,21),(2,'lockuser',66,22),(2,'only_for_friends',66,267),(2,'is_spam',66,266),(2,'main_content',66,518),(2,'additional_content',66,511),(2,'title',7,2),(2,'h1',7,3),(2,'meta_keywords',7,6),(2,'meta_descriptions',7,5),(2,'tags',7,7),(2,'readme',7,24),(2,'robots_deny',7,11),(2,'show_submenu',7,12),(2,'is_expanded',7,13),(2,'is_unindexed',7,14),(2,'rate_voters',7,15),(2,'rate_sum',7,16),(2,'expiration_date',7,17),(2,'notification_date',7,18),(2,'publish_comments',7,19),(2,'publish_status',7,20),(2,'locktime',7,21),(2,'lockuser',7,22),(2,'additional_content',7,511),(2,'title',60,2),(2,'h1',60,3),(2,'meta_keywords',60,6),(2,'meta_descriptions',60,5),(2,'tags',60,7),(2,'anons',60,241),(2,'content',60,4),(2,'source',60,242),(2,'source_url',60,243),(2,'publish_time',60,244),(2,'begin_time',60,245),(2,'end_time',60,246),(2,'robots_deny',60,11),(2,'show_submenu',60,12),(2,'is_expanded',60,13),(2,'is_unindexed',60,14),(2,'anons_pic',60,247),(2,'publish_pic',60,248),(2,'subjects',60,249),(2,'rate_voters',60,15),(2,'rate_sum',60,16),(2,'expiration_date',60,17),(2,'notification_date',60,18),(2,'publish_comments',60,19),(2,'publish_status',60,20),(2,'locktime',60,21),(2,'lockuser',60,22),(2,'additional_content',60,511);
/*!40000 ALTER TABLE `cms3_import_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_groups`
--

DROP TABLE IF EXISTS `cms3_import_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_groups` (
  `source_id` int unsigned NOT NULL,
  `group_name` varchar(48) NOT NULL,
  `type_id` int unsigned NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`),
  KEY `type_id` (`type_id`),
  KEY `group_name` (`group_name`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_GroupSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewGroupId_To_ObjectTypeId` FOREIGN KEY (`type_id`) REFERENCES `cms3_import_types` (`new_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_ObjectTypeGroupId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_field_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_groups`
--

LOCK TABLES `cms3_import_groups` WRITE;
/*!40000 ALTER TABLE `cms3_import_groups` DISABLE KEYS */;
INSERT INTO `cms3_import_groups` VALUES (1,'svojstva_statusa_stranicy',2,1),(1,'common',3,2),(1,'more_params',3,4),(1,'rate_props',3,5),(1,'svojstva_publikacii',3,6),(1,'locks',3,7),(1,'common',6,8),(1,'common',7,9),(1,'more_params',7,11),(1,'rate_voters',7,12),(1,'svojstva_publikacii',7,13),(1,'locks',7,14),(1,'common',8,15),(1,'props',9,16),(1,'params_more',10,17),(1,'common',14,18),(1,'common',15,19),(1,'additional',16,20),(1,'additional',17,21),(1,'props_currency',21,24),(1,'common',23,26),(1,'common',24,27),(1,'personal',25,28),(1,'common',27,29),(1,'common',28,30),(1,'common',29,31),(1,'discount_type_props',30,32),(1,'discount_modificator_type_props',31,33),(1,'discount_modificator_props',32,34),(1,'discount_rule_type_props',33,35),(1,'discount_rule_props',34,36),(1,'common',35,37),(1,'common',36,38),(1,'network_system_props',37,39),(1,'props',38,40),(1,'pages',38,41),(1,'network_system_props',38,42),(1,'svojstva_gruppy_polzovatelej',39,43),(1,'common',40,44),(1,'item_type_props',41,45),(1,'discount_props',42,46),(1,'item_props',44,47),(1,'item_optioned_props',44,48),(1,'trade_offers',44,49),(1,'order_status_props',45,50),(1,'payment_type_props',46,51),(1,'payment_props',47,52),(1,'order_status_props',48,53),(1,'general',49,54),(1,'addresses',49,55),(1,'payment',49,56),(1,'delivery_type_props',50,57),(1,'delivery_description_props',51,58),(1,'order_status_props',52,59),(1,'order_props',53,60),(1,'statistic_info',53,62),(1,'order_payment_props',53,63),(1,'order_delivery_props',53,64),(1,'order_discount_props',53,65),(1,'integration_date',53,66),(1,'purchase_one_click',53,67),(1,'idetntify_data',54,68),(1,'more_info',54,69),(1,'short_info',54,70),(1,'delivery',54,71),(1,'statistic_info',54,72),(1,'store_props',55,73),(1,'discount_modificator_props',56,74),(1,'discount_rule_props',57,75),(1,'common',58,76),(1,'common',60,77),(1,'item_props',60,78),(1,'more_params',60,80),(1,'news_images',60,81),(1,'subjects_block',60,82),(1,'rate_voters',60,83),(1,'svojstva_publikacii',60,84),(1,'locks',60,85),(1,'common',61,86),(1,'more_params',61,88),(1,'rate_voters',61,89),(1,'svojstva_publikacii',61,90),(1,'locks',61,91),(1,'props',62,92),(1,'common',63,93),(1,'more_params',63,95),(1,'rate_props',63,96),(1,'props',64,97),(1,'common',65,98),(1,'rate_props',65,99),(1,'antispam',65,100),(1,'common',66,101),(1,'more_params',66,103),(1,'rate_props',66,104),(1,'svojstva_publikacii',66,105),(1,'locks',66,106),(1,'privacy',66,107),(1,'antispam',66,108),(1,'common',67,109),(1,'more_params',67,111),(1,'rate_voters',67,112),(1,'svojstva_publikacii',67,113),(1,'locks',67,114),(1,'common',68,115),(1,'more_params',68,117),(1,'topic_props',68,118),(1,'rate_voters',68,119),(1,'svojstva_publikacii',68,120),(1,'locks',68,121),(1,'common',69,122),(1,'more_params',69,124),(1,'message_props',69,125),(1,'rate_voters',69,126),(1,'svojstva_publikacii',69,127),(1,'locks',69,128),(1,'common',70,129),(1,'more_params',70,131),(1,'comment_props',70,132),(1,'rate_voters',70,133),(1,'svojstva_publikacii',70,134),(1,'locks',70,135),(1,'antispam',70,136),(1,'common_props',71,137),(1,'common',72,138),(1,'more_params',72,140),(1,'poll_props',72,141),(1,'rate_voters',72,142),(1,'svojstva_publikacii',72,143),(1,'locks',72,144),(1,'common',73,145),(1,'more_params',73,147),(1,'rate_props',73,148),(1,'svojstva_publikacii',73,149),(1,'locks',73,150),(1,'binding',73,151),(1,'sendingdata',74,152),(1,'templates',75,153),(1,'auto_reply',75,154),(1,'messages',75,155),(1,'binding',75,156),(1,'list',76,157),(1,'common',77,158),(1,'more_params',77,160),(1,'album_props',77,161),(1,'rate_voters',77,162),(1,'svojstva_publikacii',77,163),(1,'locks',77,164),(1,'common',78,165),(1,'more_params',78,167),(1,'photo_props',78,168),(1,'rate_voters',78,169),(1,'svojstva_publikacii',78,170),(1,'locks',78,171),(1,'common',79,172),(1,'more_params',79,174),(1,'rate_voters',79,175),(1,'svojstva_publikacii',79,176),(1,'locks',79,177),(1,'common',80,178),(1,'more_params',80,180),(1,'rate_voters',80,181),(1,'svojstva_publikacii',80,182),(1,'locks',80,183),(1,'common',81,184),(1,'more_params',81,186),(1,'svojstva_publikacii',81,187),(1,'locks',81,188),(1,'antispam',81,189),(1,'grp_disp_props',82,190),(1,'auto_settings',82,191),(1,'grp_disp_release_props',83,192),(1,'grp_disp_msg_props',84,193),(1,'grp_disp_msg_extended',84,194),(1,'grp_sbs_props',85,195),(1,'grp_sbs_extended',85,196),(1,'common',86,197),(1,'more_params',86,199),(1,'dopolnitelno',86,200),(1,'rate_voters',86,201),(1,'svojstva_publikacii',86,202),(1,'locks',86,203),(1,'filter_index',86,204),(1,'common',87,205),(1,'more_params',87,207),(1,'cenovye_svojstva',87,208),(1,'catalog_option_props',87,209),(1,'catalog_stores_props',87,210),(1,'trade_offers',87,211),(1,'rate_voters',87,212),(1,'svojstva_publikacii',87,213),(1,'locks',87,214),(1,'personal_info',88,215),(1,'contact_props',88,216),(1,'delivery',88,217),(1,'yuridicheskie_dannye',88,218),(1,'discount_modificator_props',89,219),(1,'discount_rule_props',90,220),(1,'discount_rule_props',91,221),(1,'discount_rule_props',92,222),(1,'discount_rule_props',93,223),(1,'discount_rule_props',94,224),(1,'discount_rule_props',95,225),(1,'delivery_description_props',96,226),(1,'delivery_description_props',97,227),(1,'delivery_courier_props',97,228),(1,'delivery_description_props',98,229),(1,'settings',98,230),(1,'delivery_description_props',99,231),(1,'settings',99,232),(1,'payment_props',100,233),(1,'settings',100,234),(1,'payment_props',101,235),(1,'settings',101,236),(1,'payment_props',102,237),(1,'payment_props',103,238),(1,'settings',103,239),(1,'payment_props',105,242),(1,'organization',105,243),(1,'payment_props',106,244),(1,'settings',106,245),(1,'payment_props',107,246),(1,'settings',107,247),(1,'payment_props',111,253),(1,'settings',111,254),(1,'payment_props',112,255),(1,'settings',112,256),(1,'common_props',113,257),(1,'common',114,258),(1,'redirect_props',114,259),(1,'view_params',114,260),(1,'view_pages',114,261),(1,'time_targeting',114,262),(1,'city_targeting',114,263),(1,'view_settings',114,264),(1,'common',115,265),(1,'banner_custom_props',115,266),(1,'redirect_props',115,267),(1,'view_params',115,268),(1,'view_pages',115,269),(1,'time_targeting',115,270),(1,'city_targeting',115,271),(1,'view_settings',115,272),(1,'common',116,273),(1,'banner_custom_props',116,274),(1,'redirect_props',116,275),(1,'view_params',116,276),(1,'view_pages',116,277),(1,'time_targeting',116,278),(1,'city_targeting',116,279),(1,'view_settings',116,280),(1,'common',117,281),(1,'banner_custom_props',117,282),(1,'redirect_props',117,283),(1,'view_params',117,284),(1,'view_pages',117,285),(1,'time_targeting',117,286),(1,'city_targeting',117,287),(1,'view_settings',117,288),(1,'svojstva',118,289),(1,'common',119,290),(1,'common',120,291),(1,'channel_meta',120,292),(1,'channel_web_analytics',120,293),(1,'channel_advertising',120,294),(1,'common',121,295),(1,'common',122,296),(1,'more_params',122,298),(1,'fs_file_props',122,299),(1,'rate_voters',122,300),(1,'svojstva_publikacii',122,301),(1,'locks',122,302),(1,'common',123,303),(1,'common',124,304),(1,'common',125,305),(1,'common',126,306),(1,'more_params',126,308),(1,'rate_props',126,309),(1,'svojstva_publikacii',126,310),(1,'locks',126,311),(1,'appointment',126,312),(1,'order_credit_props',53,356),(1,'discount_rule_props',131,357),(1,'locks',63,358),(1,'locks',65,359),(1,'common',132,360),(1,'channel_meta',132,361),(1,'channel_web_analytics',132,362),(1,'channel_advertising',132,363);
/*!40000 ALTER TABLE `cms3_import_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_langs`
--

DROP TABLE IF EXISTS `cms3_import_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_langs` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_LangSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NewId_To_LangId` FOREIGN KEY (`new_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_langs`
--

LOCK TABLES `cms3_import_langs` WRITE;
/*!40000 ALTER TABLE `cms3_import_langs` DISABLE KEYS */;
INSERT INTO `cms3_import_langs` VALUES (1,'1',1),(1,'2',2),(2,'1',1);
/*!40000 ALTER TABLE `cms3_import_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_links`
--

DROP TABLE IF EXISTS `cms3_import_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_links` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_links_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_links_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_links`
--

LOCK TABLES `cms3_import_links` WRITE;
/*!40000 ALTER TABLE `cms3_import_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_links_sources`
--

DROP TABLE IF EXISTS `cms3_import_links_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_links_sources` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_links_sources_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_links_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_links_sources_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_links_sources`
--

LOCK TABLES `cms3_import_links_sources` WRITE;
/*!40000 ALTER TABLE `cms3_import_links_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_links_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_mail_notifications`
--

DROP TABLE IF EXISTS `cms3_import_mail_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_mail_notifications` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_mail_notifications_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_mail_notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_mail_notifications_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_mail_notifications`
--

LOCK TABLES `cms3_import_mail_notifications` WRITE;
/*!40000 ALTER TABLE `cms3_import_mail_notifications` DISABLE KEYS */;
INSERT INTO `cms3_import_mail_notifications` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1);
/*!40000 ALTER TABLE `cms3_import_mail_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_mail_templates`
--

DROP TABLE IF EXISTS `cms3_import_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_mail_templates` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_mail_templates_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_mail_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_mail_templates_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_mail_templates`
--

LOCK TABLES `cms3_import_mail_templates` WRITE;
/*!40000 ALTER TABLE `cms3_import_mail_templates` DISABLE KEYS */;
INSERT INTO `cms3_import_mail_templates` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1);
/*!40000 ALTER TABLE `cms3_import_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_mail_variables`
--

DROP TABLE IF EXISTS `cms3_import_mail_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_mail_variables` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_mail_variables_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_mail_variables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_mail_variables_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_mail_variables`
--

LOCK TABLES `cms3_import_mail_variables` WRITE;
/*!40000 ALTER TABLE `cms3_import_mail_variables` DISABLE KEYS */;
INSERT INTO `cms3_import_mail_variables` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(52,52,1),(53,53,1),(54,54,1),(55,55,1),(56,56,1),(57,57,1),(58,58,1),(59,59,1),(60,60,1),(61,61,1),(62,62,1),(63,63,1),(64,64,1),(65,65,1),(66,66,1),(67,67,1),(68,68,1),(69,69,1),(70,70,1),(71,71,1),(72,72,1),(73,73,1),(74,74,1),(75,75,1),(76,76,1),(77,77,1),(78,78,1),(79,79,1),(80,80,1),(81,81,1),(82,82,1),(83,83,1),(84,84,1),(85,85,1),(86,86,1),(87,87,1),(88,88,1),(89,89,1),(90,90,1),(91,91,1),(92,92,1),(93,93,1),(94,94,1),(95,95,1),(96,96,1),(97,97,1),(98,98,1),(99,99,1),(100,100,1),(101,101,1),(102,102,1),(103,103,1),(104,104,1),(105,105,1),(106,106,1),(107,107,1),(108,108,1),(109,109,1),(110,110,1),(111,111,1),(112,112,1),(113,113,1),(114,114,1),(115,115,1),(116,116,1),(117,117,1),(118,118,1),(119,119,1),(120,120,1),(121,121,1),(122,122,1),(123,123,1),(124,124,1),(125,125,1),(126,126,1),(127,127,1),(128,128,1),(129,129,1),(130,130,1),(131,131,1),(132,132,1),(133,133,1),(134,134,1),(135,135,1),(136,136,1),(137,137,1),(138,138,1),(139,139,1),(140,140,1),(141,141,1),(142,142,1),(143,143,1),(144,144,1),(145,145,1),(146,146,1),(147,147,1),(148,148,1),(149,149,1),(150,150,1),(151,151,1),(152,152,1),(153,153,1),(154,154,1),(155,155,1),(156,156,1),(157,157,1),(158,158,1),(159,159,1),(160,160,1),(161,161,1),(162,162,1),(163,163,1),(164,164,1),(165,165,1),(166,166,1),(167,167,1),(168,168,1),(169,169,1),(170,170,1),(171,171,1),(172,172,1),(173,173,1),(174,174,1),(175,175,1),(176,176,1),(177,177,1),(178,178,1),(179,179,1),(180,180,1);
/*!40000 ALTER TABLE `cms3_import_mail_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_objects`
--

DROP TABLE IF EXISTS `cms3_import_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_objects` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_ObjectsId` FOREIGN KEY (`new_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ObjectSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_objects`
--

LOCK TABLES `cms3_import_objects` WRITE;
/*!40000 ALTER TABLE `cms3_import_objects` DISABLE KEYS */;
INSERT INTO `cms3_import_objects` VALUES (1,'14',182),(1,'15',181),(1,'2373',619),(1,'2374',620),(1,'2376',2),(1,'2377',3),(1,'25974',6),(1,'25975',7),(1,'25976',8),(1,'26315',9),(1,'26341',10),(1,'26905',11),(1,'26906',12),(1,'26907',13),(1,'26908',14),(1,'26909',15),(1,'26910',16),(1,'26911',17),(1,'26912',18),(1,'26913',19),(1,'26914',20),(1,'26915',21),(1,'26916',22),(1,'26917',23),(1,'26918',24),(1,'26919',25),(1,'26920',26),(1,'26921',27),(1,'26922',28),(1,'26923',29),(1,'26924',30),(1,'26925',31),(1,'26926',32),(1,'26927',33),(1,'26928',34),(1,'26929',35),(1,'26930',36),(1,'26931',37),(1,'26932',38),(1,'26933',39),(1,'26934',40),(1,'26935',41),(1,'26936',42),(1,'26937',43),(1,'26938',44),(1,'26939',45),(1,'26940',46),(1,'26941',47),(1,'26942',48),(1,'26943',49),(1,'26944',50),(1,'26945',51),(1,'26946',52),(1,'26947',53),(1,'26948',54),(1,'26949',55),(1,'26950',56),(1,'26951',57),(1,'26952',58),(1,'26953',59),(1,'26954',60),(1,'26955',61),(1,'26956',62),(1,'26957',63),(1,'26958',64),(1,'26959',65),(1,'26960',66),(1,'26961',67),(1,'26962',68),(1,'26963',69),(1,'26964',70),(1,'26965',71),(1,'26966',72),(1,'26967',73),(1,'26968',74),(1,'26969',75),(1,'26970',76),(1,'26971',77),(1,'26972',78),(1,'26973',79),(1,'26974',80),(1,'26975',81),(1,'26976',82),(1,'26977',83),(1,'26978',84),(1,'26979',85),(1,'26980',86),(1,'26981',87),(1,'26982',88),(1,'26983',89),(1,'26984',90),(1,'26985',91),(1,'26986',92),(1,'26987',93),(1,'26988',94),(1,'26989',95),(1,'26990',96),(1,'26991',97),(1,'26992',98),(1,'26993',99),(1,'26994',100),(1,'26995',101),(1,'26996',102),(1,'26997',103),(1,'26998',104),(1,'26999',105),(1,'27000',106),(1,'27001',107),(1,'27002',108),(1,'27003',109),(1,'27004',110),(1,'27005',111),(1,'27006',112),(1,'27007',113),(1,'27008',114),(1,'27009',115),(1,'27010',116),(1,'27011',117),(1,'27012',118),(1,'27013',119),(1,'27014',120),(1,'27015',121),(1,'27016',122),(1,'27017',123),(1,'27018',124),(1,'27019',125),(1,'27020',126),(1,'27021',127),(1,'27022',128),(1,'27023',129),(1,'27024',130),(1,'27025',131),(1,'27026',132),(1,'27027',133),(1,'27028',134),(1,'27029',135),(1,'27030',136),(1,'27031',137),(1,'27032',138),(1,'27033',139),(1,'27034',140),(1,'27035',141),(1,'27036',142),(1,'27037',143),(1,'27038',144),(1,'27039',145),(1,'27040',146),(1,'27041',147),(1,'27042',148),(1,'27043',149),(1,'27044',150),(1,'27045',151),(1,'27046',152),(1,'27047',153),(1,'27048',154),(1,'27049',155),(1,'27050',156),(1,'27051',157),(1,'27052',158),(1,'27053',159),(1,'27054',160),(1,'27055',161),(1,'27056',162),(1,'27057',163),(1,'27058',164),(1,'27059',165),(1,'27060',166),(1,'27061',167),(1,'27062',168),(1,'27063',169),(1,'27064',170),(1,'27065',171),(1,'27066',172),(1,'27067',173),(1,'27068',174),(1,'27069',175),(1,'27070',176),(1,'27071',177),(1,'27072',178),(1,'27085',564),(1,'27086',569),(1,'27087',574),(1,'27131',179),(1,'27132',180),(1,'27135',604),(1,'27136',184),(1,'27147',185),(1,'27150',186),(1,'27180',187),(1,'27181',188),(1,'27226',621),(1,'27227',622),(1,'27228',623),(1,'27230',189),(1,'27233',190),(1,'27236',191),(1,'27258',192),(1,'27259',193),(1,'27260',194),(1,'27261',195),(1,'27262',196),(1,'27263',197),(1,'27264',198),(1,'27377',199),(1,'27378',200),(1,'27379',201),(1,'27380',202),(1,'27381',203),(1,'27382',204),(1,'27383',205),(1,'27393',206),(1,'27394',207),(1,'27395',208),(1,'27396',209),(1,'27397',210),(1,'27398',211),(1,'27438',605),(1,'27456',212),(1,'27457',213),(1,'27458',214),(1,'27459',606),(1,'27461',607),(1,'27462',610),(1,'27463',611),(1,'27464',612),(1,'27465',613),(1,'27466',614),(1,'27470',598),(1,'27471',600),(1,'27472',570),(1,'27473',579),(1,'27474',575),(1,'27475',583),(1,'27476',591),(1,'27477',215),(1,'27478',216),(1,'27479',217),(1,'27480',218),(1,'27481',219),(1,'27486',220),(1,'27488',222),(1,'27489',223),(1,'27490',224),(1,'27491',225),(1,'27492',226),(1,'27493',227),(1,'27494',228),(1,'27495',229),(1,'27496',230),(1,'27497',231),(1,'27498',232),(1,'27499',233),(1,'27500',234),(1,'27501',235),(1,'27502',236),(1,'27503',237),(1,'27504',238),(1,'27505',239),(1,'27506',240),(1,'27507',241),(1,'27508',242),(1,'27509',243),(1,'27510',244),(1,'27511',245),(1,'27512',246),(1,'27513',247),(1,'27514',248),(1,'27515',249),(1,'27516',250),(1,'27517',251),(1,'27518',252),(1,'27519',253),(1,'27520',608),(1,'27521',615),(1,'27522',609),(1,'27523',616),(1,'2780',4),(1,'2781',5),(1,'27915',1),(1,'27922',279),(1,'27926',280),(1,'27927',281),(1,'27928',183),(1,'27943',617),(1,'27944',296),(1,'27945',297),(1,'27946',298),(1,'27947',299),(1,'27949',300),(1,'27950',301),(1,'27955',304),(1,'27956',305),(1,'27957',306),(1,'27958',307),(1,'27959',308),(1,'27960',309),(1,'27961',565),(1,'27962',571),(1,'27963',576),(1,'27964',580),(1,'27965',584),(1,'27966',587),(1,'27967',310),(1,'27968',311),(1,'27969',312),(1,'27970',313),(1,'27971',314),(1,'27972',315),(1,'27973',316),(1,'27974',317),(1,'27975',318),(1,'27976',319),(1,'27977',320),(1,'27978',321),(1,'27979',322),(1,'27980',323),(1,'27981',324),(1,'27982',325),(1,'27983',326),(1,'27984',327),(1,'27985',328),(1,'27986',329),(1,'27987',330),(1,'27988',331),(1,'27989',332),(1,'27990',333),(1,'27991',334),(1,'27992',335),(1,'27993',336),(1,'27994',337),(1,'27995',338),(1,'27996',339),(1,'27997',340),(1,'27998',341),(1,'27999',342),(1,'28000',343),(1,'28001',344),(1,'28002',345),(1,'28003',346),(1,'28004',347),(1,'28005',348),(1,'28006',349),(1,'28007',350),(1,'28008',351),(1,'28009',352),(1,'28010',353),(1,'28011',354),(1,'28012',355),(1,'28013',356),(1,'28014',357),(1,'28015',358),(1,'28016',359),(1,'28017',360),(1,'28018',361),(1,'28019',362),(1,'28020',363),(1,'28021',364),(1,'28022',365),(1,'28023',366),(1,'28024',367),(1,'28025',368),(1,'28026',369),(1,'28027',370),(1,'28028',371),(1,'28029',372),(1,'28030',373),(1,'28031',374),(1,'28032',375),(1,'28033',376),(1,'28034',377),(1,'28035',378),(1,'28036',379),(1,'28037',380),(1,'28038',381),(1,'28039',382),(1,'28040',383),(1,'28041',384),(1,'28042',385),(1,'28043',386),(1,'28044',387),(1,'28045',388),(1,'28046',389),(1,'28047',390),(1,'28048',391),(1,'28049',392),(1,'28050',393),(1,'28051',394),(1,'28052',395),(1,'28053',396),(1,'28054',397),(1,'28055',398),(1,'28056',399),(1,'28057',400),(1,'28058',401),(1,'28059',402),(1,'28060',403),(1,'28061',404),(1,'28062',405),(1,'28063',406),(1,'28064',407),(1,'28065',408),(1,'28066',409),(1,'28067',410),(1,'28068',411),(1,'28069',412),(1,'28070',413),(1,'28071',414),(1,'28072',415),(1,'28073',416),(1,'28074',417),(1,'28075',418),(1,'28076',419),(1,'28077',420),(1,'28078',421),(1,'28079',422),(1,'28080',423),(1,'28081',424),(1,'28082',425),(1,'28083',426),(1,'28084',427),(1,'28085',428),(1,'28086',429),(1,'28087',430),(1,'28088',431),(1,'28089',432),(1,'28090',433),(1,'28091',434),(1,'28092',435),(1,'28093',436),(1,'28094',437),(1,'28095',438),(1,'28096',439),(1,'28097',440),(1,'28098',441),(1,'28099',442),(1,'28100',443),(1,'28101',444),(1,'28102',445),(1,'28103',446),(1,'28104',447),(1,'28105',448),(1,'28106',449),(1,'28107',450),(1,'28108',451),(1,'28109',452),(1,'28110',453),(1,'28111',454),(1,'28112',455),(1,'28113',456),(1,'28114',457),(1,'28115',458),(1,'28116',459),(1,'28117',460),(1,'28118',461),(1,'28119',462),(1,'28120',463),(1,'28121',464),(1,'28122',465),(1,'28123',466),(1,'28124',467),(1,'28125',468),(1,'28126',469),(1,'28127',470),(1,'28128',471),(1,'28129',472),(1,'28130',473),(1,'28131',474),(1,'28132',475),(1,'28133',476),(1,'28134',477),(1,'28135',478),(1,'28136',479),(1,'28137',480),(1,'28138',481),(1,'28139',482),(1,'28140',483),(1,'28141',484),(1,'28142',485),(1,'28143',486),(1,'28144',487),(1,'28145',488),(1,'28146',489),(1,'28147',490),(1,'28148',491),(1,'28149',492),(1,'28150',493),(1,'28151',494),(1,'28152',495),(1,'28153',496),(1,'28154',497),(1,'28155',498),(1,'28156',499),(1,'28157',500),(1,'28158',501),(1,'28159',502),(1,'28160',503),(1,'28161',504),(1,'28162',505),(1,'28163',506),(1,'28164',507),(1,'28165',508),(1,'28166',509),(1,'28167',510),(1,'28168',511),(1,'28169',512),(1,'28170',513),(1,'28171',514),(1,'28172',515),(1,'28173',516),(1,'28174',517),(1,'28175',518),(1,'28176',519),(1,'28177',520),(1,'28178',521),(1,'28179',522),(1,'28180',523),(1,'28181',524),(1,'28182',525),(1,'28183',526),(1,'28184',527),(1,'28185',528),(1,'28186',529),(1,'28187',530),(1,'28188',531),(1,'28189',532),(1,'28190',533),(1,'28191',534),(1,'28192',535),(1,'28193',536),(1,'28194',537),(1,'28195',538),(1,'28196',539),(1,'28197',540),(1,'28198',541),(1,'28199',542),(1,'28200',543),(1,'28201',544),(1,'28202',545),(1,'28203',546),(1,'28204',547),(1,'28205',548),(1,'28206',549),(1,'28207',550),(1,'28208',551),(1,'28209',552),(1,'28210',553),(1,'28211',554),(1,'28212',555),(1,'28213',556),(1,'28214',557),(1,'28215',558),(1,'28216',559),(1,'28217',560),(1,'28218',561),(1,'28219',566),(1,'28220',588),(1,'28221',594),(1,'28222',596),(1,'28223',562),(1,'28224',563),(1,'28225',567),(1,'28226',572),(1,'28227',577),(1,'28228',581),(1,'28229',585),(1,'28230',589),(1,'28231',592),(1,'28232',595),(1,'28233',597),(1,'28234',599),(1,'28235',601),(1,'28236',602),(1,'28237',603),(1,'28238',568),(1,'28239',573),(1,'28240',578),(1,'28241',582),(1,'28242',586),(1,'28243',590),(1,'28244',593),(1,'28245',688),(1,'28246',686),(1,'28247',687),(1,'28248',618),(2,'10',10),(2,'179',179),(2,'180',180),(2,'181',181),(2,'182',182),(2,'183',183),(2,'187',187),(2,'188',188),(2,'189',189),(2,'190',190),(2,'191',191),(2,'192',192),(2,'193',193),(2,'194',194),(2,'195',195),(2,'196',196),(2,'197',197),(2,'198',198),(2,'199',199),(2,'200',200),(2,'201',201),(2,'202',202),(2,'203',203),(2,'204',204),(2,'205',205),(2,'213',213),(2,'214',214),(2,'219',219),(2,'220',220),(2,'253',253),(2,'279',279),(2,'280',280),(2,'281',281),(2,'298',298),(2,'299',299),(2,'304',304),(2,'307',307),(2,'308',308),(2,'309',309),(2,'310',310),(2,'311',311),(2,'312',312),(2,'313',313),(2,'314',314),(2,'315',315),(2,'316',316),(2,'317',317),(2,'318',318),(2,'319',319),(2,'320',320),(2,'321',321),(2,'322',322),(2,'323',323),(2,'324',324),(2,'325',325),(2,'326',326),(2,'327',327),(2,'328',328),(2,'329',329),(2,'330',330),(2,'331',331),(2,'332',332),(2,'333',333),(2,'334',334),(2,'335',335),(2,'336',336),(2,'337',337),(2,'338',338),(2,'339',339),(2,'340',340),(2,'341',341),(2,'342',342),(2,'343',343),(2,'344',344),(2,'345',345),(2,'346',346),(2,'347',347),(2,'348',348),(2,'349',349),(2,'350',350),(2,'351',351),(2,'352',352),(2,'353',353),(2,'354',354),(2,'355',355),(2,'356',356),(2,'357',357),(2,'358',358),(2,'359',359),(2,'360',360),(2,'361',361),(2,'362',362),(2,'363',363),(2,'364',364),(2,'365',365),(2,'366',366),(2,'367',367),(2,'368',368),(2,'369',369),(2,'370',370),(2,'371',371),(2,'372',372),(2,'373',373),(2,'374',374),(2,'375',375),(2,'376',376),(2,'377',377),(2,'378',378),(2,'379',379),(2,'380',380),(2,'381',381),(2,'382',382),(2,'383',383),(2,'384',384),(2,'385',385),(2,'386',386),(2,'387',387),(2,'388',388),(2,'389',389),(2,'390',390),(2,'391',391),(2,'392',392),(2,'393',393),(2,'394',394),(2,'395',395),(2,'396',396),(2,'397',397),(2,'398',398),(2,'399',399),(2,'400',400),(2,'401',401),(2,'402',402),(2,'403',403),(2,'404',404),(2,'405',405),(2,'406',406),(2,'407',407),(2,'408',408),(2,'409',409),(2,'410',410),(2,'411',411),(2,'412',412),(2,'413',413),(2,'414',414),(2,'415',415),(2,'416',416),(2,'417',417),(2,'418',418),(2,'419',419),(2,'420',420),(2,'421',421),(2,'422',422),(2,'423',423),(2,'424',424),(2,'425',425),(2,'426',426),(2,'427',427),(2,'428',428),(2,'429',429),(2,'430',430),(2,'431',431),(2,'432',432),(2,'433',433),(2,'434',434),(2,'435',435),(2,'436',436),(2,'437',437),(2,'438',438),(2,'439',439),(2,'440',440),(2,'441',441),(2,'442',442),(2,'443',443),(2,'444',444),(2,'445',445),(2,'446',446),(2,'447',447),(2,'448',448),(2,'449',449),(2,'450',450),(2,'451',451),(2,'452',452),(2,'453',453),(2,'454',454),(2,'455',455),(2,'456',456),(2,'457',457),(2,'458',458),(2,'459',459),(2,'460',460),(2,'461',461),(2,'462',462),(2,'463',463),(2,'464',464),(2,'465',465),(2,'466',466),(2,'467',467),(2,'468',468),(2,'469',469),(2,'470',470),(2,'471',471),(2,'472',472),(2,'473',473),(2,'474',474),(2,'475',475),(2,'476',476),(2,'477',477),(2,'478',478),(2,'479',479),(2,'480',480),(2,'481',481),(2,'482',482),(2,'483',483),(2,'484',484),(2,'485',485),(2,'486',486),(2,'487',487),(2,'488',488),(2,'489',489),(2,'490',490),(2,'491',491),(2,'492',492),(2,'493',493),(2,'494',494),(2,'495',495),(2,'496',496),(2,'497',497),(2,'498',498),(2,'499',499),(2,'500',500),(2,'501',501),(2,'502',502),(2,'503',503),(2,'504',504),(2,'505',505),(2,'506',506),(2,'507',507),(2,'508',508),(2,'509',509),(2,'510',510),(2,'511',511),(2,'512',512),(2,'513',513),(2,'514',514),(2,'515',515),(2,'516',516),(2,'517',517),(2,'518',518),(2,'519',519),(2,'520',520),(2,'521',521),(2,'522',522),(2,'523',523),(2,'524',524),(2,'525',525),(2,'526',526),(2,'527',527),(2,'528',528),(2,'529',529),(2,'530',530),(2,'531',531),(2,'532',532),(2,'533',533),(2,'534',534),(2,'535',535),(2,'536',536),(2,'537',537),(2,'538',538),(2,'539',539),(2,'540',540),(2,'541',541),(2,'542',542),(2,'543',543),(2,'544',544),(2,'545',545),(2,'546',546),(2,'547',547),(2,'548',548),(2,'549',549),(2,'550',550),(2,'551',551),(2,'552',552),(2,'553',553),(2,'554',554),(2,'555',555),(2,'556',556),(2,'557',557),(2,'558',558),(2,'559',559),(2,'560',560),(2,'561',561),(2,'562',562),(2,'563',563),(2,'564',564),(2,'565',565),(2,'567',567),(2,'568',568),(2,'569',569),(2,'571',571),(2,'572',572),(2,'573',573),(2,'574',574),(2,'576',576),(2,'577',577),(2,'578',578),(2,'580',580),(2,'581',581),(2,'582',582),(2,'584',584),(2,'585',585),(2,'586',586),(2,'587',587),(2,'589',589),(2,'590',590),(2,'592',592),(2,'593',593),(2,'595',595),(2,'597',597),(2,'599',599),(2,'601',601),(2,'602',602),(2,'603',603),(2,'619',619),(2,'620',620),(2,'621',621),(2,'622',622),(2,'623',623),(2,'624',624),(2,'625',625),(2,'626',626),(2,'627',627),(2,'628',628),(2,'629',629),(2,'630',630),(2,'631',631),(2,'632',632),(2,'633',633),(2,'634',634),(2,'636',636),(2,'638',638),(2,'639',639),(2,'640',640),(2,'641',641),(2,'658',658),(2,'659',659),(2,'660',660),(2,'661',661),(2,'662',662),(2,'663',663),(2,'664',664),(2,'665',665),(2,'666',666),(2,'667',667),(2,'682',682),(2,'683',683),(2,'684',684),(2,'685',685),(2,'686',686),(2,'9',9);
/*!40000 ALTER TABLE `cms3_import_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_offer_list`
--

DROP TABLE IF EXISTS `cms3_import_offer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_offer_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to offer` FOREIGN KEY (`internal_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_offer_list`
--

LOCK TABLES `cms3_import_offer_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_offer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_offer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_offer_price_list`
--

DROP TABLE IF EXISTS `cms3_import_offer_price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_offer_price_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to price` FOREIGN KEY (`internal_id`) REFERENCES `cms3_offer_price_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `price source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_offer_price_list`
--

LOCK TABLES `cms3_import_offer_price_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_offer_price_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_offer_price_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_offer_price_type_list`
--

DROP TABLE IF EXISTS `cms3_import_offer_price_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_offer_price_type_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to price type` FOREIGN KEY (`internal_id`) REFERENCES `cms3_offer_price_type_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `price type source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_offer_price_type_list`
--

LOCK TABLES `cms3_import_offer_price_type_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_offer_price_type_list` DISABLE KEYS */;
INSERT INTO `cms3_import_offer_price_type_list` VALUES ('1',1,1);
/*!40000 ALTER TABLE `cms3_import_offer_price_type_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_push_message_list`
--

DROP TABLE IF EXISTS `cms3_import_push_message_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_push_message_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to message` FOREIGN KEY (`internal_id`) REFERENCES `cms3_push_message_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_push_message_list`
--

LOCK TABLES `cms3_import_push_message_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_push_message_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_push_message_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_push_subscriber_list`
--

DROP TABLE IF EXISTS `cms3_import_push_subscriber_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_push_subscriber_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to subscriber` FOREIGN KEY (`internal_id`) REFERENCES `cms3_push_subscriber_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriber source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_push_subscriber_list`
--

LOCK TABLES `cms3_import_push_subscriber_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_push_subscriber_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_push_subscriber_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_push_topic_list`
--

DROP TABLE IF EXISTS `cms3_import_push_topic_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_push_topic_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to topic` FOREIGN KEY (`internal_id`) REFERENCES `cms3_push_topic_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `topic source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_push_topic_list`
--

LOCK TABLES `cms3_import_push_topic_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_push_topic_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_push_topic_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_redirects`
--

DROP TABLE IF EXISTS `cms3_import_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_redirects` (
  `external_id` int NOT NULL,
  `internal_id` int NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_redirects_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_redirects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_redirects_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_redirects`
--

LOCK TABLES `cms3_import_redirects` WRITE;
/*!40000 ALTER TABLE `cms3_import_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_relations`
--

DROP TABLE IF EXISTS `cms3_import_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_relations` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_HierarchyId` FOREIGN KEY (`new_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_relations`
--

LOCK TABLES `cms3_import_relations` WRITE;
/*!40000 ALTER TABLE `cms3_import_relations` DISABLE KEYS */;
INSERT INTO `cms3_import_relations` VALUES (2,'1',1),(2,'2',2),(2,'26',26),(2,'27',27),(2,'28',28),(2,'29',29),(2,'3',3),(2,'30',30),(2,'31',31),(2,'32',32),(2,'33',33),(2,'34',34),(2,'35',35),(2,'4',4),(2,'43',43),(2,'44',44),(2,'45',45),(2,'46',46),(2,'5',5),(2,'6',6),(2,'7',7),(2,'8',8);
/*!40000 ALTER TABLE `cms3_import_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_restrictions`
--

DROP TABLE IF EXISTS `cms3_import_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_restrictions` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_RestrictionId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_fields_restrictions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RestrictionSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_restrictions`
--

LOCK TABLES `cms3_import_restrictions` WRITE;
/*!40000 ALTER TABLE `cms3_import_restrictions` DISABLE KEYS */;
INSERT INTO `cms3_import_restrictions` VALUES (1,'1',6),(1,'2',3),(1,'3',4),(1,'4',1),(1,'5',2),(1,'7',5);
/*!40000 ALTER TABLE `cms3_import_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_sliders`
--

DROP TABLE IF EXISTS `cms3_import_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_sliders` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_sliders_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_sliders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_sliders_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_sliders`
--

LOCK TABLES `cms3_import_sliders` WRITE;
/*!40000 ALTER TABLE `cms3_import_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_slides`
--

DROP TABLE IF EXISTS `cms3_import_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_slides` (
  `external_id` int unsigned NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `cms3_import_slides_ibfk_1` FOREIGN KEY (`internal_id`) REFERENCES `cms3_slides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_import_slides_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_slides`
--

LOCK TABLES `cms3_import_slides` WRITE;
/*!40000 ALTER TABLE `cms3_import_slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_sources`
--

DROP TABLE IF EXISTS `cms3_import_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `source_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_name` (`source_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_sources`
--

LOCK TABLES `cms3_import_sources` WRITE;
/*!40000 ALTER TABLE `cms3_import_sources` DISABLE KEYS */;
INSERT INTO `cms3_import_sources` VALUES (2,'demolancer-dev'),(1,'system');
/*!40000 ALTER TABLE `cms3_import_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_stock_balance_list`
--

DROP TABLE IF EXISTS `cms3_import_stock_balance_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_stock_balance_list` (
  `external_id` varchar(255) NOT NULL,
  `internal_id` int unsigned NOT NULL,
  `source_id` int unsigned NOT NULL,
  KEY `external_id` (`external_id`,`source_id`),
  KEY `internal_id` (`internal_id`,`source_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `internal id to stock balance` FOREIGN KEY (`internal_id`) REFERENCES `cms3_stock_balance_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock balance source id to import source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_stock_balance_list`
--

LOCK TABLES `cms3_import_stock_balance_list` WRITE;
/*!40000 ALTER TABLE `cms3_import_stock_balance_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_import_stock_balance_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_templates`
--

DROP TABLE IF EXISTS `cms3_import_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_templates` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_TemplateId` FOREIGN KEY (`new_id`) REFERENCES `cms3_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TemplateSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_templates`
--

LOCK TABLES `cms3_import_templates` WRITE;
/*!40000 ALTER TABLE `cms3_import_templates` DISABLE KEYS */;
INSERT INTO `cms3_import_templates` VALUES (2,'1',1);
/*!40000 ALTER TABLE `cms3_import_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_import_types`
--

DROP TABLE IF EXISTS `cms3_import_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_import_types` (
  `source_id` int unsigned NOT NULL,
  `old_id` varchar(255) NOT NULL,
  `new_id` int unsigned NOT NULL,
  KEY `source_id` (`source_id`,`old_id`,`new_id`),
  KEY `old_id` (`old_id`,`new_id`),
  KEY `new_id` (`new_id`),
  CONSTRAINT `FK_NewId_To_ObjectTypeId` FOREIGN KEY (`new_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TypeSourceId_To_Source` FOREIGN KEY (`source_id`) REFERENCES `cms3_import_sources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_import_types`
--

LOCK TABLES `cms3_import_types` WRITE;
/*!40000 ALTER TABLE `cms3_import_types` DISABLE KEYS */;
INSERT INTO `cms3_import_types` VALUES (1,'10',61),(1,'11',87),(1,'18',7),(1,'21',5),(1,'22',8),(1,'23',60),(1,'34',59),(1,'39',71),(1,'4',54),(1,'40',72),(1,'5',114),(1,'6',39),(1,'648',67),(1,'649',68),(1,'650',69),(1,'651',70),(1,'671',113),(1,'672',115),(1,'673',116),(1,'674',9),(1,'675',117),(1,'680',82),(1,'681',83),(1,'682',84),(1,'683',85),(1,'688',64),(1,'689',62),(1,'693',10),(1,'696',77),(1,'697',78),(1,'699',79),(1,'7',1),(1,'700',80),(1,'701',81),(1,'702',122),(1,'739',11),(1,'740',74),(1,'741',75),(1,'742',76),(1,'743',118),(1,'745',2),(1,'746',63),(1,'747',65),(1,'748',66),(1,'750',73),(1,'751',45),(1,'752',52),(1,'753',48),(1,'754',55),(1,'755',53),(1,'756',44),(1,'757',43),(1,'760',88),(1,'762',30),(1,'765',42),(1,'767',32),(1,'768',56),(1,'770',31),(1,'772',33),(1,'773',34),(1,'777',90),(1,'779',41),(1,'780',21),(1,'781',51),(1,'782',50),(1,'783',96),(1,'784',97),(1,'787',46),(1,'788',47),(1,'791',100),(1,'792',12),(1,'793',13),(1,'794',91),(1,'795',92),(1,'796',93),(1,'797',94),(1,'798',57),(1,'799',95),(1,'8',4),(1,'800',89),(1,'801',101),(1,'802',102),(1,'803',40),(1,'804',119),(1,'805',121),(1,'806',35),(1,'807',36),(1,'808',98),(1,'809',14),(1,'810',15),(1,'812',103),(1,'814',16),(1,'815',17),(1,'816',105),(1,'817',49),(1,'818',18),(1,'819',124),(1,'822',37),(1,'823',38),(1,'824',106),(1,'826',107),(1,'830',23),(1,'831',24),(1,'832',6),(1,'837',111),(1,'838',25),(1,'839',58),(1,'840',26),(1,'841',126),(1,'842',99),(1,'843',123),(1,'844',27),(1,'845',112),(1,'846',28),(1,'847',29),(1,'848',125),(1,'849',120),(1,'850',131),(1,'851',132),(1,'9',86),(1,'{root-pages-type}',3),(2,'1',1),(2,'10',10),(2,'12',12),(2,'123',123),(2,'127',127),(2,'128',128),(2,'129',129),(2,'13',13),(2,'130',130),(2,'2',2),(2,'21',21),(2,'25',25),(2,'27',27),(2,'28',28),(2,'29',29),(2,'30',30),(2,'39',39),(2,'40',40),(2,'41',41),(2,'42',42),(2,'43',43),(2,'44',44),(2,'45',45),(2,'46',46),(2,'47',47),(2,'48',48),(2,'49',49),(2,'50',50),(2,'51',51),(2,'52',52),(2,'53',53),(2,'54',54),(2,'59',59),(2,'60',60),(2,'61',61),(2,'63',63),(2,'66',66),(2,'7',7),(2,'73',73),(2,'74',74),(2,'75',75),(2,'76',76),(2,'77',77),(2,'78',78),(2,'{root-pages-type}',3);
/*!40000 ALTER TABLE `cms3_import_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_langs`
--

DROP TABLE IF EXISTS `cms3_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_langs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(16) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_langs`
--

LOCK TABLES `cms3_langs` WRITE;
/*!40000 ALTER TABLE `cms3_langs` DISABLE KEYS */;
INSERT INTO `cms3_langs` VALUES (1,'ru','Русский',1),(2,'en','English',0);
/*!40000 ALTER TABLE `cms3_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_links`
--

DROP TABLE IF EXISTS `cms3_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(1024) NOT NULL,
  `address_hash` varchar(32) NOT NULL,
  `place` varchar(255) NOT NULL,
  `broken` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_hash` (`address_hash`),
  KEY `broken` (`broken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_links`
--

LOCK TABLES `cms3_links` WRITE;
/*!40000 ALTER TABLE `cms3_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_links_sources`
--

DROP TABLE IF EXISTS `cms3_links_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_links_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int unsigned NOT NULL,
  `place` varchar(255) NOT NULL,
  `type` enum('object','template') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_source` (`link_id`,`place`),
  CONSTRAINT `source link_id` FOREIGN KEY (`link_id`) REFERENCES `cms3_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_links_sources`
--

LOCK TABLES `cms3_links_sources` WRITE;
/*!40000 ALTER TABLE `cms3_links_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_links_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_mail_notifications`
--

DROP TABLE IF EXISTS `cms3_mail_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_mail_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name-domain-lang` (`name`,`domain_id`,`lang_id`),
  KEY `lang_id` (`lang_id`),
  KEY `domain_id` (`domain_id`),
  KEY `name` (`name`),
  CONSTRAINT `notification to domain` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notification to lang` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_mail_notifications`
--

LOCK TABLES `cms3_mail_notifications` WRITE;
/*!40000 ALTER TABLE `cms3_mail_notifications` DISABLE KEYS */;
INSERT INTO `cms3_mail_notifications` VALUES (1,1,1,'notification-new-record-admin','appointment'),(2,1,1,'notification-new-record-user','appointment'),(3,1,1,'notification-record-status-changed-user','appointment'),(4,1,1,'notification-banners-expiration-date','banners'),(5,1,1,'notification-blogs-post-comment','blogs20'),(6,1,1,'notification-blogs-comment-comment','blogs20'),(7,1,1,'notification-content-expiration-date','content'),(8,1,1,'notification-content-unpublish-page','content'),(9,1,1,'notification-dispatches-release','dispatches'),(10,1,1,'notification-dispatches-subscribe','dispatches'),(11,1,1,'notification-emarket-status-change','emarket'),(12,1,1,'notification-emarket-new-order','emarket'),(13,1,1,'notification-emarket-invoice','emarket'),(14,1,1,'notification-faq-answer','faq'),(15,1,1,'notification-faq-confirm-user','faq'),(16,1,1,'notification-faq-confirm-admin','faq'),(17,1,1,'notification-forum-new-message','forum'),(18,1,1,'notification-users-new-registration-admin','users'),(19,1,1,'notification-users-restore-password','users'),(20,1,1,'notification-users-registered','users'),(21,1,1,'notification-users-registered-no-activation','users'),(22,1,1,'notification-users-new-password','users');
/*!40000 ALTER TABLE `cms3_mail_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_mail_templates`
--

DROP TABLE IF EXISTS `cms3_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_mail_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name-notification` (`name`,`notification_id`),
  KEY `name` (`name`),
  KEY `notification_id` (`notification_id`),
  CONSTRAINT `mail template to notification` FOREIGN KEY (`notification_id`) REFERENCES `cms3_mail_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_mail_templates`
--

LOCK TABLES `cms3_mail_templates` WRITE;
/*!40000 ALTER TABLE `cms3_mail_templates` DISABLE KEYS */;
INSERT INTO `cms3_mail_templates` VALUES (1,1,'new-record-admin-notify-content','content','<table style=\"max-width: 400px; width: 100%;\">\n  <tbody>\n    <tr>\n      <td>Имя</td>\n      <td>%name%</td>\n    </tr>\n    <tr>\n      <td>Телефон</td>\n      <td>%phone%</td>\n    </tr>\n    <tr>\n      <td>E-Mail</td>\n      <td>%email%</td>\n    </tr>\n    <tr>\n      <td>Комментарий</td>\n      <td>%comment%</td>\n    </tr>\n    <tr>\n      <td>Дата</td>\n      <td>%date%</td>\n    </tr>\n    <tr>\n      <td>Время</td>\n      <td>%time%</td>\n    </tr>\n    <tr>\n      <td>Услуга</td>\n      <td>%service%</td>\n    </tr>\n    <tr>\n      <td>Категория</td>\n      <td>%category%</td>\n    </tr>\n    <tr>\n      <td>Специалист</td>\n      <td>%specialist%</td>\n  </tr>\n  </tbody>\n</table>'),(2,1,'new-record-admin-notify-subject','subject','Запись на приём \\ %category% \\ %service% \\'),(3,2,'new-record-user-notify-content','content','<table style=\"max-width: 400px; width: 100%;\">\n  <tbody>\n    <tr>\n      <td>Дата</td>\n      <td>%date%</td>\n    </tr>\n    <tr>\n      <td>Время</td>\n      <td>%time%</td>\n    </tr>\n    <tr>\n      <td>Услуга</td>\n      <td>%service%</td>\n    </tr>\n    <tr>\n      <td>Категория</td>\n      <td>%category%</td>\n    </tr>\n    <tr>\n      <td>Специалист</td>\n      <td>%specialist%</td>\n    </tr>\n  </tbody>\n</table>'),(4,2,'new-record-user-notify-subject','subject','Вы записались на приём \\ %category% \\ %service% \\'),(5,3,'record-status-changed-user-notify-content','content','<table style=\"max-width: 400px; width: 100%;\">\n  <tbody>\n    <tr>\n      <td>Группа</td>\n      <td>%category%</td>\n    </tr>\n    <tr>\n      <td>Услуга</td>\n      <td>%service%</td>\n    </tr>\n    <tr>\n      <td>Дата</td>\n      <td>%date%&nbsp;</td>\n    </tr>\n    <tr>\n      <td>Время</td>\n      <td>&nbsp;%time%</td>\n    </tr>\n    <tr>\n      <td>Специалист</td>\n      <td>%specialist%</td>\n    </tr>\n    <tr>\n      <td>Статус</td>\n      <td>%new-status%</td>\n    </tr>\n  </tbody>\n</table>'),(6,3,'record-status-changed-user-notify-subject','subject','Ваша заявка на запись \\ %category% \\ %service% \\ была обновлена'),(7,4,'banners-expiration-date-subject','subject','Оповещение о приближении окончания показа баннеров'),(8,4,'banners-expiration-date-content','content','У следующих баннеров истекает срок показа:<br>%parse.banners-expiration-date-item.items%'),(9,4,'banners-expiration-date-item','item','%bannerName% %tillDate% Ссылка для редактирования: <a href=\"%link%\">%link%</a><br>'),(10,5,'blogs-post-comment-subject','subject','Новый ответ на Вашу публикацию'),(11,5,'blogs-post-comment-content','content','%name%, на Вашу публикацию получен новый ответ.<br>\nПосмотреть его Вы можете, перейдя по ссылке:<br><a href=\"%link%\">%link%</a>'),(12,6,'blogs-comment-comment-subject','subject','Новый ответ на Ваш комментарий'),(13,6,'blogs-comment-comment-content','content','%name%, на Ваш комментарий получен новый ответ.<br>\nПосмотреть его Вы можете, перейдя по ссылке:<br><a href=\"%link%\">%link%</a>'),(14,7,'content-expiration-date-subject','subject','Оповещение о приближении окончания публикации'),(15,7,'content-expiration-date-content','content','У страницы <a href=\"%page_link%\">%page_header%</a><br>приближается время потери актуальности<br>Комментарии к публикации: <br><p>%publish_comments%</p>'),(16,8,'content-unpublish-page-subject','subject','Оповещение о снятии страницы с публикации'),(17,8,'content-unpublish-page-content','content','Страница <a href=\"%page_link%\">%page_header%</a><br> снята с публикации<br>\n    Комментарии к публикации: <br />\n    <p>%publish_comments%</p>'),(18,9,'dispatches-release-subject','subject','Новая рассылка: %header%'),(19,9,'dispatches-release-content','content','%parse.dispatches-release-message.messages%<hr><b>Отписаться:</b> Отписаться от рассылки можно <a href=\"%unsubscribe_link%\">по этой ссылке</a>'),(20,9,'dispatches-release-message','message','<h3>%header%</h3>%body%<hr>'),(21,10,'dispatches-subscribe-subject','subject','Подписка на рассылку'),(22,10,'dispatches-subscribe-content','content','<p>Доброго времени суток!</p><p>Вы подписались на рассылку.</p><p>Если вы не хотите ее получать, перейдите по этой ссылке: <a href=\"%unsubscribe_link%\">%unsubscribe_link%</a></p>'),(23,11,'emarket-status-notification-subject','subject','%header%'),(24,11,'emarket-status-notification-content','content','<p>Ваш заказ #%order_number% %status%</p>\n<div>\n  <hr/>\n  <p>Товары:</p>\n  %parse.emarket-status-notification-item.items%\n  <hr/>\n  <p>Всего товаров: %total_amount% шт.</p>\n  <p>На сумму: %total_price% %suffix%. </p>\n</div>\nПосмотреть историю заказов вы можете в своем <a href=\"http://%domain%/emarket/personal/\">личном кабинете</a>.'),(25,11,'emarket-status-notification-receipt','content','<p>Ваш заказ #%order_number% %status%</p>\n<div>\n  <hr/>\n  <p>Товары:</p>\n  %parse.emarket-status-notification-item.items%\n  <hr/>\n  <p>Всего товаров: %total_amount% шт.</p>\n  <p>На сумму: %total_price% %suffix%. </p>\n</div>\n    Посмотреть историю заказов вы можете в своем <a href=\"http://%domain%/emarket/personal/\">личном кабинете</a>.\n    <br/><br/>\n    Квитанцию на оплату вы можете получить, перейдя по <a href=\"http://%domain%/emarket/receipt/%order_id%/%receipt_signature%/\">этой ссылке</a>.'),(26,11,'emarket-status-notification-item','content','<p><a href=\"%link%\">%name%</a></p>\n<p>Цена:  %price% %suffix%. Количество: %amount% шт.</p>'),(27,12,'emarket-neworder-notification-subject','subject','%header%'),(28,12,'emarket-neworder-notification-content','content','Поступил новый заказ #%order_number% (<a href=\"http://%domain%/admin/emarket/order_edit/%order_id%/\">Просмотр</a>)\n    <br/><br/>\n<div>\n  <hr/>\n  <p>Товары:</p>\n  %parse.emarket-neworder-notification-item.items%\n  <hr/>\n  <p>Всего товаров: %total_amount% шт.</p>\n  <p>На сумму: %total_price% %suffix%. </p>\n</div>\n\n<div>\n  <p>Информация о покупателе:</p>\n  <p>Имя: %first_name%</p>\n  <p>Фамилия: %last_name%</p>\n  <p>email: %email%</p>\n  <p>Телефон: %phone%</p>\n\n  <p>Способ доставки: %delivery%</p>\n  <p>Адрес доставки: %address%</p>\n</div>\n\n  <p>Способ оплаты: %payment_type%</p>\n  <p>Статус оплаты: %payment_status%</p>'),(29,12,'emarket-neworder-notification-item','content','<p><a href=\"%link%\">%name%</a></p>\n<p>Цена:  %price% %suffix%. Количество: %amount% шт.</p>'),(30,13,'emarket-invoice-subject','subject','На сайте %domain% успешно сформирован счет'),(31,13,'emarket-invoice-content','content','Вы можете распечатать счет для юридических лиц, перейдя по следующей ссылке:\n    <p>\n      <a href=\"http://%domain%%invoice_link%\">http://%domain%%invoice_link%</a>\n    </p>'),(32,14,'faq-answer-subject','subject','[#%ticket%] Ответ на Ваш вопрос'),(33,14,'faq-answer-content','content','Здравствуйте, <br /><br />\n\nОтвет на Ваш вопрос Вы можете прочитать по следующему адресу:<br />\n<a href=\"%question_link%\">%question_link%</a><br />\n\n<br /><hr />\nС уважением, <br />\nАдминистрация сайта <b>%domain%</b>'),(34,15,'faq-confirm-user-subject','subject','Спасибо за Ваш вопрос'),(35,15,'faq-confirm-user-content','content','Вашему вопросу присвоен тикет #%ticket% <br />\nМы ответим Вам в ближайшее время.<br />\n<br /><hr />\nС уважением, <br />\nАдминистрация сайта <b>%domain%</b>'),(36,16,'faq-confirm-admin-subject','subject','Новый вопрос в FAQ'),(37,16,'faq-confirm-admin-content','content','В базу знаний поступил новый вопрос:<br />\n<a href=\"%question_link%\">%question_link%</a><br />\n<hr />\n%question%\n<hr />'),(38,17,'forum-new-message-subject','subject','Новое сообщение на форуме'),(39,17,'forum-new-message-content','content','<h1>%h1%</h1>\n%message%'),(40,18,'users-new-registration-admin-subject','subject','Зарегистрировался новый пользователь'),(41,18,'users-new-registration-admin-content','content','<p>Зарегистрировался новый пользователь \"%login%\".</p>'),(42,19,'users-restore-password-subject','subject','Восстановление пароля'),(43,19,'users-restore-password-content','content','<p>\n    Здравствуйте!<br />\n    Кто-то, возможно Вы, пытается восстановить пароль для пользователя \"%login%\" на сайте <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n\n\n  <p>\n    Если это не Вы, просто проигнорируйте данное письмо.\n  </p>\n\n  <p>\n    Если Вы действительно хотите восстановить пароль, кликните по этой ссылке:<br />\n    <a href=\"%restore_link%\">%restore_link%</a>\n  </p>\n\n  <p>\n    С уважением,<br />\n    <b>Администрация сайта <a href=\"http://%domain%\">%domain%</a></b>\n  </p>'),(44,20,'users-registered-subject','subject','Регистрация на UMI.CMS Demo Site'),(45,20,'users-registered-content','content','<p>\n    Здравствуйте, %lname% %fname% %father_name%, <br />\n    Вы зарегистрировались на сайте <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n\n\n  <p>\n    Логин: %login%<br />\n    Пароль: %password%\n  </p>\n\n\n  <p>\n    <div class=\"notice\">\n      Чтобы активировать Ваш аккаунт, необходимо перейти по ссылке, либо скопировать ее в адресную строку браузера:<br />\n      <a href=\"%activate_link%\">%activate_link%</a>\n    </div>\n  </p>'),(46,21,'users-registered-no-activation-subject','subject','Регистрация на сайте %domain%'),(47,21,'users-registered-no-activation-content','content','<p>\n    Здравствуйте, %lname% %fname% %father_name%, <br />\n    Вы зарегистрировались на сайте <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n  <p>\n    Логин: %login%<br />\n    Пароль: %password%\n  </p>'),(48,22,'users-new-password-subject','subject','Новый пароль для сайта'),(49,22,'users-new-password-content','content','<p>\n    Здравствуйте!<br />\n\n    Ваш новый пароль от сайта <a href=\"http://%domain%\">%domain%</a>.\n  </p>\n\n\n  <p>\n    Логин:  %login%<br />\n    Пароль: %password%\n  </p>\n\n  <p>\n    С уважением,<br />\n    <b>Администрация сайта <a href=\"http://%domain%\">%domain%</a></b>\n  </p>');
/*!40000 ALTER TABLE `cms3_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_mail_variables`
--

DROP TABLE IF EXISTS `cms3_mail_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_mail_variables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int unsigned NOT NULL,
  `variable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_name` (`variable`),
  KEY `template_name` (`template_id`),
  CONSTRAINT `mail variable to template` FOREIGN KEY (`template_id`) REFERENCES `cms3_mail_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_mail_variables`
--

LOCK TABLES `cms3_mail_variables` WRITE;
/*!40000 ALTER TABLE `cms3_mail_variables` DISABLE KEYS */;
INSERT INTO `cms3_mail_variables` VALUES (1,1,'category'),(2,1,'service'),(3,1,'name'),(4,1,'phone'),(5,1,'email'),(6,1,'comment'),(7,1,'date'),(8,1,'time'),(9,1,'specialist'),(10,2,'category'),(11,2,'service'),(12,3,'category'),(13,3,'service'),(14,3,'date'),(15,3,'time'),(16,3,'specialist'),(17,4,'category'),(18,4,'service'),(19,5,'category'),(20,5,'service'),(21,5,'date'),(22,5,'time'),(23,5,'specialist'),(24,5,'new-status'),(25,6,'category'),(26,6,'service'),(27,8,'parse.banners-expiration-date-item.items'),(28,9,'bannerName'),(29,9,'tillDate'),(30,9,'link'),(31,10,'name'),(32,10,'link'),(33,11,'name'),(34,11,'link'),(35,12,'name'),(36,12,'link'),(37,13,'name'),(38,13,'link'),(39,15,'page_link'),(40,15,'page_header'),(41,15,'publish_comments'),(42,17,'page_link'),(43,17,'page_header'),(44,17,'publish_comments'),(45,18,'header'),(46,19,'header'),(47,19,'parse.dispatches-release-message.messages'),(48,19,'unsubscribe_link'),(49,20,'header'),(50,20,'id'),(51,20,'body'),(52,22,'unsubscribe_link'),(53,23,'header'),(54,24,'order_id'),(55,24,'order_name'),(56,24,'order_number'),(57,24,'domain'),(58,24,'total_amount'),(59,24,'total_price'),(60,24,'suffix'),(61,24,'parse.emarket-status-notification-item.items'),(62,24,'status'),(63,24,'personal_params'),(64,25,'order_id'),(65,25,'order_name'),(66,25,'order_number'),(67,25,'domain'),(68,25,'total_amount'),(69,25,'total_price'),(70,25,'suffix'),(71,25,'parse.emarket-status-notification-item.items'),(72,25,'status'),(73,25,'personal_params'),(74,25,'receipt_signature'),(75,26,'link'),(76,26,'name'),(77,26,'price'),(78,26,'suffix'),(79,26,'amount'),(80,27,'header'),(81,28,'order_id'),(82,28,'order_name'),(83,28,'order_number'),(84,28,'domain'),(85,28,'total_amount'),(86,28,'total_price'),(87,28,'suffix'),(88,28,'parse.emarket-neworder-notification-item.items'),(89,28,'payment_type'),(90,28,'payment_status'),(91,28,'first_name'),(92,28,'last_name'),(93,28,'email'),(94,28,'phone'),(95,28,'delivery'),(96,28,'address'),(97,29,'link'),(98,29,'name'),(99,29,'price'),(100,29,'suffix'),(101,29,'amount'),(102,30,'domain'),(103,30,'invoice_link'),(104,31,'domain'),(105,31,'invoice_link'),(106,32,'domain'),(107,32,'element_id'),(108,32,'author_id'),(109,32,'question_link'),(110,32,'ticket'),(111,33,'domain'),(112,33,'element_id'),(113,33,'author_id'),(114,33,'question_link'),(115,33,'ticket'),(116,34,'domain'),(117,34,'question'),(118,34,'ticket'),(119,35,'domain'),(120,35,'question'),(121,35,'ticket'),(122,36,'domain'),(123,36,'question'),(124,36,'question_link'),(125,37,'domain'),(126,37,'question'),(127,37,'question_link'),(128,39,'h1'),(129,39,'message'),(130,39,'unsubscribe_link'),(131,40,'user_id'),(132,40,'login'),(133,41,'user_id'),(134,41,'login'),(135,42,'domain'),(136,42,'restore_link'),(137,42,'email'),(138,42,'login'),(139,43,'domain'),(140,43,'restore_link'),(141,43,'email'),(142,43,'login'),(143,44,'user_id'),(144,44,'domain'),(145,44,'login'),(146,44,'activate_link'),(147,44,'password'),(148,44,'lname'),(149,44,'fname'),(150,44,'father_name'),(151,45,'user_id'),(152,45,'domain'),(153,45,'login'),(154,45,'activate_link'),(155,45,'password'),(156,45,'lname'),(157,45,'fname'),(158,45,'father_name'),(159,46,'user_id'),(160,46,'domain'),(161,46,'login'),(162,46,'activate_link'),(163,46,'password'),(164,46,'lname'),(165,46,'fname'),(166,46,'father_name'),(167,47,'user_id'),(168,47,'domain'),(169,47,'login'),(170,47,'activate_link'),(171,47,'password'),(172,47,'lname'),(173,47,'fname'),(174,47,'father_name'),(175,48,'domain'),(176,48,'login'),(177,48,'password'),(178,49,'domain'),(179,49,'login'),(180,49,'password');
/*!40000 ALTER TABLE `cms3_mail_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_messages`
--

DROP TABLE IF EXISTS `cms3_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `sender_id` int unsigned DEFAULT NULL,
  `create_time` int NOT NULL,
  `type` enum('private','sys-event','sys-log') NOT NULL,
  `priority` int DEFAULT '0',
  `is_sended` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `create_time` (`create_time`),
  KEY `priority` (`priority`),
  KEY `type` (`type`),
  KEY `is_sended` (`is_sended`),
  KEY `FK_Messages to user relation` (`sender_id`),
  CONSTRAINT `FK_Messages to user relation` FOREIGN KEY (`sender_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_messages`
--

LOCK TABLES `cms3_messages` WRITE;
/*!40000 ALTER TABLE `cms3_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_messages_inbox`
--

DROP TABLE IF EXISTS `cms3_messages_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_messages_inbox` (
  `message_id` int unsigned DEFAULT NULL,
  `recipient_id` int unsigned DEFAULT NULL,
  `is_opened` int DEFAULT '0',
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `is_opened` (`is_opened`),
  KEY `FK_MessagesInbox to Messages` (`message_id`),
  KEY `FK_MessagesInbox to User` (`recipient_id`),
  CONSTRAINT `FK_MessagesInbox to Messages` FOREIGN KEY (`message_id`) REFERENCES `cms3_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MessagesInbox to User` FOREIGN KEY (`recipient_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_messages_inbox`
--

LOCK TABLES `cms3_messages_inbox` WRITE;
/*!40000 ALTER TABLE `cms3_messages_inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_messages_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_content`
--

DROP TABLE IF EXISTS `cms3_object_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_content` (
  `obj_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `int_val` bigint DEFAULT NULL,
  `varchar_val` varchar(255) DEFAULT NULL,
  `text_val` mediumtext,
  `rel_val` int unsigned DEFAULT NULL,
  `tree_val` int unsigned DEFAULT NULL,
  `float_val` double DEFAULT NULL,
  KEY `Content to object relation_FK` (`obj_id`),
  KEY `Contents field id relation_FK` (`field_id`),
  KEY `Relation value reference_FK` (`rel_val`),
  KEY `content2tree_FK` (`tree_val`),
  KEY `int_val` (`int_val`),
  KEY `varchar_val` (`varchar_val`),
  KEY `float_val` (`float_val`),
  KEY `text_val` (`text_val`(8)),
  KEY `K_Complex_FieldIdAndRelVal` (`field_id`,`rel_val`),
  KEY `K_Complex_FieldIdAndTreeVal` (`field_id`,`tree_val`),
  KEY `K_Complex_ObjIdAndFieldId` (`obj_id`,`field_id`),
  CONSTRAINT `FK_Content to object relation` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_content2tree` FOREIGN KEY (`tree_val`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Contents field id relation` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relation value reference` FOREIGN KEY (`rel_val`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_content`
--

LOCK TABLES `cms3_object_content` WRITE;
/*!40000 ALTER TABLE `cms3_object_content` DISABLE KEYS */;
INSERT INTO `cms3_object_content` VALUES (1,76,NULL,'Демонстрационный магазин UMI.CMS',NULL,NULL,NULL,NULL),(1,77,1,NULL,NULL,NULL,NULL,NULL),(1,73,NULL,'vkontakte',NULL,NULL,NULL,NULL),(6,29,NULL,'low',NULL,NULL,NULL,NULL),(7,29,NULL,'normal',NULL,NULL,NULL,NULL),(8,29,NULL,'high',NULL,NULL,NULL,NULL),(9,30,NULL,'US',NULL,NULL,NULL,NULL),(10,30,NULL,'RU',NULL,NULL,NULL,NULL),(179,34,NULL,'item',NULL,NULL,NULL,NULL),(179,60,NULL,'Скидки этого типа могут быть применены к товарам, либо разделам в каталоге',NULL,NULL,NULL,NULL),(180,34,NULL,'order',NULL,NULL,NULL,NULL),(180,60,NULL,'Данный тип скидок используется для расчета итоговой цены заказа',NULL,NULL,NULL,NULL),(181,79,NULL,'Супервайзеры',NULL,NULL,NULL,NULL),(182,210,1,NULL,NULL,NULL,NULL,NULL),(182,211,1445595536,NULL,NULL,NULL,NULL,NULL),(182,215,0,NULL,NULL,NULL,NULL,NULL),(182,218,NULL,'content,users,emarket,catalog,data,trash',NULL,NULL,NULL,NULL),(183,34,NULL,'bonus',NULL,NULL,NULL,NULL),(183,60,NULL,'Зачисление бонусов за оплаченный заказ',NULL,NULL,NULL,NULL),(184,61,NULL,'proc',NULL,NULL,NULL,NULL),(184,62,56,NULL,NULL,NULL,NULL,NULL),(184,64,NULL,'emarket-discountmodificator-768',NULL,NULL,NULL,NULL),(185,236,1,NULL,NULL,NULL,NULL,NULL),(186,66,NULL,'items',NULL,NULL,NULL,NULL),(186,69,NULL,'emarket-discountrule-777',NULL,NULL,NULL,NULL),(187,87,NULL,'digital',NULL,NULL,NULL,NULL),(188,87,NULL,'optioned',NULL,NULL,NULL,NULL),(189,132,NULL,'self',NULL,NULL,NULL,NULL),(189,134,NULL,'emarket-delivery-783',NULL,NULL,NULL,NULL),(190,132,NULL,'courier',NULL,NULL,NULL,NULL),(190,134,NULL,'emarket-delivery-784',NULL,NULL,NULL,NULL),(191,112,NULL,'receipt',NULL,NULL,NULL,NULL),(191,114,NULL,'emarket-payment-791',NULL,NULL,NULL,NULL),(192,40,NULL,'canceled',NULL,NULL,NULL,NULL),(192,111,50,NULL,NULL,NULL,NULL,NULL),(193,40,NULL,'rejected',NULL,NULL,NULL,NULL),(193,111,40,NULL,NULL,NULL,NULL,NULL),(194,40,NULL,'payment',NULL,NULL,NULL,NULL),(194,111,60,NULL,NULL,NULL,NULL,NULL),(195,40,NULL,'delivery',NULL,NULL,NULL,NULL),(195,111,70,NULL,NULL,NULL,NULL,NULL),(196,40,NULL,'waiting',NULL,NULL,NULL,NULL),(196,111,100,NULL,NULL,NULL,NULL,NULL),(197,40,NULL,'accepted',NULL,NULL,NULL,NULL),(197,111,80,NULL,NULL,NULL,NULL,NULL),(198,40,NULL,'ready',NULL,NULL,NULL,NULL),(198,111,30,NULL,NULL,NULL,NULL,NULL),(199,40,NULL,'waiting_shipping',NULL,NULL,NULL,NULL),(199,111,40,NULL,NULL,NULL,NULL,NULL),(200,40,NULL,'shipping',NULL,NULL,NULL,NULL),(200,111,50,NULL,NULL,NULL,NULL,NULL),(201,40,NULL,'ready',NULL,NULL,NULL,NULL),(201,111,60,NULL,NULL,NULL,NULL,NULL),(202,40,NULL,'initialized',NULL,NULL,NULL,NULL),(202,111,40,NULL,NULL,NULL,NULL,NULL),(203,40,NULL,'validated',NULL,NULL,NULL,NULL),(203,111,60,NULL,NULL,NULL,NULL,NULL),(204,40,NULL,'declined',NULL,NULL,NULL,NULL),(204,111,70,NULL,NULL,NULL,NULL,NULL),(205,40,NULL,'accepted',NULL,NULL,NULL,NULL),(205,111,50,NULL,NULL,NULL,NULL,NULL),(206,66,NULL,'dateRange',NULL,NULL,NULL,NULL),(206,69,NULL,'emarket-discountrule-794',NULL,NULL,NULL,NULL),(207,66,NULL,'orderPrice',NULL,NULL,NULL,NULL),(207,69,NULL,'emarket-discountrule-795',NULL,NULL,NULL,NULL),(208,66,NULL,'allOrdersPrices',NULL,NULL,NULL,NULL),(208,69,NULL,'emarket-discountrule-796',NULL,NULL,NULL,NULL),(209,66,NULL,'userGroups',NULL,NULL,NULL,NULL),(209,69,NULL,'emarket-discountrule-797',NULL,NULL,NULL,NULL),(210,66,NULL,'users',NULL,NULL,NULL,NULL),(210,67,57,NULL,NULL,NULL,NULL,NULL),(210,69,NULL,'emarket-discountrule-798',NULL,NULL,NULL,NULL),(211,66,NULL,'relatedItems',NULL,NULL,NULL,NULL),(211,69,NULL,'emarket-discountrule-799',NULL,NULL,NULL,NULL),(212,61,NULL,'absolute',NULL,NULL,NULL,NULL),(212,64,NULL,'emarket-discountmodificator-800',NULL,NULL,NULL,NULL),(213,112,NULL,'payonline',NULL,NULL,NULL,NULL),(213,114,NULL,'emarket-payment-801',NULL,NULL,NULL,NULL),(214,112,NULL,'courier',NULL,NULL,NULL,NULL),(214,114,NULL,'emarket-payment-802',NULL,NULL,NULL,NULL),(215,31,1,NULL,NULL,NULL,NULL,NULL),(216,31,2,NULL,NULL,NULL,NULL,NULL),(217,31,3,NULL,NULL,NULL,NULL,NULL),(218,31,4,NULL,NULL,NULL,NULL,NULL),(219,132,NULL,'russianpost',NULL,NULL,NULL,NULL),(219,134,NULL,'emarket-delivery-808',NULL,NULL,NULL,NULL),(220,112,NULL,'robox',NULL,NULL,NULL,NULL),(220,114,NULL,'emarket-payment-812',NULL,NULL,NULL,NULL),(222,32,0,NULL,NULL,NULL,NULL,NULL),(223,32,1,NULL,NULL,NULL,NULL,NULL),(224,32,2,NULL,NULL,NULL,NULL,NULL),(225,32,3,NULL,NULL,NULL,NULL,NULL),(226,32,4,NULL,NULL,NULL,NULL,NULL),(227,32,5,NULL,NULL,NULL,NULL,NULL),(228,32,6,NULL,NULL,NULL,NULL,NULL),(229,32,7,NULL,NULL,NULL,NULL,NULL),(230,32,8,NULL,NULL,NULL,NULL,NULL),(231,32,9,NULL,NULL,NULL,NULL,NULL),(232,32,10,NULL,NULL,NULL,NULL,NULL),(233,32,11,NULL,NULL,NULL,NULL,NULL),(234,32,12,NULL,NULL,NULL,NULL,NULL),(235,32,13,NULL,NULL,NULL,NULL,NULL),(236,32,14,NULL,NULL,NULL,NULL,NULL),(237,32,15,NULL,NULL,NULL,NULL,NULL),(238,32,16,NULL,NULL,NULL,NULL,NULL),(239,32,17,NULL,NULL,NULL,NULL,NULL),(240,32,18,NULL,NULL,NULL,NULL,NULL),(241,32,19,NULL,NULL,NULL,NULL,NULL),(242,32,20,NULL,NULL,NULL,NULL,NULL),(243,32,21,NULL,NULL,NULL,NULL,NULL),(244,32,22,NULL,NULL,NULL,NULL,NULL),(245,32,23,NULL,NULL,NULL,NULL,NULL),(246,32,1,NULL,NULL,NULL,NULL,NULL),(247,32,2,NULL,NULL,NULL,NULL,NULL),(248,32,3,NULL,NULL,NULL,NULL,NULL),(249,32,4,NULL,NULL,NULL,NULL,NULL),(250,32,5,NULL,NULL,NULL,NULL,NULL),(251,32,6,NULL,NULL,NULL,NULL,NULL),(252,32,7,NULL,NULL,NULL,NULL,NULL),(253,112,NULL,'invoice',NULL,NULL,NULL,NULL),(253,114,NULL,'emarket-payment-816',NULL,NULL,NULL,NULL),(279,112,NULL,'payanyway',NULL,NULL,NULL,NULL),(279,114,NULL,'emarket-payment-payanyway',NULL,NULL,NULL,NULL),(280,112,NULL,'dengionline',NULL,NULL,NULL,NULL),(280,114,NULL,'emarket-payment-dengionline',NULL,NULL,NULL,NULL),(281,40,NULL,'editing',NULL,NULL,NULL,NULL),(281,111,90,NULL,NULL,NULL,NULL,NULL),(296,41,NULL,'android',NULL,NULL,NULL,NULL),(297,41,NULL,'ios',NULL,NULL,NULL,NULL),(298,40,NULL,'not_defined',NULL,NULL,NULL,NULL),(298,111,30,NULL,NULL,NULL,NULL,NULL),(299,40,NULL,'not_defined',NULL,NULL,NULL,NULL),(299,111,30,NULL,NULL,NULL,NULL,NULL),(300,23,NULL,'cp1251',NULL,NULL,NULL,NULL),(301,23,NULL,'utf-8',NULL,NULL,NULL,NULL),(304,112,NULL,'paypal',NULL,NULL,NULL,NULL),(304,114,NULL,'emarket-payment-paypal',NULL,NULL,NULL,NULL),(307,132,NULL,'ApiShip',NULL,NULL,NULL,NULL),(307,134,NULL,'emarket-delivery-842',NULL,NULL,NULL,NULL),(308,40,NULL,'canceled',NULL,NULL,NULL,NULL),(308,111,50,NULL,NULL,NULL,NULL,NULL),(309,40,NULL,'return',NULL,NULL,NULL,NULL),(309,111,60,NULL,NULL,NULL,NULL,NULL),(310,30,NULL,'AU',NULL,NULL,NULL,NULL),(311,30,NULL,'AT',NULL,NULL,NULL,NULL),(312,30,NULL,'AZ',NULL,NULL,NULL,NULL),(313,30,NULL,'AX',NULL,NULL,NULL,NULL),(314,30,NULL,'AL',NULL,NULL,NULL,NULL),(315,30,NULL,'DZ',NULL,NULL,NULL,NULL),(316,30,NULL,'AS',NULL,NULL,NULL,NULL),(317,30,NULL,'AI',NULL,NULL,NULL,NULL),(318,30,NULL,'AO',NULL,NULL,NULL,NULL),(319,30,NULL,'AD',NULL,NULL,NULL,NULL),(320,30,NULL,'AQ',NULL,NULL,NULL,NULL),(321,30,NULL,'AG',NULL,NULL,NULL,NULL),(322,30,NULL,'AR',NULL,NULL,NULL,NULL),(323,30,NULL,'AM',NULL,NULL,NULL,NULL),(324,30,NULL,'AW',NULL,NULL,NULL,NULL),(325,30,NULL,'AF',NULL,NULL,NULL,NULL),(326,30,NULL,'BS',NULL,NULL,NULL,NULL),(327,30,NULL,'BD',NULL,NULL,NULL,NULL),(328,30,NULL,'BB',NULL,NULL,NULL,NULL),(329,30,NULL,'BH',NULL,NULL,NULL,NULL),(330,30,NULL,'BY',NULL,NULL,NULL,NULL),(331,30,NULL,'BZ',NULL,NULL,NULL,NULL),(332,30,NULL,'BE',NULL,NULL,NULL,NULL),(333,30,NULL,'BJ',NULL,NULL,NULL,NULL),(334,30,NULL,'BM',NULL,NULL,NULL,NULL),(335,30,NULL,'BG',NULL,NULL,NULL,NULL),(336,30,NULL,'BO',NULL,NULL,NULL,NULL),(337,30,NULL,'BQ',NULL,NULL,NULL,NULL),(338,30,NULL,'BA',NULL,NULL,NULL,NULL),(339,30,NULL,'BW',NULL,NULL,NULL,NULL),(340,30,NULL,'BR',NULL,NULL,NULL,NULL),(341,30,NULL,'IO',NULL,NULL,NULL,NULL),(342,30,NULL,'BN',NULL,NULL,NULL,NULL),(343,30,NULL,'BF',NULL,NULL,NULL,NULL),(344,30,NULL,'BI',NULL,NULL,NULL,NULL),(345,30,NULL,'BT',NULL,NULL,NULL,NULL),(346,30,NULL,'VU',NULL,NULL,NULL,NULL),(347,30,NULL,'VA',NULL,NULL,NULL,NULL),(348,30,NULL,'GB',NULL,NULL,NULL,NULL),(349,30,NULL,'HU',NULL,NULL,NULL,NULL),(350,30,NULL,'VE',NULL,NULL,NULL,NULL),(351,30,NULL,'VG',NULL,NULL,NULL,NULL),(352,30,NULL,'VI',NULL,NULL,NULL,NULL),(353,30,NULL,'UM',NULL,NULL,NULL,NULL),(354,30,NULL,'TL',NULL,NULL,NULL,NULL),(355,30,NULL,'VN',NULL,NULL,NULL,NULL),(356,30,NULL,'GA',NULL,NULL,NULL,NULL),(357,30,NULL,'HT',NULL,NULL,NULL,NULL),(358,30,NULL,'GY',NULL,NULL,NULL,NULL),(359,30,NULL,'GM',NULL,NULL,NULL,NULL),(360,30,NULL,'GH',NULL,NULL,NULL,NULL),(361,30,NULL,'GP',NULL,NULL,NULL,NULL),(362,30,NULL,'GT',NULL,NULL,NULL,NULL),(363,30,NULL,'GN',NULL,NULL,NULL,NULL),(364,30,NULL,'GW',NULL,NULL,NULL,NULL),(365,30,NULL,'DE',NULL,NULL,NULL,NULL),(366,30,NULL,'GG',NULL,NULL,NULL,NULL),(367,30,NULL,'GI',NULL,NULL,NULL,NULL),(368,30,NULL,'HN',NULL,NULL,NULL,NULL),(369,30,NULL,'HK',NULL,NULL,NULL,NULL),(370,30,NULL,'GD',NULL,NULL,NULL,NULL),(371,30,NULL,'GL',NULL,NULL,NULL,NULL),(372,30,NULL,'GR',NULL,NULL,NULL,NULL),(373,30,NULL,'GE',NULL,NULL,NULL,NULL),(374,30,NULL,'GU',NULL,NULL,NULL,NULL),(375,30,NULL,'DK',NULL,NULL,NULL,NULL),(376,30,NULL,'JE',NULL,NULL,NULL,NULL),(377,30,NULL,'DJ',NULL,NULL,NULL,NULL),(378,30,NULL,'DG',NULL,NULL,NULL,NULL),(379,30,NULL,'DM',NULL,NULL,NULL,NULL),(380,30,NULL,'DO',NULL,NULL,NULL,NULL),(381,30,NULL,'EG',NULL,NULL,NULL,NULL),(382,30,NULL,'ZM',NULL,NULL,NULL,NULL),(383,30,NULL,'EH',NULL,NULL,NULL,NULL),(384,30,NULL,'ZW',NULL,NULL,NULL,NULL),(385,30,NULL,'IL',NULL,NULL,NULL,NULL),(386,30,NULL,'IN',NULL,NULL,NULL,NULL),(387,30,NULL,'ID',NULL,NULL,NULL,NULL),(388,30,NULL,'JO',NULL,NULL,NULL,NULL),(389,30,NULL,'IQ',NULL,NULL,NULL,NULL),(390,30,NULL,'IR',NULL,NULL,NULL,NULL),(391,30,NULL,'IE',NULL,NULL,NULL,NULL),(392,30,NULL,'IS',NULL,NULL,NULL,NULL),(393,30,NULL,'ES',NULL,NULL,NULL,NULL),(394,30,NULL,'IT',NULL,NULL,NULL,NULL),(395,30,NULL,'YE',NULL,NULL,NULL,NULL),(396,30,NULL,'CV',NULL,NULL,NULL,NULL),(397,30,NULL,'KZ',NULL,NULL,NULL,NULL),(398,30,NULL,'KY',NULL,NULL,NULL,NULL),(399,30,NULL,'KH',NULL,NULL,NULL,NULL),(400,30,NULL,'CM',NULL,NULL,NULL,NULL),(401,30,NULL,'CA',NULL,NULL,NULL,NULL),(402,30,NULL,'IC',NULL,NULL,NULL,NULL),(403,30,NULL,'QA',NULL,NULL,NULL,NULL),(404,30,NULL,'KE',NULL,NULL,NULL,NULL),(405,30,NULL,'CY',NULL,NULL,NULL,NULL),(406,30,NULL,'KG',NULL,NULL,NULL,NULL),(407,30,NULL,'KI',NULL,NULL,NULL,NULL),(408,30,NULL,'CN',NULL,NULL,NULL,NULL),(409,30,NULL,'KP',NULL,NULL,NULL,NULL),(410,30,NULL,'CC',NULL,NULL,NULL,NULL),(411,30,NULL,'CO',NULL,NULL,NULL,NULL),(412,30,NULL,'KM',NULL,NULL,NULL,NULL),(413,30,NULL,'CG',NULL,NULL,NULL,NULL),(414,30,NULL,'CD',NULL,NULL,NULL,NULL),(415,30,NULL,'XK',NULL,NULL,NULL,NULL),(416,30,NULL,'CR',NULL,NULL,NULL,NULL),(417,30,NULL,'CI',NULL,NULL,NULL,NULL),(418,30,NULL,'CU',NULL,NULL,NULL,NULL),(419,30,NULL,'KW',NULL,NULL,NULL,NULL),(420,30,NULL,'CW',NULL,NULL,NULL,NULL),(421,30,NULL,'LA',NULL,NULL,NULL,NULL),(422,30,NULL,'LV',NULL,NULL,NULL,NULL),(423,30,NULL,'LS',NULL,NULL,NULL,NULL),(424,30,NULL,'LR',NULL,NULL,NULL,NULL),(425,30,NULL,'LB',NULL,NULL,NULL,NULL),(426,30,NULL,'LY',NULL,NULL,NULL,NULL),(427,30,NULL,'LT',NULL,NULL,NULL,NULL),(428,30,NULL,'LI',NULL,NULL,NULL,NULL),(429,30,NULL,'LU',NULL,NULL,NULL,NULL),(430,30,NULL,'MU',NULL,NULL,NULL,NULL),(431,30,NULL,'MR',NULL,NULL,NULL,NULL),(432,30,NULL,'MG',NULL,NULL,NULL,NULL),(433,30,NULL,'YT',NULL,NULL,NULL,NULL),(434,30,NULL,'MO',NULL,NULL,NULL,NULL),(435,30,NULL,'MK',NULL,NULL,NULL,NULL),(436,30,NULL,'MW',NULL,NULL,NULL,NULL),(437,30,NULL,'MY',NULL,NULL,NULL,NULL),(438,30,NULL,'ML',NULL,NULL,NULL,NULL),(439,30,NULL,'MV',NULL,NULL,NULL,NULL),(440,30,NULL,'MT',NULL,NULL,NULL,NULL),(441,30,NULL,'MA',NULL,NULL,NULL,NULL),(442,30,NULL,'MQ',NULL,NULL,NULL,NULL),(443,30,NULL,'MH',NULL,NULL,NULL,NULL),(444,30,NULL,'MX',NULL,NULL,NULL,NULL),(445,30,NULL,'MZ',NULL,NULL,NULL,NULL),(446,30,NULL,'MD',NULL,NULL,NULL,NULL),(447,30,NULL,'MC',NULL,NULL,NULL,NULL),(448,30,NULL,'MN',NULL,NULL,NULL,NULL),(449,30,NULL,'MS',NULL,NULL,NULL,NULL),(450,30,NULL,'MM',NULL,NULL,NULL,NULL),(451,30,NULL,'NA',NULL,NULL,NULL,NULL),(452,30,NULL,'NR',NULL,NULL,NULL,NULL),(453,30,NULL,'NP',NULL,NULL,NULL,NULL),(454,30,NULL,'NE',NULL,NULL,NULL,NULL),(455,30,NULL,'NG',NULL,NULL,NULL,NULL),(456,30,NULL,'NL',NULL,NULL,NULL,NULL),(457,30,NULL,'NI',NULL,NULL,NULL,NULL),(458,30,NULL,'NU',NULL,NULL,NULL,NULL),(459,30,NULL,'NZ',NULL,NULL,NULL,NULL),(460,30,NULL,'NC',NULL,NULL,NULL,NULL),(461,30,NULL,'NO',NULL,NULL,NULL,NULL),(462,30,NULL,'AC',NULL,NULL,NULL,NULL),(463,30,NULL,'IM',NULL,NULL,NULL,NULL),(464,30,NULL,'NF',NULL,NULL,NULL,NULL),(465,30,NULL,'CX',NULL,NULL,NULL,NULL),(466,30,NULL,'SH',NULL,NULL,NULL,NULL),(467,30,NULL,'CK',NULL,NULL,NULL,NULL),(468,30,NULL,'TC',NULL,NULL,NULL,NULL),(469,30,NULL,'AE',NULL,NULL,NULL,NULL),(470,30,NULL,'OM',NULL,NULL,NULL,NULL),(471,30,NULL,'PK',NULL,NULL,NULL,NULL),(472,30,NULL,'PW',NULL,NULL,NULL,NULL),(473,30,NULL,'PS',NULL,NULL,NULL,NULL),(474,30,NULL,'PA',NULL,NULL,NULL,NULL),(475,30,NULL,'PG',NULL,NULL,NULL,NULL),(476,30,NULL,'PY',NULL,NULL,NULL,NULL),(477,30,NULL,'PE',NULL,NULL,NULL,NULL),(478,30,NULL,'PN',NULL,NULL,NULL,NULL),(479,30,NULL,'PL',NULL,NULL,NULL,NULL),(480,30,NULL,'PT',NULL,NULL,NULL,NULL),(481,30,NULL,'PR',NULL,NULL,NULL,NULL),(482,30,NULL,'KR',NULL,NULL,NULL,NULL),(483,30,NULL,'RE',NULL,NULL,NULL,NULL),(484,30,NULL,'RW',NULL,NULL,NULL,NULL),(485,30,NULL,'RO',NULL,NULL,NULL,NULL),(486,30,NULL,'SV',NULL,NULL,NULL,NULL),(487,30,NULL,'WS',NULL,NULL,NULL,NULL),(488,30,NULL,'SM',NULL,NULL,NULL,NULL),(489,30,NULL,'ST',NULL,NULL,NULL,NULL),(490,30,NULL,'SA',NULL,NULL,NULL,NULL),(491,30,NULL,'SZ',NULL,NULL,NULL,NULL),(492,30,NULL,'MP',NULL,NULL,NULL,NULL),(493,30,NULL,'SC',NULL,NULL,NULL,NULL),(494,30,NULL,'BL',NULL,NULL,NULL,NULL),(495,30,NULL,'MF',NULL,NULL,NULL,NULL),(496,30,NULL,'PM',NULL,NULL,NULL,NULL),(497,30,NULL,'SN',NULL,NULL,NULL,NULL),(498,30,NULL,'VC',NULL,NULL,NULL,NULL),(499,30,NULL,'KN',NULL,NULL,NULL,NULL),(500,30,NULL,'LC',NULL,NULL,NULL,NULL),(501,30,NULL,'RS',NULL,NULL,NULL,NULL),(502,30,NULL,'EA',NULL,NULL,NULL,NULL),(503,30,NULL,'SG',NULL,NULL,NULL,NULL),(504,30,NULL,'SX',NULL,NULL,NULL,NULL),(505,30,NULL,'SY',NULL,NULL,NULL,NULL),(506,30,NULL,'SK',NULL,NULL,NULL,NULL),(507,30,NULL,'SI',NULL,NULL,NULL,NULL),(508,30,NULL,'SB',NULL,NULL,NULL,NULL),(509,30,NULL,'SO',NULL,NULL,NULL,NULL),(510,30,NULL,'SD',NULL,NULL,NULL,NULL),(511,30,NULL,'SR',NULL,NULL,NULL,NULL),(512,30,NULL,'SL',NULL,NULL,NULL,NULL),(513,30,NULL,'TJ',NULL,NULL,NULL,NULL),(514,30,NULL,'TH',NULL,NULL,NULL,NULL),(515,30,NULL,'TW',NULL,NULL,NULL,NULL),(516,30,NULL,'TZ',NULL,NULL,NULL,NULL),(517,30,NULL,'TG',NULL,NULL,NULL,NULL),(518,30,NULL,'TK',NULL,NULL,NULL,NULL),(519,30,NULL,'TO',NULL,NULL,NULL,NULL),(520,30,NULL,'TT',NULL,NULL,NULL,NULL),(521,30,NULL,'TA',NULL,NULL,NULL,NULL),(522,30,NULL,'TV',NULL,NULL,NULL,NULL),(523,30,NULL,'TN',NULL,NULL,NULL,NULL),(524,30,NULL,'TM',NULL,NULL,NULL,NULL),(525,30,NULL,'TR',NULL,NULL,NULL,NULL),(526,30,NULL,'UG',NULL,NULL,NULL,NULL),(527,30,NULL,'UZ',NULL,NULL,NULL,NULL),(528,30,NULL,'UA',NULL,NULL,NULL,NULL),(529,30,NULL,'WF',NULL,NULL,NULL,NULL),(530,30,NULL,'UY',NULL,NULL,NULL,NULL),(531,30,NULL,'FO',NULL,NULL,NULL,NULL),(532,30,NULL,'FM',NULL,NULL,NULL,NULL),(533,30,NULL,'FJ',NULL,NULL,NULL,NULL),(534,30,NULL,'PH',NULL,NULL,NULL,NULL),(535,30,NULL,'FI',NULL,NULL,NULL,NULL),(536,30,NULL,'FK',NULL,NULL,NULL,NULL),(537,30,NULL,'FR',NULL,NULL,NULL,NULL),(538,30,NULL,'GF',NULL,NULL,NULL,NULL),(539,30,NULL,'PF',NULL,NULL,NULL,NULL),(540,30,NULL,'TF',NULL,NULL,NULL,NULL),(541,30,NULL,'HR',NULL,NULL,NULL,NULL),(542,30,NULL,'CF',NULL,NULL,NULL,NULL),(543,30,NULL,'TD',NULL,NULL,NULL,NULL),(544,30,NULL,'ME',NULL,NULL,NULL,NULL),(545,30,NULL,'CZ',NULL,NULL,NULL,NULL),(546,30,NULL,'CL',NULL,NULL,NULL,NULL),(547,30,NULL,'CH',NULL,NULL,NULL,NULL),(548,30,NULL,'SE',NULL,NULL,NULL,NULL),(549,30,NULL,'SJ',NULL,NULL,NULL,NULL),(550,30,NULL,'LK',NULL,NULL,NULL,NULL),(551,30,NULL,'EC',NULL,NULL,NULL,NULL),(552,30,NULL,'GQ',NULL,NULL,NULL,NULL),(553,30,NULL,'ER',NULL,NULL,NULL,NULL),(554,30,NULL,'EE',NULL,NULL,NULL,NULL),(555,30,NULL,'ET',NULL,NULL,NULL,NULL),(556,30,NULL,'ZA',NULL,NULL,NULL,NULL),(557,30,NULL,'GS',NULL,NULL,NULL,NULL),(558,30,NULL,'SS',NULL,NULL,NULL,NULL),(559,30,NULL,'JM',NULL,NULL,NULL,NULL),(560,30,NULL,'JP',NULL,NULL,NULL,NULL),(561,112,NULL,'YandexKassa',NULL,NULL,NULL,NULL),(561,114,NULL,'emarket-payment-yandex-kassa',NULL,NULL,NULL,NULL),(562,87,NULL,'custom',NULL,NULL,NULL,NULL),(563,87,NULL,'TradeOffer',NULL,NULL,NULL,NULL),(564,1,NULL,'page_status_publish',NULL,NULL,NULL,NULL),(565,51,1,NULL,NULL,NULL,NULL,NULL),(565,52,NULL,'none',NULL,NULL,NULL,NULL),(565,53,NULL,'none',NULL,NULL,NULL,NULL),(565,54,1105,NULL,NULL,NULL,NULL,NULL),(565,55,0,NULL,NULL,NULL,NULL,NULL),(565,56,NULL,'none',NULL,NULL,NULL,NULL),(566,31,3000,NULL,NULL,NULL,NULL,NULL),(567,57,NULL,'commodity',NULL,NULL,NULL,NULL),(567,53,NULL,'commodity',NULL,NULL,NULL,NULL),(567,58,NULL,'commodity',NULL,NULL,NULL,NULL),(567,59,1,NULL,NULL,NULL,NULL,NULL),(567,55,1,NULL,NULL,NULL,NULL,NULL),(568,57,NULL,'full_prepayment',NULL,NULL,NULL,NULL),(568,53,NULL,'full_prepayment',NULL,NULL,NULL,NULL),(568,58,NULL,'full_prepayment',NULL,NULL,NULL,NULL),(568,59,1,NULL,NULL,NULL,NULL,NULL),(568,55,1,NULL,NULL,NULL,NULL,NULL),(569,1,NULL,'page_status_unpublish',NULL,NULL,NULL,NULL),(570,31,3010,NULL,NULL,NULL,NULL,NULL),(571,51,2,NULL,NULL,NULL,NULL,NULL),(571,52,NULL,'vat0',NULL,NULL,NULL,NULL),(571,53,NULL,'vat0',NULL,NULL,NULL,NULL),(571,54,1104,NULL,NULL,NULL,NULL,NULL),(571,55,1,NULL,NULL,NULL,NULL,NULL),(571,56,NULL,'0',NULL,NULL,NULL,NULL),(572,57,NULL,'excise',NULL,NULL,NULL,NULL),(572,53,NULL,'excise',NULL,NULL,NULL,NULL),(572,58,NULL,'excise',NULL,NULL,NULL,NULL),(572,59,2,NULL,NULL,NULL,NULL,NULL),(572,55,2,NULL,NULL,NULL,NULL,NULL),(573,57,NULL,'partial_prepayment',NULL,NULL,NULL,NULL),(573,53,NULL,'prepayment',NULL,NULL,NULL,NULL),(573,58,NULL,'prepayment',NULL,NULL,NULL,NULL),(573,59,2,NULL,NULL,NULL,NULL,NULL),(573,55,2,NULL,NULL,NULL,NULL,NULL),(574,1,NULL,'page_status_preunpublish',NULL,NULL,NULL,NULL),(575,31,3020,NULL,NULL,NULL,NULL,NULL),(576,51,3,NULL,NULL,NULL,NULL,NULL),(576,52,NULL,'vat10',NULL,NULL,NULL,NULL),(576,53,NULL,'vat10',NULL,NULL,NULL,NULL),(576,54,1103,NULL,NULL,NULL,NULL,NULL),(576,55,2,NULL,NULL,NULL,NULL,NULL),(576,56,NULL,'10',NULL,NULL,NULL,NULL),(577,57,NULL,'job',NULL,NULL,NULL,NULL),(577,53,NULL,'job',NULL,NULL,NULL,NULL),(577,58,NULL,'job',NULL,NULL,NULL,NULL),(577,59,3,NULL,NULL,NULL,NULL,NULL),(577,55,3,NULL,NULL,NULL,NULL,NULL),(578,57,NULL,'advance',NULL,NULL,NULL,NULL),(578,53,NULL,'advance',NULL,NULL,NULL,NULL),(578,58,NULL,'advance',NULL,NULL,NULL,NULL),(578,59,3,NULL,NULL,NULL,NULL,NULL),(578,55,3,NULL,NULL,NULL,NULL,NULL),(579,31,16010,NULL,NULL,NULL,NULL,NULL),(580,51,4,NULL,NULL,NULL,NULL,NULL),(580,52,NULL,'vat20',NULL,NULL,NULL,NULL),(580,53,NULL,'vat20',NULL,NULL,NULL,NULL),(580,54,1102,NULL,NULL,NULL,NULL,NULL),(580,55,6,NULL,NULL,NULL,NULL,NULL),(580,56,NULL,'20',NULL,NULL,NULL,NULL),(581,57,NULL,'service',NULL,NULL,NULL,NULL),(581,53,NULL,'service',NULL,NULL,NULL,NULL),(581,58,NULL,'service',NULL,NULL,NULL,NULL),(581,59,4,NULL,NULL,NULL,NULL,NULL),(581,55,4,NULL,NULL,NULL,NULL,NULL),(582,57,NULL,'full_payment',NULL,NULL,NULL,NULL),(582,53,NULL,'full_payment',NULL,NULL,NULL,NULL),(582,58,NULL,'full_payment',NULL,NULL,NULL,NULL),(582,59,4,NULL,NULL,NULL,NULL,NULL),(582,55,4,NULL,NULL,NULL,NULL,NULL),(583,31,16020,NULL,NULL,NULL,NULL,NULL),(584,51,5,NULL,NULL,NULL,NULL,NULL),(584,52,NULL,'vat110',NULL,NULL,NULL,NULL),(584,53,NULL,'vat110',NULL,NULL,NULL,NULL),(584,54,1107,NULL,NULL,NULL,NULL,NULL),(584,55,4,NULL,NULL,NULL,NULL,NULL),(584,56,NULL,'10/110',NULL,NULL,NULL,NULL),(585,57,NULL,'gambling_bet',NULL,NULL,NULL,NULL),(585,53,NULL,'gambling_bet',NULL,NULL,NULL,NULL),(585,58,NULL,'gambling_bet',NULL,NULL,NULL,NULL),(585,59,5,NULL,NULL,NULL,NULL,NULL),(585,55,5,NULL,NULL,NULL,NULL,NULL),(586,57,NULL,'partial_payment',NULL,NULL,NULL,NULL),(586,53,NULL,'partial_payment',NULL,NULL,NULL,NULL),(586,58,NULL,'partial_payment',NULL,NULL,NULL,NULL),(586,59,5,NULL,NULL,NULL,NULL,NULL),(586,55,5,NULL,NULL,NULL,NULL,NULL),(587,51,6,NULL,NULL,NULL,NULL,NULL),(587,52,NULL,'vat120',NULL,NULL,NULL,NULL),(587,53,NULL,'vat120',NULL,NULL,NULL,NULL),(587,54,1106,NULL,NULL,NULL,NULL,NULL),(587,55,7,NULL,NULL,NULL,NULL,NULL),(587,56,NULL,'20/120',NULL,NULL,NULL,NULL),(588,31,27030,NULL,NULL,NULL,NULL,NULL),(589,57,NULL,'gambling_prize',NULL,NULL,NULL,NULL),(589,53,NULL,'gambling_prize',NULL,NULL,NULL,NULL),(589,58,NULL,'gambling_prize',NULL,NULL,NULL,NULL),(589,59,6,NULL,NULL,NULL,NULL,NULL),(589,55,6,NULL,NULL,NULL,NULL,NULL),(590,57,NULL,'credit',NULL,NULL,NULL,NULL),(590,53,NULL,'credit',NULL,NULL,NULL,NULL),(590,58,NULL,'credit',NULL,NULL,NULL,NULL),(590,59,6,NULL,NULL,NULL,NULL,NULL),(590,55,6,NULL,NULL,NULL,NULL,NULL),(591,31,27020,NULL,NULL,NULL,NULL,NULL),(592,57,NULL,'lottery',NULL,NULL,NULL,NULL),(592,53,NULL,'lottery',NULL,NULL,NULL,NULL),(592,58,NULL,'lottery',NULL,NULL,NULL,NULL),(592,59,7,NULL,NULL,NULL,NULL,NULL),(592,55,7,NULL,NULL,NULL,NULL,NULL),(593,57,NULL,'credit_payment',NULL,NULL,NULL,NULL),(593,53,NULL,'credit_payment',NULL,NULL,NULL,NULL),(593,58,NULL,'credit_payment',NULL,NULL,NULL,NULL),(593,59,7,NULL,NULL,NULL,NULL,NULL),(593,55,7,NULL,NULL,NULL,NULL,NULL),(594,31,47030,NULL,NULL,NULL,NULL,NULL),(595,57,NULL,'lottery_prize',NULL,NULL,NULL,NULL),(595,53,NULL,'lottery_prize',NULL,NULL,NULL,NULL),(595,58,NULL,'lottery_prize',NULL,NULL,NULL,NULL),(595,59,8,NULL,NULL,NULL,NULL,NULL),(595,55,8,NULL,NULL,NULL,NULL,NULL),(596,31,47020,NULL,NULL,NULL,NULL,NULL),(597,57,NULL,'intellectual_activity',NULL,NULL,NULL,NULL),(597,53,NULL,'intellectual_activity',NULL,NULL,NULL,NULL),(597,58,NULL,'intellectual_activity',NULL,NULL,NULL,NULL),(597,59,9,NULL,NULL,NULL,NULL,NULL),(597,55,9,NULL,NULL,NULL,NULL,NULL),(598,31,7030,NULL,NULL,NULL,NULL,NULL),(599,57,NULL,'payment',NULL,NULL,NULL,NULL),(599,53,NULL,'payment',NULL,NULL,NULL,NULL),(599,58,NULL,'payment',NULL,NULL,NULL,NULL),(599,59,10,NULL,NULL,NULL,NULL,NULL),(599,55,10,NULL,NULL,NULL,NULL,NULL),(600,31,7020,NULL,NULL,NULL,NULL,NULL),(601,57,NULL,'agent_commission',NULL,NULL,NULL,NULL),(601,53,NULL,'agent_commission',NULL,NULL,NULL,NULL),(601,58,NULL,'agent_commission',NULL,NULL,NULL,NULL),(601,59,11,NULL,NULL,NULL,NULL,NULL),(601,55,11,NULL,NULL,NULL,NULL,NULL),(602,57,NULL,'composite',NULL,NULL,NULL,NULL),(602,53,NULL,'composite',NULL,NULL,NULL,NULL),(602,58,NULL,'composite',NULL,NULL,NULL,NULL),(602,59,12,NULL,NULL,NULL,NULL,NULL),(602,55,12,NULL,NULL,NULL,NULL,NULL),(603,57,NULL,'another',NULL,NULL,NULL,NULL),(603,53,NULL,'another',NULL,NULL,NULL,NULL),(603,58,NULL,'another',NULL,NULL,NULL,NULL),(603,59,13,NULL,NULL,NULL,NULL,NULL),(603,55,13,NULL,NULL,NULL,NULL,NULL),(604,237,NULL,NULL,NULL,NULL,NULL,12),(606,71,NULL,'commerceML2',NULL,NULL,NULL,NULL),(607,71,NULL,'umiDump20',NULL,NULL,NULL,NULL),(608,71,NULL,'CSV',NULL,NULL,NULL,NULL),(609,71,NULL,'transfer',NULL,NULL,NULL,NULL),(610,72,NULL,'catalogCommerceML',NULL,NULL,NULL,NULL),(611,72,NULL,'offersCommerceML',NULL,NULL,NULL,NULL),(612,72,NULL,'ordersCommerceML',NULL,NULL,NULL,NULL),(613,72,NULL,'YML',NULL,NULL,NULL,NULL),(614,72,NULL,'umiDump20',NULL,NULL,NULL,NULL),(615,72,NULL,'CSV',NULL,NULL,NULL,NULL),(616,72,NULL,'transfer',NULL,NULL,NULL,NULL),(617,72,NULL,'commerceML',NULL,NULL,NULL,NULL),(618,72,NULL,'YandexTurboPages',NULL,NULL,NULL,NULL),(619,204,NULL,'Гость',NULL,NULL,NULL,NULL),(619,205,NULL,'084e0343a0486ff05530df6c705c8bb4',NULL,NULL,NULL,NULL),(619,207,NULL,'anonymous@somedomain.com',NULL,NULL,NULL,NULL),(619,210,1,NULL,NULL,NULL,NULL,NULL),(619,211,0,NULL,NULL,NULL,NULL,NULL),(619,215,0,NULL,NULL,NULL,NULL,NULL),(619,231,NULL,'Посетитель',NULL,NULL,NULL,NULL),(620,79,NULL,'Зарегистрированные пользователи',NULL,NULL,NULL,NULL),(621,35,NULL,'RUR',NULL,NULL,NULL,NULL),(621,36,1,NULL,NULL,NULL,NULL,NULL),(621,37,NULL,NULL,NULL,NULL,NULL,1),(621,39,NULL,'руб',NULL,NULL,NULL,NULL),(622,35,NULL,'USD',NULL,NULL,NULL,NULL),(622,36,1,NULL,NULL,NULL,NULL,NULL),(622,37,NULL,NULL,NULL,NULL,NULL,31.5),(622,38,NULL,'$',NULL,NULL,NULL,NULL),(623,35,NULL,'EUR',NULL,NULL,NULL,NULL),(623,36,1,NULL,NULL,NULL,NULL,NULL),(623,37,NULL,NULL,NULL,NULL,NULL,35),(623,38,NULL,'€',NULL,NULL,NULL,NULL),(182,206,NULL,NULL,NULL,181,NULL,NULL),(184,63,NULL,NULL,NULL,180,NULL,NULL),(184,63,NULL,NULL,NULL,183,NULL,NULL),(184,63,NULL,NULL,NULL,179,NULL,NULL),(186,68,NULL,NULL,NULL,179,NULL,NULL),(206,68,NULL,NULL,NULL,180,NULL,NULL),(206,68,NULL,NULL,NULL,183,NULL,NULL),(206,68,NULL,NULL,NULL,179,NULL,NULL),(207,68,NULL,NULL,NULL,180,NULL,NULL),(207,68,NULL,NULL,NULL,183,NULL,NULL),(208,68,NULL,NULL,NULL,180,NULL,NULL),(208,68,NULL,NULL,NULL,183,NULL,NULL),(208,68,NULL,NULL,NULL,179,NULL,NULL),(209,68,NULL,NULL,NULL,180,NULL,NULL),(209,68,NULL,NULL,NULL,183,NULL,NULL),(209,68,NULL,NULL,NULL,179,NULL,NULL),(210,68,NULL,NULL,NULL,180,NULL,NULL),(210,68,NULL,NULL,NULL,183,NULL,NULL),(210,68,NULL,NULL,NULL,179,NULL,NULL),(211,68,NULL,NULL,NULL,179,NULL,NULL),(212,63,NULL,NULL,NULL,180,NULL,NULL),(212,63,NULL,NULL,NULL,183,NULL,NULL),(212,63,NULL,NULL,NULL,179,NULL,NULL),(604,65,NULL,NULL,NULL,184,NULL,NULL),(605,70,NULL,NULL,NULL,210,NULL,NULL),(182,204,NULL,'sv',NULL,NULL,NULL,NULL),(182,207,NULL,'ab@umisoft.ru',NULL,NULL,NULL,NULL),(182,230,NULL,'Бабейкин',NULL,NULL,NULL,NULL),(182,231,NULL,'Артем',NULL,NULL,NULL,NULL),(182,232,NULL,'Александрович',NULL,NULL,NULL,NULL),(182,205,NULL,'0160907357042913c8a48c0a67b88ab4ee5621e18f68eaffb078e46844335f43',NULL,NULL,NULL,NULL),(624,3,NULL,'Главная',NULL,NULL,NULL,NULL),(625,3,NULL,'Обо мне',NULL,NULL,NULL,NULL),(626,3,NULL,'Фотогалерея',NULL,NULL,NULL,NULL),(628,296,NULL,'Администратор',NULL,NULL,NULL,NULL),(628,297,NULL,'infotest@ast.com',NULL,NULL,NULL,NULL),(629,294,NULL,NULL,'<p>Спасибо за интерес. Мы ответим на ваше письмо в ближайшее время.</p>',NULL,NULL,NULL),(629,295,127,NULL,NULL,NULL,NULL,NULL),(630,2,NULL,'Обратная связь',NULL,NULL,NULL,NULL),(630,280,127,NULL,NULL,NULL,NULL,NULL),(630,3,NULL,'Контакты',NULL,NULL,NULL,NULL),(631,482,NULL,'demolancer',NULL,NULL,NULL,NULL),(632,3,NULL,'Как цвета в дизайне интернет-магазина влияют на продажи',NULL,NULL,NULL,NULL),(632,244,1559906460,NULL,NULL,NULL,NULL,NULL),(633,3,NULL,'Как быстро наполнить и запустить интернет-магазин',NULL,NULL,NULL,NULL),(633,244,1559906460,NULL,NULL,NULL,NULL,NULL),(634,3,NULL,'Самостоятельное продвижение сайта: с чего начать и куда двигаться',NULL,NULL,NULL,NULL),(634,244,1559906520,NULL,NULL,NULL,NULL,NULL),(631,500,NULL,'Столярова Виктория',NULL,NULL,NULL,NULL),(631,503,NULL,'Менеджер интернет-проектов, фрилансер',NULL,NULL,NULL,NULL),(631,505,NULL,NULL,NULL,NULL,5,NULL),(636,509,NULL,'https://vkontakte.ru',NULL,NULL,NULL,NULL),(636,510,NULL,'social_vk',NULL,NULL,NULL,NULL),(638,509,NULL,'https://livejournal.com',NULL,NULL,NULL,NULL),(638,510,NULL,'social_livejournal',NULL,NULL,NULL,NULL),(639,509,NULL,'https://twitter.com',NULL,NULL,NULL,NULL),(639,510,NULL,'social_twitter',NULL,NULL,NULL,NULL),(640,509,NULL,'https://my.mail.ru',NULL,NULL,NULL,NULL),(640,510,NULL,'social_mir',NULL,NULL,NULL,NULL),(641,509,NULL,'https://odnoklassniki.ru',NULL,NULL,NULL,NULL),(641,510,NULL,'social_odnoklassniki',NULL,NULL,NULL,NULL),(625,511,NULL,NULL,'<p style=\"text-align: justify;\">Образование имеет значение. Но не только. Имеет значение самообразование. А вот здесь стоит остановатьися подробнее. В разное время, периодически возвращаясь к этим темам, я интересовалась: веб-дизайном, фотографией, интернет-технологиями, социальными сетями, тайм-менеджментом, психологией, маркетингом... В общем, очень много мне потом пригождается в моей работе.</p>',NULL,NULL,NULL),(625,4,NULL,NULL,'<div class=\"text\">\n<ul>\n<li><strong>Основное образование</strong></li>\n<li>2010 г. Уральский институт экономики, управления и права<br>Экономический факультет<br>Специальность: Экономика и управление на предприятии</li>\n</ul>\n<ul>\n<li><strong>Дополнительное образование</strong><br>2010 г. Уральский центр бизнес-решений<br>Тренинг «Менеджер интернет-проектов»</li>\n<li>2011 г. Тренинг&nbsp;<span>«Финансовое планирование в малом бизнесе»</span></li>\n<li><span>2012 г. Тренинг&nbsp;<span>«Как получить на сайт максимум трафика»</span></span></li>\n</ul>\n</div>',NULL,NULL,NULL),(631,506,NULL,NULL,'<p>Работает на <a href=\"https://www.umi-cms.ru\" rel=\"nofollow\">UMI.CMS</a></p>',NULL,NULL,NULL),(631,512,NULL,'Страница не найдена',NULL,NULL,NULL,NULL),(631,513,NULL,NULL,'<p>Запрашиваемая Вами страница не найдена</p>',NULL,NULL,NULL),(631,514,NULL,'Карта сайта:',NULL,NULL,NULL,NULL),(631,515,NULL,'Поиск',NULL,NULL,NULL,NULL),(626,268,NULL,NULL,'<p><strong>февраль 2010 г. - сентябрь 2011 г.</strong>&nbsp;- помощник инфобизнесмена, решала технические вопросы, занималась интернет-рекламой. Также занималась развитием канала Youtube, обновлением информации на сайте, созданием одностраничников.</p>\r\n<p style=\"text-align: justify;\"><strong>октябрь 2011 г. - по настоящее время</strong>&nbsp;- компания Mobile Apps. Менеджер интернет-проекта. В обязанности входит документооборот, ведение рекламных компаний, общение с клиентами, отслеживание статистики по сайту, email-рассылки, обновление информации на сайте.&nbsp;</p>',NULL,NULL,NULL),(658,3,NULL,'Забочусь о безопасности своих клиентов и обеспечиваю надежную защиту',NULL,NULL,NULL,NULL),(659,3,NULL,'На тренинге повышения квалификации',NULL,NULL,NULL,NULL),(660,3,NULL,'Я люблю своих клиентов и забочусь о них',NULL,NULL,NULL,NULL),(661,3,NULL,'Я использую только современные технологии',NULL,NULL,NULL,NULL),(662,3,NULL,'Мои качества - недостающие звено вашего успеха',NULL,NULL,NULL,NULL),(663,3,NULL,'Лучший в своей профессиональной деятельности',NULL,NULL,NULL,NULL),(664,3,NULL,'Подписание важного договора',NULL,NULL,NULL,NULL),(665,3,NULL,'Оптимизирую расходы клиента',NULL,NULL,NULL,NULL),(666,3,NULL,'Встреча с клиентом',NULL,NULL,NULL,NULL),(667,3,NULL,'Работаю качественно - это помогает мне быстро выполнять свою работу',NULL,NULL,NULL,NULL),(626,511,NULL,NULL,'<p>Я работала всего у двух работодателей, потому что я очень ответственный сотрудник и меня не хотят увольнять. С первым работодателем мы расстались лишь потому, что у нас не воспало время взаимодействия. Да, это имеет значение. Если человек находится в Южной Америке, а я в России, то у нас очень мало времени для продуктивного сотрудничества. Только поэтому я ушла к другому шефу.</p>',NULL,NULL,NULL),(634,4,NULL,NULL,'<p><img src=\"/images/cms/data/blog/ofdz400.jpg\" alt=\"\" /></p>\r\n<p>&laquo;Продвигать или не продвигать?&raquo; &mdash; такого вопроса не должно возникать у владельца сайта для бизнеса. Должен возникать другой вопрос: &laquo;С какой целью продвигать?&raquo;. И ещё один: &laquo;Во что вкладываться &mdash; в контекстную рекламу или в поисковое продвижение?&raquo;. Рассказываем, как начать продвижение сайта с нуля.</p>',NULL,NULL,NULL),(633,4,NULL,NULL,'<p><img src=\"/images/cms/data/blog/umi-12-04-17-6.jpg\" alt=\"\" data-ieditor-id=\"1554392964380_0.17682289931062423\" /></p>\r\n<p>Самый эффективный и простой способ для привлечения новых клиентов &ndash; создание собственного сайта. Но как это сделать, не имея специальных технических навыков и толстого кошелька?</p>',NULL,NULL,NULL),(632,4,NULL,NULL,'<p><img src=\"/images/cms/data/blog/color-1.jpg\" alt=\"\" /></p>\r\n<p>Как подобрать цветовую гамму вашего сайта, чтобы она не только радовала глаз, но и способствовала увеличению прибыли? Об этом читайте в нашей новой статье.</p>',NULL,NULL,NULL),(632,7,NULL,'маркетинг',NULL,NULL,NULL,NULL),(632,7,NULL,'электронная коммерция',NULL,NULL,NULL,NULL),(632,7,NULL,'интернет-магазин',NULL,NULL,NULL,NULL),(632,511,NULL,NULL,'',NULL,NULL,NULL),(632,518,NULL,NULL,'<p>Различные исследования доказывают, что очень часто решение о покупке потребители принимают исходя из того, какие ассоциации и эмоциональные состояния вызвали у них определенные цвета в дизайне сайта. По статистике, 85% покупателей решают купить товар в онлайн-магазине на основе цвета. Чем он привлекательнее, тем больше шансов превратить посетителя в реального клиента. Используйте эти знания, и вы сможете значительно увеличить количество ваших продаж!</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"цвета - 1C-UMI\" src=\"/images/cms/data/blog/color-1.jpg\" alt=\"цвета\" /></p>\r\n<h2>Цвет и продажи: связь есть!</h2>\r\n<p><strong>Красный<span>&nbsp;</span></strong>&mdash; эмоционально интенсивный цвет. Он символизирует<span>&nbsp;</span><em>энергичность</em>,<span>&nbsp;</span><em>мужество</em>,<span>&nbsp;</span><em>силу</em>,<span>&nbsp;</span><em>решительность</em>,<span>&nbsp;</span><em>страсть</em>,<span>&nbsp;</span><em>азарт</em>,<span>&nbsp;</span><em>сексуальность</em>,<span>&nbsp;</span><em>любовь</em>. Красный используют для того, чтобы ускорить решение о покупке. Он также идеален, если вы хотите привлечь внимание пользователей &mdash; элементы красного цвета (надписи, изображения, кнопки call to action) переходят на первый план и побуждают к действию. Этот цвет часто выбирают для оформления интернет-магазинов про продаже вин, подарков, бытовой техники, постельного белья.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"красный - 1C-UMI\" src=\"/images/cms/data/blog/krasnyj.jpg\" alt=\"красный\" /></p>\r\n<p><strong>Оранжевый</strong><span>&nbsp;</span>&mdash; цвет, который отлично подталкивает покупателя к совершению целевого действия. Он отлично привлекает внимание и выделяет важные элементы дизайна. Оранжевый символизирует<span>&nbsp;</span><em>веселье</em>,<span>&nbsp;</span><em>энергию</em>,<span>&nbsp;</span><em>действие</em>,<span>&nbsp;</span><em>успех</em>,<span>&nbsp;</span><em>безопасность</em>,<span>&nbsp;</span><em>бодрость</em>. Это довольно &laquo;активный&raquo; цвет, который, помимо прочего, ассоциируется со здоровой пищей, и по этой причине его часто используют интернет-магазины по продаже продуктов питания, например, продуктов пчеловодства. Кроме того, этот цвет популярен на сайтах онлайн-магазинов пляжной одежды и товаров для беременных.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"оранжевый - 1C-UMI\" src=\"/images/cms/data/blog/oranzhevyj.jpg\" alt=\"оранжевый\" /></p>\r\n<p><strong>Желтый<span>&nbsp;</span></strong>воспринимается как<span>&nbsp;</span><em>молодежный</em>,<span>&nbsp;</span><em>дружелюбный<span>&nbsp;</span></em>и<span>&nbsp;</span><em>оптимистичный<span>&nbsp;</span></em>цвет, который лучше остальных способен захватить внимание пользователей. Значение этого цвета &mdash;<span>&nbsp;</span><em>счастье</em>,<span>&nbsp;</span><em>энергия</em>,<span>&nbsp;</span><em>веселье</em>,<span>&nbsp;</span><em>жизнерадостность</em>,<span>&nbsp;</span><em>подвижность</em>. Его можно использовать, например, для оформления интернет-магазина по продаже продуктов питания, световых приборов, детских товаров, футболок, сувениров и пр.</p>\r\n<p><strong>Зеленый<span>&nbsp;</span></strong>&mdash; спокойный цвет, который является самым простым для глаз. Он ассоциируется с<span>&nbsp;</span><em>гармонией</em>,<span>&nbsp;</span><em>свежестью</em>,<span>&nbsp;</span><em>здоровьем</em>,<span>&nbsp;</span><em>безопасностью</em>,<span>&nbsp;</span><em>отдыхом<span>&nbsp;</span></em>и<span>&nbsp;</span><em>восстановлением</em>. По этой причине его часто используют для интернет-магазинов по продаже натуральной косметики, диетических и эко-продуктов, товаров для беременных, средств для похудения. Кроме того, зеленый также отлично подходит для оформления кнопок call to action.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"зеленый - 1C-UMI\" src=\"/images/cms/data/blog/zelenyj.png\" alt=\"зеленый\" /></p>\r\n<p><strong>Синий<span>&nbsp;</span></strong>и<span>&nbsp;</span><strong>голубой<span>&nbsp;</span></strong>символизируют<span>&nbsp;</span><em>доверие</em>,<span>&nbsp;</span><em>мир</em>,<span>&nbsp;</span><em>спокойствие</em>,<span>&nbsp;</span><em>чистоту</em>,<span>&nbsp;</span><em>верность</em>,<span>&nbsp;</span><em>искренность</em>,<span>&nbsp;</span><em>стабильность</em>,<span>&nbsp;</span><em>уверенность</em>,<span>&nbsp;</span><em>мудрость</em>,<span>&nbsp;</span><em>интеллект</em>. Использование этих цветов окажет на ваших клиентов успокаивающее воздействие и будет способствовать ощущению безмятежности. Синий и голубой &nbsp;идеальны для продвижения товаров для ванны, сантехники, аквариумов, очистительных фильтров, кондиционеров.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"синий - 1C-UMI\" src=\"/images/cms/data/blog/sinij.jpg\" alt=\"синий\" /></p>\r\n<p><strong>Фиолетовый<span>&nbsp;</span></strong>раньше был цветом королей и императоров и по этой причине ассоциируется с<span>&nbsp;</span><em>роскошью<span>&nbsp;</span></em>и<span>&nbsp;</span><em>изобилием</em>. Он также обладает успокаивающим действием, символизирует<span>&nbsp;</span><em>высокое качество<span>&nbsp;</span></em>и<span>&nbsp;</span><em>креативность</em>. Фиолетовый отлично подходит для интернет-магазинов по продаже автомобильных кресел, телевизоров, украшений, товаров для женщин и детей.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"фиолетовый - 1C-UMI\" src=\"/images/cms/data/blog/fioletovyj.jpg\" alt=\"фиолетовый\" /></p>\r\n<p><strong>Розовый<span>&nbsp;</span></strong>&mdash; нежный, романтический цвет. Он ассоциируется с<span>&nbsp;</span><em>любовью</em>,<span>&nbsp;</span><em>теплотой</em>,<span>&nbsp;</span><em>спокойствием</em>. Это идеальный цвет, если вы нацелены на женскую аудиторию или детей. По этой причине розовый широко используют, например, для оформления онлайн-магазинов детских игрушек, косметики, женской или детской одежды.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"розовый - 1C-UMI\" src=\"/images/cms/data/blog/rozovyj.jpg\" alt=\"розовый\" /></p>\r\n<p><strong>Черный<span>&nbsp;</span></strong>ассоциируется с<span>&nbsp;</span><em>изысканностью</em>,<span>&nbsp;</span><em>элегантностью</em>,<span>&nbsp;</span><em>эксклюзивностью</em>,<span>&nbsp;</span><em>авторитетом</em>,<span>&nbsp;</span><em>эффективностью</em>. Если вы являетесь владельцем интернет-магазина по продаже техники, мебели или дорогой одежды, черный вполне вероятно станет для вас самым удачным выбором. Однако чрезмерное использование этого цвета может создать мрачную атмосферу, поэтому его рекомендуется обязательно сочетать со спокойными цветами.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"черный - 1C-UMI\" src=\"/images/cms/data/blog/chernyj.png\" alt=\"черный\" /></p>\r\n<p><strong>Серый<span>&nbsp;</span></strong>&mdash; нейтральный цвет, который символизирует<span>&nbsp;</span><em>стабильность</em>,<span>&nbsp;</span><em>консервативность</em>,<span>&nbsp;</span><em>надежность</em>,<span>&nbsp;</span><em>безопасность</em>,<span>&nbsp;</span><em>интеллект</em>. Он настраивает на серьезный лад и часто используется в оформлении интернет-магазинов с целью продемонстрировать значимость компании на рынке и подчеркнуть высокое качество товаров и услуг. Серый &mdash; хороший выбор для оформления интернет-магазинов по продаже техники, строительных товаров, мебели, аксессуаров для авто, спортивного инвентаря.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"серый - 1C-UMI\" src=\"/images/cms/data/blog/seryj.jpg\" alt=\"серый\" /></p>\r\n<p><strong>Коричневый<span>&nbsp;</span></strong>идеален для создания чувства<span>&nbsp;</span><em>надежности</em>. Он ассоциируется с<span>&nbsp;</span><em>комфортом</em>,<span>&nbsp;</span><em>дружелюбием</em>,<span>&nbsp;</span><em>изысканностью</em>,<span>&nbsp;</span><em>натуральностью</em>. Коричневый &mdash; цвет шоколада и кофе, что делает его прекрасным выбором для интернет-магазинов про продаже кондитерских изделий, кофе, какао. Кроме того, этот цвет отлично подходит для магазинов про продаже деревянной мебели и столярных изделий, книг, товаров для охоты.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"коричневый - 1C-UMI\" src=\"/images/cms/data/blog/korichnevyj.jpg\" alt=\"коричневый\" /></p>\r\n<p>&nbsp;</p>\r\n<h2>Какие цвета выбрать?</h2>\r\n<p>Теперь, когда вы узнали основные ассоциации потребителей с наиболее популярными цветами, важно использовать эти знания в своих интересах. Подумайте, какие ассоциации вы хотите вызвать у посетителей вашего сайта? Какие оттенки лучше всего помогут это осуществить? Именно их и используйте для интернет-магазина &mdash; например, подберите подходящие изображения или кнопку с призывом к действию.</p>\r\n<p>Надеетесь вызвать доверие потенциальных клиентов? Синяя или оранжевая кнопка призыва к действию может быть правильным выбором для вас. Если вы хотите создать намек на утонченность и женственность, хорошим выбором может стать розовый и черный. Кроме того, если товары интернет-магазина ориентированы на женщин, вам стоит поэкспериментировать с использованием фиолетового, розового, синего или зеленого цветов и избегать коричневого и серого. Если же сайт рассчитан на мужскую аудиторию, можно использовать синий, голубой, зеленый и черный. Учитывайте, что мужчинам, как правило, не нравятся оранжевый и фиолетовый.</p>\r\n<h2>Экспериментируйте и анализируйте!</h2>\r\n<p>Для того, чтобы выяснить, какие цвета хотят видеть ваши клиенты, вам поможет A/B-тестирование. Его принцип заключается в создании двух вариантов страницы, отличающихся только одним элементом, например, цветом кнопки call to action. Трафик на сайт делится на две части: 50% случайно выбранных посетителей отправляются на страницу А, остальные 50% &mdash; на страницу В. Далее вы сравниваете и оцениваете количественные показатели работы двух страниц. В результате тестирования вы сможете обнаружить, какие цвета более эффективны.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"цветик - 1C-UMI\" src=\"/images/cms/data/blog/color-2.jpg\" alt=\"цветик\" /></p>\r\n<p>Экспериментируйте и анализируйте, какие цвета по душе посетителям вашего веб-ресурса. Если вы выберете готовые шаблоны интернет-магазинов на сервисе UMI.ru, вы получите практически полностью готовый к продажам сайт с продуманным дизайном, грамотной структурой и приятными глазу цветами. Начните развивать свой бизнес уже сейчас!</p>',NULL,NULL,NULL),(633,7,NULL,'электронная коммерция',NULL,NULL,NULL,NULL),(633,7,NULL,'интернет-магазин',NULL,NULL,NULL,NULL),(633,7,NULL,'контент',NULL,NULL,NULL,NULL),(633,511,NULL,NULL,'',NULL,NULL,NULL),(633,518,NULL,NULL,'<p>Самый эффективный и простой способ для привлечения новых клиентов &ndash; создание собственного сайта. Но как это сделать, не имея специальных технических навыков и толстого кошелька?</p>\r\n<p>1C-UMI решает эту проблему за 5 минут.</p>\r\n<div>\r\n<p>1С-UMI &ndash; сервис, в котором есть все инструменты для создания и продвижения торгового бизнеса в интернете: сайт, домен, хостинг, почта, продвижение и многое-многое другое, необходимое для быстрых и эффективных продаж.</p>\r\n</div>\r\n<p>Другими словами, 1С-UMI делает всю техническую работу за вас. Не нужно нанимать дизайнеров, верстальщиков, программистов &ndash; наш сервис заменяет их всех.</p>\r\n<p>Как это работает? Всё просто.</p>\r\n<h2>Создание сайта</h2>\r\n<p><em>Перед тем, как создавать свой первый интернет-магазин, подумайте, нужен ли вам именно он? Вопрос не праздный, ведь в каждом виде бизнеса работают только определённые интернет-решения. Вы реализуете услуги? Остановитесь на сайте-визитке, Landing Page или корпоративном сайте. Для продажи товаров далеко не всегда нужен онлайн-магазин. Вы предлагаете одну-две позиции? Подойдёт тот же Landing Page. Но если товаров много, то выбирайте только интернет-магазин.</em></p>\r\n<p>Заходите в раздел &laquo;Шаблоны&raquo; на нашем сайте. Перед вами появятся четыре вкладки с разными типами сайтов:</p>\r\n<ul>\r\n<li>сайт специалиста,</li>\r\n<li>сайт компании,</li>\r\n<li>лендинг,</li>\r\n<li>интернет-магазин.</li>\r\n</ul>\r\n<p>Выбирайте &laquo;Интернет-магазин&raquo;. Слева (в серой колонке) появятся 20 категорий с шаблонами соответствующей тематики. Отмечайте тот, который вам больше подходит.</p>\r\n<div>\r\n<p>Если в дальнейшем этот шаблон вам разонравится, вы сможете заменить его на другой, но в рамках выбранного типа сайта. При этом ничего переделывать заново не придётся.</p>\r\n</div>\r\n<div><img title=\"Каталог шаблонов 1С-UMI - 1C-UMI\" src=\"/images/cms/data/blog/umi-12-04-17-1.png\" alt=\"Каталог шаблонов 1С-UMI\" width=\"900\" />\r\n<p><em>1С-UMI &ndash; это более 500 готовых сайтов и интернет-магазинов для различных видов бизнеса</em></p>\r\n</div>\r\n<p>Теперь кликайте на понравившийся вариант и нажимайте кнопку &laquo;Создать сайт&raquo;. Придумайте и напишите адрес магазина (обязательно на латинице без точек и пробелов) и свою электронную почту, прочтите лицензионное соглашение и подтвердите согласие.</p>\r\n<div>\r\n<p>Указывайте только действующий e-mail, на него придут все доступы, необходимые для входа в панель управления сайтом.</p>\r\n</div>\r\n<p>Зарегистрироваться можно и с помощью соцсетей, процедура займёт меньше минуты.</p>\r\n<div><img title=\"Процесс регистрации магазина в 1С-UMI - 1C-UMI\" src=\"/images/cms/data/blog/umi-12-04-17-2.png\" alt=\"Процесс регистрации магазина в 1С-UMI\" width=\"900\" />\r\n<p><em>Зарегистрировать интернет-магазин в 1С-UMI можно с помощью авторизации через соцсети</em></p>\r\n</div>\r\n<p>Вот и всё. Поздравляем, ваш интернет-магазин создан. Теперь осталось пройти модерацию, и он будет опубликован в интернете.</p>\r\n<h2>Что нужно сделать для запустка интернет-магазина</h2>\r\n<div><img title=\"1C-UMI\" src=\"/images/cms/data/blog/umi-12-04-17-3.jpg\" alt=\"\" width=\"900\" /></div>\r\n<h3>Заполнить главную страницу</h3>\r\n<h4>УТП</h4>\r\n<p>Чем должен встречать покупателя интернет-магазин? Конечно, понятным и цепким уникальным торговым предложением: что вы продаёте и почему это привлекательно. Уйти с сайта, на котором ничего непонятно, &mdash; секундное дело. Крестик в правом верхнем углу браузера нажимают чаще других кнопок. Люди сейчас избалованы предложениями. Чтобы понять, нравится им магазин или нет, пользователям хватает трёх секунд. Вы должны &laquo;зацепить&raquo; внимание клиента сразу, как только он попал на ваш сайт.</p>\r\n<div><img title=\"Броское УТП привлекает внимание и вызывает желание сделать покупку. - 1C-UMI\" src=\"/images/cms/data/blog/umi-12-04-17-3-1.png\" alt=\"Броское УТП привлекает внимание и вызывает желание сделать покупку.\" width=\"900\" />\r\n<p><em>Броское УТП привлекает внимание и вызывает желание сделать покупку.</em></p>\r\n</div>\r\n<h4>Товары</h4>\r\n<p>Все группы предлагаемых вами товаров и самые привлекательные позиции должны быть представлены на главной странице. Сгруппируйте товары по характеристикам, типам и видам, чтобы пользователю было легко найти нужный продукт. Расширенные характеристики и описания пользователь будет видеть при клике на товар.</p>\r\n<h4>Информация для пользователя</h4>\r\n<p>Это разделы, где будут указаны условия доставки, оплаты, обмена, возврата товара и гарантии. Часы работы, адрес и телефон, а также любая другая информация, которая будет полезна вашим клиентам.</p>\r\n<h3>Заполнить каталоги товаров</h3>\r\n<p>Загрузите изображения, заполните описания и характеристики товаров. При заполнении карточек товаров нужно учесть некоторые нюансы. Мы подготовили подробную инструкцию о том, как правильно заполнить описания, чтобы они работали.</p>\r\n<p>Не забудьте указать цены</p>\r\n<div><img title=\"Так выглядит каталог товаров - 1C-UMI\" src=\"/images/cms/data/blog/umi-12-04-17-5.png\" alt=\"Так выглядит каталог товаров\" width=\"900\" />\r\n<p><em>Так выглядит каталог товаров в интернет-магазине на 1C- Umi</em></p>\r\n</div>\r\n<h3>Опубликовать сайт</h3>\r\n<p>После того, как вы полностью заполните сайт, и перед тем, как его продвигать, нужно его опубликовать в интернете. Для этого на главной странице панели управления нажмите кнопку &laquo;Опубликовать&raquo;. После этого сайт отправится на автоматическую модерацию. Если он полностью соответствует<span>&nbsp;</span>правилам сервиса, публикуется в открытый доступ. До прохождения модерации сайт доступен только администратору.</p>\r\n<div><img title=\"1C-UMI\" src=\"/images/cms/data/blog/umi-12-04-17-6.jpg\" alt=\"\" width=\"900\" /></div>\r\n<h3>Запустить продвижение магазина</h3>\r\n<p>Этот функционал доступен на платном тарифе и в пробном режиме (первые 15 дней использования сервиса). Заходите в меню &laquo;Реклама/SEO&raquo; панели управления (слева). Тут настраивается автоматическое продвижение вашего магазина. Система подходит как новичкам, которые ещё ничего не понимают в продвижении, так и специалистам, которые уже точно знают, как и что делать.</p>\r\n<p>Что такое &laquo;продвижение&raquo;? Это когда ваш сайт занимает первые строчки в поисковой выдаче, о вашей компании знают тысячи людей, к вам постоянно приходят клиенты по сарафанному радио, через рекламу или социальные сети. То есть продвижение &ndash; это работа, направленная на повышение продаж и узнаваемости вашей компании.</p>\r\n<p>Выполнение такой работы собственноручно &ndash; это долгий и не всегда эффективный процесс. Ведь новички совершают много ошибок. С автоматической системой продвижения вы получите результат гораздо быстрее.</p>\r\n<ul>\r\n<li>Ваш сайт нужно отправить на индексацию. После её прохождения поисковики станут его показывать в результатах выдачи.</li>\r\n<li>Ключевые запросы можно добавлять автоматически. Больше не нужно вписывать их вручную и терять время.</li>\r\n<li>Быстро заявить о себе поможет контекстная реклама (рекламный блок о вашем магазине будет показываться на главной странице поиска Яндекса). Не пугайтесь, она настраивается за пару кликов. Вы разберётесь за несколько минут. Если остались вопросы, мы всегда поможем вам найти ответы.</li>\r\n<li>Вся отчётность по продвижению наглядно отражена. По отчётам вы легко поймёте, что и как работает, где нужно подкорректировать свои действия, а где отказаться от принятых стратегий.</li>\r\n</ul>\r\n<p>В этой категории очень много инструментов. И каждый из них поможет вам в раскрутке магазина и увеличении прибыли.</p>\r\n<p>Мы рекомендуем использовать полный функционал системы. Это сэкономит вам деньги, время и даст дополнительный профит &ndash; ваш сайт быстро заметят, а первые клиенты придут намного быстрее.</p>\r\n<p>Задавайте свои вопросы в нашу службу поддержки. Мы поможем вам правильно настроить сайт и оптимизировать его работу.</p>',NULL,NULL,NULL),(634,7,NULL,'маркетинг',NULL,NULL,NULL,NULL),(634,7,NULL,'контент',NULL,NULL,NULL,NULL),(634,7,NULL,'SEO',NULL,NULL,NULL,NULL),(634,511,NULL,NULL,'',NULL,NULL,NULL),(634,518,NULL,NULL,'<h2>Что учесть при продвижении</h2>\r\n<p>Как правило, владельцы сайтов занимаются продвижением для<span>&nbsp;</span><strong>повышения продаж</strong>. Это самая очевидная и желанная цель, при этом абсолютно обоснованная &mdash; при правильной работе с контекстной рекламой и SEO вы будете обеспечены ежедневным потоком клиентов на сайт. Также продвигаться в интернете можно для<span>&nbsp;</span><strong>роста узнаваемости компании, лояльности клиентов и улучшения репутации</strong>. Эти цели также сказываются на продажах, хотя имеют более отсроченный, но при этом долгий эффект.</p>\r\n<p>При планировании продвижения важно понимать не только общую цель, но и какие инструменты подходят для её достижения, сколько на это потребуется денег и времени.</p>\r\n<p>Если у вас новый сайт, то первое время лучше вкладываться в контекстную рекламу, так как она даёт мгновенный эффект, в то время как на SEO-продвижение нужно по меньшей мере несколько месяцев или даже полгода. Именно столько времени потребуется на то, чтобы поисковые системы &laquo;признали&raquo; ваш сайт. Как уменьшить этот срок, мы писали в предыдущей<span>&nbsp;</span>статье.</p>\r\n<h2>Влияет ли контекстная реклама на SEO?</h2>\r\n<p>Прямого влияния контекстной рекламы на позиции сайта в органической выдаче нет. Но если контекст привлекает на сайт качественный трафик с хорошими поведенческими показателями (посетители долго находятся на сайте, просматривают много страниц, совершают покупки, отправляют формы, переходят по ссылкам, оставляют комментарии), то это положительный импульс для продвижения. Яндекс учитывает поведенческие факторы при ранжировании, при условии, что на сайте установлен счётчик Яндекс.Метрики (для Google - соответственно, Google Analytics).Получается, что<span>&nbsp;</span><strong>привлекательное, релевантное рекламное объявление даст вам не только прямые продажи, но и положительный эффект для SEO</strong>.</p>\r\n<p>Как установить счётчик на ваш сайт?</p>\r\n<p><strong>Обратите внимание</strong>: если в будущем вы планируете поменять домен сайта (например, перейти с домена 3 уровня &laquo;что-то.umi.ru&raquo; на домен 2 уровня &laquo;что-то.ru&raquo;) и продвигать его в органической выдаче &mdash; то лучше сделайте это ДО начала кампании и запускайте контекст сразу на новом домене. В противном случае, весь &laquo;побочный&raquo; SEO-эффект от контекстной рекламы будет утерян при переходе на новый домен.</p>\r\n<h2>Как составить семантическое ядро</h2>\r\n<p>Оба вида продвижения &mdash; и контекстная реклама, и SEO &mdash; строятся на ключевых словах, которые составляют семантическое ядро.</p>\r\n<p>Существует много инструментов для сбора семантической базы слов, но лучше всего использовать первоисточник &mdash;<span>&nbsp;</span>Яндекс Wordstat<span>&nbsp;</span>(или аналог от Google). Он поможет вам определить, каким образом ищут товары или услуги ваши клиенты, какие слова они используют и как строят поисковые запросы. Введите в Wordstat слова, описывающие вашу деятельность &mdash; и увидите, что и с какой частотой ищут пользователи интернета по вашей тематике.</p>\r\n<p><img title=\"Яндекс Wordstat - 1C-UMI\" src=\"/images/cms/data/blog/1.jpg\" alt=\"Яндекс Wordstat\" /></p>\r\n<p>Запросы сгруппированы по типу устройств, по региону и по времени &mdash; такая детализация позволит вам лучше понять, как ищет информацию ваша целевая аудитория, как она распределена территориально и когда активна. Также обратите внимание, что часть запросов коммерческие (содержат слова &laquo;купить&raquo;, &laquo;недорого&raquo;, &laquo;москва&raquo;), а часть &mdash; информационные (&laquo;фото&raquo; и т.п.). Если ваша цель &mdash; продажи,<span>&nbsp;</span><strong>то лучше избегать информационных запросов</strong>, так как по ним в основном приходят посмотреть, выбрать, но не купить.</p>\r\n<p>Что ещё использовать для составления семантического ядра:</p>\r\n<ul>\r\n<li>названия товаров (&laquo;Телевизор LG 43LH570V&raquo;);</li>\r\n<li>названия товарных групп (&laquo;купить брошки опт&raquo;);</li>\r\n<li>просторечные названия товаров (&laquo;микроволновая печь&raquo;&nbsp;&rarr; &laquo;микроволновка&raquo;);</li>\r\n<li>названия на других языках (&laquo;renault&raquo; &rarr;&nbsp;&laquo;рено&raquo;);</li>\r\n<li>названия товаров с ошибками (&laquo;духи shanel&raquo;);</li>\r\n<li>названия заменяющих товаров (&laquo;купить репейное масло для волос&raquo;&nbsp;&rarr; &laquo;купить кокосовое масло для волос&raquo;) &mdash; в этом случае не забудьте написать, почему ваше предложение лучше или хотя бы не хуже;</li>\r\n<li>ваш бренд или название компании;</li>\r\n<li>бренды конкурентов (&laquo;пылесос самсунг&raquo;&nbsp;&rarr; &laquo;пылесос сименс&raquo;) &mdash; также напишите преимущества вашего товара;</li>\r\n<li>бренды поставщиков и т.д.</li>\r\n</ul>\r\n<p>К любому запросу вы можете добавить географическое уточнение, чтобы повысить точность запроса, например &laquo;доставка тортов краснодар&raquo; или &laquo;снять двушку бирюлёво&raquo;.</p>\r\n<h2>Сколько тратить на продвижение</h2>\r\n<p>Универсального ответа на этот вопрос нет. Но есть рекомендации, которые стоит учесть при составлении бюджета на продвижение:</p>\r\n<p>1. Прежде всего определите, нужно ли вам одновременно использовать платное SEO-продвижение и контекстную рекламу. Например, для лендингов, новых сайтов или краткосрочных проектов на 1-2 месяца SEO не будет эффективно, и вы просто потратите деньги. Новым сайтам также не имеет смысла сразу вкладываться в SEO &mdash; стоит начать с контекста, а месяца через 3 после запуска сайта подключить SEO.</p>\r\n<p>2. Следующее, что нужно сделать, &mdash; подсчитать, сколько вы готовы заплатить за клиента: для этого важно определить средний чек в вашем магазине; количество повторных покупок одним клиентом, соотношение дохода от клиента на затраты для его привлечения (если привлечь клиента стоит больше, чем сумма его покупки &mdash; вы работаете себе в убыток). Практика показывает, что контекстная реклама стоит в 2-5 раз дороже, чем поисковое продвижение. При этом продвижение требует больше сил, так как это постоянная работа и затраты на покупку внешних ссылок, написание нового контента и работу с сайтом. Важно учитывать это при планировании бюджета.</p>\r\n<h2>Как работать с внешними ссылками</h2>\r\n<p>Если ссылка на ваш сайт размещена на другом веб-ресурсе, то поисковая система расценивает это как показатель его ценности. Доверие к таким сайтам возрастает, повышается авторитет и позиция в поисковиках, и чем авторитетнее ссылающийся на ваш ресурс, тем лучше для вас. При этом старайтесь не злоупотреблять покупкой ссылок, так как поисковые системы, поймав вас на этом, могут исключить вас из выдачи. Для анкоров (текст, к которому прикрепляется ссылка) используйте ключевые слова: текст ссылки должен служить очень кратким описанием страницы, на которую попадёт пользователь после перехода.</p>\r\n<p>SEO-оптимизаторы выделяют три вида внешних ссылок: арендные, вечные, бесплатные.</p>\r\n<p><strong>Арендные</strong><span>&nbsp;</span>ссылки предоставляются веб-мастерами за плату на сайтах с высоким авторитетом у поисковых систем и добавляют вес вашему сайту (повышают его индекс цитирования &mdash; тИЦ). С 1С-UMI вам не составит труда найти сайты для размещения арендных ссылок, так как встроенный модуль продвижения от PromoPult помогает автоматически подобрать подходящие сайты для размещения ссылок на основе специальных алгоритмов.</p>\r\n<p><strong>Вечные</strong><span>&nbsp;</span>ссылки появились как дополнительная услуга рынка продвижения. Такие ссылки оплачиваются один раз и размещаются навсегда. Как правило, они публикуются в текстах статей с релевантным вашим услугам содержанием, поэтому могут не только благоприятно сказаться на позициях вашего сайта в выдаче, но и привести целевых клиентов.</p>\r\n<p><strong>Бесплатные</strong><span>&nbsp;</span>ссылки можно размещать в тематических каталогах, на сайтах отзывов, картографических сервисах (2ГИС, Яндекс.Карты, Google Maps) и подобных сайтах, где можно завести карточку компании и разместить ссылку на свой сайт. Также можно связываться с владельцами тематических сайтов и порталов, предоставлять им материалы со ссылкой на ваш сайт &mdash; в некоторых случаях это будет бесплатно, в некоторых вам предложат оплатить размещение.</p>\r\n<h2>Как начать продвижение в 1С-UMI</h2>\r\n<p>В 1С-UMI встроен модуль автоматической рекламы и продвижения, который поможет вам без лишних хлопот продвигать свой сайт в интернете (доступен на платном тарифе).</p>\r\n<p>Чтобы активировать модуль, перейдите в панель управления вашим сайтом и выберите вкладку &laquo;Реклама/SEO&raquo;. Нажмите зелёную кнопку &laquo;Перейти в рекламу и продвижение&raquo;:</p>\r\n<p><img title=\"Реклама и продвижение - 1C-UMI\" src=\"/images/cms/data/blog/2.jpg\" alt=\"Реклама и продвижение\" /></p>\r\n<p>Вот<span>&nbsp;</span>очень подробная инструкция по работе с модулем &laquo;Реклама/SEO&raquo;.</p>\r\n<p>&nbsp;</p>\r\n<h3><strong>1. Первый этап запуска продвижения &mdash; выбор региона</strong></h3>\r\n<p>Почему важно выбрать регион:</p>\r\n<ul>\r\n<li>чтобы продвигаться на нужной вам территории,</li>\r\n<li>чтобы не сливать бюджет на клики от нецелевых клиентов, которые находятся вне вашей зоны услуг.</li>\r\n</ul>\r\n<p>Чем точнее указан регион, тем больше вероятность выполнения целевого действия клиентом. Фактор региона очень важен для поисковых систем. Если вы предоставляете услуги, например, только в Москве, то в Калининграде с большой вероятностью вашего сайта не будет в выдаче на привычном месте. Бывают и независимые от географии запросы &mdash; обычно это информационные запросы, по которым не происходит покупок.</p>\r\n<p><img title=\"Регион - 1C-UMI\" src=\"/images/cms/data/blog/37.jpg\" alt=\"Регион\" /></p>\r\n<h3><strong>2. Выбор ключевых слов</strong></h3>\r\n<p>Выбрав регион, система предложит вам подобрать ключевые слова. Если у вас нишевый сайт, PromoPult справится с задачей автоматически и подберёт вам хорошие запросы. Если автоматически подобранные запросы вас не устроят &mdash; это всегда можно сделать вручную. Для того, чтобы выбрать ключевое слово, нажмите &laquo;+&raquo; рядом с ним.</p>\r\n<p><img title=\"Ключевое слово - 1C-UMI\" src=\"/images/cms/data/blog/3.jpg\" alt=\"Ключевое слово\" /></p>\r\n<h3><strong>3. Установка бюджета</strong></h3>\r\n<p>По каждому запросу составляется прогноз посетителей и бюджет на продвижение в месяц. Оба показателя взаимосвязаны и приблизительны. Бюджет всегда можно отредактировать.<span>&nbsp;</span><strong>На этом этапе также можно выбрать тип продвижения для каждой ключевой фразы: SEO или контекстную рекламу</strong>. Наша рекомендация: не стоит сильно занижать бюджет на поисковое продвижение, лучше выбрать более дешёвый запрос или вообще отказаться от SEO, поскольку бюджет намного ниже рекомендуемого не принесёт пользы, и вы потратите деньги зря. А вот на бюджет контекстной рекламы можно ставить любые ограничения &mdash; ваше объявление будет показано в любом случае.</p>\r\n<p><img title=\"Бюджет - 1C-UMI\" src=\"/images/cms/data/blog/23.jpg\" alt=\"Бюджет\" /></p>\r\n<p>Бюджет на продвижение тратится на покупку арендных ссылок на внешних сайтах.</p>\r\n<p><img title=\"Бюджет - 1C-UMI\" src=\"/images/cms/data/blog/4.jpg\" alt=\"Бюджет\" /></p>\r\n<p>В статистике по продвижению вы увидите, в какое время была установлена ваша ссылка, какой текст использовался для ссылки (анкор) и на какой сайт (донор). Статистика будет показана по оплаченным ссылкам.</p>\r\n<p><img title=\"Бюджет - 1C-UMI\" src=\"/images/cms/data/blog/5.jpg\" alt=\"Бюджет\" /></p>\r\n<p>Бюджет на контекст тратится на клики на ваше объявление.</p>\r\n<h3><strong>4. Редактирование</strong></h3>\r\n<p>После того, как задан бюджет, можно скорректировать рекламное объявление. На основе семантического ядра постарайтесь предугадать, как ваши клиенты будут искать ваш товар или услугу и какое предложение может их привлечь и в зависимости от этого отредактируйте объявление для контекстной рекламы.</p>\r\n<p><img title=\"Редактирование рекламного объявления umi.ru - 1C-UMI\" src=\"/images/cms/data/blog/6.jpg\" alt=\"Редактирование рекламного объявления umi.ru\" /><img title=\"Редактирование - 1C-UMI\" src=\"/images/cms/data/blog/7.jpg\" alt=\"Редактирование\" /></p>\r\n<h3><strong>5. Запуск рекламы</strong></h3>\r\n<p>После всех настроек запустите рекламу:</p>\r\n<p><img title=\"Запуск рекламы - 1C-UMI\" src=\"/images/cms/data/blog/55.jpg\" alt=\"Запуск рекламы\" /></p>\r\n<h3><strong>6. Сбор статистики</strong></h3>\r\n<p>Статистика переходов в PromoPult показывает просмотры по ключевым словам, количество посетителей, статистику кликов. На основе этих данных вы можете скорректировать объявления, чтобы повысить количество переходов (кликабельность). Кликабельность &mdash; показатель качества сайта для поисковых систем.</p>\r\n<p><img title=\"Просмотры по ключевым словам - 1C-UMI\" src=\"/images/cms/data/blog/8.jpg\" alt=\"Просмотры по ключевым словам\" /><img title=\"Просмотры по ключевым словам - 1C-UMI\" src=\"/images/cms/data/blog/9.jpg\" alt=\"Просмотры по ключевым словам\" /></p>\r\n<h2>Как подготовить свой сайт к продвижению</h2>\r\n<h3>Технические факторы</h3>\r\n<p><strong>Установите счётчик аналитики</strong><span>&nbsp;</span>на свой сайт. Именно на основе этой статистики вы сможете понять, что на вашем сайте повышает продажи, а что отпугивает посетителей.<span>&nbsp;</span>Как установить счётчик аналитики на сайт на 1С-UMI? Обязательно настройте цели с системе аналитики, чтобы понимать, что именно делают люди на вашем сайте, какие кнопки нажимают, доходят ли до оформления заказа и т.д<span>&nbsp;</span></p>\r\n<p><strong>Не ленитесь прописывать мета-теги</strong>. На каждой странице они должны быть уникальными и понятными, так как именно их видят клиенты в поисковой выдаче и на их основе делают вывод о том, перейти на ваш сайт или уйти на сайт конкурента.</p>\r\n<p><strong>Не создавайте дубликаты своего сайта</strong>. Как бы вам ни хотелось, чтобы весь ТОП выдачи был забит ссылками на вашу компанию, поисковик быстро поймёт, что вы хотите его обмануть и перестанут показывать ваш сайт. Как они это понимают? По одинаковому контенту, контактным данным, одним и тем же товаром с одинаковыми артикулами и другой повторяющейся информации.</p>\r\n<p>Что касается наполнения сайта &mdash; смотрите на сайты своих конкурентов, которые выше вас в выдаче. Если они занимают более высокие позиции, то &laquo;нравятся&raquo; поисковикам больше. Вбивайте запросы, по которым собираетесь продвигаться, смотрите на контент, оформление, качество фотографий, структуру сайта и другие фишки. Подмечайте всё и не стыдитесь применять на своём сайте. Вы должны быть похожи на лидеров, чтобы стать одним из них. Только не копируйте контент, это негативно сказывается на продвижении.</p>\r\n<p><strong>Используйте внутреннюю перелинковку</strong><span>&nbsp;</span>&mdash; ставьте ссылки с одних страниц сайта на другие: на похожие товары, товары смежных тематик, на полезные статьи, которые перекликаются между собой по теме. Это позволяет поднять поисковую видимость сайта.</p>',NULL,NULL,NULL),(631,519,NULL,'Список постов блога по тегу',NULL,NULL,NULL,NULL),(671,262,NULL,'Аноним',NULL,NULL,NULL,NULL),(671,263,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(671,264,NULL,'178.16.152.254',NULL,NULL,NULL,NULL),(673,262,NULL,'Аноним',NULL,NULL,NULL,NULL),(673,263,NULL,'199.249.230.118',NULL,NULL,NULL,NULL),(673,264,NULL,'199.249.230.118',NULL,NULL,NULL,NULL),(675,260,1,NULL,NULL,NULL,NULL,NULL),(675,261,NULL,NULL,NULL,182,NULL,NULL),(631,522,NULL,NULL,'<p>Настоящим подтверждаю, что ознакомлен и согласен с условиями <a href=\"/files/pdn.doc\">Политики в отношении обработки персональных данных</a>.</p>',NULL,NULL,NULL),(630,511,NULL,NULL,'<p>Фриланс - это работа в удовольствие! ... Несмотря на это, удаленная работа для многих фрилансеров, была и остается единственным источником заработка.</p>',NULL,NULL,NULL),(628,298,NULL,'127',NULL,NULL,NULL,NULL),(682,3,NULL,'Новые способы заработка',NULL,NULL,NULL,NULL),(683,3,NULL,'Заработок на файлообменниках',NULL,NULL,NULL,NULL),(683,241,NULL,NULL,'<p>В интернете есть много файлообменников, так называемых хранилищ файлов. Так вот, закачивая на файлообменники файлы и размещая потом по разным новостным порталам ссылки на них, можно хорошо заработать, если ваши файлы будут интересными и их будут скачивать много людей.</p>',NULL,NULL,NULL),(683,244,1560855540,NULL,NULL,NULL,NULL,NULL),(684,3,NULL,'Заработок в интернете на своем сайте',NULL,NULL,NULL,NULL),(684,241,NULL,NULL,'<p>Как только вы создадите свой сайт пройдет около двух недель пока поисковые системы его проиндексируют и он появиться в самых популярных поисковиках. Если все получилось и на сайт пошли первые пользователи ваш сайт уже можно рассматривать как рекламную площадку, в интернете полно рекламных партнерок, которые принимают проекты независимо от посещаемости сайта, платного хостинга и тд.</p>',NULL,NULL,NULL),(684,244,1560855660,NULL,NULL,NULL,NULL,NULL),(685,3,NULL,'Заработок на букмекерских конторах',NULL,NULL,NULL,NULL),(685,241,NULL,NULL,'<p>Первое правило никогда не играйте на деньги которые вам будет жалко потерять, ведь изначально мы должны понимать что люди пришли получить удовольствие от игры, пощекотать нервы, получить дозу адреналина в кровь, интересно провести время.&nbsp;</p>',NULL,NULL,NULL),(685,244,1560855660,NULL,NULL,NULL,NULL,NULL),(627,3,NULL,'Блог о маркетинге',NULL,NULL,NULL,NULL),(624,4,NULL,NULL,'<p style=\"text-align: justify;\">Доброго времени суток, меня зовут Виктория и я Менеджер интернет-проектов &ndash;&nbsp;универсальный сотрудник, очень ответственный, готовый прийти на помощь своему работодателю в любой момент (естественно, в оговоренное время). Решение Ваших проблем - моя основная задача. Любое начатое дало довожу до конца, постоянно совершенствую свой профессиональный уровень, работе отдаюсь максимально.</p>\r\n<p><strong>Готова приступить к работе в ближайшее время!</strong></p>',NULL,NULL,NULL),(624,523,NULL,NULL,'<p style=\"text-align: justify;\">Менеджер интернет-проектов обычно решает проблемы компании, связанные с созданием и доработкой сайтов, интернет-рекламой, email-рассылками, документооборотом, общением с клиентами и даже может взять на себя ведение бухгалтерии. Работает удаленно.&nbsp;</p>',NULL,NULL,NULL),(624,524,NULL,NULL,NULL,NULL,3,NULL),(624,525,NULL,'Портфолио',NULL,NULL,NULL,NULL),(624,526,NULL,'Смотреть все',NULL,NULL,NULL,NULL),(630,4,NULL,NULL,'<table class=\"contact_info\">\r\n<tbody>\r\n<tr class=\"contact_info_block contact_address\">\r\n<td class=\"contact_title\">\r\n<div>Адрес:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div>Санкт-Петербург, ул. Орджоникидзе, 25</div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_time\">\r\n<td class=\"contact_title\">\r\n<div>Время работы:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div>с 9-00 до 20-00</div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_phone\">\r\n<td class=\"contact_title\">\r\n<div>Телефон:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div><a href=\"tel:+78212345678\">+7 (812) 234-56-78</a></div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_fax\">\r\n<td class=\"contact_title\">\r\n<div>WhatsApp:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div>+7 (812) 234-56-77</div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_skype\">\r\n<td class=\"contact_title\">\r\n<div>Skype:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div><a href=\"skype:stolyarova_vika\">stolyarova_vika</a></div>\r\n</td>\r\n</tr>\r\n<tr class=\"contact_info_block contact_email\">\r\n<td class=\"contact_title\">\r\n<div>Email:</div>\r\n</td>\r\n<td class=\"contact_value\">\r\n<div><a href=\"mailto:stolyarova_vika@gmail.com\">stolyarova_vika@gmail.com</a></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div class=\"code_pre yandex_map\"><iframe frameborder=\"0\" src=\"https://yandex.ru/map-widget/v1/?um=constructor%3Ad99c67a2619bedaa9b4f611d4ea21367fa9a0f783f99b7594f64b11b6d98f849&amp;source=constructor\" width=\"100%\" height=\"400\"></iframe></div>\r\n<p style=\"text-align: justify;\">Чтобы задать вопрос заполните ниже форму обратной связи. Также можно задать вопрос, позвонив по телефону или связавшись со мной по скайпу.&nbsp;</p>',NULL,NULL,NULL),(686,40,NULL,'refund',NULL,NULL,NULL,NULL),(686,111,80,NULL,NULL,NULL,NULL,NULL),(565,535,6,NULL,NULL,NULL,NULL,NULL),(571,535,5,NULL,NULL,NULL,NULL,NULL),(576,535,2,NULL,NULL,NULL,NULL,NULL),(580,535,1,NULL,NULL,NULL,NULL,NULL),(584,535,4,NULL,NULL,NULL,NULL,NULL),(587,535,3,NULL,NULL,NULL,NULL,NULL),(687,66,NULL,'promoCode',NULL,NULL,NULL,NULL),(687,69,NULL,'emarket-discountrule-850',NULL,NULL,NULL,NULL),(687,68,NULL,NULL,NULL,180,NULL,NULL),(687,68,NULL,NULL,NULL,179,NULL,NULL),(631,504,NULL,NULL,'<p><a href=\"tel:+79123456789\"><span style=\"font-size: 24pt; color: #ffffff;\"><br />8 (912) 345-67-89</span></a></p>',NULL,NULL,NULL),(631,508,1,NULL,NULL,636,NULL,1),(631,508,1,NULL,NULL,639,NULL,2),(182,220,NULL,NULL,'a:20:{s:15:\"tree-data-types\";a:1:{s:8:\"expanded\";s:15:\"{0}{3}{123}{47}\";}s:21:\"tree-emarket-delivery\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:21:\"tree-data-guide_items\";a:2:{s:8:\"expanded\";s:3:\"{0}\";s:12:\"used-columns\";s:134:\"name[509px]|identifier[200px]|link[200px]|css_class[200px]|is_registrated[200px]|user_id[200px]|nickname[200px]|email[200px]|ip[200px]\";}s:15:\"tree-content--1\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:21:\"tree-photoalbum-lists\";a:1:{s:8:\"expanded\";s:6:\"{0}{3}\";}s:18:\"tree-blogs20-posts\";a:2:{s:8:\"expanded\";s:6:\"{0}{8}\";s:12:\"used-columns\";s:43:\"name[400px]|publish_time[250px]|tags[582px]\";}s:18:\"tree-blogs20-blogs\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:23:\"tree-webforms-addresses\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:19:\"tree-webforms-forms\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:22:\"tree-webforms-messages\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:23:\"tree-webforms-templates\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:21:\"tree-umiSettings-read\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:21:\"tree-blogs20-comments\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:20:\"tree-exchange-import\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:12:\"tree_common0\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:15:\"tree-news-lists\";a:1:{s:8:\"expanded\";s:10:\"{0}{9}{43}\";}s:16:\"tree-data-guides\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:16:\"tree-trash-trash\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:21:\"tree-users-users_list\";a:1:{s:8:\"expanded\";s:3:\"{0}\";}s:13:\"hidden-groups\";a:1:{i:128;s:17:\"404_page_settings\";}}',NULL,NULL,NULL),(688,40,NULL,'waiting_confirmation',NULL,NULL,NULL,NULL),(688,111,40,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms3_object_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_content_cnt`
--

DROP TABLE IF EXISTS `cms3_object_content_cnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_content_cnt` (
  `obj_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `cnt` int DEFAULT '0',
  KEY `FK_Contents_Counters to object relation` (`obj_id`),
  KEY `FK_Contents_Counters field id relation` (`field_id`),
  CONSTRAINT `FK_Contents_Counters field id relation` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Contents_Counters to object relation` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_content_cnt`
--

LOCK TABLES `cms3_object_content_cnt` WRITE;
/*!40000 ALTER TABLE `cms3_object_content_cnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_content_cnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_domain_id_list`
--

DROP TABLE IF EXISTS `cms3_object_domain_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_domain_id_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `domain_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_domain_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_domain_id_list field_id` (`field_id`),
  KEY `cms3_object_domain_id_list obj_id` (`obj_id`),
  KEY `cms3_object_domain_id_list domain_id` (`domain_id`),
  CONSTRAINT `cms3_object_domain_id_list domain id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_domain_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_domain_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_domain_id_list`
--

LOCK TABLES `cms3_object_domain_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_domain_id_list` DISABLE KEYS */;
INSERT INTO `cms3_object_domain_id_list` VALUES (1,631,484,1);
/*!40000 ALTER TABLE `cms3_object_domain_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_field_groups`
--

DROP TABLE IF EXISTS `cms3_object_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_field_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` int unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `ord` int DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `tip` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Group to type relation_FK` (`type_id`),
  KEY `ord` (`ord`),
  KEY `name` (`name`),
  KEY `title` (`title`),
  KEY `is_active` (`is_active`),
  KEY `is_visible` (`is_visible`),
  KEY `is_locked` (`is_locked`),
  CONSTRAINT `FK_Group to type relation` FOREIGN KEY (`type_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_field_groups`
--

LOCK TABLES `cms3_object_field_groups` WRITE;
/*!40000 ALTER TABLE `cms3_object_field_groups` DISABLE KEYS */;
INSERT INTO `cms3_object_field_groups` VALUES (1,'svojstva_statusa_stranicy','i18n::fields-group-svojstva_statusa_stranicy',2,1,1,5,0,''),(2,'common','i18n::fields-group-common',3,1,0,5,1,'Основные настройки страницы'),(4,'more_params','i18n::fields-group-more_params',3,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(5,'rate_props','i18n::fields-group-rate_props',3,1,0,20,1,''),(6,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',3,0,1,25,1,'Управление статусом публикации'),(7,'locks','i18n::fields-group-locks',3,1,1,30,1,''),(8,'common','i18n::fields-group-news-rss-source-charset-common',6,1,1,5,0,''),(9,'common','i18n::fields-group-common',7,1,0,5,0,'Основные настройки ленты новостей'),(11,'more_params','i18n::fields-group-more_params',7,1,0,15,0,'Настройки отображения страницы и её поисковой индексации'),(12,'rate_voters','i18n::fields-group-rate_voters',7,1,0,20,0,''),(13,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',7,0,1,25,1,'Управление статусом публикации'),(14,'locks','i18n::fields-group-locks',7,1,1,30,1,''),(15,'common','i18n::fields-group-common',8,1,1,5,0,''),(16,'props','i18n::fields-group-props',9,1,1,5,0,''),(17,'params_more','i18n::fields-group-dopolnitelno',10,1,1,5,0,'Страна в формате ISO 3166-1 alpha-2'),(18,'common','i18n::fields-group-common',14,1,1,5,0,''),(19,'common','i18n::fields-group-common',15,1,1,5,0,''),(20,'additional','i18n::fields-group-grp_disp_msg_extended',16,1,1,5,0,'Порядковый номер дня недели (1 (Понедельник) - 7 (Воскресение))'),(21,'additional','i18n::fields-group-grp_disp_msg_extended',17,1,1,5,0,'Порядковый номер дня недели (1 (Понедельник) - 7 (Воскресение))'),(24,'props_currency','i18n::fields-group-currency_props',21,1,1,5,0,'Общие настройки валюты'),(26,'common','i18n::fields-group-emarket-mobile-platform-common',23,1,1,5,1,''),(27,'common','i18n::fields-group-emarket-mobile-devices-common',24,1,1,5,0,''),(28,'personal','i18n::fields-group-personal_info',25,1,1,5,1,''),(29,'common','i18n::fields-group-common_group',27,1,1,5,1,''),(30,'common','i18n::common',28,1,1,5,0,''),(31,'common','i18n::common',29,1,1,5,0,''),(32,'discount_type_props','i18n::fields-group-discount_type_props',30,1,1,5,0,''),(33,'discount_modificator_type_props','i18n::fields-group-discount_modificator_type_props',31,1,1,5,0,''),(34,'discount_modificator_props','i18n::fields-group-discount_modificator_props',32,1,1,5,0,''),(35,'discount_rule_type_props','i18n::fields-group-discount_rule_type_props',33,1,1,5,0,''),(36,'discount_rule_props','i18n::fields-group-discount_rule_props',34,1,1,5,0,''),(37,'common','i18n::fields-group-props',35,1,1,5,0,'Настройки формата импорта данных'),(38,'common','i18n::fields-group-props',36,1,1,5,0,'Настройки формата экспорта данных'),(39,'network_system_props','i18n::fields-group-service_props',37,1,1,5,0,''),(40,'props','i18n::fields-group-props',38,1,1,5,1,'Здесь в дополнение к разделам каталога, можно выбрать, какие страницы нужно показывать в социальной сети'),(41,'pages','i18n::fields-group-site_parts',38,1,1,10,1,''),(42,'network_system_props','i18n::fields-group-service_props',38,1,1,15,0,'Настройки интеграции интернет-магазина с социальными сетями'),(43,'svojstva_gruppy_polzovatelej','i18n::fields-group-svojstva_gruppy_polzovatelej',39,1,0,5,1,'Общие настройки группы пользователей'),(44,'common','i18n::fields-group-osnovnoe',40,1,1,5,0,''),(45,'item_type_props','i18n::fields-group-item_type_props',41,1,1,5,0,''),(46,'discount_props','i18n::fields-group-discount_props',42,1,1,5,0,'Управление скидками на товары'),(47,'item_props','i18n::fields-group-order_item_props',44,1,1,5,0,'i18n::field-order-item-discount-value'),(48,'item_optioned_props','i18n::fields-group-item_optioned_props',44,1,1,10,0,''),(49,'trade_offers','i18n::fields-group-trade-offers',44,1,1,15,0,'Торговое предложение товарного наименования'),(50,'order_status_props','i18n::fields-group-order_status_props',45,1,1,5,0,''),(51,'payment_type_props','i18n::fields-group-payment_type_props',46,1,1,5,0,''),(52,'payment_props','i18n::fields-group-payment_props',47,1,1,5,0,'Общие настройки способа оплаты'),(53,'order_status_props','i18n::fields-group-payment_status_props',48,1,1,5,0,''),(54,'general','i18n::fields-group-osnovnoe',49,1,1,5,0,''),(55,'addresses','i18n::fields-group-addresses',49,1,1,10,0,''),(56,'payment','i18n::fields-group-payment_info',49,1,1,15,0,''),(57,'delivery_type_props','i18n::fields-group-delivery_type_props',50,1,1,5,0,''),(58,'delivery_description_props','i18n::fields-group-delivery_description',51,1,1,5,0,'Если установлено - не будет отображаться на сайте'),(59,'order_status_props','i18n::fields-group-delivery_status_props',52,1,1,5,0,''),(60,'order_props','i18n::fields-group-order_props',53,1,1,5,0,'Основная информация о заказе'),(62,'statistic_info','i18n::fields-group-statistic_data',53,1,1,15,0,'Поведенческие данные о покупателе. Используются для анализа эффективности различных каналов продвижения. Получить общую статистику по всем заказам или сделать выборку можно в модуле «Интернет-магазин» —> вкладка «Статистика»'),(63,'order_payment_props','i18n::fields-group-order_payment_props',53,1,1,20,0,'Данные об оплате заказа'),(64,'order_delivery_props','i18n::fields-group-order_delivery_props',53,1,1,25,0,'i18n::fields-group-order_delivery_props-tip'),(65,'order_discount_props','i18n::fields-group-order_discount_props',53,1,1,30,0,''),(66,'integration_date','i18n::fields-group-intergation_props',53,1,1,35,0,'Выставляется системой автоматически, когда заказ необходимо выгрузить в 1С'),(67,'purchase_one_click','i18n::fields-group-purchase_one_click',53,1,1,40,0,''),(68,'idetntify_data','i18n::fields-group-idetntify_data',54,1,0,5,1,'Основная информация о пользователе'),(69,'more_info','i18n::fields-group-more_info',54,1,1,10,0,'Дополнительные настройки пользователя'),(70,'short_info','i18n::fields-group-short_info',54,1,1,15,0,'Личные данные пользователя'),(71,'delivery','i18n::fields-group-trans_deliver',54,1,1,20,0,''),(72,'statistic_info','i18n::fields-group-statistic_data',54,1,1,25,0,'Статистические данные о поведении пользователя на сайте'),(73,'store_props','i18n::fields-group-store_props',55,1,1,5,0,'Основной склад, с которого будут списываться товары при покупке, и с которым будет синхронизироваться 1C'),(74,'discount_modificator_props','i18n::fields-group-discount_modificator_props',56,1,1,5,0,'Настройка размера скидки'),(75,'discount_rule_props','i18n::fields-group-discount_rule_props',57,1,1,5,0,'Пользователи, которым будет доступна скидка'),(76,'common','i18n::fields-group-menu_common',58,1,1,5,0,'Основные настройки меню'),(77,'common','i18n::fields-group-common',60,1,0,5,1,'Основные настройки новости'),(78,'item_props','i18n::fields-group-item_props',60,1,0,10,1,'Основные свойства публикации новости'),(80,'more_params','i18n::fields-group-more_params',60,1,0,20,1,'Настройки отображения страницы и её поисковой индексации'),(81,'news_images','i18n::fields-group-news_images',60,1,1,25,0,'Управление изображениями новости'),(82,'subjects_block','i18n::fields-group-subjects_block',60,1,1,30,1,'Сюжеты служат для группировки новостей по тематикам. Список последних новостей, связанных с данной по сюжету, можно вывести при помощи макроса <a target=\"_blank\" href=\"http://dev.docs.umi-cms.ru/spravochnik_makrosov_umicms/novosti/news_related_links/\">news related_links()</a>'),(83,'rate_voters','i18n::fields-group-rate_voters',60,1,0,35,1,''),(84,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',60,0,1,40,1,'Управление статусом публикации'),(85,'locks','i18n::fields-group-locks',60,1,1,45,1,''),(86,'common','i18n::fields-group-common',61,1,0,5,1,'Основные настройки страницы'),(88,'more_params','i18n::fields-group-more_params',61,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(89,'rate_voters','i18n::fields-group-rate_voters',61,1,0,20,1,''),(90,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',61,0,1,25,1,'Управление статусом публикации'),(91,'locks','i18n::fields-group-locks',61,1,1,30,1,''),(92,'props','i18n::fields-group-props',62,1,1,5,0,''),(93,'common','i18n::fields-group-common',63,1,0,5,1,'Основные настройки блога'),(95,'more_params','i18n::fields-group-more_params',63,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(96,'rate_props','i18n::fields-group-rate_props',63,1,0,20,1,''),(97,'props','i18n::fields-group-props',64,1,1,5,1,'Основная информация об авторе'),(98,'common','i18n::fields-group-common',65,1,0,5,1,'Основные свойства комментария к блогу'),(99,'rate_props','i18n::fields-group-rate_props',65,1,0,10,1,''),(100,'antispam','i18n::fields-group-antispam',65,1,1,15,0,'Пометка «Спам» скрывает нежелательные комментарии из блога'),(101,'common','i18n::fields-group-common',66,1,0,5,1,'Основные настройки поста блога'),(103,'more_params','i18n::fields-group-more_params',66,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(104,'rate_props','i18n::fields-group-rate_props',66,1,0,20,1,''),(105,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',66,0,1,25,1,'Управление статусом публикации'),(106,'locks','i18n::fields-group-locks',66,1,1,30,1,''),(107,'privacy','i18n::fields-group-privacy',66,1,1,35,0,'Настройки видимости поста для авторов и пользователей'),(108,'antispam','i18n::fields-group-antispam',66,1,1,40,0,'Пометка «Спам» скрывает нежелательные посты из блога'),(109,'common','i18n::fields-group-common',67,1,0,5,1,'Основные настройки конференции'),(111,'more_params','i18n::fields-group-more_params',67,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(112,'rate_voters','i18n::fields-group-rate_voters',67,1,0,20,1,''),(113,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',67,0,1,25,1,'Управление статусом публикации'),(114,'locks','i18n::fields-group-locks',67,1,1,30,1,''),(115,'common','i18n::fields-group-common',68,1,0,5,1,'Основные настройки топика'),(117,'more_params','i18n::fields-group-more_params',68,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(118,'topic_props','i18n::fields-group-topic_props',68,1,0,20,1,'Свойства публикации топика'),(119,'rate_voters','i18n::fields-group-rate_voters',68,1,0,25,1,''),(120,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',68,0,1,30,1,'Управление статусом публикации'),(121,'locks','i18n::fields-group-locks',68,1,1,35,1,''),(122,'common','i18n::fields-group-common',69,1,0,5,1,'Основные настройки сообщения форума'),(124,'more_params','i18n::fields-group-more_params',69,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(125,'message_props','i18n::fields-group-message_props',69,1,0,20,1,'Свойства публикации сообщения'),(126,'rate_voters','i18n::fields-group-rate_voters',69,1,0,25,1,''),(127,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',69,0,1,30,1,'Управление статусом публикации'),(128,'locks','i18n::fields-group-locks',69,1,1,35,1,''),(129,'common','i18n::fields-group-common',70,1,0,5,1,'Основные настройки комментария'),(131,'more_params','i18n::fields-group-more_params',70,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(132,'comment_props','i18n::fields-group-comment_props',70,1,0,20,1,'Свойства публикации комментария'),(133,'rate_voters','i18n::fields-group-rate_voters',70,1,0,25,1,''),(134,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',70,0,1,30,1,'Управление статусом публикации'),(135,'locks','i18n::fields-group-locks',70,1,1,35,1,''),(136,'antispam','i18n::fields-group-antispam',70,1,1,40,0,'Пометив нежелательные комментарии как спам, вы сможете их отфильтровать для выполнения групповых операций — например, удалить комментарии или/и блокировать автора'),(137,'common_props','i18n::fields-group-common_props',71,1,1,5,1,''),(138,'common','i18n::fields-group-common',72,1,0,5,1,'Основные настройки опроса'),(140,'more_params','i18n::fields-group-more_params',72,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(141,'poll_props','i18n::fields-group-poll_props',72,1,0,20,1,'Настройки опроса'),(142,'rate_voters','i18n::fields-group-rate_voters',72,1,0,25,1,''),(143,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',72,0,1,30,1,'Управление статусом публикации'),(144,'locks','i18n::fields-group-locks',72,1,1,35,1,''),(145,'common','i18n::fields-group-common',73,1,0,5,1,'Основные настройки страницы'),(147,'more_params','i18n::fields-group-more_params',73,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(148,'rate_props','i18n::fields-group-rate_props',73,1,0,20,1,''),(149,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',73,0,1,25,1,'Управление статусом публикации'),(150,'locks','i18n::fields-group-locks',73,1,1,30,1,''),(151,'binding','i18n::fields-group-Binding',73,1,0,35,0,'Привязать к этой странице форму обратной связи'),(152,'sendingdata','i18n::fields-group-SendingData',74,1,0,5,1,''),(153,'templates','i18n::fields-group-Templates',75,1,1,5,1,'Настройки шаблона письма, которое получит администратор сайта при отправке пользователем сообщения через форму обратной связи'),(154,'auto_reply','i18n::fields-group-auto_reply',75,1,1,10,1,'Настройки шаблона автоответа, который получит пользователь при отправке сообщения через форму обратной связи'),(155,'messages','i18n::fields-group-messages',75,1,1,15,1,'Сообщение, которое будет отображаться на странице успешной отправки формы обратной связи'),(156,'binding','i18n::fields-group-Binding',75,1,0,20,1,'Привязка шаблона автоответа к форме обратной связи'),(157,'list','i18n::fields-group-list',76,1,1,5,0,'Списки адресов получателей формы'),(158,'common','i18n::fields-group-common',77,1,0,5,1,'Основные настройки фотоальбома'),(160,'more_params','i18n::fields-group-more_params',77,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(161,'album_props','i18n::fields-group-album_props',77,1,0,20,1,'Основные настройки фотоальбома'),(162,'rate_voters','i18n::fields-group-rate_voters',77,1,0,25,1,''),(163,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',77,0,1,30,1,'Управление статусом публикации'),(164,'locks','i18n::fields-group-locks',77,1,1,35,1,''),(165,'common','i18n::fields-group-common',78,1,0,5,1,'Основные настройки фотографии'),(167,'more_params','i18n::fields-group-more_params',78,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(168,'photo_props','i18n::fields-group-photo_props',78,1,0,20,1,'Основные настройки фотографии'),(169,'rate_voters','i18n::fields-group-rate_voters',78,1,0,25,1,''),(170,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',78,0,1,30,1,'Управление статусом публикации'),(171,'locks','i18n::fields-group-locks',78,1,1,35,1,''),(172,'common','i18n::fields-group-common',79,1,0,5,1,'Основные настройки проектов FAQ'),(174,'more_params','i18n::fields-group-more_params',79,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(175,'rate_voters','i18n::fields-group-rate_voters',79,1,0,20,1,''),(176,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',79,0,1,25,1,'Управление статусом публикации'),(177,'locks','i18n::fields-group-locks',79,1,1,30,1,''),(178,'common','i18n::fields-group-common',80,1,0,5,1,'Основные настройки категории вопросов'),(180,'more_params','i18n::fields-group-more_params',80,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(181,'rate_voters','i18n::fields-group-rate_voters',80,1,0,20,1,''),(182,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',80,0,1,25,1,'Управление статусом публикации'),(183,'locks','i18n::fields-group-locks',80,1,1,30,1,''),(184,'common','i18n::fields-group-common',81,1,0,5,1,'Основные настройки вопроса'),(186,'more_params','i18n::fields-group-more_params',81,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(187,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',81,0,1,20,1,'Управление статусом публикации'),(188,'locks','i18n::fields-group-locks',81,1,1,25,1,''),(189,'antispam','i18n::fields-group-antispam',81,1,1,30,0,'Пометка «Спам» скрывает нежелательные вопросы из категории FAQ'),(190,'grp_disp_props','i18n::fields-group-grp_disp_props',82,1,1,5,0,'Основные настройки рассылки'),(191,'auto_settings','i18n::fields-group-auto_mailout_settings',82,1,1,10,0,'Настройка графика автоматической рассылки писем'),(192,'grp_disp_release_props','i18n::fields-group-grp_disp_release_props',83,1,1,5,0,'Основные настройки выпуска рассылки'),(193,'grp_disp_msg_props','i18n::fields-group-grp_disp_msg_props',84,1,0,5,0,'Основные настройки сообщения рассылки'),(194,'grp_disp_msg_extended','i18n::fields-group-grp_disp_msg_extended',84,1,1,10,0,'Дополнительные настройки сообщения рассылки'),(195,'grp_sbs_props','i18n::fields-group-grp_sbs_props',85,1,0,5,0,'Основные данные подписчика'),(196,'grp_sbs_extended','i18n::fields-group-grp_sbs_extended',85,1,1,10,0,'Информация о подписках пользователя'),(197,'common','i18n::fields-group-common',86,1,0,5,1,'Основные настройки страницы и её расположения в структуре каталога'),(199,'more_params','i18n::fields-group-more_params',86,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(200,'dopolnitelno','i18n::fields-group-dopolnitelno',86,1,1,20,0,'Управление описаниями раздела каталога'),(201,'rate_voters','i18n::fields-group-rate_voters',86,1,0,25,1,''),(202,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',86,0,1,30,1,'Управление статусом публикации'),(203,'locks','i18n::fields-group-locks',86,1,1,35,1,''),(204,'filter_index','i18n::fields-group-filter_index',86,1,0,40,1,''),(205,'common','i18n::fields-group-common',87,1,0,5,1,'Основные настройки товара'),(207,'more_params','i18n::fields-group-more_params',87,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(208,'cenovye_svojstva','i18n::fields-group-cenovye_svojstva',87,1,1,20,0,'Ценовые свойства товара'),(209,'catalog_option_props','i18n::fields-group-option_props',87,1,1,25,0,''),(210,'catalog_stores_props','i18n::fields-group-stores',87,1,1,30,0,'Данные о наличии товара на складах'),(211,'trade_offers','i18n::fields-group-trade-offers',87,1,1,35,0,'Торговые предложения и их характеристики'),(212,'rate_voters','i18n::fields-group-rate_voters',87,1,0,40,1,''),(213,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',87,0,1,45,1,'Управление статусом публикации'),(214,'locks','i18n::fields-group-locks',87,1,1,50,1,''),(215,'personal_info','i18n::fields-group-personal_info',88,1,1,5,0,''),(216,'contact_props','i18n::fields-group-contacts',88,1,1,10,0,''),(217,'delivery','i18n::fields-group-trans_deliver',88,1,0,15,0,''),(218,'yuridicheskie_dannye','i18n::fields-group-yuridicheskie_dannye',88,1,0,20,0,''),(219,'discount_modificator_props','i18n::fields-group-discount_modificator_props',89,1,1,5,0,'Настройка размера скидки'),(220,'discount_rule_props','i18n::fields-group-discount_rule_props',90,1,1,5,0,'К каким товарам/разделам каталога применять скидку?'),(221,'discount_rule_props','i18n::fields-group-discount_rule_props',91,1,1,5,0,'На какой период действует скидка?'),(222,'discount_rule_props','i18n::fields-group-discount_rule_props',92,1,1,5,0,'Зависит ли применение скидки от стоимости заказа?'),(223,'discount_rule_props','i18n::fields-group-discount_rule_props',93,1,1,5,0,'Зависит ли применение скидки от суммы всех покупок пользователя?'),(224,'discount_rule_props','i18n::fields-group-discount_rule_props',94,1,1,5,0,'Каким группам пользователей доступна скидка?'),(225,'discount_rule_props','i18n::fields-group-discount_rule_props',95,1,1,5,0,'При активации этого правила скидка на товар будет применяться в том случае, если все указанные связанные товары находятся в корзине'),(226,'delivery_description_props','i18n::fields-group-delivery_description',96,1,1,5,0,'Настройки доставки самовывозом'),(227,'delivery_description_props','i18n::fields-group-delivery_description',97,1,1,5,0,'Общая информация об этом способе курьерской доставки'),(228,'delivery_courier_props','i18n::fields-group-delivery_courier_props',97,1,1,10,0,'Настройки стоимости этого способа курьерской доставки'),(229,'delivery_description_props','i18n::fields-group-delivery_description',98,1,1,5,0,'Общая информация об этом способе курьерской доставки'),(230,'settings','i18n::fields-group-settings',98,1,1,10,0,'Настройки этого способа доставки Почтой России'),(231,'delivery_description_props','i18n::fields-group-delivery_description',99,1,1,5,0,'Общие настройки способа доставки'),(232,'settings','i18n::fields-group-settings',99,1,1,10,1,'<p>Настройки способа доставки ApiShip.<br />API Key Яндекс.Карт можно получить на странице: <br /><a href=\"https://developer.tech.yandex.ru/services\">https://developer.tech.yandex.ru/services</a><br />Нужно выбрать API Карты, JavaScript API и HTTP Геокодер</p>'),(233,'payment_props','i18n::fields-group-payment_props',100,1,1,5,0,'Если установлено - не будет отображаться на сайте'),(234,'settings','i18n::fields-group-parameters',100,1,1,10,0,''),(235,'payment_props','i18n::fields-group-payment_props',101,1,1,5,0,'Общие настройки способа оплаты'),(236,'settings','i18n::fields-group-parameters',101,1,1,10,0,'Настройки способа оплаты данного типа'),(237,'payment_props','i18n::fields-group-payment_props',102,1,1,5,0,'Общие настройки способа оплаты'),(238,'payment_props','i18n::fields-group-payment_props',103,1,1,5,0,'Общие настройки способа оплаты'),(239,'settings','i18n::fields-group-parameters',103,1,1,10,0,'Настройки способа оплаты данного типа'),(242,'payment_props','i18n::fields-group-payment_props',105,1,1,5,0,'Если установлено - не будет отображаться на сайте'),(243,'organization','i18n::fields-group-organization_data',105,1,1,10,0,''),(244,'payment_props','i18n::fields-group-payment_props',106,1,1,5,0,'Общие настройки способа оплаты'),(245,'settings','i18n::fields-group-parameters',106,1,1,10,0,'Настройки способа оплаты данного типа'),(246,'payment_props','i18n::fields-group-payment_props',107,1,1,5,0,'Общие настройки способа оплаты'),(247,'settings','i18n::fields-group-parameters',107,1,1,10,0,'Настройки способа оплаты данного типа'),(253,'payment_props','i18n::fields-group-payment_props',111,1,1,5,1,'Общие настройки способа оплаты'),(254,'settings','i18n::fields-group-parameters',111,1,1,10,1,'Настройки способа оплаты данного типа'),(255,'payment_props','i18n::fields-group-payment_props',112,1,1,5,1,'Общие настройки способа оплаты'),(256,'settings','i18n::fields-group-parameters',112,1,1,10,1,'Настройки способа оплаты данного типа'),(257,'common_props','i18n::fields-group-common_props',113,1,1,5,1,''),(258,'common','i18n::fields-group-common',114,1,0,5,1,'Основные настройки баннера'),(259,'redirect_props','i18n::fields-group-redirect_props',114,1,0,10,1,'Настройки перехода с баннера'),(260,'view_params','i18n::fields-group-view_params',114,1,0,15,1,'Статистика и ограничения баннера'),(261,'view_pages','i18n::fields-group-view_pages',114,1,1,20,1,'Где будет отображаться баннер'),(262,'time_targeting','i18n::fields-group-time_targeting',114,1,1,25,1,'Таргетинг показов баннера по временным параметрам'),(263,'city_targeting','i18n::fields-group-city_targeting',114,0,1,30,1,''),(264,'view_settings','i18n::fields-group-privacy',114,1,1,35,0,'Настройки отображения баннера'),(265,'common','i18n::fields-group-common',115,1,0,5,1,'Основные настройки баннера'),(266,'banner_custom_props','i18n::fields-group-banner_custom_props',115,1,1,10,1,'Графические настройки баннера'),(267,'redirect_props','i18n::fields-group-redirect_props',115,1,0,15,1,'Настройки перехода с баннера'),(268,'view_params','i18n::fields-group-view_params',115,1,0,20,1,'Статистика и ограничения баннера'),(269,'view_pages','i18n::fields-group-view_pages',115,1,1,25,1,'Где будет отображаться баннер'),(270,'time_targeting','i18n::fields-group-time_targeting',115,1,1,30,1,'Таргетинг показов баннера по временным параметрам'),(271,'city_targeting','i18n::fields-group-city_targeting',115,0,1,35,1,''),(272,'view_settings','i18n::fields-group-privacy',115,1,1,40,0,'Настройки отображения баннера'),(273,'common','i18n::fields-group-common',116,1,0,5,1,''),(274,'banner_custom_props','i18n::fields-group-banner_custom_props',116,1,1,10,1,'Графические настройки баннера'),(275,'redirect_props','i18n::fields-group-redirect_props',116,1,0,15,1,'Настройки перехода с баннера'),(276,'view_params','i18n::fields-group-view_params',116,1,0,20,1,'Статистика и ограничения баннера'),(277,'view_pages','i18n::fields-group-view_pages',116,1,1,25,1,'Где будет отображаться баннер'),(278,'time_targeting','i18n::fields-group-time_targeting',116,1,1,30,1,'Таргетинг показов баннера по временным параметрам'),(279,'city_targeting','i18n::fields-group-city_targeting',116,0,1,35,1,''),(280,'view_settings','i18n::fields-group-privacy',116,1,1,40,0,'Настройки отображения баннера'),(281,'common','i18n::fields-group-common',117,1,0,5,1,'Основные настройки баннера'),(282,'banner_custom_props','i18n::fields-group-banner_custom_props',117,1,1,10,1,'Содержимое баннера'),(283,'redirect_props','i18n::fields-group-redirect_props',117,1,0,15,1,'Настройки перехода с баннера'),(284,'view_params','i18n::fields-group-view_params',117,1,0,20,1,'Статистика и ограничения баннера'),(285,'view_pages','i18n::fields-group-view_pages',117,1,1,25,1,'Где будет отображаться баннер'),(286,'time_targeting','i18n::fields-group-time_targeting',117,1,1,30,1,'Таргетинг показов баннера по временным параметрам'),(287,'city_targeting','i18n::fields-group-city_targeting',117,0,1,35,1,''),(288,'view_settings','i18n::fields-group-privacy',117,1,1,40,0,'Настройки отображения баннера'),(289,'svojstva','i18n::fields-group-svojstva',118,1,1,5,0,''),(290,'common','i18n::fields-group-props',119,1,1,5,0,'Общие настройки экспорта данных'),(291,'common','i18n::fields-group-common',120,1,1,5,1,'Формат, в который будут перобразованы данные из UMI.CMS'),(292,'channel_meta','i18n::fields-group-channel-meta',120,1,1,10,0,'<p><a href=\"https://tech.yandex.ru/turbo/doc/rss/markup-docpage/\">https://tech.yandex.ru/turbo/doc/rss/markup-docpage/</a></p>'),(293,'channel_web_analytics','i18n::fields-group-channel-web-analytics',120,1,1,15,0,'<p><a href=\"https://tech.yandex.ru/turbo/doc/settings/analytics-docpage/\">https://tech.yandex.ru/turbo/doc/settings/analytics-docpage/</a></p>'),(294,'channel_advertising','i18n::fields-group-channel-advertising',120,1,1,20,0,'<p><a href=\"https://tech.yandex.ru/turbo/doc/settings/ads-docpage/\">https://tech.yandex.ru/turbo/doc/settings/ads-docpage/</a></p>'),(295,'common','i18n::fields-group-props',121,1,1,5,0,'Общие настройки импорта данных'),(296,'common','i18n::fields-group-common',122,1,0,5,1,'Основные настройки страницы скачиваемого файла'),(298,'more_params','i18n::fields-group-more_params',122,1,0,15,1,'Настройки отображения страницы и её поисковой индексации'),(299,'fs_file_props','i18n::fields-group-fs_file_props',122,1,0,20,1,'Свойства скачиваемого файла'),(300,'rate_voters','i18n::fields-group-rate_voters',122,1,0,25,1,''),(301,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',122,0,1,30,1,'Управление статусом публикации'),(302,'locks','i18n::fields-group-locks',122,1,1,35,1,''),(303,'common','i18n::fields-group-common_group',123,1,0,5,1,''),(304,'common','i18n::fields-group-common',124,1,1,5,1,''),(305,'common','i18n::fields-group-common',125,1,1,5,1,''),(306,'common','i18n::fields-group-common',126,1,0,5,1,''),(308,'more_params','i18n::fields-group-more_params',126,1,0,15,1,''),(309,'rate_props','i18n::fields-group-rate_props',126,1,0,20,1,''),(310,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',126,0,1,25,1,''),(311,'locks','i18n::fields-group-locks',126,1,1,30,1,''),(312,'appointment','i18n::fields-group-appointment',126,1,1,35,1,''),(313,'sendingdata','i18n::fields-group-SendingData',127,1,0,5,1,NULL),(314,'form_fields','Поля формы',127,1,1,10,0,''),(315,'common','i18n::fields-group-common_group',128,1,0,5,1,NULL),(316,'header','Шапка',128,1,1,10,0,''),(317,'custom_styles','Настройки стиля',128,1,1,15,0,''),(318,'footer','Подвал',128,1,1,20,0,''),(319,'params','i18n::fields-group-parameters',129,1,1,5,0,''),(320,'additional_content','Дополнительный контент',3,1,1,35,0,''),(321,'additional_content','Дополнительный контент',7,1,1,35,0,''),(322,'additional_content','Дополнительный контент',37,1,1,10,0,''),(323,'additional_content','Дополнительный контент',38,1,1,20,0,''),(324,'additional_content','Дополнительный контент',60,1,1,50,0,''),(325,'additional_content','Дополнительный контент',61,1,1,35,0,''),(326,'additional_content','Дополнительный контент',63,1,1,25,0,''),(327,'additional_content','Дополнительный контент',65,1,1,20,0,''),(328,'additional_content','Дополнительный контент',66,1,1,45,0,''),(329,'additional_content','Дополнительный контент',67,1,1,35,0,''),(330,'additional_content','Дополнительный контент',68,1,1,40,0,''),(331,'additional_content','Дополнительный контент',69,1,1,40,0,''),(332,'additional_content','Дополнительный контент',70,1,1,45,0,''),(333,'additional_content','Дополнительный контент',72,1,1,40,0,''),(334,'additional_content','Дополнительный контент',73,1,1,40,0,''),(335,'additional_content','Дополнительный контент',77,1,1,40,0,''),(336,'additional_content','Дополнительный контент',78,1,1,40,0,''),(337,'additional_content','Дополнительный контент',79,1,1,35,0,''),(338,'additional_content','Дополнительный контент',80,1,1,35,0,''),(339,'additional_content','Дополнительный контент',81,1,1,35,0,''),(340,'additional_content','Дополнительный контент',86,1,1,45,0,''),(341,'additional_content','Дополнительный контент',87,1,1,55,0,''),(342,'additional_content','Дополнительный контент',122,1,1,40,0,''),(343,'additional_content','Дополнительный контент',126,1,1,40,0,''),(344,'404_page_settings','Настройки 404 страницы',128,1,1,25,0,''),(345,'search_page_settings','Настройки страницы поиска',128,1,1,30,0,''),(346,'post_by_tag_page_settings','Настройки страницы постов с заданным тегом',128,1,1,35,0,''),(347,'personal_data_policy','Политика обработки персональных данных',128,1,1,40,0,''),(348,'common','i18n::fields-group-common',130,1,0,5,1,NULL),(350,'more_params','i18n::fields-group-more_params',130,1,0,15,1,NULL),(351,'rate_voters','i18n::fields-group-rate_voters',130,1,0,20,1,NULL),(352,'svojstva_publikacii','i18n::fields-group-svojstva_publikacii',130,0,1,25,1,NULL),(353,'locks','i18n::fields-group-locks',130,1,1,30,1,NULL),(354,'additional_content','Дополнительный контент',130,1,1,36,0,NULL),(355,'main_page_content','Контент главной страницы',130,1,1,35,0,''),(356,'order_credit_props','i18n::fields-group-credit',53,1,1,45,0,''),(357,'discount_rule_props','i18n::fields-group-discount_rule_props',131,1,1,5,0,''),(358,'locks','i18n::fields-group-locks',63,1,1,30,1,''),(359,'locks','i18n::fields-group-locks',65,1,1,25,1,''),(360,'common','i18n::fields-group-props',132,1,1,5,0,''),(361,'channel_meta','i18n::fields-group-channel-meta',132,1,1,10,0,''),(362,'channel_web_analytics','i18n::fields-group-channel-web-analytics',132,1,1,15,0,''),(363,'channel_advertising','i18n::fields-group-channel-advertising',132,1,1,20,0,'');
/*!40000 ALTER TABLE `cms3_object_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_field_types`
--

DROP TABLE IF EXISTS `cms3_object_field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_field_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `data_type` enum('int','string','text','relation','file','img_file','swf_file','bool','date','boolean','wysiwyg','password','tags','symlink','price','formula','float','counter','optioned','video_file','color','link_to_object_type','multiple_image','domain_id','domain_id_list','offer_id_list','offer_id','multiple_file','lang_id','lang_id_list','price_type_id') DEFAULT NULL,
  `is_multiple` tinyint(1) DEFAULT '0',
  `is_unsigned` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `data_type` (`data_type`),
  KEY `is_multiple` (`is_multiple`),
  KEY `is_unsigned` (`is_unsigned`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_field_types`
--

LOCK TABLES `cms3_object_field_types` WRITE;
/*!40000 ALTER TABLE `cms3_object_field_types` DISABLE KEYS */;
INSERT INTO `cms3_object_field_types` VALUES (1,'i18n::field-type-boolean','boolean',0,0),(2,'i18n::field-type-color','color',0,0),(3,'i18n::field-type-counter','counter',0,0),(4,'i18n::field-type-date','date',0,0),(5,'i18n::field-type-domain-id','domain_id',0,0),(6,'i18n::field-type-domain-id-list','domain_id_list',1,0),(7,'i18n::field-type-file','file',0,0),(8,'i18n::field-type-float','float',0,0),(9,'i18n::field-type-img_file','img_file',0,0),(10,'i18n::field-type-int','int',0,0),(11,'i18n::field-type-link-to-object-type','link_to_object_type',0,0),(12,'i18n::field-type-multiple-image','multiple_image',1,0),(13,'i18n::field-type-offer-id','offer_id',0,0),(14,'i18n::field-type-offer-id-list','offer_id_list',1,0),(15,'i18n::field-type-optioned','optioned',1,0),(16,'i18n::field-type-password','password',0,0),(17,'i18n::field-type-price','price',0,0),(18,'i18n::field-type-relation','relation',0,0),(19,'i18n::field-type-relation-multiple','relation',1,0),(20,'i18n::field-type-string','string',0,0),(21,'i18n::field-type-swf_file','swf_file',0,0),(22,'i18n::field-type-symlink-multiple','symlink',1,0),(23,'i18n::field-type-tags-multiple','tags',1,0),(24,'i18n::field-type-text','text',0,0),(25,'i18n::field-type-video','video_file',0,0),(26,'i18n::field-type-wysiwyg','wysiwyg',0,0),(27,'i18n::field-type-multiple-file','',1,0),(28,'i18n::field-type-multiple-file','multiple_file',1,0),(29,'i18n::field-type-lang-id','lang_id',0,0),(30,'i18n::field-type-lang-id-list','lang_id_list',1,0),(31,'i18n::field-type-price-type-id','price_type_id',0,0);
/*!40000 ALTER TABLE `cms3_object_field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_fields`
--

DROP TABLE IF EXISTS `cms3_object_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `field_type_id` int unsigned DEFAULT NULL,
  `is_inheritable` tinyint(1) DEFAULT '0',
  `is_visible` tinyint(1) DEFAULT '1',
  `guide_id` int unsigned DEFAULT NULL,
  `in_search` tinyint(1) DEFAULT '1',
  `in_filter` tinyint(1) DEFAULT '1',
  `tip` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `restriction_id` int unsigned DEFAULT NULL,
  `sortable` tinyint DEFAULT '0',
  `is_system` tinyint(1) DEFAULT '0',
  `is_important` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Field to field type relation_FK` (`field_type_id`),
  KEY `FK_Reference_25` (`guide_id`),
  KEY `name` (`name`),
  KEY `title` (`title`),
  KEY `is_locked` (`is_locked`),
  KEY `is_inheritable` (`is_inheritable`),
  KEY `is_visible` (`is_visible`),
  KEY `in_search` (`in_search`),
  KEY `in_filter` (`in_filter`),
  KEY `tip` (`tip`),
  KEY `is_required` (`is_required`),
  KEY `restriction_id` (`restriction_id`),
  KEY `sortable` (`sortable`),
  KEY `is_system` (`is_system`),
  KEY `is_important` (`is_important`),
  CONSTRAINT `FK_Field to field guide relation` FOREIGN KEY (`guide_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_Field to field type relation` FOREIGN KEY (`field_type_id`) REFERENCES `cms3_object_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Field to restriction relation` FOREIGN KEY (`restriction_id`) REFERENCES `cms3_object_fields_restrictions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=544 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_fields`
--

LOCK TABLES `cms3_object_fields` WRITE;
/*!40000 ALTER TABLE `cms3_object_fields` DISABLE KEYS */;
INSERT INTO `cms3_object_fields` VALUES (1,'publish_status_id','i18n::field-publish_status_id',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(2,'title','i18n::field-title',1,20,1,1,NULL,1,0,'',0,NULL,0,0,1),(3,'h1','i18n::field-h1',1,20,1,1,NULL,1,0,'',0,NULL,0,0,1),(4,'content','i18n::field-content',1,26,0,1,NULL,1,0,'',0,NULL,0,0,1),(5,'meta_descriptions','i18n::field-meta_descriptions',1,20,1,1,NULL,1,0,'',0,NULL,0,0,1),(6,'meta_keywords','i18n::field-meta_keywords',1,20,1,1,NULL,1,0,'',0,NULL,0,0,0),(7,'tags','i18n::field-tags',1,23,0,1,NULL,0,0,'',0,NULL,0,0,0),(11,'robots_deny','i18n::field-robots_deny',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(12,'show_submenu','i18n::field-show_submenu',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(13,'is_expanded','i18n::field-is_expanded',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(14,'is_unindexed','i18n::field-is_unindexed',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(15,'rate_voters','i18n::field-rate_voters',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(16,'rate_sum','i18n::field-rate_sum',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(17,'expiration_date','i18n::field-expiration_date',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(18,'notification_date','i18n::field-notification_date',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(19,'publish_comments','i18n::field-publish_comments',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(20,'publish_status','i18n::field-publish_status',1,18,0,1,2,0,0,'',0,NULL,0,0,0),(21,'locktime','i18n::field-locktime',1,4,0,1,NULL,0,0,'',0,NULL,0,1,0),(22,'lockuser','i18n::field-lockuser',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(23,'charset','i18n::field-rss-source-charset',0,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(24,'readme','i18n::field-readme',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(25,'rss_type','i18n::field-rss_type',1,18,0,1,5,0,0,'',0,NULL,0,0,0),(26,'url','i18n::field-url',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(27,'charset_id','i18n::field-rss-source-charset-relation',0,18,0,1,6,0,0,'',0,NULL,0,0,0),(28,'news_rubric','i18n::field-news_rubric',1,19,0,1,7,0,0,'',0,NULL,0,0,0),(29,'quality_value','i18n::field-quality_value',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(30,'country_iso_code','i18n::field-country_code',1,20,0,1,NULL,0,0,'Страна в формате ISO 3166-1 alpha-2',0,NULL,0,0,0),(31,'identifier','i18n::field-idcode',0,10,0,1,NULL,0,0,'',1,NULL,0,0,1),(32,'number','i18n::field-index_number',0,10,0,0,NULL,0,0,'Порядковый номер дня недели (1 (Понедельник) - 7 (Воскресение))',0,NULL,0,0,0),(33,'social_id','i18n::field-social_id',1,10,0,1,NULL,0,0,'',1,NULL,0,0,0),(34,'codename','i18n::field-string_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(35,'codename','i18n::field-currency_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(36,'nominal','i18n::field-nominal',0,10,0,1,NULL,0,0,'',1,NULL,0,0,1),(37,'rate','i18n::field-rate',0,8,0,1,NULL,0,0,'',1,NULL,0,0,1),(38,'prefix','i18n::field-prefix_n',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(39,'suffix','i18n::field-suffix',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(40,'codename','i18n::field-status_code',0,20,0,1,21,0,0,'',1,NULL,0,0,1),(41,'platform_identificator','i18n::field-emarket-mobile-platform_identificator',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(42,'active','i18n::field-emarket-mobile-device-active',0,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(43,'domain_id','i18n::field_domain',1,5,0,1,NULL,0,0,'',0,NULL,0,0,0),(44,'token','i18n::field-emarket-mobile-device-token',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(45,'platform','i18n::field-emarket-mobile-platform',0,18,0,1,23,0,0,'',0,NULL,0,0,0),(46,'lname','i18n::field-lname_oneclick',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(47,'fname','i18n::field-fname_oneclick',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(48,'father_name','i18n::field-father_name_oneclick',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(49,'email','i18n::field-email_oneclick',0,20,0,1,NULL,0,0,'',1,3,0,0,1),(50,'phone','i18n::field-phone_number_oneclick',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(51,'yandex_id','i18n::field-id-for-yandex-kassa',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(52,'payonline_id','i18n::field-id-for-payonline',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(53,'robokassa_id','i18n::field-id-for-robokassa',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(54,'payanyway_id','i18n::field-id-for-payanyway',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(55,'sberbank_id','i18n::field-id-for-sberbank',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(56,'tax','i18n::field-tax',1,20,0,1,NULL,0,0,'',0,NULL,0,1,1),(57,'yandex_id','i18n::field-id-for-yandex-kassa',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(58,'payanyway_id','i18n::field-id-for-payanyway',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(59,'payonline_id','i18n::field-id-for-payonline',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(60,'description','i18n::field-description',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(61,'modificator_codename','i18n::field-identifier',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(62,'modificator_type_id','i18n::field-modificator_type_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(63,'modificator_discount_types','i18n::field-modificator_discount_types',0,19,0,1,30,0,0,'',0,NULL,0,0,1),(64,'modificator_type_guid','i18n::field-modificator_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(65,'modificator_type_id','i18n::field-modificator_type',0,18,0,1,31,0,0,'',1,NULL,0,0,1),(66,'rule_codename','i18n::field-rule_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(67,'rule_type_id','i18n::field-rule_type_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(68,'rule_discount_types','i18n::field-rule_discount_types',0,19,0,1,30,0,0,'',1,NULL,0,0,1),(69,'rule_type_guid','i18n::field-rule_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(70,'rule_type_id','i18n::field-rule_type',0,18,0,1,33,0,0,'',1,NULL,0,0,1),(71,'sid','i18n::field-sid',0,20,0,0,NULL,0,0,'Служит для связи с обработчиками, заполняется разработчиком импотрера',1,NULL,0,0,1),(72,'sid','i18n::field-sid',0,20,0,0,NULL,0,0,'Служит для связи с обработчиками, заполняется разработчиком импотрера',1,NULL,0,0,1),(73,'social_id','i18n::field-social_network_id',0,20,0,1,NULL,0,0,'',1,NULL,0,1,0),(74,'template_id','i18n::field-template_id',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(75,'domain_id','i18n::field-domain_id',1,5,0,0,NULL,0,0,'',0,NULL,0,1,0),(76,'nazvanie_sajta','i18n::field-site_name',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(77,'is_iframe_enabled','i18n::field-is_iframe_enabled',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(78,'iframe_pages','i18n::field-iframe_pages',1,22,0,0,NULL,0,0,'Здесь в дополнение к разделам каталога, можно выбрать, какие страницы нужно показывать в социальной сети',0,NULL,0,0,0),(79,'nazvanie','i18n::field-nazvanie',1,20,0,0,NULL,0,0,'',0,NULL,0,0,1),(80,'country','i18n::field-country',0,18,0,1,10,0,0,'',1,NULL,0,0,0),(81,'index','i18n::field-post_index',0,10,0,1,NULL,0,0,'',1,NULL,0,0,1),(82,'region','i18n::field-geographic_area',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(83,'city','i18n::field-city',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(84,'street','i18n::field-street',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(85,'house','i18n::field-house',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(86,'flat','i18n::field-appartment',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(87,'class_name','i18n::field-item_type_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(88,'discount_type_id','i18n::field-discount_type',0,18,0,1,30,0,0,'Определяет область применения скидки',1,NULL,0,0,1),(89,'discount_modificator_id','i18n::field-price_modificator',0,18,0,1,12,0,0,'Определяет, по какому принципу будет пересчитываться цена',0,NULL,0,0,1),(90,'discount_rules_id','i18n::field-validation_rules',0,19,0,1,13,0,0,'Определяют ограничения по применению скидки',0,NULL,0,0,1),(91,'is_active','i18n::field-is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(92,'description','i18n::field-description',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(93,'item_amount','i18n::field-item_amount',0,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(94,'item_price','i18n::field-item_price',0,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(95,'item_total_original_price','i18n::field-item_total_original_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(96,'item_actual_price','i18n::field-item_actual_price',0,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(97,'item_total_price','i18n::field-item_total_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(98,'item_type_id','i18n::field-item_type',0,18,0,1,41,0,0,'',0,NULL,0,0,1),(99,'item_link','i18n::field-item_link',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(100,'item_discount_id','i18n::field-catalog_object_discount',0,18,0,1,42,0,0,'',0,NULL,0,0,1),(101,'item_discount_value','i18n::field-order-item-discount-value',1,17,0,1,NULL,0,0,'i18n::field-order-item-discount-value',0,NULL,0,0,1),(102,'weight','i18n::field-order-item-weight',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(103,'width','i18n::field-order-item-width',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(104,'height','i18n::field-order-item-height',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(105,'length','i18n::field-order-item-length',1,8,0,1,NULL,0,0,'',0,NULL,0,0,1),(106,'tax_rate_id','i18n::field-tax-rate-id',1,18,0,1,27,0,0,'',0,NULL,0,0,1),(107,'payment_mode','i18n::field-payment_mode',1,18,0,1,29,0,0,'',0,NULL,0,0,1),(108,'payment_subject','i18n::field-payment_subject',1,18,0,1,28,0,0,'',0,NULL,0,0,1),(109,'options','i18n::field-item_options',0,15,0,1,43,0,0,'',0,NULL,0,0,1),(110,'trade_offer','i18n::field-trade-offer',1,13,0,0,NULL,0,0,'',0,NULL,0,0,1),(111,'priority','i18n::field-order-delivery-priority',0,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(112,'class_name','i18n::field-payment_type_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(113,'payment_type_id','i18n::field-payment_datatype_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(114,'payment_type_guid','i18n::field-payment_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(115,'payment_type_id','i18n::field-payment_type',1,18,0,1,46,0,0,'',1,NULL,0,0,1),(116,'disabled','i18n::field-disabled',1,1,0,0,NULL,0,0,'Если установлено - не будет отображаться на сайте',0,NULL,0,0,1),(117,'domain_id_list','i18n::field-valid-domain-list',1,6,0,1,NULL,0,0,'Если применимо для всех доменов - оставьте список пустым',0,NULL,0,0,1),(118,'contact_person','i18n::field-contact_person',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(119,'phone_number','i18n::field-phone_number',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(120,'fax','i18n::field-fax',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(121,'name','i18n::field-organisation_name',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(122,'legal_address','i18n::field-legal_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(123,'defacto_address','i18n::field-defacto_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(124,'post_address','i18n::field-post_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(125,'inn','i18n::field-TIN',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(126,'account','i18n::field-account',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(127,'bank','i18n::field-bank',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(128,'bank_account','i18n::field-bank_account',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(129,'bik','i18n::field-bik',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(130,'ogrn','i18n::field-ogrn',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(131,'kpp','i18n::field-RRC',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(132,'class_name','i18n::field-delivery_type_id',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(133,'delivery_type_id','i18n::field-delivery_datatype_id',0,11,0,1,NULL,0,0,'',0,NULL,0,0,1),(134,'delivery_type_guid','i18n::field-delivery_type_guid',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(135,'description','i18n::field-delivery_description',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(136,'delivery_type_id','i18n::field-delivery_type',0,18,0,0,50,0,0,'',1,NULL,0,0,1),(137,'price','i18n::field-delivery_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(138,'tax_rate_id','i18n::field-tax-rate-id',1,18,0,1,27,0,0,'',0,NULL,0,0,1),(139,'disabled','i18n::field-disabled',1,1,0,0,NULL,0,0,'Если установлено - не будет отображаться на сайте',0,NULL,0,0,1),(140,'domain_id_list','i18n::field-valid-domain-list',1,6,0,1,NULL,0,0,'Если применимо для всех доменов - оставьте список пустым',0,NULL,0,0,1),(141,'payment_mode','i18n::field-payment_mode',1,18,0,1,29,0,0,'',0,NULL,0,0,1),(142,'payment_subject','i18n::field-payment_subject',1,18,0,1,28,0,0,'',0,NULL,0,0,1),(143,'disabled_types_of_payment','i18n::field-disabled_types_of_payment',1,19,0,1,47,0,0,'',0,NULL,0,0,1),(144,'order_items','i18n::field-order_items',0,19,0,1,44,0,0,'',0,NULL,0,0,1),(145,'number','i18n::field-order_number',0,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(146,'social_order_id','i18n::field-social_order_id',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(148,'customer_id','i18n::field-customer',0,18,0,1,54,0,0,'',0,NULL,0,0,1),(149,'domain_id','i18n::field-domain_name',0,5,0,1,NULL,0,0,'',0,NULL,0,0,0),(150,'manager_id','i18n::field-manager',0,18,0,1,54,0,0,'',0,NULL,0,0,1),(151,'status_id','i18n::field-order_status',0,18,0,1,45,0,0,'',0,NULL,0,0,1),(152,'total_original_price','i18n::field-order_original_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(153,'total_price','i18n::field-total_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(154,'total_amount','i18n::field-total_amount',0,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(155,'status_change_date','i18n::field-status_change_date',0,4,0,1,NULL,0,0,'Выставляется автоматически, когда происходит изменение статуса заказа',0,NULL,0,0,0),(156,'order_date','i18n::field-order_date',0,4,0,1,NULL,0,0,'Дата, когда заказ был оформлен покупателем',0,NULL,0,0,1),(157,'order_discount_value','i18n::field-order-discount-value',1,17,0,1,NULL,0,0,'i18n::field-order-discount-value',0,NULL,0,0,1),(158,'is_reserved','i18n::field-is_reserved',0,1,0,0,NULL,0,0,'',0,NULL,0,1,0),(159,'service_info','i18n::field-order_service_info',0,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(160,'order_comment','i18n::field-order-comment',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(168,'http_referer','i18n::field-referer',0,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(169,'http_target','i18n::field-target',0,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(170,'source_domain','i18n::field-source_domain',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(171,'utm_medium','i18n::field-utm_medium',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(172,'utm_term','i18n::field-utm_term',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(173,'utm_campaign','i18n::field-utm_campaign',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(174,'utm_content','i18n::field-utm_content',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(175,'order_create_date','i18n::field-order_create_date',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(176,'payment_id','i18n::field-payment_id',0,18,0,1,47,0,0,'',0,NULL,0,0,1),(177,'payment_name','i18n::field-payment-name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(178,'payment_status_id','i18n::field-payment_status',0,18,0,1,48,0,0,'',0,NULL,0,0,1),(179,'payment_date','i18n::field-payment_date',0,4,0,1,NULL,0,0,'Дата успешной оплаты заказа',0,NULL,0,0,0),(180,'payment_document_num','i18n::field-payment_document_number',0,20,0,1,NULL,0,0,'Заполняется системой автоматически',0,NULL,0,0,0),(181,'legal_person','i18n::field-legal_person',1,18,0,1,49,0,0,'',0,NULL,0,0,1),(182,'delivery_id','i18n::field-delivery_id',0,18,0,1,51,0,0,'',0,NULL,0,0,1),(183,'delivery_name','i18n::field-delivery-name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(184,'delivery_status_id','i18n::field-delivery_status',0,18,0,1,52,0,0,'',0,NULL,0,0,1),(185,'delivery_address','i18n::field-destination_address',0,18,0,1,40,0,0,'',0,NULL,0,0,1),(186,'delivery_date','i18n::field-delivery-date',1,4,0,1,NULL,0,0,'Дата, когда товар будет доставлен клиенту или на пункт выдачи',0,NULL,0,0,1),(187,'pickup_date','i18n::field-pickup-date',1,4,0,1,NULL,0,0,'Даpickup_typeта, когда товар будет доставлен на пункт приема или когда нужно его забрать со склада',0,NULL,0,0,1),(188,'delivery_provider','i18n::field-delivery-provider',1,20,0,1,NULL,0,0,'i18n::field-delivery-provider',0,NULL,0,0,1),(189,'delivery_tariff','i18n::field-delivery-tariff',1,20,0,1,NULL,0,0,'i18n::field-delivery-tariff',0,NULL,0,0,1),(190,'delivery_type','i18n::field-delivery-type',1,20,0,1,NULL,0,0,'Тип доставки товара клиенту',0,NULL,0,0,1),(191,'pickup_type','i18n::field-pickup-type',1,20,0,1,NULL,0,0,'Тип доставки товара поставщику',0,NULL,0,0,1),(192,'delivery_price','i18n::field-del_price',0,17,0,1,NULL,0,0,'',0,NULL,0,0,1),(193,'delivery_point_in','i18n::field-delivery-point-in-id',1,20,0,1,NULL,0,0,'Точка приема товара',0,NULL,0,0,1),(194,'delivery_point_out','i18n::field-delivery-point-out-id',1,20,0,1,NULL,0,0,'Точка выдачи товара',0,NULL,0,0,1),(195,'total_weight','i18n::field-order-total-weight',1,8,0,1,NULL,0,0,'i18n::field-order-total-weight-tip',0,NULL,0,0,1),(196,'total_width','i18n::field-order-book-total-width',1,8,0,1,NULL,0,0,'i18n::field-order-book-total-width-tip',0,NULL,0,0,0),(197,'total_height','i18n::field-order-total-height',1,8,0,1,NULL,0,0,'i18n::field-order-total-height-tip',0,NULL,0,0,0),(198,'total_length','i18n::field-order-total-length',1,8,0,1,NULL,0,0,'i18n::field-ordelivery_providerder-total-length-tip',0,NULL,0,0,0),(199,'delivery_allow_date','i18n::field-delivery_allow_date',0,4,0,1,NULL,0,0,'Заполняется системой автоматически, когда возможна доставка и заказ успешно оплачен',0,NULL,0,0,0),(200,'order_discount_id','i18n::field-order_discount',0,18,0,1,42,0,0,'',0,NULL,0,0,1),(201,'bonus','i18n::field-spent_bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(202,'need_export','i18n::field-export_1C',0,1,0,1,NULL,0,0,'Выставляется системой автоматически, когда заказ необходимо выгрузить в 1С',0,NULL,0,0,0),(203,'purchaser_one_click','i18n::field-customer',1,18,0,1,25,0,0,'',0,NULL,0,0,1),(204,'login','i18n::field-login',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(205,'password','i18n::field-password',1,16,0,1,NULL,0,0,'',0,NULL,0,0,0),(206,'groups','i18n::field-groups',1,19,0,0,39,0,0,'',0,NULL,0,0,1),(207,'e-mail','i18n::field-e-mail',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(208,'activate_code','i18n::field-activate_code',1,20,0,0,NULL,0,0,'',0,NULL,0,1,0),(209,'loginza','i18n::field-loginza',1,20,0,1,NULL,0,0,'Адрес сервиса',0,NULL,0,0,0),(210,'is_activated','i18n::field-is_activated',1,1,0,0,NULL,0,0,'',0,NULL,0,0,1),(211,'last_request_time','i18n::field-last_request_time',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(212,'subscribed_pages','i18n::field-subscribed_pages',1,22,0,0,NULL,0,0,'',0,NULL,0,1,0),(213,'rated_pages','i18n::field-rated_pages',1,22,0,0,NULL,0,0,'',0,NULL,0,1,0),(214,'is_online','i18n::field-is_online',1,1,0,0,NULL,0,0,'',0,NULL,0,1,0),(215,'messages_count','i18n::field-messages_count',1,10,0,0,NULL,0,0,'',0,NULL,0,1,0),(216,'orders_refs','i18n::field-orders_refs',1,19,0,0,NULL,0,0,'',0,NULL,0,1,0),(217,'delivery_addresses','i18n::field-delivery_addresses',1,19,0,1,40,0,0,'',0,NULL,0,1,0),(218,'user_dock','i18n::field-user_dock',1,20,0,0,NULL,0,0,'',0,NULL,0,1,0),(219,'preffered_currency','i18n::field-preffered_currency',1,18,0,0,21,0,0,'',0,NULL,0,0,0),(220,'user_settings_data','i18n::field-user_settings_data',1,24,0,0,NULL,0,0,'',0,NULL,0,1,0),(221,'last_order','i18n::field-last_order',1,15,0,0,53,0,0,'',0,NULL,0,1,0),(222,'bonus','i18n::field-bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(223,'legal_persons','i18n::field-legal_persons',1,19,0,1,49,0,0,'',0,NULL,0,1,1),(224,'spent_bonus','i18n::field-spent_bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(225,'filemanager_directory','i18n::field-filemanager-directory',1,20,0,0,NULL,0,0,'Список доступных пользователю директорий. В качестве разделителя используется запятая - например: /image/cms, /files.',0,NULL,0,0,0),(226,'appended_file_extensions','i18n::field-appended-file-extensions',1,20,0,0,NULL,0,0,'Список дополнительных расширений файлов, которые пользователь может загружать на сервер. В качестве разделителя используется запятая - например: cdr, mid, midi.',0,NULL,0,0,0),(227,'register_date','i18n::field-register_date',0,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(228,'tickets_color','i18n::field-tickets_color',0,2,0,0,NULL,0,0,'Фоновый цвет заметок',0,NULL,0,0,0),(229,'favorite_domain_list','i18n::field-favorite_domain_list',0,6,0,0,NULL,0,0,'Если заполнено - для пользователя будут выводиться только эти домены в административной панели во вкладке \"Структура сайта\".',0,NULL,0,0,0),(230,'lname','i18n::field-lname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(231,'fname','i18n::field-fname',1,20,0,1,NULL,0,0,'Это поле содержит Имя пользователя. Оно отображается в характеристиках пользователя и может быть изменено самим пользователем.',1,NULL,0,0,1),(232,'father_name','i18n::field-father_name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(233,'phone','i18n::field-phone_n',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(234,'referer','i18n::field-referer',0,24,0,0,NULL,0,0,'',0,NULL,0,0,0),(235,'target','i18n::field-target',0,24,0,0,NULL,0,0,'',0,NULL,0,0,0),(236,'primary','i18n::field-primary_store',0,1,0,1,NULL,0,0,'Основной склад, с которого будут списываться товары при покупке, и с которым будет синхронизироваться 1C',0,NULL,0,0,1),(237,'proc','i18n::field-proc',0,8,0,1,NULL,0,0,'',1,NULL,0,0,1),(238,'users','i18n::field-users',0,19,0,1,54,0,0,'Пользователи, которым будет доступна скидка',1,NULL,0,0,1),(239,'menu_id','i18n::field-menu-menu_id',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(240,'menuhierarchy','i18n::field-menuhierarchy',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(241,'anons','i18n::field-anons',1,26,0,1,NULL,1,0,'',0,NULL,0,0,1),(242,'source','i18n::field-source',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(243,'source_url','i18n::field-source_url',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(244,'publish_time','i18n::field-faq_publish_time',1,4,0,1,NULL,0,1,'',0,NULL,0,0,1),(245,'begin_time','i18n::field-begin_time',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(246,'end_time','i18n::field-end_time',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(247,'anons_pic','i18n::field-anons_pic',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(248,'publish_pic','i18n::field-publish_pic',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(249,'subjects','i18n::field-subjects',1,19,0,1,59,0,0,'',0,NULL,0,0,0),(250,'user_id','i18n::field-user_id',1,18,0,1,54,0,0,'',0,NULL,0,1,0),(251,'message','i18n::field-message',1,24,0,1,NULL,1,0,'',0,NULL,0,0,1),(252,'x','i18n::field-x',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(253,'y','i18n::field-y',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(254,'width','i18n::field-width',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(255,'height','i18n::field-height',1,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(256,'url','i18n::field-url',1,20,0,1,NULL,0,0,'',0,NULL,0,1,1),(257,'create_time','i18n::field-create_time',1,4,0,1,NULL,0,0,'',0,NULL,0,1,0),(258,'description','i18n::field-description',1,20,0,1,NULL,0,1,'',0,NULL,0,0,1),(259,'friendlist','i18n::field-friendlist',1,19,0,1,54,0,1,'',0,NULL,0,0,0),(260,'is_registrated','i18n::field-is_registrated',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(261,'user_id','i18n::field-user_id',1,18,0,1,54,0,0,'',0,NULL,0,0,0),(262,'nickname','i18n::field-nickname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(263,'email','i18n::field-email',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(264,'ip','i18n::field-ip',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(265,'author_id','i18n::field-author_id',1,18,1,0,64,0,1,'Идентификатор автора комментария',0,NULL,0,0,0),(266,'is_spam','i18n::field-is_spam',0,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(267,'only_for_friends','i18n::field-only_for_friends',1,1,0,1,NULL,0,1,'',0,NULL,0,0,0),(268,'descr','i18n::field-descr',1,26,0,1,NULL,1,0,'',0,NULL,0,0,1),(269,'topics_count','i18n::field-topics_count',1,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(270,'messages_count','i18n::field-messages_count',1,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(271,'last_message','i18n::field-last_message',1,22,0,0,NULL,0,0,'',0,NULL,0,0,0),(272,'last_post_time','i18n::field-last_post_time',1,10,0,0,NULL,0,0,'',0,NULL,0,0,0),(273,'message','i18n::field-message',1,24,0,1,NULL,1,0,'',0,NULL,0,0,1),(274,'count','i18n::field-count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(275,'poll_rel','i18n::field-poll_rel',1,18,0,0,72,0,0,'',0,NULL,0,0,0),(276,'is_closed','i18n::field-is_closed',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(277,'question','i18n::field-question',1,24,0,1,NULL,1,0,'Вопрос пользователя',0,NULL,0,0,1),(278,'answers','i18n::field-answers',1,19,0,1,71,0,0,'',0,NULL,0,0,1),(279,'total_count','i18n::field-total_count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,1),(280,'form_id','i18n::field-form_id',1,11,0,0,NULL,0,1,'',0,NULL,0,0,1),(281,'destination_address','i18n::field-destination_address',1,20,0,0,NULL,0,0,'',0,NULL,0,0,1),(282,'sender_ip','i18n::field-sender_ip',1,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(283,'sending_time','i18n::field-sending_time',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(284,'wf_message','i18n::option-message',0,26,0,1,NULL,0,0,'',0,5,0,0,0),(285,'from_email_template','i18n::field-from_email_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(286,'from_template','i18n::field-from_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(287,'subject_template','i18n::field-subject_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(288,'master_template','i18n::field-master_template',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(289,'autoreply_from_email_template','i18n::field-autoreply_from_email_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(290,'autoreply_from_template','i18n::field-autoreply_from_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(291,'autoreply_subject_template','i18n::field-autoreply_subject_template',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(292,'autoreply_email_recipient','i18n::field-autoreply_email_recipient',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(293,'autoreply_template','i18n::field-autoreply_template',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(294,'posted_message','i18n::field-message_sent',1,26,0,1,NULL,0,0,'',0,NULL,0,0,0),(295,'form_id','i18n::field-form_id',1,11,0,0,NULL,0,0,'',0,NULL,0,0,1),(296,'address_description','i18n::field-address_description',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(297,'address_list','i18n::field-address_list',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(298,'form_id','i18n::field-form_id',1,20,0,0,NULL,0,0,'',0,NULL,0,1,1),(299,'create_time','i18n::field-create_time',1,4,0,1,NULL,0,0,'',0,NULL,0,0,0),(300,'user_id','i18n::field-user_id',1,18,0,0,54,0,0,'',0,NULL,0,0,0),(301,'photo','i18n::field-photo',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(302,'answer','i18n::field-answer',1,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(303,'disp_last_release','i18n::field-disp_last_release',1,4,0,1,NULL,0,1,'',0,NULL,0,0,1),(304,'disp_description','i18n::field-disp_description',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(305,'forced_subscribers','i18n::field-forced_subscribers',1,22,0,1,NULL,0,1,'',0,NULL,0,0,1),(306,'news_relation','i18n::field-news_relation',1,18,0,1,7,0,1,'',0,NULL,0,0,0),(307,'is_active','i18n::field-is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(308,'load_from_forum','i18n::field-load_from_forum',0,1,0,1,NULL,0,0,'Может быть установлено только для одной рассылки одновременно',0,NULL,0,0,0),(309,'days','i18n::field-days',0,19,0,0,17,0,0,'Дни недели, в которые будет происходить автоматическая рассылка',0,NULL,0,0,0),(310,'hours','i18n::field-hours',0,19,0,0,16,0,0,'Часы, в которые будет происходить автоматическая рассылка',0,NULL,0,0,0),(311,'status','i18n::field-status',1,1,0,1,NULL,0,1,'',0,NULL,0,0,1),(312,'date','i18n::field-date',1,4,0,1,NULL,0,1,'',0,NULL,0,0,1),(313,'disp_reference','i18n::field-disp_reference',1,10,0,0,NULL,0,1,'',0,NULL,0,0,0),(314,'header','i18n::field-header',1,20,0,0,NULL,1,0,'',0,NULL,0,0,1),(315,'body','i18n::field-body',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(316,'release_reference','i18n::field-release_reference',1,10,0,0,NULL,0,1,'',0,NULL,0,0,0),(317,'attach_file','i18n::field-attach_file',1,7,0,1,NULL,0,0,'',0,NULL,0,0,0),(318,'msg_date','i18n::field-msg_date',1,4,0,1,NULL,0,1,'',0,NULL,0,0,0),(319,'short_body','i18n::field-short_body',1,26,0,1,NULL,0,1,'',0,NULL,0,0,1),(320,'new_relation','i18n::field-new_relation',1,22,0,0,NULL,0,1,'',0,NULL,0,0,0),(321,'lname','i18n::field-lname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(322,'fname','i18n::field-fname',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(323,'father_name','i18n::field-father_name',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(324,'gender','i18n::field-gender',1,18,0,1,4,0,0,'',0,NULL,0,0,0),(325,'uid','i18n::field-uid',1,18,0,0,54,0,1,'',0,NULL,0,0,0),(326,'subscriber_dispatches','i18n::field-subscriber_dispatches',1,19,0,1,82,0,1,'',0,NULL,0,0,1),(327,'sent_release_list','i18n::field-sent_release_list',1,19,0,1,83,0,0,'',0,NULL,0,0,1),(328,'subscribe_date','i18n::field-subscribe_date',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(330,'index_source','i18n::field-index_source',0,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(331,'index_state','i18n::field-index_state',0,8,0,1,NULL,0,0,'',0,NULL,0,1,0),(332,'index_date','i18n::field-index_date',0,4,0,1,NULL,0,0,'',0,NULL,0,1,0),(333,'index_choose','i18n::field-index_choose',0,1,0,1,NULL,0,0,'',0,NULL,0,1,0),(334,'index_level','i18n::field-index_level',0,10,0,1,NULL,0,0,'',0,NULL,0,1,0),(335,'date_create_object','i18n::field-date_create_object',1,4,0,0,NULL,0,0,'',0,NULL,0,0,0),(336,'tax_rate_id','i18n::field-tax-rate-id',1,18,0,1,27,0,0,'',0,NULL,0,0,1),(337,'price','i18n::field-price',1,17,0,1,NULL,0,1,'',0,NULL,0,0,1),(338,'payment_mode','i18n::field-payment_mode',1,18,0,1,29,0,0,'',0,NULL,0,0,1),(339,'payment_subject','i18n::field-payment_subject',1,18,0,1,28,0,0,'',0,NULL,0,0,1),(340,'stores_state','i18n::field-stores_state',0,15,0,1,55,0,0,'',0,NULL,0,0,1),(341,'reserved','i18n::field-reserved',0,10,0,0,NULL,0,0,'i18n::field-tip-number-reserved-items',0,NULL,0,1,0),(342,'common_quantity','i18n::field-common-quantity',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(343,'trade_offer_image','i18n::field-trade-offer-image',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(344,'trade_offer_list','i18n::field-trade-offer-list',1,14,0,0,NULL,0,0,'',0,NULL,0,0,1),(345,'preffered_currency','i18n::field-preffered_currency',0,18,0,0,21,0,0,'',0,NULL,0,0,0),(346,'last_order','i18n::field-last_order',1,15,0,0,53,0,0,'',0,NULL,0,1,0),(347,'bonus','i18n::field-bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(348,'spent_bonus','i18n::field-spent_bonus',1,17,0,0,NULL,0,0,'',0,NULL,0,0,0),(349,'ip','i18n::field-ip_address',0,20,0,0,NULL,0,0,'',0,NULL,0,0,0),(350,'delivery_addresses','i18n::field-delivery_addresses',0,19,0,1,40,0,0,'',0,NULL,0,0,1),(351,'legal_persons','i18n::field-legal_persons',1,19,0,1,49,0,0,'',0,NULL,0,0,1),(352,'size','i18n::field-discount_size',0,8,0,1,NULL,0,0,'Размер скидки, который будет вычтен из стоимости заказа',1,NULL,0,0,1),(353,'catalog_items','i18n::field-goods',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(354,'start_date','i18n::field-discount_start',0,4,0,1,NULL,0,0,'Определяет, с какого момента скидка будет действительна',0,NULL,0,0,0),(355,'end_date','i18n::field-discount_end',0,4,0,1,NULL,0,0,'Определяет, когда заканчивается срок действия скидки',0,NULL,0,0,0),(356,'minimum','i18n::field-minimal_order_price',0,8,0,1,NULL,0,0,'Минимальная стоимость заказа, когда действует скидка',0,NULL,0,0,1),(357,'maximum','i18n::field-maximal_order_price',0,8,0,1,NULL,0,0,'Максимальная стоимость заказа, когда действует скидка',0,NULL,0,0,1),(358,'minimal','i18n::field-minimal_summ',0,8,0,1,NULL,0,0,'Минимальная сумма стоимости заказов действия скидки',0,NULL,0,0,1),(359,'maximum','i18n::field-maximal_summ',0,8,0,1,NULL,0,0,'Максимальная сумма стоимости заказов действия скидки',0,NULL,0,0,1),(360,'user_groups','i18n::field-groups',0,19,0,1,39,0,0,'Список групп пользователей, которым будет доступна эта скидка',1,NULL,0,0,1),(361,'related_items','i18n::field-connected_items',0,22,0,1,NULL,0,0,'Список товаров, которые должен положить в корзину пользователь, чтобы пойдействовала скидка',1,NULL,0,0,1),(362,'order_min_price','i18n::field-order_min_price',0,8,0,1,NULL,0,0,'Стоимость заказа, после которой доставка производится бесплатно',0,NULL,0,0,1),(363,'viewpost','i18n::field-viewpost',0,18,0,1,14,0,0,'',1,NULL,0,0,0),(364,'zip_code','i18n::field-departure_city_zip_code',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(365,'login','i18n::field-apiship-login',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(366,'password','i18n::field-apiship-password',1,16,0,1,NULL,0,0,'',0,NULL,0,0,1),(367,'dev_mode','i18n::field-apiship-dev-mode',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(368,'keep_log','i18n::field-keep-log',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(369,'providers','i18n::field-apiship-providers',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(370,'delivery_types','i18n::field-apiship-delivery-types',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(371,'pickup_types','i18n::field-apiship-pickup-types',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(372,'settings','i18n::field-apiship-settings',1,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(373,'reciever','i18n::field-reciever',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(374,'reciever_inn','i18n::field-reciever_inn',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(375,'reciever_account','i18n::field-reciever_account',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(376,'reciever_bank','i18n::field-reciever_bank',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(377,'bik','i18n::field-bik',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(378,'reciever_bank_account','i18n::field-reciever_bank_account',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(379,'merchant_id','i18n::field-merchant_id',0,20,0,1,NULL,0,0,'Выдается при регистрации в PayOnline System',1,NULL,0,0,0),(380,'private_key','i18n::field-private_key',0,20,0,1,NULL,0,0,'Выдается при регистрации в PayOnline System',1,NULL,0,0,0),(381,'receipt_data_send_enable','i18n::field-receipt-data-send-enable',1,1,0,1,NULL,0,0,'Используется для реализации ФЗ-54, требует заполнения ставки НДС у товаров и доставок',0,NULL,0,0,1),(382,'keep_log','i18n::field-keep-log',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(383,'login','i18n::field-login',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(384,'password1','i18n::field-password1',0,20,0,1,NULL,0,0,'используется интерфейсом инициализации оплаты',1,NULL,0,0,0),(385,'password2','i18n::field-password2',0,20,0,1,NULL,0,0,'используется интерфейсом оповещения о платеже, XML-интерфейсах',1,NULL,0,0,0),(386,'test_mode','i18n::field-test_mode',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(387,'eshopid','i18n::field-eshopid',0,20,0,1,NULL,0,0,'Номер сайта продавца, на который покупатель должен совершить платеж',1,NULL,0,0,0),(388,'secretkey','i18n::field-kvk-secretKey',0,20,0,1,NULL,0,0,'Строка символов, добавляемая к реквизитам платежа, высылаемым продавцу вместе с оповещением',1,NULL,0,0,0),(389,'name','i18n::field-name',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(390,'legal_address','i18n::field-legal_address',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(391,'phone_number','i18n::field-phone_number',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(392,'inn','i18n::field-TIN',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(393,'kpp','i18n::field-RRC',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(394,'account','i18n::field-account',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(395,'bank','i18n::field-receiver_bank',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(396,'bank_account','i18n::field-bank_account_number',0,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(397,'sign_image','i18n::field-sign_image',0,9,0,1,NULL,0,0,'',0,NULL,0,0,0),(398,'mnt_system_url','i18n::field-mnt_system_url',1,20,0,1,NULL,0,0,'Введите demo.moneta.ru, если у вас включен тестовый режим, либо www.payanyway.ru, если включен боевой режим.',1,NULL,0,0,1),(399,'mnt_id','i18n::field-mnt_id',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(400,'mnt_success_url','i18n::field-successful_pay_url',1,20,0,1,NULL,0,0,'Вы можете указать значение непосредственно в личном кабинете на demo.moneta.ru, если у вас включен тестовый режим, либо на www.payanyway.ru, если включен боевой режим.',1,NULL,0,0,1),(401,'mnt_fail_url','i18n::field-failed_pay_url',1,20,0,1,NULL,0,0,'Вы можете указать значение непосредственно в личном кабинете на demo.moneta.ru, если у вас включен тестовый режим, либо на www.payanyway.ru, если включен боевой режим.',0,NULL,0,0,1),(402,'mnt_data_integrity_code','i18n::field-data_integrity_code',1,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(403,'mnt_test_mode','i18n::field-test_mode',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(404,'project','i18n::field-project-id',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(405,'key','i18n::field-secret-key',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(406,'source','i18n::field-owner-id',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(407,'partnerid','i18n::field-kvk-partnerId',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(408,'apikey','i18n::field-kvk-apiKey',0,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(409,'demo_mode','i18n::field-demo_mode',0,1,0,1,NULL,0,0,'Включить демо-режим',0,NULL,0,0,0),(410,'merchant_id','i18n::field-emarket-id',0,20,0,1,NULL,0,0,'i18n::field-emarket-id',1,NULL,0,0,0),(411,'product_id','i18n::field-product_id',0,20,0,1,NULL,0,0,'i18n::field-product_id',1,NULL,0,0,0),(412,'ok_url','i18n::field-successful_pay_url',0,20,0,1,NULL,0,0,'i18n::field-successful_pay_url',0,NULL,0,0,0),(413,'secret_word','i18n::field-secret_word',0,20,0,1,NULL,0,0,'i18n::field-secret_word',1,NULL,0,0,0),(414,'ko_url','i18n::field-failed_pay_url',0,20,0,1,NULL,0,0,'i18n::field-failed_pay_url',0,NULL,0,0,0),(415,'shop_id','i18n::field-shop_id',0,20,0,1,NULL,0,0,'Номер магазина в ЦПП. Выдается ЦПП',1,NULL,0,0,0),(416,'scid','i18n::field-scid',0,20,0,1,NULL,0,0,'Номер витрины магазина в ЦПП. Выдается ЦПП',1,NULL,0,0,0),(417,'bank_id','i18n::field-bank_id',0,20,0,1,NULL,0,0,'Код процессингового центра \"ЮMoney\"',0,NULL,0,0,0),(418,'shop_password','i18n::field-shop_password',0,20,0,1,NULL,0,0,'Секретный пароль (20 случайных символов), указывается при заключении договора',1,NULL,0,0,0),(419,'paypalemail','i18n::field-paypalemail',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(420,'return_success','i18n::field-return_success',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(421,'cancel_return','i18n::field-cancel_return',1,20,0,1,NULL,0,0,'',1,NULL,0,0,0),(422,'shop_id','i18n::field-yandex-kassa-shop-id',1,20,0,1,NULL,0,0,'Идентификатор вашего магазина в ЮKassa',1,NULL,0,0,1),(423,'secret_key','i18n::field-yandex-kassa-secret-key',1,20,0,1,NULL,0,0,'Выпустить секретный ключ можно в личном кабинете ЮKassa, в разделе \"Настройки\"',1,NULL,0,0,1),(424,'id','i18n::field-id',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(425,'descr','i18n::field-descr',1,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(426,'is_show_rand_banner','i18n::field-is_show_rand_banner',1,1,0,1,NULL,0,1,'',0,NULL,0,0,1),(427,'is_active','i18n::field-is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,1),(428,'tags','i18n::field-tags',1,23,0,1,NULL,0,0,'',0,NULL,0,0,0),(429,'url','i18n::field-url',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(430,'open_in_new_window','i18n::field-open_in_new_window',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(431,'views_count','i18n::field-views_count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(432,'clicks_count','i18n::field-clicks_count',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(433,'max_views','i18n::field-max_views',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(434,'show_start_date','i18n::field-show_start_date',1,4,1,1,NULL,0,1,'',0,NULL,0,0,0),(435,'show_till_date','i18n::field-show_till_date',1,4,1,1,NULL,0,0,'',0,NULL,0,0,0),(436,'user_tags','i18n::field-user_tags',1,23,0,1,NULL,0,0,'',0,NULL,0,0,0),(437,'view_pages','i18n::field-view_pages',1,22,0,1,NULL,0,0,'',0,NULL,0,0,0),(438,'place','i18n::field-place',1,19,0,1,113,0,0,'',0,NULL,0,0,1),(439,'not_view_pages','i18n::field-not_view_pages',1,22,0,1,NULL,0,0,'',0,NULL,0,0,0),(440,'time_targeting_by_month_days','i18n::field-time_targeting_by_month_days',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(441,'time_targeting_by_month','i18n::field-time_targeting_by_month',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(442,'time_targeting_by_week_days','i18n::field-time_targeting_by_week_days',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(443,'time_targeting_by_hours','i18n::field-time_targeting_by_hours',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(444,'time_targeting_is_active','i18n::field-time_targeting_is_active',1,1,1,1,NULL,0,0,'',0,NULL,0,0,0),(445,'city_targeting_city','i18n::field-city_targeting_city',1,18,0,1,11,0,0,'',0,NULL,0,0,0),(446,'city_targeting_is_active','i18n::field-city_targeting_is_active',1,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(447,'priority','i18n::field-order-status-priority',0,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(448,'image','i18n::field-image',1,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(449,'width','i18n::field-width',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(450,'height','i18n::field-height',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(451,'alt','i18n::field-alt',1,20,0,1,NULL,0,0,'',0,NULL,0,0,0),(452,'swf','i18n::field-swf',1,21,0,1,NULL,0,0,'',0,NULL,0,0,1),(453,'swf_quality','i18n::field-swf_quality',1,18,0,1,9,0,0,'',0,NULL,0,0,0),(454,'html_content','i18n::field-html_content',1,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(455,'picture','i18n::field-picture',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(456,'is_hidden','i18n::field-is_hidden',0,1,0,1,NULL,0,0,'',0,NULL,0,0,0),(457,'format','i18n::field-export_format',0,18,0,0,36,0,0,'Формат, в который будут преобразованы данные из UMI.CMS',1,NULL,0,0,1),(458,'elements','i18n::field-included_site_sections',0,22,0,0,NULL,0,0,'Если формат экспорта поддерживает данную функцию, будут экспортированы только выбранные разделы',0,NULL,0,0,1),(459,'excluded_elements','i18n::field-excluded_elements',0,22,0,0,NULL,0,1,'Если формат экспорта поддерживает данную функцию, выбранные разделы экспортированы не будут',0,NULL,0,0,1),(460,'cache_time','i18n::field-cache_time',0,10,0,0,NULL,0,0,'Если задано, то результат будет закеширован на указанное кол-во минут',0,NULL,0,0,0),(461,'source_name','i18n::field-source_name',0,20,0,0,NULL,0,0,'Здесь можно задать имя ресурса для обмена данными, чтобы внешние идентификаторы сущностей были привязаны к нему.',0,NULL,0,0,0),(462,'encoding_export','i18n::field-encoding_export',0,18,0,0,26,0,0,'Кодировка, в которой будут экспортированы данные',0,NULL,0,0,0),(463,'channel_header','i18n::field-channel-header',1,20,0,1,NULL,1,1,'',1,NULL,0,0,1),(464,'channel_description','i18n::field-channel-description',1,24,0,1,NULL,1,1,'',1,NULL,0,0,1),(465,'channel_site','i18n::field-channel-site',1,5,0,1,NULL,1,1,'',1,NULL,0,0,1),(466,'channel_item_limit','i18n::field-channel-item-limit',1,10,0,1,NULL,1,1,'',1,NULL,0,0,1),(467,'web_analytics_type','i18n::field-channel-web-analytics-type',1,20,0,1,NULL,1,1,'',0,NULL,0,0,1),(468,'web_analytics_id','i18n::field-channel-web-analytics-id',1,20,0,1,NULL,1,1,'',0,NULL,0,0,1),(469,'web_analytics_params','i18n::field-channel-web-analytics-params',1,20,0,1,NULL,1,1,'',0,NULL,0,0,1),(470,'web_analytics_pixel_url','i18n::field-channel-web-analytics-pixel-url',1,20,0,1,NULL,1,1,'',0,NULL,0,0,1),(471,'advertising_type','i18n::field-channel-advertising-type',1,20,0,1,NULL,1,1,'',0,NULL,0,0,1),(472,'advertising_block_id','i18n::field-channel-advertising-block-id',1,20,0,1,NULL,1,1,'',0,NULL,0,0,1),(473,'advertising_place_id','i18n::field-channel-advertising-place-id',1,20,0,1,NULL,1,1,'',0,NULL,0,0,1),(474,'advertising_code','i18n::field-channel-advertising-code',1,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(475,'format','i18n::field-data_format',0,18,0,0,35,0,0,'Формат импотрируемых данных',1,NULL,0,0,1),(476,'file','i18n::field-data_file',0,7,0,0,NULL,0,0,'',1,NULL,0,0,1),(477,'elements','i18n::field-site_section_export',0,22,0,0,NULL,0,0,'Если формат импорта поддерживает данную функцию, данные будут импортированы в указанный раздел',0,NULL,0,0,1),(478,'encoding_import','i18n::field-encoding_import',0,18,0,0,26,0,0,'Кодировка импортируемых данных',0,NULL,0,0,0),(479,'source_name','i18n::field-source_name',0,20,0,0,NULL,0,0,'Здесь можно задать имя ресурса для обмена данными, чтобы внешние идентификаторы сущностей были привязаны к нему.',0,NULL,0,0,0),(480,'fs_file','i18n::field-fs_file',1,7,0,1,NULL,0,0,'',0,NULL,0,0,1),(481,'downloads_counter','i18n::field-downloads_counter',1,10,0,1,NULL,0,0,'',0,NULL,0,0,0),(482,'custom_id','i18n::field-sid',1,20,0,0,NULL,0,0,'',0,NULL,0,0,1),(483,'lang_id','i18n::field-lang_id',1,29,0,0,NULL,0,0,'',1,NULL,0,0,1),(484,'domain_id','i18n::field-domain_id',1,5,0,0,NULL,0,0,'',1,NULL,0,0,1),(485,'appoint_service_choice_title','i18n::field-appoint-service-choice-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(486,'appoint_hint_step_text','i18n::field-appoint-hint-step-text',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(487,'appoint_personal_step_title','i18n::field-appoint-personal-step-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(488,'appoint_personal_choice_title','i18n::field-appoint-personal-choice-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(489,'appoint_dont_care_button','i18n::field-appoint-dont-care-button',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(490,'appoint_dont_care_hint','i18n::field-appoint-dont-care-hint',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(491,'appoint_date_step_title','i18n::field-appoint-date-step-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(492,'appoint_date_choice_title','i18n::field-appoint-date-choice-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(493,'appoint_confirm_step_title','i18n::field-appoint-confirm-step-title',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(494,'appoint_book_time_button','i18n::field-appoint-book-time-button',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(495,'appoint_book_time_hint','i18n::field-appoint-book-time-hint',1,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(496,'author','i18n::field-author',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(497,'email','Email',0,20,0,1,NULL,0,0,'',1,3,0,0,1),(498,'theme','i18n::field-subject_template',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(499,'message','i18n::field-message',0,24,0,1,NULL,0,0,'',1,NULL,0,0,1),(500,'name','i18n::field-fname',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(501,'image','i18n::field-izobrazhenie',0,9,0,1,NULL,0,0,'',0,NULL,0,0,1),(502,'user_css','Пользовательский CSS',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(503,'position','Должность',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(504,'description','i18n::field-description',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(505,'image_link','Ссылка изображения',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(506,'copyright','Копирайт',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(507,'footer_code','i18n::field-code',0,24,0,1,NULL,0,0,'',0,NULL,0,0,1),(508,'social_networks','Социальные сети',0,15,0,1,129,0,0,'',0,NULL,0,0,1),(509,'link','Ссылка',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(510,'css_class','css класс',0,20,0,1,NULL,0,0,'',1,NULL,0,0,1),(511,'additional_content','Дополнительный контент',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(512,'404_header','Заголовок 404 страницы',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(513,'404_content','Контент 404 страницы',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(514,'sitemap_header','Заголовок карты сайта',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(515,'search_page_header','i18n::field-header',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(516,'search_page_additional_content','Дополнительный контент',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(517,'404_additional_content','Дополнительный контент',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(518,'main_content','Основной контент',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(519,'post_by_tag_header','i18n::field-header',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(520,'post_by_tag_main_content','Основной контент',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(521,'post_by_tag_additional_content','Дополнительный контент',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(522,'personal_data_policy_confirmation_text','Текст соглашения на обработку',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(523,'first_text_block','Блок над описанием',0,26,0,1,NULL,0,0,'',0,NULL,0,0,1),(524,'photo_block_source','Источник фотографий',0,22,0,1,NULL,0,0,'',0,NULL,0,0,1),(525,'photo_block_header','Заголовок блока фотографий',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(526,'photo_block_link_text','Текст ссылки на источник фотографий',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(527,'open_the_payment_result_waiting_page','i18n::field-open-the-payment-result-waiting-page',1,1,0,1,NULL,0,0,'Если данная настройка включена, то после окончания платежа покупатель будет перенаправлен на страницу на сайте /emarket/purchase/result/wait/, поэтому необходимо добавить обработку этой страницы в шаблоне сайта.',0,NULL,0,0,1),(528,'domain_id','i18n::field_domain',1,5,0,1,NULL,0,0,'',0,NULL,0,0,0),(529,'robots_txt','i18n::field-robotstxt',1,24,0,1,NULL,0,0,'',0,NULL,0,0,0),(530,'auth_token','i18n::field-auth-token',1,24,0,0,NULL,0,0,'',0,NULL,0,1,0),(531,'social_uid','i18n::field-social_uid',1,24,0,0,NULL,0,0,'',0,NULL,0,1,0),(532,'include_fees','i18n::field-apiship-include-fees',1,1,0,1,NULL,0,0,'',0,NULL,0,1,0),(533,'yandex_map_api_key','i18n::field-apiship-yandex_map_api_key',1,20,0,1,NULL,0,0,'Процедура получения ключа описана в подсказке',0,NULL,0,0,1),(534,'disable_auto_capture','i18n::field-disable-auto-capture',1,1,0,1,NULL,0,0,'i18n::field-disable-auto-capture-hint',0,NULL,0,0,1),(535,'dengionline_id','i18n::field-id-for-dengionline',1,10,0,1,NULL,0,0,'',1,NULL,0,1,1),(536,'dengionline_id','i18n::field-id-for-dengionline',1,20,0,1,NULL,0,0,'',1,NULL,0,1,1),(537,'domain_id_list','i18n::field-valid-domain-list',1,6,0,1,NULL,0,0,'Если применимо для всех доменов - оставьте список пустым',0,NULL,0,0,1),(538,'language_id_list','i18n::field-valid-language-list',1,30,0,1,NULL,0,0,'Если применимо для всех языков - оставьте список пустым',0,NULL,0,0,1),(539,'price_type_id','i18n::field-price-type',1,31,0,1,NULL,0,0,'',0,NULL,0,0,1),(540,'promocode','i18n::field-promocode',0,20,0,1,NULL,0,0,'',0,NULL,0,0,1),(541,'is_deactivated_by_manager','i18n::field-is_deactivated_by_manager',1,1,0,0,NULL,0,0,'',0,NULL,0,0,0),(542,'disabled_user_groups','i18n::field-disabled_user_groups',1,19,1,1,39,0,0,'Укажите группы пользователей, для которых способ оплаты будет отключен',0,NULL,0,0,0),(543,'advertising_code','i18n::field-channel-advertising-code',0,20,0,1,NULL,1,1,'',0,NULL,0,0,0);
/*!40000 ALTER TABLE `cms3_object_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_fields_restrictions`
--

DROP TABLE IF EXISTS `cms3_object_fields_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_fields_restrictions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `class_prefix` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `field_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Field restriction to field type relation_FK` (`field_type_id`),
  CONSTRAINT `FK_Field restriction to field type relation` FOREIGN KEY (`field_type_id`) REFERENCES `cms3_object_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_fields_restrictions`
--

LOCK TABLES `cms3_object_fields_restrictions` WRITE;
/*!40000 ALTER TABLE `cms3_object_fields_restrictions` DISABLE KEYS */;
INSERT INTO `cms3_object_fields_restrictions` VALUES (1,'systemDomain','Домен системы',10),(2,'objectType','Тип данных',10),(3,'email','E-mail',20),(4,'httpUrl','Web-адрес',20),(5,'webFormMessage','Сообщение вебформы',26),(6,'discount','Размер скидки',8);
/*!40000 ALTER TABLE `cms3_object_fields_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_files`
--

DROP TABLE IF EXISTS `cms3_object_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `src` varchar(500) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ord` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `load field value` (`obj_id`,`field_id`),
  KEY `field_id` (`field_id`),
  KEY `obj_id` (`obj_id`),
  KEY `src` (`src`(255)),
  KEY `ord` (`ord`),
  CONSTRAINT `File object field content to field` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `File object field content to object` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_files`
--

LOCK TABLES `cms3_object_files` WRITE;
/*!40000 ALTER TABLE `cms3_object_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_images`
--

DROP TABLE IF EXISTS `cms3_object_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `src` varchar(500) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ord` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `load field value` (`obj_id`,`field_id`),
  KEY `field_id` (`field_id`),
  KEY `obj_id` (`obj_id`),
  KEY `src` (`src`(255)),
  KEY `alt` (`alt`),
  KEY `ord` (`ord`),
  CONSTRAINT `object field content to field` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `object field content to object` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_images`
--

LOCK TABLES `cms3_object_images` WRITE;
/*!40000 ALTER TABLE `cms3_object_images` DISABLE KEYS */;
INSERT INTO `cms3_object_images` VALUES (8,658,301,'./images/cms/data/fotogalereya/cd4689d77526dc6bdcf40e71303a002f.jpg','','',1),(9,659,301,'./images/cms/data/fotogalereya/k1_500_auto.jpg','','',1),(10,660,301,'./images/cms/data/fotogalereya/bg_main_img_500_auto.jpg','','',1),(11,661,301,'./images/cms/data/fotogalereya/1310.jpg','','',1),(12,662,301,'./images/cms/data/fotogalereya/aa017918.jpg','','',1),(13,663,301,'./images/cms/data/fotogalereya/pred.jpg','','',1),(14,664,301,'./images/cms/data/fotogalereya/s1_377202_32.jpg','','',1),(15,665,301,'./images/cms/data/fotogalereya/buh11.jpg','','',1),(16,666,301,'./images/cms/data/fotogalereya/s1_377202_45.jpg','','',1),(17,667,301,'./images/cms/data/fotogalereya/main19589_1.jpg','','',1),(20,631,501,'./images/cms/data/shutterstock_124302109.jpg','Столярова Виктория','Менеджер интернет-проектов, фрилансер',1);
/*!40000 ALTER TABLE `cms3_object_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_lang_id_list`
--

DROP TABLE IF EXISTS `cms3_object_lang_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_lang_id_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `lang_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_lang_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_lang_id_list field_id` (`field_id`),
  KEY `cms3_object_lang_id_list obj_id` (`obj_id`),
  KEY `cms3_object_lang_id_list lang_id` (`lang_id`),
  CONSTRAINT `cms3_object_lang_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_lang_id_list lang id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_lang_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_lang_id_list`
--

LOCK TABLES `cms3_object_lang_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_lang_id_list` DISABLE KEYS */;
INSERT INTO `cms3_object_lang_id_list` VALUES (1,631,483,1);
/*!40000 ALTER TABLE `cms3_object_lang_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_offer_id_list`
--

DROP TABLE IF EXISTS `cms3_object_offer_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_offer_id_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int unsigned NOT NULL,
  `field_id` int unsigned NOT NULL,
  `offer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_offer_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_offer_id_list field_id` (`field_id`),
  KEY `cms3_object_offer_id_list obj_id` (`obj_id`),
  KEY `cms3_object_offer_id_list offer_id` (`offer_id`),
  CONSTRAINT `cms3_object_offer_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_offer_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_offer_id_list offer id` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_offer_id_list`
--

LOCK TABLES `cms3_object_offer_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_offer_id_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_offer_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_price_type_id_list`
--

DROP TABLE IF EXISTS `cms3_object_price_type_id_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_price_type_id_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `price_type_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_object_price_type_id_list load field value` (`obj_id`,`field_id`),
  KEY `cms3_object_price_type_id_list field_id` (`field_id`),
  KEY `cms3_object_price_type_id_list obj_id` (`obj_id`),
  KEY `cms3_object_price_type_id_list price_type_id` (`price_type_id`),
  CONSTRAINT `cms3_object_price_type_id_list field id` FOREIGN KEY (`field_id`) REFERENCES `cms3_object_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_price_type_id_list object id` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms3_object_price_type_id_list price id` FOREIGN KEY (`price_type_id`) REFERENCES `cms3_offer_price_type_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_price_type_id_list`
--

LOCK TABLES `cms3_object_price_type_id_list` WRITE;
/*!40000 ALTER TABLE `cms3_object_price_type_id_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_object_price_type_id_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_type_tree`
--

DROP TABLE IF EXISTS `cms3_object_type_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_type_tree` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `child_id` int unsigned DEFAULT NULL,
  `level` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique parent-child object type relation` (`parent_id`,`child_id`),
  KEY `Object type id from child_id` (`child_id`),
  CONSTRAINT `Object type id from child_id` FOREIGN KEY (`child_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Object type id from parent_id` FOREIGN KEY (`parent_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_type_tree`
--

LOCK TABLES `cms3_object_type_tree` WRITE;
/*!40000 ALTER TABLE `cms3_object_type_tree` DISABLE KEYS */;
INSERT INTO `cms3_object_type_tree` VALUES (1,NULL,1,1),(2,NULL,3,1),(3,NULL,4,2),(4,1,4,2),(5,NULL,7,2),(6,3,7,2),(7,NULL,9,2),(8,1,9,2),(9,NULL,11,2),(10,1,11,2),(11,NULL,14,2),(12,1,14,2),(13,NULL,15,2),(14,1,15,2),(15,NULL,16,2),(16,1,16,2),(17,NULL,17,2),(18,1,17,2),(19,NULL,25,2),(20,1,25,2),(21,NULL,27,2),(22,1,27,2),(23,NULL,28,2),(24,1,28,2),(25,NULL,29,2),(26,1,29,2),(27,NULL,32,1),(28,NULL,34,1),(29,NULL,35,1),(30,NULL,36,1),(31,NULL,38,3),(32,3,38,3),(33,37,38,3),(34,NULL,39,1),(35,NULL,40,2),(36,1,40,2),(37,NULL,44,2),(38,1,44,2),(39,NULL,45,2),(40,1,45,2),(41,NULL,46,2),(42,1,46,2),(43,NULL,47,1),(44,NULL,48,2),(45,1,48,2),(46,NULL,49,2),(47,1,49,2),(48,NULL,51,1),(49,NULL,52,2),(50,1,52,2),(51,NULL,53,1),(52,NULL,54,1),(53,NULL,57,2),(54,34,57,2),(55,NULL,58,1),(56,NULL,60,2),(57,3,60,2),(58,NULL,61,2),(59,3,61,2),(60,NULL,62,1),(61,NULL,63,2),(62,3,63,2),(63,NULL,64,1),(64,NULL,65,2),(65,3,65,2),(66,NULL,66,2),(67,3,66,2),(68,NULL,67,2),(69,3,67,2),(70,NULL,68,2),(71,3,68,2),(72,NULL,69,2),(73,3,69,2),(74,NULL,70,2),(75,3,70,2),(76,NULL,71,1),(77,NULL,72,2),(78,3,72,2),(79,NULL,73,2),(80,3,73,2),(81,NULL,74,1),(82,NULL,75,1),(83,NULL,76,1),(84,NULL,77,2),(85,3,77,2),(86,NULL,78,2),(87,3,78,2),(88,NULL,81,2),(89,3,81,2),(90,NULL,82,1),(91,NULL,83,1),(92,NULL,84,1),(93,NULL,85,1),(94,NULL,86,2),(95,3,86,2),(96,NULL,87,2),(97,3,87,2),(98,NULL,90,2),(99,34,90,2),(100,NULL,91,2),(101,34,91,2),(102,NULL,92,2),(103,34,92,2),(104,NULL,93,2),(105,34,93,2),(106,NULL,94,2),(107,34,94,2),(108,NULL,95,2),(109,34,95,2),(110,NULL,96,2),(111,51,96,2),(112,NULL,97,2),(113,51,97,2),(114,NULL,98,2),(115,51,98,2),(116,NULL,99,2),(117,51,99,2),(118,NULL,100,2),(119,47,100,2),(120,NULL,101,2),(121,47,101,2),(122,NULL,102,2),(123,47,102,2),(124,NULL,103,2),(125,47,103,2),(126,NULL,105,2),(127,47,105,2),(128,NULL,106,2),(129,47,106,2),(130,NULL,107,2),(131,47,107,2),(132,NULL,111,2),(133,47,111,2),(134,NULL,112,2),(135,47,112,2),(136,NULL,113,2),(137,1,113,2),(138,NULL,114,1),(139,NULL,115,2),(140,114,115,2),(141,NULL,116,2),(142,114,116,2),(143,NULL,117,2),(144,114,117,2),(145,NULL,119,1),(146,NULL,121,1),(147,NULL,122,2),(148,3,122,2),(149,NULL,123,1),(150,NULL,126,2),(151,3,126,2),(152,NULL,127,2),(153,74,127,2),(154,NULL,128,2),(155,123,128,2),(156,NULL,129,3),(157,1,129,3),(158,43,129,3),(159,NULL,130,3),(160,3,130,3),(161,61,130,3),(162,NULL,131,2),(163,34,131,2),(164,NULL,132,2),(165,119,132,2),(166,NULL,2,2),(167,1,2,2),(168,NULL,5,2),(169,1,5,2),(170,NULL,6,2),(171,1,6,2),(172,NULL,8,2),(173,1,8,2),(174,NULL,10,2),(175,1,10,2),(176,NULL,12,2),(177,1,12,2),(178,NULL,13,2),(179,1,13,2),(180,NULL,18,2),(181,1,18,2),(182,NULL,21,1),(183,NULL,23,2),(184,1,23,2),(185,NULL,24,2),(186,1,24,2),(187,NULL,26,2),(188,1,26,2),(189,NULL,30,2),(190,1,30,2),(191,NULL,31,2),(192,1,31,2),(193,NULL,33,2),(194,1,33,2),(195,NULL,37,2),(196,3,37,2),(197,NULL,41,2),(198,1,41,2),(199,NULL,42,1),(200,NULL,43,2),(201,1,43,2),(202,NULL,50,2),(203,1,50,2),(204,NULL,55,2),(205,1,55,2),(206,NULL,56,2),(207,32,56,2),(208,NULL,59,2),(209,1,59,2),(210,NULL,79,2),(211,3,79,2),(212,NULL,80,2),(213,3,80,2),(214,NULL,88,2),(215,1,88,2),(216,NULL,89,2),(217,32,89,2),(218,NULL,118,2),(219,1,118,2),(220,NULL,120,2),(221,119,120,2),(222,NULL,124,2),(223,1,124,2),(224,NULL,125,2),(225,1,125,2);
/*!40000 ALTER TABLE `cms3_object_type_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_object_types`
--

DROP TABLE IF EXISTS `cms3_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_object_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `is_guidable` tinyint(1) DEFAULT '0',
  `is_public` tinyint(1) DEFAULT '0',
  `hierarchy_type_id` int unsigned DEFAULT NULL,
  `sortable` tinyint DEFAULT '0',
  `domain_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_type_id` (`hierarchy_type_id`),
  KEY `parent_id` (`parent_id`),
  KEY `is_public` (`is_public`),
  KEY `name` (`name`),
  KEY `is_locked` (`is_locked`),
  KEY `is_guidable` (`is_guidable`),
  KEY `guid` (`guid`),
  KEY `cms3_object_types domain id` (`domain_id`),
  CONSTRAINT `cms3_object_types domain id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_object_types`
--

LOCK TABLES `cms3_object_types` WRITE;
/*!40000 ALTER TABLE `cms3_object_types` DISABLE KEYS */;
INSERT INTO `cms3_object_types` VALUES (1,'root-guides-type','i18n::object-type-spravochniki',1,0,0,0,0,0,NULL),(2,'de8627f75ba1abcfafd00a0e75ad189105cfdc21','i18n::object-type-status_stranicy',1,1,1,1,0,0,NULL),(3,'root-pages-type','i18n::object-type-razdel_sajta',1,0,0,0,0,0,NULL),(4,'fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f','i18n::object-type-pol',1,1,1,0,0,0,NULL),(5,'472b07b9fcf2c2451e8781e944bf5f77cd8457c8','i18n::object-type-tip_rss',1,1,1,1,0,0,NULL),(6,'news-rss-source-charset','i18n::object-type-news-rss-source-charset',1,1,1,1,0,0,NULL),(7,'news-rubric','i18n::object-type-news-rubric',1,3,1,0,1,0,NULL),(8,'12c6fc06c99a462375eeb3f43dfd832b08ca9e17','i18n::object-type-rss-lenta',1,1,1,1,0,0,NULL),(9,'banners-banner-swf-quality','i18n::object-type-kachestvo_fleshki',1,1,1,0,0,0,NULL),(10,'d69b923df6140a16aefc89546a384e0493641fbe','i18n::object-type-strany',1,1,1,1,0,0,NULL),(11,'sytem-citylist','i18n::object-type-spisok_gorodov_dlya_geo',1,1,1,0,0,0,NULL),(12,'96e388c0b3b7fd874b48621e850335a8f06ca58d','i18n::object-type-price_modifier',1,1,1,1,0,0,NULL),(13,'6fe3dfe314684a658c1b19ca7a8e3abd29afe23e','i18n::object-type-validation_rule',1,1,1,1,0,0,NULL),(14,'cd8b7a4b8bb9bbf442a9d50fa465fe0e9d868a13','i18n::object-type-dispatch_type',1,1,1,0,0,0,NULL),(15,'a1496d4ad0a359b6fe93d819e4a2141bd9d9ac35','i18n::object-type-carriage_type',1,1,1,0,0,0,NULL),(16,'c9264fc806cdb67dc2080db570871067a6134c2d','i18n::object-type-hours',1,1,1,0,0,0,NULL),(17,'d528edaa45e66e08a9ece98272130b42e77cef55','i18n::object-type-days',1,1,1,0,0,0,NULL),(18,'blacklist','i18n::object-type-blacklist',1,1,1,1,0,0,NULL),(21,'emarket-currency','i18n::object-type-valyuta',1,0,1,1,2,0,NULL),(23,'emarket-mobile-platform','i18n::object-type-mobile-platform',1,1,1,1,0,0,NULL),(24,'emarket-mobile-devices','i18n::object-type-mobile-devices',1,1,1,1,0,0,NULL),(25,'emarket-purchase-oneclick','i18n::object-type-emarket-purchase-oneclick',1,1,1,0,0,0,NULL),(26,'exchange-encodings','i18n::object-type-exchange-encodings',0,1,1,1,0,0,NULL),(27,'tax-rate-guide','i18n::object-type-tax-rate',1,1,1,0,0,0,NULL),(28,'payment_subject','i18n::payment-subject-type',0,1,1,0,0,0,NULL),(29,'payment_mode','i18n::payment-mode-type',0,1,1,0,0,0,NULL),(30,'emarket-discounttype','i18n::object-type-discounttype',1,1,1,1,3,0,NULL),(31,'emarket-discountmodificatortype','i18n::object-type-discountmodificatortype',1,1,1,1,4,0,NULL),(32,'81755a2845e39420c81902a3ce83dff1cfc782e7','i18n::object-type-discount_price_modifier',1,0,0,0,0,0,NULL),(33,'emarket-discountruletype','i18n::object-type-discountruletype',1,1,1,1,5,0,NULL),(34,'190c4a70068f9453e2320b650e94869a1306adb0','i18n::object-type-discountrules',1,0,0,0,0,0,NULL),(35,'exchange-format-import','i18n::object-type-import_format',1,0,1,0,0,0,NULL),(36,'exchange-format-export','i18n::object-type-export_format',1,0,1,0,0,0,NULL),(37,'social_networks-network','i18n::object-type-network',1,3,1,1,6,0,NULL),(38,'social_networks-network-vkontakte','i18n::object-type-vkontakte',1,37,0,0,7,0,NULL),(39,'users-users','i18n::object-type-users-users',1,0,1,0,8,0,NULL),(40,'emarket-deliveryaddress','i18n::object-type-eshop-address',1,1,1,0,9,0,NULL),(41,'emarket-itemtype','i18n::object-type-itemtype',1,1,1,1,10,0,NULL),(42,'emarket-discount','i18n::object-type-discount',1,0,1,1,11,0,NULL),(43,'emarket-itemoption','i18n::object-type-itemoption',1,1,1,1,12,0,NULL),(44,'emarket-orderitem','i18n::object-type-eshop-order_item',1,1,1,0,13,0,NULL),(45,'emarket-orderstatus','i18n::object-type-eshop-order_status',1,1,1,0,14,0,NULL),(46,'emarket-paymenttype','i18n::object-type-paymenttype',1,1,1,0,15,0,NULL),(47,'emarket-payment','i18n::object-type-payment',1,0,1,0,16,0,NULL),(48,'emarket-orderpaymentstatus','i18n::object-type-orderpaymentstatus',1,1,1,0,17,0,NULL),(49,'emarket-legalperson','i18n::object-type-legalperson',1,1,1,0,18,0,NULL),(50,'emarket-deliverytype','i18n::object-type-deliverytype',1,1,1,1,19,0,NULL),(51,'emarket-delivery','i18n::object-type-delivery',1,0,1,0,20,0,NULL),(52,'emarket-orderdeliverystatus','i18n::object-type-orderdeliverystatus',1,1,1,0,21,0,NULL),(53,'emarket-order','i18n::object-type-order',1,0,1,0,22,0,NULL),(54,'users-user','i18n::object-type-users-user',1,0,1,0,23,0,NULL),(55,'emarket-store','i18n::object-type-store',1,1,1,1,24,0,NULL),(56,'emarket-discountmodificator-768','i18n::object-type-order_summ_percent',1,32,1,1,25,0,NULL),(57,'emarket-discountrule-798','i18n::object-type-users_discount',1,34,0,0,26,0,NULL),(58,'menu-menu','i18n::object-type-menu',0,0,0,0,27,0,NULL),(59,'news-subject','i18n::object-type-news-subject',1,1,1,1,28,0,NULL),(60,'news-item','i18n::object-type-news-item',1,3,0,0,29,0,NULL),(61,'content-page','i18n::object-type-content-',1,3,0,0,30,0,NULL),(62,'content-ticket','i18n::object-type-content-ticket',1,0,0,0,31,0,NULL),(63,'blogs20-blog','i18n::object-type-blogs20-blog',1,3,1,0,32,0,NULL),(64,'users-author','i18n::object-type-users-author',1,0,1,0,33,0,NULL),(65,'blogs20-comment','i18n::object-type-blogs20-comment',1,3,1,0,34,0,NULL),(66,'blogs20-post','i18n::object-type-blogs20-post',1,3,1,0,35,0,NULL),(67,'forum-conf','i18n::object-type-forum-conf',1,3,0,0,36,0,NULL),(68,'forum-topic','i18n::object-type-forum-topic',1,3,0,0,37,0,NULL),(69,'forum-message','i18n::object-type-forum-message',1,3,0,0,38,0,NULL),(70,'comments-comment','i18n::object-type-comments-comment',1,3,0,0,39,0,NULL),(71,'vote-pollitem','i18n::object-type-vote-poll_item',1,0,1,0,40,0,NULL),(72,'vote-poll','i18n::object-type-vote-poll',1,3,0,0,41,0,NULL),(73,'webforms-page','i18n::object-type-webforms-page',1,3,1,0,42,0,NULL),(74,'webforms-form','i18n::object-type-webforms-form',1,0,0,0,43,0,NULL),(75,'webforms-template','i18n::object-type-webforms-template',1,0,0,0,44,0,NULL),(76,'webforms-address','i18n::object-type-webforms-address',1,0,0,0,45,0,NULL),(77,'photoalbum-album','i18n::object-type-photoalbum-album',1,3,0,0,46,0,NULL),(78,'photoalbum-photo','i18n::object-type-photoalbum-photo',1,3,0,0,47,0,NULL),(79,'faq-project','i18n::object-type-faq-project',1,3,0,1,48,0,NULL),(80,'faq-category','i18n::object-type-faq-category',1,3,0,1,49,0,NULL),(81,'faq-question','i18n::object-type-faq-question',1,3,0,0,50,0,NULL),(82,'dispatches-dispatch','i18n::object-type-dispatches-dispatch',1,0,1,0,51,0,NULL),(83,'dispatches-release','i18n::object-type-dispatches-release',1,0,1,0,52,0,NULL),(84,'dispatches-message','i18n::object-type-dispatches-message',1,0,1,0,53,0,NULL),(85,'dispatches-subscriber','i18n::object-type-dispatches-subscriber',1,0,1,0,54,0,NULL),(86,'catalog-category','i18n::object-type-catalog-category',1,3,0,0,55,0,NULL),(87,'catalog-object','i18n::object-type-catalog-object',1,3,0,0,56,0,NULL),(88,'emarket-customer','i18n::object-type-customer',1,1,1,1,57,0,NULL),(89,'emarket-discountmodificator-800','i18n::object-type-fixed_discount',1,32,1,1,25,0,NULL),(90,'emarket-discountrule-777','i18n::object-type-special_items_discount',1,34,0,0,26,0,NULL),(91,'emarket-discountrule-794','i18n::object-type-time_interval',1,34,0,0,26,0,NULL),(92,'emarket-discountrule-795','i18n::object-type-order_summ',1,34,0,0,26,0,NULL),(93,'emarket-discountrule-796','i18n::object-type-customer_summ',1,34,0,0,26,0,NULL),(94,'emarket-discountrule-797','i18n::object-type-users_group_discount',1,34,0,0,26,0,NULL),(95,'emarket-discountrule-799','i18n::object-type-related_items_discount',1,34,0,0,26,0,NULL),(96,'emarket-delivery-783','i18n::object-type-pickup',1,51,0,0,20,0,NULL),(97,'emarket-delivery-784','i18n::object-type-courier_deliver_spb',1,51,0,0,20,0,NULL),(98,'emarket-delivery-808','i18n::object-type-mail',1,51,0,0,20,0,NULL),(99,'emarket-delivery-842','i18n::object-type-apiship',1,51,0,0,20,0,NULL),(100,'emarket-payment-791','i18n::object-type-sales_draft',1,47,0,0,16,0,NULL),(101,'emarket-payment-801','i18n::object-type-pay_online',1,47,0,0,16,0,NULL),(102,'emarket-payment-802','i18n::object-type-courier',1,47,0,0,16,0,NULL),(103,'emarket-payment-812','i18n::object-type-robokassa',1,47,0,0,16,0,NULL),(105,'emarket-payment-816','i18n::object-type-legal_person_account',1,47,0,0,16,0,NULL),(106,'emarket-payment-payanyway','i18n::object-type-payanyway',1,47,0,0,16,0,NULL),(107,'emarket-payment-dengionline','i18n::object-type-dengionline',1,47,0,0,16,0,NULL),(111,'emarket-payment-paypal','i18n::object-type-emarket-payment-paypal',1,47,0,0,16,0,NULL),(112,'emarket-payment-yandex-kassa','i18n::object-type-emarket-payment-yandex-kassa',1,47,0,0,16,0,NULL),(113,'banners-place','i18n::object-type-banners-place',1,1,1,0,58,0,NULL),(114,'banners-banner','i18n::object-type-banners-banner',1,0,0,0,59,0,NULL),(115,'banners-banner-image','i18n::object-type-banners-banner-image',1,114,0,0,59,0,NULL),(116,'banners-banner-swf','i18n::object-type-banners-banner-swf',1,114,0,0,59,0,NULL),(117,'banners-banner-html','i18n::object-type-banners-banner-html',1,114,0,0,59,0,NULL),(118,'users-avatar','i18n::object-type-users-avatar',1,1,1,1,60,0,NULL),(119,'exchange-export','i18n::object-type-export',1,0,0,0,61,0,NULL),(120,'robots-txt','i18n::object-type-robots-txt',1,119,1,1,61,0,NULL),(121,'exchange-import','i18n::object-type-import',1,0,0,0,62,0,NULL),(122,'filemanager-sharedfile','i18n::object-type-filemanager-shared_file',1,3,0,0,63,0,NULL),(123,'root-settings-type','i18n::object-type-root-settings-type',1,0,0,0,64,0,NULL),(124,'ip-blacklist','i18n::object-type-ip_blacklist',1,1,1,1,65,0,NULL),(125,'ip-whitelist','i18n::object-type-ip_whitelist',1,1,1,1,66,0,NULL),(126,'appointment-page','i18n::hierarchy-type-appointment-page',1,3,0,0,67,0,NULL),(127,'','Обратная связь',0,74,0,0,43,0,NULL),(128,'','demolancer',0,123,0,0,64,0,1),(129,'','Социальные сети в футере',0,43,1,0,12,0,1),(130,'','Главная страница',0,61,0,0,30,0,NULL),(131,'emarket-discountrule-850','i18n::object-type-promo_code_discount',1,34,0,0,26,0,NULL),(132,'exchange-export-yandex-turbo-pages','i18n::object-type-export-yandex-turbo-pages',0,119,0,0,61,0,NULL);
/*!40000 ALTER TABLE `cms3_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_objects`
--

DROP TABLE IF EXISTS `cms3_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_objects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `type_id` int unsigned DEFAULT NULL,
  `owner_id` int unsigned DEFAULT NULL,
  `ord` int unsigned DEFAULT '0',
  `updatetime` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Object to type relation_FK` (`type_id`),
  KEY `name` (`name`),
  KEY `owner_id` (`owner_id`),
  KEY `is_locked` (`is_locked`),
  KEY `ord` (`ord`),
  KEY `guid` (`guid`),
  KEY `updatetime` (`updatetime`),
  CONSTRAINT `FK_Object to type relation` FOREIGN KEY (`type_id`) REFERENCES `cms3_object_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_objects`
--

LOCK TABLES `cms3_objects` WRITE;
/*!40000 ALTER TABLE `cms3_objects` DISABLE KEYS */;
INSERT INTO `cms3_objects` VALUES (1,'social_networks-network-27915','i18n::object-vkontakte',1,38,0,1,1559905255),(2,'84a36e2847c33ac03a7223b57b0c864b80ab26c8','i18n::object-rss',0,5,0,1,1559905255),(3,'a35ff773f425e44df36c1cc68a415d92318b19ac','i18n::object-atom',0,5,0,2,1559905255),(4,'e99ecbbec4c871f3fb63c3cc85796e177d017614','i18n::object-male',0,4,0,1,1559905255),(5,'7b04a4565f37a07f1c2ee54be8286017de6c56df','i18n::object-female',0,4,0,2,1559905255),(6,'swf-banner-quality-low','i18n::object-low',0,9,0,1,1559905255),(7,'swf-banner-quality-medium','i18n::object-medium',0,9,0,2,1559905255),(8,'swf-banner-quality-high','i18n::object-height',0,9,0,3,1559905255),(9,'a1e3ae17e80ba2b4a3ddb1b855430346f74b8d48','i18n::object-usa',1,10,0,1,1559905255),(10,'e9aa8c23a339224b25945aa9e99f09f578bdd483','i18n::object-russia',1,10,0,2,1559905255),(11,'sytem-citylist-26905','Москва',0,11,0,1,1559905256),(12,'sytem-citylist-26906','Санкт-Петербург',0,11,0,2,1559905256),(13,'sytem-citylist-26907','Новосибирск',0,11,0,3,1559905256),(14,'sytem-citylist-26908','Екатеринбург',0,11,0,4,1559905256),(15,'sytem-citylist-26909','Нижний Новгород',0,11,0,5,1559905256),(16,'sytem-citylist-26910','Самара',0,11,0,6,1559905256),(17,'sytem-citylist-26911','Омск',0,11,0,7,1559905256),(18,'sytem-citylist-26912','Казань',0,11,0,8,1559905256),(19,'sytem-citylist-26913','Челябинск',0,11,0,9,1559905256),(20,'sytem-citylist-26914','Ростов-на-Дону',0,11,0,10,1559905256),(21,'sytem-citylist-26915','Уфа',0,11,0,11,1559905256),(22,'sytem-citylist-26916','Пермь',0,11,0,12,1559905256),(23,'sytem-citylist-26917','Волгоград',0,11,0,13,1559905256),(24,'sytem-citylist-26918','Красноярск',0,11,0,14,1559905256),(25,'sytem-citylist-26919','Саратов',0,11,0,15,1559905256),(26,'sytem-citylist-26920','Воронеж',0,11,0,16,1559905256),(27,'sytem-citylist-26921','Краснодар',0,11,0,17,1559905256),(28,'sytem-citylist-26922','Тольятти',0,11,0,18,1559905256),(29,'sytem-citylist-26923','Ижевск',0,11,0,19,1559905256),(30,'sytem-citylist-26924','Ульяновск',0,11,0,20,1559905256),(31,'sytem-citylist-26925','Ярославль',0,11,0,21,1559905256),(32,'sytem-citylist-26926','Барнаул',0,11,0,22,1559905256),(33,'sytem-citylist-26927','Владивосток',0,11,0,23,1559905256),(34,'sytem-citylist-26928','Хабаровск',0,11,0,24,1559905256),(35,'sytem-citylist-26929','Иркутск',0,11,0,25,1559905256),(36,'sytem-citylist-26930','Новокузнецк',0,11,0,26,1559905256),(37,'sytem-citylist-26931','Тюмень',0,11,0,27,1559905256),(38,'sytem-citylist-26932','Оренбург',0,11,0,28,1559905256),(39,'sytem-citylist-26933','Кемерово',0,11,0,29,1559905256),(40,'sytem-citylist-26934','Рязань',0,11,0,30,1559905256),(41,'sytem-citylist-26935','Пенза',0,11,0,31,1559905256),(42,'sytem-citylist-26936','Набережные Челны',0,11,0,32,1559905256),(43,'sytem-citylist-26937','Тула',0,11,0,33,1559905256),(44,'sytem-citylist-26938','Липецк',0,11,0,34,1559905256),(45,'sytem-citylist-26939','Астрахань',0,11,0,35,1559905256),(46,'sytem-citylist-26940','Томск',0,11,0,36,1559905256),(47,'sytem-citylist-26941','Махачкала',0,11,0,37,1559905256),(48,'sytem-citylist-26942','Киров',0,11,0,38,1559905256),(49,'sytem-citylist-26943','Чебоксары',0,11,0,39,1559905256),(50,'sytem-citylist-26944','Калининград',0,11,0,40,1559905256),(51,'sytem-citylist-26945','Брянск',0,11,0,41,1559905256),(52,'sytem-citylist-26946','Магнитогорск',0,11,0,42,1559905256),(53,'sytem-citylist-26947','Иваново',0,11,0,43,1559905256),(54,'sytem-citylist-26948','Курск',0,11,0,44,1559905256),(55,'sytem-citylist-26949','Тверь',0,11,0,45,1559905256),(56,'sytem-citylist-26950','Нижний Тагил',0,11,0,46,1559905256),(57,'sytem-citylist-26951','Ставрополь',0,11,0,47,1559905256),(58,'sytem-citylist-26952','Архангельск',0,11,0,48,1559905256),(59,'sytem-citylist-26953','Белгород',0,11,0,49,1559905256),(60,'sytem-citylist-26954','Улан-Удэ',0,11,0,50,1559905256),(61,'sytem-citylist-26955','Владимир',0,11,0,51,1559905256),(62,'sytem-citylist-26956','Сочи',0,11,0,52,1559905256),(63,'sytem-citylist-26957','Калуга',0,11,0,53,1559905256),(64,'sytem-citylist-26958','Курган',0,11,0,54,1559905256),(65,'sytem-citylist-26959','Орёл',0,11,0,55,1559905256),(66,'sytem-citylist-26960','Смоленск',0,11,0,56,1559905256),(67,'sytem-citylist-26961','Мурманск',0,11,0,57,1559905256),(68,'sytem-citylist-26962','Владикавказ',0,11,0,58,1559905256),(69,'sytem-citylist-26963','Череповец',0,11,0,59,1559905256),(70,'sytem-citylist-26964','Волжский',0,11,0,60,1559905256),(71,'sytem-citylist-26965','Чита',0,11,0,61,1559905256),(72,'sytem-citylist-26966','Саранск',0,11,0,62,1559905256),(73,'sytem-citylist-26967','Сургут',0,11,0,63,1559905256),(74,'sytem-citylist-26968','Вологда',0,11,0,64,1559905256),(75,'sytem-citylist-26969','Тамбов',0,11,0,65,1559905256),(76,'sytem-citylist-26970','Кострома',0,11,0,66,1559905256),(77,'sytem-citylist-26971','Комсомольск-на-Амуре',0,11,0,67,1559905256),(78,'sytem-citylist-26972','Нальчик',0,11,0,68,1559905256),(79,'sytem-citylist-26973','Петрозаводск',0,11,0,69,1559905256),(80,'sytem-citylist-26974','Стерлитамак',0,11,0,70,1559905256),(81,'sytem-citylist-26975','Таганрог',0,11,0,71,1559905256),(82,'sytem-citylist-26976','Братск',0,11,0,72,1559905256),(83,'sytem-citylist-26977','Дзержинск',0,11,0,73,1559905256),(84,'sytem-citylist-26978','Йошкар-Ола',0,11,0,74,1559905256),(85,'sytem-citylist-26979','Орск',0,11,0,75,1559905256),(86,'sytem-citylist-26980','Шахты',0,11,0,76,1559905256),(87,'sytem-citylist-26981','Якутск',0,11,0,77,1559905256),(88,'sytem-citylist-26982','Ангарск',0,11,0,78,1559905256),(89,'sytem-citylist-26983','Нижневартовск',0,11,0,79,1559905256),(90,'sytem-citylist-26984','Сыктывкар',0,11,0,80,1559905256),(91,'sytem-citylist-26985','Новороссийск',0,11,0,81,1559905256),(92,'sytem-citylist-26986','Нижнекамск',0,11,0,82,1559905256),(93,'sytem-citylist-26987','Бийск',0,11,0,83,1559905256),(94,'sytem-citylist-26988','Грозный',0,11,0,84,1559905256),(95,'sytem-citylist-26989','Старый Оскол',0,11,0,85,1559905256),(96,'sytem-citylist-26990','Великий Новгород',0,11,0,86,1559905256),(97,'sytem-citylist-26991','Прокопьевск',0,11,0,87,1559905256),(98,'sytem-citylist-26992','Рыбинск',0,11,0,88,1559905256),(99,'sytem-citylist-26993','Норильск',0,11,0,89,1559905256),(100,'sytem-citylist-26994','Благовещенск',0,11,0,90,1559905256),(101,'sytem-citylist-26995','Энгельс',0,11,0,91,1559905256),(102,'sytem-citylist-26996','Балаково',0,11,0,92,1559905256),(103,'sytem-citylist-26997','Петропавловск-Камчатский',0,11,0,93,1559905256),(104,'sytem-citylist-26998','Псков',0,11,0,94,1559905256),(105,'sytem-citylist-26999','Северодвинск',0,11,0,95,1559905256),(106,'sytem-citylist-27000','Армавир',0,11,0,96,1559905256),(107,'sytem-citylist-27001','Златоуст',0,11,0,97,1559905256),(108,'sytem-citylist-27002','Балашиха',0,11,0,98,1559905256),(109,'sytem-citylist-27003','Каменск-Уральский',0,11,0,99,1559905256),(110,'sytem-citylist-27004','Химки',0,11,0,100,1559905256),(111,'sytem-citylist-27005','Сызрань',0,11,0,101,1559905256),(112,'sytem-citylist-27006','Подольск',0,11,0,102,1559905256),(113,'sytem-citylist-27007','Новочеркасск',0,11,0,103,1559905256),(114,'sytem-citylist-27008','Королёв',0,11,0,104,1559905256),(115,'sytem-citylist-27009','Южно-Сахалинск',0,11,0,105,1559905256),(116,'sytem-citylist-27010','Волгодонск',0,11,0,106,1559905256),(117,'sytem-citylist-27011','Находка',0,11,0,107,1559905256),(118,'sytem-citylist-27012','Березники',0,11,0,108,1559905256),(119,'sytem-citylist-27013','Абакан',0,11,0,109,1559905256),(120,'sytem-citylist-27014','Мытищи',0,11,0,110,1559905256),(121,'sytem-citylist-27015','Люберцы',0,11,0,111,1559905256),(122,'sytem-citylist-27016','Рубцовск',0,11,0,112,1559905256),(123,'sytem-citylist-27017','Майкоп',0,11,0,113,1559905256),(124,'sytem-citylist-27018','Салават',0,11,0,114,1559905256),(125,'sytem-citylist-27019','Уссурийск',0,11,0,115,1559905256),(126,'sytem-citylist-27020','Миасс',0,11,0,116,1559905256),(127,'sytem-citylist-27021','Ковров',0,11,0,117,1559905256),(128,'sytem-citylist-27022','Коломна',0,11,0,118,1559905256),(129,'sytem-citylist-27023','Электросталь',0,11,0,119,1559905256),(130,'sytem-citylist-27024','Альметьевск',0,11,0,120,1559905256),(131,'sytem-citylist-27025','Пятигорск',0,11,0,121,1559905256),(132,'sytem-citylist-27026','Копейск',0,11,0,122,1559905256),(133,'sytem-citylist-27027','Первоуральск',0,11,0,123,1559905256),(134,'sytem-citylist-27028','Назрань',0,11,0,124,1559905256),(135,'sytem-citylist-27029','Одинцово',0,11,0,125,1559905256),(136,'sytem-citylist-27030','Невинномысск',0,11,0,126,1559905256),(137,'sytem-citylist-27031','Кисловодск',0,11,0,127,1559905256),(138,'sytem-citylist-27032','Димитровград',0,11,0,128,1559905256),(139,'sytem-citylist-27033','Хасавюрт',0,11,0,129,1559905256),(140,'sytem-citylist-27034','Новочебоксарск',0,11,0,130,1559905256),(141,'sytem-citylist-27035','Новомосковск',0,11,0,131,1559905256),(142,'sytem-citylist-27036','Серпухов',0,11,0,132,1559905256),(143,'sytem-citylist-27037','Орехово-Зуево',0,11,0,133,1559905256),(144,'sytem-citylist-27038','Муром',0,11,0,134,1559905256),(145,'sytem-citylist-27039','Камышин',0,11,0,135,1559905256),(146,'sytem-citylist-27040','Железнодорожный',0,11,0,136,1559905256),(147,'sytem-citylist-27041','Нефтекамск',0,11,0,137,1559905256),(148,'sytem-citylist-27042','Новый Уренгой',0,11,0,138,1559905256),(149,'sytem-citylist-27043','Черкесск',0,11,0,139,1559905256),(150,'sytem-citylist-27044','Ногинск',0,11,0,140,1559905256),(151,'sytem-citylist-27045','Новошахтинск',0,11,0,141,1559905256),(152,'sytem-citylist-27046','Нефтеюганск',0,11,0,142,1559905256),(153,'sytem-citylist-27047','Щёлково',0,11,0,143,1559905256),(154,'sytem-citylist-27048','Елец',0,11,0,144,1559905256),(155,'sytem-citylist-27049','Ачинск',0,11,0,145,1559905256),(156,'sytem-citylist-27050','Новокуйбышевск',0,11,0,146,1559905256),(157,'sytem-citylist-27051','Сергиев Посад',0,11,0,147,1559905256),(158,'sytem-citylist-27052','Ноябрьск',0,11,0,148,1559905256),(159,'sytem-citylist-27053','Кызыл',0,11,0,149,1559905256),(160,'sytem-citylist-27054','Дербент',0,11,0,150,1559905256),(161,'sytem-citylist-27055','Октябрьский',0,11,0,151,1559905256),(162,'sytem-citylist-27056','Северск',0,11,0,152,1559905256),(163,'sytem-citylist-27057','Ленинск-Кузнецкий',0,11,0,153,1559905256),(164,'sytem-citylist-27058','Арзамас',0,11,0,154,1559905256),(165,'sytem-citylist-27059','Обнинск',0,11,0,155,1559905257),(166,'sytem-citylist-27060','Ухта',0,11,0,156,1559905257),(167,'sytem-citylist-27061','Междуреченск',0,11,0,157,1559905257),(168,'sytem-citylist-27062','Киселёвск',0,11,0,158,1559905257),(169,'sytem-citylist-27063','Новотроицк',0,11,0,159,1559905257),(170,'sytem-citylist-27064','Батайск',0,11,0,160,1559905257),(171,'sytem-citylist-27065','Элиста',0,11,0,161,1559905257),(172,'sytem-citylist-27066','Артём',0,11,0,162,1559905257),(173,'sytem-citylist-27067','Жуковский',0,11,0,163,1559905257),(174,'sytem-citylist-27068','Великие Луки',0,11,0,164,1559905257),(175,'sytem-citylist-27069','Канск',0,11,0,165,1559905257),(176,'sytem-citylist-27070','Магадан',0,11,0,166,1559905257),(177,'sytem-citylist-27071','Тобольск',0,11,0,167,1559905257),(178,'sytem-citylist-27072','Глазов',0,11,0,168,1559905257),(179,'emarket-discounttype-27131','i18n::object-catalog_item_discount',0,30,0,1,1559905257),(180,'emarket-discounttype-27132','i18n::object-order_discount',0,30,0,2,1559905257),(181,'users-users-15','i18n::object-supervajzery',1,39,0,1,1559905257),(182,'system-supervisor','sv',1,54,0,1,1678961042),(183,'emarket-discounttype-bonus','i18n::object-bonus-discount',0,30,0,3,1559905257),(184,'emarket-discountmodificatortype-27136','i18n::object-summ_percent',0,31,0,1,1559905262),(185,'emarket-store-27147','i18n::object-main_store',0,55,0,1,1559905257),(186,'emarket-discountruletype-27150','i18n::object-specify_items',0,33,0,1,1559905262),(187,'emarket-itemtype-27180','i18n::object-digital',1,41,0,1,1559905257),(188,'emarket-itemtype-27181','i18n::object-complex',1,41,0,2,1559905257),(189,'emarket-deliverytype-27230','i18n::object-pickup',0,50,0,1,1559905257),(190,'emarket-deliverytype-27233','i18n::object-courier_delivery',0,50,0,2,1559905257),(191,'emarket-paymenttype-27236','i18n::object-sales_draft',1,46,0,1,1559905257),(192,'emarket-orderstatus-27258','i18n::object-otmenen',1,45,0,1,1559905257),(193,'emarket-orderstatus-27259','i18n::object-otklonen',1,45,0,2,1559905257),(194,'emarket-orderstatus-27260','i18n::object-oplachivaetsya',1,45,0,3,1559905257),(195,'emarket-orderstatus-27261','i18n::object-dostavlyaetsya',1,45,0,4,1559905257),(196,'emarket-orderstatus-27262','i18n::object-ozhidaet_proverki',1,45,0,5,1559905257),(197,'emarket-orderstatus-27263','i18n::object-prinyat',1,45,0,6,1559905257),(198,'emarket-orderstatus-27264','i18n::object-gotov',1,45,0,7,1559905257),(199,'emarket-orderdeliverystatus-27377','i18n::object-ojidaet_otgruzki',1,52,0,1,1559905257),(200,'emarket-orderdeliverystatus-27378','i18n::object-dostavlyaetsya',1,52,0,2,1559905257),(201,'emarket-orderdeliverystatus-27379','i18n::object-dostavlen',1,52,0,3,1559905257),(202,'emarket-orderpaymentstatus-27380','i18n::object-inicialisirovana',1,48,0,1,1559905257),(203,'emarket-orderpaymentstatus-27381','i18n::object-podtverjdena',1,48,0,2,1559905257),(204,'emarket-orderpaymentstatus-27382','i18n::object-otklonena',1,48,0,3,1559905257),(205,'emarket-orderpaymentstatus-27383','i18n::object-prinyata',1,48,0,4,1559905257),(206,'emarket-discountruletype-27393','i18n::object-time_interval_discount',0,33,0,2,1559905262),(207,'emarket-discountruletype-27394','i18n::object-order_summ_discount',0,33,0,3,1559905262),(208,'emarket-discountruletype-27395','i18n::object-user_summ_discount',0,33,0,4,1559905262),(209,'emarket-discountruletype-27396','i18n::object-user_group_discount',0,33,0,5,1559905262),(210,'emarket-discountruletype-27397','i18n::object-users_discount',0,33,0,6,1559905262),(211,'emarket-discountruletype-27398','i18n::object-related_items_discount',0,33,0,7,1559905262),(212,'emarket-discountmodificatortype-27456','i18n::object-fixed_modifier',0,31,0,2,1559905262),(213,'emarket-paymenttype-27457','i18n::object-payonline_system',1,46,0,2,1559905257),(214,'emarket-paymenttype-27458','i18n::object-to_courier',1,46,0,3,1559905257),(215,'399872db6f3d1341ef99b406aa2a9e515292b0c9','object-surface',0,15,0,1,1559905257),(216,'417baf8cefb99325510d31e974835254c980828b','object-air',0,15,0,2,1559905257),(217,'76377e05d0ffd4b0f6f0e72a45645f4be10f1c66','object-composite',0,15,0,3,1559905257),(218,'df383879afa5ac2e221b8fa0b0f2a6467da2886f','object-accelerated',0,15,0,4,1559905257),(219,'emarket-deliverytype-27481','i18n::object-russian_post',0,50,0,3,1559905257),(220,'emarket-paymenttype-27486','i18n::object-robokassa',1,46,0,4,1559905257),(222,'6bc46e77b86f1420917bee7a0e2154b34cdaad61','00:00',0,16,0,1,1559905257),(223,'1648322caec238f02862b0449a33b58245a9d6ce','01:00',0,16,0,2,1559905257),(224,'da2e75029f33e530c848c3aa89690ec07dd414b2','02:00',0,16,0,3,1559905257),(225,'8794b39a7bd4fe275575b6b864cf1fcca4d6d93b','03:00',0,16,0,4,1559905257),(226,'2054dced2668a57484cb2aa2498def91c22320ae','04:00',0,16,0,5,1559905257),(227,'14aa300dbddcacb6c76a4b5a364a034b6128693a','05:00',0,16,0,6,1559905257),(228,'5dc9eb3a83efd4d3302570742365c0186386947d','06:00',0,16,0,7,1559905257),(229,'8e0da95ba94e4757f3cc0f24bb0955069eb0f771','07:00',0,16,0,8,1559905257),(230,'23b3d29bb04eec144896f7f983b2f66611fe1435','08:00',0,16,0,9,1559905257),(231,'fd1f432dc313a02bcbcc9f405d8e9d121b01ba8d','09:00',0,16,0,10,1559905257),(232,'fffaba271c93a300f405a329f303686a9450bf5b','10:00',0,16,0,11,1559905257),(233,'a86f018536b8cb5896cdb631c8da8f10f0253fd9','11:00',0,16,0,12,1559905257),(234,'8d0a7e8844fd4b2eea8da19a39b81b048ce713d0','12:00',0,16,0,13,1559905257),(235,'22df1963ca47cc9ae5f0228f56ceeff467a2a280','13:00',0,16,0,14,1559905257),(236,'a03164eed7751779efd5d55464af6ae13fc4696e','14:00',0,16,0,15,1559905257),(237,'de1581726146cac70c29f0db6043eaa552da041f','15:00',0,16,0,16,1559905257),(238,'76ef341932f74678306044a0fa3e0105f5564492','16:00',0,16,0,17,1559905257),(239,'0db9ccf6183c19890acb33bc83c6167c7e941a5b','17:00',0,16,0,18,1559905257),(240,'e7951bd7de49615dc83491a195b47b61e82263bf','18:00',0,16,0,19,1559905257),(241,'70df85f9ac44cb7c7598b6ef28a50ddaa21d3937','19:00',0,16,0,20,1559905257),(242,'c60043f184d65a3101c6df21a087bbf99875a60b','20:00',0,16,0,21,1559905257),(243,'0837bbc4bf13fa667b3397def81d3a95a22f0739','21:00',0,16,0,22,1559905257),(244,'4f4c3308c188af2a2e08d59aecfaa2690fcf9981','22:00',0,16,0,23,1559905257),(245,'873f75be11e53b76dea6a438a97d3167d0aeb95c','23:00',0,16,0,24,1559905257),(246,'0a6697c2e0b67a404a645c2dd03f846e55afd981','i18n::object-monday',0,17,0,1,1559905257),(247,'4ba74364fd714bc12a8e8943cc6a36a26eaa36df','i18n::object-tuesday',0,17,0,2,1559905258),(248,'95b836e6799c016df64fdbab8d40d1c2b60173b3','i18n::object-wednesday',0,17,0,3,1559905258),(249,'a9bbb4de15c70fc416f13be9760ef33c3b2c6d67','i18n::object-thursday',0,17,0,4,1559905258),(250,'14a13a85a4e99c4f6c2fa9f42c4ff765e14415c3','i18n::object-friday',0,17,0,5,1559905258),(251,'bd7e2b0388c70b3ae4f64fe0bf5533f16e814704','i18n::object-saturday',0,17,0,6,1559905258),(252,'31586aa19a50a89a33e4d37a5d200671252fbd60','i18n::object-sunday',0,17,0,7,1559905258),(253,'emarket-paymenttype-27519','i18n::object-legal_bodies_account',1,46,0,6,1559905258),(279,'emarket-paymenttype-payanyway','i18n::object-payanyway',1,46,0,7,1559905258),(280,'emarket-paymenttype-dengionline','i18n::object-money_online',1,46,0,8,1559905258),(281,'emarket-orderstatus-editing','i18n::object-orderstatus-editing',1,45,0,8,1559905258),(296,'emarket-mobile-platform-27944','i18n::object-android',0,23,0,1,1559905258),(297,'emarket-mobile-platform-27945','i18n::object-ios',0,23,0,2,1559905258),(298,'emarket-order-payment-status-default','i18n::object-order-payment-status-default',1,48,0,5,1559905258),(299,'emarket-order-delivery-status-default','i18n::object-order-payment-status-default',1,52,0,4,1559905258),(300,'news-rss-charset-27949','i18n::object-windows_1251',0,6,0,1,1559905258),(301,'news-rss-charset-27950','i18n::object-utf_8',0,6,0,2,1559905258),(304,'emarket-paymenttype-paypal','i18n::object-paymenttype-paypal',1,46,0,12,1559905258),(305,'exchange-encoding-windows-1251','Windows-1251',0,26,0,1,1559905258),(306,'exchange-encoding-utf-8','UTF-8',0,26,0,2,1559905258),(307,'emarket-deliverytype-27958','i18n::object-type-apiship',1,50,0,4,1559905258),(308,'emarket-orderdeliverystatus-27959','i18n::object-otmenen',1,52,0,5,1559905258),(309,'emarket-orderdeliverystatus-27960','i18n::object-return',1,52,0,6,1559905258),(310,'country-AU','i18n::object-country-AU',1,10,0,3,1559905258),(311,'country-AT','i18n::object-country-AT',1,10,0,4,1559905258),(312,'country-AZ','i18n::object-country-AZ',1,10,0,5,1559905258),(313,'country-AX','i18n::object-country-AX',1,10,0,6,1559905258),(314,'country-AL','i18n::object-country-AL',1,10,0,7,1559905258),(315,'country-DZ','i18n::object-country-DZ',1,10,0,8,1559905258),(316,'country-AS','i18n::object-country-AS',1,10,0,9,1559905258),(317,'country-AI','i18n::object-country-AI',1,10,0,10,1559905258),(318,'country-AO','i18n::object-country-AO',1,10,0,11,1559905258),(319,'country-AD','i18n::object-country-AD',1,10,0,12,1559905258),(320,'country-AQ','i18n::object-country-AQ',1,10,0,13,1559905258),(321,'country-AG','i18n::object-country-AG',1,10,0,14,1559905258),(322,'country-AR','i18n::object-country-AR',1,10,0,15,1559905258),(323,'country-AM','i18n::object-country-AM',1,10,0,16,1559905258),(324,'country-AW','i18n::object-country-AW',1,10,0,17,1559905258),(325,'country-AF','i18n::object-country-AF',1,10,0,18,1559905258),(326,'country-BS','i18n::object-country-BS',1,10,0,19,1559905258),(327,'country-BD','i18n::object-country-BD',1,10,0,20,1559905258),(328,'country-BB','i18n::object-country-BB',1,10,0,21,1559905258),(329,'country-BH','i18n::object-country-BH',1,10,0,22,1559905258),(330,'country-BY','i18n::object-country-BY',1,10,0,23,1559905258),(331,'country-BZ','i18n::object-country-BZ',1,10,0,24,1559905258),(332,'country-BE','i18n::object-country-BE',1,10,0,25,1559905258),(333,'country-BJ','i18n::object-country-BJ',1,10,0,26,1559905258),(334,'country-BM','i18n::object-country-BM',1,10,0,27,1559905258),(335,'country-BG','i18n::object-country-BG',1,10,0,28,1559905259),(336,'country-BO','i18n::object-country-BO',1,10,0,29,1559905259),(337,'country-BQ','i18n::object-country-BQ',1,10,0,30,1559905259),(338,'country-BA','i18n::object-country-BA',1,10,0,31,1559905259),(339,'country-BW','i18n::object-country-BW',1,10,0,32,1559905259),(340,'country-BR','i18n::object-country-BR',1,10,0,33,1559905259),(341,'country-IO','i18n::object-country-IO',1,10,0,34,1559905259),(342,'country-BN','i18n::object-country-BN',1,10,0,35,1559905259),(343,'country-BF','i18n::object-country-BF',1,10,0,36,1559905259),(344,'country-BI','i18n::object-country-BI',1,10,0,37,1559905259),(345,'country-BT','i18n::object-country-BT',1,10,0,38,1559905259),(346,'country-VU','i18n::object-country-VU',1,10,0,39,1559905259),(347,'country-VA','i18n::object-country-VA',1,10,0,40,1559905259),(348,'country-GB','i18n::object-country-GB',1,10,0,41,1559905259),(349,'country-HU','i18n::object-country-HU',1,10,0,42,1559905259),(350,'country-VE','i18n::object-country-VE',1,10,0,43,1559905259),(351,'country-VG','i18n::object-country-VG',1,10,0,44,1559905259),(352,'country-VI','i18n::object-country-VI',1,10,0,45,1559905259),(353,'country-UM','i18n::object-country-UM',1,10,0,46,1559905259),(354,'country-TL','i18n::object-country-TL',1,10,0,47,1559905259),(355,'country-VN','i18n::object-country-VN',1,10,0,48,1559905259),(356,'country-GA','i18n::object-country-GA',1,10,0,49,1559905259),(357,'country-HT','i18n::object-country-HT',1,10,0,50,1559905259),(358,'country-GY','i18n::object-country-GY',1,10,0,51,1559905259),(359,'country-GM','i18n::object-country-GM',1,10,0,52,1559905259),(360,'country-GH','i18n::object-country-GH',1,10,0,53,1559905259),(361,'country-GP','i18n::object-country-GP',1,10,0,54,1559905259),(362,'country-GT','i18n::object-country-GT',1,10,0,55,1559905259),(363,'country-GN','i18n::object-country-GN',1,10,0,56,1559905259),(364,'country-GW','i18n::object-country-GW',1,10,0,57,1559905259),(365,'country-DE','i18n::object-country-DE',1,10,0,58,1559905259),(366,'country-GG','i18n::object-country-GG',1,10,0,59,1559905259),(367,'country-GI','i18n::object-country-GI',1,10,0,60,1559905259),(368,'country-HN','i18n::object-country-HN',1,10,0,61,1559905259),(369,'country-HK','i18n::object-country-HK',1,10,0,62,1559905259),(370,'country-GD','i18n::object-country-GD',1,10,0,63,1559905259),(371,'country-GL','i18n::object-country-GL',1,10,0,64,1559905259),(372,'country-GR','i18n::object-country-GR',1,10,0,65,1559905259),(373,'country-GE','i18n::object-country-GE',1,10,0,66,1559905259),(374,'country-GU','i18n::object-country-GU',1,10,0,67,1559905259),(375,'country-DK','i18n::object-country-DK',1,10,0,68,1559905259),(376,'country-JE','i18n::object-country-JE',1,10,0,69,1559905259),(377,'country-DJ','i18n::object-country-DJ',1,10,0,70,1559905259),(378,'country-DG','i18n::object-country-DG',1,10,0,71,1559905259),(379,'country-DM','i18n::object-country-DM',1,10,0,72,1559905259),(380,'country-DO','i18n::object-country-DO',1,10,0,73,1559905259),(381,'country-EG','i18n::object-country-EG',1,10,0,74,1559905259),(382,'country-ZM','i18n::object-country-ZM',1,10,0,75,1559905259),(383,'country-EH','i18n::object-country-EH',1,10,0,76,1559905259),(384,'country-ZW','i18n::object-country-ZW',1,10,0,77,1559905259),(385,'country-IL','i18n::object-country-IL',1,10,0,78,1559905259),(386,'country-IN','i18n::object-country-IN',1,10,0,79,1559905259),(387,'country-ID','i18n::object-country-ID',1,10,0,80,1559905259),(388,'country-JO','i18n::object-country-JO',1,10,0,81,1559905259),(389,'country-IQ','i18n::object-country-IQ',1,10,0,82,1559905259),(390,'country-IR','i18n::object-country-IR',1,10,0,83,1559905259),(391,'country-IE','i18n::object-country-IE',1,10,0,84,1559905259),(392,'country-IS','i18n::object-country-IS',1,10,0,85,1559905259),(393,'country-ES','i18n::object-country-ES',1,10,0,86,1559905259),(394,'country-IT','i18n::object-country-IT',1,10,0,87,1559905259),(395,'country-YE','i18n::object-country-YE',1,10,0,88,1559905259),(396,'country-CV','i18n::object-country-CV',1,10,0,89,1559905259),(397,'country-KZ','i18n::object-country-KZ',1,10,0,90,1559905259),(398,'country-KY','i18n::object-country-KY',1,10,0,91,1559905259),(399,'country-KH','i18n::object-country-KH',1,10,0,92,1559905259),(400,'country-CM','i18n::object-country-CM',1,10,0,93,1559905259),(401,'country-CA','i18n::object-country-CA',1,10,0,94,1559905259),(402,'country-IC','i18n::object-country-IC',1,10,0,95,1559905259),(403,'country-QA','i18n::object-country-QA',1,10,0,96,1559905259),(404,'country-KE','i18n::object-country-KE',1,10,0,97,1559905259),(405,'country-CY','i18n::object-country-CY',1,10,0,98,1559905259),(406,'country-KG','i18n::object-country-KG',1,10,0,99,1559905259),(407,'country-KI','i18n::object-country-KI',1,10,0,100,1559905259),(408,'country-CN','i18n::object-country-CN',1,10,0,101,1559905259),(409,'country-KP','i18n::object-country-KP',1,10,0,102,1559905259),(410,'country-CC','i18n::object-country-CC',1,10,0,103,1559905259),(411,'country-CO','i18n::object-country-CO',1,10,0,104,1559905259),(412,'country-KM','i18n::object-country-KM',1,10,0,105,1559905259),(413,'country-CG','i18n::object-country-CG',1,10,0,106,1559905259),(414,'country-CD','i18n::object-country-CD',1,10,0,107,1559905259),(415,'country-XK','i18n::object-country-XK',1,10,0,108,1559905259),(416,'country-CR','i18n::object-country-CR',1,10,0,109,1559905259),(417,'country-CI','i18n::object-country-CI',1,10,0,110,1559905259),(418,'country-CU','i18n::object-country-CU',1,10,0,111,1559905259),(419,'country-KW','i18n::object-country-KW',1,10,0,112,1559905259),(420,'country-CW','i18n::object-country-CW',1,10,0,113,1559905259),(421,'country-LA','i18n::object-country-LA',1,10,0,114,1559905259),(422,'country-LV','i18n::object-country-LV',1,10,0,115,1559905259),(423,'country-LS','i18n::object-country-LS',1,10,0,116,1559905259),(424,'country-LR','i18n::object-country-LR',1,10,0,117,1559905259),(425,'country-LB','i18n::object-country-LB',1,10,0,118,1559905259),(426,'country-LY','i18n::object-country-LY',1,10,0,119,1559905259),(427,'country-LT','i18n::object-country-LT',1,10,0,120,1559905259),(428,'country-LI','i18n::object-country-LI',1,10,0,121,1559905259),(429,'country-LU','i18n::object-country-LU',1,10,0,122,1559905259),(430,'country-MU','i18n::object-country-MU',1,10,0,123,1559905259),(431,'country-MR','i18n::object-country-MR',1,10,0,124,1559905259),(432,'country-MG','i18n::object-country-MG',1,10,0,125,1559905259),(433,'country-YT','i18n::object-country-YT',1,10,0,126,1559905259),(434,'country-MO','i18n::object-country-MO',1,10,0,127,1559905259),(435,'country-MK','i18n::object-country-MK',1,10,0,128,1559905259),(436,'country-MW','i18n::object-country-MW',1,10,0,129,1559905259),(437,'country-MY','i18n::object-country-MY',1,10,0,130,1559905259),(438,'country-ML','i18n::object-country-ML',1,10,0,131,1559905259),(439,'country-MV','i18n::object-country-MV',1,10,0,132,1559905260),(440,'country-MT','i18n::object-country-MT',1,10,0,133,1559905260),(441,'country-MA','i18n::object-country-MA',1,10,0,134,1559905260),(442,'country-MQ','i18n::object-country-MQ',1,10,0,135,1559905260),(443,'country-MH','i18n::object-country-MH',1,10,0,136,1559905260),(444,'country-MX','i18n::object-country-MX',1,10,0,137,1559905260),(445,'country-MZ','i18n::object-country-MZ',1,10,0,138,1559905260),(446,'country-MD','i18n::object-country-MD',1,10,0,139,1559905260),(447,'country-MC','i18n::object-country-MC',1,10,0,140,1559905260),(448,'country-MN','i18n::object-country-MN',1,10,0,141,1559905260),(449,'country-MS','i18n::object-country-MS',1,10,0,142,1559905260),(450,'country-MM','i18n::object-country-MM',1,10,0,143,1559905260),(451,'country-NA','i18n::object-country-NA',1,10,0,144,1559905260),(452,'country-NR','i18n::object-country-NR',1,10,0,145,1559905260),(453,'country-NP','i18n::object-country-NP',1,10,0,146,1559905260),(454,'country-NE','i18n::object-country-NE',1,10,0,147,1559905260),(455,'country-NG','i18n::object-country-NG',1,10,0,148,1559905260),(456,'country-NL','i18n::object-country-NL',1,10,0,149,1559905260),(457,'country-NI','i18n::object-country-NI',1,10,0,150,1559905260),(458,'country-NU','i18n::object-country-NU',1,10,0,151,1559905260),(459,'country-NZ','i18n::object-country-NZ',1,10,0,152,1559905260),(460,'country-NC','i18n::object-country-NC',1,10,0,153,1559905260),(461,'country-NO','i18n::object-country-NO',1,10,0,154,1559905260),(462,'country-AC','i18n::object-country-AC',1,10,0,155,1559905260),(463,'country-IM','i18n::object-country-IM',1,10,0,156,1559905260),(464,'country-NF','i18n::object-country-NF',1,10,0,157,1559905260),(465,'country-CX','i18n::object-country-CX',1,10,0,158,1559905260),(466,'country-SH','i18n::object-country-SH',1,10,0,159,1559905260),(467,'country-CK','i18n::object-country-CK',1,10,0,160,1559905260),(468,'country-TC','i18n::object-country-TC',1,10,0,161,1559905260),(469,'country-AE','i18n::object-country-AE',1,10,0,162,1559905260),(470,'country-OM','i18n::object-country-OM',1,10,0,163,1559905260),(471,'country-PK','i18n::object-country-PK',1,10,0,164,1559905260),(472,'country-PW','i18n::object-country-PW',1,10,0,165,1559905260),(473,'country-PS','i18n::object-country-PS',1,10,0,166,1559905260),(474,'country-PA','i18n::object-country-PA',1,10,0,167,1559905260),(475,'country-PG','i18n::object-country-PG',1,10,0,168,1559905260),(476,'country-PY','i18n::object-country-PY',1,10,0,169,1559905260),(477,'country-PE','i18n::object-country-PE',1,10,0,170,1559905260),(478,'country-PN','i18n::object-country-PN',1,10,0,171,1559905260),(479,'country-PL','i18n::object-country-PL',1,10,0,172,1559905260),(480,'country-PT','i18n::object-country-PT',1,10,0,173,1559905260),(481,'country-PR','i18n::object-country-PR',1,10,0,174,1559905260),(482,'country-KR','i18n::object-country-KR',1,10,0,175,1559905260),(483,'country-RE','i18n::object-country-RE',1,10,0,176,1559905260),(484,'country-RW','i18n::object-country-RW',1,10,0,177,1559905260),(485,'country-RO','i18n::object-country-RO',1,10,0,178,1559905260),(486,'country-SV','i18n::object-country-SV',1,10,0,179,1559905260),(487,'country-WS','i18n::object-country-WS',1,10,0,180,1559905260),(488,'country-SM','i18n::object-country-SM',1,10,0,181,1559905260),(489,'country-ST','i18n::object-country-ST',1,10,0,182,1559905260),(490,'country-SA','i18n::object-country-SA',1,10,0,183,1559905260),(491,'country-SZ','i18n::object-country-SZ',1,10,0,184,1559905260),(492,'country-MP','i18n::object-country-MP',1,10,0,185,1559905260),(493,'country-SC','i18n::object-country-SC',1,10,0,186,1559905260),(494,'country-BL','i18n::object-country-BL',1,10,0,187,1559905260),(495,'country-MF','i18n::object-country-MF',1,10,0,188,1559905260),(496,'country-PM','i18n::object-country-PM',1,10,0,189,1559905260),(497,'country-SN','i18n::object-country-SN',1,10,0,190,1559905260),(498,'country-VC','i18n::object-country-VC',1,10,0,191,1559905260),(499,'country-KN','i18n::object-country-KN',1,10,0,192,1559905260),(500,'country-LC','i18n::object-country-LC',1,10,0,193,1559905260),(501,'country-RS','i18n::object-country-RS',1,10,0,194,1559905260),(502,'country-EA','i18n::object-country-EA',1,10,0,195,1559905260),(503,'country-SG','i18n::object-country-SG',1,10,0,196,1559905260),(504,'country-SX','i18n::object-country-SX',1,10,0,197,1559905260),(505,'country-SY','i18n::object-country-SY',1,10,0,198,1559905260),(506,'country-SK','i18n::object-country-SK',1,10,0,199,1559905260),(507,'country-SI','i18n::object-country-SI',1,10,0,200,1559905260),(508,'country-SB','i18n::object-country-SB',1,10,0,201,1559905260),(509,'country-SO','i18n::object-country-SO',1,10,0,202,1559905260),(510,'country-SD','i18n::object-country-SD',1,10,0,203,1559905260),(511,'country-SR','i18n::object-country-SR',1,10,0,204,1559905260),(512,'country-SL','i18n::object-country-SL',1,10,0,205,1559905260),(513,'country-TJ','i18n::object-country-TJ',1,10,0,206,1559905260),(514,'country-TH','i18n::object-country-TH',1,10,0,207,1559905260),(515,'country-TW','i18n::object-country-TW',1,10,0,208,1559905260),(516,'country-TZ','i18n::object-country-TZ',1,10,0,209,1559905260),(517,'country-TG','i18n::object-country-TG',1,10,0,210,1559905260),(518,'country-TK','i18n::object-country-TK',1,10,0,211,1559905260),(519,'country-TO','i18n::object-country-TO',1,10,0,212,1559905260),(520,'country-TT','i18n::object-country-TT',1,10,0,213,1559905260),(521,'country-TA','i18n::object-country-TA',1,10,0,214,1559905260),(522,'country-TV','i18n::object-country-TV',1,10,0,215,1559905260),(523,'country-TN','i18n::object-country-TN',1,10,0,216,1559905260),(524,'country-TM','i18n::object-country-TM',1,10,0,217,1559905260),(525,'country-TR','i18n::object-country-TR',1,10,0,218,1559905260),(526,'country-UG','i18n::object-country-UG',1,10,0,219,1559905260),(527,'country-UZ','i18n::object-country-UZ',1,10,0,220,1559905260),(528,'country-UA','i18n::object-country-UA',1,10,0,221,1559905260),(529,'country-WF','i18n::object-country-WF',1,10,0,222,1559905260),(530,'country-UY','i18n::object-country-UY',1,10,0,223,1559905260),(531,'country-FO','i18n::object-country-FO',1,10,0,224,1559905260),(532,'country-FM','i18n::object-country-FM',1,10,0,225,1559905260),(533,'country-FJ','i18n::object-country-FJ',1,10,0,226,1559905260),(534,'country-PH','i18n::object-country-PH',1,10,0,227,1559905260),(535,'country-FI','i18n::object-country-FI',1,10,0,228,1559905260),(536,'country-FK','i18n::object-country-FK',1,10,0,229,1559905261),(537,'country-FR','i18n::object-country-FR',1,10,0,230,1559905261),(538,'country-GF','i18n::object-country-GF',1,10,0,231,1559905261),(539,'country-PF','i18n::object-country-PF',1,10,0,232,1559905261),(540,'country-TF','i18n::object-country-TF',1,10,0,233,1559905261),(541,'country-HR','i18n::object-country-HR',1,10,0,234,1559905261),(542,'country-CF','i18n::object-country-CF',1,10,0,235,1559905261),(543,'country-TD','i18n::object-country-TD',1,10,0,236,1559905261),(544,'country-ME','i18n::object-country-ME',1,10,0,237,1559905261),(545,'country-CZ','i18n::object-country-CZ',1,10,0,238,1559905261),(546,'country-CL','i18n::object-country-CL',1,10,0,239,1559905261),(547,'country-CH','i18n::object-country-CH',1,10,0,240,1559905261),(548,'country-SE','i18n::object-country-SE',1,10,0,241,1559905261),(549,'country-SJ','i18n::object-country-SJ',1,10,0,242,1559905261),(550,'country-LK','i18n::object-country-LK',1,10,0,243,1559905261),(551,'country-EC','i18n::object-country-EC',1,10,0,244,1559905261),(552,'country-GQ','i18n::object-country-GQ',1,10,0,245,1559905261),(553,'country-ER','i18n::object-country-ER',1,10,0,246,1559905261),(554,'country-EE','i18n::object-country-EE',1,10,0,247,1559905261),(555,'country-ET','i18n::object-country-ET',1,10,0,248,1559905261),(556,'country-ZA','i18n::object-country-ZA',1,10,0,249,1559905261),(557,'country-GS','i18n::object-country-GS',1,10,0,250,1559905261),(558,'country-SS','i18n::object-country-SS',1,10,0,251,1559905261),(559,'country-JM','i18n::object-country-JM',1,10,0,252,1559905261),(560,'country-JP','i18n::object-country-JP',1,10,0,253,1559905261),(561,'emarket-payment-type-yandex-kassa','i18n::object-payment-type-yandex-kassa',1,46,0,13,1559905261),(562,'emarket-item-type-custom','Пользовательский',1,41,0,3,1559905261),(563,'emarket-item-type-trade-offer','Торговое предложение',1,41,0,4,1559905261),(564,'25ec3f9da5444fe6a125910137ec28200d4eaaa8','i18n::object-status-publish',0,2,0,1,1559905261),(565,'tax-rate-27961','Без НДС',1,27,0,1,1601495053),(566,'russianpost_wrapper_simple','i18n::object-wrapper_simple',0,14,0,1,1559905261),(567,'payment-subject-28225','Товар',1,28,0,1,1559905261),(568,'payment-mode-28238','Полная предоплата',1,29,0,1,1559905261),(569,'8a6f804b3690f0592a3f17ed980a9df5f16bacd8','i18n::object-status-unpublish',0,2,0,2,1559905261),(570,'russianpost_registered_wrapper','i18n::object-registered_wrapper',0,14,0,2,1559905261),(571,'tax-rate-27962','НДС по ставке 0%',1,27,0,2,1601495053),(572,'payment-subject-28226','Подакцизный товар',1,28,0,2,1559905261),(573,'payment-mode-28239','Частичная предоплата',1,29,0,2,1559905261),(574,'f4df5d14f5a1aeeebfe3db75b73e57fef8bcc4f2','i18n::object-status-preunpublish',0,2,0,3,1559905261),(575,'russianpost_wrapper_with_declared_value','i18n::object-wrapper_with_declared_value',0,14,0,3,1559905261),(576,'tax-rate-27963','НДС по ставке 10%',1,27,0,3,1601495053),(577,'payment-subject-28227','Работа',1,28,0,3,1559905261),(578,'payment-mode-28240','Аванс',1,29,0,3,1559905261),(579,'russianpost_registered_wrapper_first_class','i18n::object-registered_wrapper_first_class',0,14,0,4,1559905261),(580,'tax-rate-27964','НДС по ставке 20%',1,27,0,4,1601495053),(581,'payment-subject-28228','Услуга',1,28,0,4,1559905261),(582,'payment-mode-28241','Полный расчет',1,29,0,4,1559905261),(583,'russianpost_wrapper_first_class_with_declared_value','i18n::object-wrapper_first_class_with_declared_value',0,14,0,5,1559905261),(584,'tax-rate-27965','НДС по расчетной ставке 10/110',1,27,0,5,1601495053),(585,'payment-subject-28229','Ставка в азартной игре',1,28,0,5,1559905261),(586,'payment-mode-28242','Частичный расчет и кредит',1,29,0,5,1559905261),(587,'tax-rate-27966','НДС  по расчетной ставке 20/120',1,27,0,6,1601495053),(588,'russianpost_parcel','i18n::object-parcel',0,14,0,6,1559905261),(589,'payment-subject-28230','Выигрыш в азартной игре',1,28,0,6,1559905261),(590,'payment-mode-28243','Кредит',1,29,0,6,1559905261),(591,'russianpost_parcel_with_declared_value','i18n::object-parcel_with_declared_value',0,14,0,7,1559905261),(592,'payment-subject-28231','Лотерейный билет',1,28,0,7,1559905261),(593,'payment-mode-28244','Выплата по кредиту',1,29,0,7,1559905261),(594,'russianpost_parcel_first_class','i18n::object-parcel_first_class',0,14,0,8,1559905261),(595,'payment-subject-28232','Выигрыш в лотерею',1,28,0,8,1559905261),(596,'russianpost_parcel_first_class_with_declared_value','i18n::object-parcel_first_class_with_declared_value',0,14,0,9,1559905261),(597,'payment-subject-28233','Результаты интеллектуальной деятельности',1,28,0,9,1559905261),(598,'russianpost_ems_standart','i18n::object-ems_standart',0,14,0,10,1559905261),(599,'payment-subject-28234','Платеж',1,28,0,10,1559905261),(600,'russianpost_ems_declared_value','i18n::object-ems_declared_value',0,14,0,11,1559905261),(601,'payment-subject-28235','Агентское вознаграждение',1,28,0,11,1559905261),(602,'payment-subject-28236','Несколько вариантов',1,28,0,12,1559905261),(603,'payment-subject-28237','i18n::object-social_categories_other',1,28,0,13,1559905262),(604,'emarket-discountmodificator-768-27135','i18n::object-test_percent_modifier',0,56,0,1,1559905262),(605,'emarket-discountrule-798-27438','i18n::object-users',0,57,0,1,1559905262),(606,'3fb6d39f5279c04f1bfec5a7cc13783a45d00141','i18n::object-commerceml_data_format',0,35,0,1,1559905262),(607,'2c4eff97ef278f12c4461309e84dd0627bd4a37b','i18n::object-umiDump_data_format',0,35,0,2,1559905262),(608,'23abbfa28d922d786d39218e3aa26719ad16ee47','i18n::object-csv_dataformat',0,35,0,3,1559905262),(609,'cdc4a1f4e0ee63b2359d3dec91efe33d2a296c92','i18n::object-umi_export_umiDump',0,35,0,4,1559905262),(610,'2ca45ca1c710cf65f451f098f4bf683082566200','i18n::object-commerceml_catalog',0,36,0,1,1559905262),(611,'681665ea8b72237d1677dfaf7339ef7a7ec40269','i18n::object-commerceml_offer_list',0,36,0,2,1559905262),(612,'8e9874cd7a1b20f4b00c95fd7126f2112101c2ac','i18n::object-commerceml_order_list',0,36,0,3,1559905262),(613,'ff6c38d4ab12cda6c035cf36a4afb829049fbf21','i18n::object-yml_catalog',1,36,0,4,1559905262),(614,'b8c554e9ce8127f2405c189857cfd6831dcc2f5d','i18n::object-umiDump_data_format',0,36,0,5,1559905262),(615,'de2d91f2111e74d1fab49ffed3220fc4b1d51d42','i18n::object-csv_dataformat',0,36,0,6,1559905262),(616,'ccc9bf34f683f8e4ecf2ffe2910f3d8cda2b6852','i18n::object-umi_export_umiDump',0,36,0,7,1559905262),(617,'exchange-export-commerceml','i18n::object-catalog_export',0,36,0,8,1559905262),(618,'exchange-export-yandex-turbo-pages','i18n::object-yandex-turbo-pages',1,36,0,9,1678709884),(619,'system-guest','i18n::object-guest',1,54,0,2,1678960963),(620,'users-users-2374','i18n::object-zaregistrirovannye_pol_zovateli',1,39,0,2,1559905262),(621,'emarket-currency-27226','i18n::object-rur',0,21,0,1,1559905262),(622,'emarket-currency-27227','i18n::object-usd',0,21,0,2,1559905262),(623,'emarket-currency-27228','i18n::object-euro',0,21,0,3,1559905262),(624,'','Главная',0,130,182,2,1560860130),(625,'','Обо мне',0,61,182,3,1560173941),(626,'','Фотогалерея',0,77,182,4,1560263278),(627,'','Блог о маркетинге',0,63,182,5,1560855778),(628,'','Администратор',0,76,182,1,1560521083),(629,'','Обратная связь',0,75,182,1,1559906070),(630,'','Контакты',0,73,182,6,1560945546),(631,'','Общие поля',0,128,182,1,1667991827),(632,'','Как цвета в дизайне интернет-магазина влияют на продажи',0,66,182,7,1560503088),(633,'','Как быстро наполнить и запустить интернет-магазин',0,66,182,8,1560503114),(634,'','Самостоятельное продвижение сайта: с чего начать и куда двигаться',0,66,182,9,1560503160),(636,'','Поделиться ВКонтакте',0,129,182,1,1560169530),(638,'','Поделиться в LiveJournal',0,129,182,3,1560169581),(639,'','Поделиться в Twitter',0,129,182,4,1560169600),(640,'','Поделиться в Моём мире',0,129,182,5,1560169623),(641,'','Поделиться в Одноклассниках',0,129,182,6,1560169645),(658,'','Забочусь о безопасности своих клиентов и обеспечиваю надежную защиту',0,78,182,11,1560260673),(659,'','На тренинге повышения квалификации',0,78,182,12,1560260698),(660,'','Я люблю своих клиентов и забочусь о них',0,78,182,13,1560260721),(661,'','Я использую только современные технологии',0,78,182,14,1560260772),(662,'','Мои качества - недостающие звено вашего успеха',0,78,182,15,1560260827),(663,'','Лучший в своей профессиональной деятельности',0,78,182,16,1560260865),(664,'','Подписание важного договора',0,78,182,17,1560260878),(665,'','Оптимизирую расходы клиента',0,78,182,18,1560260949),(666,'','Встреча с клиентом',0,78,182,19,1560260980),(667,'','Работаю качественно - это помогает мне быстро выполнять свою работу',0,78,182,20,1560261006),(671,'','Аноним (178.16.152.254)',0,64,0,1,1560512797),(673,'','Аноним (199.249.230.118)',0,64,0,2,1560513061),(675,'','sv',0,64,182,3,1560513299),(682,'','Новые способы заработка',0,7,182,22,1560855573),(683,'','Заработок на файлообменниках',0,60,182,23,1560855650),(684,'','Заработок в интернете на своем сайте',0,60,182,24,1560855694),(685,'','Заработок на букмекерских конторах',0,60,182,25,1560855725),(686,'emarket-order-payment-status-refund','i18n::object-order-payment-status-refund',1,48,0,6,1600700102),(687,'emarket-discountruletype-28247','i18n::object-promocode_discount',0,33,0,8,1605529295),(688,'emarket-order-payment-status-waiting','i18n::object-order-payment-status-waiting',1,48,0,7,1678962426);
/*!40000 ALTER TABLE `cms3_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_objects_expiration`
--

DROP TABLE IF EXISTS `cms3_objects_expiration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_objects_expiration` (
  `obj_id` int unsigned NOT NULL,
  `entrytime` int unsigned NOT NULL,
  `expire` int unsigned NOT NULL,
  PRIMARY KEY (`obj_id`),
  KEY `FK_ObjectsExpire to objects` (`obj_id`),
  KEY `entrytime` (`entrytime`,`expire`),
  CONSTRAINT `FK_ObjectsExpire to objects` FOREIGN KEY (`obj_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_objects_expiration`
--

LOCK TABLES `cms3_objects_expiration` WRITE;
/*!40000 ALTER TABLE `cms3_objects_expiration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_objects_expiration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_offer_list`
--

DROP TABLE IF EXISTS `cms3_offer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_offer_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int unsigned NOT NULL,
  `data_object_id` int unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vendor_code` varchar(255) DEFAULT NULL,
  `bar_code` varchar(255) DEFAULT NULL,
  `total_count` bigint unsigned DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `order` bigint unsigned DEFAULT '0',
  `weight` bigint unsigned DEFAULT '0',
  `width` bigint unsigned DEFAULT '0',
  `length` bigint unsigned DEFAULT '0',
  `height` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `offer to type id` (`type_id`),
  KEY `offer to data object id` (`data_object_id`),
  CONSTRAINT `offer to data object id` FOREIGN KEY (`data_object_id`) REFERENCES `cms3_objects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `offer to type id` FOREIGN KEY (`type_id`) REFERENCES `cms3_object_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_offer_list`
--

LOCK TABLES `cms3_offer_list` WRITE;
/*!40000 ALTER TABLE `cms3_offer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_offer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_offer_price_list`
--

DROP TABLE IF EXISTS `cms3_offer_price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_offer_price_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `value` double unsigned NOT NULL,
  `offer_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `offer price to offer` (`offer_id`),
  KEY `offer price to currency` (`currency_id`),
  KEY `offer price to type` (`type_id`),
  CONSTRAINT `offer price to currency` FOREIGN KEY (`currency_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer price to offer` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `offer price to type` FOREIGN KEY (`type_id`) REFERENCES `cms3_offer_price_type_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_offer_price_list`
--

LOCK TABLES `cms3_offer_price_list` WRITE;
/*!40000 ALTER TABLE `cms3_offer_price_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_offer_price_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_offer_price_type_list`
--

DROP TABLE IF EXISTS `cms3_offer_price_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_offer_price_type_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_offer_price_type_list`
--

LOCK TABLES `cms3_offer_price_type_list` WRITE;
/*!40000 ALTER TABLE `cms3_offer_price_type_list` DISABLE KEYS */;
INSERT INTO `cms3_offer_price_type_list` VALUES (1,'default','Основная',1);
/*!40000 ALTER TABLE `cms3_offer_price_type_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_permissions`
--

DROP TABLE IF EXISTS `cms3_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_permissions` (
  `level` tinyint DEFAULT NULL,
  `owner_id` int unsigned DEFAULT NULL,
  `rel_id` int unsigned DEFAULT NULL,
  KEY `owner reference_FK` (`owner_id`),
  KEY `rel reference_FK` (`rel_id`),
  KEY `level` (`level`),
  CONSTRAINT `FK_owner reference` FOREIGN KEY (`owner_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rel reference` FOREIGN KEY (`rel_id`) REFERENCES `cms3_hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_permissions`
--

LOCK TABLES `cms3_permissions` WRITE;
/*!40000 ALTER TABLE `cms3_permissions` DISABLE KEYS */;
INSERT INTO `cms3_permissions` VALUES (1,619,2),(1,619,3),(1,619,26),(1,619,27),(1,619,28),(1,619,29),(1,619,30),(1,619,31),(1,619,32),(1,619,33),(1,619,34),(1,619,35),(1,619,6),(1,619,7),(1,619,8),(1,619,44),(1,619,45),(1,619,46),(1,619,43),(1,619,4),(31,182,4),(1,619,1),(1,619,5);
/*!40000 ALTER TABLE `cms3_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_push_message_list`
--

DROP TABLE IF EXISTS `cms3_push_message_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_push_message_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `click_action` varchar(255) NOT NULL,
  `create_time` int unsigned NOT NULL,
  `is_send` tinyint(1) DEFAULT '0',
  `publish_time` int unsigned DEFAULT NULL,
  `expiration_time` int unsigned DEFAULT NULL,
  `send_time` int unsigned DEFAULT NULL,
  `domain_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `topic_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_push_message_list domain_id` (`domain_id`),
  KEY `cms3_push_message_list lang_id` (`lang_id`),
  KEY `cms3_push_message_list topic_id` (`topic_id`),
  CONSTRAINT `cms3_push_message_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_message_list lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_message_list topic_id` FOREIGN KEY (`topic_id`) REFERENCES `cms3_push_topic_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_push_message_list`
--

LOCK TABLES `cms3_push_message_list` WRITE;
/*!40000 ALTER TABLE `cms3_push_message_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_push_message_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_push_subscriber_list`
--

DROP TABLE IF EXISTS `cms3_push_subscriber_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_push_subscriber_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `create_time` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `domain_id` int unsigned DEFAULT NULL,
  `lang_id` int unsigned DEFAULT NULL,
  `topic_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `cms3_push_subscriber_list user_id` (`user_id`),
  KEY `cms3_push_subscriber_list domain_id` (`domain_id`),
  KEY `cms3_push_subscriber_list lang_id` (`lang_id`),
  KEY `cms3_push_subscriber_list topic_id` (`topic_id`),
  CONSTRAINT `cms3_push_subscriber_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_subscriber_list lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_subscriber_list topic_id` FOREIGN KEY (`topic_id`) REFERENCES `cms3_push_topic_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_subscriber_list user_id` FOREIGN KEY (`user_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_push_subscriber_list`
--

LOCK TABLES `cms3_push_subscriber_list` WRITE;
/*!40000 ALTER TABLE `cms3_push_subscriber_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_push_subscriber_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_push_topic_list`
--

DROP TABLE IF EXISTS `cms3_push_topic_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_push_topic_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `create_time` int unsigned NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `cms3_push_topic_list domain_id` (`domain_id`),
  KEY `cms3_push_topic_list lang_id` (`lang_id`),
  CONSTRAINT `cms3_push_topic_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cms3_push_topic_list lang_id` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_push_topic_list`
--

LOCK TABLES `cms3_push_topic_list` WRITE;
/*!40000 ALTER TABLE `cms3_push_topic_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_push_topic_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_redirects`
--

DROP TABLE IF EXISTS `cms3_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL,
  `target` text NOT NULL,
  `status` int unsigned DEFAULT '301',
  `made_by_user` tinyint unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source` (`source`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_redirects`
--

LOCK TABLES `cms3_redirects` WRITE;
/*!40000 ALTER TABLE `cms3_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_response_error_entry_list`
--

DROP TABLE IF EXISTS `cms3_response_error_entry_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_response_error_entry_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `code` int unsigned NOT NULL,
  `hits_count` int unsigned DEFAULT '0',
  `domain_id` int unsigned NOT NULL,
  `update_time` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms3_response_error_entry_list order by hits count` (`hits_count`),
  KEY `cms3_response_error_entry_list order by update time` (`update_time`),
  KEY `cms3_response_error_entry_list domain_id` (`domain_id`),
  CONSTRAINT `cms3_response_error_entry_list domain_id` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_response_error_entry_list`
--

LOCK TABLES `cms3_response_error_entry_list` WRITE;
/*!40000 ALTER TABLE `cms3_response_error_entry_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_response_error_entry_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_search`
--

DROP TABLE IF EXISTS `cms3_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_search` (
  `rel_id` int unsigned NOT NULL,
  `indextime` int DEFAULT NULL,
  `lang_id` int DEFAULT NULL,
  `domain_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `lang_id + domain_id + type_id_FK` (`lang_id`,`domain_id`,`type_id`),
  KEY `domain_id` (`domain_id`,`type_id`),
  KEY `indextime` (`indextime`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_search`
--

LOCK TABLES `cms3_search` WRITE;
/*!40000 ALTER TABLE `cms3_search` DISABLE KEYS */;
INSERT INTO `cms3_search` VALUES (1,1678975707,1,1,30),(2,1678975707,1,1,30),(3,1678975707,1,1,46),(4,1678975707,1,1,32),(5,1678975707,1,1,42),(6,1678975707,1,1,35),(7,1678975707,1,1,35),(8,1678975707,1,1,35),(26,1678975707,1,1,47),(27,1678975707,1,1,47),(28,1678975707,1,1,47),(29,1678975707,1,1,47),(30,1678975707,1,1,47),(31,1678975707,1,1,47),(32,1678975707,1,1,47),(33,1678975707,1,1,47),(34,1678975707,1,1,47),(35,1678975707,1,1,47),(43,1678975707,1,1,1),(44,1678975707,1,1,29),(45,1678975707,1,1,29),(46,1678975707,1,1,29);
/*!40000 ALTER TABLE `cms3_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_search_index`
--

DROP TABLE IF EXISTS `cms3_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_search_index` (
  `rel_id` int unsigned DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `word_id` int unsigned DEFAULT NULL,
  `tf` float DEFAULT NULL,
  KEY `pages to index_FK` (`rel_id`),
  KEY `word index_FK` (`word_id`),
  KEY `weight` (`weight`),
  KEY `tf` (`tf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_search_index`
--

LOCK TABLES `cms3_search_index` WRITE;
/*!40000 ALTER TABLE `cms3_search_index` DISABLE KEYS */;
INSERT INTO `cms3_search_index` VALUES (1,10,1,0.135135),(1,1,2,0.0135135),(1,1,3,0.0135135),(1,1,4,0.0135135),(1,1,5,0.0135135),(1,1,6,0.0135135),(1,1,7,0.0135135),(1,1,8,0.0135135),(1,1,9,0.0135135),(1,1,10,0.0135135),(1,1,11,0.0135135),(1,1,12,0.0135135),(1,1,13,0.0135135),(1,1,14,0.0135135),(1,1,15,0.0135135),(1,1,16,0.0135135),(1,1,17,0.0135135),(1,1,18,0.0135135),(1,1,19,0.0135135),(1,1,20,0.0135135),(1,1,21,0.0135135),(1,1,22,0.0135135),(1,1,23,0.0135135),(1,2,24,0.027027),(1,1,25,0.0135135),(1,1,26,0.0135135),(1,1,27,0.0135135),(1,1,28,0.0135135),(1,1,29,0.0135135),(1,1,30,0.0135135),(1,1,31,0.0135135),(1,1,32,0.0135135),(1,1,33,0.0135135),(1,1,34,0.0135135),(1,1,35,0.0135135),(1,1,36,0.0135135),(1,1,37,0.0135135),(1,1,38,0.0135135),(1,1,39,0.0135135),(1,1,40,0.0135135),(1,2,41,0.027027),(1,1,42,0.0135135),(1,1,43,0.0135135),(1,1,44,0.0135135),(1,1,45,0.0135135),(1,1,46,0.0135135),(2,10,47,0.106383),(2,10,48,0.106383),(2,1,49,0.0106383),(2,2,50,0.0212766),(2,2,51,0.0212766),(2,2,52,0.0212766),(2,1,53,0.0106383),(2,1,54,0.0106383),(2,1,55,0.0106383),(2,1,56,0.0106383),(2,1,57,0.0106383),(2,1,58,0.0106383),(2,1,59,0.0106383),(2,1,60,0.0106383),(2,1,61,0.0106383),(2,1,62,0.0106383),(2,1,63,0.0106383),(2,1,64,0.0106383),(2,1,65,0.0106383),(2,3,66,0.0319149),(2,1,8,0.0106383),(2,1,9,0.0106383),(2,1,67,0.0106383),(2,1,68,0.0106383),(2,1,69,0.0106383),(2,1,70,0.0106383),(2,1,71,0.0106383),(2,1,72,0.0106383),(2,1,73,0.0106383),(2,1,74,0.0106383),(2,1,75,0.0106383),(2,1,76,0.0106383),(2,1,77,0.0106383),(3,10,78,0.131579),(3,1,79,0.0131579),(3,1,51,0.0131579),(3,1,80,0.0131579),(3,2,67,0.0263158),(3,1,81,0.0131579),(3,1,82,0.0131579),(3,1,83,0.0131579),(3,1,84,0.0131579),(3,1,85,0.0131579),(3,2,86,0.0263158),(3,1,87,0.0131579),(3,1,88,0.0131579),(3,1,89,0.0131579),(3,1,90,0.0131579),(3,1,91,0.0131579),(3,1,92,0.0131579),(3,2,93,0.0263158),(3,2,94,0.0263158),(3,1,95,0.0131579),(3,1,96,0.0131579),(3,1,97,0.0131579),(3,1,98,0.0131579),(3,1,24,0.0131579),(3,1,99,0.0131579),(3,1,100,0.0131579),(3,1,101,0.0131579),(3,1,8,0.0131579),(3,1,102,0.0131579),(3,1,103,0.0131579),(3,1,104,0.0131579),(3,1,105,0.0131579),(3,1,106,0.0131579),(3,1,107,0.0131579),(3,1,108,0.0131579),(3,1,109,0.0131579),(3,1,110,0.0131579),(3,1,111,0.0131579),(3,1,112,0.0131579),(3,1,113,0.0131579),(3,1,114,0.0131579),(3,1,115,0.0131579),(4,10,116,0.333333),(4,10,117,0.333333),(5,5,118,0.0359712),(5,5,119,0.0359712),(5,10,120,0.0719424),(5,1,121,0.00719424),(5,1,122,0.00719424),(5,1,123,0.00719424),(5,1,24,0.00719424),(5,1,124,0.00719424),(5,1,125,0.00719424),(5,1,126,0.00719424),(5,1,127,0.00719424),(5,2,128,0.0143885),(5,1,129,0.00719424),(5,1,130,0.00719424),(5,1,131,0.00719424),(5,1,132,0.00719424),(5,1,133,0.00719424),(5,1,134,0.00719424),(5,1,135,0.00719424),(5,1,136,0.00719424),(5,2,137,0.0143885),(5,2,138,0.0143885),(5,1,139,0.00719424),(5,1,140,0.00719424),(5,1,141,0.00719424),(5,1,142,0.00719424),(5,1,143,0.00719424),(5,1,88,0.00719424),(5,1,144,0.00719424),(5,1,145,0.00719424),(5,1,146,0.00719424),(5,1,147,0.00719424),(5,1,148,0.00719424),(5,1,149,0.00719424),(5,1,150,0.00719424),(6,11,73,0.1),(6,10,151,0.0909091),(6,10,152,0.0909091),(6,10,153,0.0909091),(6,10,154,0.0909091),(6,10,155,0.0909091),(6,1,156,0.00909091),(6,1,157,0.00909091),(6,1,158,0.00909091),(6,1,159,0.00909091),(6,1,160,0.00909091),(6,1,136,0.00909091),(6,1,161,0.00909091),(6,1,162,0.00909091),(6,1,163,0.00909091),(6,1,164,0.00909091),(6,1,165,0.00909091),(6,1,166,0.00909091),(6,1,167,0.00909091),(6,1,168,0.00909091),(6,1,169,0.00909091),(6,1,170,0.00909091),(6,1,171,0.00909091),(6,1,172,0.00909091),(7,11,73,0.119565),(7,10,173,0.108696),(7,10,174,0.108696),(7,10,175,0.108696),(7,10,176,0.108696),(7,1,177,0.0108696),(7,1,178,0.0108696),(7,1,179,0.0108696),(7,1,180,0.0108696),(7,1,181,0.0108696),(7,1,182,0.0108696),(7,1,183,0.0108696),(7,1,184,0.0108696),(7,1,10,0.0108696),(7,1,185,0.0108696),(7,1,186,0.0108696),(7,1,160,0.0108696),(7,1,187,0.0108696),(7,1,188,0.0108696),(7,1,189,0.0108696),(7,1,190,0.0108696),(7,1,191,0.0108696),(7,1,192,0.0108696),(7,1,193,0.0108696),(7,1,194,0.0108696),(8,10,195,0.0617284),(8,12,196,0.0740741),(8,12,160,0.0740741),(8,10,197,0.0617284),(8,11,198,0.0679012),(8,10,199,0.0617284),(8,10,200,0.0617284),(8,3,201,0.0185185),(8,3,202,0.0185185),(8,2,147,0.0123457),(8,3,203,0.0185185),(8,2,204,0.0123457),(8,1,205,0.00617284),(8,1,206,0.00617284),(8,1,207,0.00617284),(8,2,208,0.0123457),(8,1,209,0.00617284),(8,1,181,0.00617284),(8,1,210,0.00617284),(8,1,211,0.00617284),(8,1,212,0.00617284),(8,1,138,0.00617284),(8,1,213,0.00617284),(8,1,214,0.00617284),(8,1,215,0.00617284),(8,1,216,0.00617284),(8,1,217,0.00617284),(8,1,218,0.00617284),(8,1,219,0.00617284),(8,1,220,0.00617284),(8,1,221,0.00617284),(8,1,222,0.00617284),(8,1,73,0.00617284),(8,1,223,0.00617284),(26,10,224,0.111111),(26,10,225,0.111111),(26,10,226,0.111111),(26,10,184,0.111111),(26,10,227,0.111111),(26,10,228,0.111111),(26,10,229,0.111111),(27,10,230,0.25),(27,10,231,0.25),(27,10,232,0.25),(28,10,233,0.125),(28,10,226,0.125),(28,10,184,0.125),(28,10,224,0.125),(28,10,234,0.125),(29,10,235,0.2),(29,10,162,0.2),(29,10,236,0.2),(29,10,237,0.2),(30,10,238,0.142857),(30,10,239,0.142857),(30,10,240,0.142857),(30,10,241,0.142857),(30,10,159,0.142857),(30,10,242,0.142857),(31,10,243,0.2),(31,10,244,0.2),(31,10,245,0.2),(31,10,246,0.2),(32,10,247,0.333333),(32,10,248,0.333333),(32,10,249,0.333333),(33,10,250,0.333333),(33,10,251,0.333333),(33,10,252,0.333333),(34,10,253,0.333333),(34,10,254,0.333333),(35,10,255,0.1),(35,10,256,0.1),(35,10,187,0.1),(35,10,257,0.1),(35,10,48,0.1),(35,10,173,0.1),(35,10,258,0.1),(35,10,259,0.1),(35,10,260,0.1),(43,10,261,0.333333),(43,10,262,0.333333),(43,10,263,0.333333),(44,10,264,0.140845),(44,10,265,0.140845),(44,1,266,0.0140845),(44,1,267,0.0140845),(44,2,268,0.028169),(44,1,269,0.0140845),(44,2,270,0.028169),(44,1,271,0.0140845),(44,1,272,0.0140845),(44,1,273,0.0140845),(44,1,274,0.0140845),(44,1,275,0.0140845),(44,1,276,0.0140845),(44,2,277,0.028169),(44,1,278,0.0140845),(44,1,279,0.0140845),(44,1,280,0.0140845),(44,1,281,0.0140845),(44,1,282,0.0140845),(44,1,283,0.0140845),(44,1,234,0.0140845),(44,1,144,0.0140845),(44,1,284,0.0140845),(44,1,285,0.0140845),(44,1,286,0.0140845),(44,1,287,0.0140845),(44,2,288,0.028169),(44,1,289,0.0140845),(44,1,290,0.0140845),(44,1,291,0.0140845),(45,10,264,0.0854701),(45,11,266,0.0940171),(45,10,292,0.0854701),(45,10,94,0.0854701),(45,2,73,0.017094),(45,1,162,0.00854701),(45,1,293,0.00854701),(45,1,38,0.00854701),(45,3,75,0.025641),(45,1,294,0.00854701),(45,1,295,0.00854701),(45,1,296,0.00854701),(45,1,297,0.00854701),(45,1,298,0.00854701),(45,1,299,0.00854701),(45,1,300,0.00854701),(45,1,301,0.00854701),(45,1,302,0.00854701),(45,1,303,0.00854701),(45,1,304,0.00854701),(45,1,305,0.00854701),(45,1,306,0.00854701),(45,1,286,0.00854701),(45,1,307,0.00854701),(45,1,308,0.00854701),(45,1,309,0.00854701),(45,1,310,0.00854701),(45,1,311,0.00854701),(45,1,312,0.00854701),(45,1,313,0.00854701),(45,1,144,0.00854701),(45,1,314,0.00854701),(45,1,315,0.00854701),(45,1,316,0.00854701),(45,1,317,0.00854701),(45,1,107,0.00854701),(45,1,318,0.00854701),(45,1,319,0.00854701),(45,1,320,0.00854701),(45,1,321,0.00854701),(45,1,322,0.00854701),(45,1,323,0.00854701),(45,1,160,0.00854701),(45,1,324,0.00854701),(45,1,325,0.00854701),(46,10,264,0.12987),(46,10,326,0.12987),(46,10,327,0.12987),(46,1,328,0.012987),(46,1,329,0.012987),(46,1,330,0.012987),(46,1,331,0.012987),(46,1,332,0.012987),(46,1,319,0.012987),(46,1,333,0.012987),(46,1,334,0.012987),(46,1,335,0.012987),(46,1,336,0.012987),(46,1,337,0.012987),(46,1,338,0.012987),(46,1,339,0.012987),(46,1,340,0.012987),(46,1,217,0.012987),(46,1,341,0.012987),(46,1,342,0.012987),(46,2,74,0.025974),(46,1,343,0.012987),(46,1,344,0.012987),(46,1,345,0.012987),(46,1,346,0.012987),(46,1,347,0.012987),(46,1,348,0.012987),(46,1,349,0.012987),(46,1,350,0.012987),(46,1,351,0.012987),(46,1,24,0.012987);
/*!40000 ALTER TABLE `cms3_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_search_index_words`
--

DROP TABLE IF EXISTS `cms3_search_index_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_search_index_words` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `word` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_search_index_words`
--

LOCK TABLES `cms3_search_index_words` WRITE;
/*!40000 ALTER TABLE `cms3_search_index_words` DISABLE KEYS */;
INSERT INTO `cms3_search_index_words` VALUES (126,'20-00'),(51,'2010'),(67,'2011'),(72,'2012'),(131,'234-56-77'),(129,'234-56-78'),(128,'812'),(125,'9-00'),(101,'apps'),(134,'email'),(114,'email-рассылки'),(201,'laquo'),(204,'mdash'),(100,'mobile'),(10,'ndash'),(203,'raquo'),(132,'skype'),(133,'stolyarova_vika'),(135,'stolyarova_vika@gmail.com'),(130,'whatsapp'),(91,'youtube'),(348,'адреналина'),(121,'адрес'),(225,'безопасности'),(65,'бизнес-решений'),(210,'бизнеса'),(71,'бизнесе'),(46,'ближайшее'),(116,'блог'),(334,'будет'),(288,'будут'),(326,'букмекерских'),(173,'быстро'),(248,'важного'),(333,'вам'),(312,'ваш'),(159,'вашего'),(287,'ваши'),(26,'ваших'),(106,'ведение'),(337,'ведь'),(7,'виктория'),(218,'вкладываться'),(209,'владельца'),(154,'влияют'),(208,'возникать'),(138,'вопрос'),(206,'вопроса'),(85,'вопросы'),(274,'вот'),(3,'времени'),(24,'время'),(307,'все'),(253,'встреча'),(104,'входит'),(258,'выполнять'),(158,'гамму'),(1,'главная'),(164,'глаз'),(44,'готова'),(15,'готовый'),(33,'дало'),(200,'двигаться'),(296,'двух'),(332,'деньги'),(246,'деятельности'),(152,'дизайне'),(181,'для'),(2,'доброго'),(34,'довожу'),(249,'договора'),(347,'дозу'),(105,'документооборот'),(211,'должен'),(207,'должно'),(339,'должны'),(63,'дополнительное'),(212,'другой'),(301,'его'),(286,'если'),(22,'естественно'),(267,'есть'),(215,'ещё'),(335,'жалко'),(224,'забочусь'),(137,'задать'),(30,'задача'),(275,'закачивая'),(86,'занималась'),(139,'заполните'),(175,'запустить'),(285,'заработать'),(263,'заработка'),(264,'заработок'),(229,'защиту'),(241,'звено'),(6,'зовут'),(331,'играйте'),(344,'игры'),(338,'изначально'),(147,'или'),(189,'имея'),(53,'институт'),(350,'интересно'),(289,'интересными'),(176,'интернет-магазин'),(153,'интернет-магазина'),(102,'интернет-проекта'),(9,'интернет-проектов'),(87,'интернет-рекламой'),(266,'интернете'),(82,'инфобизнесмена'),(93,'информации'),(235,'использую'),(73,'как'),(213,'какой'),(90,'канала'),(239,'качества'),(256,'качественно'),(232,'квалификации'),(252,'клиента'),(110,'клиентами'),(184,'клиентов'),(254,'клиентом'),(108,'компаний'),(99,'компания'),(120,'контакты'),(219,'контекстную'),(327,'конторах'),(35,'конца'),(319,'которые'),(194,'кошелька'),(349,'кровь'),(199,'куда'),(243,'лучший'),(233,'люблю'),(31,'любое'),(20,'любой'),(291,'людей'),(341,'люди'),(43,'максимально'),(76,'максимум'),(70,'малом'),(117,'маркетинге'),(8,'менеджер'),(5,'меня'),(48,'мне'),(268,'много'),(149,'мной'),(144,'можно'),(238,'мои'),(21,'момент'),(28,'моя'),(192,'навыков'),(228,'надежную'),(271,'называемых'),(174,'наполнить'),(98,'настоящее'),(32,'начатое'),(198,'начать'),(170,'нашей'),(297,'недель'),(240,'недостающие'),(322,'независимо'),(346,'нервы'),(140,'ниже'),(330,'никогда'),(234,'них'),(171,'новой'),(281,'новостным'),(261,'новые'),(183,'новых'),(223,'нуля'),(227,'обеспечиваю'),(115,'обновление'),(92,'обновлением'),(47,'обо'),(50,'образование'),(118,'обратная'),(142,'обратной'),(109,'общение'),(103,'обязанности'),(23,'оговоренное'),(216,'один'),(96,'одностраничников'),(295,'около'),(97,'октябрь'),(161,'она'),(250,'оптимизирую'),(123,'орджоникидзе'),(29,'основная'),(49,'основное'),(14,'ответственный'),(42,'отдаюсь'),(111,'отслеживание'),(13,'очень'),(318,'партнерок'),(328,'первое'),(310,'первые'),(69,'планирование'),(324,'платного'),(316,'площадку'),(231,'повышения'),(156,'подобрать'),(247,'подписание'),(145,'позвонив'),(306,'поисковиках'),(221,'поисковое'),(299,'поисковые'),(298,'пока'),(317,'полно'),(308,'получилось'),(74,'получить'),(311,'пользователи'),(257,'помогает'),(81,'помощник'),(17,'помощь'),(340,'понимать'),(305,'популярных'),(282,'порталам'),(323,'посещаемости'),(36,'постоянно'),(336,'потерять'),(279,'потом'),(309,'пошли'),(345,'пощекотать'),(303,'появиться'),(56,'права'),(329,'правило'),(62,'предприятии'),(167,'прибыли'),(182,'привлечения'),(16,'прийти'),(320,'принимают'),(45,'приступить'),(342,'пришли'),(27,'проблем'),(351,'провести'),(155,'продажи'),(202,'продвигать'),(196,'продвижение'),(321,'проекты'),(302,'проиндексируют'),(294,'пройдет'),(179,'простой'),(245,'профессиональной'),(39,'профессиональный'),(255,'работаю'),(41,'работе'),(19,'работодателю'),(260,'работу'),(124,'работы'),(163,'радовала'),(89,'развитием'),(278,'размещая'),(280,'разным'),(222,'рассказываем'),(314,'рассматривать'),(251,'расходы'),(315,'рекламную'),(107,'рекламных'),(220,'рекламу'),(83,'решала'),(25,'решение'),(75,'сайт'),(160,'сайта'),(94,'сайте'),(113,'сайту'),(195,'самостоятельное'),(177,'самый'),(304,'самых'),(122,'санкт-петербург'),(244,'своей'),(292,'своем'),(18,'своему'),(226,'своих'),(38,'свой'),(259,'свою'),(148,'связавшись'),(143,'связи'),(119,'связь'),(188,'сделать'),(80,'сентябрь'),(300,'системы'),(150,'скайпу'),(290,'скачивать'),(186,'собственного'),(37,'совершенствую'),(236,'современные'),(293,'создадите'),(185,'создание'),(95,'созданием'),(12,'сотрудник'),(59,'специальность'),(190,'специальных'),(180,'способ'),(165,'способствовала'),(262,'способы'),(283,'ссылки'),(112,'статистики'),(172,'статье'),(4,'суток'),(270,'так'),(88,'также'),(205,'такого'),(127,'телефон'),(146,'телефону'),(84,'технические'),(191,'технических'),(237,'технологии'),(193,'толстого'),(162,'только'),(77,'трафика'),(66,'тренинг'),(230,'тренинге'),(166,'увеличению'),(343,'удовольствие'),(313,'уже'),(11,'универсальный'),(61,'управление'),(55,'управления'),(52,'уральский'),(40,'уровень'),(242,'успеха'),(273,'файлов'),(265,'файлообменниках'),(276,'файлообменники'),(269,'файлообменников'),(277,'файлы'),(58,'факультет'),(79,'февраль'),(68,'финансовое'),(141,'форму'),(78,'фотогалерея'),(284,'хорошо'),(325,'хостинга'),(272,'хранилищ'),(151,'цвета'),(157,'цветовую'),(214,'целью'),(64,'центр'),(197,'чего'),(169,'читайте'),(217,'что'),(136,'чтобы'),(60,'экономика'),(54,'экономики'),(57,'экономический'),(187,'это'),(168,'этом'),(178,'эффективный');
/*!40000 ALTER TABLE `cms3_search_index_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_sliders`
--

DROP TABLE IF EXISTS `cms3_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `language_id` int unsigned NOT NULL,
  `sliding_speed` int unsigned DEFAULT NULL,
  `sliding_delay` int unsigned DEFAULT NULL,
  `sliding_loop_enable` tinyint(1) DEFAULT '0',
  `sliding_auto_play_enable` tinyint(1) DEFAULT '0',
  `sliders_random_order_enable` tinyint(1) DEFAULT '0',
  `slides_count` int unsigned DEFAULT '0',
  `custom_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id from domains` (`domain_id`),
  KEY `id from languages` (`language_id`),
  CONSTRAINT `id from domains` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id from languages` FOREIGN KEY (`language_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_sliders`
--

LOCK TABLES `cms3_sliders` WRITE;
/*!40000 ALTER TABLE `cms3_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_slides`
--

DROP TABLE IF EXISTS `cms3_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_slides` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slider_id` int unsigned NOT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `title` varchar(1024) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `text` mediumtext,
  `link` varchar(1024) DEFAULT NULL,
  `open_in_new_tab` tinyint(1) DEFAULT '1',
  `order` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slider_id and is_active with order` (`slider_id`,`is_active`,`order`),
  CONSTRAINT `id from sliders` FOREIGN KEY (`slider_id`) REFERENCES `cms3_sliders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_slides`
--

LOCK TABLES `cms3_slides` WRITE;
/*!40000 ALTER TABLE `cms3_slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_stock_balance_list`
--

DROP TABLE IF EXISTS `cms3_stock_balance_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_stock_balance_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int unsigned NOT NULL,
  `stock_id` int unsigned NOT NULL,
  `value` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `stock balance to offer` (`offer_id`),
  KEY `stock balance to stock` (`stock_id`),
  CONSTRAINT `stock balance to offer` FOREIGN KEY (`offer_id`) REFERENCES `cms3_offer_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock balance to stock` FOREIGN KEY (`stock_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_stock_balance_list`
--

LOCK TABLES `cms3_stock_balance_list` WRITE;
/*!40000 ALTER TABLE `cms3_stock_balance_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms3_stock_balance_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms3_templates`
--

DROP TABLE IF EXISTS `cms3_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms3_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `domain_id` int unsigned DEFAULT NULL,
  `lang_id` int unsigned DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Template - Lang_FK` (`lang_id`),
  KEY `Templates - domains_FK` (`domain_id`),
  KEY `is_default` (`is_default`),
  KEY `filename` (`filename`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms3_templates`
--

LOCK TABLES `cms3_templates` WRITE;
/*!40000 ALTER TABLE `cms3_templates` DISABLE KEYS */;
INSERT INTO `cms3_templates` VALUES (1,'demolancer','common.phtml','php',1,1,'Основной',1);
/*!40000 ALTER TABLE `cms3_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_backup`
--

DROP TABLE IF EXISTS `cms_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_backup` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int DEFAULT NULL,
  `changed_module` varchar(128) DEFAULT NULL,
  `changed_method` varchar(128) DEFAULT NULL,
  `param` text,
  `param0` mediumtext,
  `user_id` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_backup`
--

LOCK TABLES `cms_backup` WRITE;
/*!40000 ALTER TABLE `cms_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_permissions`
--

DROP TABLE IF EXISTS `cms_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_permissions` (
  `module` varchar(64) DEFAULT NULL,
  `method` varchar(64) DEFAULT NULL,
  `owner_id` int unsigned DEFAULT NULL,
  `allow` tinyint DEFAULT '1',
  KEY `module` (`module`),
  KEY `method` (`method`),
  KEY `owner_id` (`owner_id`),
  KEY `allow` (`allow`),
  CONSTRAINT `FK_PermissionOwnerId_To_ObjectId` FOREIGN KEY (`owner_id`) REFERENCES `cms3_objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_permissions`
--

LOCK TABLES `cms_permissions` WRITE;
/*!40000 ALTER TABLE `cms_permissions` DISABLE KEYS */;
INSERT INTO `cms_permissions` VALUES ('users','settings',620,1),('blogs20','add',620,1),('domain','1',619,1),('menu','view',619,1),('news','view',619,1),('content','content',619,1),('blogs20','common',619,1),('forum','view',619,1),('comments','insert',619,1),('vote','poll',619,1),('vote','post',619,1),('webforms','add',619,1),('photoalbum','albums',619,1),('faq','projects',619,1),('catalog','view',619,1),('emarket','purchasing',619,1),('emarket','personal',619,1),('emarket','compare',619,1),('banners','insert',619,1),('users','registrate',619,1),('seo','guest',619,1),('data','619',619,1),('filemanager','list_files',619,1),('umiSettings','read',619,1),('umiTemplates','client',619,1),('appointment','enroll',619,1);
/*!40000 ALTER TABLE `cms_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_reg`
--

DROP TABLE IF EXISTS `cms_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_reg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `var` varchar(48) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `rel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `var` (`var`),
  KEY `rel` (`rel`,`var`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_reg`
--

LOCK TABLES `cms_reg` WRITE;
/*!40000 ALTER TABLE `cms_reg` DISABLE KEYS */;
INSERT INTO `cms_reg` VALUES (1,'modules','',0),(2,'events','events',1),(3,'name','events',2),(4,'title','Events',2),(5,'description','Events',2),(6,'filename','modules/events/class.php',2),(7,'config','1',2),(8,'ico','ico_events',2),(9,'default_method','getUserSettings',2),(10,'default_method_admin','last',2),(11,'max-days-storing-events','30',2),(12,'collect-events','0',2),(13,'menu','menu',1),(14,'name','menu',13),(15,'filename','modules/menu/class.php',13),(16,'config','0',13),(17,'ico','ico_menu',13),(18,'default_method','show',13),(19,'default_method_admin','lists',13),(20,'per_page','10',13),(21,'news','news',1),(22,'name','news',21),(23,'filename','modules/news/class.php',21),(24,'config','1',21),(25,'default_method','archive',21),(26,'default_method_admin','lists',21),(27,'per_page','10',21),(28,'content','content',1),(29,'name','content',28),(30,'filename','modules/content/class.php',28),(31,'config','1',28),(32,'default_method','content',28),(33,'default_method_admin','sitetree',28),(34,'blogs20','blogs20',1),(35,'verison','2.0.0.0',34),(36,'name','blogs20',34),(37,'filename','modules/blogs20/class.php',34),(38,'config','1',34),(39,'ico','ico_blogs20',34),(40,'default_method','blogsList',34),(41,'default_method_admin','posts',34),(42,'paging','',34),(43,'blogs','10',42),(44,'posts','10',42),(45,'comments','50',42),(46,'blogs_per_user','5',34),(47,'allow_guest_comments','0',34),(48,'notifications','',34),(49,'on_comment_add','1',48),(50,'forum','forum',1),(51,'name','forum',50),(52,'filename','modules/forum/class.php',50),(53,'config','1',50),(54,'default_method','show',50),(55,'default_method_admin','confs_list',50),(56,'need_moder','0',50),(57,'allow_guest','0',50),(58,'per_page','25',50),(59,'sort_by_last_message','0',50),(60,'dispatch_id','26073',50),(61,'comments','comments',1),(62,'name','comments',61),(63,'title','Комментарии',61),(64,'filename','modules/comments/class.php',61),(65,'config','1',61),(66,'default_method','void_func',61),(67,'default_method_admin','view_comments',61),(68,'per_page','10',61),(69,'moderated','0',61),(70,'guest_posting','0',61),(71,'allow_guest','1',61),(72,'default_comments','1',61),(73,'vkontakte','0',61),(74,'vk_per_page','0',61),(75,'vk_width','0',61),(76,'vk_api','',61),(77,'vk_extend','0',61),(78,'facebook','0',61),(79,'fb_per_page','0',61),(80,'fb_width','0',61),(81,'fb_colorscheme','light',61),(82,'vote','vote',1),(83,'name','vote',82),(84,'filename','modules/vote/class.php',82),(85,'config','1',82),(86,'default_method','insertlast',82),(87,'default_method_admin','lists',82),(88,'webforms','webforms',1),(89,'name','webforms',88),(90,'filename','webforms/class.php',88),(91,'config','0',88),(92,'default_method','insert',88),(93,'default_method_admin','addresses',88),(94,'imported','1',88),(95,'photoalbum','photoalbum',1),(96,'name','photoalbum',95),(97,'filename','modules/photoalbum/class.php',95),(98,'config','1',95),(99,'default_method','albums',95),(100,'default_method_admin','lists',95),(101,'per_page','10',95),(102,'faq','faq',1),(103,'name','faq',102),(104,'filename','modules/faq/class.php',102),(105,'config','1',102),(106,'default_method','project',102),(107,'default_method_admin','projects_list',102),(108,'per_page','10',102),(109,'disable_new_question_notification','0',102),(110,'dispatches','dispatches',1),(111,'name','dispatches',110),(112,'filename','dispatches/class.php',110),(113,'config','1',110),(114,'default_method','subscribe',110),(115,'default_method_admin','lists',110),(116,'catalog','catalog',1),(117,'name','catalog',116),(118,'title','Каталог',116),(119,'filename','modules/catalog/class.php',116),(120,'config','1',116),(121,'default_method','category',116),(122,'default_method_admin','tree',116),(123,'per_page','25',116),(124,'emarket','emarket',1),(125,'version','2.8.0.5',124),(126,'version_line','pro',124),(127,'name','emarket',124),(128,'title','Интернет-магазин',124),(129,'filename','modules/emarket/class.php',124),(130,'config','1',124),(131,'ico','ico_eshop',124),(132,'default_method_admin','orders',124),(133,'enable-discounts','1',124),(134,'enable-currency','1',124),(135,'enable-stores','1',124),(136,'enable-payment','1',124),(137,'enable-delivery','1',124),(138,'social_vkontakte_merchant_id','',124),(139,'social_vkontakte_key','',124),(140,'social_vkontakte_wishlist','1',124),(141,'social_vkontakte_order','1',124),(142,'social_vkontakte_testmode','1',124),(143,'delivery-with-address','0',124),(144,'default-store-city','Санкт-Петербург',124),(145,'default-store-contact-email','hariton.moiseevich@umisoft.ru',124),(146,'default-store-contact-full-name','Харитон Моисеевич',124),(147,'default-store-contact-phone','88123090315',124),(148,'default-store-country-code','RU',124),(149,'default-store-house-number','25ж',124),(150,'default-store-region','Санкт-Петербург',124),(151,'default-store-street','Красного курсанта',124),(152,'order-defaultHeight','60',124),(153,'order-defaultLength','40',124),(154,'order-defaultWidth','40',124),(155,'order-defaultWeight','1000',124),(156,'default-store-index','197110',124),(157,'banners','banners',1),(158,'name','banners',157),(159,'filename','banners/class.php',157),(160,'config','1',157),(161,'default_method','insert_banner',157),(162,'default_method_admin','lists',157),(163,'users','users',1),(164,'name','users',163),(165,'filename','modules/users/class.php',163),(166,'config','1',163),(167,'default_method','auth',163),(168,'default_method_admin','users_list_all',163),(169,'def_group','620',163),(170,'pages_permissions_changing_enabled_on_add','1',163),(171,'pages_permissions_changing_enabled_on_edit','0',163),(172,'stat','stat',1),(173,'name','stat',172),(174,'filename','modules/stat/class.php',172),(175,'config','1',172),(176,'default_method','sess_refresh',172),(177,'default_method_admin','yandexMetric',172),(178,'collect','0',172),(179,'delete_after','30',172),(180,'items_per_page','100',172),(181,'seo','seo',1),(182,'name','seo',181),(183,'filename','modules/seo/class.php',181),(184,'config','1',181),(185,'default_method','getRelCanonical',181),(186,'default_method_admin','sitemap',181),(187,'megaindex-login','megaindex@umisoft.ru',181),(188,'megaindex-password','et676e5rj',181),(189,'exchange','exchange',1),(190,'name','exchange',189),(191,'filename','modules/exchange/class.php',189),(192,'config','1',189),(193,'ico','exchange',189),(194,'default_method','import',189),(195,'default_method_admin','import',189),(196,'social_networks','social_networks',1),(197,'version','1',196),(198,'name','social_networks',196),(199,'title','Интеграция с социальными сетями',196),(200,'filename','modules/social_networks/class.php',196),(201,'config','0',196),(202,'ico','ico_social_networks',196),(203,'default_method','vkontakte',196),(204,'default_method_admin','vkontakte',196),(205,'tickets','tickets',1),(206,'name','tickets',205),(207,'filename','modules/tickets/class.php',205),(208,'config','0',205),(209,'ico','ico_tickets',205),(210,'default_method','',205),(211,'default_method_admin','tickets',205),(212,'config','config',1),(213,'name','config',212),(214,'filename','modules/config/class.php',212),(215,'config','0',212),(216,'default_method','test',212),(217,'default_method_admin','main',212),(218,'data','data',1),(219,'name','data',218),(220,'filename','modules/data/class.php',218),(221,'config','1',218),(222,'default_method','test',218),(223,'default_method_admin','types',218),(224,'autoupdate','autoupdate',1),(225,'name','autoupdate',224),(226,'filename','modules/autoupdate/class.php',224),(227,'config','1',224),(228,'default_method','updateall',224),(229,'default_method_admin','versions',224),(230,'backup','backup',1),(231,'name','backup',230),(232,'title','Backups',230),(233,'filename','modules/backup/class.php',230),(234,'config','1',230),(235,'default_method','temp_method',230),(236,'default_method_admin','snapshots',230),(237,'max_timelimit','30',230),(238,'max_save_actions','50',230),(239,'enabled','1',230),(240,'search','search',1),(241,'name','search',240),(242,'filename','modules/search/class.php',240),(243,'default_method','search_do',240),(244,'default_method_admin','index_control',240),(245,'per_page','10',240),(246,'one_iteration_index','5',240),(247,'config','1',240),(248,'filemanager','filemanager',1),(249,'name','filemanager',248),(250,'description','Управление файловой системой.',248),(251,'filename','modules/filemanager/class.php',248),(252,'config','0',248),(253,'default_method','list_files',248),(254,'default_method_admin','shared_files',248),(261,'api-key','',260),(262,'umiRedirects','umiRedirects',1),(263,'config','1',262),(264,'name','umiRedirects',262),(265,'default_method','empty',262),(266,'default_method_admin','lists',262),(267,'umiSliders','umiSliders',1),(268,'config','1',267),(269,'name','umiSliders',267),(270,'default_method','empty',267),(271,'default_method_admin','getSliders',267),(272,'default_sliding_speed','1',267),(273,'default_sliding_delay','1',267),(274,'default_sliding_slides_count','10',267),(275,'umiNotifications','umiNotifications',1),(276,'default_method','empty',275),(277,'default_method_admin','notifications',275),(278,'config','0',275),(279,'umiSettings','umiSettings',1),(280,'default_method','empty',279),(281,'default_method_admin','read',279),(282,'trash','trash',1),(283,'config','0',282),(284,'default_method','empty',282),(285,'default_method_admin','trash',282),(286,'umiStub','umiStub',1),(287,'name','umiStub',286),(288,'config','0',286),(289,'default_method','empty',286),(290,'default_method_admin','stub',286),(291,'umiTemplates','umiTemplates',1),(292,'name','umiTemplates',291),(293,'config','0',291),(294,'default_method','empty',291),(295,'default_method_admin','getTemplateList',291),(296,'appointment','appointment',1),(297,'config','1',296),(298,'name','appointment',296),(299,'work-time-0','',296),(300,'work-time-1','',296),(301,'work-time-2','',296),(302,'work-time-3','',296),(303,'work-time-4','',296),(304,'work-time-5','',296),(305,'work-time-6','',296),(306,'default_method','page',296),(307,'default_method_admin','orders',296),(308,'settings','',0),(309,'keycode','909AAF566D7-D887CB4CFA0-BF683953464',308),(310,'system_edition','commerce',308),(311,'previous_edition','commerce',308),(312,'system_version','23',308),(313,'system_build','92176',308),(314,'last_updated','1678975527',308),(315,'system_build','92176',224),(316,'install','1559905293',308),(317,'guest_id','619',163),(318,'create','1559905293',308),(319,'umiMessages','',0),(320,'lastConnectTime','1678960890',319),(321,'lastMessageId','0',319),(322,'last_mess_time','1600699860',308),(323,'autocreate_path','',34),(324,'moderate_comments','0',34),(325,'use-umiNotifications','0',34),(326,'disable_url_autocorrection','0',308),(327,'max_img_filesize','48',308),(328,'default_module_admin','events',308),(329,'default_module_admin_changed','1',308),(330,'default_module','content',308),(331,'site_name','umicms.demo site',308),(332,'title_prefix','',308),(333,'1','',332),(334,'1','UMI.CMS -',333),(335,'2','',333),(336,'domain','',308),(337,'admin_email','demo@umi-cms.ru',308),(338,'error_email','',308),(339,'memcached','',308),(340,'is_enabled','0',339),(341,'host','localhost',339),(342,'port','11211',339),(343,'rec_deep','0',308),(344,'email_from','demo@umi-cms.ru',308),(345,'fio_from','Тестовый отправитель',308),(346,'meta_keywords','',308),(347,'1','',346),(348,'1','umi CMS демо DEMO сайт система управление',347),(349,'2','',347),(350,'meta_description','',308),(351,'1','',350),(352,'1','',351),(353,'2','',351),(354,'disable_captcha','0',308),(355,'show_macros_onerror','1',308),(356,'lock_duration','3600',308),(357,'expiration_control','0',308),(358,'allow_alt_name_with_module_collision','0',308),(359,'allow_redirects_watch','1',308),(360,'lock_pages','0',308),(361,'next_clean_time','',308),(362,'next_optimise_time','',308),(363,'elements_count_per_page','15',308),(364,'captcha-remember','1',308),(365,'seo','',308),(366,'allow-empty-description','1',365),(367,'allow-empty-h1','1',365),(368,'allow-empty-keywords','0',365),(369,'allow-empty-title','1',365),(370,'umiMarket','umiMarket',1),(371,'config','0',370),(372,'name','umiMarket',370),(373,'default_method','empty',370),(374,'default_method_admin','catalog',370),(375,'extensions','',0);
/*!40000 ALTER TABLE `cms_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_sitemap`
--

DROP TABLE IF EXISTS `cms_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_sitemap` (
  `id` int NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `link` varchar(1024) NOT NULL,
  `sort` tinyint NOT NULL,
  `priority` double NOT NULL DEFAULT '0',
  `dt` datetime NOT NULL,
  `level` int unsigned NOT NULL,
  `lang_id` int unsigned NOT NULL,
  `change_frequency` enum('always','hourly','daily','weekly','monthly','yearly','never','') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__sort` (`sort`),
  KEY `__domain_id` (`domain_id`),
  KEY `__domain_id__sort` (`domain_id`,`sort`),
  KEY `__domain_id__level` (`domain_id`,`level`),
  KEY `lang_id from cms3_langs` (`lang_id`),
  CONSTRAINT `domain_id from cms3_domains` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lang_id from cms3_langs` FOREIGN KEY (`lang_id`) REFERENCES `cms3_langs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_sitemap`
--

LOCK TABLES `cms_sitemap` WRITE;
/*!40000 ALTER TABLE `cms_sitemap` DISABLE KEYS */;
INSERT INTO `cms_sitemap` VALUES (1,1,'http://dev.aposio.ru:18880/',7,1,'2019-06-18 15:15:30',0,1,'weekly'),(2,1,'http://dev.aposio.ru:18880/obo-mne/',4,1,'2019-06-10 16:39:01',1,1,'weekly'),(3,1,'http://dev.aposio.ru:18880/fotogalereya/',2,1,'2019-06-11 17:27:58',1,1,'weekly'),(4,1,'http://dev.aposio.ru:18880/blog/',5,1,'2019-06-18 14:02:58',1,1,'weekly'),(5,1,'http://dev.aposio.ru:18880/kontakty/',12,1,'2019-06-19 14:59:06',1,1,'weekly'),(6,1,'http://dev.aposio.ru:18880/blog/kak-cveta-v-dizajne-internet-magazina-vliyayut-na-prodazhi/',13,0.5,'2019-06-14 12:04:48',2,1,'weekly'),(7,1,'http://dev.aposio.ru:18880/blog/kak-bystro-napolnit-i-zapustit-internet-magazin/',16,0.5,'2019-06-14 12:05:14',2,1,'weekly'),(8,1,'http://dev.aposio.ru:18880/blog/samostoyatelnoe-prodvizhenie-sajta-s-chego-nachat-i-kuda-dvigatsya/',8,0.5,'2019-06-14 12:06:00',2,1,'weekly'),(26,1,'http://dev.aposio.ru:18880/fotogalereya/zabochus-o-bezopasnosti-svoih-klientov-i-obespechivayu-nadezhnuyu-zawitu/',5,0.5,'2019-06-11 16:44:33',2,1,'weekly'),(27,1,'http://dev.aposio.ru:18880/fotogalereya/na-treninge-povysheniya-kvalifikacii/',12,0.5,'2019-06-11 16:44:58',2,1,'weekly'),(28,1,'http://dev.aposio.ru:18880/fotogalereya/ya-lyublyu-svoih-klientov-i-zabochus-o-nih/',6,0.5,'2019-06-11 16:45:21',2,1,'weekly'),(29,1,'http://dev.aposio.ru:18880/fotogalereya/ya-ispolzuyu-tolko-sovremennye-tehnologii/',15,0.5,'2019-06-11 16:46:12',2,1,'weekly'),(30,1,'http://dev.aposio.ru:18880/fotogalereya/moi-kachestva-nedostayuwie-zveno-vashego-uspeha/',9,0.5,'2019-06-11 16:47:07',2,1,'weekly'),(31,1,'http://dev.aposio.ru:18880/fotogalereya/luchshij-v-svoej-professionalnoj-deyatelnosti/',14,0.5,'2019-06-11 16:47:45',2,1,'weekly'),(32,1,'http://dev.aposio.ru:18880/fotogalereya/podpisanie-vazhnogo-dogovora/',14,0.5,'2019-06-11 16:47:58',2,1,'weekly'),(33,1,'http://dev.aposio.ru:18880/fotogalereya/optimiziruyu-rashody-klienta/',1,0.5,'2019-06-11 16:49:09',2,1,'weekly'),(34,1,'http://dev.aposio.ru:18880/fotogalereya/vstrecha-s-klientom/',4,0.5,'2019-06-11 16:49:40',2,1,'weekly'),(35,1,'http://dev.aposio.ru:18880/fotogalereya/rabotayu-kachestvenno-eto-pomogaet-mne-bystro-vypolnyat-svoyu-rabotu/',8,0.5,'2019-06-11 16:50:06',2,1,'weekly'),(43,1,'http://dev.aposio.ru:18880/novye-sposoby-zarabotka/',11,1,'2019-06-18 14:02:46',1,1,'weekly'),(44,1,'http://dev.aposio.ru:18880/novye-sposoby-zarabotka/zarabotok-na-fajloobmennikah/',4,0.5,'2019-06-18 14:00:50',2,1,'weekly'),(45,1,'http://dev.aposio.ru:18880/novye-sposoby-zarabotka/zarabotok-v-internete-na-svoem-sajte/',11,0.5,'2019-06-18 14:01:34',2,1,'weekly'),(46,1,'http://dev.aposio.ru:18880/novye-sposoby-zarabotka/zarabotok-na-bukmekerskih-kontorah/',11,0.5,'2019-06-18 14:02:05',2,1,'weekly');
/*!40000 ALTER TABLE `cms_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_sitemap_images`
--

DROP TABLE IF EXISTS `cms_sitemap_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_sitemap_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `domain_id` int unsigned NOT NULL,
  `link` varchar(1024) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id from cms_sitemap` (`location_id`),
  KEY `domain_id from cms3_domains for sitemap image` (`domain_id`),
  CONSTRAINT `domain_id from cms3_domains for sitemap image` FOREIGN KEY (`domain_id`) REFERENCES `cms3_domains` (`id`) ON DELETE CASCADE,
  CONSTRAINT `location_id from cms_sitemap` FOREIGN KEY (`location_id`) REFERENCES `cms_sitemap` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_sitemap_images`
--

LOCK TABLES `cms_sitemap_images` WRITE;
/*!40000 ALTER TABLE `cms_sitemap_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_sitemap_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_dispatches`
--

DROP TABLE IF EXISTS `cms_stat_dispatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_dispatches` (
  `hash` varchar(10) NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_dispatches`
--

LOCK TABLES `cms_stat_dispatches` WRITE;
/*!40000 ALTER TABLE `cms_stat_dispatches` DISABLE KEYS */;
INSERT INTO `cms_stat_dispatches` VALUES ('4ea50920b5',1568289556),('8a63c8dfdb',1568289683),('aa0479d053',1568289769),('0ddf805584',1568289773),('8ae1b9eb88',1568289841),('63a9da4057',1568289953),('145e41c7cd',1568289963),('674473613a',1568290020),('ae404ed34b',1568290117),('329f83993a',1568290157),('a9229c9bb0',1568290248),('0e7b4541c9',1568290273),('05653011ac',1568290331),('19303ef929',1568290363),('25e84b76ae',1568290447),('77c2be8d24',1568290475),('bed57f8061',1568290565),('2e3c3c8c31',1568290773),('8b5fdd03c0',1568290833),('ad6012b2de',1568290856),('9e3218dff7',1568290917),('66d36e2e8a',1568290940),('a56d596526',1568290947),('2b3516f234',1568291008),('5a65d270b9',1568291137),('44524701eb',1568291185),('dc1bbc5fc3',1568291297),('e182e28688',1568291367),('7ed136a2e5',1568291401),('80e10c0218',1568291418),('3bc1abb56c',1568291454),('323b697929',1568291506),('03418ac1fb',1568291547),('eee7a2a769',1568291649),('5c11b54bda',1568291711),('85866abdf3',1568291736),('6ad90b17ab',1568291784),('ff833c104f',1568291801),('47aab5bfaa',1568291823),('017aa6bc26',1568291835),('93b2c33b8d',1568291867),('b4c4272231',1568291933),('137303c4fe',1568292398),('6aef968edc',1568292599),('636e426f3d',1568292684),('d570842eb1',1568292707),('63b6d80efb',1568292719),('f8ee356c0a',1568292739),('1de119e875',1568293428),('6a1720e670',1568293447),('5127cb8bd0',1568293470),('dd5f9849ec',1568293565),('956a2e1c46',1568293647),('d215954ff9',1568293675),('19aaedd9b0',1568293691),('228993de48',1568293757),('1167f2e61a',1568293808),('87b2ba2858',1568293833),('10c226d422',1568293875),('c826d294d4',1568293899),('ff9dbde258',1568293906),('d57dfe5fd8',1574431723),('55b4e7366d',1574431730),('fsdfsdfsf2',1575021181),('fsdfsdfsf2',1575021182);
/*!40000 ALTER TABLE `cms_stat_dispatches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_domains`
--

DROP TABLE IF EXISTS `cms_stat_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_domains` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entrytime` int DEFAULT NULL,
  `refer_domain` text,
  `sess_id` text,
  PRIMARY KEY (`id`),
  KEY `sess_id` (`sess_id`(4))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_domains`
--

LOCK TABLES `cms_stat_domains` WRITE;
/*!40000 ALTER TABLE `cms_stat_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_entry_points`
--

DROP TABLE IF EXISTS `cms_stat_entry_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_entry_points` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `url` text,
  `host_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`(1)),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_entry_points`
--

LOCK TABLES `cms_stat_entry_points` WRITE;
/*!40000 ALTER TABLE `cms_stat_entry_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_entry_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_entry_points_events`
--

DROP TABLE IF EXISTS `cms_stat_entry_points_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_entry_points_events` (
  `entry_point_id` int unsigned DEFAULT NULL,
  `event_id` int unsigned DEFAULT NULL,
  KEY `entry_point_id` (`entry_point_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_entry_points_events`
--

LOCK TABLES `cms_stat_entry_points_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_entry_points_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_entry_points_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events`
--

DROP TABLE IF EXISTS `cms_stat_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `profit` float(9,2) DEFAULT '0.00',
  `host_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`type`),
  KEY `host_id` (`host_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events`
--

LOCK TABLES `cms_stat_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events_collected`
--

DROP TABLE IF EXISTS `cms_stat_events_collected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_events_collected` (
  `event_id` int unsigned DEFAULT NULL,
  `hit_id` int unsigned DEFAULT NULL,
  KEY `event_id` (`event_id`,`hit_id`),
  KEY `hit_id` (`hit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events_collected`
--

LOCK TABLES `cms_stat_events_collected` WRITE;
/*!40000 ALTER TABLE `cms_stat_events_collected` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events_collected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events_rel`
--

DROP TABLE IF EXISTS `cms_stat_events_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_events_rel` (
  `metaevent_id` int unsigned DEFAULT NULL,
  `event_id` int unsigned DEFAULT NULL,
  UNIQUE KEY `metaevent_id` (`metaevent_id`,`event_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events_rel`
--

LOCK TABLES `cms_stat_events_rel` WRITE;
/*!40000 ALTER TABLE `cms_stat_events_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_events_urls`
--

DROP TABLE IF EXISTS `cms_stat_events_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_events_urls` (
  `event_id` int unsigned DEFAULT NULL,
  `page_id` int unsigned DEFAULT NULL,
  UNIQUE KEY `event_id` (`event_id`,`page_id`),
  KEY `page_id` (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_events_urls`
--

LOCK TABLES `cms_stat_events_urls` WRITE;
/*!40000 ALTER TABLE `cms_stat_events_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_events_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_finders`
--

DROP TABLE IF EXISTS `cms_stat_finders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_finders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bot_name` text,
  `pattern` text,
  `alias` text,
  `domain` text,
  `utf` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_finders`
--

LOCK TABLES `cms_stat_finders` WRITE;
/*!40000 ALTER TABLE `cms_stat_finders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_finders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_hits`
--

DROP TABLE IF EXISTS `cms_stat_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_hits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `hour` tinyint DEFAULT NULL,
  `day_of_week` tinyint(1) DEFAULT NULL,
  `day` tinyint DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  `year` int unsigned DEFAULT NULL,
  `path_id` int unsigned DEFAULT NULL,
  `number_in_path` int unsigned DEFAULT NULL,
  `week` tinyint unsigned DEFAULT NULL,
  `prev_page_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `day_of_week` (`day_of_week`),
  KEY `date` (`date`,`day_of_week`,`day`,`month`),
  KEY `day` (`day`,`month`,`date`,`day_of_week`),
  KEY `page_id` (`page_id`,`date`),
  KEY `date_level` (`date`,`number_in_path`),
  KEY `date_prev_page_level` (`date`,`prev_page_id`,`number_in_path`),
  KEY `path_id_level` (`path_id`,`number_in_path`,`prev_page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_hits`
--

LOCK TABLES `cms_stat_hits` WRITE;
/*!40000 ALTER TABLE `cms_stat_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_holidays`
--

DROP TABLE IF EXISTS `cms_stat_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_holidays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `day` tinyint DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `day_month` (`day`,`month`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_holidays`
--

LOCK TABLES `cms_stat_holidays` WRITE;
/*!40000 ALTER TABLE `cms_stat_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_pages`
--

DROP TABLE IF EXISTS `cms_stat_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uri` text,
  `host_id` int unsigned DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section`),
  KEY `uri` (`uri`(4)),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_pages`
--

LOCK TABLES `cms_stat_pages` WRITE;
/*!40000 ALTER TABLE `cms_stat_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_paths`
--

DROP TABLE IF EXISTS `cms_stat_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_paths` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `source_id` int unsigned DEFAULT NULL,
  `host_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `user_id` (`user_id`),
  KEY `id_host` (`id`,`host_id`),
  KEY `date_host_id` (`date`,`host_id`,`user_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_paths`
--

LOCK TABLES `cms_stat_paths` WRITE;
/*!40000 ALTER TABLE `cms_stat_paths` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_paths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_phrases`
--

DROP TABLE IF EXISTS `cms_stat_phrases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_phrases` (
  `phrase` text,
  `domain` text,
  `finder_id` int DEFAULT NULL,
  `entrytime` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_phrases`
--

LOCK TABLES `cms_stat_phrases` WRITE;
/*!40000 ALTER TABLE `cms_stat_phrases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_phrases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sites`
--

DROP TABLE IF EXISTS `cms_stat_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sites`
--

LOCK TABLES `cms_stat_sites` WRITE;
/*!40000 ALTER TABLE `cms_stat_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sites_groups`
--

DROP TABLE IF EXISTS `cms_stat_sites_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sites_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sites_groups`
--

LOCK TABLES `cms_stat_sites_groups` WRITE;
/*!40000 ALTER TABLE `cms_stat_sites_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sites_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources`
--

DROP TABLE IF EXISTS `cms_stat_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `src_type` tinyint unsigned DEFAULT NULL,
  `concrete_src_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `src_type` (`src_type`,`concrete_src_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources`
--

LOCK TABLES `cms_stat_sources` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_coupon`
--

DROP TABLE IF EXISTS `cms_stat_sources_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_coupon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `profit` float(9,2) DEFAULT NULL,
  `descript` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_coupon`
--

LOCK TABLES `cms_stat_sources_coupon` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_coupon_events`
--

DROP TABLE IF EXISTS `cms_stat_sources_coupon_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_coupon_events` (
  `coupon_id` int unsigned DEFAULT NULL,
  `event_id` int unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_coupon_events`
--

LOCK TABLES `cms_stat_sources_coupon_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_coupon_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_coupon_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_openstat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned DEFAULT '0',
  `campaign_id` int unsigned DEFAULT '0',
  `ad_id` int unsigned DEFAULT NULL,
  `source_id` int unsigned DEFAULT NULL,
  `path_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat`
--

LOCK TABLES `cms_stat_sources_openstat` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_ad`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_openstat_ad` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_ad`
--

LOCK TABLES `cms_stat_sources_openstat_ad` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_campaign`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_openstat_campaign` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_campaign`
--

LOCK TABLES `cms_stat_sources_openstat_campaign` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_service`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_openstat_service` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_service`
--

LOCK TABLES `cms_stat_sources_openstat_service` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_openstat_source`
--

DROP TABLE IF EXISTS `cms_stat_sources_openstat_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_openstat_source` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_openstat_source`
--

LOCK TABLES `cms_stat_sources_openstat_source` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_openstat_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_pr`
--

DROP TABLE IF EXISTS `cms_stat_sources_pr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_pr` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_pr`
--

LOCK TABLES `cms_stat_sources_pr` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_pr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_pr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_pr_events`
--

DROP TABLE IF EXISTS `cms_stat_sources_pr_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_pr_events` (
  `pr_id` int unsigned DEFAULT NULL,
  `event_id` int unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_pr_events`
--

LOCK TABLES `cms_stat_sources_pr_events` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_pr_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_pr_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_pr_sites`
--

DROP TABLE IF EXISTS `cms_stat_sources_pr_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_pr_sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pr_id` int unsigned DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_pr_sites`
--

LOCK TABLES `cms_stat_sources_pr_sites` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_pr_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_pr_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_search`
--

DROP TABLE IF EXISTS `cms_stat_sources_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_search` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `engine_id` int unsigned DEFAULT NULL,
  `text_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `engine_id` (`engine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_search`
--

LOCK TABLES `cms_stat_sources_search` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_search_engines`
--

DROP TABLE IF EXISTS `cms_stat_sources_search_engines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_search_engines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `url_mask` char(255) DEFAULT NULL,
  `varname` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_search_engines`
--

LOCK TABLES `cms_stat_sources_search_engines` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_search_engines` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_search_engines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_search_queries`
--

DROP TABLE IF EXISTS `cms_stat_sources_search_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_search_queries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_search_queries`
--

LOCK TABLES `cms_stat_sources_search_queries` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_search_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_search_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_sites`
--

DROP TABLE IF EXISTS `cms_stat_sources_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uri` text,
  `domain` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`),
  KEY `uri` (`uri`(255)),
  KEY `id_domain` (`id`,`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_sites`
--

LOCK TABLES `cms_stat_sources_sites` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_sites_domains`
--

DROP TABLE IF EXISTS `cms_stat_sources_sites_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_sites_domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_sites_domains`
--

LOCK TABLES `cms_stat_sources_sites_domains` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_sites_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_sites_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_sources_ticket`
--

DROP TABLE IF EXISTS `cms_stat_sources_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_sources_ticket` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_sources_ticket`
--

LOCK TABLES `cms_stat_sources_ticket` WRITE;
/*!40000 ALTER TABLE `cms_stat_sources_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_sources_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_users`
--

DROP TABLE IF EXISTS `cms_stat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) DEFAULT NULL,
  `first_visit` datetime DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `os_id` int unsigned DEFAULT NULL,
  `browser_id` int unsigned DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `location` text,
  `js_version` varchar(5) DEFAULT NULL,
  `host_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_visit` (`first_visit`),
  KEY `session_id` (`session_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_users`
--

LOCK TABLES `cms_stat_users` WRITE;
/*!40000 ALTER TABLE `cms_stat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_users_browsers`
--

DROP TABLE IF EXISTS `cms_stat_users_browsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_users_browsers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_users_browsers`
--

LOCK TABLES `cms_stat_users_browsers` WRITE;
/*!40000 ALTER TABLE `cms_stat_users_browsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_users_browsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stat_users_os`
--

DROP TABLE IF EXISTS `cms_stat_users_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_stat_users_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stat_users_os`
--

LOCK TABLES `cms_stat_users_os` WRITE;
/*!40000 ALTER TABLE `cms_stat_users_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stat_users_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_feeds`
--

DROP TABLE IF EXISTS `umi_event_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umi_event_feeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` bigint DEFAULT NULL,
  `params` mediumtext,
  `type_id` varchar(255) NOT NULL,
  `element_id` int DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_feeds`
--

LOCK TABLES `umi_event_feeds` WRITE;
/*!40000 ALTER TABLE `umi_event_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `umi_event_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_types`
--

DROP TABLE IF EXISTS `umi_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umi_event_types` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_types`
--

LOCK TABLES `umi_event_types` WRITE;
/*!40000 ALTER TABLE `umi_event_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `umi_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_user_history`
--

DROP TABLE IF EXISTS `umi_event_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umi_event_user_history` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_user_history`
--

LOCK TABLES `umi_event_user_history` WRITE;
/*!40000 ALTER TABLE `umi_event_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `umi_event_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umi_event_users`
--

DROP TABLE IF EXISTS `umi_event_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umi_event_users` (
  `id` int unsigned NOT NULL,
  `last_check_in` bigint DEFAULT NULL,
  `settings` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umi_event_users`
--

LOCK TABLES `umi_event_users` WRITE;
/*!40000 ALTER TABLE `umi_event_users` DISABLE KEYS */;
INSERT INTO `umi_event_users` VALUES (182,1577274095,'a:0:{}');
/*!40000 ALTER TABLE `umi_event_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-16 14:28:28
