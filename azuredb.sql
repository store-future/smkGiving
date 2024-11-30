CREATE DATABASE  IF NOT EXISTS `loancharity` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `loancharity`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 20.197.14.90    Database: loancharity
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_type` varchar(20) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `legal_entity_name` varchar(100) NOT NULL,
  `org_contact_number` varchar(20) DEFAULT NULL,
  `primary_contact_name` varchar(100) DEFAULT NULL,
  `primary_contact_number` varchar(20) DEFAULT NULL,
  `primary_contact_email` varchar(255) DEFAULT NULL,
  `org_website` varchar(200) DEFAULT NULL,
  `GSTIN` varchar(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `company_logo` varchar(100) DEFAULT NULL,
  `fund_corpus` decimal(15,2) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'foundation','Dr.D.J.Kini Foundation','Dr.D.J.Kini Foundation','9731708241','Anil Kini','9731708241','anilkini@hotmail.com',NULL,NULL,'2024-04-25 04:06:35.643087','2024-07-02 06:37:15.497169','active','',20000000.00);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add Token',7,'add_tokenproxy'),(26,'Can change Token',7,'change_tokenproxy'),(27,'Can delete Token',7,'delete_tokenproxy'),(28,'Can view Token',7,'view_tokenproxy'),(29,'Can add account',8,'add_account'),(30,'Can change account',8,'change_account'),(31,'Can delete account',8,'delete_account'),(32,'Can view account',8,'view_account'),(33,'Can add Location',9,'add_location'),(34,'Can change Location',9,'change_location'),(35,'Can delete Location',9,'delete_location'),(36,'Can view Location',9,'view_location'),(37,'Can add All User',10,'add_customuser'),(38,'Can change All User',10,'change_customuser'),(39,'Can delete All User',10,'delete_customuser'),(40,'Can view All User',10,'view_customuser'),(41,'Can add email address',11,'add_emailaddress'),(42,'Can change email address',11,'change_emailaddress'),(43,'Can delete email address',11,'delete_emailaddress'),(44,'Can view email address',11,'view_emailaddress'),(45,'Can add email confirmation',12,'add_emailconfirmation'),(46,'Can change email confirmation',12,'change_emailconfirmation'),(47,'Can delete email confirmation',12,'delete_emailconfirmation'),(48,'Can view email confirmation',12,'view_emailconfirmation'),(49,'Can add case',13,'add_case'),(50,'Can change case',13,'change_case'),(51,'Can delete case',13,'delete_case'),(52,'Can view case',13,'view_case'),(53,'Can add case purpose',14,'add_casepurpose'),(54,'Can change case purpose',14,'change_casepurpose'),(55,'Can delete case purpose',14,'delete_casepurpose'),(56,'Can view case purpose',14,'view_casepurpose'),(57,'Can add Case Querie',15,'add_casequery'),(58,'Can change Case Querie',15,'change_casequery'),(59,'Can delete Case Querie',15,'delete_casequery'),(60,'Can view Case Querie',15,'view_casequery'),(61,'Can add Seed Data Lov',16,'add_lovseeddata'),(62,'Can change Seed Data Lov',16,'change_lovseeddata'),(63,'Can delete Seed Data Lov',16,'delete_lovseeddata'),(64,'Can view Seed Data Lov',16,'view_lovseeddata'),(65,'Can add case evaluation',17,'add_caseevaluation'),(66,'Can change case evaluation',17,'change_caseevaluation'),(67,'Can delete case evaluation',17,'delete_caseevaluation'),(68,'Can view case evaluation',17,'view_caseevaluation'),(69,'Can add social account',18,'add_socialaccount'),(70,'Can change social account',18,'change_socialaccount'),(71,'Can delete social account',18,'delete_socialaccount'),(72,'Can view social account',18,'view_socialaccount'),(73,'Can add social application',19,'add_socialapp'),(74,'Can change social application',19,'change_socialapp'),(75,'Can delete social application',19,'delete_socialapp'),(76,'Can view social application',19,'view_socialapp'),(77,'Can add social application token',20,'add_socialtoken'),(78,'Can change social application token',20,'change_socialtoken'),(79,'Can delete social application token',20,'delete_socialtoken'),(80,'Can view social application token',20,'view_socialtoken'),(81,'Can add site',21,'add_site'),(82,'Can change site',21,'change_site'),(83,'Can delete site',21,'delete_site'),(84,'Can view site',21,'view_site'),(85,'Can add case disbursement',22,'add_casedisbursement'),(86,'Can change case disbursement',22,'change_casedisbursement'),(87,'Can delete case disbursement',22,'delete_casedisbursement'),(88,'Can view case disbursement',22,'view_casedisbursement'),(89,'Can add case repayment',23,'add_caserepayment'),(90,'Can change case repayment',23,'change_caserepayment'),(91,'Can delete case repayment',23,'delete_caserepayment'),(92,'Can view case repayment',23,'view_caserepayment'),(93,'Can add image upload',24,'add_imageupload'),(94,'Can change image upload',24,'change_imageupload'),(95,'Can delete image upload',24,'delete_imageupload'),(96,'Can view image upload',24,'view_imageupload'),(97,'Can add file upload',25,'add_fileupload'),(98,'Can change file upload',25,'change_fileupload'),(99,'Can delete file upload',25,'delete_fileupload'),(100,'Can view file upload',25,'view_fileupload');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('3bccd29cd1836560092b6fe3b6f80c0a611c5e0e','2024-04-30 10:37:49.516931',27),('600af092802cb72429312109b635d40d7edf391b','2024-04-25 04:14:20.063053',3),('b6d60716be313cae4b5c366ebef71e58fb1da8eb','2024-04-25 04:07:07.891918',2),('d0d40299ee969f34646b5b84a6f67617882394ba','2024-07-02 06:39:39.625225',337);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `request_amt` decimal(10,2) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `short_description` longtext,
  `has_guarantor` tinyint(1) NOT NULL,
  `guarantor_user_id` int DEFAULT NULL,
  `guarantor_name` varchar(100) DEFAULT NULL,
  `guarantor_phone` varchar(20) DEFAULT NULL,
  `guarantor_email` varchar(100) DEFAULT NULL,
  `benefactor_user_id` int DEFAULT NULL,
  `coapplicant_user_id` int DEFAULT NULL,
  `referred_by` varchar(55) DEFAULT NULL,
  `coordinator_user_id` int NOT NULL,
  `grant_type` varchar(55) DEFAULT NULL,
  `approval_status` varchar(50) NOT NULL,
  `disbursement_schedule` varchar(100) DEFAULT NULL,
  `collateral` varchar(100) DEFAULT NULL,
  `case_submit_date` varchar(20) DEFAULT NULL,
  `pending_info` tinyint(1) NOT NULL,
  `approved_amt` decimal(10,2) NOT NULL,
  `disbursement_count` varchar(50) DEFAULT NULL,
  `repay_percent` decimal(10,2) NOT NULL,
  `repay_plan` varchar(50) DEFAULT NULL,
  `repayment_count` varchar(50) DEFAULT NULL,
  `repayment_received` decimal(10,2) NOT NULL,
  `total_disbursement` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (394,0.00,'Education','test_desc',1,0,NULL,NULL,NULL,378,377,NULL,0,NULL,'disbursement','quarterly',NULL,NULL,0,234234.00,'10',234234.00,'Partially','5',114705.00,3563.00),(401,360000.00,'Retirement','Retirement plan for Dolly John',0,0,'','','',386,0,'',0,'Non Repayable','disbursement','monthly','Unsecured','',0,300000.00,'24',300000.00,'Non Repayable','0',0.00,120000.00),(402,288000.00,'Retirement','Retirement Plan for Regina',0,0,'','','',387,0,'',0,'Non Repayable','disbursement','monthly','Unsecured','',0,288000.00,'24',288000.00,'Non Repayable','0',0.00,84000.00),(403,100000.00,'Home Loan/Renovation','Home loan for Kumar',0,0,'','','',388,0,'',0,'Repayable','disbursement','monthly','Unsecured','',0,100000.00,'1',100000.00,'Repayable','12',0.00,0.00),(405,2500000.00,'Home Loan/Renovation','Loan to Joseph Sajan for home construction',0,0,'','','',390,0,'',0,'Repayable','disbursement','monthly','Property','',0,2500000.00,'5',2500000.00,'Repayable','36',0.00,2200000.00),(406,20000.00,'Education','Loan for Gouramma\'s daughters school fees',0,0,'','','',391,0,'',0,'Repayable','closed','one shot','','',0,20000.00,'1',20000.00,'Repayable','10',20000.00,20000.00);
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_disbursement`
--

DROP TABLE IF EXISTS `case_disbursement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_disbursement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` int NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `installment_amt` decimal(10,2) NOT NULL,
  `planned_date` date DEFAULT NULL,
  `disbursed_date` date DEFAULT NULL,
  `disbursed_amt` decimal(10,2) NOT NULL,
  `remaining_amt` decimal(10,2) NOT NULL,
  `tot_disbursed_amt` decimal(10,2) NOT NULL,
  `disbursement_status` varchar(50) DEFAULT NULL,
  `case_id` bigint NOT NULL,
  `disbursement_txn_info` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `case_disbursement_case_id_0df61ecf_fk_case_id` (`case_id`),
  CONSTRAINT `case_disbursement_case_id_0df61ecf_fk_case_id` FOREIGN KEY (`case_id`) REFERENCES `case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=784 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_disbursement`
--

LOCK TABLES `case_disbursement` WRITE;
/*!40000 ALTER TABLE `case_disbursement` DISABLE KEYS */;
INSERT INTO `case_disbursement` VALUES (681,2,'2024-07-19 08:54:26.334475',0,'2024-07-19 12:37:19.404599',23423.40,'2024-07-17','2024-07-27',2563.00,230671.00,3563.00,'Disbursed',394,''),(682,2,'2024-07-19 08:54:26.342830',0,'2024-07-19 08:54:26.342876',23423.40,'2024-10-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(683,2,'2024-07-19 08:54:26.350899',0,'2024-07-19 08:54:26.350944',23423.40,'2025-01-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(684,2,'2024-07-19 08:54:26.380267',0,'2024-07-19 08:54:26.380317',23423.40,'2025-04-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(685,2,'2024-07-19 08:54:26.386511',0,'2024-07-19 08:54:56.746378',23423.40,'2025-07-17','2024-07-10',1000.00,233234.00,1000.00,'Disbursed',394,'werwer'),(686,2,'2024-07-19 08:54:26.398867',0,'2024-07-19 08:54:26.398918',23423.40,'2025-10-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(687,2,'2024-07-19 08:54:26.411275',0,'2024-07-19 08:54:26.411324',23423.40,'2026-01-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(688,2,'2024-07-19 08:54:26.417978',0,'2024-07-19 08:54:26.418025',23423.40,'2026-04-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(689,2,'2024-07-19 08:54:26.424337',0,'2024-07-19 08:54:26.424383',23423.40,'2026-07-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(690,2,'2024-07-19 08:54:26.430470',0,'2024-07-19 08:54:26.430531',23423.40,'2026-10-17',NULL,0.00,0.00,0.00,'pending',394,NULL),(705,337,'2024-07-23 09:58:58.249735',0,'2024-07-23 10:10:58.664166',12500.00,'2023-12-01','2023-12-12',15000.00,285000.00,15000.00,'Disbursed',401,''),(706,337,'2024-07-23 09:58:58.256538',0,'2024-07-23 10:11:18.485947',12500.00,'2024-01-01','2024-01-05',15000.00,270000.00,30000.00,'Disbursed',401,''),(707,337,'2024-07-23 09:58:58.262706',0,'2024-07-23 10:11:33.347691',12500.00,'2024-02-01','2024-02-06',15000.00,255000.00,45000.00,'Disbursed',401,''),(708,337,'2024-07-23 09:58:58.270227',0,'2024-07-23 10:11:48.343336',12500.00,'2024-03-01','2024-03-07',15000.00,240000.00,60000.00,'Disbursed',401,''),(709,337,'2024-07-23 09:58:58.280070',0,'2024-07-23 10:12:03.192797',12500.00,'2024-04-01','2024-04-07',15000.00,225000.00,75000.00,'Disbursed',401,''),(710,337,'2024-07-23 09:58:58.290515',0,'2024-07-23 10:12:16.675184',12500.00,'2024-05-01','2024-05-07',15000.00,210000.00,90000.00,'Disbursed',401,''),(711,337,'2024-07-23 09:58:58.298998',0,'2024-07-23 10:12:31.742426',12500.00,'2024-06-01','2024-06-07',15000.00,195000.00,105000.00,'Disbursed',401,''),(712,337,'2024-07-23 09:58:58.320846',0,'2024-07-23 10:13:01.871138',12500.00,'2024-07-01','2024-07-07',15000.00,180000.00,120000.00,'Disbursed',401,''),(713,337,'2024-07-23 09:58:58.327983',0,'2024-07-23 09:58:58.328030',12500.00,'2024-08-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(714,337,'2024-07-23 09:58:58.335485',0,'2024-07-23 09:58:58.335533',12500.00,'2024-09-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(715,337,'2024-07-23 09:58:58.345162',0,'2024-07-23 09:58:58.345212',12500.00,'2024-10-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(716,337,'2024-07-23 09:58:58.353992',0,'2024-07-23 09:58:58.354042',12500.00,'2024-11-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(717,337,'2024-07-23 09:58:58.366934',0,'2024-07-23 09:58:58.366979',12500.00,'2024-12-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(718,337,'2024-07-23 09:58:58.373578',0,'2024-07-23 09:58:58.373629',12500.00,'2025-01-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(719,337,'2024-07-23 09:58:58.384235',0,'2024-07-23 09:58:58.384283',12500.00,'2025-02-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(720,337,'2024-07-23 09:58:58.391160',0,'2024-07-23 09:58:58.391209',12500.00,'2025-03-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(721,337,'2024-07-23 09:58:58.399621',0,'2024-07-23 09:58:58.399670',12500.00,'2025-04-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(722,337,'2024-07-23 09:58:58.406519',0,'2024-07-23 09:58:58.406570',12500.00,'2025-05-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(723,337,'2024-07-23 09:58:58.414644',0,'2024-07-23 09:58:58.414705',12500.00,'2025-06-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(724,337,'2024-07-23 09:58:58.421521',0,'2024-07-23 09:58:58.421561',12500.00,'2025-07-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(725,337,'2024-07-23 09:58:58.446230',0,'2024-07-23 09:58:58.446285',12500.00,'2025-08-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(726,337,'2024-07-23 09:58:58.454064',0,'2024-07-23 09:58:58.454118',12500.00,'2025-09-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(727,337,'2024-07-23 09:58:58.462568',0,'2024-07-23 09:58:58.462617',12500.00,'2025-10-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(728,337,'2024-07-23 09:58:58.469533',0,'2024-07-23 09:58:58.469599',12500.00,'2025-11-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(729,337,'2024-07-23 09:58:59.407520',0,'2024-07-23 09:58:59.407564',12500.00,'2023-12-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(730,337,'2024-07-23 09:58:59.415712',0,'2024-07-23 09:58:59.415784',12500.00,'2024-01-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(731,337,'2024-07-23 09:58:59.425908',0,'2024-07-23 09:58:59.425979',12500.00,'2024-02-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(732,337,'2024-07-23 09:58:59.434548',0,'2024-07-23 09:58:59.434592',12500.00,'2024-03-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(733,337,'2024-07-23 09:58:59.445055',0,'2024-07-23 09:58:59.445127',12500.00,'2024-04-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(734,337,'2024-07-23 09:58:59.454633',0,'2024-07-23 09:58:59.454681',12500.00,'2024-05-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(735,337,'2024-07-23 09:58:59.461861',0,'2024-07-23 09:58:59.461912',12500.00,'2024-06-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(736,337,'2024-07-23 09:58:59.468280',0,'2024-07-23 09:58:59.468319',12500.00,'2024-07-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(737,337,'2024-07-23 09:58:59.475041',0,'2024-07-23 09:58:59.475083',12500.00,'2024-08-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(738,337,'2024-07-23 09:58:59.481377',0,'2024-07-23 09:58:59.481416',12500.00,'2024-09-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(739,337,'2024-07-23 09:58:59.489968',0,'2024-07-23 09:58:59.490008',12500.00,'2024-10-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(740,337,'2024-07-23 09:58:59.497227',0,'2024-07-23 09:58:59.497273',12500.00,'2024-11-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(741,337,'2024-07-23 09:58:59.504024',0,'2024-07-23 09:58:59.504068',12500.00,'2024-12-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(742,337,'2024-07-23 09:58:59.519440',0,'2024-07-23 09:58:59.519489',12500.00,'2025-01-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(743,337,'2024-07-23 09:58:59.528894',0,'2024-07-23 09:58:59.528955',12500.00,'2025-02-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(744,337,'2024-07-23 09:58:59.556124',0,'2024-07-23 09:58:59.556172',12500.00,'2025-03-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(745,337,'2024-07-23 09:58:59.571988',0,'2024-07-23 09:58:59.572042',12500.00,'2025-04-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(746,337,'2024-07-23 09:58:59.583457',0,'2024-07-23 09:58:59.583539',12500.00,'2025-05-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(747,337,'2024-07-23 09:58:59.592385',0,'2024-07-23 09:58:59.592433',12500.00,'2025-06-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(748,337,'2024-07-23 09:58:59.609837',0,'2024-07-23 09:58:59.609889',12500.00,'2025-07-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(749,337,'2024-07-23 09:58:59.617299',0,'2024-07-23 09:58:59.617345',12500.00,'2025-08-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(750,337,'2024-07-23 09:58:59.623684',0,'2024-07-23 09:58:59.623722',12500.00,'2025-09-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(751,337,'2024-07-23 09:58:59.631766',0,'2024-07-23 09:58:59.631819',12500.00,'2025-10-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(752,337,'2024-07-23 09:58:59.640608',0,'2024-07-23 09:58:59.640657',12500.00,'2025-11-01',NULL,0.00,0.00,0.00,'pending',401,NULL),(753,337,'2024-07-26 12:33:17.623950',337,'2024-07-26 12:39:10.168425',12000.00,'2025-01-01','2024-01-07',12000.00,276000.00,12000.00,'Disbursed',402,''),(754,337,'2024-07-26 12:33:17.632284',337,'2024-07-26 12:39:56.464114',12000.00,'2025-02-01','2024-02-07',12000.00,264000.00,24000.00,'Disbursed',402,''),(755,337,'2024-07-26 12:33:17.638921',337,'2024-07-26 12:40:17.714870',12000.00,'2025-03-01','2024-03-07',12000.00,252000.00,36000.00,'Disbursed',402,''),(756,337,'2024-07-26 12:33:17.646759',337,'2024-07-26 12:40:30.007645',12000.00,'2025-04-01','2024-04-07',12000.00,240000.00,48000.00,'Disbursed',402,''),(757,337,'2024-07-26 12:33:17.654004',337,'2024-07-26 12:40:56.521361',12000.00,'2025-05-01','2024-05-07',12000.00,228000.00,60000.00,'Disbursed',402,''),(758,337,'2024-07-26 12:33:17.660183',337,'2024-07-26 12:41:05.405465',12000.00,'2025-06-01','2024-06-07',12000.00,216000.00,72000.00,'Disbursed',402,''),(759,337,'2024-07-26 12:33:17.668663',337,'2024-07-26 12:41:17.454485',12000.00,'2025-07-01','2024-07-07',12000.00,204000.00,84000.00,'Disbursed',402,''),(760,337,'2024-07-26 12:33:17.677632',337,'2024-07-26 12:37:19.682616',12000.00,'2025-08-01',NULL,0.00,0.00,0.00,'pending',402,''),(761,337,'2024-07-26 12:33:17.685486',337,'2024-07-26 12:37:19.692095',12000.00,'2025-09-01',NULL,0.00,0.00,0.00,'pending',402,''),(762,337,'2024-07-26 12:33:17.700340',337,'2024-07-26 12:37:19.707186',12000.00,'2025-10-01',NULL,0.00,0.00,0.00,'pending',402,''),(763,337,'2024-07-26 12:33:17.707059',337,'2024-07-26 12:37:19.716362',12000.00,'2025-11-01',NULL,0.00,0.00,0.00,'pending',402,''),(764,337,'2024-07-26 12:33:17.713143',337,'2024-07-26 12:37:19.727377',12000.00,'2025-12-01',NULL,0.00,0.00,0.00,'pending',402,''),(765,337,'2024-07-26 12:33:17.726364',337,'2024-07-26 12:37:19.736066',12000.00,'2026-01-01',NULL,0.00,0.00,0.00,'pending',402,''),(766,337,'2024-07-26 12:33:17.733197',337,'2024-07-26 12:37:19.744392',12000.00,'2026-02-01',NULL,0.00,0.00,0.00,'pending',402,''),(767,337,'2024-07-26 12:33:17.739511',337,'2024-07-26 12:37:19.754539',12000.00,'2026-03-01',NULL,0.00,0.00,0.00,'pending',402,''),(768,337,'2024-07-26 12:33:17.744898',337,'2024-07-26 12:37:19.765533',12000.00,'2026-04-01',NULL,0.00,0.00,0.00,'pending',402,''),(769,337,'2024-07-26 12:33:17.751399',337,'2024-07-26 12:37:19.780459',12000.00,'2026-05-01',NULL,0.00,0.00,0.00,'pending',402,''),(770,337,'2024-07-26 12:33:17.757241',337,'2024-07-26 12:37:19.788845',12000.00,'2026-06-01',NULL,0.00,0.00,0.00,'pending',402,''),(771,337,'2024-07-26 12:33:17.764525',337,'2024-07-26 12:37:19.802150',12000.00,'2026-07-01',NULL,0.00,0.00,0.00,'pending',402,''),(772,337,'2024-07-26 12:33:17.781935',337,'2024-07-26 12:37:19.811065',12000.00,'2026-08-01',NULL,0.00,0.00,0.00,'pending',402,''),(773,337,'2024-07-26 12:33:17.791167',337,'2024-07-26 12:37:19.820777',12000.00,'2026-09-01',NULL,0.00,0.00,0.00,'pending',402,''),(774,337,'2024-07-26 12:33:17.796940',337,'2024-07-26 12:37:19.837042',12000.00,'2026-10-01',NULL,0.00,0.00,0.00,'pending',402,''),(775,337,'2024-07-26 12:33:17.809745',337,'2024-07-26 12:37:19.866429',12000.00,'2026-11-01',NULL,0.00,0.00,0.00,'pending',402,''),(776,337,'2024-07-26 12:33:17.816020',337,'2024-07-26 12:37:19.909326',12000.00,'2026-12-01',NULL,0.00,0.00,0.00,'pending',402,''),(777,337,'2024-07-28 15:31:06.594440',337,'2024-07-28 15:33:11.646183',100000.00,'2024-07-28',NULL,0.00,0.00,0.00,'pending',403,''),(778,337,'2024-10-19 08:55:38.641956',0,'2024-10-19 08:58:28.724971',500000.00,'2024-06-28','2024-06-28',500000.00,2000000.00,500000.00,'Disbursed',405,''),(779,337,'2024-10-19 08:55:38.648694',0,'2024-10-19 08:59:24.329922',500000.00,'2024-07-28','2024-08-01',500000.00,1500000.00,1000000.00,'Disbursed',405,''),(780,337,'2024-10-19 08:55:38.654393',0,'2024-10-19 09:00:01.983411',500000.00,'2024-08-28','2024-09-02',500000.00,1000000.00,1500000.00,'Disbursed',405,''),(781,337,'2024-10-19 08:55:38.665940',0,'2024-10-19 09:00:35.623889',500000.00,'2024-09-28','2024-10-07',700000.00,300000.00,2200000.00,'Disbursed',405,''),(782,337,'2024-10-19 08:55:38.672307',0,'2024-10-19 08:55:38.672348',500000.00,'2024-10-28',NULL,0.00,0.00,0.00,'pending',405,NULL),(783,337,'2024-10-19 09:10:08.806555',0,'2024-10-19 09:13:08.452386',20000.00,'2024-01-20','2024-01-24',20000.00,0.00,20000.00,'Disbursed',406,'');
/*!40000 ALTER TABLE `case_disbursement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_evaluation`
--

DROP TABLE IF EXISTS `case_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_evaluation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_type` varchar(20) NOT NULL,
  `approver_decision` longtext,
  `evaluation_status` varchar(50) DEFAULT NULL,
  `latest_action_date` datetime(6) NOT NULL,
  `case_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `evaluator_notes` longtext,
  `evaluator_rating` longtext,
  PRIMARY KEY (`id`),
  KEY `case_evaluation_case_id_f501941e_fk_case_id` (`case_id`),
  KEY `case_evaluation_user_id_de1a2ec6_fk_user_customuser_id` (`user_id`),
  CONSTRAINT `case_evaluation_case_id_f501941e_fk_case_id` FOREIGN KEY (`case_id`) REFERENCES `case` (`id`),
  CONSTRAINT `case_evaluation_user_id_de1a2ec6_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_evaluation`
--

LOCK TABLES `case_evaluation` WRITE;
/*!40000 ALTER TABLE `case_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_fileupload`
--

DROP TABLE IF EXISTS `case_fileupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_fileupload` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_fileupload`
--

LOCK TABLES `case_fileupload` WRITE;
/*!40000 ALTER TABLE `case_fileupload` DISABLE KEYS */;
INSERT INTO `case_fileupload` VALUES (283,'purpose/image_2.png'),(284,'purpose/React_Native_-_Test_2.pdf'),(285,'purpose/vector-icon-case-study-on-600nw-1395648677_1.jpg'),(286,'purpose/image_2_gPGm4m2.png'),(287,'purpose/vector-icon-case-study-on-600nw-1395648677_1_Q1P10eV.jpg'),(288,'purpose/image_2_yatGkEW.png'),(289,'purpose/pic_1.jpg'),(290,'purpose/pic2.jpg'),(291,'purpose/pic2_eTceN7M.jpg'),(292,'purpose/pic2_8B6TXkK.jpg'),(293,'purpose/pic2_AkNYz13.jpg'),(294,'purpose/pic2_F6KKhsK.jpg'),(295,'purpose/pic_1_hUjDEEb.jpg'),(296,'purpose/pic_1_bay9tZs.jpg'),(297,'purpose/pic2_2em5lDw.jpg'),(298,'purpose/common_retail_loan__application_form.pdf'),(299,'purpose/Nisha_New_Feb_2024_harvest_time_report.pdf'),(300,'purpose/pic_1_esYVcds.jpg'),(301,'purpose/pic2_4rw8jtt.jpg'),(302,'purpose/Nisha_harvest_time_report_from2024-01-01to2024-01-31.pdf'),(303,'purpose/pic2_ZbVl7bV.jpg'),(304,'purpose/pic_1_xA4n22E.jpg'),(305,'purpose/common_retail_loan__application_form_Ro3TSsd.pdf'),(306,'purpose/Nisha_harvest_time_report_from2024-01-01to2024-01-31_WPt3Jsc.pdf'),(307,'purpose/Nisha_harvest_time_report_from2023-12-01to2023-12-31.pdf'),(308,'purpose/pic2_6CB9TFV.jpg'),(309,'purpose/pic2_7srYEHb.jpg'),(310,'purpose/Nisha_New_Feb_2024_harvest_time_report_A5kNLhv.pdf'),(311,'purpose/common_retail_loan__application_form_39Fa94o.pdf'),(312,'purpose/pic2_WxSKNaT.jpg'),(313,'purpose/pic_1_yXJodg3.jpg'),(314,'purpose/common_retail_loan__application_form_J8CVWca.pdf'),(315,'purpose/pic2_C77lx6S.jpg'),(316,'purpose/pic_1_xTdnDVR.jpg'),(317,'purpose/Nisha_harvest_time_report_from2024-01-01to2024-01-31_CyzmBW7.pdf'),(318,'purpose/pic2_gqVqY6t.jpg'),(319,'purpose/Nisha__January_2024_harvest_time_report.pdf'),(320,'purpose/pic_1_uIpp6TA.jpg'),(321,'purpose/Nisha_harvest_time_report_from2023-12-01to2023-12-31_dW0i10S.pdf'),(322,'purpose/Nisha__January_2024_harvest_time_report_mbEhQQS.pdf'),(323,'purpose/Nisha_New_Feb_2024_harvest_time_report_rFVerCd.pdf'),(324,'purpose/pic2_ndJhzpY.jpg'),(325,'purpose/pic2_Fllqn19.jpg'),(326,'purpose/pic2_DO5uyFM.jpg'),(327,'purpose/Nisha_harvest_time_report_from2024-01-01to2024-01-31_fzloL3Q.pdf'),(328,'purpose/sc_03.jpeg'),(329,'purpose/pic_1_r6lbODZ.jpg'),(330,'purpose/IMG_1094.png'),(331,'purpose/46045A4A-BD1F-475F-AE1F-BAFB2C8AF581.jpeg'),(332,'purpose/08941730-24b1-43a6-aefe-dd78ac2860a9.jpeg'),(333,'purpose/images.jpg'),(334,'purpose/kumar-aadhar.jpg'),(335,'purpose/kumar-aadhar_QnOrQPT.jpg'),(336,'purpose/ScreenShot_Tool_-20240218073758.png'),(337,'purpose/download_1.jpeg'),(338,'purpose/pic_1.jpeg');
/*!40000 ALTER TABLE `case_fileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_purpose`
--

DROP TABLE IF EXISTS `case_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_purpose` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purpose_name` varchar(255) DEFAULT NULL,
  `question_text` varchar(255) DEFAULT NULL,
  `answer_text` longtext,
  `created_at` datetime(6) NOT NULL,
  `case_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case_purpose_case_id_9a120147_fk_case_id` (`case_id`),
  CONSTRAINT `case_purpose_case_id_9a120147_fk_case_id` FOREIGN KEY (`case_id`) REFERENCES `case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_purpose`
--

LOCK TABLES `case_purpose` WRITE;
/*!40000 ALTER TABLE `case_purpose` DISABLE KEYS */;
INSERT INTO `case_purpose` VALUES (1284,'Retirement','What was your profession before retirement?','Nurse','2024-07-26 12:28:54.092237',402),(1285,'Retirement','What was your monthly income before retirement?','10000','2024-07-26 12:28:54.099855',402),(1286,'Retirement','If you are a pensioner, mention the monthly pension amount. e.g. 10000','0','2024-07-26 12:28:54.112157',402),(1287,'Retirement','Post retirement total monthly income: e.g. 10000','0','2024-07-26 12:28:54.124293',402),(1288,'Retirement','Are you open to work?','No','2024-07-26 12:28:54.131457',402),(1289,'Retirement','Total no of dependants:','0','2024-07-26 12:28:54.140731',402),(1290,'Retirement','Provide additional information explaining why you need this grant:','NA','2024-07-26 12:28:54.147201',402),(1291,'Home Loan/Renovation','Is this your first home?','Yes','2024-07-28 15:28:49.248309',403),(1292,'Home Loan/Renovation','Nature of expenditure: ','existing_land','2024-07-28 15:28:49.254619',403),(1293,'Home Loan/Renovation','Total expenditure expected(Rs):','1000000','2024-07-28 15:28:49.262547',403),(1294,'Home Loan/Renovation','Current market value of the property:','1000000','2024-07-28 15:28:49.269681',403),(1295,'Home Loan/Renovation','Guidance value of the property:','0','2024-07-28 15:28:49.277721',403),(1302,'Home Loan/Renovation','Is this your first home?','Yes','2024-10-19 08:53:56.795693',405),(1303,'Home Loan/Renovation','Nature of expenditure: ','existing_land','2024-10-19 08:53:56.801168',405),(1304,'Home Loan/Renovation','Total expenditure expected(Rs):','60000000','2024-10-19 08:53:56.808193',405),(1305,'Home Loan/Renovation','Current market value of the property:','60000000','2024-10-19 08:53:56.814541',405),(1306,'Home Loan/Renovation','How much fund do you have for down payment?','0','2024-10-19 08:53:56.820645',405),(1307,'Home Loan/Renovation','Are you going to be experiencing any major life transitions soon (marriage, kids, retirement etc.)','N','2024-10-19 08:53:56.826776',405),(1308,'Home Loan/Renovation','Are you going to be experiencing any major life transitions soon (marriage, kids, retirement etc.)','No','2024-10-19 08:53:56.835631',405),(1309,'Home Loan/Renovation','Are you going to be experiencing any major life transitions soon (marriage, kids, retirement etc.)','No ','2024-10-19 08:53:56.845726',405),(1310,'Education','How did/are you finance your education so far?','[\'self_finance\']','2024-10-19 09:08:26.217109',406),(1311,'Education','Present qualification:','secondary','2024-10-19 09:08:26.226964',406),(1312,'Education','Course applied for: e.g., B.E Computer Science','6','2024-10-19 09:08:26.243110',406),(1313,'Education','Course applied for: e.g., B.E Computer Science','6th standerd','2024-10-19 09:08:26.251380',406),(1314,'Education','Course start date:','2024-01-01','2024-10-19 09:08:26.260013',406),(1315,'Education','Course end date:','2024-12-31','2024-10-19 09:08:26.267642',406);
/*!40000 ALTER TABLE `case_purpose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_query`
--

DROP TABLE IF EXISTS `case_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_query` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` varchar(255) DEFAULT NULL,
  `answer_text` longtext,
  `supp_docs_list` longtext,
  `question_by` varchar(255) DEFAULT NULL,
  `answer_by` varchar(255) DEFAULT NULL,
  `question_time` datetime(6) NOT NULL,
  `answer_time` datetime(6) NOT NULL,
  `state` varchar(20) NOT NULL,
  `case_id` bigint NOT NULL,
  `answer_by_userid` int NOT NULL,
  `question_by_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case_query_case_id_8615c898_fk_case_id` (`case_id`),
  CONSTRAINT `case_query_case_id_8615c898_fk_case_id` FOREIGN KEY (`case_id`) REFERENCES `case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_query`
--

LOCK TABLES `case_query` WRITE;
/*!40000 ALTER TABLE `case_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_repayment`
--

DROP TABLE IF EXISTS `case_repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_repayment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` int NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `planned_repayment_amt` decimal(10,2) NOT NULL,
  `planned_date` date DEFAULT NULL,
  `repayment_date` date DEFAULT NULL,
  `actual_repayment_amt` decimal(10,2) NOT NULL,
  `repayment_txn_info` varchar(80) DEFAULT NULL,
  `outstanding_amt` decimal(10,2) NOT NULL,
  `tot_repayed_amt` decimal(10,2) NOT NULL,
  `repayment_status` varchar(50) DEFAULT NULL,
  `case_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case_repayment_case_id_abdba0e4_fk_case_id` (`case_id`),
  CONSTRAINT `case_repayment_case_id_abdba0e4_fk_case_id` FOREIGN KEY (`case_id`) REFERENCES `case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_repayment`
--

LOCK TABLES `case_repayment` WRITE;
/*!40000 ALTER TABLE `case_repayment` DISABLE KEYS */;
INSERT INTO `case_repayment` VALUES (527,0,'2024-07-19 08:54:40.444631',0,'2024-07-19 14:27:09.900035',46846.80,'2024-07-10','2024-07-26',46846.00,'',-43283.00,46846.00,'Paid',394),(528,0,'2024-07-19 08:54:40.456703',0,'2024-07-19 14:27:21.595976',46846.80,'2024-08-10','2024-07-31',67859.00,'',-111142.00,114705.00,'Paid',394),(529,0,'2024-07-19 08:54:40.466192',0,'2024-07-19 08:54:40.466241',46846.80,'2024-09-10',NULL,0.00,NULL,0.00,0.00,'pending',394),(530,0,'2024-07-19 08:54:40.482683',0,'2024-07-19 08:54:40.482735',46846.80,'2024-10-10',NULL,0.00,NULL,0.00,0.00,'pending',394),(531,0,'2024-07-19 08:54:40.492401',0,'2024-07-19 08:54:40.492448',46846.80,'2024-11-10',NULL,0.00,NULL,0.00,0.00,'pending',394),(545,0,'2024-07-28 15:33:40.140981',0,'2024-07-28 15:33:40.141041',8333.33,'2025-01-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(546,0,'2024-07-28 15:33:40.147943',0,'2024-07-28 15:33:40.147991',8333.33,'2025-02-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(547,0,'2024-07-28 15:33:40.155527',0,'2024-07-28 15:33:40.155576',8333.33,'2025-03-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(548,0,'2024-07-28 15:33:40.162410',0,'2024-07-28 15:33:40.162455',8333.33,'2025-04-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(549,0,'2024-07-28 15:33:40.168640',0,'2024-07-28 15:33:40.168683',8333.33,'2025-05-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(550,0,'2024-07-28 15:33:40.174831',0,'2024-07-28 15:33:40.174897',8333.33,'2025-06-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(551,0,'2024-07-28 15:33:40.182499',0,'2024-07-28 15:33:40.182541',8333.33,'2025-07-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(552,0,'2024-07-28 15:33:40.188921',0,'2024-07-28 15:33:40.188971',8333.33,'2025-08-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(553,0,'2024-07-28 15:33:40.194668',0,'2024-07-28 15:33:40.194733',8333.33,'2025-09-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(554,0,'2024-07-28 15:33:40.202267',0,'2024-07-28 15:33:40.202307',8333.33,'2025-10-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(555,0,'2024-07-28 15:33:40.208326',0,'2024-07-28 15:33:40.208365',8333.33,'2025-11-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(556,0,'2024-07-28 15:33:40.214382',0,'2024-07-28 15:33:40.214420',8333.33,'2025-12-01',NULL,0.00,NULL,0.00,0.00,'pending',403),(557,0,'2024-10-19 08:56:52.108069',0,'2024-10-19 08:56:52.108129',69444.44,'2024-12-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(558,0,'2024-10-19 08:56:52.115513',0,'2024-10-19 08:56:52.115556',69444.44,'2025-01-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(559,0,'2024-10-19 08:56:52.120941',0,'2024-10-19 08:56:52.120983',69444.44,'2025-02-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(560,0,'2024-10-19 08:56:52.127571',0,'2024-10-19 08:56:52.127612',69444.44,'2025-03-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(561,0,'2024-10-19 08:56:52.135876',0,'2024-10-19 08:56:52.135919',69444.44,'2025-04-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(562,0,'2024-10-19 08:56:52.143012',0,'2024-10-19 08:56:52.143055',69444.44,'2025-05-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(563,0,'2024-10-19 08:56:52.148829',0,'2024-10-19 08:56:52.148877',69444.44,'2025-06-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(564,0,'2024-10-19 08:56:52.156764',0,'2024-10-19 08:56:52.156833',69444.44,'2025-07-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(565,0,'2024-10-19 08:56:52.162838',0,'2024-10-19 08:56:52.162875',69441.44,'2025-08-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(566,0,'2024-10-19 08:56:52.169829',0,'2024-10-19 08:56:52.169872',69444.44,'2025-09-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(567,0,'2024-10-19 08:56:52.175409',0,'2024-10-19 08:56:52.175448',69444.44,'2025-10-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(568,0,'2024-10-19 08:56:52.182258',0,'2024-10-19 08:56:52.182296',69444.44,'2025-11-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(569,0,'2024-10-19 08:56:52.188038',0,'2024-10-19 08:56:52.188076',69444.44,'2025-12-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(570,0,'2024-10-19 08:56:52.194115',0,'2024-10-19 08:56:52.194154',69444.44,'2026-01-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(571,0,'2024-10-19 08:56:52.200111',0,'2024-10-19 08:56:52.200146',69444.44,'2026-02-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(572,0,'2024-10-19 08:56:52.210635',0,'2024-10-19 08:56:52.210670',69444.44,'2026-03-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(573,0,'2024-10-19 08:56:52.217078',0,'2024-10-19 08:56:52.217113',69444.44,'2026-04-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(574,0,'2024-10-19 08:56:52.222754',0,'2024-10-19 08:56:52.222809',69444.44,'2026-05-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(575,0,'2024-10-19 08:56:52.228053',0,'2024-10-19 08:56:52.228087',69444.44,'2026-06-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(576,0,'2024-10-19 08:56:52.233042',0,'2024-10-19 08:56:52.233075',69444.44,'2026-07-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(577,0,'2024-10-19 08:56:52.238223',0,'2024-10-19 08:56:52.238256',69444.44,'2026-08-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(578,0,'2024-10-19 08:56:52.258742',0,'2024-10-19 08:56:52.258825',69444.44,'2026-09-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(579,0,'2024-10-19 08:56:52.265878',0,'2024-10-19 08:56:52.265920',69444.44,'2026-10-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(580,0,'2024-10-19 08:56:52.271722',0,'2024-10-19 08:56:52.271765',69444.44,'2026-11-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(581,0,'2024-10-19 08:56:52.278081',0,'2024-10-19 08:56:52.278119',69444.44,'2026-12-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(582,0,'2024-10-19 08:56:52.284128',0,'2024-10-19 08:56:52.284168',69444.44,'2027-01-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(583,0,'2024-10-19 08:56:52.290239',0,'2024-10-19 08:56:52.290277',69444.44,'2027-02-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(584,0,'2024-10-19 08:56:52.298476',0,'2024-10-19 08:56:52.298516',69444.44,'2027-03-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(585,0,'2024-10-19 08:56:52.303882',0,'2024-10-19 08:56:52.303920',69444.44,'2027-04-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(586,0,'2024-10-19 08:56:52.311826',0,'2024-10-19 08:56:52.311884',69444.44,'2027-05-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(587,0,'2024-10-19 08:56:52.318015',0,'2024-10-19 08:56:52.318057',69444.44,'2027-06-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(588,0,'2024-10-19 08:56:52.323729',0,'2024-10-19 08:56:52.323800',69444.44,'2027-07-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(589,0,'2024-10-19 08:56:52.330241',0,'2024-10-19 08:56:52.330285',69444.44,'2027-08-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(590,0,'2024-10-19 08:56:52.335108',0,'2024-10-19 08:56:52.335144',69444.44,'2027-09-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(591,0,'2024-10-19 08:56:52.341402',0,'2024-10-19 08:56:52.341435',69444.44,'2027-10-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(592,0,'2024-10-19 08:56:52.347114',0,'2024-10-19 08:56:52.347155',69444.44,'2027-11-10',NULL,0.00,NULL,0.00,0.00,'pending',405),(593,0,'2024-10-19 09:12:22.630974',0,'2024-10-19 09:13:42.949998',2000.00,'2024-02-01','2024-02-04',2000.00,'',18000.00,2000.00,'Paid',406),(594,0,'2024-10-19 09:12:22.637512',0,'2024-10-19 09:14:08.194914',2000.00,'2024-03-01','2024-03-04',2000.00,'',16000.00,4000.00,'Paid',406),(595,0,'2024-10-19 09:12:22.642940',0,'2024-10-19 09:12:22.642980',2000.00,'2024-04-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(596,0,'2024-10-19 09:12:22.649671',0,'2024-10-19 09:12:22.649711',2000.00,'2024-05-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(597,0,'2024-10-19 09:12:22.655193',0,'2024-10-19 09:15:34.406007',2000.00,'2024-06-01','2024-06-03',1000.00,'',15000.00,5000.00,'Paid',406),(598,0,'2024-10-19 09:12:22.662401',0,'2024-10-19 09:16:23.380053',2000.00,'2024-07-01','2024-07-08',3000.00,'',12000.00,8000.00,'Paid',406),(599,0,'2024-10-19 09:12:22.668181',0,'2024-10-19 09:17:01.532325',2000.00,'2024-08-01','2024-08-05',3000.00,'',9000.00,11000.00,'Paid',406),(600,0,'2024-10-19 09:12:22.690746',0,'2024-10-19 09:20:26.295773',2000.00,'2024-09-01','2024-09-02',3000.00,'',6000.00,14000.00,'Paid',406),(601,0,'2024-10-19 09:12:22.697404',0,'2024-10-19 09:21:17.109346',2000.00,'2024-10-01','2024-10-01',6000.00,'',0.00,20000.00,'Paid',406),(602,0,'2024-10-19 09:12:22.704573',0,'2024-10-19 09:12:22.704607',2000.00,'2024-11-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(603,0,'2024-10-19 09:12:22.751652',0,'2024-10-19 09:12:22.751696',2000.00,'2024-02-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(604,0,'2024-10-19 09:12:22.757895',0,'2024-10-19 09:12:22.757934',2000.00,'2024-03-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(605,0,'2024-10-19 09:12:22.765559',0,'2024-10-19 09:12:22.765598',2000.00,'2024-04-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(606,0,'2024-10-19 09:12:22.772675',0,'2024-10-19 09:12:22.772714',2000.00,'2024-05-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(607,0,'2024-10-19 09:12:22.779180',0,'2024-10-19 09:12:22.779218',2000.00,'2024-06-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(608,0,'2024-10-19 09:12:22.784206',0,'2024-10-19 09:12:22.784241',2000.00,'2024-07-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(609,0,'2024-10-19 09:12:22.791929',0,'2024-10-19 09:12:22.791997',2000.00,'2024-08-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(610,0,'2024-10-19 09:12:22.800755',0,'2024-10-19 09:12:22.800815',2000.00,'2024-09-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(611,0,'2024-10-19 09:12:22.808553',0,'2024-10-19 09:12:22.808588',2000.00,'2024-10-01',NULL,0.00,NULL,0.00,0.00,'pending',406),(612,0,'2024-10-19 09:12:22.816622',0,'2024-10-19 09:12:22.816661',2000.00,'2024-11-01',NULL,0.00,NULL,0.00,0.00,'pending',406);
/*!40000 ALTER TABLE `case_repayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-25 04:06:35.643935','1','Okirana',1,'[{\"added\": {}}]',8,1),(2,'2024-04-25 04:06:48.885783','2','arvind.singh@okirana.com',1,'[{\"added\": {}}]',10,1),(3,'2024-04-25 05:32:37.377563','1','CaseQuery object (1)',1,'[{\"added\": {}}]',15,1),(4,'2024-04-30 03:28:13.951474','1','Location object (1)',3,'',9,1),(5,'2024-04-30 03:28:20.240496','2','Location object (2)',3,'',9,1),(6,'2024-04-30 12:22:49.457385','40','LovSeedData object (40)',2,'[{\"changed\": {\"fields\": [\"Lov parent code\", \"Input type\", \"Mandatory\"]}}]',16,1),(7,'2024-04-30 12:23:14.197614','41','LovSeedData object (41)',2,'[{\"changed\": {\"fields\": [\"Lov parent code\", \"Input type\", \"Mandatory\"]}}]',16,1),(8,'2024-04-30 12:23:34.178208','39','LovSeedData object (39)',2,'[{\"changed\": {\"fields\": [\"Lov parent code\", \"Input type\", \"Mandatory\"]}}]',16,1),(9,'2024-04-30 12:24:22.917631','38','LovSeedData object (38)',2,'[{\"changed\": {\"fields\": [\"Lov parent code\", \"Lov code\", \"Input type\", \"Mandatory\"]}}]',16,1),(10,'2024-04-30 12:24:50.998600','37','LovSeedData object (37)',2,'[{\"changed\": {\"fields\": [\"Lov parent code\", \"Input type\", \"Mandatory\"]}}]',16,1),(11,'2024-04-30 12:25:05.770552','36','LovSeedData object (36)',2,'[{\"changed\": {\"fields\": [\"Lov parent code\", \"Input type\", \"Mandatory\"]}}]',16,1),(12,'2024-05-01 04:34:17.468531','3','mohit.raj@okirana.com',2,'[{\"changed\": {\"fields\": [\"Email\", \"Default account\"]}}]',10,1),(13,'2024-05-01 04:49:53.123150','2','Case object (2)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(14,'2024-05-01 08:04:35.899579','40','nisharangan@gmail.com',1,'[{\"added\": {}}]',10,1),(15,'2024-05-01 16:00:22.183974','33','Case object (33)',3,'',13,1),(16,'2024-05-01 16:00:22.193477','32','Case object (32)',3,'',13,1),(17,'2024-05-01 16:00:22.202590','31','Case object (31)',3,'',13,1),(18,'2024-05-01 16:00:22.208562','30','Case object (30)',3,'',13,1),(19,'2024-05-01 16:00:22.216333','29','Case object (29)',3,'',13,1),(20,'2024-05-01 16:00:22.228507','28','Case object (28)',3,'',13,1),(21,'2024-05-01 16:00:22.235828','27','Case object (27)',3,'',13,1),(22,'2024-05-01 16:00:22.240773','26','Case object (26)',3,'',13,1),(23,'2024-05-01 16:00:22.245819','25','Case object (25)',3,'',13,1),(24,'2024-05-01 16:00:22.252058','24','Case object (24)',3,'',13,1),(25,'2024-05-01 16:00:22.260405','23','Case object (23)',3,'',13,1),(26,'2024-05-01 16:00:22.267960','22','Case object (22)',3,'',13,1),(27,'2024-05-01 16:00:22.283596','21','Case object (21)',3,'',13,1),(28,'2024-05-01 16:00:22.289639','20','Case object (20)',3,'',13,1),(29,'2024-05-01 16:00:22.297838','19','Case object (19)',3,'',13,1),(30,'2024-05-01 16:00:22.305073','18','Case object (18)',3,'',13,1),(31,'2024-05-01 16:00:22.311732','17','Case object (17)',3,'',13,1),(32,'2024-05-01 16:00:22.316879','16','Case object (16)',3,'',13,1),(33,'2024-05-01 16:00:22.321495','15','Case object (15)',3,'',13,1),(34,'2024-05-01 16:00:22.326398','14','Case object (14)',3,'',13,1),(35,'2024-05-01 16:00:22.334659','13','Case object (13)',3,'',13,1),(36,'2024-05-01 16:00:22.342221','12','Case object (12)',3,'',13,1),(37,'2024-05-01 16:00:22.350140','11','Case object (11)',3,'',13,1),(38,'2024-05-01 16:00:22.355958','10','Case object (10)',3,'',13,1),(39,'2024-05-01 16:00:22.361045','9','Case object (9)',3,'',13,1),(40,'2024-05-01 16:00:22.367732','8','Case object (8)',3,'',13,1),(41,'2024-05-01 16:00:22.371824','7','Case object (7)',3,'',13,1),(42,'2024-05-01 16:00:22.383852','6','Case object (6)',3,'',13,1),(43,'2024-05-01 16:00:22.399155','5','Case object (5)',3,'',13,1),(44,'2024-05-01 16:00:22.404333','4','Case object (4)',3,'',13,1),(45,'2024-05-01 16:01:45.269074','48','Location object (48)',3,'',9,1),(46,'2024-05-01 16:01:45.277459','47','Location object (47)',3,'',9,1),(47,'2024-05-01 16:01:45.285579','46','Location object (46)',3,'',9,1),(48,'2024-05-01 16:01:45.294569','44','Location object (44)',3,'',9,1),(49,'2024-05-01 16:01:45.301094','43','Location object (43)',3,'',9,1),(50,'2024-05-01 16:01:45.306395','42','Location object (42)',3,'',9,1),(51,'2024-05-01 16:01:45.312266','41','Location object (41)',3,'',9,1),(52,'2024-05-01 16:01:45.318947','40','Location object (40)',3,'',9,1),(53,'2024-05-01 16:01:45.325587','39','Location object (39)',3,'',9,1),(54,'2024-05-01 16:01:45.331523','38','Location object (38)',3,'',9,1),(55,'2024-05-01 16:01:45.336825','37','Location object (37)',3,'',9,1),(56,'2024-05-01 16:01:45.341945','36','Location object (36)',3,'',9,1),(57,'2024-05-01 16:01:45.349739','35','Location object (35)',3,'',9,1),(58,'2024-05-01 16:01:45.359778','34','Location object (34)',3,'',9,1),(59,'2024-05-01 16:01:45.367116','33','Location object (33)',3,'',9,1),(60,'2024-05-01 16:01:45.372828','32','Location object (32)',3,'',9,1),(61,'2024-05-01 16:01:45.384743','31','Location object (31)',3,'',9,1),(62,'2024-05-01 16:01:45.391459','30','Location object (30)',3,'',9,1),(63,'2024-05-01 16:01:45.398952','29','Location object (29)',3,'',9,1),(64,'2024-05-01 16:01:45.405257','28','Location object (28)',3,'',9,1),(65,'2024-05-01 16:01:45.411375','27','Location object (27)',3,'',9,1),(66,'2024-05-01 16:01:45.422224','26','Location object (26)',3,'',9,1),(67,'2024-05-01 16:01:45.430278','25','Location object (25)',3,'',9,1),(68,'2024-05-01 16:01:45.437417','24','Location object (24)',3,'',9,1),(69,'2024-05-01 16:01:45.444401','23','Location object (23)',3,'',9,1),(70,'2024-05-01 16:01:45.452889','22','Location object (22)',3,'',9,1),(71,'2024-05-01 16:01:45.465802','21','Location object (21)',3,'',9,1),(72,'2024-05-01 16:01:45.473572','20','Location object (20)',3,'',9,1),(73,'2024-05-01 16:01:45.481048','19','Location object (19)',3,'',9,1),(74,'2024-05-01 16:01:45.490055','18','Location object (18)',3,'',9,1),(75,'2024-05-01 16:01:45.495609','17','Location object (17)',3,'',9,1),(76,'2024-05-01 16:01:45.517787','16','Location object (16)',3,'',9,1),(77,'2024-05-01 16:01:45.525546','15','Location object (15)',3,'',9,1),(78,'2024-05-01 16:01:45.536479','12','Location object (12)',3,'',9,1),(79,'2024-05-01 16:01:45.547176','11','Location object (11)',3,'',9,1),(80,'2024-05-01 16:01:45.554342','10','Location object (10)',3,'',9,1),(81,'2024-05-01 16:01:45.559552','9','Location object (9)',3,'',9,1),(82,'2024-05-01 16:01:45.565360','8','Location object (8)',3,'',9,1),(83,'2024-05-01 16:01:45.574831','7','Location object (7)',3,'',9,1),(84,'2024-05-02 04:45:30.576873','1','Case object (1)',2,'[{\"changed\": {\"fields\": [\"Grant type\", \"Collateral\"]}}]',13,1),(85,'2024-05-02 04:45:44.465874','2','Case object (2)',2,'[{\"changed\": {\"fields\": [\"Grant type\", \"Collateral\"]}}]',13,1),(86,'2024-05-02 04:46:02.723567','3','Case object (3)',2,'[{\"changed\": {\"fields\": [\"Grant type\", \"Collateral\"]}}]',13,1),(87,'2024-05-02 04:46:09.641189','34','Case object (34)',2,'[]',13,1),(88,'2024-05-02 04:51:16.358085','34','Case object (34)',2,'[{\"changed\": {\"fields\": [\"Short description\", \"Guarantor phone\", \"Guarantor email\"]}}]',13,1),(89,'2024-05-02 04:52:11.845360','90','fseesssdsdfsffg@dfgcvb.com',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\", \"[Nature of Occupation:]\", \"Profession\", \"Default account\"]}}]',10,1),(90,'2024-05-02 04:56:36.379897','34','Case object (34)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(91,'2024-05-02 04:56:44.480227','3','Case object (3)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(92,'2024-05-02 04:56:52.014771','2','Case object (2)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(93,'2024-05-02 04:56:58.003119','1','Case object (1)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(94,'2024-05-02 04:58:18.237554','34','Case object (34)',2,'[{\"changed\": {\"fields\": [\"Purpose\"]}}]',13,1),(95,'2024-05-02 07:01:17.914093','39','Case object (39)',3,'',13,1),(96,'2024-05-02 07:01:17.924648','38','Case object (38)',3,'',13,1),(97,'2024-05-02 07:01:17.932599','37','Case object (37)',3,'',13,1),(98,'2024-05-02 07:01:17.942521','36','Case object (36)',3,'',13,1),(99,'2024-05-02 07:01:17.950912','35','Case object (35)',3,'',13,1),(100,'2024-05-02 07:15:53.193489','1','Case object (1)',2,'[{\"changed\": {\"fields\": [\"Guarantor name\", \"Referred by\", \"Disbursement schedule\"]}}]',13,1),(101,'2024-05-02 07:16:12.267247','2','Case object (2)',2,'[{\"changed\": {\"fields\": [\"Guarantor name\", \"Referred by\", \"Disbursement schedule\"]}}]',13,1),(102,'2024-05-02 07:16:35.381416','3','Case object (3)',2,'[{\"changed\": {\"fields\": [\"Guarantor name\", \"Referred by\", \"Disbursement schedule\"]}}]',13,1),(103,'2024-05-02 07:16:51.769640','34','Case object (34)',2,'[{\"changed\": {\"fields\": [\"Guarantor name\", \"Referred by\", \"Disbursement schedule\"]}}]',13,1),(104,'2024-05-02 07:17:19.950347','40','Case object (40)',2,'[{\"changed\": {\"fields\": [\"Purpose\", \"Guarantor name\", \"Referred by\", \"Disbursement schedule\"]}}]',13,1),(105,'2024-05-02 07:33:23.593405','1','Case object (1)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(106,'2024-05-02 07:33:32.221532','2','Case object (2)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(107,'2024-05-02 07:35:19.966822','1','Case object (1)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(108,'2024-05-02 07:35:26.141000','41','Case object (41)',3,'',13,1),(109,'2024-05-02 07:37:12.997296','40','Case object (40)',2,'[{\"changed\": {\"fields\": [\"Benefactor user id\", \"Coapplicant user id\"]}}]',13,1),(110,'2024-05-02 07:37:49.125509','34','Case object (34)',2,'[{\"changed\": {\"fields\": [\"Benefactor user id\", \"Coapplicant user id\"]}}]',13,1),(111,'2024-05-02 07:38:06.717156','3','Case object (3)',2,'[{\"changed\": {\"fields\": [\"Benefactor user id\"]}}]',13,1),(112,'2024-05-02 08:01:52.959907','43','Case object (43)',3,'',13,1),(113,'2024-05-02 08:03:02.384259','42','Case object (42)',2,'[{\"changed\": {\"fields\": [\"Benefactor user id\", \"Coapplicant user id\"]}}]',13,1),(114,'2024-05-02 08:03:38.650916','42','Case object (42)',3,'',13,1),(115,'2024-05-02 09:39:41.731359','134','rohan2@gmail.com',2,'[{\"changed\": {\"fields\": [\"Password\", \"Default account\"]}}]',10,1),(116,'2024-05-02 09:39:52.939973','134','rohan2@gmail.com',2,'[]',10,1),(117,'2024-05-02 09:41:19.470936','134','rohan2@gmail.com',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(118,'2024-05-06 16:33:43.745507','51','Case object (51)',2,'[]',13,1),(119,'2024-05-09 05:43:29.841750','56','Case object (56)',2,'[{\"changed\": {\"fields\": [\"Purpose\"]}}]',13,1),(120,'2024-05-09 12:10:18.173360','171','vivinsharma@email.com',1,'[{\"added\": {}}]',10,1),(121,'2024-05-09 13:20:48.148270','57','Case object (57)',2,'[]',13,1),(122,'2024-05-14 08:25:57.541231','9','CaseDisbursement object (9)',1,'[{\"added\": {}}]',22,1),(123,'2024-05-14 08:26:32.080461','9','CaseDisbursement object (9)',2,'[{\"changed\": {\"fields\": [\"Disbursement txn info\"]}}]',22,1),(124,'2024-05-14 08:27:40.371552','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(125,'2024-05-14 10:05:31.452983','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Disbursement count\"]}}]',13,1),(126,'2024-05-14 10:50:48.330632','10','CaseDisbursement object (10)',1,'[{\"added\": {}}]',22,1),(127,'2024-05-14 11:16:19.882193','9','CaseDisbursement object (9)',2,'[]',22,1),(128,'2024-05-15 07:57:58.890304','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Disbursement count\"]}}]',13,1),(129,'2024-05-15 11:36:35.188240','6','CaseRepayment object (6)',1,'[{\"added\": {}}]',23,1),(130,'2024-05-15 11:37:28.592376','7','CaseRepayment object (7)',1,'[{\"added\": {}}]',23,1),(131,'2024-05-15 11:38:11.455585','8','CaseRepayment object (8)',1,'[{\"added\": {}}]',23,1),(132,'2024-05-16 10:27:30.703009','142','Location object (142)',2,'[{\"changed\": {\"fields\": [\"User id\"]}}]',9,1),(133,'2024-05-16 10:37:08.710236','141','Location object (141)',2,'[{\"changed\": {\"fields\": [\"Address type\"]}}]',9,1),(134,'2024-05-16 10:44:11.947524','171','Location object (171)',3,'',9,1),(135,'2024-05-16 10:44:11.957781','170','Location object (170)',3,'',9,1),(136,'2024-05-16 10:52:57.463860','168','Location object (168)',3,'',9,1),(137,'2024-05-16 10:52:57.474241','142','Location object (142)',3,'',9,1),(138,'2024-05-16 10:53:16.391885','141','Location object (141)',2,'[{\"changed\": {\"fields\": [\"Address type\"]}}]',9,1),(139,'2024-05-16 10:53:50.722055','139','Location object (139)',3,'',9,1),(140,'2024-05-16 10:54:22.070259','4','Location object (4)',2,'[{\"changed\": {\"fields\": [\"Address type\"]}}]',9,1),(141,'2024-05-16 10:54:41.001902','5','Location object (5)',2,'[{\"changed\": {\"fields\": [\"Address type\"]}}]',9,1),(142,'2024-05-16 11:25:36.022351','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(143,'2024-05-16 11:27:31.847519','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(144,'2024-05-16 11:28:11.670566','59','Case object (59)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(145,'2024-05-16 11:28:46.212147','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(146,'2024-05-16 11:28:53.050221','59','Case object (59)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(147,'2024-05-16 11:29:03.265606','58','Case object (58)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(148,'2024-05-16 11:29:35.795903','57','Case object (57)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(149,'2024-05-16 11:29:54.393596','56','Case object (56)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(150,'2024-05-16 11:34:03.896458','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(151,'2024-05-16 11:34:18.690850','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(152,'2024-05-16 12:39:45.300462','169','Location object (169)',3,'',9,1),(153,'2024-05-16 12:43:16.834717','141','Location object (141)',2,'[{\"changed\": {\"fields\": [\"Address type\"]}}]',9,1),(154,'2024-05-16 12:44:06.298103','173','Location object (173)',3,'',9,1),(155,'2024-05-16 12:48:21.828894','175','Location object (175)',3,'',9,1),(156,'2024-05-16 12:52:31.021308','177','Location object (177)',3,'',9,1),(157,'2024-05-16 12:56:15.411843','179','Location object (179)',3,'',9,1),(158,'2024-05-16 13:00:59.685525','182','Location object (182)',3,'',9,1),(159,'2024-05-16 13:03:19.938674','184','Location object (184)',3,'',9,1),(160,'2024-05-16 13:04:42.800788','186','Location object (186)',3,'',9,1),(161,'2024-05-16 13:08:45.933600','188','Location object (188)',3,'',9,1),(162,'2024-05-16 13:12:25.576349','189','Location object (189)',3,'',9,1),(163,'2024-05-17 06:21:46.122026','165','Location object (165)',2,'[{\"changed\": {\"fields\": [\"Address line2\"]}}]',9,1),(164,'2024-05-17 06:22:03.519246','165','Location object (165)',2,'[{\"changed\": {\"fields\": [\"Address line1\"]}}]',9,1),(165,'2024-05-17 08:06:43.491281','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Disbursement schedule\"]}}]',13,1),(166,'2024-05-20 04:33:47.524177','4','CaseDisbursement object (4)',2,'[]',22,1),(167,'2024-05-20 08:04:35.735007','4','CaseDisbursement object (4)',2,'[{\"changed\": {\"fields\": [\"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(168,'2024-05-20 08:11:29.607826','1','CaseRepayment object (1)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(169,'2024-05-20 08:11:46.937936','1','CaseRepayment object (1)',2,'[{\"changed\": {\"fields\": [\"Planned date\"]}}]',23,1),(170,'2024-05-20 09:04:06.687601','3','CaseRepayment object (3)',2,'[{\"changed\": {\"fields\": [\"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(171,'2024-05-20 09:04:27.919316','4','CaseRepayment object (4)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(172,'2024-05-20 09:04:37.949605','5','CaseRepayment object (5)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(173,'2024-05-20 09:05:03.513620','1','CaseRepayment object (1)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(174,'2024-05-20 09:06:23.340716','4','CaseDisbursement object (4)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(175,'2024-05-20 09:06:43.857179','5','CaseDisbursement object (5)',2,'[{\"changed\": {\"fields\": [\"Installment amt\", \"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(176,'2024-05-20 09:06:57.313524','7','CaseDisbursement object (7)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(177,'2024-05-20 09:07:07.085798','8','CaseDisbursement object (8)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(178,'2024-05-22 04:58:07.302957','3','mohit.raj@okirana.com',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"User role\"]}}]',10,1),(179,'2024-05-22 08:05:06.410030','69','Case object (69)',2,'[{\"changed\": {\"fields\": [\"Approved amt\", \"Disbursement count\"]}}]',13,1),(180,'2024-05-22 12:27:52.093227','2','arvind.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"Gender\", \"User role\"]}}]',10,1),(181,'2024-05-22 12:28:14.904258','2','arvind.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(182,'2024-05-22 12:30:53.370000','27','nisha.rangan@okirana.com',2,'[{\"changed\": {\"fields\": [\"Default account\", \"User role\"]}}]',10,1),(183,'2024-05-22 12:31:14.636355','27','nisha.rangan@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(184,'2024-05-23 03:27:11.171745','70','Case object (70)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(185,'2024-05-23 03:28:26.409166','68','Case object (68)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(186,'2024-05-23 03:50:56.680578','70','Case object (70)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(187,'2024-05-23 03:54:42.871927','70','Case object (70)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(188,'2024-05-23 06:06:34.641185','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Request amt\", \"Approved amt\"]}}]',13,1),(189,'2024-05-23 09:28:04.434969','166','abcde466884@gmail.com',2,'[{\"changed\": {\"fields\": [\"Phoneno\", \"Default account\"]}}]',10,1),(190,'2024-05-23 09:28:41.910165','164','abcde466882@gmail.com',2,'[{\"changed\": {\"fields\": [\"Phoneno\", \"Default account\"]}}]',10,1),(191,'2024-05-23 09:44:25.165285','54','CaseDisbursement object (54)',2,'[{\"changed\": {\"fields\": [\"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(192,'2024-05-23 09:51:26.094234','54','CaseDisbursement object (54)',2,'[{\"changed\": {\"fields\": [\"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(193,'2024-05-23 10:16:40.159901','54','CaseDisbursement object (54)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(194,'2024-05-23 10:21:44.331925','54','CaseDisbursement object (54)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(195,'2024-05-23 10:30:24.746595','54','CaseDisbursement object (54)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(196,'2024-05-23 10:30:39.183434','55','CaseDisbursement object (55)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Tot disbursed amt\"]}}]',22,1),(197,'2024-05-23 10:31:36.200174','54','CaseDisbursement object (54)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(198,'2024-05-23 10:32:53.657271','55','CaseDisbursement object (55)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(199,'2024-05-23 10:57:57.144246','67','Case object (67)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(200,'2024-05-23 10:59:35.201314','29','CaseRepayment object (29)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(201,'2024-05-23 12:11:09.966301','71','Case object (71)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(202,'2024-05-23 13:31:48.121967','151','Location object (151)',2,'[{\"changed\": {\"fields\": [\"Pincode\"]}}]',9,1),(203,'2024-05-24 04:48:56.853840','70','Case object (70)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(204,'2024-05-24 04:49:04.553656','71','Case object (71)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(205,'2024-05-24 04:49:18.865204','72','Case object (72)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(206,'2024-05-24 04:50:25.392239','72','Case object (72)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(207,'2024-05-24 04:50:38.043507','71','Case object (71)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(208,'2024-05-24 04:50:58.331853','70','Case object (70)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(209,'2024-05-24 05:12:16.735094','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Approval status\", \"Approved amt\"]}}]',13,1),(210,'2024-05-24 10:02:42.683527','82','Case object (82)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(211,'2024-05-24 10:58:54.883635','93','Case object (93)',3,'',13,1),(212,'2024-05-24 10:58:54.894352','92','Case object (92)',3,'',13,1),(213,'2024-05-24 11:06:05.738399','210','98765432016@gmail.com',2,'[{\"changed\": {\"fields\": [\"Email\", \"Default account\"]}}]',10,1),(214,'2024-05-24 11:10:05.047908','210','98765432016@gmail.com',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',10,1),(215,'2024-05-24 14:10:50.581933','62','Case object (62)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(216,'2024-05-24 14:11:27.170752','62','Case object (62)',2,'[{\"changed\": {\"fields\": [\"Grant type\"]}}]',13,1),(217,'2024-05-24 14:11:45.988783','62','Case object (62)',2,'[{\"changed\": {\"fields\": [\"Disbursement count\"]}}]',13,1),(218,'2024-05-24 14:29:14.520211','70','CaseDisbursement object (70)',2,'[{\"changed\": {\"fields\": [\"Disbursed date\", \"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(219,'2024-05-24 14:29:31.775375','71','CaseDisbursement object (71)',2,'[{\"changed\": {\"fields\": [\"Disbursed date\", \"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(220,'2024-05-24 14:29:42.142540','70','CaseDisbursement object (70)',2,'[{\"changed\": {\"fields\": [\"Disbursement status\", \"Disbursement txn info\"]}}]',22,1),(221,'2024-05-24 14:29:49.665216','71','CaseDisbursement object (71)',2,'[{\"changed\": {\"fields\": [\"Disbursement status\", \"Disbursement txn info\"]}}]',22,1),(222,'2024-05-24 14:53:06.115349','70','CaseDisbursement object (70)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(223,'2024-05-24 14:53:20.346449','71','CaseDisbursement object (71)',2,'[]',22,1),(224,'2024-05-27 07:24:13.240210','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment count\"]}}]',13,1),(225,'2024-05-27 07:52:52.471534','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(226,'2024-05-27 12:09:39.618102','67','Case object (67)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(227,'2024-05-27 12:15:22.955651','71','Case object (71)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(228,'2024-05-27 12:16:01.834307','71','Case object (71)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(229,'2024-05-28 03:35:06.451741','53','Case object (53)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(230,'2024-05-28 03:42:31.244434','2','arvind.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(231,'2024-05-28 03:42:54.759317','2','arvind.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(232,'2024-05-28 03:43:22.228099','53','Case object (53)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(233,'2024-05-28 03:47:38.609762','69','Case object (69)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(234,'2024-05-28 03:50:45.485723','27','nisha.rangan@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(235,'2024-05-28 03:50:56.577944','27','nisha.rangan@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(236,'2024-05-28 03:52:10.857434','27','nisha.rangan@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(237,'2024-05-28 03:53:40.354881','2','arvind.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(238,'2024-05-28 03:53:58.892742','2','arvind.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(239,'2024-05-28 04:21:44.477792','2','arvind.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"Firstname\"]}}]',10,1),(240,'2024-05-28 04:45:05.655150','219','bharat.yadav@abc.com',2,'[{\"changed\": {\"fields\": [\"Password\", \"Default account\"]}}]',10,1),(241,'2024-05-28 04:49:33.449978','3','mohit.raj@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(242,'2024-05-28 07:17:54.660370','218','Location object (218)',2,'[]',9,1),(243,'2024-05-28 07:18:53.818073','218','Location object (218)',3,'',9,1),(244,'2024-05-28 07:51:56.932701','72','Case object (72)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(245,'2024-05-28 08:31:24.404797','99','Case object (99)',2,'[{\"changed\": {\"fields\": [\"Approved amt\"]}}]',13,1),(246,'2024-05-28 08:36:38.338403','87','CaseDisbursement object (87)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(247,'2024-05-28 08:36:47.457354','86','CaseDisbursement object (86)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(248,'2024-05-28 08:36:54.803697','85','CaseDisbursement object (85)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(249,'2024-05-28 08:37:01.810047','84','CaseDisbursement object (84)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(250,'2024-05-28 08:37:21.072953','83','CaseDisbursement object (83)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(251,'2024-05-28 08:40:44.076787','69','Case object (69)',2,'[{\"changed\": {\"fields\": [\"Grant type\"]}}]',13,1),(252,'2024-05-28 09:23:25.091898','104','Case object (104)',3,'',13,1),(253,'2024-05-28 09:23:25.104990','103','Case object (103)',3,'',13,1),(254,'2024-05-28 09:53:08.631247','108','Case object (108)',3,'',13,1),(255,'2024-05-28 09:53:08.642014','107','Case object (107)',3,'',13,1),(256,'2024-05-28 09:53:08.651614','106','Case object (106)',3,'',13,1),(257,'2024-05-28 09:53:08.661804','105','Case object (105)',3,'',13,1),(258,'2024-05-28 11:46:18.499566','98','LovSeedData object (98)',1,'[{\"added\": {}}]',16,1),(259,'2024-05-28 11:46:50.262185','99','LovSeedData object (99)',1,'[{\"added\": {}}]',16,1),(260,'2024-05-28 11:47:24.138310','100','LovSeedData object (100)',1,'[{\"added\": {}}]',16,1),(261,'2024-05-28 11:47:57.157888','101','LovSeedData object (101)',1,'[{\"added\": {}}]',16,1),(262,'2024-05-28 11:48:24.806324','102','LovSeedData object (102)',1,'[{\"added\": {}}]',16,1),(263,'2024-05-28 11:48:50.904149','103','LovSeedData object (103)',1,'[{\"added\": {}}]',16,1),(264,'2024-05-29 05:05:38.782175','27','nisha.rangan@okirana.com',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\", \"Gender\", \"Dob [Age]\", \"Phoneno\"]}}]',10,1),(265,'2024-05-29 05:58:31.031911','185','rajaram5@abc.com',2,'[{\"changed\": {\"fields\": [\"Lastname\", \"Default account\"]}}]',10,1),(266,'2024-05-29 08:29:30.326147','226','mukundh.s2@yahoo.co.in',2,'[{\"changed\": {\"fields\": [\"Email\", \"Default account\"]}}]',10,1),(267,'2024-05-29 08:29:52.412124','225','mukundh.s3@yahoo.co.in',2,'[{\"changed\": {\"fields\": [\"Email\", \"Default account\"]}}]',10,1),(268,'2024-05-29 08:31:34.951051','178','mukundh.s3@yahoo.co.in',2,'[{\"changed\": {\"fields\": [\"Email\", \"Default account\"]}}]',10,1),(269,'2024-05-29 08:55:12.712677','1','arvind.singh1808@gmail.com',2,'[{\"changed\": {\"fields\": [\"Phoneno\", \"Marital status\", \"Address proof\", \"Status\", \"Default account\"]}}]',10,1),(270,'2024-05-29 10:28:53.561625','241','yeso54.nan5@abc.com',2,'[{\"changed\": {\"fields\": [\"Email\", \"Default account\"]}}]',10,1),(271,'2024-05-29 11:34:00.486014','156','Case object (156)',3,'',13,1),(272,'2024-05-29 11:34:00.510238','155','Case object (155)',3,'',13,1),(273,'2024-05-29 11:59:09.714037','166','Case object (166)',3,'',13,1),(274,'2024-05-29 11:59:09.730188','165','Case object (165)',3,'',13,1),(275,'2024-05-29 11:59:09.738703','164','Case object (164)',3,'',13,1),(276,'2024-05-29 11:59:09.745292','163','Case object (163)',3,'',13,1),(277,'2024-05-29 11:59:09.755608','162','Case object (162)',3,'',13,1),(278,'2024-05-29 11:59:09.761705','161','Case object (161)',3,'',13,1),(279,'2024-05-29 11:59:09.771324','160','Case object (160)',3,'',13,1),(280,'2024-05-29 11:59:09.783281','159','Case object (159)',3,'',13,1),(281,'2024-05-29 11:59:09.792228','158','Case object (158)',3,'',13,1),(282,'2024-05-29 11:59:09.799045','157','Case object (157)',3,'',13,1),(283,'2024-05-29 12:20:43.592358','173','Case object (173)',3,'',13,1),(284,'2024-05-29 12:20:43.600613','172','Case object (172)',3,'',13,1),(285,'2024-05-29 12:20:43.607902','171','Case object (171)',3,'',13,1),(286,'2024-05-29 12:20:43.615108','170','Case object (170)',3,'',13,1),(287,'2024-05-29 12:20:43.622750','169','Case object (169)',3,'',13,1),(288,'2024-05-29 12:20:43.635553','168','Case object (168)',3,'',13,1),(289,'2024-05-29 12:20:43.642413','167','Case object (167)',3,'',13,1),(290,'2024-05-30 04:11:00.014496','198','Case object (198)',2,'[{\"changed\": {\"fields\": [\"Short description\"]}}]',13,1),(291,'2024-05-30 04:46:18.409703','209','Case object (209)',3,'',13,1),(292,'2024-05-30 04:46:31.597458','210','Case object (210)',3,'',13,1),(293,'2024-05-30 04:51:51.767235','198','Case object (198)',2,'[{\"changed\": {\"fields\": [\"Grant type\"]}}]',13,1),(294,'2024-05-30 10:06:17.422853','104','LovSeedData object (104)',1,'[{\"added\": {}}]',16,1),(295,'2024-05-30 10:07:52.568768','105','LovSeedData object (105)',1,'[{\"added\": {}}]',16,1),(296,'2024-05-30 10:10:34.401987','31','LovSeedData object (31)',2,'[{\"changed\": {\"fields\": [\"Display label\", \"Input type\", \"Input Ref Code\", \"Mandatory\"]}}]',16,1),(297,'2024-05-30 12:02:33.599649','215','Case object (215)',2,'[{\"changed\": {\"fields\": [\"Grant type\"]}}]',13,1),(298,'2024-05-30 12:22:20.856928','106','LovSeedData object (106)',1,'[{\"added\": {}}]',16,1),(299,'2024-05-30 12:22:57.250198','107','LovSeedData object (107)',1,'[{\"added\": {}}]',16,1),(300,'2024-05-30 12:24:09.464888','107','LovSeedData object (107)',2,'[{\"changed\": {\"fields\": [\"Input type\"]}}]',16,1),(301,'2024-05-30 12:25:52.732016','107','LovSeedData object (107)',2,'[{\"changed\": {\"fields\": [\"Input type\"]}}]',16,1),(302,'2024-05-30 13:28:50.438049','275','None',2,'[]',10,1),(303,'2024-05-30 13:28:57.179771','275','None',2,'[]',10,1),(304,'2024-05-30 13:29:39.463086','276','None',2,'[]',10,1),(305,'2024-05-31 05:14:35.604625','251','Case object (251)',3,'',13,1),(306,'2024-05-31 05:14:35.615756','250','Case object (250)',3,'',13,1),(307,'2024-05-31 05:14:35.627038','249','Case object (249)',3,'',13,1),(308,'2024-05-31 05:14:35.635111','248','Case object (248)',3,'',13,1),(309,'2024-05-31 05:14:35.642086','247','Case object (247)',3,'',13,1),(310,'2024-05-31 05:14:35.650928','246','Case object (246)',3,'',13,1),(311,'2024-05-31 05:14:35.661096','245','Case object (245)',3,'',13,1),(312,'2024-05-31 09:11:56.844950','243','Case object (243)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(313,'2024-06-05 14:47:10.773815','9','CaseDisbursement object (9)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(314,'2024-06-05 14:47:24.271272','10','CaseDisbursement object (10)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(315,'2024-06-05 14:49:21.166337','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Disbursement count\"]}}]',13,1),(316,'2024-06-05 14:50:44.432718','9','CaseDisbursement object (9)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(317,'2024-06-06 02:23:25.100159','10','CaseDisbursement object (10)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\", \"Disbursement status\"]}}]',22,1),(318,'2024-06-06 02:23:49.666375','9','CaseDisbursement object (9)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Tot disbursed amt\"]}}]',22,1),(319,'2024-06-06 02:24:17.709632','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Total disbursment\"]}}]',13,1),(320,'2024-06-06 02:32:06.921997','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Total disbursment\"]}}]',13,1),(321,'2024-06-06 02:33:02.668700','9','CaseDisbursement object (9)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(322,'2024-06-06 02:39:52.492520','9','CaseDisbursement object (9)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Remaining amt\", \"Tot disbursed amt\"]}}]',22,1),(323,'2024-06-06 02:40:01.015649','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Total disbursment\"]}}]',13,1),(324,'2024-06-06 02:49:38.604063','60','Case object (60)',2,'[{\"changed\": {\"fields\": [\"Total disbursment\"]}}]',13,1),(325,'2024-06-06 02:49:52.308502','9','CaseDisbursement object (9)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\", \"Tot disbursed amt\", \"Disbursement status\"]}}]',22,1),(326,'2024-06-06 03:28:16.472313','39','CaseRepayment object (39)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(327,'2024-06-06 03:29:02.677533','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment count\"]}}]',13,1),(328,'2024-06-06 03:30:32.699239','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(329,'2024-06-06 04:58:27.829076','39','CaseRepayment object (39)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\", \"Actual repayment amt\", \"Outstanding amt\"]}}]',23,1),(330,'2024-06-06 04:58:42.518280','40','CaseRepayment object (40)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\", \"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(331,'2024-06-06 04:58:57.778750','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Tot repayed amt\"]}}]',23,1),(332,'2024-06-06 04:59:42.832678','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(333,'2024-06-06 05:00:34.294972','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Total disbursment\"]}}]',13,1),(334,'2024-06-06 05:01:19.395993','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(335,'2024-06-06 05:05:10.868852','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(336,'2024-06-06 05:15:44.084119','258','Case object (258)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(337,'2024-06-06 05:28:15.684441','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(338,'2024-06-06 05:28:58.468383','39','CaseRepayment object (39)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(339,'2024-06-06 05:29:09.081166','40','CaseRepayment object (40)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(340,'2024-06-06 05:30:40.601968','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(341,'2024-06-06 05:30:51.306092','40','CaseRepayment object (40)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(342,'2024-06-06 05:34:56.953504','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(343,'2024-06-06 05:35:15.313467','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(344,'2024-06-06 05:36:07.714096','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(345,'2024-06-06 05:36:12.320590','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(346,'2024-06-06 05:38:27.423176','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(347,'2024-06-06 05:38:34.901116','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(348,'2024-06-06 05:41:10.806230','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(349,'2024-06-06 05:41:18.257966','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(350,'2024-06-06 05:46:56.990265','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(351,'2024-06-06 05:47:02.731021','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(352,'2024-06-06 05:50:08.289321','41','CaseRepayment object (41)',2,'[{\"changed\": {\"fields\": [\"Actual repayment amt\", \"Outstanding amt\", \"Tot repayed amt\"]}}]',23,1),(353,'2024-06-06 05:50:12.644063','44','Case object (44)',2,'[{\"changed\": {\"fields\": [\"Repayment received\"]}}]',13,1),(354,'2024-06-06 06:23:03.260582','198','Case object (198)',2,'[{\"changed\": {\"fields\": [\"Pending info\"]}}]',13,1),(355,'2024-06-06 07:34:35.530073','258','Case object (258)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(356,'2024-06-06 07:34:50.865494','215','Case object (215)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(357,'2024-06-07 07:46:10.482797','278','CaseDisbursement object (278)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(358,'2024-06-07 07:53:15.194040','289','CaseRepayment object (289)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(359,'2024-06-07 07:53:24.752952','289','CaseRepayment object (289)',2,'[{\"changed\": {\"fields\": [\"Planned date\"]}}]',23,1),(360,'2024-06-07 08:24:50.876656','108','LovSeedData object (108)',1,'[{\"added\": {}}]',16,1),(361,'2024-06-07 08:24:53.500204','108','LovSeedData object (108)',2,'[]',16,1),(362,'2024-06-07 08:25:20.716866','109','LovSeedData object (109)',1,'[{\"added\": {}}]',16,1),(363,'2024-06-07 08:25:24.528412','109','LovSeedData object (109)',2,'[{\"changed\": {\"fields\": [\"Input type\"]}}]',16,1),(364,'2024-06-07 08:25:29.715170','108','LovSeedData object (108)',2,'[{\"changed\": {\"fields\": [\"Input type\"]}}]',16,1),(365,'2024-06-07 19:06:59.663609','6','LovSeedData object (6)',2,'[{\"changed\": {\"fields\": [\"Display label\", \"Input type\", \"Mandatory\"]}}]',16,1),(366,'2024-06-10 04:59:39.414016','264','Case object (264)',2,'[{\"changed\": {\"fields\": [\"Has guarantor\", \"Guarantor name\", \"Guarantor phone\", \"Referred by\", \"Grant type\", \"Disbursement schedule\"]}}]',13,1),(367,'2024-06-10 05:00:39.447105','264','Case object (264)',2,'[{\"changed\": {\"fields\": [\"Collateral\"]}}]',13,1),(368,'2024-06-10 05:08:14.177705','264','Case object (264)',2,'[{\"changed\": {\"fields\": [\"Grant type\"]}}]',13,1),(369,'2024-06-10 05:20:26.423253','265','Case object (265)',2,'[{\"changed\": {\"fields\": [\"Request amt\"]}}]',13,1),(370,'2024-06-10 08:53:28.129363','260','Case object (260)',2,'[{\"changed\": {\"fields\": [\"Grant type\"]}}]',13,1),(371,'2024-06-10 09:10:33.134514','266','Case object (266)',2,'[{\"changed\": {\"fields\": [\"Grant type\"]}}]',13,1),(372,'2024-06-10 10:39:31.563487','267','Case object (267)',2,'[{\"changed\": {\"fields\": [\"Total disbursment\", \"Repayment received\"]}}]',13,1),(373,'2024-06-11 05:24:01.234931','68','LovSeedData object (68)',2,'[{\"changed\": {\"fields\": [\"Input type\", \"Mandatory\"]}}]',16,1),(374,'2024-06-11 07:43:02.323991','269','Case object (269)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(375,'2024-06-11 07:46:25.975848','265','Case object (265)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(376,'2024-06-11 07:55:29.952726','269','Case object (269)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(377,'2024-06-11 09:03:15.865130','268','Case object (268)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(378,'2024-06-11 09:04:05.708555','268','Case object (268)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(379,'2024-06-11 09:07:00.932916','270','Case object (270)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(380,'2024-06-11 09:07:15.294868','262','Case object (262)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(381,'2024-06-11 12:42:47.776811','340','CaseRepayment object (340)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(382,'2024-06-11 12:42:59.997817','342','CaseRepayment object (342)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(383,'2024-06-11 12:43:11.288581','341','CaseRepayment object (341)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(384,'2024-06-11 12:43:26.304746','343','CaseRepayment object (343)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(385,'2024-06-11 12:43:36.235792','344','CaseRepayment object (344)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(386,'2024-06-11 12:43:48.122778','346','CaseRepayment object (346)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(387,'2024-06-11 12:43:57.425091','345','CaseRepayment object (345)',2,'[{\"changed\": {\"fields\": [\"Planned repayment amt\"]}}]',23,1),(388,'2024-06-12 04:34:39.618181','1','Okirana',2,'[{\"changed\": {\"fields\": [\"Fund corpus\"]}}]',8,1),(389,'2024-06-12 06:48:00.446963','1','Okirana',2,'[{\"changed\": {\"fields\": [\"Fund corpus\"]}}]',8,1),(390,'2024-06-12 08:24:22.365148','363','CaseRepayment object (363)',3,'',23,1),(391,'2024-06-12 08:24:22.374339','362','CaseRepayment object (362)',3,'',23,1),(392,'2024-06-12 08:24:22.379935','361','CaseRepayment object (361)',3,'',23,1),(393,'2024-06-12 08:24:22.386158','360','CaseRepayment object (360)',3,'',23,1),(394,'2024-06-13 10:35:12.295493','261','Case object (261)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(395,'2024-06-14 06:00:02.161903','282','Case object (282)',2,'[{\"changed\": {\"fields\": [\"Grant type\", \"Disbursement schedule\", \"Collateral\", \"Approved amt\"]}}]',13,1),(396,'2024-06-14 08:39:57.249355','330','Location object (330)',3,'',9,1),(397,'2024-06-14 08:39:57.258933','329','Location object (329)',3,'',9,1),(398,'2024-06-14 08:41:47.660482','331','Location object (331)',3,'',9,1),(399,'2024-06-14 08:46:38.465626','332','Location object (332)',3,'',9,1),(400,'2024-06-14 08:48:31.606479','333','Location object (333)',3,'',9,1),(401,'2024-06-14 13:06:13.938977','299','yaksha.r1@abc.com',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(402,'2024-06-20 07:50:44.893987','304','None',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\"]}}]',10,1),(403,'2024-06-20 07:51:15.126359','304','None',2,'[{\"changed\": {\"fields\": [\"Lastname\"]}}]',10,1),(404,'2024-06-20 08:39:10.703319','1','Okirana',2,'[]',8,1),(405,'2024-06-25 06:29:27.958563','316','None',2,'[{\"changed\": {\"fields\": [\"Profile pic\"]}}]',10,1),(406,'2024-07-01 05:23:59.370776','332','Case object (332)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(407,'2024-07-01 05:56:01.876824','336','Case object (336)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(408,'2024-07-01 06:23:33.344925','336','Case object (336)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(409,'2024-07-01 06:26:06.316932','68','LovSeedData object (68)',2,'[]',16,1),(410,'2024-07-01 10:34:32.287699','329','Case object (329)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(411,'2024-07-01 10:35:22.543406','329','Case object (329)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(412,'2024-07-01 10:37:59.777113','329','Case object (329)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(413,'2024-07-01 11:51:23.628499','68','LovSeedData object (68)',2,'[{\"changed\": {\"fields\": [\"Input type\"]}}]',16,1),(414,'2024-07-02 05:59:11.430681','349','Case object (349)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(415,'2024-07-02 06:00:14.522647','577','CaseDisbursement object (577)',2,'[{\"changed\": {\"fields\": [\"Installment amt\"]}}]',22,1),(416,'2024-07-02 06:00:48.547699','577','CaseDisbursement object (577)',2,'[{\"changed\": {\"fields\": [\"Disbursed amt\"]}}]',22,1),(417,'2024-07-02 06:33:11.319118','1','Dr.D.J.Kini Foundation',2,'[{\"changed\": {\"fields\": [\"Company name\", \"Legal entity name\", \"Org contact number\", \"Primary contact name\", \"Primary contact number\", \"Primary contact email\"]}}]',8,1),(418,'2024-07-02 06:37:15.498549','1','Dr.D.J.Kini Foundation',2,'[{\"changed\": {\"fields\": [\"Account type\"]}}]',8,1),(419,'2024-07-02 06:39:15.202448','337','anilkini@hotmail.com',1,'[{\"added\": {}}]',10,1),(420,'2024-07-02 07:02:43.950282','44','Case object (44)',3,'',13,1),(421,'2024-07-02 07:06:16.842490','339','Case object (339)',3,'',13,1),(422,'2024-07-03 07:39:46.314402','358','Case object (358)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(423,'2024-07-03 07:39:54.841907','357','Case object (357)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(424,'2024-07-03 09:56:24.849131','3','mohit.raj@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(425,'2024-07-03 14:01:42.883476','315','None',2,'[{\"changed\": {\"fields\": [\"Address proof copy\"]}}]',10,1),(426,'2024-07-03 14:03:29.381402','315','None',2,'[{\"changed\": {\"fields\": [\"Address proof copy\"]}}]',10,1),(427,'2024-07-03 15:15:36.542713','315','None',2,'[{\"changed\": {\"fields\": [\"Identity proof copy\", \"Address proof copy\"]}}]',10,1),(428,'2024-07-04 05:53:22.722761','372','Case object (372)',3,'',13,1),(429,'2024-07-04 05:53:22.731215','371','Case object (371)',3,'',13,1),(430,'2024-07-04 05:53:22.738568','370','Case object (370)',3,'',13,1),(431,'2024-07-04 05:53:22.744983','369','Case object (369)',3,'',13,1),(432,'2024-07-04 05:53:22.752324','368','Case object (368)',3,'',13,1),(433,'2024-07-04 05:53:22.758056','367','Case object (367)',3,'',13,1),(434,'2024-07-04 05:53:22.767115','366','Case object (366)',3,'',13,1),(435,'2024-07-04 05:53:22.774947','365','Case object (365)',3,'',13,1),(436,'2024-07-04 05:53:22.782083','364','Case object (364)',3,'',13,1),(437,'2024-07-04 05:53:22.790161','363','Case object (363)',3,'',13,1),(438,'2024-07-04 05:53:22.796340','362','Case object (362)',3,'',13,1),(439,'2024-07-04 05:53:22.802062','361','Case object (361)',3,'',13,1),(440,'2024-07-04 05:53:22.810085','360','Case object (360)',3,'',13,1),(441,'2024-07-04 05:53:22.818731','359','Case object (359)',3,'',13,1),(442,'2024-07-04 05:53:22.825719','358','Case object (358)',3,'',13,1),(443,'2024-07-04 05:53:22.832662','357','Case object (357)',3,'',13,1),(444,'2024-07-04 05:53:22.840275','356','Case object (356)',3,'',13,1),(445,'2024-07-04 05:53:22.848765','355','Case object (355)',3,'',13,1),(446,'2024-07-04 05:53:22.856708','354','Case object (354)',3,'',13,1),(447,'2024-07-04 05:53:22.863946','353','Case object (353)',3,'',13,1),(448,'2024-07-04 05:53:22.870433','352','Case object (352)',3,'',13,1),(449,'2024-07-04 05:53:22.883976','351','Case object (351)',3,'',13,1),(450,'2024-07-04 05:53:22.889907','350','Case object (350)',3,'',13,1),(451,'2024-07-04 05:53:22.897579','349','Case object (349)',3,'',13,1),(452,'2024-07-04 05:53:22.904653','348','Case object (348)',3,'',13,1),(453,'2024-07-04 05:53:22.910393','347','Case object (347)',3,'',13,1),(454,'2024-07-04 05:53:22.920338','346','Case object (346)',3,'',13,1),(455,'2024-07-04 05:53:22.926680','345','Case object (345)',3,'',13,1),(456,'2024-07-04 05:53:22.932438','344','Case object (344)',3,'',13,1),(457,'2024-07-04 05:53:22.942228','343','Case object (343)',3,'',13,1),(458,'2024-07-04 05:53:22.951310','342','Case object (342)',3,'',13,1),(459,'2024-07-04 05:53:22.956966','341','Case object (341)',3,'',13,1),(460,'2024-07-04 05:53:22.964631','340','Case object (340)',3,'',13,1),(461,'2024-07-04 05:53:22.974241','338','Case object (338)',3,'',13,1),(462,'2024-07-04 05:53:22.982770','337','Case object (337)',3,'',13,1),(463,'2024-07-04 05:53:22.992550','336','Case object (336)',3,'',13,1),(464,'2024-07-04 05:53:22.999368','335','Case object (335)',3,'',13,1),(465,'2024-07-04 05:53:23.005918','334','Case object (334)',3,'',13,1),(466,'2024-07-04 05:53:23.012442','333','Case object (333)',3,'',13,1),(467,'2024-07-04 05:53:23.018126','332','Case object (332)',3,'',13,1),(468,'2024-07-04 05:53:23.024888','331','Case object (331)',3,'',13,1),(469,'2024-07-04 05:53:23.030963','330','Case object (330)',3,'',13,1),(470,'2024-07-04 05:53:23.036763','329','Case object (329)',3,'',13,1),(471,'2024-07-04 05:53:23.043518','328','Case object (328)',3,'',13,1),(472,'2024-07-04 05:53:23.049203','327','Case object (327)',3,'',13,1),(473,'2024-07-04 05:53:23.055693','326','Case object (326)',3,'',13,1),(474,'2024-07-04 05:53:23.062080','325','Case object (325)',3,'',13,1),(475,'2024-07-04 05:53:23.068212','324','Case object (324)',3,'',13,1),(476,'2024-07-04 05:53:23.074560','323','Case object (323)',3,'',13,1),(477,'2024-07-04 05:53:23.082242','322','Case object (322)',3,'',13,1),(478,'2024-07-04 05:53:23.091197','321','Case object (321)',3,'',13,1),(479,'2024-07-04 05:53:23.099061','320','Case object (320)',3,'',13,1),(480,'2024-07-04 05:53:23.106993','319','Case object (319)',3,'',13,1),(481,'2024-07-04 05:53:23.118635','318','Case object (318)',3,'',13,1),(482,'2024-07-04 05:53:23.131179','317','Case object (317)',3,'',13,1),(483,'2024-07-04 05:53:23.139465','316','Case object (316)',3,'',13,1),(484,'2024-07-04 05:53:23.147854','315','Case object (315)',3,'',13,1),(485,'2024-07-04 05:53:23.154055','314','Case object (314)',3,'',13,1),(486,'2024-07-04 05:53:23.159578','313','Case object (313)',3,'',13,1),(487,'2024-07-04 05:53:23.168131','312','Case object (312)',3,'',13,1),(488,'2024-07-04 05:53:23.174415','311','Case object (311)',3,'',13,1),(489,'2024-07-04 05:53:23.180832','310','Case object (310)',3,'',13,1),(490,'2024-07-04 05:53:23.187159','309','Case object (309)',3,'',13,1),(491,'2024-07-04 05:53:23.194084','308','Case object (308)',3,'',13,1),(492,'2024-07-04 05:53:23.201198','307','Case object (307)',3,'',13,1),(493,'2024-07-04 05:53:23.208155','306','Case object (306)',3,'',13,1),(494,'2024-07-04 05:53:23.214019','305','Case object (305)',3,'',13,1),(495,'2024-07-04 05:53:23.219884','304','Case object (304)',3,'',13,1),(496,'2024-07-04 05:53:23.234096','303','Case object (303)',3,'',13,1),(497,'2024-07-04 05:53:23.239301','302','Case object (302)',3,'',13,1),(498,'2024-07-04 05:53:23.246784','301','Case object (301)',3,'',13,1),(499,'2024-07-04 05:53:23.254090','300','Case object (300)',3,'',13,1),(500,'2024-07-04 05:53:23.259413','299','Case object (299)',3,'',13,1),(501,'2024-07-04 05:53:23.265279','298','Case object (298)',3,'',13,1),(502,'2024-07-04 05:53:23.271113','297','Case object (297)',3,'',13,1),(503,'2024-07-04 05:53:23.277798','296','Case object (296)',3,'',13,1),(504,'2024-07-04 05:53:23.284065','295','Case object (295)',3,'',13,1),(505,'2024-07-04 05:53:23.290501','294','Case object (294)',3,'',13,1),(506,'2024-07-04 05:53:23.297255','293','Case object (293)',3,'',13,1),(507,'2024-07-04 05:53:23.302651','292','Case object (292)',3,'',13,1),(508,'2024-07-04 05:53:23.322124','291','Case object (291)',3,'',13,1),(509,'2024-07-04 05:53:23.336662','290','Case object (290)',3,'',13,1),(510,'2024-07-04 05:53:23.348869','289','Case object (289)',3,'',13,1),(511,'2024-07-04 05:53:23.377416','288','Case object (288)',3,'',13,1),(512,'2024-07-04 05:53:23.391432','287','Case object (287)',3,'',13,1),(513,'2024-07-04 05:53:23.405037','286','Case object (286)',3,'',13,1),(514,'2024-07-04 05:53:23.417718','285','Case object (285)',3,'',13,1),(515,'2024-07-04 05:53:23.431151','284','Case object (284)',3,'',13,1),(516,'2024-07-04 05:53:23.451455','283','Case object (283)',3,'',13,1),(517,'2024-07-04 05:53:23.479389','282','Case object (282)',3,'',13,1),(518,'2024-07-04 05:53:23.490938','281','Case object (281)',3,'',13,1),(519,'2024-07-04 05:53:23.503330','280','Case object (280)',3,'',13,1),(520,'2024-07-04 05:53:23.518175','279','Case object (279)',3,'',13,1),(521,'2024-07-04 05:53:23.532878','278','Case object (278)',3,'',13,1),(522,'2024-07-04 05:53:23.544830','277','Case object (277)',3,'',13,1),(523,'2024-07-04 05:53:23.552923','276','Case object (276)',3,'',13,1),(524,'2024-07-04 05:53:23.559172','275','Case object (275)',3,'',13,1),(525,'2024-07-04 05:53:23.566237','274','Case object (274)',3,'',13,1),(526,'2024-07-04 05:53:23.574735','273','Case object (273)',3,'',13,1),(527,'2024-07-04 05:53:23.587120','272','Case object (272)',3,'',13,1),(528,'2024-07-04 05:53:40.809601','271','Case object (271)',3,'',13,1),(529,'2024-07-04 05:53:40.822547','270','Case object (270)',3,'',13,1),(530,'2024-07-04 05:53:40.828427','269','Case object (269)',3,'',13,1),(531,'2024-07-04 05:53:40.834511','268','Case object (268)',3,'',13,1),(532,'2024-07-04 05:53:40.840764','267','Case object (267)',3,'',13,1),(533,'2024-07-04 05:53:40.849233','266','Case object (266)',3,'',13,1),(534,'2024-07-04 05:53:40.854749','265','Case object (265)',3,'',13,1),(535,'2024-07-04 05:53:40.861241','264','Case object (264)',3,'',13,1),(536,'2024-07-04 05:53:40.871812','263','Case object (263)',3,'',13,1),(537,'2024-07-04 05:53:40.877072','262','Case object (262)',3,'',13,1),(538,'2024-07-04 05:53:40.885227','261','Case object (261)',3,'',13,1),(539,'2024-07-04 05:53:40.900172','260','Case object (260)',3,'',13,1),(540,'2024-07-04 05:53:40.905778','259','Case object (259)',3,'',13,1),(541,'2024-07-04 05:53:40.912221','258','Case object (258)',3,'',13,1),(542,'2024-07-04 05:53:40.923514','257','Case object (257)',3,'',13,1),(543,'2024-07-04 05:53:40.930331','256','Case object (256)',3,'',13,1),(544,'2024-07-04 05:53:40.937813','255','Case object (255)',3,'',13,1),(545,'2024-07-04 05:53:40.944676','254','Case object (254)',3,'',13,1),(546,'2024-07-04 05:53:40.950972','253','Case object (253)',3,'',13,1),(547,'2024-07-04 05:53:40.957084','252','Case object (252)',3,'',13,1),(548,'2024-07-04 05:53:40.964819','244','Case object (244)',3,'',13,1),(549,'2024-07-04 05:53:40.971037','243','Case object (243)',3,'',13,1),(550,'2024-07-04 05:53:40.977652','242','Case object (242)',3,'',13,1),(551,'2024-07-04 05:53:40.983699','241','Case object (241)',3,'',13,1),(552,'2024-07-04 05:53:40.992203','240','Case object (240)',3,'',13,1),(553,'2024-07-04 05:53:40.997683','239','Case object (239)',3,'',13,1),(554,'2024-07-04 05:53:41.004570','238','Case object (238)',3,'',13,1),(555,'2024-07-04 05:53:41.010618','237','Case object (237)',3,'',13,1),(556,'2024-07-04 05:53:41.018664','236','Case object (236)',3,'',13,1),(557,'2024-07-04 05:53:41.031166','235','Case object (235)',3,'',13,1),(558,'2024-07-04 05:53:41.037827','234','Case object (234)',3,'',13,1),(559,'2024-07-04 05:53:41.043768','233','Case object (233)',3,'',13,1),(560,'2024-07-04 05:53:41.050601','232','Case object (232)',3,'',13,1),(561,'2024-07-04 05:53:41.056897','231','Case object (231)',3,'',13,1),(562,'2024-07-04 05:53:41.064408','230','Case object (230)',3,'',13,1),(563,'2024-07-04 05:53:41.073502','229','Case object (229)',3,'',13,1),(564,'2024-07-04 05:53:41.081724','228','Case object (228)',3,'',13,1),(565,'2024-07-04 05:53:41.088913','227','Case object (227)',3,'',13,1),(566,'2024-07-04 05:53:41.095524','226','Case object (226)',3,'',13,1),(567,'2024-07-04 05:53:41.103538','225','Case object (225)',3,'',13,1),(568,'2024-07-04 05:53:41.110065','224','Case object (224)',3,'',13,1),(569,'2024-07-04 05:53:41.117462','223','Case object (223)',3,'',13,1),(570,'2024-07-04 05:53:41.123479','222','Case object (222)',3,'',13,1),(571,'2024-07-04 05:53:41.132180','221','Case object (221)',3,'',13,1),(572,'2024-07-04 05:53:41.140180','220','Case object (220)',3,'',13,1),(573,'2024-07-04 05:53:41.146899','219','Case object (219)',3,'',13,1),(574,'2024-07-04 05:53:41.160354','218','Case object (218)',3,'',13,1),(575,'2024-07-04 05:53:41.166463','217','Case object (217)',3,'',13,1),(576,'2024-07-04 05:53:41.172285','216','Case object (216)',3,'',13,1),(577,'2024-07-04 05:53:41.178725','215','Case object (215)',3,'',13,1),(578,'2024-07-04 05:53:41.184231','214','Case object (214)',3,'',13,1),(579,'2024-07-04 05:53:41.191593','213','Case object (213)',3,'',13,1),(580,'2024-07-04 05:53:41.197512','212','Case object (212)',3,'',13,1),(581,'2024-07-04 05:53:41.205671','211','Case object (211)',3,'',13,1),(582,'2024-07-04 05:53:41.211476','208','Case object (208)',3,'',13,1),(583,'2024-07-04 05:53:41.217868','207','Case object (207)',3,'',13,1),(584,'2024-07-04 05:53:41.224491','206','Case object (206)',3,'',13,1),(585,'2024-07-04 05:53:41.231217','205','Case object (205)',3,'',13,1),(586,'2024-07-04 05:53:41.238088','204','Case object (204)',3,'',13,1),(587,'2024-07-04 05:53:41.244565','203','Case object (203)',3,'',13,1),(588,'2024-07-04 05:53:41.251304','202','Case object (202)',3,'',13,1),(589,'2024-07-04 05:53:41.258009','201','Case object (201)',3,'',13,1),(590,'2024-07-04 05:53:41.280546','200','Case object (200)',3,'',13,1),(591,'2024-07-04 05:53:41.286801','199','Case object (199)',3,'',13,1),(592,'2024-07-04 05:53:41.293391','198','Case object (198)',3,'',13,1),(593,'2024-07-04 05:53:41.301959','197','Case object (197)',3,'',13,1),(594,'2024-07-04 05:53:41.310964','196','Case object (196)',3,'',13,1),(595,'2024-07-04 05:53:41.335721','195','Case object (195)',3,'',13,1),(596,'2024-07-04 05:53:41.347259','194','Case object (194)',3,'',13,1),(597,'2024-07-04 05:53:41.359072','193','Case object (193)',3,'',13,1),(598,'2024-07-04 05:53:41.372867','192','Case object (192)',3,'',13,1),(599,'2024-07-04 05:53:41.394457','191','Case object (191)',3,'',13,1),(600,'2024-07-04 05:53:41.410473','190','Case object (190)',3,'',13,1),(601,'2024-07-04 05:53:41.421543','189','Case object (189)',3,'',13,1),(602,'2024-07-04 05:53:41.433572','188','Case object (188)',3,'',13,1),(603,'2024-07-04 05:53:41.447254','187','Case object (187)',3,'',13,1),(604,'2024-07-04 05:53:41.462253','186','Case object (186)',3,'',13,1),(605,'2024-07-04 05:53:41.476987','185','Case object (185)',3,'',13,1),(606,'2024-07-04 05:53:41.491447','184','Case object (184)',3,'',13,1),(607,'2024-07-04 05:53:41.517710','183','Case object (183)',3,'',13,1),(608,'2024-07-04 05:53:41.529263','182','Case object (182)',3,'',13,1),(609,'2024-07-04 05:53:41.537356','181','Case object (181)',3,'',13,1),(610,'2024-07-04 05:53:41.545281','180','Case object (180)',3,'',13,1),(611,'2024-07-04 05:53:41.556585','179','Case object (179)',3,'',13,1),(612,'2024-07-04 05:53:41.562730','178','Case object (178)',3,'',13,1),(613,'2024-07-04 05:53:41.568663','177','Case object (177)',3,'',13,1),(614,'2024-07-04 05:53:41.575471','176','Case object (176)',3,'',13,1),(615,'2024-07-04 05:53:41.582215','175','Case object (175)',3,'',13,1),(616,'2024-07-04 05:53:41.588977','174','Case object (174)',3,'',13,1),(617,'2024-07-04 05:53:41.597447','154','Case object (154)',3,'',13,1),(618,'2024-07-04 05:53:41.603077','153','Case object (153)',3,'',13,1),(619,'2024-07-04 05:53:41.609780','152','Case object (152)',3,'',13,1),(620,'2024-07-04 05:53:41.616459','151','Case object (151)',3,'',13,1),(621,'2024-07-04 05:53:41.622506','150','Case object (150)',3,'',13,1),(622,'2024-07-04 05:53:41.637878','149','Case object (149)',3,'',13,1),(623,'2024-07-04 05:53:41.643723','148','Case object (148)',3,'',13,1),(624,'2024-07-04 05:53:41.650876','147','Case object (147)',3,'',13,1),(625,'2024-07-04 05:53:41.657602','146','Case object (146)',3,'',13,1),(626,'2024-07-04 05:53:41.663272','145','Case object (145)',3,'',13,1),(627,'2024-07-04 05:53:41.669586','144','Case object (144)',3,'',13,1),(628,'2024-07-04 05:54:08.774829','143','Case object (143)',3,'',13,1),(629,'2024-07-04 05:54:08.785101','142','Case object (142)',3,'',13,1),(630,'2024-07-04 05:54:08.792368','141','Case object (141)',3,'',13,1),(631,'2024-07-04 05:54:08.799583','140','Case object (140)',3,'',13,1),(632,'2024-07-04 05:54:08.808432','139','Case object (139)',3,'',13,1),(633,'2024-07-04 05:54:08.814306','138','Case object (138)',3,'',13,1),(634,'2024-07-04 05:54:08.820900','137','Case object (137)',3,'',13,1),(635,'2024-07-04 05:54:08.827482','136','Case object (136)',3,'',13,1),(636,'2024-07-04 05:54:08.833454','135','Case object (135)',3,'',13,1),(637,'2024-07-04 05:54:08.840211','134','Case object (134)',3,'',13,1),(638,'2024-07-04 05:54:08.845864','133','Case object (133)',3,'',13,1),(639,'2024-07-04 05:54:08.854950','132','Case object (132)',3,'',13,1),(640,'2024-07-04 05:54:08.860308','131','Case object (131)',3,'',13,1),(641,'2024-07-04 05:54:08.867552','130','Case object (130)',3,'',13,1),(642,'2024-07-04 05:54:08.874563','129','Case object (129)',3,'',13,1),(643,'2024-07-04 05:54:08.887755','128','Case object (128)',3,'',13,1),(644,'2024-07-04 05:54:08.893414','127','Case object (127)',3,'',13,1),(645,'2024-07-04 05:54:08.901869','126','Case object (126)',3,'',13,1),(646,'2024-07-04 05:54:08.908067','125','Case object (125)',3,'',13,1),(647,'2024-07-04 05:54:08.914163','124','Case object (124)',3,'',13,1),(648,'2024-07-04 05:54:08.922048','123','Case object (123)',3,'',13,1),(649,'2024-07-04 05:54:08.930102','122','Case object (122)',3,'',13,1),(650,'2024-07-04 05:54:08.939819','121','Case object (121)',3,'',13,1),(651,'2024-07-04 05:54:08.948005','120','Case object (120)',3,'',13,1),(652,'2024-07-04 05:54:08.954995','119','Case object (119)',3,'',13,1),(653,'2024-07-04 05:54:08.961659','118','Case object (118)',3,'',13,1),(654,'2024-07-04 05:54:08.970093','117','Case object (117)',3,'',13,1),(655,'2024-07-04 05:54:08.977280','116','Case object (116)',3,'',13,1),(656,'2024-07-04 05:54:08.983465','115','Case object (115)',3,'',13,1),(657,'2024-07-04 05:54:08.989377','114','Case object (114)',3,'',13,1),(658,'2024-07-04 05:54:08.997057','113','Case object (113)',3,'',13,1),(659,'2024-07-04 05:54:09.005217','112','Case object (112)',3,'',13,1),(660,'2024-07-04 05:54:09.016402','111','Case object (111)',3,'',13,1),(661,'2024-07-04 05:54:09.026188','110','Case object (110)',3,'',13,1),(662,'2024-07-04 05:54:09.032863','109','Case object (109)',3,'',13,1),(663,'2024-07-04 05:54:09.038463','102','Case object (102)',3,'',13,1),(664,'2024-07-04 05:54:09.047283','101','Case object (101)',3,'',13,1),(665,'2024-07-04 05:54:09.055279','100','Case object (100)',3,'',13,1),(666,'2024-07-04 05:54:09.061929','99','Case object (99)',3,'',13,1),(667,'2024-07-04 05:54:09.068646','98','Case object (98)',3,'',13,1),(668,'2024-07-04 05:54:09.075316','97','Case object (97)',3,'',13,1),(669,'2024-07-04 05:54:09.082309','96','Case object (96)',3,'',13,1),(670,'2024-07-04 05:54:09.088428','95','Case object (95)',3,'',13,1),(671,'2024-07-04 05:54:09.095457','94','Case object (94)',3,'',13,1),(672,'2024-07-04 05:54:09.101991','91','Case object (91)',3,'',13,1),(673,'2024-07-04 05:54:09.107856','90','Case object (90)',3,'',13,1),(674,'2024-07-04 05:54:09.114394','89','Case object (89)',3,'',13,1),(675,'2024-07-04 05:54:09.125905','88','Case object (88)',3,'',13,1),(676,'2024-07-04 05:54:09.133070','87','Case object (87)',3,'',13,1),(677,'2024-07-04 05:54:09.140163','86','Case object (86)',3,'',13,1),(678,'2024-07-04 05:54:09.145652','85','Case object (85)',3,'',13,1),(679,'2024-07-04 05:54:09.153912','84','Case object (84)',3,'',13,1),(680,'2024-07-04 05:54:09.160187','83','Case object (83)',3,'',13,1),(681,'2024-07-04 05:54:09.166553','82','Case object (82)',3,'',13,1),(682,'2024-07-04 05:54:09.176113','81','Case object (81)',3,'',13,1),(683,'2024-07-04 05:54:09.183814','80','Case object (80)',3,'',13,1),(684,'2024-07-04 05:54:09.191928','79','Case object (79)',3,'',13,1),(685,'2024-07-04 05:54:09.197411','78','Case object (78)',3,'',13,1),(686,'2024-07-04 05:54:09.205521','77','Case object (77)',3,'',13,1),(687,'2024-07-04 05:54:09.211015','76','Case object (76)',3,'',13,1),(688,'2024-07-04 05:54:09.217246','75','Case object (75)',3,'',13,1),(689,'2024-07-04 05:54:09.223344','74','Case object (74)',3,'',13,1),(690,'2024-07-04 05:54:09.229073','73','Case object (73)',3,'',13,1),(691,'2024-07-04 05:54:09.235755','72','Case object (72)',3,'',13,1),(692,'2024-07-04 05:54:09.242699','71','Case object (71)',3,'',13,1),(693,'2024-07-04 05:54:09.259903','70','Case object (70)',3,'',13,1),(694,'2024-07-04 05:54:09.265645','69','Case object (69)',3,'',13,1),(695,'2024-07-04 05:54:09.273205','68','Case object (68)',3,'',13,1),(696,'2024-07-04 05:54:09.280018','67','Case object (67)',3,'',13,1),(697,'2024-07-04 05:54:09.285972','66','Case object (66)',3,'',13,1),(698,'2024-07-04 05:54:09.291941','65','Case object (65)',3,'',13,1),(699,'2024-07-04 05:54:09.298155','64','Case object (64)',3,'',13,1),(700,'2024-07-04 05:54:09.309290','63','Case object (63)',3,'',13,1),(701,'2024-07-04 05:54:09.337203','62','Case object (62)',3,'',13,1),(702,'2024-07-04 05:54:09.349315','61','Case object (61)',3,'',13,1),(703,'2024-07-04 05:54:09.365059','60','Case object (60)',3,'',13,1),(704,'2024-07-04 05:54:09.382135','59','Case object (59)',3,'',13,1),(705,'2024-07-04 05:54:09.395341','58','Case object (58)',3,'',13,1),(706,'2024-07-04 05:54:09.406103','57','Case object (57)',3,'',13,1),(707,'2024-07-04 05:54:09.420758','56','Case object (56)',3,'',13,1),(708,'2024-07-04 05:54:09.435654','55','Case object (55)',3,'',13,1),(709,'2024-07-04 05:54:09.447219','54','Case object (54)',3,'',13,1),(710,'2024-07-04 05:54:09.459710','53','Case object (53)',3,'',13,1),(711,'2024-07-04 05:54:09.476149','52','Case object (52)',3,'',13,1),(712,'2024-07-04 05:54:09.500428','51','Case object (51)',3,'',13,1),(713,'2024-07-04 05:54:09.510644','50','Case object (50)',3,'',13,1),(714,'2024-07-04 05:54:09.521362','49','Case object (49)',3,'',13,1),(715,'2024-07-04 05:54:09.527398','48','Case object (48)',3,'',13,1),(716,'2024-07-04 05:54:09.534004','47','Case object (47)',3,'',13,1),(717,'2024-07-04 05:54:09.540485','46','Case object (46)',3,'',13,1),(718,'2024-07-04 05:54:09.547318','45','Case object (45)',3,'',13,1),(719,'2024-07-04 05:54:09.556388','40','Case object (40)',3,'',13,1),(720,'2024-07-04 05:54:09.563573','34','Case object (34)',3,'',13,1),(721,'2024-07-04 05:54:09.569433','3','Case object (3)',3,'',13,1),(722,'2024-07-04 05:56:04.432327','2','Case object (2)',3,'',13,1),(723,'2024-07-04 05:56:04.442799','1','Case object (1)',3,'',13,1),(724,'2024-07-04 05:56:38.381092','282','FileUpload object (282)',3,'',25,1),(725,'2024-07-04 05:56:38.388553','281','FileUpload object (281)',3,'',25,1),(726,'2024-07-04 05:56:38.396011','280','FileUpload object (280)',3,'',25,1),(727,'2024-07-04 05:56:38.403111','279','FileUpload object (279)',3,'',25,1),(728,'2024-07-04 05:56:38.408986','278','FileUpload object (278)',3,'',25,1),(729,'2024-07-04 05:56:38.415268','277','FileUpload object (277)',3,'',25,1),(730,'2024-07-04 05:56:38.420592','276','FileUpload object (276)',3,'',25,1),(731,'2024-07-04 05:56:38.428827','275','FileUpload object (275)',3,'',25,1),(732,'2024-07-04 05:56:38.434098','274','FileUpload object (274)',3,'',25,1),(733,'2024-07-04 05:56:38.439667','273','FileUpload object (273)',3,'',25,1),(734,'2024-07-04 05:56:38.446753','272','FileUpload object (272)',3,'',25,1),(735,'2024-07-04 05:56:38.454716','271','FileUpload object (271)',3,'',25,1),(736,'2024-07-04 05:56:38.461321','270','FileUpload object (270)',3,'',25,1),(737,'2024-07-04 05:56:38.467257','269','FileUpload object (269)',3,'',25,1),(738,'2024-07-04 05:56:38.475548','268','FileUpload object (268)',3,'',25,1),(739,'2024-07-04 05:56:38.482237','267','FileUpload object (267)',3,'',25,1),(740,'2024-07-04 05:56:38.488093','266','FileUpload object (266)',3,'',25,1),(741,'2024-07-04 05:56:38.496004','265','FileUpload object (265)',3,'',25,1),(742,'2024-07-04 05:56:38.503363','264','FileUpload object (264)',3,'',25,1),(743,'2024-07-04 05:56:38.510545','263','FileUpload object (263)',3,'',25,1),(744,'2024-07-04 05:56:38.518151','262','FileUpload object (262)',3,'',25,1),(745,'2024-07-04 05:56:38.525999','261','FileUpload object (261)',3,'',25,1),(746,'2024-07-04 05:56:38.536454','260','FileUpload object (260)',3,'',25,1),(747,'2024-07-04 05:56:38.544701','259','FileUpload object (259)',3,'',25,1),(748,'2024-07-04 05:56:38.550817','258','FileUpload object (258)',3,'',25,1),(749,'2024-07-04 05:56:38.558764','257','FileUpload object (257)',3,'',25,1),(750,'2024-07-04 05:56:38.566978','256','FileUpload object (256)',3,'',25,1),(751,'2024-07-04 05:56:38.574685','255','FileUpload object (255)',3,'',25,1),(752,'2024-07-04 05:56:38.589696','254','FileUpload object (254)',3,'',25,1),(753,'2024-07-04 05:56:38.598338','253','FileUpload object (253)',3,'',25,1),(754,'2024-07-04 05:56:38.606233','252','FileUpload object (252)',3,'',25,1),(755,'2024-07-04 05:56:38.613288','251','FileUpload object (251)',3,'',25,1),(756,'2024-07-04 05:56:38.619501','250','FileUpload object (250)',3,'',25,1),(757,'2024-07-04 05:56:38.632529','249','FileUpload object (249)',3,'',25,1),(758,'2024-07-04 05:56:38.638238','248','FileUpload object (248)',3,'',25,1),(759,'2024-07-04 05:56:38.645805','247','FileUpload object (247)',3,'',25,1),(760,'2024-07-04 05:56:38.655104','246','FileUpload object (246)',3,'',25,1),(761,'2024-07-04 05:56:38.661744','245','FileUpload object (245)',3,'',25,1),(762,'2024-07-04 05:56:38.668811','244','FileUpload object (244)',3,'',25,1),(763,'2024-07-04 05:56:38.675005','243','FileUpload object (243)',3,'',25,1),(764,'2024-07-04 05:56:38.684915','242','FileUpload object (242)',3,'',25,1),(765,'2024-07-04 05:56:38.699203','241','FileUpload object (241)',3,'',25,1),(766,'2024-07-04 05:56:38.706785','240','FileUpload object (240)',3,'',25,1),(767,'2024-07-04 05:56:38.715447','239','FileUpload object (239)',3,'',25,1),(768,'2024-07-04 05:56:38.725654','238','FileUpload object (238)',3,'',25,1),(769,'2024-07-04 05:56:38.735661','237','FileUpload object (237)',3,'',25,1),(770,'2024-07-04 05:56:38.743488','236','FileUpload object (236)',3,'',25,1),(771,'2024-07-04 05:56:38.751308','235','FileUpload object (235)',3,'',25,1),(772,'2024-07-04 05:56:38.759483','234','FileUpload object (234)',3,'',25,1),(773,'2024-07-04 05:56:38.765879','233','FileUpload object (233)',3,'',25,1),(774,'2024-07-04 05:56:38.772370','232','FileUpload object (232)',3,'',25,1),(775,'2024-07-04 05:56:38.777909','231','FileUpload object (231)',3,'',25,1),(776,'2024-07-04 05:56:38.785169','230','FileUpload object (230)',3,'',25,1),(777,'2024-07-04 05:56:38.792341','229','FileUpload object (229)',3,'',25,1),(778,'2024-07-04 05:56:38.799664','228','FileUpload object (228)',3,'',25,1),(779,'2024-07-04 05:56:38.807350','227','FileUpload object (227)',3,'',25,1),(780,'2024-07-04 05:56:38.815435','226','FileUpload object (226)',3,'',25,1),(781,'2024-07-04 05:56:38.826992','225','FileUpload object (225)',3,'',25,1),(782,'2024-07-04 05:56:38.835131','224','FileUpload object (224)',3,'',25,1),(783,'2024-07-04 05:56:38.842635','223','FileUpload object (223)',3,'',25,1),(784,'2024-07-04 05:56:38.851261','222','FileUpload object (222)',3,'',25,1),(785,'2024-07-04 05:56:38.860116','221','FileUpload object (221)',3,'',25,1),(786,'2024-07-04 05:56:38.868228','220','FileUpload object (220)',3,'',25,1),(787,'2024-07-04 05:56:38.877094','219','FileUpload object (219)',3,'',25,1),(788,'2024-07-04 05:56:38.884696','218','FileUpload object (218)',3,'',25,1),(789,'2024-07-04 05:56:38.893288','217','FileUpload object (217)',3,'',25,1),(790,'2024-07-04 05:56:38.899193','216','FileUpload object (216)',3,'',25,1),(791,'2024-07-04 05:56:38.906598','215','FileUpload object (215)',3,'',25,1),(792,'2024-07-04 05:56:38.915391','214','FileUpload object (214)',3,'',25,1),(793,'2024-07-04 05:56:38.922207','213','FileUpload object (213)',3,'',25,1),(794,'2024-07-04 05:56:38.929559','212','FileUpload object (212)',3,'',25,1),(795,'2024-07-04 05:56:38.934942','211','FileUpload object (211)',3,'',25,1),(796,'2024-07-04 05:56:38.942870','210','FileUpload object (210)',3,'',25,1),(797,'2024-07-04 05:56:38.949850','209','FileUpload object (209)',3,'',25,1),(798,'2024-07-04 05:56:38.958677','208','FileUpload object (208)',3,'',25,1),(799,'2024-07-04 05:56:38.966369','207','FileUpload object (207)',3,'',25,1),(800,'2024-07-04 05:56:38.975590','206','FileUpload object (206)',3,'',25,1),(801,'2024-07-04 05:56:38.981639','205','FileUpload object (205)',3,'',25,1),(802,'2024-07-04 05:56:38.988690','204','FileUpload object (204)',3,'',25,1),(803,'2024-07-04 05:56:38.996625','203','FileUpload object (203)',3,'',25,1),(804,'2024-07-04 05:56:39.003529','202','FileUpload object (202)',3,'',25,1),(805,'2024-07-04 05:56:39.014064','201','FileUpload object (201)',3,'',25,1),(806,'2024-07-04 05:56:39.026457','200','FileUpload object (200)',3,'',25,1),(807,'2024-07-04 05:56:39.033537','199','FileUpload object (199)',3,'',25,1),(808,'2024-07-04 05:56:39.041619','198','FileUpload object (198)',3,'',25,1),(809,'2024-07-04 05:56:39.047584','197','FileUpload object (197)',3,'',25,1),(810,'2024-07-04 05:56:39.057128','196','FileUpload object (196)',3,'',25,1),(811,'2024-07-04 05:56:39.066350','195','FileUpload object (195)',3,'',25,1),(812,'2024-07-04 05:56:39.074510','194','FileUpload object (194)',3,'',25,1),(813,'2024-07-04 05:56:39.081246','193','FileUpload object (193)',3,'',25,1),(814,'2024-07-04 05:56:39.088813','192','FileUpload object (192)',3,'',25,1),(815,'2024-07-04 05:56:39.097489','191','FileUpload object (191)',3,'',25,1),(816,'2024-07-04 05:56:39.104328','190','FileUpload object (190)',3,'',25,1),(817,'2024-07-04 05:56:39.110866','189','FileUpload object (189)',3,'',25,1),(818,'2024-07-04 05:56:39.120882','188','FileUpload object (188)',3,'',25,1),(819,'2024-07-04 05:56:39.127465','187','FileUpload object (187)',3,'',25,1),(820,'2024-07-04 05:56:39.135395','186','FileUpload object (186)',3,'',25,1),(821,'2024-07-04 05:56:39.141962','185','FileUpload object (185)',3,'',25,1),(822,'2024-07-04 05:56:39.147224','184','FileUpload object (184)',3,'',25,1),(823,'2024-07-04 05:56:39.153086','183','FileUpload object (183)',3,'',25,1),(824,'2024-07-04 05:56:48.004121','182','FileUpload object (182)',3,'',25,1),(825,'2024-07-04 05:56:48.026521','181','FileUpload object (181)',3,'',25,1),(826,'2024-07-04 05:56:48.033043','180','FileUpload object (180)',3,'',25,1),(827,'2024-07-04 05:56:48.040040','179','FileUpload object (179)',3,'',25,1),(828,'2024-07-04 05:56:48.046290','178','FileUpload object (178)',3,'',25,1),(829,'2024-07-04 05:56:48.052344','177','FileUpload object (177)',3,'',25,1),(830,'2024-07-04 05:56:48.059039','176','FileUpload object (176)',3,'',25,1),(831,'2024-07-04 05:56:48.067368','175','FileUpload object (175)',3,'',25,1),(832,'2024-07-04 05:56:48.074550','174','FileUpload object (174)',3,'',25,1),(833,'2024-07-04 05:56:48.080682','173','FileUpload object (173)',3,'',25,1),(834,'2024-07-04 05:56:48.086842','172','FileUpload object (172)',3,'',25,1),(835,'2024-07-04 05:56:48.093155','171','FileUpload object (171)',3,'',25,1),(836,'2024-07-04 05:56:48.099805','170','FileUpload object (170)',3,'',25,1),(837,'2024-07-04 05:56:48.106212','169','FileUpload object (169)',3,'',25,1),(838,'2024-07-04 05:56:48.112342','168','FileUpload object (168)',3,'',25,1),(839,'2024-07-04 05:56:48.118688','167','FileUpload object (167)',3,'',25,1),(840,'2024-07-04 05:56:48.128492','166','FileUpload object (166)',3,'',25,1),(841,'2024-07-04 05:56:48.138717','165','FileUpload object (165)',3,'',25,1),(842,'2024-07-04 05:56:48.146810','164','FileUpload object (164)',3,'',25,1),(843,'2024-07-04 05:56:48.153046','163','FileUpload object (163)',3,'',25,1),(844,'2024-07-04 05:56:48.159264','162','FileUpload object (162)',3,'',25,1),(845,'2024-07-04 05:56:48.171476','161','FileUpload object (161)',3,'',25,1),(846,'2024-07-04 05:56:48.177615','160','FileUpload object (160)',3,'',25,1),(847,'2024-07-04 05:56:48.184491','159','FileUpload object (159)',3,'',25,1),(848,'2024-07-04 05:56:48.190878','158','FileUpload object (158)',3,'',25,1),(849,'2024-07-04 05:56:48.197039','157','FileUpload object (157)',3,'',25,1),(850,'2024-07-04 05:56:48.203118','156','FileUpload object (156)',3,'',25,1),(851,'2024-07-04 05:56:48.209348','155','FileUpload object (155)',3,'',25,1),(852,'2024-07-04 05:56:48.215860','154','FileUpload object (154)',3,'',25,1),(853,'2024-07-04 05:56:48.224743','153','FileUpload object (153)',3,'',25,1),(854,'2024-07-04 05:56:48.231685','152','FileUpload object (152)',3,'',25,1),(855,'2024-07-04 05:56:48.239865','151','FileUpload object (151)',3,'',25,1),(856,'2024-07-04 05:56:48.246250','150','FileUpload object (150)',3,'',25,1),(857,'2024-07-04 05:56:48.253829','149','FileUpload object (149)',3,'',25,1),(858,'2024-07-04 05:56:48.261118','148','FileUpload object (148)',3,'',25,1),(859,'2024-07-04 05:56:48.271787','147','FileUpload object (147)',3,'',25,1),(860,'2024-07-04 05:56:48.277462','146','FileUpload object (146)',3,'',25,1),(861,'2024-07-04 05:56:48.285639','145','FileUpload object (145)',3,'',25,1),(862,'2024-07-04 05:56:48.291897','144','FileUpload object (144)',3,'',25,1),(863,'2024-07-04 05:56:48.297394','143','FileUpload object (143)',3,'',25,1),(864,'2024-07-04 05:56:48.304596','142','FileUpload object (142)',3,'',25,1),(865,'2024-07-04 05:56:48.311332','141','FileUpload object (141)',3,'',25,1),(866,'2024-07-04 05:56:48.317607','140','FileUpload object (140)',3,'',25,1),(867,'2024-07-04 05:56:48.323905','139','FileUpload object (139)',3,'',25,1),(868,'2024-07-04 05:56:48.331393','138','FileUpload object (138)',3,'',25,1),(869,'2024-07-04 05:56:48.349937','137','FileUpload object (137)',3,'',25,1),(870,'2024-07-04 05:56:48.378424','136','FileUpload object (136)',3,'',25,1),(871,'2024-07-04 05:56:48.391168','135','FileUpload object (135)',3,'',25,1),(872,'2024-07-04 05:56:48.401441','134','FileUpload object (134)',3,'',25,1),(873,'2024-07-04 05:56:48.415288','133','FileUpload object (133)',3,'',25,1),(874,'2024-07-04 05:56:48.428243','132','FileUpload object (132)',3,'',25,1),(875,'2024-07-04 05:56:48.438559','131','FileUpload object (131)',3,'',25,1),(876,'2024-07-04 05:56:48.451572','130','FileUpload object (130)',3,'',25,1),(877,'2024-07-04 05:56:48.460610','129','FileUpload object (129)',3,'',25,1),(878,'2024-07-04 05:56:48.469059','128','FileUpload object (128)',3,'',25,1),(879,'2024-07-04 05:56:48.491381','127','FileUpload object (127)',3,'',25,1),(880,'2024-07-04 05:56:48.498009','126','FileUpload object (126)',3,'',25,1),(881,'2024-07-04 05:56:48.504725','125','FileUpload object (125)',3,'',25,1),(882,'2024-07-04 05:56:48.510980','124','FileUpload object (124)',3,'',25,1),(883,'2024-07-04 05:56:48.516994','123','FileUpload object (123)',3,'',25,1),(884,'2024-07-04 05:56:48.524598','122','FileUpload object (122)',3,'',25,1),(885,'2024-07-04 05:56:48.531853','121','FileUpload object (121)',3,'',25,1),(886,'2024-07-04 05:56:48.537332','120','FileUpload object (120)',3,'',25,1),(887,'2024-07-04 05:56:48.544246','119','FileUpload object (119)',3,'',25,1),(888,'2024-07-04 05:56:48.550083','118','FileUpload object (118)',3,'',25,1),(889,'2024-07-04 05:56:48.556404','117','FileUpload object (117)',3,'',25,1),(890,'2024-07-04 05:56:48.563140','116','FileUpload object (116)',3,'',25,1),(891,'2024-07-04 05:56:48.568879','115','FileUpload object (115)',3,'',25,1),(892,'2024-07-04 05:56:48.576220','114','FileUpload object (114)',3,'',25,1),(893,'2024-07-04 05:56:48.582549','113','FileUpload object (113)',3,'',25,1),(894,'2024-07-04 05:56:48.589913','112','FileUpload object (112)',3,'',25,1),(895,'2024-07-04 05:56:48.604774','111','FileUpload object (111)',3,'',25,1),(896,'2024-07-04 05:56:48.611764','110','FileUpload object (110)',3,'',25,1),(897,'2024-07-04 05:56:48.619447','109','FileUpload object (109)',3,'',25,1),(898,'2024-07-04 05:56:48.628273','108','FileUpload object (108)',3,'',25,1),(899,'2024-07-04 05:56:48.633706','107','FileUpload object (107)',3,'',25,1),(900,'2024-07-04 05:56:48.640151','106','FileUpload object (106)',3,'',25,1),(901,'2024-07-04 05:56:48.645636','105','FileUpload object (105)',3,'',25,1),(902,'2024-07-04 05:56:48.652529','104','FileUpload object (104)',3,'',25,1),(903,'2024-07-04 05:56:48.659176','103','FileUpload object (103)',3,'',25,1),(904,'2024-07-04 05:56:48.665257','102','FileUpload object (102)',3,'',25,1),(905,'2024-07-04 05:56:48.672422','101','FileUpload object (101)',3,'',25,1),(906,'2024-07-04 05:56:48.678300','100','FileUpload object (100)',3,'',25,1),(907,'2024-07-04 05:56:48.684595','99','FileUpload object (99)',3,'',25,1),(908,'2024-07-04 05:56:48.690292','98','FileUpload object (98)',3,'',25,1),(909,'2024-07-04 05:56:48.696653','97','FileUpload object (97)',3,'',25,1),(910,'2024-07-04 05:56:48.701911','96','FileUpload object (96)',3,'',25,1),(911,'2024-07-04 05:56:48.708297','95','FileUpload object (95)',3,'',25,1),(912,'2024-07-04 05:56:48.722723','94','FileUpload object (94)',3,'',25,1),(913,'2024-07-04 05:56:48.736410','93','FileUpload object (93)',3,'',25,1),(914,'2024-07-04 05:56:48.742750','92','FileUpload object (92)',3,'',25,1),(915,'2024-07-04 05:56:48.749746','91','FileUpload object (91)',3,'',25,1),(916,'2024-07-04 05:56:48.757940','90','FileUpload object (90)',3,'',25,1),(917,'2024-07-04 05:56:48.770731','89','FileUpload object (89)',3,'',25,1),(918,'2024-07-04 05:56:48.778748','88','FileUpload object (88)',3,'',25,1),(919,'2024-07-04 05:56:48.786050','87','FileUpload object (87)',3,'',25,1),(920,'2024-07-04 05:56:48.792754','86','FileUpload object (86)',3,'',25,1),(921,'2024-07-04 05:56:48.799359','85','FileUpload object (85)',3,'',25,1),(922,'2024-07-04 05:56:48.805430','84','FileUpload object (84)',3,'',25,1),(923,'2024-07-04 05:56:48.811968','83','FileUpload object (83)',3,'',25,1),(924,'2024-07-04 05:57:01.886394','82','FileUpload object (82)',3,'',25,1),(925,'2024-07-04 05:57:01.896109','81','FileUpload object (81)',3,'',25,1),(926,'2024-07-04 05:57:01.906399','80','FileUpload object (80)',3,'',25,1),(927,'2024-07-04 05:57:01.915203','79','FileUpload object (79)',3,'',25,1),(928,'2024-07-04 05:57:01.921282','78','FileUpload object (78)',3,'',25,1),(929,'2024-07-04 05:57:01.930521','77','FileUpload object (77)',3,'',25,1),(930,'2024-07-04 05:57:01.954267','76','FileUpload object (76)',3,'',25,1),(931,'2024-07-04 05:57:01.960790','75','FileUpload object (75)',3,'',25,1),(932,'2024-07-04 05:57:01.966679','74','FileUpload object (74)',3,'',25,1),(933,'2024-07-04 05:57:01.974449','73','FileUpload object (73)',3,'',25,1),(934,'2024-07-04 05:57:01.983603','72','FileUpload object (72)',3,'',25,1),(935,'2024-07-04 05:57:01.991812','71','FileUpload object (71)',3,'',25,1),(936,'2024-07-04 05:57:02.012146','70','FileUpload object (70)',3,'',25,1),(937,'2024-07-04 05:57:02.020362','69','FileUpload object (69)',3,'',25,1),(938,'2024-07-04 05:57:02.028260','68','FileUpload object (68)',3,'',25,1),(939,'2024-07-04 05:57:02.037376','67','FileUpload object (67)',3,'',25,1),(940,'2024-07-04 05:57:02.044607','66','FileUpload object (66)',3,'',25,1),(941,'2024-07-04 05:57:02.055580','65','FileUpload object (65)',3,'',25,1),(942,'2024-07-04 05:57:02.063643','64','FileUpload object (64)',3,'',25,1),(943,'2024-07-04 05:57:02.072477','63','FileUpload object (63)',3,'',25,1),(944,'2024-07-04 05:57:02.084756','62','FileUpload object (62)',3,'',25,1),(945,'2024-07-04 05:57:02.091967','61','FileUpload object (61)',3,'',25,1),(946,'2024-07-04 05:57:02.098680','60','FileUpload object (60)',3,'',25,1),(947,'2024-07-04 05:57:02.106021','59','FileUpload object (59)',3,'',25,1),(948,'2024-07-04 05:57:02.112828','58','FileUpload object (58)',3,'',25,1),(949,'2024-07-04 05:57:02.125216','57','FileUpload object (57)',3,'',25,1),(950,'2024-07-04 05:57:02.132560','56','FileUpload object (56)',3,'',25,1),(951,'2024-07-04 05:57:02.140016','55','FileUpload object (55)',3,'',25,1),(952,'2024-07-04 05:57:02.151834','54','FileUpload object (54)',3,'',25,1),(953,'2024-07-04 05:57:02.159095','53','FileUpload object (53)',3,'',25,1),(954,'2024-07-04 05:57:02.167051','52','FileUpload object (52)',3,'',25,1),(955,'2024-07-04 05:57:02.173220','51','FileUpload object (51)',3,'',25,1),(956,'2024-07-04 05:57:02.183023','50','FileUpload object (50)',3,'',25,1),(957,'2024-07-04 05:57:02.189419','49','FileUpload object (49)',3,'',25,1),(958,'2024-07-04 05:57:02.195725','48','FileUpload object (48)',3,'',25,1),(959,'2024-07-04 05:57:02.201835','47','FileUpload object (47)',3,'',25,1),(960,'2024-07-04 05:57:02.209324','46','FileUpload object (46)',3,'',25,1),(961,'2024-07-04 05:57:02.216032','45','FileUpload object (45)',3,'',25,1),(962,'2024-07-04 05:57:02.231457','44','FileUpload object (44)',3,'',25,1),(963,'2024-07-04 05:57:02.239049','43','FileUpload object (43)',3,'',25,1),(964,'2024-07-04 05:57:02.249029','42','FileUpload object (42)',3,'',25,1),(965,'2024-07-04 05:57:02.256790','41','FileUpload object (41)',3,'',25,1),(966,'2024-07-04 05:57:02.264052','40','FileUpload object (40)',3,'',25,1),(967,'2024-07-04 05:57:02.272903','39','FileUpload object (39)',3,'',25,1),(968,'2024-07-04 05:57:02.279435','38','FileUpload object (38)',3,'',25,1),(969,'2024-07-04 05:57:02.286889','37','FileUpload object (37)',3,'',25,1),(970,'2024-07-04 05:57:02.295215','36','FileUpload object (36)',3,'',25,1),(971,'2024-07-04 05:57:02.300750','35','FileUpload object (35)',3,'',25,1),(972,'2024-07-04 05:57:02.311556','34','FileUpload object (34)',3,'',25,1),(973,'2024-07-04 05:57:02.317884','33','FileUpload object (33)',3,'',25,1),(974,'2024-07-04 05:57:02.325561','32','FileUpload object (32)',3,'',25,1),(975,'2024-07-04 05:57:02.347099','31','FileUpload object (31)',3,'',25,1),(976,'2024-07-04 05:57:02.360486','30','FileUpload object (30)',3,'',25,1),(977,'2024-07-04 05:57:02.374110','29','FileUpload object (29)',3,'',25,1),(978,'2024-07-04 05:57:02.389548','28','FileUpload object (28)',3,'',25,1),(979,'2024-07-04 05:57:02.402017','27','FileUpload object (27)',3,'',25,1),(980,'2024-07-04 05:57:02.422387','26','FileUpload object (26)',3,'',25,1),(981,'2024-07-04 05:57:02.435553','25','FileUpload object (25)',3,'',25,1),(982,'2024-07-04 05:57:02.454181','24','FileUpload object (24)',3,'',25,1),(983,'2024-07-04 05:57:02.480253','23','FileUpload object (23)',3,'',25,1),(984,'2024-07-04 05:57:02.493264','22','FileUpload object (22)',3,'',25,1),(985,'2024-07-04 05:57:02.504768','21','FileUpload object (21)',3,'',25,1),(986,'2024-07-04 05:57:02.513811','20','FileUpload object (20)',3,'',25,1),(987,'2024-07-04 05:57:02.521011','19','FileUpload object (19)',3,'',25,1),(988,'2024-07-04 05:57:02.528102','18','FileUpload object (18)',3,'',25,1),(989,'2024-07-04 05:57:02.536865','17','FileUpload object (17)',3,'',25,1),(990,'2024-07-04 05:57:02.543935','16','FileUpload object (16)',3,'',25,1),(991,'2024-07-04 05:57:02.553274','15','FileUpload object (15)',3,'',25,1),(992,'2024-07-04 05:57:02.559508','14','FileUpload object (14)',3,'',25,1),(993,'2024-07-04 05:57:02.565789','13','FileUpload object (13)',3,'',25,1),(994,'2024-07-04 05:57:02.571537','12','FileUpload object (12)',3,'',25,1),(995,'2024-07-04 05:57:02.579439','11','FileUpload object (11)',3,'',25,1),(996,'2024-07-04 05:57:02.587198','10','FileUpload object (10)',3,'',25,1),(997,'2024-07-04 05:57:02.595106','9','FileUpload object (9)',3,'',25,1),(998,'2024-07-04 05:57:02.604447','8','FileUpload object (8)',3,'',25,1),(999,'2024-07-04 05:57:02.612417','7','FileUpload object (7)',3,'',25,1),(1000,'2024-07-04 05:57:02.619968','6','FileUpload object (6)',3,'',25,1),(1001,'2024-07-04 05:57:02.627537','5','FileUpload object (5)',3,'',25,1),(1002,'2024-07-04 05:57:02.636722','4','FileUpload object (4)',3,'',25,1),(1003,'2024-07-04 05:57:02.643898','3','FileUpload object (3)',3,'',25,1),(1004,'2024-07-04 05:57:02.650755','2','FileUpload object (2)',3,'',25,1),(1005,'2024-07-04 05:57:02.656812','1','FileUpload object (1)',3,'',25,1),(1006,'2024-07-04 06:03:28.486156','27','nisha.rangan@okirana.com',2,'[{\"changed\": {\"fields\": [\"User role\"]}}]',10,1),(1007,'2024-07-04 06:07:21.943024','134','4124bac03d0d93714faaa053d17bebfc3754ccab',3,'',7,1),(1008,'2024-07-04 06:07:45.015676','168','3f065c588befe00bc97e9adb2640e0112e49ad3a',3,'',7,1),(1009,'2024-07-04 06:28:12.350094','373','Case object (373)',3,'',13,1),(1010,'2024-07-05 10:57:38.227215','375','Case object (375)',2,'[{\"changed\": {\"fields\": [\"Approval status\"]}}]',13,1),(1011,'2024-07-08 07:24:07.133424','1034','CasePurpose object (1034)',3,'',14,1),(1012,'2024-07-08 07:24:07.146872','1033','CasePurpose object (1033)',3,'',14,1),(1013,'2024-07-08 07:24:07.152466','1032','CasePurpose object (1032)',3,'',14,1),(1014,'2024-07-08 08:25:41.445454','344','None',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(1015,'2024-07-08 09:08:10.270129','344','None',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(1016,'2024-07-08 09:48:09.526937','344','None',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(1017,'2024-07-08 09:51:45.217832','374','Case object (374)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1018,'2024-07-09 12:47:52.311778','1091','CasePurpose object (1091)',3,'',14,1),(1019,'2024-07-09 12:47:52.322993','1090','CasePurpose object (1090)',3,'',14,1),(1020,'2024-07-09 12:47:52.329476','1089','CasePurpose object (1089)',3,'',14,1),(1021,'2024-07-09 12:48:01.359094','377','Case object (377)',3,'',13,1),(1022,'2024-07-09 13:06:42.469862','1037','CasePurpose object (1037)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1023,'2024-07-09 13:08:39.129867','1037','CasePurpose object (1037)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1024,'2024-07-09 13:11:38.180750','1037','CasePurpose object (1037)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1025,'2024-07-10 03:04:29.996653','1157','CasePurpose object (1157)',3,'',14,1),(1026,'2024-07-10 03:04:30.005622','1156','CasePurpose object (1156)',3,'',14,1),(1027,'2024-07-10 03:04:30.011633','1155','CasePurpose object (1155)',3,'',14,1),(1028,'2024-07-10 03:04:30.019125','1154','CasePurpose object (1154)',3,'',14,1),(1029,'2024-07-10 03:04:30.026996','1153','CasePurpose object (1153)',3,'',14,1),(1030,'2024-07-10 03:04:30.052082','1152','CasePurpose object (1152)',3,'',14,1),(1031,'2024-07-10 03:04:30.060096','1151','CasePurpose object (1151)',3,'',14,1),(1032,'2024-07-10 03:04:30.067736','1150','CasePurpose object (1150)',3,'',14,1),(1033,'2024-07-10 03:04:30.075761','1149','CasePurpose object (1149)',3,'',14,1),(1034,'2024-07-10 03:04:30.087298','1148','CasePurpose object (1148)',3,'',14,1),(1035,'2024-07-10 03:04:30.096195','1147','CasePurpose object (1147)',3,'',14,1),(1036,'2024-07-10 03:04:30.103404','1146','CasePurpose object (1146)',3,'',14,1),(1037,'2024-07-10 03:04:30.109791','1145','CasePurpose object (1145)',3,'',14,1),(1038,'2024-07-10 03:04:30.116128','1144','CasePurpose object (1144)',3,'',14,1),(1039,'2024-07-10 03:04:30.123421','1143','CasePurpose object (1143)',3,'',14,1),(1040,'2024-07-10 03:04:30.130090','1142','CasePurpose object (1142)',3,'',14,1),(1041,'2024-07-10 03:04:30.136848','1141','CasePurpose object (1141)',3,'',14,1),(1042,'2024-07-10 03:04:30.144481','1140','CasePurpose object (1140)',3,'',14,1),(1043,'2024-07-10 03:04:30.170329','1139','CasePurpose object (1139)',3,'',14,1),(1044,'2024-07-10 03:04:30.177361','1138','CasePurpose object (1138)',3,'',14,1),(1045,'2024-07-10 03:04:30.183998','1137','CasePurpose object (1137)',3,'',14,1),(1046,'2024-07-10 03:04:30.191155','1136','CasePurpose object (1136)',3,'',14,1),(1047,'2024-07-10 03:04:30.197782','1135','CasePurpose object (1135)',3,'',14,1),(1048,'2024-07-10 03:04:30.204178','1134','CasePurpose object (1134)',3,'',14,1),(1049,'2024-07-10 03:04:30.209885','1133','CasePurpose object (1133)',3,'',14,1),(1050,'2024-07-10 03:04:30.216604','1132','CasePurpose object (1132)',3,'',14,1),(1051,'2024-07-10 03:04:30.222965','1131','CasePurpose object (1131)',3,'',14,1),(1052,'2024-07-10 03:04:30.228752','1130','CasePurpose object (1130)',3,'',14,1),(1053,'2024-07-10 03:04:30.235587','1129','CasePurpose object (1129)',3,'',14,1),(1054,'2024-07-10 03:04:30.241659','1128','CasePurpose object (1128)',3,'',14,1),(1055,'2024-07-10 03:04:30.248882','1127','CasePurpose object (1127)',3,'',14,1),(1056,'2024-07-10 03:04:30.261243','1126','CasePurpose object (1126)',3,'',14,1),(1057,'2024-07-10 03:04:30.268962','1125','CasePurpose object (1125)',3,'',14,1),(1058,'2024-07-10 03:04:30.304618','1124','CasePurpose object (1124)',3,'',14,1),(1059,'2024-07-10 03:04:30.352496','1123','CasePurpose object (1123)',3,'',14,1),(1060,'2024-07-10 03:04:30.404202','1122','CasePurpose object (1122)',3,'',14,1),(1061,'2024-07-10 03:04:30.466580','1121','CasePurpose object (1121)',3,'',14,1),(1062,'2024-07-10 03:04:30.557495','1120','CasePurpose object (1120)',3,'',14,1),(1063,'2024-07-10 03:04:30.627382','1119','CasePurpose object (1119)',3,'',14,1),(1064,'2024-07-10 03:04:30.641308','1118','CasePurpose object (1118)',3,'',14,1),(1065,'2024-07-10 03:04:30.651621','1117','CasePurpose object (1117)',3,'',14,1),(1066,'2024-07-10 03:04:30.665067','1116','CasePurpose object (1116)',3,'',14,1),(1067,'2024-07-10 03:04:30.678273','1115','CasePurpose object (1115)',3,'',14,1),(1068,'2024-07-10 03:04:30.692075','1114','CasePurpose object (1114)',3,'',14,1),(1069,'2024-07-10 03:04:30.707423','1113','CasePurpose object (1113)',3,'',14,1),(1070,'2024-07-10 03:04:30.732336','1112','CasePurpose object (1112)',3,'',14,1),(1071,'2024-07-10 03:04:30.741761','1111','CasePurpose object (1111)',3,'',14,1),(1072,'2024-07-10 03:04:30.749411','1110','CasePurpose object (1110)',3,'',14,1),(1073,'2024-07-10 03:04:30.757038','1109','CasePurpose object (1109)',3,'',14,1),(1074,'2024-07-10 03:04:30.763776','1108','CasePurpose object (1108)',3,'',14,1),(1075,'2024-07-10 03:04:30.774606','1107','CasePurpose object (1107)',3,'',14,1),(1076,'2024-07-10 03:04:30.781143','1106','CasePurpose object (1106)',3,'',14,1),(1077,'2024-07-10 03:04:30.787233','1105','CasePurpose object (1105)',3,'',14,1),(1078,'2024-07-10 03:04:30.794295','1104','CasePurpose object (1104)',3,'',14,1),(1079,'2024-07-10 03:04:30.800558','1103','CasePurpose object (1103)',3,'',14,1),(1080,'2024-07-10 03:04:30.806187','1102','CasePurpose object (1102)',3,'',14,1),(1081,'2024-07-10 03:04:30.813826','1101','CasePurpose object (1101)',3,'',14,1),(1082,'2024-07-10 03:04:30.821382','1100','CasePurpose object (1100)',3,'',14,1),(1083,'2024-07-10 03:04:30.829729','1099','CasePurpose object (1099)',3,'',14,1),(1084,'2024-07-10 03:04:30.836189','1098','CasePurpose object (1098)',3,'',14,1),(1085,'2024-07-10 03:04:30.842872','1097','CasePurpose object (1097)',3,'',14,1),(1086,'2024-07-10 03:04:30.850159','1096','CasePurpose object (1096)',3,'',14,1),(1087,'2024-07-10 03:04:30.857070','1095','CasePurpose object (1095)',3,'',14,1),(1088,'2024-07-10 03:04:30.863700','1094','CasePurpose object (1094)',3,'',14,1),(1089,'2024-07-10 03:04:30.871357','1093','CasePurpose object (1093)',3,'',14,1),(1090,'2024-07-10 03:04:30.878096','1092','CasePurpose object (1092)',3,'',14,1),(1091,'2024-07-10 03:04:30.883439','1088','CasePurpose object (1088)',3,'',14,1),(1092,'2024-07-10 03:04:30.889845','1087','CasePurpose object (1087)',3,'',14,1),(1093,'2024-07-10 03:04:30.898137','1086','CasePurpose object (1086)',3,'',14,1),(1094,'2024-07-10 03:04:30.904672','1085','CasePurpose object (1085)',3,'',14,1),(1095,'2024-07-10 03:04:30.911215','1084','CasePurpose object (1084)',3,'',14,1),(1096,'2024-07-10 03:04:30.918215','1083','CasePurpose object (1083)',3,'',14,1),(1097,'2024-07-10 03:04:30.924941','1082','CasePurpose object (1082)',3,'',14,1),(1098,'2024-07-10 03:04:30.931202','1081','CasePurpose object (1081)',3,'',14,1),(1099,'2024-07-10 03:04:30.944566','1080','CasePurpose object (1080)',3,'',14,1),(1100,'2024-07-10 03:04:30.951005','1079','CasePurpose object (1079)',3,'',14,1),(1101,'2024-07-10 03:04:30.957415','1078','CasePurpose object (1078)',3,'',14,1),(1102,'2024-07-10 03:04:30.964615','1077','CasePurpose object (1077)',3,'',14,1),(1103,'2024-07-10 03:04:30.972522','1076','CasePurpose object (1076)',3,'',14,1),(1104,'2024-07-10 03:04:30.979648','1075','CasePurpose object (1075)',3,'',14,1),(1105,'2024-07-10 03:04:30.986050','1074','CasePurpose object (1074)',3,'',14,1),(1106,'2024-07-10 03:04:30.993349','1073','CasePurpose object (1073)',3,'',14,1),(1107,'2024-07-10 03:04:31.001339','1072','CasePurpose object (1072)',3,'',14,1),(1108,'2024-07-10 03:04:31.008532','1071','CasePurpose object (1071)',3,'',14,1),(1109,'2024-07-10 03:04:31.014753','1070','CasePurpose object (1070)',3,'',14,1),(1110,'2024-07-10 03:04:31.020770','1069','CasePurpose object (1069)',3,'',14,1),(1111,'2024-07-10 03:04:31.028411','1068','CasePurpose object (1068)',3,'',14,1),(1112,'2024-07-10 03:04:31.035667','1067','CasePurpose object (1067)',3,'',14,1),(1113,'2024-07-10 03:04:31.042191','1066','CasePurpose object (1066)',3,'',14,1),(1114,'2024-07-10 03:04:31.048583','1065','CasePurpose object (1065)',3,'',14,1),(1115,'2024-07-10 03:04:31.056700','1064','CasePurpose object (1064)',3,'',14,1),(1116,'2024-07-10 03:04:31.063327','1063','CasePurpose object (1063)',3,'',14,1),(1117,'2024-07-10 03:04:31.081633','1062','CasePurpose object (1062)',3,'',14,1),(1118,'2024-07-10 03:04:31.089058','1061','CasePurpose object (1061)',3,'',14,1),(1119,'2024-07-10 03:04:31.095469','1060','CasePurpose object (1060)',3,'',14,1),(1120,'2024-07-10 03:04:31.101555','1059','CasePurpose object (1059)',3,'',14,1),(1121,'2024-07-10 03:04:31.107579','1058','CasePurpose object (1058)',3,'',14,1),(1122,'2024-07-10 03:04:31.124187','1057','CasePurpose object (1057)',3,'',14,1),(1123,'2024-07-10 03:04:31.129899','1056','CasePurpose object (1056)',3,'',14,1),(1124,'2024-07-10 03:04:31.136380','1055','CasePurpose object (1055)',3,'',14,1),(1125,'2024-07-10 03:04:57.662280','1054','CasePurpose object (1054)',3,'',14,1),(1126,'2024-07-10 03:15:01.585171','1158','CasePurpose object (1158)',3,'',14,1),(1127,'2024-07-10 03:15:01.613310','1159','CasePurpose object (1159)',3,'',14,1),(1128,'2024-07-10 03:15:01.623697','1164','CasePurpose object (1164)',3,'',14,1),(1129,'2024-07-10 03:15:01.632305','1160','CasePurpose object (1160)',3,'',14,1),(1130,'2024-07-10 03:15:01.639607','1162','CasePurpose object (1162)',3,'',14,1),(1131,'2024-07-10 03:15:01.646041','1161','CasePurpose object (1161)',3,'',14,1),(1132,'2024-07-10 03:15:01.652460','1165','CasePurpose object (1165)',3,'',14,1),(1133,'2024-07-10 03:15:01.658457','1163','CasePurpose object (1163)',3,'',14,1),(1134,'2024-07-10 03:15:18.861235','1037','CasePurpose object (1037)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1135,'2024-07-10 03:29:04.992012','1166','CasePurpose object (1166)',3,'',14,1),(1136,'2024-07-10 03:29:05.001596','1167','CasePurpose object (1167)',3,'',14,1),(1137,'2024-07-10 03:29:05.007745','1168','CasePurpose object (1168)',3,'',14,1),(1138,'2024-07-10 03:29:05.014961','1169','CasePurpose object (1169)',3,'',14,1),(1139,'2024-07-10 03:29:05.022774','1170','CasePurpose object (1170)',3,'',14,1),(1140,'2024-07-10 03:29:05.030968','1171','CasePurpose object (1171)',3,'',14,1),(1141,'2024-07-10 03:29:05.037009','1172','CasePurpose object (1172)',3,'',14,1),(1142,'2024-07-10 03:30:26.572752','1050','CasePurpose object (1050)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1143,'2024-07-10 03:30:38.832953','1040','CasePurpose object (1040)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1144,'2024-07-10 03:31:01.866453','1039','CasePurpose object (1039)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1145,'2024-07-10 03:31:09.107183','1038','CasePurpose object (1038)',2,'[{\"changed\": {\"fields\": [\"Answer text\"]}}]',14,1),(1146,'2024-07-10 03:31:24.916836','1173','CasePurpose object (1173)',3,'',14,1),(1147,'2024-07-10 03:31:24.926384','1174','CasePurpose object (1174)',3,'',14,1),(1148,'2024-07-10 03:31:24.934699','1175','CasePurpose object (1175)',3,'',14,1),(1149,'2024-07-10 03:31:24.940685','1176','CasePurpose object (1176)',3,'',14,1),(1150,'2024-07-10 03:31:24.947082','1177','CasePurpose object (1177)',3,'',14,1),(1151,'2024-07-10 03:31:24.953030','1178','CasePurpose object (1178)',3,'',14,1),(1152,'2024-07-10 03:31:24.959945','1179','CasePurpose object (1179)',3,'',14,1),(1153,'2024-07-10 03:40:59.745166','1180','CasePurpose object (1180)',3,'',14,1),(1154,'2024-07-10 03:40:59.761884','1181','CasePurpose object (1181)',3,'',14,1),(1155,'2024-07-10 03:40:59.774768','1182','CasePurpose object (1182)',3,'',14,1),(1156,'2024-07-10 03:40:59.781380','1183','CasePurpose object (1183)',3,'',14,1),(1157,'2024-07-10 03:40:59.787213','1184','CasePurpose object (1184)',3,'',14,1),(1158,'2024-07-10 03:40:59.793357','1185','CasePurpose object (1185)',3,'',14,1),(1159,'2024-07-10 03:40:59.799216','1186','CasePurpose object (1186)',3,'',14,1),(1160,'2024-07-10 04:23:18.349234','374','Case object (374)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1161,'2024-07-10 04:24:32.979153','374','Case object (374)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1162,'2024-07-10 07:59:14.907016','337','anilkini_2@hotmail.com',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(1163,'2024-07-10 08:01:19.345276','374','Case object (374)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1164,'2024-07-10 08:20:01.197291','374','Case object (374)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1165,'2024-07-10 08:22:05.309877','374','Case object (374)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1166,'2024-07-10 08:26:22.727026','374','Case object (374)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1167,'2024-07-10 08:34:32.923855','1053','CasePurpose object (1053)',3,'',14,1),(1168,'2024-07-10 08:34:32.933502','1052','CasePurpose object (1052)',3,'',14,1),(1169,'2024-07-10 08:34:32.941036','1051','CasePurpose object (1051)',3,'',14,1),(1170,'2024-07-10 08:34:32.948628','1049','CasePurpose object (1049)',3,'',14,1),(1171,'2024-07-10 12:44:46.019706','344','anilkini@hotmail.com',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\", \"Gender\"]}}]',10,1),(1172,'2024-07-10 12:46:46.541149','378','Case object (378)',3,'',13,1),(1173,'2024-07-10 14:56:01.983352','350','None',2,'[{\"changed\": {\"fields\": [\"Phoneno\"]}}]',10,1),(1174,'2024-07-10 14:56:33.156210','379','Case object (379)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1175,'2024-07-10 15:40:48.461417','379','Case object (379)',2,'[{\"changed\": {\"fields\": [\"Coapplicant user id\"]}}]',13,1),(1176,'2024-07-10 17:10:39.618112','1228','CasePurpose object (1228)',3,'',14,1),(1177,'2024-07-10 17:10:39.627490','1227','CasePurpose object (1227)',3,'',14,1),(1178,'2024-07-10 17:10:39.633853','1226','CasePurpose object (1226)',3,'',14,1),(1179,'2024-07-10 17:10:39.639817','1225','CasePurpose object (1225)',3,'',14,1),(1180,'2024-07-10 17:10:39.649205','1224','CasePurpose object (1224)',3,'',14,1),(1181,'2024-07-10 17:10:39.658474','1223','CasePurpose object (1223)',3,'',14,1),(1182,'2024-07-10 17:10:39.663818','1222','CasePurpose object (1222)',3,'',14,1),(1183,'2024-07-10 17:10:39.669687','1221','CasePurpose object (1221)',3,'',14,1),(1184,'2024-07-11 10:02:37.827019','374','Case object (374)',3,'',13,1),(1185,'2024-07-11 10:02:50.461960','376','Case object (376)',3,'',13,1),(1186,'2024-07-11 10:02:50.468864','375','Case object (375)',3,'',13,1),(1187,'2024-07-11 10:45:09.937764','383','Case object (383)',3,'',13,1),(1188,'2024-07-11 10:45:09.944420','382','Case object (382)',3,'',13,1),(1189,'2024-07-11 10:45:09.950737','381','Case object (381)',3,'',13,1),(1190,'2024-07-11 10:47:32.923522','361','mohit1.raj@okirana.com',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(1191,'2024-07-11 10:47:45.975239','359','arvind1.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(1192,'2024-07-17 11:20:37.079024','389','Case object (389)',3,'',13,1),(1193,'2024-07-17 11:20:37.086727','388','Case object (388)',3,'',13,1),(1194,'2024-07-17 11:20:37.097295','387','Case object (387)',3,'',13,1),(1195,'2024-07-17 11:20:37.106725','386','Case object (386)',3,'',13,1),(1196,'2024-07-17 11:20:37.115186','385','Case object (385)',3,'',13,1),(1197,'2024-07-17 11:20:37.121582','384','Case object (384)',3,'',13,1),(1198,'2024-07-17 11:20:46.587442','669','CaseDisbursement object (669)',3,'',22,1),(1199,'2024-07-17 11:21:17.959764','359','arvind1.singh@okirana.com',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\"]}}]',10,1),(1200,'2024-07-17 11:21:39.059644','349','test002@abc.com',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\"]}}]',10,1),(1201,'2024-07-18 15:06:48.046927','337','anilkini@hotmail.com',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',10,1),(1202,'2024-07-18 15:12:58.489924','1245','CasePurpose object (1245)',3,'',14,1),(1203,'2024-07-18 15:12:58.497298','1244','CasePurpose object (1244)',3,'',14,1),(1204,'2024-07-18 15:12:58.503196','1243','CasePurpose object (1243)',3,'',14,1),(1205,'2024-07-18 15:12:58.510402','1240','CasePurpose object (1240)',3,'',14,1),(1206,'2024-07-18 15:12:58.517682','1239','CasePurpose object (1239)',3,'',14,1),(1207,'2024-07-18 15:12:58.523927','1237','CasePurpose object (1237)',3,'',14,1),(1208,'2024-07-18 15:12:58.531589','1236','CasePurpose object (1236)',3,'',14,1),(1209,'2024-07-18 15:12:58.555005','1235','CasePurpose object (1235)',3,'',14,1),(1210,'2024-07-18 15:12:58.562155','1234','CasePurpose object (1234)',3,'',14,1),(1211,'2024-07-18 15:12:58.572854','1233','CasePurpose object (1233)',3,'',14,1),(1212,'2024-07-18 15:12:58.579710','1232','CasePurpose object (1232)',3,'',14,1),(1213,'2024-07-18 15:12:58.585854','1231','CasePurpose object (1231)',3,'',14,1),(1214,'2024-07-18 15:12:58.592763','1230','CasePurpose object (1230)',3,'',14,1),(1215,'2024-07-18 15:12:58.599468','1229','CasePurpose object (1229)',3,'',14,1),(1216,'2024-07-18 15:12:58.610916','1220','CasePurpose object (1220)',3,'',14,1),(1217,'2024-07-18 15:12:58.618083','1219','CasePurpose object (1219)',3,'',14,1),(1218,'2024-07-18 15:12:58.623960','1218','CasePurpose object (1218)',3,'',14,1),(1219,'2024-07-18 15:12:58.630339','1217','CasePurpose object (1217)',3,'',14,1),(1220,'2024-07-18 15:12:58.636648','1216','CasePurpose object (1216)',3,'',14,1),(1221,'2024-07-18 15:12:58.643299','1215','CasePurpose object (1215)',3,'',14,1),(1222,'2024-07-18 15:12:58.650033','1214','CasePurpose object (1214)',3,'',14,1),(1223,'2024-07-18 15:13:25.698970','516','CaseRepayment object (516)',3,'',23,1),(1224,'2024-07-18 15:13:47.526201','380','Case object (380)',3,'',13,1),(1225,'2024-07-18 15:13:47.534154','379','Case object (379)',3,'',13,1),(1226,'2024-07-19 11:47:21.390201','397','Case object (397)',3,'',13,1),(1227,'2024-07-19 11:47:21.399598','396','Case object (396)',3,'',13,1),(1228,'2024-07-19 11:47:21.408851','395','Case object (395)',3,'',13,1),(1229,'2024-07-19 11:47:21.417702','393','Case object (393)',3,'',13,1),(1230,'2024-07-19 11:47:21.424658','391','Case object (391)',3,'',13,1),(1231,'2024-07-19 11:47:21.432614','390','Case object (390)',3,'',13,1),(1232,'2024-07-19 11:48:17.802932','379','None',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\", \"Gender\"]}}]',10,1),(1233,'2024-07-19 11:48:36.721634','374','mohit001@gmail.com',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\"]}}]',10,1),(1234,'2024-07-19 14:57:28.726902','400','Case object (400)',3,'',13,1),(1235,'2024-07-19 14:57:28.739403','399','Case object (399)',3,'',13,1),(1236,'2024-07-19 14:57:28.749572','398','Case object (398)',3,'',13,1),(1237,'2024-07-19 14:57:28.761507','392','Case object (392)',3,'',13,1),(1238,'2024-07-19 14:58:06.076181','378','None',2,'[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\"]}}]',10,1),(1239,'2024-07-19 14:58:45.356249','394','Case object (394)',2,'[{\"changed\": {\"fields\": [\"Short description\"]}}]',13,1),(1240,'2024-08-23 09:03:41.627533','404','Case object (404)',3,'',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','account'),(1,'admin','logentry'),(11,'allauth','emailaddress'),(12,'allauth','emailconfirmation'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(7,'authtoken','tokenproxy'),(13,'case','case'),(22,'case','casedisbursement'),(17,'case','caseevaluation'),(14,'case','casepurpose'),(15,'case','casequery'),(23,'case','caserepayment'),(25,'case','fileupload'),(24,'case','imageupload'),(16,'case','lovseeddata'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(21,'sites','site'),(18,'socialaccount','socialaccount'),(19,'socialaccount','socialapp'),(20,'socialaccount','socialtoken'),(10,'user','customuser'),(9,'user','location');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'account','0001_initial','2024-04-25 04:02:45.569040'),(2,'contenttypes','0001_initial','2024-04-25 04:02:45.665895'),(3,'contenttypes','0002_remove_content_type_name','2024-04-25 04:02:45.785188'),(4,'auth','0001_initial','2024-04-25 04:02:46.571374'),(5,'auth','0002_alter_permission_name_max_length','2024-04-25 04:02:46.679736'),(6,'auth','0003_alter_user_email_max_length','2024-04-25 04:02:46.691303'),(7,'auth','0004_alter_user_username_opts','2024-04-25 04:02:46.702232'),(8,'auth','0005_alter_user_last_login_null','2024-04-25 04:02:46.711701'),(9,'auth','0006_require_contenttypes_0002','2024-04-25 04:02:46.717043'),(10,'auth','0007_alter_validators_add_error_messages','2024-04-25 04:02:46.726283'),(11,'auth','0008_alter_user_username_max_length','2024-04-25 04:02:46.740150'),(12,'auth','0009_alter_user_last_name_max_length','2024-04-25 04:02:46.750441'),(13,'auth','0010_alter_group_name_max_length','2024-04-25 04:02:46.777146'),(14,'auth','0011_update_proxy_permissions','2024-04-25 04:02:46.791296'),(15,'auth','0012_alter_user_first_name_max_length','2024-04-25 04:02:46.811917'),(16,'user','0001_initial','2024-04-25 04:02:47.676901'),(17,'admin','0001_initial','2024-04-25 04:02:47.959004'),(18,'admin','0002_logentry_remove_auto_add','2024-04-25 04:02:47.974130'),(19,'admin','0003_logentry_add_action_flag_choices','2024-04-25 04:02:47.988083'),(20,'authtoken','0001_initial','2024-04-25 04:02:48.147439'),(21,'authtoken','0002_auto_20160226_1747','2024-04-25 04:02:48.183530'),(22,'authtoken','0003_tokenproxy','2024-04-25 04:02:48.190587'),(23,'authtoken','0004_alter_tokenproxy_options','2024-04-25 04:02:48.199952'),(24,'case','0001_initial','2024-04-25 04:02:48.557076'),(25,'case','0002_initial','2024-04-25 04:02:49.010124'),(26,'sessions','0001_initial','2024-04-25 04:02:49.103233'),(27,'sites','0001_initial','2024-04-25 04:02:49.151729'),(28,'sites','0002_alter_domain_unique','2024-04-25 04:02:49.204200'),(29,'socialaccount','0001_initial','2024-04-25 04:02:50.155771'),(30,'socialaccount','0002_token_max_lengths','2024-04-25 04:02:50.240844'),(31,'socialaccount','0003_extra_data_default_dict','2024-04-25 04:02:50.256681'),(32,'socialaccount','0004_app_provider_id_settings','2024-04-25 04:02:50.549255'),(33,'socialaccount','0005_socialtoken_nullable_app','2024-04-25 04:02:50.821632'),(34,'socialaccount','0006_alter_socialaccount_extra_data','2024-04-25 04:02:50.960724'),(35,'case','0003_rename_notes_caseevaluation_approver_decision_and_more','2024-04-30 03:26:40.415348'),(36,'user','0002_rename_b_phoneno_customuser_phoneno_and_more','2024-05-01 11:04:39.220629'),(37,'user','0003_alter_customuser_marital_status','2024-05-02 07:58:27.728658'),(38,'user','0004_alter_customuser_marital_status','2024-05-07 10:58:11.141318'),(39,'case','0004_case_approved_amt_case_disbursement_count_and_more','2024-05-07 15:18:07.831199'),(40,'case','0005_casedisbursement_disbursement_txn_info_and_more','2024-05-09 05:38:34.531264'),(41,'user','0005_rename_state_customuser_status','2024-05-09 05:38:34.599140'),(42,'case','0006_alter_casedisbursement_disbursed_date_and_more','2024-05-13 02:45:18.994258'),(43,'case','0007_alter_case_approval_status','2024-05-16 10:50:47.153035'),(44,'user','0006_alter_location_unique_together','2024-05-16 10:55:00.118368'),(45,'user','0007_alter_customuser_email_alter_customuser_phoneno','2024-05-23 09:29:35.006759'),(46,'user','0008_alter_customuser_phoneno','2024-05-23 09:29:35.072370'),(47,'user','0009_alter_customuser_phoneno','2024-05-23 09:29:35.260767'),(48,'user','0010_alter_location_pincode','2024-05-23 13:48:53.939354'),(49,'user','0011_alter_location_country_alter_location_district_and_more','2024-05-28 08:26:50.762038'),(50,'user','0012_alter_customuser_marital_status_alter_location_city','2024-05-30 13:22:53.118030'),(51,'user','0013_alter_customuser_default_account','2024-05-30 13:28:39.105060'),(52,'case','0008_case_repayment_received_case_total_disbursment','2024-06-05 07:43:21.881264'),(53,'user','0014_alter_customuser_address_proof_copy_and_more','2024-06-06 14:36:36.909252'),(54,'case','0009_alter_case_repay_percent','2024-06-07 06:17:06.238402'),(55,'case','0010_alter_lovseeddata_input_type','2024-06-07 08:25:12.872675'),(56,'case','0011_imageupload','2024-06-08 07:55:14.935906'),(57,'case','0012_fileupload_delete_imageupload','2024-06-08 15:12:26.984599'),(58,'user','0015_alter_customuser_address_proof_copy_and_more','2024-06-08 15:20:12.157128'),(59,'user','0016_alter_customuser_marital_status','2024-06-11 11:38:46.945650'),(60,'user','0017_alter_customuser_marital_status','2024-06-11 11:44:49.217685'),(61,'user','0018_alter_customuser_marital_status','2024-06-11 11:46:18.602545'),(62,'user','0019_alter_customuser_marital_status','2024-06-11 11:48:23.975139'),(63,'account','0002_account_fund_corpus','2024-06-12 04:34:07.071874'),(64,'case','0013_rename_total_disbursment_case_total_disbursement','2024-06-14 09:34:23.732083'),(65,'case','0014_alter_lovseeddata_input_type','2024-07-01 11:50:11.147226'),(66,'account','0003_alter_account_account_type','2024-07-02 06:35:26.208872');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('04qhnrj7c9r7sqsmapz7z7wol996bcdu','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOVJa:VNm27bLNYTCw1dhR8t8yDqZsNkn7_eM-fTwxY3flzWw','2024-07-16 04:40:26.159944'),('0clowot7sowelwqnk5wwwgobxzm0x0eg','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sF4ui:hCPKJR8W52rhW4zFjw25GNVupz6Kr3ZjWoL-Mb5sd64','2024-06-20 04:39:48.928062'),('0hqj68kgh1s0ql2ku0r8xdl2i81cunii','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUT2R:kl_0JxkoNor2PVEpWtAXLoBzhrGN04XJ2Mn9g9wZdgk','2024-08-01 15:27:23.918920'),('0k2hh2s07ucge47oqph0hho05wshtik6','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2r0a:4OKT6HtltK-Uvj5xJubPhsdwQR6kSj14SFkFfmJ5uz0','2024-05-17 11:23:20.007693'),('0mpre06jdigyajnmzqnc44x6ruxrnfo8','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2sNf:2juiLcwq8a9l9ofIThLhEP_yQcvOwg4CtcCuz_OW14w','2024-05-17 12:51:15.983365'),('0ox5zb59h6uk3cxxnfnpm6iuu9dpol4m','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rNV:shC2hsxTCsD-mpWIhO_lqAURqIAfmcfU1OgLL6nvSnM','2024-05-17 11:47:01.616907'),('0qnbuevqepyvex6c5nmwsderrdmz2dlr','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUl7M:yTXxX1RXyR7lUgFISvJrCXoSVEAuBvVP2ULN_dQ2pNU','2024-08-02 10:45:40.647427'),('0u4cismkrjnx92k1q0cy9czk8f6ge6o0','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sXFdm:foA5nbM3RbDUth0UvjZYYLVwL2nnhihYkiNwdJqy-ao','2024-08-09 07:45:26.043727'),('0yh1zznp083b10rw8yktkf8n5qp7pdb0','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s5IL6:_cyE5uYn_lS0IWPUVzrsdH5T2SQvNn_SOpjYuMMYwLE','2024-05-24 04:58:36.452318'),('0zzqsqsaqbw2jgpv5qpno4uddkgoqrik','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbEtu:ZV1Y8bPEugW54ogMGwLm2xT-RpQT30aSKh9GzVi740k','2024-08-20 07:46:34.618699'),('11mtxr64huvx86oe04qskuaa1zlb6j2z','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sPFfx:swAVGn_DoZZpRbXl444xOQqVDSn5omtkziEdCqDcRWE','2024-07-18 06:10:37.638684'),('1213ydoxim3ao6qa9v7qtsty8ppl7z5o','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbbzW:puoil5q31yIuGwT526xz1O8akx2Q3LhYgyAGlIVcuC0','2024-08-21 08:25:54.034684'),('1338so1lr28ace1v1zir98uiu4q3wbz8','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2sNV:mduNm_DA7JSxmCX0RbZwLZDm06OjeRDo3UmLQEduopA','2024-05-17 12:51:05.680462'),('133rh8k0uj2bf5bpb12vr690iq5oekcl','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sQlWR:MU1VjSgfCoBX6yoYyBdsPu-gc4i9y4nKMwt8g_E6BZk','2024-07-22 10:23:03.769380'),('163bejlzg8mtmh29g6dss761wzc5h56r','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbZVd:IoUyCnkI8KI5GMsVnPO-nm9x1_4ND7LpKZqY8ctaFRg','2024-08-21 05:46:53.450572'),('17zbid47dldpsa1pqaoc81rz9ptnounc','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2ncn:sab7QkpuOniSefqOTYpJdCwwhBtF5DaQfOja_DoDXz4','2024-05-17 07:46:33.957289'),('19l2iga6jvuajpfc8itvido3lc70qrrt','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sN9cS:ZsIVGbIhDZX_Y6Milo4TCTgj_C0G354AjYThY-EBTJc','2024-07-12 11:18:20.162199'),('1aktr8qjmwcgxmzdcorygathokeq3po8','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2niO:Kp_Mcmom5qBa4JtrWEX3LJxptJvm5lJp1NxvSo1DpnA','2024-05-17 07:52:20.385859'),('1cx7ltz5daav9vm2i67hl0wkr3n47c0v','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOEiN:bsNlvoFPMmgWesOsVy16cunLsV6VfxTU6YdB7HuhMgU','2024-07-15 10:56:55.960140'),('1n6lx58ly19xtg5k2osk75iv0j2602n4','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2Ud:jiCtxf2-DSe4L4HPKoMj49J7s9M2_qBveDJ3C2GnOyc','2024-09-05 07:44:27.280873'),('1owzx5jdqikszt4c4p5l7dtskko439ha','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2MbB:5lFzxox475ZCrcUovGHPNcD56D2LvgQqUr5IzCyZUsk','2024-05-16 02:55:05.940782'),('1qb1xmhmolra7yzbu362i67rnhczrdj9','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUfdk:Z389v3zngtfHkL_fbE9DDsO7gi6kSaPZz-_lAYheFnM','2024-08-02 04:54:44.151397'),('1wj6mwq9jlsrt65hgwg5hzl2eknwd2s2','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2nd4:48qkhpJg9TT4BnwTb4DmjpLLt5Lpqlu1OMVYzomyIhQ','2024-05-17 07:46:50.538774'),('277hl9fsrhv1wpec1faiz7g6ds90w94p','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1saqB1:AapqpaXRe5qRsKW2JLbhrrliaY0QKWot5v5QcAVvUa0','2024-08-19 05:22:35.632401'),('27jsp7b5qmlk2z4whtzfy17v6030crh9','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOHHu:BzbBa0HBi6mr7qgIg7XvyMpK6Pr_uNEnWni3b_KPfJo','2024-07-15 13:41:46.487877'),('28jzuz22ethieaiyt6dh9roa3polvmu0','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2qzz:esLUbCA3tBcufB_VTIQ9FhDLvm35Oz4hPqcnqp-dsn4','2024-05-17 11:22:43.615543'),('29kf5mre2n3ain1jujzkyrnua0c8v1nv','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0LG:GKcvTrO8UtiZyptvb-B7vYvp832og0tU73noUAsQnPs','2024-08-22 10:25:58.308140'),('2m3rg92n5xjeqzlgk37mrwcqcqixxlu2','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1s9gwD:T6nE2WJb0aHri-1eIN_xXWy7kFL6iBsXaX4gwLBRVVE','2024-06-05 08:03:05.145656'),('2qwdhd57upy8b7xuye855gvq5x5czezi','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s9dMp:F4ISWbVR6tULUnu7CLEfvyngCuGXxvRc_9mOJ0gNSog','2024-06-05 04:14:19.480833'),('2sqpvv0qa3qygaj2e5sbz6k5dbtlee9s','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUmmd:k0oeWYfUkssV9M0JBKVYFnogkUlm6P2bKOjuCTclQyg','2024-08-02 12:32:23.941379'),('2xxn0zi1hqeyvrd1v83fskh0pwxaj9zi','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sXIvr:BeP1nD91cREONRic0TXEMe49WfkHWBKz-UY8-odFhkU','2024-08-09 11:16:19.480961'),('2zmgm3j1p269jt8nkfak8cdgwhg1empw','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sba5F:O-aePCInALMlTksV9UXPtsztKbIpMWrwFP_U3jYm8qY','2024-08-21 06:23:41.369295'),('33ga3n8z8hr9k7uxfjp7sq9o6ilqxy6c','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s97O9:NaUHn7oUmHkoDZ_8xTkJYZOGi_6W_AyjtLo_ELkJagk','2024-06-03 18:05:33.108664'),('34grnqw5fbjthn7taz9ts2ok29nccgx5','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sYPW8:8jMGHfgjrkv9OysLAobIohQG5oASSPTFXSRcAG488Kk','2024-08-12 12:30:20.976468'),('39jcnvynkzecuurfdvecxh7wi9rcd0a8','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2Uq:_ez_qcoreNOHsyGCztFRmPwvG6cREbusBJEEWWecIpU','2024-09-05 07:44:40.572093'),('39rox8agbo316inoelfwr2nxt2qghnbj','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjN9:1sNDfe:F0A8FD-3YWMIGSjjMGmCKlcdugi8u-RkOw8BJVp4JoQ','2024-07-12 15:37:54.917674'),('3koa884lv240ug6vf6tdpiyh93ful6qi','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUoKh:GPox7rnEPxXi2WTJAt1Imw4YbNHXPGBHa-s-8ZcTqR8','2024-08-02 14:11:39.740159'),('3lk0uk92bzrjzxvozu5vpxciqi0wg41p','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sHdGm:TkHiBnAyaGB9cdCl0Gw2QTXK-OvRM9SLTTOiE61NJtk','2024-06-27 05:45:08.615571'),('3nemsjpifulws8glmyfmk6dxni00ooi4','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sMnG1:0JVaD9x_RUXBrBqUOlU6IRJnBpsyiDfGDpsAWWkU-A8','2024-07-11 11:25:41.280282'),('3q3wa5yitj670jdyjcv0bdzla5lba7v4','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUnJg:1hep-otJACpaQGjxQBZ_vINx6Ia7JIb_iwNbMzKqkvM','2024-08-02 13:06:32.199633'),('3qfqyrjm0xh43pgxxn5lfy9rk05sv88y','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPGet:mSvBWhNUS9I10n0VwHxdIbl_wT3bi34zQPNdeofFOpE','2024-07-18 07:13:35.970319'),('3qg58mbnylfbdgp2ltjfq80v3jf221t5','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sP03h:2CmIyE14o01ZlJWt0JzZLtlKcniXprWYdPWolIrGZdk','2024-07-17 13:30:05.031786'),('3sdqrsj83xktejvxjdt6zp4vsp3c9pom','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUp08:KBb3skm-P1PGsvVWrvDSF6-2XfFH7PQKsi6PEnIFGJA','2024-08-02 14:54:28.528821'),('48tkpdbws3xprtn0eu3fl027otp7p1ew','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0gV:_E_lpnK9eOc43ABg0do_31S2uiqKBJ1nQnX3zp6ALRo','2024-08-22 10:47:55.937548'),('49iwhcp89g32xise2rln6yyo6nv9kah2','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sOXAx:OWaT1Ho0K2sJstgI6ggf88l_FYfA83JV5yIOa4Br2JM','2024-07-16 06:39:39.644585'),('49yyzrwv8sgepiyoar6eyhfakd6t69xi','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbb6C:pFqvD_sAv7-PzIemQk7YuVFqM8zFtA2X6quoFulXtC4','2024-08-21 07:28:44.233177'),('4klop0l3d3fkvidrqbti0e2o4r12v5x9','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOBgd:kBvcxgyXtRTKAt0huNOycQntAIH2ghjRXp_rLSeX77s','2024-07-15 07:42:55.708425'),('4mz4vdg5irsq8ke2t07lnv5kv9cq10t2','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2OG8:-nPf16J2GiJXdyROhxVU_trIK6gzJRcoOIsgFdct3CU','2024-05-16 04:41:28.541499'),('4tetzumor0ioskwkq0y3rhe7a2cs9ldp','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2QX:jxXUCOnpQC8zbs-ftCKTV1fGANImFXJfRqqGbvmnn-c','2024-09-05 07:40:13.576162'),('4ywv2zlbk5btqijrfyjasc9e76a8clyo','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1X5:Z1qV_xIpKGMvZtsu52nN_jd5G4gYQGSDXV39GPY-sQc','2024-09-05 06:42:55.521537'),('506iljbymx43nlr81ids47yv8lbxcdp6','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sY5bl:W7eKK2IWpq02Rv_xOQrjYFO37OwjqKe5kvDpkde_ZhU','2024-08-11 15:14:49.375613'),('51lmyvugkt0suge21kv7zxqivm6h42vu','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUnaA:usfSXg3yiaH7RfnghmI7puY8voofgTcsPKMeD7gztM4','2024-08-02 13:23:34.135835'),('52pujlb5j0it9wkrjx55oq10scqubofw','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUT2R:kl_0JxkoNor2PVEpWtAXLoBzhrGN04XJ2Mn9g9wZdgk','2024-08-01 15:27:23.506456'),('545hcwtcr0b9ghvci7zmvfnjm6avla10','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sdlwr:MMSOU7rjUkk5lvPDbZFHxxJLZlu3XT3y5fPTbu_mqVs','2024-08-27 07:28:05.896162'),('55whqy6rohixy85lmi52ch975dh58yl5','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbGhO:kdMqBfG6mU4ZeO_bU52ObePFTDIyJ47JDyLVqL9dS4s','2024-08-20 09:41:46.269568'),('57pl6bfpy6qyuibdaonqqn0jd90dxzdi','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOuk1:7Y5yVKQOLHLHxVifOnHgEZAM8Ra7YcOIvDEUOZLxD-8','2024-07-17 07:49:25.806893'),('5cs8ml4nzagtghie5h69e70dhe8e9cty','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUox6:bIb6DmkzwhFOoQI3yTsP8SM1d1gzo8VvD9GeSpSVag8','2024-08-02 14:51:20.071610'),('5d6zqqbrs16a89dlyjegseoc8vrpbru8','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1stozs:7Sgd-A7ybUm9BFKe1J3Pr81bURK4yphT8Sm8BVaZaXI','2024-10-10 13:57:32.785929'),('5oz02ekk2p0ms5ffc120rc4uu488r55y','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUfWg:DHf0-NUKVjnv78XfHrbwU-SHSptqj58zo2IWoVuROn0','2024-08-02 04:47:26.484489'),('5y8z0fkutmr0jz4uxl7e974mmnwy0xxo','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUfd0:nKj0226gzQAz0sU3Gwo2CizHCXTOkssYXOZupj9lQXw','2024-08-02 04:53:58.363486'),('5yb4gvw26p5zc85xwqy882xf0n6s6i48','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sarmc:6kN0mGTX8rmnsR5Q0eIP-PKDGJVyKg5f2J0Ron3gSuc','2024-08-19 07:05:30.668420'),('5yg4ei0f6qd2yfe8h47k0pvmuot4gdo8','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sby9L:oWdEeKMGCW1O1sveCzyBotXaBMlFuEF8wx7mISOahgU','2024-08-22 08:05:31.696523'),('63434h1f59xu5jxk52zoantxw9w5743k','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOv9d:IK_TKno1ldn1ciATLYuJktCp9sHC1rHWt3kF_ilke14','2024-07-17 08:15:53.558381'),('69vws1ydv02btr76u8jl44a1duygskf2','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1wm:DVRR2j1QMXRamSfHJmrzZNaqNOB-MlXjx2uI06M-sVQ','2024-09-05 07:09:28.298618'),('6a2t4u1md77clg4kqjuufx1jjt23mr18','.eJxVj01ug0AMhe8y6wr5h5mBLLPvGZDNeAotYiQgqyp3z6RCVSJ5Yfu991n-dYPcjmm47bYNc3IXx-7jdacy_tj6FNK3rF-lGct6bLM2T0tzqnvzWZIt19P7Bphkn2o6m3kGMInKLFCr69Ajt0Z1loxBQ8JOfMpAEbwC-SyEFjRHj6FC_5hHqScqLwBIhp46oFEjtdQzEkKvgX1qIUVLmXvUmvv_jc9-K4tVhNpqWcajbO7-ANY0U1Y:1s9dqx:o2CL0frEqkKLV2OFhFew0ckriWO72-1zRFCj2kXoweM','2024-06-05 04:45:27.281795'),('6a89f1tygl32770l4aq6te14c75znftk','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sgh3J:MJ7r_fanq-GQ4J_jbO6JQiv6o83xaH-k0uGv8Umdtsc','2024-09-04 08:50:49.852955'),('6aysf8jn79dxa8j4y5saiewcx7hi6j0z','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbGgr:327kgdAUVjgfVDXRRc0qvwjWdDImlAi17XwRxLtAzEs','2024-08-20 09:41:13.748925'),('6cokdauuvtgpt7ijszwvxjm9283pi1ok','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCM7R:x3EuJ820Cd0jenO_bI07RlT2j15Ri7p_jNKGFRk7iAU','2024-06-12 16:25:41.597533'),('6e2f30xw9vsgksqbc89twy59qtlru7gq','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1shM5z:Ki8cCFgzWo95sUldDV41E2jCrYHc2JkY3a_cxsdkf1g','2024-09-06 04:40:19.867148'),('6eiz3z9ty91bzm61xrbiknctrbjuv1xn','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rKu:7IbmVC5vhG6oS0lM-pd0NJgIEe1JwaaR0h0uQJZWBZI','2024-05-17 11:44:20.514353'),('6g43oeyfbgsi665r5cjkl4lr1my25cna','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1shIWf:rugkVmwqD68506PPrCYFHaoW0Y-2DS0kEhIoGOSQb8A','2024-09-06 00:51:37.518193'),('6ozbdru6z87ikmo4y90ptv61s7in2tww','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sas9U:pDu44UFTcg78DGWnSupUzTt1Ml8qxW1riWVTq5U1-h0','2024-08-19 07:29:08.658718'),('6ozmaikm47j9zvciwogcwbcsaslxp4lc','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rM7:gdYc78b_V-uGNelEQAbdH6mEpyWro3tzJVjofqWTAD4','2024-05-17 11:45:35.218046'),('6sepqf9zio77skppgr3iral3bt3tokht','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1t1ims:ymHbtA7hkx4TkEKormU4YLa3nzWXQdWV7sKqaK6Gjy0','2024-11-01 08:56:46.774199'),('6w2cx87g5s5smo2kor4t5j1h18oqxqp5','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbbtU:y5nQNg0LtGdmNiR9qMv6U7kNwGQzUG3L8q5tgpfVNl8','2024-08-21 08:19:40.463711'),('6wnztktglpxbl04256ejnjm4df2ijdb4','.eJxVj0tuwzAMRO-idWHwY0l2l93nDAZpUXXawApkp5sid49SGEULcEFyZh7BbzfJbV-m22Z1Oif36ti9_N2pzJ-2PoX0Iet76eay7vWs3dPSHerWnUqyy9vh_QdYZFtaOpt5BjCJyizQahjQI_dGbZaMQUPCQXzKQBG8AvkshBY0R4-hQX-Ye2knGi8ASIaRBqBZI_U0MhLCqIF96iFFS5lH1Jb7_Y2PvpaLNYRcr7V8WXX3BzDbUqw:1s9yrj:SElggdg5c1mHyhKMBXOIaKBsDZ_7je-34TZAlisPs20','2024-06-06 03:11:39.894927'),('6zfalxhs48h9o4fhb1lnyiw0pmzsteao','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2nr8:0sqc-DD_2rgFterklZy3lLkT95XEvKIZtczzC3OrvG8','2024-05-17 08:01:22.968074'),('71gow669if3qq3kbzlbk4hqu0oba4jn8','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOCt2:YkPa9WmHJa9OHVa1_bpUjYKDpyo1J3RM7H_Icu5zVMs','2024-07-15 08:59:48.056513'),('72fv9clcu1f86px1w8vwjom49cp3pr7c','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbEsE:iao-WYtecUqf8_pVjsHx7o89r40kK_7aGuX5c2X3nCI','2024-08-20 07:44:50.895448'),('75dxhp1qal518l3oqk3np1sqgtf8pmbv','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2nik:-PVFNUWVOzPjd4driHwz7sRLFNS9t_63dJQz5_O4Saw','2024-05-17 07:52:42.386633'),('781bsu3hfg7lpwen88p74z2hzddn83n5','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUlw4:UKVMTQUWWMD47NHIOeLwFnbatzxyPZzhv6c7mpT__O8','2024-08-02 11:38:04.880277'),('7dmt3kgvcxhlh2z0e8twpmh75y7wugmz','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sHFwT:ZIR3xRyaDkLQOUgb2OKj6r9gQnICRRFcIuN7ESnIzHw','2024-06-26 04:50:37.809463'),('7go4kd7f73wjb39lmbiejlntbqwzspwl','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sgh5Z:B5OBgcLEu6TY1YWdUm2IQ_cOhZc5IWfAABrmJ2U6ggo','2024-09-04 08:53:09.124966'),('7jwcp2izs5legcwfmp9rwfmuek1p2kfh','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbzCn:Un2yLKWsGH4TkJvHBGsHl-LBmDc8QFQ9l1Ojc0ufORM','2024-08-22 09:13:09.607204'),('7jxbzpe8i38lod9wzltgwkhasupt8hhd','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sP0zv:sbCFeOl2PbwIVgNhC3kPR07EOINkkWOaAVUn_664vBU','2024-07-17 14:30:15.473824'),('7lk8ufgt29xljcob8hcfbr24n8wgbph8','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUTGj:nWrohdPTZYLYL0H4Z6vaZW8mxv2oILBST-BT3REmi1c','2024-08-01 15:42:09.951719'),('7neoak5xxaf5d5x7dhjycexcooqoikeh','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sas9h:qUoK8jk0UbwQ6GwIjqsDD136imX_O5I3U0bqXzC-mtE','2024-08-19 07:29:21.484753'),('7t0majgai9nf1y96oiw3k56c8wvs39gp','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2bJ:HdQd7FqDBsE3EpSuHAaYoZhvoZL58DeLhc8873k0SpI','2024-09-05 07:51:21.379466'),('81kla2q93z3g2dxixkyarxw7jvezwsbs','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EZ1:Bf_c1VwneHUq-hqSpWduyd8AP7h2NHhXHgVVu41zOEk','2024-05-21 06:44:35.085422'),('8580km60n66u9lhb6wvjf2q68r2aib01','.eJxVj01ug0AMhe8y6wr5h5mBLLPvGZDNeAotYiQgqyp3z6RCVSJ5Yfu991n-dYPcjmm47bYNc3IXx-7jdacy_tj6FNK3rF-lGct6bLM2T0tzqnvzWZIt19P7Bphkn2o6m3kGMInKLFCr69Ajt0Z1loxBQ8JOfMpAEbwC-SyEFjRHj6FC_5hHqScqLwBIhp46oFEjtdQzEkKvgX1qIUVLmXvUmvv_jc9-K4tVhNpqWcajbO7-ANY0U1Y:1s9dqj:TfvC6mqbj6E4z1MPuB7UEn-6Ssb2iDXwDgWIm2g1t30','2024-06-05 04:45:13.463250'),('87fmesh58ffssiypxz447f8ag9eceo43','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbFEL:o6L0N4VH-URjEK_y90qpKiB6AtT0bMiSXdUBtKrcntA','2024-08-20 08:07:41.897176'),('8cl723pgjyv8vj4q8xcu6vvf3lgjz4og','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sCMDG:Brf39FUVz5PjH96eb9P5Vy0hS0XvEUDUXbzPWgEWDAE','2024-06-12 16:31:42.285475'),('8e4ojl3vnlcn4hc4gk0he3np0iw498vj','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sPFnA:XRRkkZ7cnw8askzFbGlxoXeploO1OHDvBN5AGYcXqgI','2024-07-18 06:18:04.593206'),('8e6pvzbnqf89w6xxso92lc37mx810mfn','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sF5O8:dIOyz3actte28rdxl8J_Nlwv7Tcyc0kBXQJdOGG9KPM','2024-06-20 05:10:12.012399'),('8ntmb9ddexw6jcqx11vc1b55hyegdtun','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sCBYY:VfH2rhXswFsmsc0y6kahd6yP6dckyPsHJgb6JSUcQ3Y','2024-06-12 05:08:58.320418'),('8th7r0h5bebf0s0q0gbxxnm2m6oygknx','.eJxVj0tuwzAMRO-idWHwY0l2l93nDAZpUXXawApkp5sid49SGEULcEFyZh7BbzfJbV-m22Z1Oif36ti9_N2pzJ-2PoX0Iet76eay7vWs3dPSHerWnUqyy9vh_QdYZFtaOpt5BjCJyizQahjQI_dGbZaMQUPCQXzKQBG8AvkshBY0R4-hQX-Ye2knGi8ASIaRBqBZI_U0MhLCqIF96iFFS5lH1Jb7_Y2PvpaLNYRcr7V8WXX3BzDbUqw:1s9ysD:r4Ve3l12fzJ0A6NJ6YBtb3q4BmBAl09cUItLBVfwFRg','2024-06-06 03:12:09.113391'),('8zumaorg0ra62r6fnsw4f53cxsretcay','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EAA:IW3H98PRR5rv8l-aAPZuWfGg0X08Ukag9Xyq-tkhZ0o','2024-05-21 06:18:54.483131'),('91tju8in5h8wkgynv59klj6895evjfsl','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1s79S4:sHCS-kmSenUV4sZ-N8QILj6N3Z0RaudqojC1RaX-HIA','2024-05-29 07:53:28.240649'),('91uwk21whghmwkbpppxpia4a4b968awm','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2MB:KO11fqsxD3m9zf9bzXz_tek1Pwyk-pUl1ujvg9ic75U','2024-09-05 07:35:43.091177'),('97dexlbwehe3wd0ofuhoqrayohavge2u','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1tA:lRuCWvJ54x4Q2_NgUfKaVprBK_LNaoVqFAVXU9qIP30','2024-09-05 07:05:44.860823'),('97ur9qvccf5keiuvnijtrsyvtaap6ngl','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUnGC:6XxrcWPXnu0I8OeTC0bWuQGr_SMca32xHA532oJdeP4','2024-08-02 13:02:56.724295'),('9h1xxfnc31uvw7ixwa5nlx0o17ejdz75','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUlRx:TKz3JJdq3EbWzr24OfvZuiHO1D0zvUkZqvsIQS4qlsU','2024-08-02 11:06:57.470872'),('9hyl44lv898gkwsrfxrqpwez2n2wbcpb','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1sm:Gyt42pRHybIAw4CVO4AAfZrt_6-owYCwQQ8NZlNaj3A','2024-09-05 07:05:20.844796'),('9p8063fpav8xtgb2c8obq514xm2kfgc0','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EcW:odZIQK-VqJxD2uAJYQwvF6MZJIQwQMWXPDmsgXhPdew','2024-05-21 06:48:12.968020'),('9q3lg45spfiw7yqhor9pro7op6tjoy3y','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4fqg:5hWvclKaBhXbTOKtyatHuHwOpXYKKLv5Hut9zQGdVa4','2024-05-22 11:52:38.103563'),('9tvj2bumvvmbs8svyi16mu29k4h04ama','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjN9:1sPFp0:eNyP9VpMog_89lY2coIPZm9qnNqh2W-u3pW9y7xXfHU','2024-07-18 06:19:58.806525'),('9yx9vddizgwj3wvsb1z0d7yw6k4jih52','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCyYe:LEyqwK_n2-FsH8ZhsLcQnML-xOqgihXYf902CSkqFcA','2024-06-14 09:28:20.332458'),('a166e62kcsojyt5vjotc9f7c2eo699rx','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s0D8p:zOewulhbI8_xxVgHwnNjW0y0qNFNAipYkiyZ2WnSuBo','2024-05-10 04:24:55.961059'),('a2qcdqstq2pk2ok49tozu4pwswoyvdg5','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sXGyC:WNdj7V6kP8zZEGOokq2RnPsxKO-WuHk2qXkIHK6IdXE','2024-08-09 09:10:36.421195'),('a40vzf4t1baqp07qfjgagooyceoq9xc0','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbzJH:YkJ-emq3GMeO94pCEaBRRQEdPr7a9BiQ-r9UyAy-XhQ','2024-08-22 09:19:51.025034'),('a59rypfsigg91dmt9fvaqwzrodh0o1wy','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sgeDJ:wY3ZDgrQ2DpGIa-BZuUGBfS5CKuDV5WTBhXhkwsyS0o','2024-09-04 05:48:57.259822'),('a606uxw639uxy3nqqd5ogxeds51f58qw','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUT2R:kl_0JxkoNor2PVEpWtAXLoBzhrGN04XJ2Mn9g9wZdgk','2024-08-01 15:27:23.950596'),('a7vepig2trs5zpg5bafbhql2vvrrygkb','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sdlmg:CRn2LOc-22NeEcrU-NusmIfhsH6nIQYE5q_OqVsoFQQ','2024-08-27 07:17:34.190995'),('a9pbi6vfz7pc5rpzj5fu2gwsi062f6tc','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3LCJ1c2VyX3JvbGUiOiJhcHByb3ZlciJ9:1sQniG:3sSmRbg0V5nrUWKS5fS7f1FoM9t648E0ETuMElXJYds','2024-07-22 12:43:24.085093'),('aa1tby43fjw4nsrl4lh1s8949e1lr85q','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sN7ii:8pZpm6dNNm3q2h2TE_QB8n-hEdcnTcI6wm1l12-Ithk','2024-07-12 09:16:40.831964'),('ahq586v9oe6zwwxkaod6syeqnic6oexp','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rLz:XRfeledxrz9w37XDAyNPkuJuMqTTlVyzD3NN9CdIP-4','2024-05-17 11:45:27.675700'),('akhm0lhxmzadpl4l6tmqrcy68laybdhg','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUgdj:ABWBGrdtPE2WCAeQkgVH0Lm4GJmV_loBSfU_FVBmtdQ','2024-08-02 05:58:47.266303'),('aqv5azqdfwka6l9p5omnazewwn8ew1xb','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sXF7u:NlMW-5feTayQQI58TktytCU8iIbCH4ojwZ6RGDYRB94','2024-08-09 07:12:30.830182'),('av18sh7qogvfwxtgdisf0r05ds3f6zez','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCFhf:l1-A29hEavsPbMqDwWxc6k2tkRsWEtXMHGy11yFVKu0','2024-06-12 09:34:39.969520'),('awrdko6dpcna0h7du4uu9x8pw3yq3113','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1s9gwn:z1nNqPkCG6eyJ_grGWXTEhkUjJ1u3pAWZlZ7XV0ldoo','2024-06-05 08:03:41.855103'),('aze49w53p7tgidyio7i1zmjrg20iovkf','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2OEY:rw7vACpfRg2KqvX54oHaYrfawRTj6LD39FmfTwlNEUI','2024-05-16 04:39:50.959810'),('b2js33gfxtx4ynbf8wg952kswcvwjx24','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rJs:iV7LYhBv0aJYkzdQ5vM4pUK0kcnpHoKl06_yviucJiM','2024-05-17 11:43:16.376360'),('b5jgx6y0q2ggvmudwxu17xmm2dp44pee','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUoSE:6FScE6XhCeWFOMVLyBxBSuEEnWzMGtQo9ef0ZUJ6Mfw','2024-08-02 14:19:26.095642'),('b5zbvfhi41y9azkw3qk1ntgqzm3trqu6','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbxrJ:eM2hPFVaqNUScVsJcSc0KYY5DKeR6EWV4ApwLIW4wSQ','2024-08-22 07:46:53.374605'),('b7vu4mjlrxe1btvf94wzn9pg509smaz1','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2ab:KtJ2f0Jz8KEEogfGB9-XFzWYa_gClmaT37CLhnOEj9g','2024-09-05 07:50:37.187920'),('b7z68o7j820j0zy3gqcxpzpnws0s5aya','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s0D9t:sAtllM8a460HpgAYnWGEkzRPMGbjWE_utIVMiJ59Y-U','2024-05-10 04:26:01.158157'),('bflucirli2jiz37nq73zlqrqf69zxp2a','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sXIxx:e9ZnPXy2mkMqpwMUCTqIHYcH1Dy7gQMNRvd-2ybdgbg','2024-08-09 11:18:29.026857'),('bk83gwyltybrl0zc2e5lp4r78n3n2taj','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUiHK:7w6VskaGZQicCpKfCTWeCoDe2mHGU6S-ITFoBlkoth8','2024-08-02 07:43:46.049029'),('bozuiw3j40w8secfbsrlwwo3ny09fwm1','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sCyS1:Y4R2wK1xNIdylmyeznvr3_wLTvxTOOEp-gDRpHQy9Fk','2024-06-14 09:21:29.963613'),('bvgkno586ld471bcd6znc4j0p40l4abs','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sQlVM:5Z02lQzugmbwZ_ZqzXUhnzbTilYhx9jAFK2RBrnEcJo','2024-07-22 10:21:56.848026'),('caj7ylqdt8jm2fp6lh8spbvgp1yffu8h','.eJxVj7sOwjAMRf8lM6piV3mYkZ1vqBLbpQXUSLSdEP9OiioEiwffc4_lp-nSugzdOuujG8UcDQZz-F3mxDedtkSuabqUhsu0PMbcbEizp3NzLqL3087-CYY0D7UNTH0MSqG32Qu2Fpk9J86BlSRTVOudI1EAEgEKRF7A9wpIETFX6ce5lHqi-trMLEgsEFvvvLWEudJtHdGyTR6AnVqtve9zGF5vHHZMjQ:1s2MZ7:9OTKYPHNMPiWtqf8aT5BeN0uDXxi1Nc6vTRxLIZwRPg','2024-05-16 02:52:57.574528'),('cc5m5xrgorffzhefpg4ukks60k265o8i','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCzvB:CVAGtYI-Ofjsrbzr0a4r5bdfA9l8Qqa2thlpCEfGXRc','2024-06-14 10:55:41.022018'),('cdvf0a3u5jy1ufywbh13rqzt36l916w3','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2nik:-PVFNUWVOzPjd4driHwz7sRLFNS9t_63dJQz5_O4Saw','2024-05-17 07:52:42.214660'),('chs29gtw6jzkue992al75xkuez3yebxy','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1stOQB:zUh54eGPNnpzdyl7-6EPiFqyLRN0SGKkwuiGbGo-Kws','2024-10-09 09:34:55.302597'),('ci6ki9hmgub5l1rh0he7h5n26hn0ic5z','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUkSS:Hu4OrvcPOVtW2Cr8znxTxzfKBTtBrWzGJrPf9o1ytuo','2024-08-02 10:03:24.752442'),('cl1xr342ijcvfdy4e48gb5t1bf9q2qmp','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sN4aG:seEUIxBTFC2HM709CLKu9QlWckvWd1AdsUItMMYir9A','2024-07-12 05:55:44.461927'),('cpa3pj7lzwg9hw7xip43gz4s8ckzc4kq','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2Mao:hWtznUTGUPJ-xy8VxGsKYE3JrjOwr0L7YZyLEoNUcYg','2024-05-16 02:54:42.392273'),('cparyvwtxtq3jtkl081kov8fjq6xinaj','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0Sj:m3xl8JgsZJseYLeOdPiUHmLZ3QJU7fs3HKjqYGyQ1J4','2024-08-22 10:33:41.362111'),('cublma468ssgmcrt49juedz4mul3ukd0','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1rzsAd:0BhKI9gftH2Brnaabz5bN7kQm2yVbpy5ZltI4vp_-I8','2024-05-09 06:01:23.403599'),('cymmmv88e8oz1rch44gosi8wndubwjcb','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2Fh:I1LvachRaBvRp0I2U-P39I9bEYS5c6nqBqZ_uHYCjxA','2024-09-05 07:29:01.256643'),('cz16a8tsz23h8p0fgxyh1x8un7tjb49g','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4Eab:Ug9Po7-bRIDCGx6A2ZVNzE-aUiqC5FpX2JpV4UFMkWg','2024-05-21 06:46:13.251782'),('czrput1x7q14ap00dzlaloh7hboj2bjh','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUgaq:wuTPsBv9ZgR6AQUzxx0SnuavyBlb-f4Es9Wdv9I9joI','2024-08-02 05:55:48.936504'),('d2dustb8aijjpchghgked3n5u2o8675q','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbxkY:QSOGlXsgqDjwEsGqpfm-B3C0XK-BpnRBwcvwe8o-q5Y','2024-08-22 07:39:54.049727'),('d2oqqn4quvnr4ttxcusivgfq6jc1w15z','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2r0c:cwtyhM8D6YAX8tqVeh5zKvQzZDa_y3YocuaZKBZjh40','2024-05-17 11:23:22.915444'),('d32i2c7zbbci8651by8felx2nmshgpjc','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sPeCz:oQmutoSTFA7blys4jIDMlarOL6sbQj0A-Uw-JjzrDck','2024-07-19 08:22:21.032960'),('d3h6axfpqpe3y7rb3p2obf494vnzmjcu','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4Eau:Doi25YOdbgrdG-m5cLDIPL_fAbkVaop7A7Mf3-7O44s','2024-05-21 06:46:32.266718'),('d3pjur6y9qf1oukak5nohosu9zlk78el','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUffu:ni7lkgp4-cND6IKs5rEljkW5ATMAHp6pCMLwYaWm8lo','2024-08-02 04:56:58.698829'),('d49bwd83m8liue6dixf3hrxjb9owrtqv','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sMmGO:dPm_IsPMhtIYQdtOzJgQdclRbfOaoqVnXKXGiu5Jyps','2024-07-11 10:22:00.677611'),('d49xbyq4q1wzobontqjesqjbto2mh1s1','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1t20nT:ZP2qdsveqo9c4ht4Hq4yslIkIk3yOr917M5T1Qy035Y','2024-11-02 04:10:35.527659'),('d6jl2tb99u7hdzwwrbpj730786cwiw2q','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1sy:mClIftj44F5gzDg_Xm6j7KWlitne3H_ZhMZKNrGHpzw','2024-09-05 07:05:32.527392'),('d7luafc6aisxne9vgdnlz03prll0klnb','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOuxN:i4e0okLUCLeRCTVjZL4X0QPt7umDULiYfD9EQVNmrOQ','2024-07-17 08:03:13.791542'),('dd2t8bghyrze39w9r51jd2qdvucxxq98','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sKFyU:V6EtWjzk-307ngtcl6SSWtifQZHxhd3kRHdwZfSYBP8','2024-07-04 11:29:06.546721'),('dlobpp6xh4gesyrhgid6cnppykrvpak4','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sbCy1:ugn5mE1asjd4b-y5ut1axUY6_wSsPghrFWpX7zFYmWk','2024-08-20 05:42:41.402011'),('dp3hz7zmu3sttafq8jv8egtpr87ai46q','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUoyF:6LUVdnjJXEeMoquqx5sNQmTMeKhTOoPG3dBJtTuAugg','2024-08-02 14:52:31.286653'),('dqds2i9v152ed8ersjfesl96fxt8ebe3','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sCzYS:ZXVp6Va5GwtEaH9cQcwoWZ7s71PRX1NVpPM-w60Vucs','2024-06-14 10:32:12.662624'),('ds5orkfaqcg9lymiz746ahdkdzjgm6p5','.eJxVj0tuwzAMRO-idWHwY0l2l93nDAZpUXXawApkp5sid49SGEULcEFyZh7BbzfJbV-m22Z1Oif36ti9_N2pzJ-2PoX0Iet76eay7vWs3dPSHerWnUqyy9vh_QdYZFtaOpt5BjCJyizQahjQI_dGbZaMQUPCQXzKQBG8AvkshBY0R4-hQX-Ye2knGi8ASIaRBqBZI_U0MhLCqIF96iFFS5lH1Jb7_Y2PvpaLNYRcr7V8WXX3BzDbUqw:1s9ysA:st2FdapRsrLWiDJ91qnurqZ8f7ac0u6O_R-a8OuM1no','2024-06-06 03:12:06.074461'),('dtgn7nzvovjjkeyvcsu95gob2uk9qzl2','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sgh0C:2le-U0s5NCAm38tV1sIqTdIWOKSQp2j_i4dxEnSe__g','2024-09-04 08:47:36.673714'),('duzfck9289ful278our0y1m8vn0qv9ww','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sHJDd:qj0BmOM4TDZyX4Mib8W57G68JY4wcj3ybs2WtWWAHv8','2024-06-26 08:20:33.738188'),('dyz1sc40gx5rgzvchlhox89tv29rtv4b','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sN6kH:6e_gZFd8EF26KWOgRe-ezJuu13ner_15FFd21j098Pk','2024-07-12 08:14:13.512703'),('dzteuon2sj0bvjk7hvu3pxgjcc64r6cz','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0fk:fz3-q_uhedYrmRGuVbykwW02HncMVXj00cP3RCeecnk','2024-08-22 10:47:08.235446'),('e1da1gtk8b01rvpfpf08jwyyztopegsl','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sPdiM:9PyVKloqiWdUXwWOA7mVsgN2fGQbeyQ2WtREJVf9BV0','2024-07-19 07:50:42.207624'),('e1j5fj3ycsvz759vc89cqxa31vxrthmn','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUfMn:IUJnrP9ZQDnyrwEq8BH9--UJ46ObewkgyOYPITgNn64','2024-08-02 04:37:13.753643'),('e735s0g1qm9t4uuj7agho6uf97gdl7df','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sQjKT:lD-knT-Szbo4lI_jFZV9c7enYwjlhtlUbyQTRUUrOqk','2024-07-22 08:02:33.835243'),('e83gaz4wbx07zfxwmun48wzg75vnr1xl','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2MaW:NXgw9cg7WSHvh0xx1HPkRf00YDQWXdzEvwV9pCvWuUs','2024-05-16 02:54:24.098345'),('e8lzvf3prtem229uns0ouil16ob65m57','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1va:9BoYJDUiYHf6hNMaZG0l-6dT4VSrv6bn6Xuf_KLQKu0','2024-09-05 07:08:14.462330'),('ebyxsb3h3qzlvda5m4oecluiabr9l9s8','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2aq:4wMXC_-LwS5zKcijbgjUPqPYQqSGy1X9HggvjroIJng','2024-09-05 07:50:52.666901'),('eek586vuwwbuajnq1e5affd9a75c4hz0','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s989I:pNSPiXpnlRF2ArZCKQDk6I9qw1KsKyV4vPhZoJS1Kpk','2024-06-03 18:54:16.394064'),('egatoeva1eq8bv98x892n8p0mob7vf72','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbEr9:vq1XQELbkOZ8r6omd41axAEl_fQf8hEYlLYWn72UMME','2024-08-20 07:43:43.384430'),('egn1oudx2j6vvo1x1mgy3o3p64c5c2qm','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2oda:EYvf_kJPLaqkrKnQwsM-fIte4DjHdAXiuqr3i1G_5vY','2024-05-17 08:51:26.879259'),('ehdwet0opfjjktbxz4rh8tp3quylawwv','.eJxVj01ug0AMhe8y6wr5h5mBLLPvGZDNeAotYiQgqyp3z6RCVSJ5Yfu991n-dYPcjmm47bYNc3IXx-7jdacy_tj6FNK3rF-lGct6bLM2T0tzqnvzWZIt19P7Bphkn2o6m3kGMInKLFCr69Ajt0Z1loxBQ8JOfMpAEbwC-SyEFjRHj6FC_5hHqScqLwBIhp46oFEjtdQzEkKvgX1qIUVLmXvUmvv_jc9-K4tVhNpqWcajbO7-ANY0U1Y:1s9dsb:ur0RbuWBxVlNtifYwp7hZk5UwljAJa-OeP7ZLivEIqA','2024-06-05 04:47:09.848152'),('ek3dxtcj655acru5w32r7hpkz9o7vwop','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUmry:LmelUwgzaA6IKUhgzhqvYmnDva4BxeSQ_uozr8mS2mk','2024-08-02 12:37:54.233343'),('ekabccsrweemasux64ex9u3lsoe8x4j5','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPGh8:_5T-_CU0Lj68MR0zwMCRl9bSR_EHSoKELSn7DNOUm4U','2024-07-18 07:15:54.966946'),('em6w5wcjj6ix1f3ddm9sj1ikbystifd9','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUozb:9O5kxsVRRbr5lmv6ZRUGVMTwpBICCSG9i7RR6MIzrHs','2024-08-02 14:53:55.025369'),('er5ayfo9vdllmcea30xcwubwibyt250k','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sKAVg:ugVRt5OpqPXSSPnhfmgF-mLVdjV3iVLtUKlb3Vdv2vU','2024-07-04 05:39:00.389086'),('et7db550zoy68n0a5rtk6mon6l044z0y','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sHGHx:qgqsGDEOz0ck4Gbk0QIVtOK4Uznd_zACvn4SkDd5TBI','2024-06-26 05:12:49.263276'),('etx1b1lguaiyf4fe7e7b76pzq9bnzunc','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjN9:1s4fL2:B24VZ-ikTsV7vKCZHE3zgTOY4Zmz55LUboDkujJ45Lc','2024-05-22 11:19:56.100749'),('eu0eyxt65o9c9vetb8sv4oml5ungxhnn','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbDzW:xb7kEIgumUF6qE_XkiBegdPpl8uAsyCEYV2ce19A4Mc','2024-08-20 06:48:18.558651'),('evj3twaqo7fqf2n24mfvjtja893suawk','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EAx:2nOfHj9cNq2FpeaenjdUKxu8ZwU4DfbmW3eUoUi2EI4','2024-05-21 06:19:43.346527'),('f1gdjy2srywssnsumq8jt4m73kc3hl22','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCYGM:XafX2hxED4qFKFvVMJ0_i2cv2uXPnO7QpFxCJeQmT_o','2024-06-13 05:23:42.945461'),('f3agw4lfhguc40c2esuis3nqpheu4w1f','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1rzqZ8:x9aMiBAjGRwRxNeZ_fwpi1RSdurUGiJwSExlDr7BcGM','2024-05-09 04:18:34.814882'),('f3prgphveyv2za57j7ibf5dyrhu2esmw','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1Oz:UOQSeHVfqd5Jh-TZchjBDUZUFGPKPD4gDFOQt0b3JZE','2024-09-05 06:34:33.785411'),('f593avc6yrghdmufwtdfa6xd8f4sh42r','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EA2:WENFyaiPisg5KRkmowrPx91uyTyCZAcOeyeMUxIrGIY','2024-05-21 06:18:46.921784'),('f5xa5yf958ij5fpye9bbekqa5evtb1d9','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2UT:_8ilUwDoR9RD0zI-TqiEsZFuXgvpjXiFYnClhKAoJK0','2024-09-05 07:44:17.143306'),('f7k23hol0tbalmne1yjstuv4vyi4eu0i','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2OA:bbLiXi7m6ljOolUT0OM3ueZVDdUHXA6ITF5dxgp_Q0Q','2024-09-05 07:37:46.415644'),('f85haq2i32uzqi7dun4w55np6rerq0zm','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2nij:aYIg3EYdaroAZ_3puM4WCDpLlcsZ7USILyX5_03cmIM','2024-05-17 07:52:41.925444'),('fa6mw6d6nd8x9ez07i9stxvmv0b3f7re','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sJpfN:tkqCQQeYGsHM_FZs7zjN9Hx2o70oVFwsGxc0QAI5Ri8','2024-07-03 07:23:37.093056'),('fdrk53du44qszgid1q2mbubj99i7h6z4','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1seAmZ:AwIYwo7XvQQZC6Ir1J7tZZnn9bHjoEhNCTFmKVsCRvs','2024-08-28 09:59:07.157707'),('fg2l9mx31dfg4h2qr3pij2csv11qae84','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sRTdV:1NFX8xBzm7_MRvLzahwn0NdplJeCwf3iSjxzQScV6io','2024-07-24 09:29:17.099674'),('fgjkgc8t03c1pkh1o2ixsq89595zje9p','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUjKZ:lUy3OOTEDW-_k0oikkVTTZy2EPgkpmvW_2Q0lFuGcMc','2024-08-02 08:51:11.244321'),('fh4yhla2wwgmd0u1atf8yl9bb2hiyfb2','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1seqH3:V-yWXkwCwBuMWZfTU5jPX52FHwnIjvAe-IvbvQQb4IE','2024-08-30 06:17:21.390071'),('fo9ju8g56gb4g68a63balz41pi7fooab','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1wx:n9LyRWO29l_Z4oftU7V_4f4hV4MwD3zCWAfyokjScZk','2024-09-05 07:09:39.018672'),('fu5rnbumlpbk26iyxex951detjrvng74','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2U5:LuNbZYZBVu0WG-VJ82ZdX_3C9nL6hUnscmNe7XH1TNg','2024-09-05 07:43:53.557354'),('g5ol7wkxiebfjdopvi7q7o3l41sdi8be','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sW9lD:ANT8PEpjZbaqT9fCj-UQe9n1IylZx369s7Yi-VwSxuw','2024-08-06 07:16:35.171240'),('g7s5yplynlxe601fhpsihlzztwsqwmy5','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EUe:MnRxcRkkXIzgXcxr0mFOZajMfPYpYHcGDxed6DORbEE','2024-05-21 06:40:04.590933'),('g8jt9mcfb7mncgv57zugchinplvsfvzv','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUnJ5:dj8eJ8Hu9CV2KBObC2XrdMW3OjQWtwqWxqoZe3s3k94','2024-08-02 13:05:55.382500'),('gepuwgz7j6h8b1fl5ldgl7uvq8p3ksr3','.eJxVj0tuwzAMRO-idWHwY0l2l93nDAZpUXXawApkp5sid49SGEULcEFyZh7BbzfJbV-m22Z1Oif36ti9_N2pzJ-2PoX0Iet76eay7vWs3dPSHerWnUqyy9vh_QdYZFtaOpt5BjCJyizQahjQI_dGbZaMQUPCQXzKQBG8AvkshBY0R4-hQX-Ye2knGi8ASIaRBqBZI_U0MhLCqIF96iFFS5lH1Jb7_Y2PvpaLNYRcr7V8WXX3BzDbUqw:1s9zIu:z2WZc2WKf4LbAkoki2EiunjNJZVtmamru1pHbKthqrA','2024-06-06 03:39:44.082939'),('ggolop3vnfz3k7jpujn4py2necn0vv7x','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sarpu:4rdjXC7-CmynSOJ26zeFPawzA4X_0NQ3sJmCkiriMV4','2024-08-19 07:08:54.009776'),('ggvzmbni5jckz4m43daohee47caxfnfd','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOutH:61zj3Cy3cXLOX0GxJ_mDAH0XctH3IwDBGt6eYN7V550','2024-07-17 07:58:59.270834'),('gi50lytakth7ofldbzh37bu82yrfe7u4','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUfQJ:H6-tg_0b6x-M6AMWoRUdEr8SwgDVRtcVDxAQU3jJNYY','2024-08-02 04:40:51.000078'),('givznfq32lfmg3fk9qo64h05amicwv3j','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sCE8f:DmXDUEjvySmn1Ka_4uaxMlYHQpRUMm7tB-2lAU0mM1Q','2024-06-12 07:54:25.672388'),('gki265ihnhrq61jpubopfnbzhqsh8q38','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1seAgq:yys-D7aMeGI_rl1rKQu0Bk7A_82QLDoClEF6_14TrNA','2024-08-28 09:53:12.749066'),('gl8eym6wm7js4hsqkm0mbivzfjepq3o5','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sFSBL:c-1Jh3sV8rvVtBJVom-yrbXFrF50ktdoWJzWMmSwW6E','2024-06-21 05:30:31.982423'),('gnj5wyp7go59c98rhvw3n41v65o8ysx4','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOBhw:p1JZHWC0UONqwBg1VXYzQUXpyre_GNUc_4WqQQ3RPDA','2024-07-15 07:44:16.307982'),('go3jfg02du6pps7kp1obnvu0mls9gmnh','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0ic:xFDHeJY8wS3BpN5trkkO5qwiHUKsNG-U8nvP4wj9lvE','2024-08-22 10:50:06.598482'),('gssgqz3tzgvayk9r25t59jl3ttlf0y9e','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sN6HM:hlWcMVsdZFp0t7A5Xectb4UI5yYOU6znBvI88Dv6FDs','2024-07-12 07:44:20.361070'),('guvr0kjl4a5g47s2dr85pj1un4nxitxh','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCYFV:tVlpYRPRXEsb0qa7FwPxoKpZl87aMfKGbuxpnraDSX0','2024-06-13 05:22:49.989684'),('h1lnp1s2jbgc0w2jdkbbt1dhyu6ls7ow','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sFXGX:PoOnzwyAYnG_T7MKe1XvBNWLrdrtKSvdcM98vszWSdo','2024-06-21 10:56:13.382317'),('h1qainor87bgq9c0431n6yn08xsghwh9','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2ay:SVIO94rx9rGpqa0l-BER89MJBdwxlBQKRKVo1bu6dQw','2024-09-05 07:51:00.923266'),('ha20b9hqsqmwfcn608t0v22nkx3zu7ct','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4Ea7:L02tUxeGiNaorDjHtnSau77SfMMM24NhB5V6udEcLmM','2024-05-21 06:45:43.790125'),('hfkzywl88ld6l3ijb8fb1skw51z3ip84','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2Kv:nuHKe2M6WhrYJj-GSnSuOTj0Rhn2uxdN3er1DfW6mhI','2024-09-05 07:34:25.171662'),('hfomo8zv36rq7g937rh6vzmctywkssv8','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOEk4:Y68fFbEAIOAIFy-nruKx3iG2gKR9kb2VNWRfxtuJbsM','2024-07-15 10:58:40.107907'),('hgg5alwzrhkow3ez2d1nkereflgr4ofu','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh10o:eYxLEsA4VZemsX6cQ9G73PhKLnuAIt1ltjSENkqr2dU','2024-09-05 06:09:34.341260'),('hjpt86ci1fcg0ytzh2kcb52o4ftllgf4','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sdlfu:8V_VrVj04qYFPSEfjw-Nt_lIkr6n3Gk86DzY5j6l8z4','2024-08-27 07:10:34.956077'),('hlt8i1i4u5i3iacu9vuigmwfmjcv4229','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbc27:thFXwytLgOQhKyxpj7Bmap3_vYYk2cZIfw1esefBtqQ','2024-08-21 08:28:35.083849'),('hos161r2yvfk1084t0yi0hnf39w1xy2r','.eJxVj7sOwjAMRf8lM6piV3mYkZ1vqBLbpQXUSLSdEP9OiioEiwffc4_lp-nSugzdOuujG8UcDQZz-F3mxDedtkSuabqUhsu0PMbcbEizp3NzLqL3087-CYY0D7UNTH0MSqG32Qu2Fpk9J86BlSRTVOudI1EAEgEKRF7A9wpIETFX6ce5lHqi-trMLEgsEFvvvLWEudJtHdGyTR6AnVqtve9zGF5vHHZMjQ:1s4gHm:RkTnZrP7QuKOYixoFnJbDiHj0hCUGNVN_h86zVQmfsQ','2024-05-22 12:20:38.593904'),('hw94rfbnzrtpx21tz4aci6qx0w1ltiks','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2s1d:ljRceh6sB1xJQ3kE4w0LYTucPAn0CTKuUub9NbVf6hI','2024-05-17 12:28:29.381097'),('hwx4mzm2z1e778frqhrwt6krfrstdgum','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sWfP0:R6jFlXOyI1I-LQXTaaNmoBcUMh6dBZ4I75Stu3kv_Bk','2024-08-07 17:03:46.795057'),('i0w0jzssvwz6i31pk04cjtn77ysugwwn','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPakw:ZWF8QrLvprIMWstAIYr7sXt77K7__r_u1tJBLUaxh6s','2024-07-19 04:41:10.379698'),('i601jvi5g8vp8cw6zc3azaujiurhzsf1','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2FP:TlOfREXilKMoovLaymUyv1WW1htuUpRH_ijS-R95ePM','2024-09-05 07:28:43.464562'),('i6f8d8bvb3fiouravk2ou6ii2ug4t1oq','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rJj:kE0twEb3hv3SOAFEVUI1qrRYjpgwi_xOx05BNB7XTRg','2024-05-17 11:43:07.248424'),('ib28qzzjjtqokggk35pmnwoougw1xdli','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4Ea4:MVqsjGmjFOxDmCjdAklBSsbMNUyt2aGKJxfE0QgOrA8','2024-05-21 06:45:40.194945'),('idf4byvjekickjhnca36poje1nhm7uho','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s0DBZ:rVsdBdG2AqHA68cgQ2UWveaMad86UPXm14Mvwt7lrsQ','2024-05-10 04:27:45.257376'),('igevdcj23ggbkryr676g3jw4010n25us','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sRpJl:JWz8tLbfQfpUXJrrObEjnWonKVImKLst0d3dwz8MDtM','2024-07-25 08:38:21.675017'),('iib22kj6njbu5w1szab382pvwlb4xmpx','.eJxVj7sOwjAMRf8lM6piV3mYkZ1vqBLbpQXUSLSdEP9OiioEiwffc4_lp-nSugzdOuujG8UcDQZz-F3mxDedtkSuabqUhsu0PMbcbEizp3NzLqL3087-CYY0D7UNTH0MSqG32Qu2Fpk9J86BlSRTVOudI1EAEgEKRF7A9wpIETFX6ce5lHqi-trMLEgsEFvvvLWEudJtHdGyTR6AnVqtve9zGF5vHHZMjQ:1s4e23:zvoZduA176GUSpAbS5IS4nxKxfMHbfUxTmd7QGBjvW0','2024-05-22 09:56:15.225070'),('inltlvis3kvethadhr4p8y3z4eou9ilc','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EYs:xyZy1nPHMn0MmCzKvS4Hrr7i3QjqRSCoLqQl7Z__WDY','2024-05-21 06:44:26.434252'),('iv7a8zs5i8y6bvf7d8xzeou03ilx5jsb','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sBxWf:MIpMA4GneobRq5BcNN8zdc506NdCHqk4QjN9xafSLM4','2024-06-11 14:10:05.675948'),('iyjzz7gmm7ik51szug12r6po1bajshny','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh0uB:jvdYbUGg7UJLV9F7RZhzXAJHXXEW8row_GlvtQa3Ovo','2024-09-05 06:02:43.642052'),('izhqnd0swb7shecatt8k9hesbznudqea','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sBxQF:zPHGCrqRaiFfVA0Zd2xCts522LRbP2ndla-9SDuVXJ8','2024-06-11 14:03:27.359059'),('j1t6uwzbctl3i1j9z0jzv2worxoi6wt2','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sXJwY:oFkqvk5rn7tUA0VoKso4ljS6jkLOo2yGna-f3pgfJhI','2024-08-09 12:21:06.723995'),('j3umm1m7lwg2cm7eennpph9onypi6kg2','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0JR:6bpX8G6-80a7TsXZH1lXw7vU8jCk0QeylYB6NY5bhwY','2024-08-22 10:24:05.982516'),('j6x6t2u9pl9ysrte2jllcdsp7rfviagm','.eJxVj01ug0AMhe8y6wr5h5mBLLPvGZDNeAotYiQgqyp3z6RCVSJ5Yfu991n-dYPcjmm47bYNc3IXx-7jdacy_tj6FNK3rF-lGct6bLM2T0tzqnvzWZIt19P7Bphkn2o6m3kGMInKLFCr69Ajt0Z1loxBQ8JOfMpAEbwC-SyEFjRHj6FC_5hHqScqLwBIhp46oFEjtdQzEkKvgX1qIUVLmXvUmvv_jc9-K4tVhNpqWcajbO7-ANY0U1Y:1s9e2F:y9Asra56F99_qO2uScmBqLoO1wKcsDKYFFAKx3nqBw8','2024-06-05 04:57:07.337052'),('j6y9tna3i2l3y9bz0h6gralosy2mq8hq','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1dz:ucsuZB-Vjmdg_NK3u-2jgGgNK7tziX4PmtrGKGIZu0o','2024-09-05 06:50:03.362444'),('j77u8k1ewtfe26gzm6pkjqeqfnwg6c2m','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbayw:JN63qOtOeMKC50xK0mM_3WE7jqN5N3Ot2gbf1PT5YYk','2024-08-21 07:21:14.904899'),('jeif7nje825843hmydy4uxu9ohgegbjz','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s97Oi:9yCPllWVvRFncHUpcnU2aLxYZTaQYl3W3iSvIDgUR3M','2024-06-03 18:06:08.362564'),('jhvo1hbk52yh0x6oyvzra7dhfywd0p1v','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sasUP:2QHlF-hEcZo0IT0lsrOEz-1WBCZhJlsaw27xQVdhNT8','2024-08-19 07:50:45.922852'),('jirw3kg83yarx1giz2my31qs1i2hpxlb','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1shQ8l:iNfyUMugWtkAC7xCt37i1aFAw7EnNHUBEZpWVxDfOxY','2024-09-06 08:59:27.120950'),('jnc2j3v348aysuy66jztcbkzzs0er4q4','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2NH:i89ZkPwqvJTqBnN1nnPz8DCDhDEz_yAwy5Zyyu_Sviw','2024-09-05 07:36:51.749088'),('jrkmt3f9kbq12pj4ugm88blje0ph5qxm','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbzH5:9JvkA-l62eIJrxmbj7DvcClZ7kHBlID7MwwSdiu1hI0','2024-08-22 09:17:35.984955'),('jv5j991q45nqj9iiml4djm7io7z9ybll','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1skvdn:bvEcecElvbYLrxTC9SDD6kFZVoJ_No_trooam84BfPQ','2024-09-16 01:13:59.816343'),('jw8wz9eiq0iyubamo8gc6t58pdbxpv2b','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2L3:_R8nGXjkbjESemYzkkk_XHi885Lp2zDUNDw2ZqBsMzE','2024-09-05 07:34:33.840865'),('jxc554m783ywt4t19assvixubx3febvg','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2PP:6b3Ifh0tibZR2jv5W5zHrd923DR84vVioDBwOAH6vIM','2024-09-05 07:39:03.155589'),('k3xiiygnb79lny8fedou6abg8dnjydwh','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2OI:Kxag6qV8TaJeMGh1bJ08QgJjQ4VJt6TsZDNGDs7Ex1A','2024-09-05 07:37:54.731727'),('k8henxkv6e7en9l9i2uhuhimnwegnwgw','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0pr:LKsbGNETJCC_fMQIeCmwEBdI2YozGnXLzQJ82W1rYrw','2024-08-22 10:57:35.367441'),('kcwvadaahlqjwmub1p3460ihtpayms6a','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCYeo:Nt26wh7qPsZtx2629Qr8QtLggVybH3DN1kvSNZu4nzg','2024-06-13 05:48:58.104653'),('kha02d66nzif0hb07c1mvxt37jw5l5l2','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sMOtQ:1HMtDpw8npCDeorDL2BUdN_svMMzhxPT-0c5ocus09s','2024-07-10 09:24:44.186726'),('kp6fhqcjirz98gk2v6gqee7g8bbvcsdd','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1stoz6:DuHUcv2FqnZ8hbtUB_H6rTnJqYHkDAtweNEuj6JrSJc','2024-10-10 13:56:44.799321'),('kq607jfa8botzmm0a8c9b1596ex53bo6','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc0j1:lfUxCFuCfLIDeKkS_z54l1WndbL4T_NwjU_C2V4UJtI','2024-08-22 10:50:31.772270'),('kvoohwka6h6abptbnp5cjplzsk2m4qaz','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPGkZ:SQgHV3P3o4hawyIw7J1BtZT1kQ2CPAzIfS-MX-KpD2U','2024-07-18 07:19:27.989843'),('kwhcs6o0jhynf0q4dy0qztxnwj7v970o','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3LCJ1c2VyX3JvbGUiOiJhcHByb3ZlciJ9:1sUnSS:19isQSmPLgu8TpWYuniftWcwNeVU9rfp2A39O6xlXSM','2024-08-02 13:15:36.894446'),('l6na7xtniekqmqnf3rq3tbkmdfy7789e','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCMJG:lX1HhrQRhIC3ic5fmWaDBnalYdbc0HRle0kTp8qqMqo','2024-06-12 16:37:54.893633'),('llfbz0oqqvyzy0zzvizd0pc75njbm4c9','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOCW8:Dpf5MAPCxSxI-lNd6-SfcZfbQnONnH_LZvhia6r3Hzs','2024-07-15 08:36:08.744504'),('lqymnk6v3hkz0qw2ydpanrwajjj89e08','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EZw:jbZI_LVuPgEqvA_xuZCTVAqf3Sx2YYtioAVppNVnl7g','2024-05-21 06:45:32.046042'),('lt8h754v578g01xzjl0h9hru8k09xnf3','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sgODK:cvvMusNYckY8DIjEK1ySdZ_kRmjYOvsFnSR9vY81Cag','2024-09-03 12:43:54.532183'),('m0e66sbft87tb10wm8muy3krszru6u7e','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sXFYb:HlJmJg86WHUAb7snZmrLeULKf7GxZ5crgTXq1HB-kak','2024-08-09 07:40:05.213500'),('m5x3k7uz60hjpg4zektqvwtatvcxsszv','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2r5O:I0kzwvnM4Rb3WqWrBNkM-mhnf2C_gFQ87zbc8K6xR3I','2024-05-17 11:28:18.678719'),('m69eh1r40dk4zhpgwswox052s8n07jqv','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sjXE9:j6jBwow_RUGGFbSXW8hvDVdmIy_Gm8lgqHM3QULBob8','2024-09-12 04:57:45.079950'),('m6kndgjo9e8pt85knvnzq1vqvqzhth32','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOFFj:7pia8W6U6ZWTna5d_ja62AUxE6-3KrP4Bhqx6FwJp0Y','2024-07-15 11:31:23.845022'),('m6qwkeonp3xuqbm8j790i52ugie6tbwz','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sh9PK:-yLZd4pusW5TmgvbFLeObIyQ7w1tVqGKc2Z3ogl0t58','2024-09-05 15:07:26.903674'),('mayeagm3qbi607f24gcr0o8xj0uzjkkp','.eJxVj0tuwzAMRO-idWHwY0l2l93nDAZpUXXawApkp5sid49SGEULcEFyZh7BbzfJbV-m22Z1Oif36ti9_N2pzJ-2PoX0Iet76eay7vWs3dPSHerWnUqyy9vh_QdYZFtaOpt5BjCJyizQahjQI_dGbZaMQUPCQXzKQBG8AvkshBY0R4-hQX-Ye2knGi8ASIaRBqBZI_U0MhLCqIF96iFFS5lH1Jb7_Y2PvpaLNYRcr7V8WXX3BzDbUqw:1s9e3X:5mJVkmCMQKwD2Mx9013ktAR9wAcBwM-mdfHna7LiyLY','2024-06-05 04:58:27.850740'),('mbnb44qqod8uabwelv7325l9f0chk9ac','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sgKd6:wrSvIb6tgKVdHX1FMfdpBoFvw4SgCxnXBZB3EqTkR7k','2024-09-03 08:54:16.005264'),('mbojjv74niogzghs39wwbvf01ppytses','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1vP:ZTuQi4WkW-VGFBRfH14FsLveBuvLbbvwXS29UqHWApg','2024-09-05 07:08:03.039356'),('mckoni2k7eywarbpr3p74ttk6nigttj7','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbysK:jgziVEx0O2M_UR7RJwKntJirKcK7gISgCwIIIJPCP80','2024-08-22 08:52:00.670558'),('met3ahtatlutpnrfqhqyfd0jjal0k9ln','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2MaK:7alI07eeTe0z78PmbqFWWpaanI2yxLMRUZCbJYVbkGo','2024-05-16 02:54:12.099487'),('mik38yjn70janmeypfhh76n7q2bwmtf2','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbETg:a-sHvfRfbM8nKNOkUUeRXJvo1eQsqLNvoq4hmvguxvQ','2024-08-20 07:19:28.922874'),('mpulp0ufqa3l5zg7dzqoqrx3j7x1vk3d','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sO71R:UYbETxxWd46y6FYvyakzFV9GR93SMEX0OWZ7jtFnYzA','2024-07-15 02:44:05.827337'),('mqan9ieviuptf31ykri75dcr168knh58','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2nih:ZXVkYkd_u_WscOwxJ2yoA0Q1h4IJiZnnXieeZuuADgk','2024-05-17 07:52:39.407537'),('mvbrwrzbmzrmx1zyyh63anox3ww1l7im','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUmpL:78u3GWTK8pqgAQk8H7lgYi8tLippWOAixsbsIl54fgo','2024-08-02 12:35:11.518614'),('n3xthaqobb9qkaj2ekx55wwaveepkggr','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOzmK:NKzY0ElSyuP4AcA2Zes8Q0fCp2zQiByKYqpH9tWTbNc','2024-07-17 13:12:08.665443'),('na50wzws9vkontpi5ds5002ujzcerdyw','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUmpr:YFrHqDkeHfM4kNMsKvWtRGmhPZnJDfVVAgdsvrjoVqU','2024-08-02 12:35:43.962731'),('nhv0nz06wxoiyee74p82w45ukzwvj6hu','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUnIG:amrxlbdUYLFPzJbKjkcjcXa2HHzI_2DFVAulH9QZWjc','2024-08-02 13:05:04.845633'),('nplpxqzh4l0st07r7dsx0bo6e3bzq4w6','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCMUh:FnkqNUP4CIYkV060WRsEcjxKzx1xbvuUynLauudc9E0','2024-06-12 16:49:43.684605'),('npqfanl96ya5m5esl2c37u3000aajmkq','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2OZe:kEdAEXKia9Edg4IvQH_7uNdmSLb4lP6zp2qttm4dSqI','2024-05-16 05:01:38.137675'),('nu2t1pd28wz044sj5a6p6uupuggiw5a5','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUnb2:E2uayzFJ-P0jUHVteDf1h55qbsOxazb0NY8f5WwbEng','2024-08-02 13:24:28.628260'),('nuu9q2zzhze4hwgae7vhr56zicox2u92','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rBA:9SHO-pgVxNkb3o0Y-XA-qD5O3Jg-Ah_n27176AcWSe4','2024-05-17 11:34:16.226042'),('nx04d5ieagsa5czah0kkqa4ii65dshun','.eJxVj8kKwkAMht-lZynJrNWjd5-hJDMZW5UWupzEdzeVIgq5JP_ykWfV0rp07TrL1Pa5OlVoXXX4vTKluwyblG80XMc6jcMy9VxvlnpX5_oyZnmcd-9fQUdzp-ki4i2AUGRrCXSaBr3ixOhOBQOHjA35XMBE8AzGFzIogUv0GLT007mMitA-h8YpHWyGfLQRXSEi8DZjZOGSbPQuJWLNfb9T2usNTY9MuA:1s2nhP:2W0djJ_bqn44NTqXd_cykjXv602FS3_e-goE-UeHP5A','2024-05-17 07:51:19.454280'),('nxsfdoe0gy0jnbq9qoafvblawuy2os2b','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s0DI1:wkl9XtmAvvoaL05LcQIaI7Ryi2zLytLVGj-quT-B07M','2024-05-10 04:34:25.448531'),('o2vsiah5b5s0tfdvjfm6nynswc1dbjrp','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOCWT:886eYXsJ5-bv1s7zNp-xVoyoyLXlZ7fBSrvO_mYehxo','2024-07-15 08:36:29.961640'),('oa255oy805x15s9t5qlmqhyiptall218','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sGWsM:snno3chackwZU4nPgO0oUl5cUXqCscD-nm2nLACNmFk','2024-06-24 04:43:22.356067'),('oam288frusmvu8ch4h04gpvz789mpey6','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUkC6:YMNvLWkU6aoZWjlBUXnhIgktagdAy-S4Ai-3bLRbFTI','2024-08-02 09:46:30.214523'),('obcnio34j5xul5s1xvuffipardowq16j','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUojL:7NDhkJiSz-1nQjDvL4jpKL9Mcxs1aAO48mlusGDYmsc','2024-08-02 14:37:07.214535'),('oez1byb3i0cvqbmeyd091nks78bo25tx','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4Edu:bbd6sDnnS6aPygj0WYek8tlRWYkbZbCadEatkpGlG6Y','2024-05-21 06:49:38.420101'),('oj9hnlln6dipidwb8rzs47veqtzn5uyn','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4e03:5FmYB8cqwDDOSPI6XwwM9lBLPX3D3n31ooA0vI43yOk','2024-05-22 09:54:11.150889'),('otexg5jkyp9pw5c0qa75nyohzqkjsi20','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUmm7:ZbLYLhtee5DE9xOS5eQLMGetDzVwHVaybT08abm_GbA','2024-08-02 12:31:51.458459'),('oumzhi54bgq1i2x13etft96z19ykb2k0','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s41zK:YjG31fhp_BvxfUnTJgD_P5AIeiE9t0BmZMRuftzeeGo','2024-05-20 17:18:54.470386'),('ovasrzqney8t54wzbsfbewk0g4eyt3rk','.eJxVj81qwzAQhN9F52K0q1jy5ph7n8Fof1SnDRbYzqnk3SMXU5LbsDPzDfvrxnzfpvG-2jJe1Z0dJvfxeuQsPzbvjn7n-at2UudtuXK3R7rDXbvPqna7HNk3wJTXqbVBqAzJKBXPUTF4FImShZMYKdNgPvY9qQGQKlAiigqxGCANiNygf8yttonGi97n4gmHBuKEJ6QACJ44hl5PXpNpCQR77_-5cOil3qwh2GYrWba6uMcTcNJUOw:1sIia1:0LOabXM_F12YwM1rQBG1oWszEhtzlnzrxHaccIX0D3U','2024-06-30 05:37:29.906494'),('p64g0qo8br6389rgl49ltwj9grbs10p9','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2MN:Mh8KX7lQYDT6jz9mpKl_pUTh0rXf9rH5e8NutkusZjY','2024-09-05 07:35:55.048902'),('p7i9pyr8cnzuwaeonfb5o3txzvva4m79','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sMThz:kBRpPzme_xyB0LV9NVjtiSVJYS1WOyz_6WaJdvcgFhg','2024-07-10 14:33:15.321803'),('pahxnzfie2cu6mlwlsoxl93zh45d4pc8','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUfUO:oDTgQNFEOwi65xWByVDOq5tAypr3epAiD4qdPw9d02Q','2024-08-02 04:45:04.269466'),('pbbe3fnpyoaxkpip06vcqxaxmgf946bi','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rM0:gMUBDBy7YJBF0FsJdNdGQPVquPZNZlWjAq_5JclJ00E','2024-05-17 11:45:28.423943'),('pe8prfk8pl966fgardle8u32hlwdwvuv','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1t1KAD:ndifeRBfStLHApPZxiRR4muJkExlmcZN7sLkx03TI50','2024-10-31 06:39:13.114515'),('pg4l2d13tshgcvwvyi1dql3a3uiemkro','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sjEk5:oEJM-1P6QI1bcYMQjQyU5bGsfP5lQHR5Zc1OQWS86Mk','2024-09-11 09:13:29.299360'),('phbj47139z4njjvlfsyic40dwymdnrjf','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc5Y1:KR64PMPQyCLT-M4-H1T_E0FaqG4CMLMzmo7KNY9m1s0','2024-08-22 15:59:29.529491'),('pn5v03cr6fjhff9o6g6ricimm8pga4a3','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUndE:9DvDS-hczB98OPyUVRoQ-6we1yacsPCPSbt3mUXXeqM','2024-08-02 13:26:44.631034'),('prxhkmu3qczprw70h0o8u83396ewdsy0','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sjLdC:n8YpLBCo4noTRdmPZb0gjggzU_ABc-cTQiDwAX45a1Q','2024-09-11 16:34:50.306540'),('ptytb5f1jpbcbinv4bnrylbs6sme4hui','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sN4Rf:OpMbgdTcd6OXDYRidFvgiIuCgKGQSPK7UJqca8jDgYg','2024-07-12 05:46:51.888584'),('q5rbbevl3735n4z0kzglnqkfmnideb9u','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sMmEk:IVF_UVKyKcqmqY4vDUAnoUrMhgygCRY4HK3l4H8PeIU','2024-07-11 10:20:18.770470'),('q70pp92d8wx0grfvogjfh42llw65dzoo','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1saqBp:3yVUTNEakZ2jmhytUc1gOn4OMQWJ42MPY5mJd6mgYKA','2024-08-19 05:23:25.427152'),('qes1etusnhcyk17k74452ge5d45p540o','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPGgQ:p_jl2XJuRHJv-D5KCRR2Xuq5-8YV11xczaZcr1X3cDc','2024-07-18 07:15:10.708099'),('qje1iufp7bjwl6lm1y77jfze7tuq212e','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2PG:KLlzj1qCCXrVqd3r2AdehLyZdl3cKilC2Wd7k-Nxedk','2024-09-05 07:38:54.348517'),('qmb676pnu6d69q4jyipfqof6y7qk89md','.eJxVj0tuwzAMRO-idWHwY0l2l93nDAZpUXXawApkp5sid49SGEULcEFyZh7BbzfJbV-m22Z1Oif36ti9_N2pzJ-2PoX0Iet76eay7vWs3dPSHerWnUqyy9vh_QdYZFtaOpt5BjCJyizQahjQI_dGbZaMQUPCQXzKQBG8AvkshBY0R4-hQX-Ye2knGi8ASIaRBqBZI_U0MhLCqIF96iFFS5lH1Jb7_Y2PvpaLNYRcr7V8WXX3BzDbUqw:1s9zFn:N7OfX3AnkbYPZJQ-fmZwlFFppm8UNAa8Mo2xRLd7yTE','2024-06-06 03:36:31.896429'),('qoaszn2xvp8387tyo43lloxm98ixksuq','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sQlTV:zL4nfxXqCzL37KKCarziA7RLpka17O5-cDQOeG-lzzM','2024-07-22 10:20:01.298083'),('qqs8dmp7z6m93tpo23ap5bjapmkffy5t','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EZ5:Fszcjc-h5g_T7SyNoRg-nCpeh_87XcklXBduG6adjwU','2024-05-21 06:44:39.909457'),('qrqpf73f5ywmxson7dv2np8hejo5rrib','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh10w:3HUB2W8klOtDcPu9fbC30YoF-8QuQMDb4PRBmMzrKlg','2024-09-05 06:09:42.665248'),('quawm33cn7eo273wjrn22uv6no87ahyi','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1shIWf:rugkVmwqD68506PPrCYFHaoW0Y-2DS0kEhIoGOSQb8A','2024-09-06 00:51:37.727852'),('r8estj41dg5s5uairdmoj1f1kzgk2g3r','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOzvx:Yyf0MvRYN-0583gDVDskABIdlh5cptjhbLdlx8udKzg','2024-07-17 13:22:05.128521'),('rac2ae3bz866dy74gwhiycgr2s3p16a7','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s0DB7:0juPaViI_o57ommfezXR6HvIKyKfbEOwDw9AG2bNWWc','2024-05-10 04:27:17.726068'),('rizkwxvlbqz6q8bea9ohdrall0qj2rf5','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUnGV:Ju2D7zA6nX-9fzMIxDXT_rWI4Oj4TMGPuZEqBjWDJZk','2024-08-02 13:03:15.835208'),('rn84vpvif1cryrr7z7xvtb4gki57ibnx','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1shAC2:OOA8YdfhFl0KMqVzt3-PXwUZ4Xd14TlcDpW73SOARrw','2024-09-05 15:57:46.877915'),('rvzfsh1py7hyltbmm58hm3zku61g4yn1','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2X4:eF7Ofz9eXJbGoQzvB6xRPADntHi_fWvmFVelOvokEvk','2024-09-05 07:46:58.546894'),('s4i91gm0lizc7lsrw209r1f8yem243jt','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPGf2:UOJPSV0gT0Pe1tOJmTvs6W2DlNLSaO8xYCIb1LhEOKs','2024-07-18 07:13:44.031257'),('s6v73aenefha45buy3o6jp8wo4yuvtdh','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sEm89:kaikpASeJEZVlv6TCNG2sNHuLdE6q1EScv33Lv4nmcM','2024-06-19 08:36:25.827591'),('s8be9ybq0vv3i1p1rqephhnn4l3bwk1o','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUfMS:zy-Wh2jdKXxy8b1SJgvNa8DgG4dXyDVnnw3Guq3goS4','2024-08-02 04:36:52.024618'),('shm8fjws5tkem1troncsmf8atg2j06az','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUfNU:3r4u4kF4SpMI71CZvkD_XhwrBxGafBNDlULV4m8zvrA','2024-08-02 04:37:56.223967'),('sj7krtn7wp64kavxr4adl9hmf8dgta9y','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1mG:rW_6IrQ3czPHJ7pM8UbXxMqseUL-hVqB2yzgbNIU0FI','2024-09-05 06:58:36.321776'),('sjhxpe6f0y71zj0d1rqltyuwcu1b8tim','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbyGd:josDvro10xN4k4x2cJNVYwH8B31GOYWKyor21zyfzGI','2024-08-22 08:13:03.522578'),('skrqa1cg2nispsr9omozmglrqwzk8ab2','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUouU:baLHCkG4mVq_bSZvZONYITYwtBwA366w-51AdobH3dg','2024-08-02 14:48:38.999521'),('smmue7o0keve75m2z2b940ucptc88pni','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUn9E:5LkYkD7bbrys3s1zNAq54PKV6QNEzXm0uu6IDrgoRlc','2024-08-02 12:55:44.866961'),('sngbf0jtctbiz1svf5ybzerynddcmbth','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sMh00:VKPja1CpLUsr-dd5tyaoaC1PEkkViHoOHkF9gY4z5-g','2024-07-11 04:44:44.435997'),('sou6778jhcsasdun1h7ivc3wfmq7xram','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUnc7:bADB1i6zRHa_oYYyW9VlFpSTnz_htYXG8K1S1ooi8hg','2024-08-02 13:25:35.074535'),('sr6ytffory1vzxt8a4xwmpopngm06ngc','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2rKt:vt5kgcM90Kb9BOaoqXQEX43JtUfUa7g-aaCHhzqE8io','2024-05-17 11:44:19.572834'),('stkc72j58m834fxmx23r8orztw58mj29','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbzFo:RLpG1xGET4ysf6YO9gQGwzJEZg2e9HWw4ahqm1R5zqo','2024-08-22 09:16:16.146838'),('stlrod6aaur7mscarg4gwqquykrtksdw','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1svIqr:p1Gn2tIDdVy-n537inSUG94Las_xotNTioCHsUHmoQ8','2024-10-14 16:02:21.725375'),('t0t6zkstknf6rox0ujlx470hqz8el384','.eJxVj01ug0AMhe8y6wr5h5mBLLPvGZDNeAotYiQgqyp3z6RCVSJ5Yfu991n-dYPcjmm47bYNc3IXx-7jdacy_tj6FNK3rF-lGct6bLM2T0tzqnvzWZIt19P7Bphkn2o6m3kGMInKLFCr69Ajt0Z1loxBQ8JOfMpAEbwC-SyEFjRHj6FC_5hHqScqLwBIhp46oFEjtdQzEkKvgX1qIUVLmXvUmvv_jc9-K4tVhNpqWcajbO7-ANY0U1Y:1s9e1H:1I8faMA-w3Lzv5-o9yHoGkRPyZfZiKdtYWG8bBm6K88','2024-06-05 04:56:07.670532'),('tgccyhpoirol5g4w3ed12a755ukw0mgo','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1siv5B:hNFZhuf8KPG_YzYg_XvEWrvpuwkNdndICePRNlpz6eY','2024-09-10 12:13:57.276996'),('tkn94ig87kt7d3vopudcnn41g9ifqz9e','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUTJ5:edrvbk5uOBH-UVdtwl_fRZvVjEiOP-ZPTYoEO3mz9h8','2024-08-01 15:44:35.498953'),('tl0u35323tjrsejfmj1jhy9l7sia5613','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sCBdg:3KLZ_QM7G47rcOAL5VRd8Yiex1i-1_tbkFkVaB-kuuI','2024-06-12 05:14:16.967630'),('tmslx6r43hf34blpm2enusomxhk9cdv0','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2bV:ZFbAfeK3SUg9U3jHaiXyWnv5-LWw-thm2W9GNfSPFLQ','2024-09-05 07:51:33.822500'),('tnikxzto68gyidahr8p0gpfreafsdiq3','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sggxg:EwUkI7OLhHujsMEmoudQ_RnxUmWCrNs7frEitkKTMts','2024-09-04 08:45:00.483188'),('tofdvrky4ok2gspsn2uwnfqrwbr2o6oj','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUnDj:aYfH8-igfPSePALSoAMSz_fJYnM3Z4gnRfUS8X57b9I','2024-08-02 13:00:23.672100'),('tp5jxiocd15dkj1nj3xdpe4w33hap6ya','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUic7:vnc4DlyyPRDim6u5hlSfcnt7-XTmiHKwm2EeywJrq5M','2024-08-02 08:05:15.251983'),('ts9w3m4c83p27iycg9kca8194uw5c5ol','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sCBOE:43Q8hdFS_GtZ0Q0WjXwbE5cXsiNQV6xpltZvsq7dKHE','2024-06-12 04:58:18.531025'),('u1kbyn0beuqh9l0507tj69abtc75aptk','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUnds:TIuJlSkm0sKrgZBZJHCEwWnvEuivfl20SwwyLL0gkHc','2024-08-02 13:27:24.725613'),('u8b10bea01pgighllavwnam5bh15l55l','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUfZZ:ZmLcdl4Eqga5TRF2qcb06fzSIxZxcKAb90lzH_JmHIw','2024-08-02 04:50:25.500577'),('u9es2ssbmobjohxhpns1uzbb4wo3lxv8','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPGkl:svo3rNiiZxWG_q6Fp0EUfI6vYt8D6k-uXxeli4PypKo','2024-07-18 07:19:39.842376'),('ubwtpgnzz299mqce08ef4v52bluh3koy','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2OFy:JJyvYSl4G2jaD8lNperfaae2_DqbyzNvyLdNVQWoZh8','2024-05-16 04:41:18.294017'),('ucfvt9woqi6ougzwzbwz35hmn9tnityq','.eJxVj0kOwjAMRe_SNariuBnKkj1nqOzYoQxqpQ4rxN1JUYVg-4f39Z9VR-vSd-usU3eV6ljZ6vCrMaW7DpshNxouY53GYZmuXG-Renfn-jyKPk579g_Q09yXtk-Q2-gYojVAHLnl0Eh2BtGjYARHFp1pwSa21DiUYCSG4FQltMEU6Ie5jGWi8NiLNwE8KwIm0oZdQu-VNQdQFzODUFQuve83-3oDHOZLpg:1s4N90:O5oJz0OgM-8lO_YomyuWe88WiiSW8UoYm_u0Rg_KX10','2024-05-21 15:54:18.232489'),('uhpwj2d9ue0fhvrw1bw9qmbaq32eqvrn','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3LCJ1c2VyX3JvbGUiOiJhcHByb3ZlciJ9:1sQnnK:ffgw2jKyzknjqTLDukq282vypIt5PxTq9dMjgzp9_F0','2024-07-22 12:48:38.784229'),('up1qawozq6vgzg2u9fmfswygf75ruxua','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOJpg:GvtokrnCmSFs7NbZBQyJ6u67gCQd-WJgDnYctGf6yAk','2024-07-15 16:24:48.905092'),('utg5e2hfa8y456jtvon2tm686kirop4r','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1cm:kGud7NsGH93G2BhQ1-uCJjM4Vkma_nl-wD-DbhHUocI','2024-09-05 06:48:48.396673'),('v53qw2cput275u2k1umfhd3ss0fcqeic','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sdmD8:WpIKhUpzWVSR4XNeiBAYoDu6rHQ0XMNzu7zUo1IuDEo','2024-08-27 07:44:54.592721'),('v5kf4e6wou9azxj42ljfj78kw1fegkti','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sQkoq:Ks7hMVKRiY5mEvpftz2-HGG8eN4lOvDIuGpYvYzKs8Y','2024-07-22 09:38:00.774243'),('vccg4hdcrbzx7xwtrf4ynuja9oill5rx','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sN6GQ:3eslQZ8EC1LpfbQB_YtVhZ_QmDLE0Ncs4MwJqWZEq7I','2024-07-12 07:43:22.608352'),('vchbjq804mu78asx0nb9jhz638fkdbh5','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPHGe:QQBXlvdrKdMxJoePrHABoRKXm-yVyxMIUSe_h5IQG90','2024-07-18 07:52:36.623402'),('vdy60k6eai00lpzn6plrah2dgzo7geeu','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbFCU:5M4GBqI0TK_hhZwpuzAbDnneB06azZPxTNm07EMw4aY','2024-08-20 08:05:46.319237'),('vh0d5io2uihplpjb25lwla4ksveo0x88','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sP1zH:lHid0soFLlx6s0_pZT5yIk65kMVBD-U8zCi86AbC1Dw','2024-07-17 15:33:39.426682'),('vo7txch54b0cgzx49jwqed68fvhcj0o6','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbCbk:9nlu7V4CtBATaAVwvzf9YiLlYOKHi4sWCpWUqwOWTd0','2024-08-20 05:19:40.494597'),('vvycpxiawobf6qhcbl5dkpyklh6jasi0','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1s21rm:M1Grg32xGxps1qdBYa6oeIElIIS-QF2izzjG0u9lVos','2024-05-15 04:46:50.278612'),('vzi9mlzrf8neir55ong3fgbw7mh7gvdv','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh0si:VpGU__1nTDxoyuhiER4gX5OmkssTadEjoib3s8KsUfw','2024-09-05 06:01:12.721380'),('w1f09fjkx2wo2dt95ldlh0jz7i3mzew9','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUfbK:bYTVZdhaZW9_AAiwepqtBT8EOIcy0thrlXe8udW8FKk','2024-08-02 04:52:14.666006'),('w4uiuh285o1h6191q47csl4kwwl7fo1j','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sgh19:K3Ap9tPH4zJrzJc2k1jqIoBzTbUejfwX1hL-aZDy6xU','2024-09-04 08:48:35.992803'),('w8gbiwufxi90yd7vjtaob0k01kegn0mz','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s97OI:sjeyw_Mz_PmqOAL0MaleXQe3tCAsLW7-qDwezI3TAdI','2024-06-03 18:05:42.057278'),('w8uxeouv1r2wy0mr4hc5jzve7d447a3u','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1scHYO:Cjd-zoiBxa3Jdt8iZiHjjaxAzfWn5E0nEKzfNslVfjo','2024-08-23 04:48:40.953140'),('w95q97jininoh1d477tci011grp24uir','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sHFwS:I6kibDM5NfXkz9CvHDZozHJ3i6qZdk0TqF46afe1DNY','2024-06-26 04:50:36.440970'),('wcuv6a55xi3dqsaw1mzgx4ofnoqxbfu7','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s9HDe:0o62nBnuEJFgnxzgzPe0xDV1DiKDzZa52SqqJW6bCvo','2024-06-04 04:35:22.330979'),('wd7hicfslrlvjku3tpztnzixzzujhpwq','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sby6C:FHm7EOM2HfUvA5xYUFT_rRWSwjA_A_DamUG1XhkK9ds','2024-08-22 08:02:16.934467'),('wfco64m0ik2yd3rkbl9bvqh5dov1ti63','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUp28:GmKMi4-WV2ajZgXtLUF2BtYNi9m0jgZGukJyOYcQJ_U','2024-08-02 14:56:32.837875'),('wgs29uyop8owds5j2l2chpb2bw6jbo1v','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2r5V:9ac6hz-Rh3US--ea1xR4pKoa6dLbutzwsz9--7VhFoo','2024-05-17 11:28:25.957210'),('wm6s16q3wnzzub2tnyampqp461qetona','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbFDR:BwN2o0cbWAipETKhQ5ECatUAkc2YivGoFFQ_uIrOLyU','2024-08-20 08:06:45.409884'),('wmu27me0qel03qh032ug29a1gi3tkz6l','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sOEhv:YDiRbNw3lu0NWN0gf6s0Kb9EhNSWDWwCXa5AzX8YXgw','2024-07-15 10:56:27.691732'),('wn6qma7ite1b8s8jz9u4xt976vpobr5k','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOweg:a47ONE1eB0s2Lp1AODrXCmhNSKMxfM3Rplxn2KLlEjU','2024-07-17 09:52:02.078095'),('wowpwak2d8o4lrbi70xbay584stxuwut','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sCMDm:3obhpm_dhjK4zXwK_zjnM5RyzAVLXLPNH1yiX1Q5AcA','2024-06-12 16:32:14.110041'),('wqgh3k3pf88zjutbkmspvtxh2y0iyhba','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s4EaI:Ny6h8zjsXp-tGce3AzZsv02ZLtD6ocC_MAPriTxcYEs','2024-05-21 06:45:54.027434'),('wxtem5uu8y61kmjqa0upjpy0jwa2rvnz','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sMmFc:tbLlfLeeIfTEH3gEZqhRelf8XyFbUzKp9EE_8Y6iueI','2024-07-11 10:21:12.926051'),('x0lytkponx5j5b7drbzuszevt8gjrh5z','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbz6I:sm4Hh18_8wsFttlXBRAa-30igHGKt92qxze2Gtn95Dg','2024-08-22 09:06:26.030351'),('x3n8y6ljc04qm35a4c2dtkacfpw27711','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUl5t:DR1kCjVLYkdwOZaJp4XFAHa55GMhUIVn2IEjsCU4UG8','2024-08-02 10:44:09.727536'),('x7hmif9xaapwi5lomvndsjns2lhhkrei','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUhK1:-XoSu27NvA-fQAD8AFnZfCyTpoB94O4nW8c0IDAIM2A','2024-08-02 06:42:29.546861'),('x7njg8m0mxj7893jgbbutz9jyperiw3t','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sIm7K:LDUqDjNG2kVKAhnLrgvUOxHlIC1-Rdssrlw2a1jt_5A','2024-06-30 09:24:06.573635'),('xajkheb9gvtz27b5o2saw5cam6nqca1i','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sU1ZQ:oGyZBAHk37U0UA9H_UdpMErcTVXK5jwdMzUBh1KR0ws','2024-07-31 10:07:36.027021'),('xbz2hlvwxziur4g5ub5r3kzqlv2haqh8','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sc5Pu:CxAZIhIkb832GXciTxG9P5T_yjm8wEgp99K1OTawwMw','2024-08-22 15:51:06.474008'),('xc2hocg7zlf9hqsdl87qfewbpxagmj3c','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sby8H:W2LjvPqKQFcZBHzeGHopDfmczE6w7K0lu_2hJvTrGXk','2024-08-22 08:04:25.241912'),('xg570se016se51ocpoe1gsrnvk9wdyo7','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sUovL:pYgxP1g2F_gAu7bgHsDD7RiH488rGaOvUGOJk__GeMc','2024-08-02 14:49:31.728810'),('xh156572be9dpxiaguc665zfb76hinab','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbb5V:9qjxnc3kJ46oOvSdzvW2bmM_K4grnwmblbao7q5aDy8','2024-08-21 07:28:01.883889'),('xifsfcl91p7dnl6r3cwxwcfwstgk1hly','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1stOOr:0uvTsHP6rfO6v11aX3y1peNFewwx-jMVOKpTDaZGDFM','2024-10-09 09:33:33.822016'),('xiv7l4rjohph3vo3jyhxcp3etwd71y0n','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUnbA:mhRSLCitxAflBUobeSu_sH4aZt7S-g-8hn_6YFsj7wI','2024-08-02 13:24:36.638864'),('xkw2orwcj8ymwwui9ntmlzje96dotvoe','.eJxVjMsOwiAQRf-FtSEwRB4u3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFaHH63RLSk9sO8gPbvUvqbZmnJHdFHnTIW8_8uh7u30HFUb81luwzBCwmaa2KSwGdcpYsqEDArBmokEKDATxQYA_nYMArp2xBTuL9Afl8OCw:1sh9Of:C2JKSMpK-oacD4gVYSg-YAPR61kXeRmEee-OrG3tCME','2024-09-05 15:06:45.002437'),('xpigo34co5s40eh8lnciu8csiw00g3yc','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2QL:zIFEyO9_RjPxXL1DJMMkV3u0vEu-e-7rACScOIM7XYQ','2024-09-05 07:40:01.601540'),('xplm5p0k164iuoqxb0n0gzuq6kw0nttk','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUlLy:D0V5Be_Lvkf4cvkaDc5rvwc-aETCD4K8UYQthG1AKBM','2024-08-02 11:00:46.869257'),('xq5wl0nj4tsprspzo4nyo8alw8lv9vmf','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sOCVn:kcqNTS2Kk9WMtny6nFB_hpA39Bp5TW0HSG2BtpECoLM','2024-07-15 08:35:47.127150'),('xszmc5ht9wys3rverz6tt47c6dlc8vdy','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2F9:juF3lHd6nONYGTeLKu0U0Wyi4yhHsPJL8gjCBX5rq04','2024-09-05 07:28:27.605246'),('xuw0fnpdw2x8i3ihyn6ub1x90igo8jxb','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s97Ps:ZjibhvCxjBIjacHDlpHK1X63jLVrOORgJ5WKRLDYHbs','2024-06-03 18:07:20.890242'),('xwvjgykna8xjeqh0c1vfrsh7hkus7pxb','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbFBe:F7Wr-_hmh_QmR2L8lE1msyj2vOOGhS4UIzb8QpmKY2U','2024-08-20 08:04:54.199848'),('xzsonodf8pjgqbr30lyfmtqma3stu4km','eyJhdXRoX3Rva2VuIjoiYjZkNjA3MTZiZTMxM2NhZTRiNWMzNjZlYmVmNzFlNThmYjFkYThlYiIsInVzZXJfaWQiOjJ9:1sH0Ys:ksN-yay_V2FYDKUCiEwVaQlCqJ-XQlNcM0iHNQjRp5A','2024-06-25 12:25:14.165104'),('y9gt1bbt06bxwre9t4pz5xgwayy8s0m6','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s0DBa:SpjCjVOLL7NX4TA443dW6CfRyIFmDzyNp_1MeZaiDgc','2024-05-10 04:27:46.058344'),('yb946oda2wahxumwzuk122tsunglnwyx','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sbbyU:HL3HV0S8gZr46UOAvllXR57C1A5NoYKhAxyoABJ37fo','2024-08-21 08:24:50.859738'),('yk0q8es9p7elr9i0ggwmklraddkyq3dd','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sdldK:16vxZ7sMIypfZOU3pflVM6wTNGoMI4Q8dOGh3GTdTyQ','2024-08-27 07:07:54.061143'),('ysm258pu6nrtb2fv3c6jjtn55ucbdhcn','.eJxVj8kOgzAMRP-Fc4W8kAR67L3fgGzilC4CieVU9d8bKlS1ki_2zLyRn0Ur69K362xTe43FseDi8HtT6e42bEK8yXAZy24clumq5WYpd3Uuz2O0x2n3_gF6mfucTmaOAUyCMgvkqWt0yJVR3iWhVx-xFhcTUACnQC4JoXlNwaHP0A9zGXNF5nkASdBQDdRpoIoaRkJo1LOLFcRgMXGDmnPf3_j1BiHfSn8:1s2r08:qc8mTFu4IoupmPLUVz9NQVYmXwbg0l9co0pGv6eWV6w','2024-05-17 11:22:52.440163'),('ythaonkd875h2gsdaax7w9sgbnpumlga','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2UK:m2Obp73j5X8cOUDu55Oy2PUHuSAJ-YSNtvHth8gMIRw','2024-09-05 07:44:08.978122'),('ywb76evzzveo14r2zvwj3bbchyo1kmbz','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1XF:9oKzPA1al-doszE4MhAwJ-q7EwIwd2vws9uKBQIWq2w','2024-09-05 06:43:05.329494'),('z1hohk86wvqtculq2wcjcdx7qqkesxk7','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh2XC:J3G5ggzmCQyDT3GDqUtxdLg2ZJiKKd2eqqe7POg8cKY','2024-09-05 07:47:06.950680'),('z43fmccr1zdb2zcirb3cpvcv3yxccsnd','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sJnFL:-j8EEMY1tjBQxf8eFhGJipkaTlAVVA3Xkc0kJ9M6WG0','2024-07-03 04:48:35.197003'),('z5u727uiqaagkp3oxobsmpexwp1uoj19','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sh1mP:CT1fmIGW-Z9XtyaHFO79-86KXq60VuVXXt2TrrcJZ24','2024-09-05 06:58:45.947270'),('z786b6n79bltzf8y6mfvzczs0012jcuy','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUTIl:jDjDFsRo5yOJGDxRkMYD19i-1CVomWRzCelna7fQABQ','2024-08-01 15:44:15.835242'),('zb0vxkyqu8h41bk7dqw3beswe1oiizam','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUncp:3VxOcp77L0Oy7zJ5kMfzGVBmC7Hm_wl_lhBY9GL8H8I','2024-08-02 13:26:19.763655'),('zet8biohmqjg2hiu3gamxxqqnzbqxq4t','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUl6H:eTv2MZgFlTKnSbPuDNa7tj2Ic_Z247aDDAvuPl843Ug','2024-08-02 10:44:33.497367'),('zfoccwxnoyxlnmwlvztqg4fnituzse0v','eyJhdXRoX3Rva2VuIjoiZDBkNDAyOTllZTk2OWYzNDY0NmI1Yjg0YTZmNjc2MTc4ODIzOTRiYSIsInVzZXJfaWQiOjMzN30:1sUp4Z:Wf4I2u1LhDz2ZwQHE-HVrdgQ2cuc9YptQBxljgpmHVA','2024-08-02 14:59:03.102222'),('zmr1ftgkcz97jli9kv2c0p82va947yz4','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sUmnw:GXhcD9nNTL3OwshTvs2CcO_NkYrvBKTstTYB7q0XEho','2024-08-02 12:33:44.700042'),('zpc40j448uqc18bh7tcyujd56tfe65d0','eyJhdXRoX3Rva2VuIjoiM2JjY2QyOWNkMTgzNjU2MDA5MmI2ZmUzYjZmODBjMGE2MTFjNWUwZSIsInVzZXJfaWQiOjI3fQ:1sJnZP:WyCNbbsK6ug2brpnwO20tA9xgcKuCh-GnVplS2YcoCI','2024-07-03 05:09:19.480073'),('zwphturthsvgl4m0sbp7xukmi8ms9ve7','eyJhdXRoX3Rva2VuIjoiNjAwYWYwOTI4MDJjYjcyNDI5MzEyMTA5YjYzNWQ0MGQ3ZWRmMzkxYiIsInVzZXJfaWQiOjMsInVzZXJfcm9sZSI6ImFwcHJvdmVyIn0:1sPGgq:e3l66fsqYXRHg986_ShkVlzUjWEbD3aJwa4kx4DJGfA','2024-07-18 07:15:36.873008');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `cur_town` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `district` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `period_of_stay` varchar(55) DEFAULT NULL,
  `address_type` varchar(10) NOT NULL,
  `default_shipping_flag` tinyint(1) NOT NULL,
  `default_billing_flag` tinyint(1) NOT NULL,
  `default_communication` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_user_id_address_type_cc8e6316_uniq` (`user_id`,`address_type`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (3,27,NULL,'Kolkata main city','near metro','South 24 parganas','West Bengal','Kolkata','Howrah','India','841239','10 months','temporary',1,1,1),(4,27,NULL,'Kolkata main city','near metro','South 24 parganas','West Bengal','Kolkata','Howrah','India','841239','10 months','permanent',1,1,1),(423,342,NULL,'.','','','','','','','','','temporary',1,1,1),(424,342,NULL,'.','','','','','','','','','permanent',1,1,1),(425,343,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permanent',1,1,1),(426,344,NULL,'.','','','','','','','','','temporary',1,1,1),(427,344,NULL,'.','','','','','','','','','permanent',1,1,1),(428,345,NULL,'D.No:56,','','16th Highway main road','Karanataka','Bengaluru','','india','560078','','temporary',1,1,1),(429,345,NULL,'.','','','','','','','','','permanent',1,1,1),(430,346,NULL,'.','','','','','','','','','temporary',1,1,1),(431,346,NULL,'.','','','','','','','','','permanent',1,1,1),(432,347,NULL,'.','','','','','','','','','temporary',1,1,1),(433,347,NULL,'.','','','','','','','','','permanent',1,1,1),(434,348,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permanent',1,1,1),(435,349,NULL,'.','','','','','','','','','temporary',1,1,1),(436,349,NULL,'.','','','','','','','','','permanent',1,1,1),(437,356,NULL,'.','','','','','','','','','permanent',1,1,1),(438,356,NULL,'.','','','','','','','','','temporary',1,1,1),(439,359,NULL,'.','','','','','','','','','temporary',1,1,1),(440,359,NULL,'.','','','','','','','','','permanent',1,1,1),(441,351,NULL,'.','','','','','','','','','permanent',0,0,0),(442,361,NULL,'.','','','','','','','','','temporary',1,1,1),(443,361,NULL,'.','','','','','','','','','permanent',1,1,1),(444,362,NULL,'.','','','','','','','','','temporary',1,1,1),(445,362,NULL,'.','','','','','','','','','permanent',1,1,1),(446,363,NULL,'.','','','','','','','','','temporary',1,1,1),(447,363,NULL,'.','','','','','','','','','permanent',1,1,1),(448,364,NULL,'.','','','','','','','','','temporary',1,1,1),(449,364,NULL,'.','','','','','','','','','permanent',1,1,1),(450,360,NULL,'.','','','','','','','','','permanent',0,0,0),(451,366,NULL,'.','','','','','','','','','temporary',1,1,1),(452,366,NULL,'.','','','','','','','','','permanent',1,1,1),(453,367,NULL,'.tyrtyrty','','hj','fdgdbfgnvbn','dfgdfghgj','vbn','india','cvb','fgd','temporary',1,1,1),(454,367,NULL,'.','','','','','','','','','permanent',1,1,1),(455,368,NULL,'.','','','','','','','','','temporary',1,1,1),(456,368,NULL,'.','','','','','','','','','permanent',1,1,1),(457,371,NULL,'.','','','','','','','','','temporary',1,1,1),(458,371,NULL,'.','','','','','','','','','permanent',1,1,1),(459,372,NULL,'.','','','','','','','','','temporary',1,1,1),(460,372,NULL,'.','','','','','','','','','permanent',1,1,1),(461,373,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permanent',1,1,1),(462,374,NULL,'55/64','','Becharam Chatterjee Road','West Bengal','Kolkata','','india','700034','','temporary',1,1,1),(463,374,NULL,'.','','','','','','','','','permanent',1,1,1),(464,375,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permanent',1,1,1),(465,376,NULL,'.','','','','','','','','','temporary',1,1,1),(466,376,NULL,'.','','','','','','','','','permanent',1,1,1),(467,377,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permanent',1,1,1),(468,378,NULL,'.','','','','','','','','','temporary',1,1,1),(469,378,NULL,'.','','','','','','','','','permanent',1,1,1),(470,379,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permanent',1,1,1),(471,380,NULL,'.','','','','','','','','','temporary',1,1,1),(472,380,NULL,'.','','','','','','','','','permanent',1,1,1),(473,381,NULL,'.','','','','','','','','','temporary',1,1,1),(474,381,NULL,'.','','','','','','','','','permanent',1,1,1),(475,382,NULL,'.','','','','','','','','','temporary',1,1,1),(476,382,NULL,'.','','','','','','','','','permanent',1,1,1),(477,383,NULL,'.','','','','','','','','','temporary',1,1,1),(478,383,NULL,'.','','','','','','','','','permanent',1,1,1),(479,384,NULL,'.','','','','','','','','','temporary',1,1,1),(480,384,NULL,'.','','','','','','','','','permanent',1,1,1),(481,385,NULL,'.','','','','','','','','','temporary',1,1,1),(482,385,NULL,'.','','','','','','','','','permanent',1,1,1),(483,386,NULL,'Dolly Joh vadakekeechery house. kallumari near sndp . Piravom .pazhoor p.o','','','Kerala','Ernakulam','','india','','13','temporary',1,1,1),(484,386,NULL,'.','','','','','','','','','permanent',1,1,1),(485,387,NULL,'.','','','','','','india','','','temporary',1,1,1),(486,387,NULL,'.','','','','','','','','','permanent',1,1,1),(487,388,NULL,'.','','','Karnataka','Bangalore','Bangalore','india','560083','8','temporary',1,1,1),(488,388,NULL,'.','','','','','','','','','permanent',1,1,1),(489,389,NULL,'.','','','','','','','','','temporary',1,1,1),(490,389,NULL,'.','','','','','','','','','permanent',1,1,1),(491,390,NULL,'.','','','','','','','','','temporary',1,1,1),(492,390,NULL,'.','','','','','','','','','permanent',1,1,1),(493,391,NULL,'.','','','','','','','','','temporary',1,1,1),(494,391,NULL,'.','','','','','','','','','permanent',1,1,1);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lov_seed_data`
--

DROP TABLE IF EXISTS `lov_seed_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lov_seed_data` (
  `lov` int NOT NULL AUTO_INCREMENT,
  `lov_parent_code` varchar(100) DEFAULT NULL,
  `lov_code` varchar(100) DEFAULT NULL,
  `display_label` varchar(255) DEFAULT NULL,
  `input_type` varchar(30) NOT NULL,
  `lov_ref_code` varchar(60) DEFAULT NULL,
  `mandatory` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`lov`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lov_seed_data`
--

LOCK TABLES `lov_seed_data` WRITE;
/*!40000 ALTER TABLE `lov_seed_data` DISABLE KEYS */;
INSERT INTO `lov_seed_data` VALUES (1,'purpose','pur_edu','Education','s_lov','pur_edu','1','active','2024-06-07 13:30:00.000000'),(2,'purpose','pur_med','Medical','s_lov','pur_med','1','active','2024-06-07 13:30:00.000000'),(3,'purpose','pur_home','Home Loan/Renovation','s_lov','pur_home','1','active','2024-06-07 13:30:00.000000'),(4,'purpose','pur_major_purchase','Major Purchase','s_lov','pur_major_purchase','1','active','2024-06-07 13:30:00.000000'),(5,'purpose','pur_small_biz','Small Business','s_lov','pur_small_biz','1','active','2024-06-07 13:30:00.000000'),(6,'purpose','pur_existing_debt','Existing Debt','lov','pur_existing_debt','Y','active','2024-06-07 13:30:00.000000'),(7,'purpose','pur_retirement','Retirement','s_lov','pur_retirement','1','active','2024-06-07 13:30:00.000000'),(8,'purpose','pur_vehicle_purchase','Vehicle Purchase','s_lov','pur_vehicle_purchase','1','active','2024-06-07 13:30:00.000000'),(10,'pur_edu','edu_past_fin','How did/are you finance your education so far?','m_lov','edu_past_fin','1','active','2024-06-07 13:30:00.000000'),(11,'pur_edu','present_edu','Present qualification:','s_lov','present_edu','1','active','2024-06-07 13:30:00.000000'),(12,'pur_edu','present_score','Present academic score/CGPA: e.g. 82.5%','text','','1','active','2024-06-07 13:30:00.000000'),(13,'pur_edu','applied_course','Course applied for: e.g., B.E Computer Science','text','','1','active','2024-06-07 13:30:00.000000'),(14,'pur_edu','course_startdate','Course start date:','date','','1','active','2024-06-07 13:30:00.000000'),(15,'pur_edu','course_enddate','Course end date:','date','','1','active','2024-06-07 13:30:00.000000'),(16,'pur_edu','univ_college_name','Name of the university/college:','text','','1','active','2024-06-07 13:30:00.000000'),(17,'pur_edu','tot_semester','Total no. of semesters/terms:','s_lov','tot_semester','1','active','2024-06-07 13:30:00.000000'),(18,'pur_edu','adm_status','Admission status:','s_lov','adm_status','1','active','2024-06-07 13:30:00.000000'),(19,'pur_edu','high_studies','Are you planning for higher studies after this course?','s_lov','comm_y_n','1','active','2024-06-07 13:30:00.000000'),(20,'pur_edu','total_fees','Total course fees:','s_lov','total_fees','1','active','2024-06-07 13:30:00.000000'),(21,'pur_edu','payback_time','In how many years do you expect to be able to pay off your education loan?','s_lov','payback','1','active','2024-06-07 13:30:00.000000'),(22,'pur_edu','comments','Provide additional information explaining why you need this grant:','text','','1','active','2024-06-07 13:30:00.000000'),(24,'comm_y_n','yes','Yes','','','1','active','2024-06-07 13:30:00.000000'),(25,'comm_y_n','no','No','','','1','active','2024-06-07 13:30:00.000000'),(27,'edu_past_fin','gov_spon','Government sponsored','','','1','active','2024-06-07 13:30:00.000000'),(28,'edu_past_fin','scholorship','Scholarship','','','1','active','2024-06-07 13:30:00.000000'),(29,'edu_past_fin','rel_supp','Support from relative','','','1','active','2024-06-07 13:30:00.000000'),(30,'edu_past_fin','loan','Loan','','','1','active','2024-06-07 13:30:00.000000'),(31,'edu_past_fin','self_finance','Self financed','','','1','active','2024-06-07 13:30:00.000000'),(32,'edu_past_fin','others','Others','','','1','active','2024-06-07 13:30:00.000000'),(34,'present_edu','primary','Primary School','','','1','active','2024-06-07 13:30:00.000000'),(35,'present_edu','secondary','Secondary Certificate','','','1','active','2024-06-07 13:30:00.000000'),(36,'present_edu','hsc','Higher Secondary Certificate','','','1','active','2024-06-07 13:30:00.000000'),(37,'present_edu','diploma','Diploma','','','1','active','2024-06-07 13:30:00.000000'),(38,'present_edu','bachelors','Bachelors','','','1','active','2024-06-07 13:30:00.000000'),(39,'present_edu','masters','Masters','','','1','active','2024-06-07 13:30:00.000000'),(40,'present_edu','doctorate','Doctorate','','','1','active','2024-06-07 13:30:00.000000'),(42,'tot_semester','one','1','','','1','active','2024-06-07 13:30:00.000000'),(43,'tot_semester','two','2','','','1','active','2024-06-07 13:30:00.000000'),(44,'tot_semester','four','4','','','1','active','2024-06-07 13:30:00.000000'),(45,'tot_semester','six','6','','','1','active','2024-06-07 13:30:00.000000'),(46,'tot_semester','eight','8','','','1','active','2024-06-07 13:30:00.000000'),(47,'tot_semester','ten','10','','','1','active','2024-06-07 13:30:00.000000'),(49,'adm_status','confirmed','Complete','','','1','active','2024-06-07 13:30:00.000000'),(50,'adm_status','not_confirmed','Yet to admit','','','1','active','2024-06-07 13:30:00.000000'),(52,'total_fees','amt_1','Below 25,000','','','1','active','2024-06-07 13:30:00.000000'),(53,'total_fees','amt_2','25,000 to 50,000','','','1','active','2024-06-07 13:30:00.000000'),(54,'total_fees','amt_3','50,000 to 1,00,000','','','1','active','2024-06-07 13:30:00.000000'),(55,'total_fees','amt_4','1,00,000 to 2,00,000','','','1','active','2024-06-07 13:30:00.000000'),(56,'total_fees','amt_5','2,00,000 to 3,00,000','','','1','active','2024-06-07 13:30:00.000000'),(57,'total_fees','amt_6','3,00000 to 4,00,000','','','1','active','2024-06-07 13:30:00.000000'),(58,'total_fees','amt_7','4,00,000 to 5,00,000','','','1','active','2024-06-07 13:30:00.000000'),(59,'total_fees','amt_8','Above 5,00,000','','','1','active','2024-06-07 13:30:00.000000'),(61,'payback','six_months','Within 6 months','','','1','active','2024-06-07 13:30:00.000000'),(62,'payback','one_year','6 months to 1 year','','','1','active','2024-06-07 13:30:00.000000'),(63,'payback','two_years','1 year to 2 years','','','1','active','2024-06-07 13:30:00.000000'),(64,'payback','three_years','2 years to 3 years','','','1','active','2024-06-07 13:30:00.000000'),(65,'payback','four_years','3 years to 4 years','','','1','active','2024-06-07 13:30:00.000000'),(67,'pur_med','med_purpose','Purpose for medical grant:','m_lov','\nmed_purpose','1','active','2024-06-07 13:30:00.000000'),(68,'pur_med','med_history','Mention details about ailments, symptoms, diagnosis and required procedures:','textarea','med_history','Y','active','2024-06-07 13:30:00.000000'),(69,'pur_med','med_insurance','Do you have any insurance to cover medical expenses?','s_lov','comm_y_n','1','active','2024-06-07 13:30:00.000000'),(70,'pur_med','comments','Provide additional information explaining why you need this grant:','text','','1','active','2024-06-07 13:30:00.000000'),(72,'\nmed_purpose','surgery','Surgery','','','1','active','2024-06-07 13:30:00.000000'),(73,'\nmed_purpose','hospitalisation','Hospitalisation','','','1','active','2024-06-07 13:30:00.000000'),(74,'\nmed_purpose','rehabilitation','Rehabilitation','','','1','active','2024-06-07 13:30:00.000000'),(75,'\nmed_purpose','recovery','Recovery','','','1','active','2024-06-07 13:30:00.000000'),(76,'\nmed_purpose','medication','Medication','','','1','active','2024-06-07 13:30:00.000000'),(78,'pur_small_biz','biz_type','Nature or type of business:','text','biz_type','1','active','2024-06-07 13:30:00.000000'),(79,'pur_small_biz','money_usage','Why do you need the grant?','text','money_usage','1','active','2024-06-07 13:30:00.000000'),(80,'pur_small_biz','biz_running','How old is the business? e.g. new, 6 months, 2 years, etc','text','biz_running','1','active','2024-06-07 13:30:00.000000'),(81,'pur_small_biz','owned_assests','What is the value of fixed assets owned or associated with your business?','text','owned_assests','1','active','2024-06-07 13:30:00.000000'),(82,'pur_small_biz','biz_employee','How many employees does your business have?','text','biz_employee','1','active','2024-06-07 13:30:00.000000'),(83,'pur_small_biz','biz_owners','How many owners/partners does your business have?','text','biz_owners','1','active','2024-06-07 13:30:00.000000'),(84,'pur_small_biz','annual_turnover','What is your annual turnover?','text','annual_turnover','1','active','2024-06-07 13:30:00.000000'),(85,'pur_small_biz','annual_profit','What is your annual profit?','text','annual_profit','1','active','2024-06-07 13:30:00.000000'),(86,'pur_small_biz','pending_claims','Are there any pending cases, claims, litigations against this business?','s_lov','comm_y_n','1','active','2024-06-07 13:30:00.000000'),(87,'pur_small_biz','comments','Provide additional information explaining why you need this grant:','text','comments','1','active','2024-06-07 13:30:00.000000'),(89,'pur_home','is_firsthome','Is this your first home?','text','is_firsthome','1','active','2024-06-07 13:30:00.000000'),(90,'pur_home','expenditure','Nature of expenditure: ','s_lov','expenditure','1','active','2024-06-07 13:30:00.000000'),(91,'pur_home','property_cost','Total expenditure expected(Rs):','text','property_cost','1','active','2024-06-07 13:30:00.000000'),(92,'pur_home','exist_property_value','Current market value of the property:','text','exist_property_value','1','active','2024-06-07 13:30:00.000000'),(93,'pur_home','guidance_value','Guidance value of the property:','text','guidance_value','1','active','2024-06-07 13:30:00.000000'),(94,'pur_home','property_address','Property Location(Address):','text','property_address','1','active','2024-06-07 13:30:00.000000'),(95,'pur_home','down_payment','How much fund do you have for down payment?','text','down_payment','1','active','2024-06-07 13:30:00.000000'),(96,'pur_home','major_transitions','Are you going to be experiencing any major life transitions soon (marriage, kids, retirement etc.)','text','major_transitions','1','active','2024-06-07 13:30:00.000000'),(97,'pur_home','cur_debt_staus','What is your total value of the current debts?','text','cur_debt_staus','1','active','2024-06-07 13:30:00.000000'),(98,'pur_home','comments','Provide additional information explaining why you need this grant:','text','','','','2024-06-07 13:30:00.000000'),(100,'expenditure','buy_land','Buying land','','','1','active','2024-06-07 13:30:00.000000'),(101,'expenditure','existing_land','Constructing house on existing land','','','1','active','2024-06-07 13:30:00.000000'),(102,'expenditure','maintanance_work','Maintenance work for existing house','','','1','active','2024-06-07 13:30:00.000000'),(103,'expenditure','house_ext','House extension','','','1','active','2024-06-07 13:30:00.000000'),(104,'expenditure','buy_apartment','Purchasing apartment','','','1','active','2024-06-07 13:30:00.000000'),(105,'expenditure','buy_house','Buying home(land+construction)','','','1','active','2024-06-07 13:30:00.000000'),(107,'pur_major_purchase','purchase_purpose','What is the major purchase?','text','purchase_purpose','1','active','2024-06-07 13:30:00.000000'),(108,'pur_major_purchase','money_usage','What is the value of this purchase?','text','money_usage','1','active','2024-06-07 13:30:00.000000'),(109,'pur_major_purchase','contribution','What is your contribution in this purchase?','text','contribution','1','active','2024-06-07 13:30:00.000000'),(110,'pur_major_purchase','comments','Provide additional information explaining why you need this grant:','text','comments','1','active','2024-06-07 13:30:00.000000'),(112,'pur_existing_debt','existing_debt','What is the total value of the existing debts?','text','existing_debt','1','active','2024-06-07 13:30:00.000000'),(113,'pur_existing_debt','annual_interest','What is the average annual rate of interest on these debts?','text','annual_interest','1','active','2024-06-07 13:30:00.000000'),(114,'pur_existing_debt','comments','Provide additional information explaining why you need this grant:','text','comments','1','active','2024-06-07 13:30:00.000000'),(116,'pur_retirement','profession_retirement','What was your profession before retirement?','','profession_retirement','1','active','2024-06-07 13:30:00.000000'),(117,'pur_retirement','income_retirement','What was your monthly income before retirement?','','income_retirement','1','active','2024-06-07 13:30:00.000000'),(118,'pur_retirement','pensioner','If you are a pensioner, mention the monthly pension amount. e.g. 10000','text','pensioner','1','active','2024-06-07 13:30:00.000000'),(119,'pur_retirement','after_retirement','Post retirement total monthly income: e.g. 10000','text','after_retirement','1','active','2024-06-07 13:30:00.000000'),(120,'pur_retirement','open_to work','Are you open to work?','text','open_to work','1','active','2024-06-07 13:30:00.000000'),(121,'pur_retirement','retirement_dependants','Total no of dependants:','Integer','retirement_dependants','1','active','2024-06-07 13:30:00.000000'),(122,'pur_retirement','comments','Provide additional information explaining why you need this grant:','text','comments','1','active','2024-06-07 13:30:00.000000'),(124,'pur_vehicle_purchase','veh_loan_purpose','Type of vehicle for which the loan is requested:','s_lov','veh_loan_purpose','1','active','2024-06-07 13:30:00.000000'),(125,'pur_vehicle_purchase','veh_registration','Enter vehicle registration number: ','text','veh_registration','1','active','2024-06-07 13:30:00.000000'),(126,'pur_vehicle_purchase','veh_registration_place','Place of registration:','text','veh_registration_place','1','active','2024-06-07 13:30:00.000000'),(127,'pur_vehicle_purchase','veh_category','Select your vehicle category:','s_lov','veh_category','1','active','2024-06-07 13:30:00.000000'),(128,'pur_vehicle_purchase','veh_type','Select your vehicle usage type:','s_lov','veh_type','1','active','2024-06-07 13:30:00.000000'),(129,'pur_vehicle_purchase','veh_manufacturer','Name of vehicle manufacturer:','text','veh_manufacturer','1','active','2024-06-07 13:30:00.000000'),(130,'pur_vehicle_purchase','veh_model','Enter vehicle model:','text','veh_model','1','active','2024-06-07 13:30:00.000000'),(131,'pur_vehicle_purchase','veh_cost','Basic cost of the vehicle:','integer','veh_cost','1','active','2024-06-07 13:30:00.000000'),(132,'pur_vehicle_purchase','veh_othercost','Additional cost incurred while acquiring the vehicle:','integer','veh_othercost','1','active','2024-06-07 13:30:00.000000'),(133,'pur_vehicle_purchase','veh_total_cost','Total cost of vehicle inclusive of insurance, road tax etc.,','integer','veh_total_cost','1','active','2024-06-07 13:30:00.000000'),(134,'pur_vehicle_purchase','veh_dealer_name','Seller/Dealer name:','text','veh_dealer_name','1','active','2024-06-07 13:30:00.000000'),(135,'pur_vehicle_purchase','veh_dealer_number','Seller/Dealer contact number ','text','veh_dealer_number','1','active','2024-06-07 13:30:00.000000'),(136,'pur_vehicle_purchase','comments','Provide additional information explaining why you need this grant:','text','comments','1','active','2024-06-07 13:30:00.000000'),(138,'veh_loan_purpose','veh_new','Purchase of new vehicle','','veh_new','1','active','2024-06-07 13:30:00.000000'),(139,'veh_loan_purpose','veh_used','Purchase of used vehicle','','veh_used','1','active','2024-06-07 13:30:00.000000'),(141,'veh_category','veh_motorcycle','Motorcycle','','veh_motorcycle','1','active','2024-06-07 13:30:00.000000'),(142,'veh_category','veh_car','Passenger Car','','veh_car','1','active','2024-06-07 13:30:00.000000'),(143,'veh_category','veh_van','Van','','veh_van','1','active','2024-06-07 13:30:00.000000'),(144,'veh_category','veh_truck','Single Unit Truck','','veh_truck','1','active','2024-06-07 13:30:00.000000'),(145,'veh_category','veh_tractor','Farm Tractor','','veh_tractor','1','active','2024-06-07 13:30:00.000000'),(147,'veh_type','type_private','Private use','','type_private','1','active','2024-06-07 13:30:00.000000'),(148,'veh_type','type_commercial','Commercial use','','type_commercial','1','active','2024-06-07 13:30:00.000000'),(150,'pur_med','doc_prescription','Certificate/Prescription from hospital/doctor:','file','doc_prescription','','','2024-06-07 13:30:00.000000'),(151,'pur_med','med_reports','Medical reports:[X-ray/MRI/ECG/Lab test results]','file','med_reports','','','2024-06-07 13:30:00.000000'),(152,'pur_med','receipt','Receipts of expenditure:','file','receipt','','','2024-06-07 13:30:00.000000'),(154,'pur_edu','bonafide_cert','Bonafide Certificate from school/institution','file','bonafide_cert','','','2024-06-07 13:30:00.000000'),(155,'pur_edu','marksheet','Marksheet and ceritificates of all major examination:','file','marksheet','','','2024-06-07 13:30:00.000000'),(156,'pur_edu','adm_letter','Proof of admission: Admission Letter from the Institution.','file','adm_letter','','','2024-06-07 13:30:00.000000'),(157,'pur_edu','fee_structure','Statement of cost of study/ Schedule of expenses','file','fee_structure','','','2024-06-07 13:30:00.000000'),(159,'pur_home','sale_deed','Property Sale deed or Sale Agreement','file','sale_deed','','','2024-06-07 13:30:00.000000'),(160,'pur_home','building_plan','Approved building plan (showing floor plan for flat purchase)','file','building_plan','','','2024-06-07 13:30:00.000000'),(161,'pur_home','construction_cost','Detailed estimate of construction cost.','file','construction_cost','','','2024-06-07 13:30:00.000000'),(162,'pur_home','property_valuation','Report stating the valuation of property in standard format by an empanelled valuer.','file','property_valuation','','','2024-06-07 13:30:00.000000'),(164,'pur_major_purchase','purchase_proof','Proof/Quotation of purchase:','file','purchase_proof','','','2024-06-07 13:30:00.000000'),(165,'pur_major_purchase','bank_stmt','Current 6 months bank statement','file','bank_stmt','','','2024-06-07 13:30:00.000000'),(167,'pur_small_biz','reg_certificate','Proof of business registration: e.g MOA, AOA, trade license, etc.,','file','reg_certificate','','','2024-06-07 13:30:00.000000'),(168,'pur_small_biz','gst_returns','Last 6 months GST returns certificate:','file','gst_returns','','','2024-06-07 13:30:00.000000'),(170,'pur_existing_debt','existing_debt_proof','Proof of existing debts:','file','existing_debt_proof','','','2024-06-07 13:30:00.000000'),(171,'pur_existing_debt','bank_stmt','Current 6 months bank statement:','file','bank_stmt','','','2024-06-07 13:30:00.000000'),(173,'pur_retirement','pension_cert','Pension ceritficate if applicable:','file','pension_cert','','','2024-06-07 13:30:00.000000'),(174,'pur_retirement','bank_stmt','Current 3 months bank statement','file','bank_stmt','','','2024-06-07 13:30:00.000000'),(176,'pur_vehicle_purchase','veh_register_doc','Proof of purchase: e.g. txn receipt, vehicle registration','file','veh_register_doc','','','2024-06-07 13:30:00.000000'),(177,'pur_vehicle_purchase','purchase_agreement','Proof of cost of vehicle: e.g. quotation, purchase agreement','file','purchase_agreement','','','2024-06-07 13:30:00.000000');
/*!40000 ALTER TABLE `lov_seed_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lov_seed_data_30April`
--

DROP TABLE IF EXISTS `lov_seed_data_30April`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lov_seed_data_30April` (
  `lov` int NOT NULL AUTO_INCREMENT,
  `lov_parent_code` varchar(100) DEFAULT NULL,
  `lov_code` varchar(100) DEFAULT NULL,
  `display_label` varchar(255) DEFAULT NULL,
  `input_type` varchar(30) NOT NULL,
  `lov_ref_code` varchar(60) DEFAULT NULL,
  `mandatory` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`lov`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lov_seed_data_30April`
--

LOCK TABLES `lov_seed_data_30April` WRITE;
/*!40000 ALTER TABLE `lov_seed_data_30April` DISABLE KEYS */;
INSERT INTO `lov_seed_data_30April` VALUES (1,'purpose','pur_edu','Education','s_lov','pur_edu','1','active','2024-04-26 13:30:00.000000'),(2,'purpose','pur_med','Medical','s_lov','pur_med','1','active','2024-04-26 13:30:00.000000'),(3,'purpose','pur_home','Home Loan/Renovation','s_lov','pur_home','1','active','2024-04-26 13:30:00.000000'),(4,'purpose','pur_major_purchase','Major Purchase','s_lov','pur_major_purchase','1','active','2024-04-26 13:30:00.000000'),(5,'purpose','pur_small_biz','Small Business','s_lov','pur_small_biz','1','active','2024-04-26 13:30:00.000000'),(6,'purpose','pur_existing_debt','Existing Debt','s_lov','pur_existing_debt','1','active','2024-04-26 13:30:00.000000'),(7,'pur_edu','edu_past_fin','How did/are you finance your education so far?','m_lov','edu_past_fin','1','active','2024-04-26 13:30:00.000000'),(8,'pur_edu','present_edu','Present Qualification:','s_lov','present_edu_options','1','active','2024-04-26 13:30:00.000000'),(9,'pur_edu','present_score','Present Academic Score/CGPA:','float','present_score','1','active','2024-04-26 13:30:00.000000'),(10,'pur_edu','applied_course','Course Applied for:','text','applied_course','1','active','2024-04-26 13:30:00.000000'),(11,'pur_edu','course_startdate','Course Start Date:','date','course_startdate','1','active','2024-04-26 13:30:00.000000'),(12,'pur_edu','course_enddate','Course End Date:','date','course_enddate','1','active','2024-04-26 13:30:00.000000'),(13,'pur_edu','univ_college_name','Name of the University/College:','text','univ_college_name','1','active','2024-04-26 13:30:00.000000'),(14,'pur_edu','tot_semester','Total No. of Semesters/terms:','s_lov','tot_semester_options','1','active','2024-04-26 13:30:00.000000'),(15,'pur_edu','adm_status','Admission Status:','s_lov','comm_y_n','0','active','2024-04-26 13:30:00.000000'),(16,'pur_edu','high_studies','Are you planning for higher studies after this course?','s_lov','comm_y_n','1','active','2024-04-26 13:30:00.000000'),(17,'pur_edu','total_fees','Total fees to be paid in semesters/terms:','text','total_fees_options','1','active','2024-04-26 13:30:00.000000'),(18,'pur_edu','payback_time','In how many years do you expect to be able to pay off your education loan?','s_lov','payback_options','1','active','2024-04-26 13:30:00.000000'),(19,'pur_edu','future_plans','What are your plans for the next two years?','','','1','active','2024-04-26 13:30:00.000000'),(20,'pur_edu','comments','Comments:','text','comments','1','active','2024-04-26 13:30:00.000000'),(21,'pur_edu2','','Supporting Documents:','','','','','2024-04-26 13:30:00.000000'),(22,'comm_y_n','yes','Yes','','','1','active','2024-04-26 13:30:00.000000'),(23,'comm_y_n','no','No','','','1','active','2024-04-26 13:30:00.000000'),(24,'edu_past_fin','gov_spon','Government Sponsored(Free education)','','','1','active','2024-04-26 13:30:00.000000'),(25,'edu_past_fin','scholorship','Scholarship','','','1','active','2024-04-26 13:30:00.000000'),(26,'edu_past_fin','rel_supp','Support from relative','','','1','active','2024-04-26 13:30:00.000000'),(27,'edu_past_fin','loan','Loan','','','1','active','2024-04-26 13:30:00.000000'),(28,'edu_past_fin','self_finance','Self Financed','','','1','active','2024-04-26 13:30:00.000000'),(29,'edu_past_fin','others','Other','s_lov','others','1','active','2024-04-26 13:30:00.000000'),(30,'others','specify','Provide details','text','','','','2024-04-26 13:30:00.000000'),(31,'present_edu_options','hsc','HSC','','','1','active','2024-04-26 13:30:00.000000'),(32,'present_edu_options','diploma','Diploma','','','1','active','2024-04-26 13:30:00.000000'),(33,'present_edu_options','bachelors','Bachelors','','','1','active','2024-04-26 13:30:00.000000'),(34,'present_edu_options','masters','Masters','','','1','active','2024-04-26 13:30:00.000000'),(35,'present_edu_options','doctorate','Doctorate','','','1','active','2024-04-26 13:30:00.000000'),(36,'tot_semesters_no','one','1','','','1','active','2024-04-26 13:30:00.000000'),(37,'tot_semesters_no','two','2','','','1','active','2024-04-26 13:30:00.000000'),(38,'tot_semesters_no','foure','4','','','1','active','2024-04-26 13:30:00.000000'),(39,'tot_semesters_no','six','6','','','1','active','2024-04-26 13:30:00.000000'),(40,'tot_semesters_no','eight','8','','','1','active','2024-04-26 13:30:00.000000'),(41,'tot_semesters_no','ten','10','','','1','active','2024-04-26 13:30:00.000000'),(42,'total_fees_options','amt_1','Below 25,000','','','1','active','2024-04-26 13:30:00.000000'),(43,'total_fees_options','amt_2','25,000 to 50,000','','','1','active','2024-04-26 13:30:00.000000'),(44,'total_fees_options','amt_3','50,000 to 1,00,000','','','1','active','2024-04-26 13:30:00.000000'),(45,'total_fees_options','amt_4','1,00,000 to 2,00,000','','','1','active','2024-04-26 13:30:00.000000'),(46,'total_fees_options','amt_5','2,00,000 to 3,00,000','','','1','active','2024-04-26 13:30:00.000000'),(47,'total_fees_options','amt_6','3,00000 to 4,00,000','','','1','active','2024-04-26 13:30:00.000000'),(48,'total_fees_options','amt_7','4,00,000 to 5,00,000','','','1','active','2024-04-26 13:30:00.000000'),(49,'total_fees_options','amt_8','Above 5,00,000','','','1','active','2024-04-26 13:30:00.000000'),(50,'payback_options','six_months','Within 6 months','','','1','active','2024-04-26 13:30:00.000000'),(51,'payback_options','one_year','6 months to 1 year','','','1','active','2024-04-26 13:30:00.000000'),(52,'payback_options','two_years','1 year to 2 years','','','1','active','2024-04-26 13:30:00.000000'),(53,'payback_options','three_years','2 years to 3 years','','','1','active','2024-04-26 13:30:00.000000'),(54,'payback_options','four_years','3 years to 4 years','','','1','active','2024-04-26 13:30:00.000000');
/*!40000 ALTER TABLE `lov_seed_data_30April` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lov_seed_data_7June`
--

DROP TABLE IF EXISTS `lov_seed_data_7June`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lov_seed_data_7June` (
  `lov` int NOT NULL AUTO_INCREMENT,
  `lov_parent_code` varchar(100) DEFAULT NULL,
  `lov_code` varchar(100) DEFAULT NULL,
  `display_label` varchar(255) DEFAULT NULL,
  `input_type` varchar(30) NOT NULL,
  `lov_ref_code` varchar(60) DEFAULT NULL,
  `mandatory` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`lov`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lov_seed_data_7June`
--

LOCK TABLES `lov_seed_data_7June` WRITE;
/*!40000 ALTER TABLE `lov_seed_data_7June` DISABLE KEYS */;
INSERT INTO `lov_seed_data_7June` VALUES (1,'purpose','pur_edu','Education','s_lov','pur_edu','1','active','2024-04-26 13:30:00.000000'),(2,'purpose','pur_med','Medical','s_lov','pur_med','1','active','2024-04-26 13:30:00.000000'),(3,'purpose','pur_home','Home Loan/Renovation','s_lov','pur_home','1','active','2024-04-26 13:30:00.000000'),(4,'purpose','pur_major_purchase','Major Purchase','s_lov','pur_major_purchase','1','active','2024-04-26 13:30:00.000000'),(5,'purpose','pur_small_biz','Small Business','s_lov','pur_small_biz','1','active','2024-04-26 13:30:00.000000'),(6,'purpose','pur_existing_debt','Existing Debt','s_lov','pur_existing_debt','1','active','2024-04-26 13:30:00.000000'),(7,'pur_edu','edu_past_fin','How did/are you finance your education so far?','m_lov','edu_past_fin','1','active','2024-04-26 13:30:00.000000'),(8,'pur_edu','present_edu','Present Qualification:','s_lov','present_edu','1','active','2024-04-26 13:30:00.000000'),(9,'pur_edu','present_score','Present Academic Score/CGPA:','float','','1','active','2024-04-26 13:30:00.000000'),(10,'pur_edu','applied_course','Course Applied for:','text','','1','active','2024-04-26 13:30:00.000000'),(11,'pur_edu','course_startdate','Course Start Date:','date','','1','active','2024-04-26 13:30:00.000000'),(12,'pur_edu','course_enddate','Course End Date:','date','','1','active','2024-04-26 13:30:00.000000'),(13,'pur_edu','univ_college_name','Name of the University/College:','text','','1','active','2024-04-26 13:30:00.000000'),(14,'pur_edu','tot_semester','Total No. of Semesters/terms:','s_lov','tot_semester','1','active','2024-04-26 13:30:00.000000'),(15,'pur_edu','adm_status','Admission Status:','s_lov','comm_y_n','0','active','2024-04-26 13:30:00.000000'),(16,'pur_edu','high_studies','Are you planning for higher studies after this course?','s_lov','comm_y_n','1','active','2024-04-26 13:30:00.000000'),(17,'pur_edu','total_fees','Total fees to be paid in semesters/terms:','s_lov','total_fees','1','active','2024-04-26 13:30:00.000000'),(18,'pur_edu','payback_time','In how many years do you expect to be able to pay off your education loan?','s_lov','payback','1','active','2024-04-26 13:30:00.000000'),(19,'pur_edu','future_plans','What are your plans for the next two years?','','','1','active','2024-04-26 13:30:00.000000'),(20,'com_comments','comments','Comments:','text','','1','active','2024-04-26 13:30:00.000000'),(21,'pur_edu','support_docs','Supporting Documents:','','','1','active','2024-04-26 13:30:00.000000'),(22,'comm_y_n','yes','Yes','','','1','active','2024-04-26 13:30:00.000000'),(23,'comm_y_n','no','No','','','1','active','2024-04-26 13:30:00.000000'),(24,'edu_past_fin','gov_spon','Government Sponsored(Free education)','','','1','active','2024-04-26 13:30:00.000000'),(25,'edu_past_fin','scholorship','Scholarship','','','1','active','2024-04-26 13:30:00.000000'),(26,'edu_past_fin','rel_supp','Support from relative','','','1','active','2024-04-26 13:30:00.000000'),(27,'edu_past_fin','loan','Loan','','','1','active','2024-04-26 13:30:00.000000'),(28,'edu_past_fin','self_finance','Self Financed','','','1','active','2024-04-26 13:30:00.000000'),(29,'edu_past_fin','others','Other','s_lov','others','1','active','2024-04-26 13:30:00.000000'),(30,'others','specify','Provide details','text','','','','2024-04-26 13:30:00.000000'),(31,'present_edu','hsc','Higher Secondary/PU','lov','present_edu','Y','active','2024-04-26 13:30:00.000000'),(32,'present_edu','diploma','Diploma','','','1','active','2024-04-26 13:30:00.000000'),(33,'present_edu','bachelors','Bachelors','','','1','active','2024-04-26 13:30:00.000000'),(34,'present_edu','masters','Masters','','','1','active','2024-04-26 13:30:00.000000'),(35,'present_edu','doctorate','Doctorate','','','1','active','2024-04-26 13:30:00.000000'),(36,'tot_semester','one','1',' ',NULL,'Y','active','2024-04-26 13:30:00.000000'),(37,'tot_semester','two','2',' ',NULL,'Y','active','2024-04-26 13:30:00.000000'),(38,'tot_semester','four','4',' ',NULL,'Y','active','2024-04-26 13:30:00.000000'),(39,'tot_semester','six','6',' ',NULL,'Y','active','2024-04-26 13:30:00.000000'),(40,'tot_semester','eight','8',' ',NULL,'Y','active','2024-04-26 13:30:00.000000'),(41,'tot_semester','ten','10',' ',NULL,'Y','active','2024-04-26 13:30:00.000000'),(42,'total_fees','amt_1','Below 25,000','','','1','active','2024-04-26 13:30:00.000000'),(43,'total_fees','amt_2','25,000 to 50,000','','','1','active','2024-04-26 13:30:00.000000'),(44,'total_fees','amt_3','50,000 to 1,00,000','','','1','active','2024-04-26 13:30:00.000000'),(45,'total_fees','amt_4','1,00,000 to 2,00,000','','','1','active','2024-04-26 13:30:00.000000'),(46,'total_fees','amt_5','2,00,000 to 3,00,000','','','1','active','2024-04-26 13:30:00.000000'),(47,'total_fees','amt_6','3,00000 to 4,00,000','','','1','active','2024-04-26 13:30:00.000000'),(48,'total_fees','amt_7','4,00,000 to 5,00,000','','','1','active','2024-04-26 13:30:00.000000'),(49,'total_fees','amt_8','Above 5,00,000','','','1','active','2024-04-26 13:30:00.000000'),(50,'payback','six_months','Within 6 months','','','1','active','2024-04-26 13:30:00.000000'),(51,'payback','one_year','6 months to 1 year','','','1','active','2024-04-26 13:30:00.000000'),(52,'payback','two_years','1 year to 2 years','','','1','active','2024-04-26 13:30:00.000000'),(53,'payback','three_years','2 years to 3 years','','','1','active','2024-04-26 13:30:00.000000'),(54,'payback','four_years','3 years to 4 years','','','1','active','2024-04-26 13:30:00.000000'),(55,'pur_med','med_purpose','Purpose for medical loan:','m_lov','\nmed_purpose','1','active','2024-04-26 13:30:00.000000'),(56,'pur_med','med_history','Medical history(if any): ','text','med_history','1','active','2024-04-26 13:30:00.000000'),(57,'pur_med','med_insurance','Do you have any insurance to cover medical expenses?','','med_insurance','','','2024-04-26 13:30:00.000000'),(58,'med_insurance','med_ins_y','Yes','','med_ins_y','','','2024-04-26 13:30:00.000000'),(59,'med_insurance','med_ins_n','No','','med_ins_n','','','2024-04-26 13:30:00.000000'),(60,'med_ins_y','med_ins_provider','Enter the insurance provider name:','text','','','','2024-04-26 13:30:00.000000'),(61,'med_ins_y','med_ins_policyno','Enter the insurance policy number:','text','','','','2024-04-26 13:30:00.000000'),(62,'med_ins_y','med_insurance_detail','Provide details about the medical insurance:','text/filename(upload document)','','','','2024-04-26 13:30:00.000000'),(63,'surgery','success_rate','Success rate of the [surgery/recovery]:','','','1','active','2024-04-26 13:30:00.000000'),(64,'com_comments','comments','Comments','text','','1','active','2024-04-26 13:30:00.000000'),(65,'comments','','Comments:','text','','1','active','2024-04-26 13:30:00.000000'),(66,'\nmed_purpose','surgery','Surgery','','success_rate','1','active','2024-04-26 13:30:00.000000'),(67,'\nmed_purpose','hospitalisation','Hospitalisation','','','1','active','2024-04-26 13:30:00.000000'),(68,'\nmed_purpose','rehabilitation','Rehabilitation','','','1','active','2024-04-26 13:30:00.000000'),(69,'\nmed_purpose','recovery','Recovery','','success_rate','1','active','2024-04-26 13:30:00.000000'),(70,'','','','','','','','2024-04-26 13:30:00.000000'),(71,'pur_small_biz','biz_type','Nature or type of business:','text','biz_type','1','active','2024-04-26 13:30:00.000000'),(72,'pur_small_biz','money_usage','How will you use this money?','text','money_usage','1','active','2024-04-26 13:30:00.000000'),(73,'pur_small_biz','biz_running','Is your business currently operating?','text','biz_running','1','active','2024-04-26 13:30:00.000000'),(74,'pur_small_biz','biz_ownership','Whether the business office/land rented /owned?','text','biz_ownership','1','active','2024-04-26 13:30:00.000000'),(75,'pur_small_biz','biz_employee','How many employees does your business have?','text','biz_employee','1','active','2024-04-26 13:30:00.000000'),(76,'pur_small_biz','biz_owners','How many owners does your business have?','text','biz_owners','1','active','2024-04-26 13:30:00.000000'),(77,'pur_small_biz','finance_status','How would you rate the current financial condition of your business?','text','finance_status','1','active','2024-04-26 13:30:00.000000'),(78,'com_comments','comments','Comments:','text','','1','active','2024-04-26 13:30:00.000000'),(79,'pur_home','is_firsthome','Is this your first home?','text','is_firsthome','1','active','2024-04-26 13:30:00.000000'),(80,'pur_home','expenditure','Nature of expenditure: ','s_lov','expenditure','1','active','2024-04-26 13:30:00.000000'),(81,'pur_home','property_cost','Cost of the property(Rs):','text','property_cost','1','active','2024-04-26 13:30:00.000000'),(82,'pur_home','exist_property_value','Existing value of the property:','text','exist_property_value','1','active','2024-04-26 13:30:00.000000'),(83,'pur_home','guidance_value','Cost based on guidance value:','text','guidance_value','1','active','2024-04-26 13:30:00.000000'),(84,'pur_home','property_address','Property Location(Address):','text','property_address','1','active','2024-04-26 13:30:00.000000'),(85,'pur_home','any_co_borrower','Do you have a co-borrower?','text','any_co_borrower','1','active','2024-04-26 13:30:00.000000'),(86,'pur_home','down_payment','Do you have funds available for a down payment?','text','down_payment','1','active','2024-04-26 13:30:00.000000'),(87,'pur_home','major_transitions','Are you going to be experiencing any major life transitions soon (marriage, kids, retirement etc.)','text','major_transitions','1','active','2024-04-26 13:30:00.000000'),(88,'pur_home','cur_debt_staus','What is your current debt status?','text','cur_debt_staus','1','active','2024-04-26 13:30:00.000000'),(89,'pur_home','cur_month_expenses','What are your current monthly housing expenses?','text','cur_month_expenses','1','active','2024-04-26 13:30:00.000000'),(90,'pur_home','docs','Supporting documents','text','docs','1','active','2024-04-26 13:30:00.000000'),(91,'com_comments','comments','Comments','text','','','','2024-04-26 13:30:00.000000'),(92,'expenditure','buy_land','Buying land','','','','','2024-04-26 13:30:00.000000'),(93,'expenditure','existing_land','Constructing house on existing land','','','','','2024-04-26 13:30:00.000000'),(94,'expenditure','maintanance_work','Maintenance work for existing house','','','','','2024-04-26 13:30:00.000000'),(95,'expenditure','house_ext','House Extension','','','','','2024-04-26 13:30:00.000000'),(96,'expenditure','buy_apartment','Purchasing Apartment','','','','','2024-04-26 13:30:00.000000'),(97,'expenditure','buy_house','Buying home(land+construction)','','','','','2024-04-26 13:30:00.000000'),(98,'pur_major_purchase','purchase_purpose','Purpose of major purchase:','textbox','text','Y','active','2024-05-28 11:46:18.497979'),(99,'pur_major_purchase','money_usage','How will you use this money?','textbox','money_usage','Y','active','2024-05-28 11:46:50.261458'),(100,'pur_major_purchase','comments','Comments:','textbox','comments','Y','active','2024-05-28 11:47:24.137580'),(101,'pur_existing_debt','existing_debt','What are the existing debts?','textbox','existing_debt','Y','active','2024-05-28 11:47:57.157148'),(102,'pur_existing_debt','money_usage','How will you use this money?','textbox','money_usage','Y','active','2024-05-28 11:48:24.805607'),(103,'pur_existing_debt','comments','Comments:','textbox','comments','Y','active','2024-05-28 11:48:50.903448'),(104,'present_edu','primary','Primary','lov','present_edu','Y','active','2024-05-30 10:06:17.422101'),(105,'present_edu','secondary','Secondary','lov','present_edu','Y','active','2024-05-30 10:07:52.568100'),(106,'purpose','pur_vehicle_purchase','Vehicle Purchase','lov','pur_vehicle_purchase','Y','active','2024-05-30 12:22:20.856186'),(107,'purpose','pur_retirement','Retirement','lov','pur_retirement','Y','active','2024-05-30 12:22:57.249488'),(108,'pur_med','doc_prescription','Certificate/Prescription from hospital/doctor:','file','doc_prescription','Y','active','2024-06-07 08:24:50.875965'),(109,'pur_med','med_reports','Medical Reports:[X-ray/MRI/ECG/Lab test results]','file','med_reports','Y','active','2024-06-07 08:25:20.715371');
/*!40000 ALTER TABLE `lov_seed_data_7June` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_social_user_id_8146e70c_fk_user_cust` (`user_id`),
  CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_user_cust` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customuser`
--

DROP TABLE IF EXISTS `user_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `date_joined` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneno` varchar(12) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `marital_status` varchar(30) DEFAULT NULL,
  `highest_education` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `identity_proof` varchar(255) DEFAULT NULL,
  `identity_proof_copy` varchar(255) DEFAULT NULL,
  `address_proof` varchar(255) DEFAULT NULL,
  `address_proof_copy` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_role` varchar(20) DEFAULT NULL,
  `is_guarantor` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `income_proof` varchar(255) DEFAULT NULL,
  `income_copy` varchar(255) DEFAULT NULL,
  `monthly_income` decimal(10,2) NOT NULL,
  `tot_fam_income` decimal(10,2) NOT NULL,
  `tot_dependants` varchar(255) DEFAULT NULL,
  `cibil_score` varchar(25) DEFAULT NULL,
  `covenants_risks` varchar(255) DEFAULT NULL,
  `default_account_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `b_phoneno` (`phoneno`),
  KEY `user_customuser_default_account_id_0d34d741_fk_account_a` (`default_account_id`),
  CONSTRAINT `user_customuser_default_account_id_0d34d741_fk_account_a` FOREIGN KEY (`default_account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customuser`
--

LOCK TABLES `user_customuser` WRITE;
/*!40000 ALTER TABLE `user_customuser` DISABLE KEYS */;
INSERT INTO `user_customuser` VALUES (1,'pbkdf2_sha256$720000$lkyrBADy1jZ0T5ZV8vFJwD$T3FeawdSRmMAsCMIxLHbol5zzyQT7xlGtC2qXsi4J/M=','2024-10-17 06:39:13.107277',1,'Arvind','Singh',NULL,NULL,'2024-04-25','arvind.singh1808@gmail.com','9711507122','',NULL,NULL,'married',NULL,NULL,NULL,'','1000 G-block','','active','2024-04-25 04:03:51.226210','2024-05-29 08:55:12.708431',NULL,0,1,1,NULL,'',0.00,0.00,NULL,NULL,NULL,1),(2,'pbkdf2_sha256$720000$0loWJS4MQJeKxnkKqgEKER$jCAlMa06lNgXaXAf9M9cFkEVKAvZV6kjcZajQVMZtNU=','2024-10-18 08:56:46.758919',0,'Ayush','Singh','M','2023-09-05','2024-04-25','arvind.singh@okirana.com','9711507120','','Indian','Hindu','married','Job','MCA','certificate','','1000 G-block','','active','2024-04-25 04:06:48.879298','2024-07-03 10:46:57.672675','approver',0,1,0,NULL,'',0.00,0.00,NULL,NULL,NULL,1),(3,'pbkdf2_sha256$720000$AO0FopdcHWLIhKJVhH7I0y$ybs+BzzhWnGGwsVysjpq2cDjjyRkk9Gjj+WknduRM1Q=','2024-07-04 06:19:58.788804',0,'Mohit','Singh','M','1982-03-05','2024-04-25','mohit.raj@okirana.com','98765432312',NULL,'Indian','Hindu','married','Diploma','Developer','PAN',NULL,'Adhar',NULL,'active','2024-04-25 04:08:55.051356','2024-07-04 06:19:41.249489','approver',0,1,0,'ITR',NULL,0.00,0.00,'4','ABC','No',1),(27,'pbkdf2_sha256$720000$wQU3T2j32cmb6Wpq14ilhJ$Xoydz3GvZcP7vRCR3AEj0kaYjZbNVCN5aV85/WPG2dI=','2024-09-25 09:34:55.291102',0,'Nisha','Rangan','F','1989-11-09','2024-04-30','nisha.rangan@okirana.com','9731316875',NULL,'Indian','Hindu','married','Diploma','Developer','PAN',NULL,'Adhar',NULL,'active','2024-04-30 10:36:54.978422','2024-07-05 08:22:09.068555','approver',0,1,0,'ITR',NULL,0.00,0.00,'4','ABC','No',1),(337,'pbkdf2_sha256$720000$EV6nykz4gfnRIq1NUo1taC$CzKZYwI+J5qcqVCbnZmgRXjhkFStyw5sAgvvvqEnrwg=','2024-10-19 04:10:35.516869',0,'Anil','Kini','M',NULL,'2024-07-02','anilkini@hotmail.com','9731708241',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-02 06:39:15.197643','2024-07-18 15:06:48.042836','approver',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(342,'pbkdf2_sha256$720000$x4HX1sxajEQumQDepUVAFz$jbd0gIkPBHosxlMxQm/0HypjgrSdzhRYbFw+PWS6AZo=',NULL,0,'werwer','werwe','M','2024-07-26','2024-07-04','234234@gdfg.com','234324','media/purpose/image_2.png','','Hindu','','','','Aadhar','media/purpose/React_Native_-_Test_2.pdf','Ration Card','media/purpose/vector-icon-case-study-on-600nw-1395648677_1.jpg','active','2024-07-04 06:12:32.613480','2024-07-04 06:17:45.595638','benefactor',0,1,0,'ITR','media/purpose/image_2_gPGm4m2.png',0.00,0.00,'0','0','',NULL),(343,'pbkdf2_sha256$720000$x1KGEwqiQKI6t172ZNdZRn$uSBhdzpwB6YlwOysk51rqAJuGauALs2YaoZoMhHhtlg=',NULL,0,'tryrty','tryrty','',NULL,'2024-07-05','2342346@gdfg.com','6456456',NULL,'','','','','','PAN',NULL,'Ration Card',NULL,'active','2024-07-05 03:58:36.924477','2024-07-10 08:38:24.100578','benefactor',0,1,0,'Bank Statement','media/purpose/pic_1.jpg',0.00,0.00,'','','No',NULL),(344,'pbkdf2_sha256$720000$GIY4JxJnfxmqzBVwWerEhJ$E2weQwXwQESq8P0wikcxdJLLoxpd0w/VPmqE4hoCbis=',NULL,0,'test_firstname','test_lastname','M',NULL,'2024-07-05','anilkini@hotmail.com','9731316872',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-05 03:58:37.447499','2024-07-10 12:44:46.015660','benefactor',0,1,0,NULL,NULL,0.00,0.00,'0','0',NULL,NULL),(345,'pbkdf2_sha256$720000$79mMcVt2wvPWy1FIVj3emc$+lzP6aWw7UrExRxmFJbExLPuXNIp8MsQjQc//Md5DoU=',NULL,0,'Aakash_test','Niranjan_test','M','2004-10-19','2024-07-05','anilkini_3@hotmail.com','9090909001','','Indian','Hindu','single','H.Sc','Student','','','','','active','2024-07-05 10:55:11.532785','2024-07-10 17:22:47.226753','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(346,'pbkdf2_sha256$720000$5sYvUB7shtn8c93OnqZxsm$C/7tuFPwRfCDBAqHGdBLyNgt7mYXBtfgc5VYYz47h8Q=',NULL,0,'Santhosh','Subramanian','M',NULL,'2024-07-09','san1@abc.com','9090909097','media/purpose/pic2_F6KKhsK.jpg','','','','','','','','','','active','2024-07-09 12:45:34.151010','2024-07-11 08:54:37.592051','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(347,'6aXufg7MeS',NULL,0,'Santhosh','Subramanian','M',NULL,'2024-07-09',NULL,'9090909078','media/purpose/pic_1_hUjDEEb.jpg','','','','','','','','','','active','2024-07-09 12:46:49.675188','2024-07-10 09:26:02.387974','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(348,'pbkdf2_sha256$720000$4a6GM5g3iWNeyN9TIQDRDI$3JPyY1/rRoQgu/fUSwhqfuwW/2fd0Kl4feGhBTk377w=',NULL,0,'tryrty','tryrty',NULL,NULL,'2024-07-10',NULL,'645645666',NULL,NULL,NULL,NULL,NULL,NULL,'PAN',NULL,NULL,NULL,'active','2024-07-10 11:35:18.926599','2024-07-11 08:54:37.609934','benefactor',0,1,0,'Bank Statement','media/purpose/pic_1.jpg',0.00,0.00,NULL,NULL,'No',NULL),(349,'pbkdf2_sha256$720000$dUs2hSSIujIDqt5ElD7YsU$LyEONlbS/MwJXh49y1+5cJk/DZQwiX8EQsN2IWDBy34=',NULL,0,'Arthi_test','Suresh_test',NULL,NULL,'2024-07-10','test002@abc.com','90909090002','media/purpose/pic2_2em5lDw.jpg',NULL,NULL,NULL,NULL,NULL,'Aadhar','media/purpose/common_retail_loan__application_form_39Fa94o.pdf','Ration Card','media/purpose/pic2_WxSKNaT.jpg','active','2024-07-10 12:49:19.239464','2024-07-17 11:21:39.055118','benefactor',0,1,0,NULL,NULL,0.00,0.00,'0','0',NULL,NULL),(350,'pbkdf2_sha256$720000$ZVPTVyv78mp8TP5PmR43N3$IlxEKrYF73AFCHKIDA+WQfnOl6dDjd96j3ZFsbzCsnQ=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'555555555',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 14:52:33.609686','2024-07-10 14:56:01.979246','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(351,'pbkdf2_sha256$720000$2wxzv7zFHJsZ0t1CflrGBg$ZLR+Sws72ZV80rz/OL9d2c1w55bmNYmWSQIf/239sZQ=',NULL,0,'test_1_71','test_1_71','M','2024-07-11','2024-07-10','test71@abc.com','7070707071',NULL,'Indian','Hindu','single',NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 14:56:40.061710','2024-07-11 10:44:26.310696','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,'No',NULL),(352,'pbkdf2_sha256$720000$rAYsrbyvLnD8tA68CoBZT9$SygYsSZy1fjUv3rbcR22a1sq7Jz2+yJzSK6Mbj+L22Y=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'7070707072',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 15:00:49.310152','2024-07-10 15:00:49.310186','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(353,'pbkdf2_sha256$720000$3rJVXlyofOiU5Ed4Nd050M$zDNXIBvt5UQxg2CIlmKoiymPS6o+5oqQrdCYN8qyEAk=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'7070707073',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 15:08:52.857461','2024-07-10 15:08:52.857494','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(354,'pbkdf2_sha256$720000$4j4U0lJATYyDkk5YhN6tLv$uJ5u36Rof2sZiZZ3OofijdsnhFly080sByF8hTJTID8=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'7070707074',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 15:30:56.829579','2024-07-10 15:30:56.829612','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(355,'pbkdf2_sha256$720000$jVALvCzIECtG3HhHQ4DceP$3+ytG7yo3Wr2kKAYKoGrwa4/+lbLSSqGrB6Rj6g13e8=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'7070707075',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 15:32:01.766078','2024-07-10 15:32:01.766113','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(356,'pbkdf2_sha256$720000$fFei7dUaODjwXpeXVwhZ8K$gdjIQURO/nzEcPk0ltV7gP4a+RcS5PMf/QayCbwW6j4=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'7070707077',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 15:39:36.700134','2024-07-10 15:39:36.700178','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(357,'pbkdf2_sha256$720000$yU20gtcWHFKmPjRczKL9MP$2LxG3jHLXvN51vp7AdB5mK4XZPbdsr1pQgPOghVL+a4=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'7070707078',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 15:41:21.781686','2024-07-10 15:41:21.781718','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(358,'pbkdf2_sha256$720000$ooX6we5lRbUF3mhOrDaZYU$R7qHlev2GjiYJKByzhYC+BxMGjefKq6kJERhL7mY9xI=',NULL,0,'test1','test1',NULL,NULL,'2024-07-10',NULL,'7070707079',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-10 15:49:51.320530','2024-07-11 10:46:44.747841','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(359,'pbkdf2_sha256$720000$FVrYwHWyPnB3TuYRi6lKpI$98u7wxASCHAH5Zr5X6LR6BJ8NMSfGamZrHoIQymB9u0=',NULL,0,'Yeshwanth_test','Kumar_test','M',NULL,'2024-07-11','arvind1.singh@okirana.com','9090909003','media/purpose/pic2_ndJhzpY.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-11 08:43:12.645583','2024-07-17 11:21:17.955523','benefactor',0,1,0,NULL,NULL,0.00,0.00,'0','0',NULL,NULL),(360,'pbkdf2_sha256$720000$MOS3EfmUVF5Z8DX8b5Ae55$dbVf7ryi9kS4VsYPBYV2fJrol9bQBTkGD0G3Ncen/1I=',NULL,0,'name1_coapp','name2_coapp','M','2024-07-25','2024-07-11','test@abc.com','8080808033',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-11 08:45:24.947103','2024-07-12 03:54:33.210008','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,'No',NULL),(361,'OZftH7iRY7',NULL,0,'Test_name1','Test_name2','M','2000-12-16','2024-07-11','mohit1.raj@okirana.com','9090909004','media/purpose/pic_1_yXJodg3.jpg','Indian','Hindu','married','B.E','Student',NULL,NULL,NULL,NULL,'active','2024-07-11 10:06:09.563179','2024-07-11 10:47:32.919531','benefactor',0,1,0,NULL,NULL,0.00,0.00,'0','0',NULL,NULL),(362,'pbkdf2_sha256$720000$isKC0nsrMsyziFPaIO6fUo$4KkClGr7avqBxTH0Wozt5XHI0WP1xNs65PmLNL/QiYc=',NULL,0,'Santhosh','Subramanian','M',NULL,'2024-07-11',NULL,'9090909088','media/purpose/flowers_xnQbciL.jpg','','','','','','','','','','active','2024-07-11 12:10:09.729081','2024-07-11 12:10:09.729113','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(363,'pbkdf2_sha256$720000$XehfE2tajJnjcCptEb6Ilq$r24Tb3V1jhQ3otZzgushxNhFl4yj73qDfmqOKIY+WB0=',NULL,0,'test_name1','test_name2','',NULL,'2024-07-11','','9090909035','media/purpose/pic2_Fllqn19.jpg','','','','','','','','','','active','2024-07-11 13:04:34.593900','2024-07-11 13:17:43.103690','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(364,'pbkdf2_sha256$720000$CZcBscRlAG2rYzSz19xYEp$sMMBAZhLIzxfHg1tGaXK7QU61AGUnwTFAplPK9n1Pkk=',NULL,0,'Santhosh','Subramanian','M',NULL,'2024-07-12',NULL,'9090909087','media/purpose/flowers_xnQbciL.jpg','','','','','','','','','','active','2024-07-12 01:05:59.825622','2024-07-12 01:09:22.752167','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(365,'pbkdf2_sha256$720000$t1Rc0wZbZ5L2yRmhuQmY3r$TBpHMjF51P/kxDgbFTvRH1lY1UfTJdZtReUNwz3Kdm8=',NULL,0,'AAAAAA','AAAAAA',NULL,NULL,'2024-07-12',NULL,'9090909086',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-12 01:09:23.285314','2024-07-12 01:09:23.285349','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(366,'pbkdf2_sha256$720000$WTXftzhyWBN02h0xtcvCLK$Nc60kysHmwy7tYoUB/V019nF1iCMFLQuPwiTufFOSVY=',NULL,0,'name1_37','name2_37','M',NULL,'2024-07-12','test_37@abc.com','9090909037','','','','','','','','','','','active','2024-07-12 03:54:33.765933','2024-07-12 03:54:33.765969','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(367,'pbkdf2_sha256$720000$dBOSlzGkP6rIUFzk1TXeHV$cXnVGGQt33gdM4+TG9HMgp3BsaSGSlrMdXyyL1XHDc8=',NULL,0,'name1_39','name2_39','',NULL,'2024-07-12',NULL,'9090909039','','','','single','','ghjghj','Aadhar','','','','active','2024-07-12 03:55:39.063701','2024-07-15 04:22:45.701044','benefactor',0,1,0,'','',5465.00,546.00,'54','54','',NULL),(368,'pbkdf2_sha256$720000$A0lhR886223gyUREEmf23S$X67MXmCwbxankznjs0897typsvZyNLVY82OWBmXAroA=',NULL,0,'Santhosh','Subramanian','M',NULL,'2024-07-12',NULL,'9090909089','media/purpose/flowers_xnQbciL.jpg','','','','','','','','','','active','2024-07-12 03:59:42.138207','2024-07-12 04:42:04.724500','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(369,'pbkdf2_sha256$720000$Ed1KyXd7grUNCJgDn2bJ72$cD0HcTzJBLojbJg3zplyiUicI2ilprQZW59Xdv/YxtU=',NULL,0,'Arvind','Arvind',NULL,NULL,'2024-07-12',NULL,'7070707098',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-12 04:41:28.933495','2024-07-12 04:41:28.933528','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(370,'pbkdf2_sha256$720000$ewrqXgXq3rZ5O5KZxmpDsR$ED5squzS6/l5Q/AOG1o6P2KLZrdMFUrHzwbhbtIqjgM=',NULL,0,'Shankar','Shankar',NULL,NULL,'2024-07-12',NULL,'8080808099',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-12 13:17:10.210161','2024-07-15 04:22:45.731027','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,NULL,NULL),(371,'pbkdf2_sha256$720000$sF58PZNi6VLdCQpAzP1OT6$SdBSmA/zR8obkQMO7+mzV/km92VsJPDehbOR3bNYf8g=',NULL,0,'ffdsf','sdfsdf','',NULL,'2024-07-19','gdfgdfg@jgjkgk.com','787987798','','','','','','','','','','','active','2024-07-19 07:46:12.754016','2024-07-19 07:46:12.754050','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(372,'pbkdf2_sha256$720000$dAx7d8tjpoD4TvBvitPWLF$v+XI7b9D3p4IaiLjQGB/7fI6AvH1QBKYvrmedkOVr4Q=',NULL,0,'sdf','sdfsdf','',NULL,'2024-07-19',NULL,'867868756','','','','','','','','','','','active','2024-07-19 07:47:35.302404','2024-07-19 07:47:35.302436','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(373,'pbkdf2_sha256$720000$uMpEfwAwWAzZbFv8vSj2Z4$gYNMGbg4r2r7tutAzcvclQT+AlFQ47oejgA5bnkkDak=',NULL,0,'dfgdfg','dfgdfg','',NULL,'2024-07-19',NULL,'7987879',NULL,'','','','','','',NULL,'',NULL,'active','2024-07-19 07:48:38.283128','2024-07-19 07:48:38.283165','benefactor',0,1,0,'',NULL,0.00,0.00,'','','No',NULL),(374,'pbkdf2_sha256$720000$4airwaTTz44E4Z6yxh9q7E$DaCKyBj8fMIjcuwoYY1MzFdAtiTQ6R4CPD+YEV/520w=',NULL,0,'Mohit_test','Singh_test','M',NULL,'2024-07-19','mohit001@gmail.com','099854712678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-19 07:48:38.811535','2024-07-19 11:48:36.717636','benefactor',0,1,0,NULL,NULL,0.00,0.00,'0','0',NULL,NULL),(375,'pbkdf2_sha256$720000$eWjkpRkPkYr2bgGNjN93wB$DPQ/L3SaKaQ3QAdGSnZwAIqESKHIfbEkVll3gNuymUs=',NULL,0,'Rohit','Singh','',NULL,'2024-07-19','rohit001@gmail.com','09985471207',NULL,'','','','','','',NULL,'',NULL,'active','2024-07-19 08:11:00.228823','2024-07-19 08:11:00.228855','benefactor',0,1,0,'',NULL,0.00,0.00,'','','No',NULL),(376,'pbkdf2_sha256$720000$8elJPDpimN58nIxBIi43Xn$tI2TGsut58kxHt5ktwkBkSK5d9pjdSvf9tIltGJlqZc=',NULL,0,'eew','wewe','',NULL,'2024-07-19',NULL,'776476476547','','','','','','','','','','','active','2024-07-19 08:11:00.789981','2024-07-19 08:11:00.790012','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(377,'pbkdf2_sha256$720000$cso8LJIhrRj5M9n0ZRC5fx$9pSRzpG6X1UlQhrKPsbvUryYyjV93JxeX9dblQuoZrc=',NULL,0,'erter','erter','',NULL,'2024-07-19',NULL,'5345345',NULL,'','','','','','',NULL,'',NULL,'active','2024-07-19 08:53:46.871428','2024-08-22 07:51:26.985540','benefactor',0,1,0,'',NULL,0.00,0.00,'','','No',NULL),(378,'pbkdf2_sha256$720000$z8qBf0NKzFygSfjg4yz3mw$up06YYy8Mw2kEQ+1SGDfNVlx2+xjpUC4ebP2JwFdogQ=',NULL,0,'test_firstnametest_firstname','test_lastname',NULL,NULL,'2024-07-19',NULL,'343242','media/purpose/sc_03.jpeg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-19 08:53:47.420887','2024-08-22 07:51:26.967528','benefactor',0,1,0,NULL,NULL,0.00,0.00,'0','0',NULL,NULL),(379,'pbkdf2_sha256$720000$1zWuND0jZDaPDZ4zxr7Uxz$Ogr9m868DawY+TkDo6Y4qPUplPGgWq/OH3nHh5vTtrI=',NULL,0,'test_name1','test_name2','M',NULL,'2024-07-19',NULL,'345345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active','2024-07-19 08:59:39.869583','2024-07-19 11:48:17.798520','benefactor',0,1,0,NULL,NULL,0.00,0.00,NULL,NULL,'No',NULL),(380,'pbkdf2_sha256$720000$gePoUnyFxBC0P4U2HVjVWd$ItKZjekW0T4xNcWGTUQO01aCp3DXD5bR6vaApj1wCig=',NULL,0,'dgdfg','dfgdfg','',NULL,'2024-07-19',NULL,'534534','','','','','','','','','','','active','2024-07-19 08:59:40.416552','2024-07-19 08:59:40.416586','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(381,'pbkdf2_sha256$720000$dhwa0trbfhbNVlePweRkQn$t/01QJ60IEbPM8ETeopKpKtPtzQqECd+fIngnwixIIw=',NULL,0,'test1','test2','',NULL,'2024-07-19',NULL,'9090909066','media/purpose/pic_1_r6lbODZ.jpg','','','','','','','','','','active','2024-07-19 10:46:59.019512','2024-07-19 10:48:19.396781','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(382,'pbkdf2_sha256$720000$U5lir60Dvd7zUMKW317dAo$DbCHEbyBWuixgnf8a2W0v5mDD+EbBkLj4MAwhdzIh+w=',NULL,0,'test_1','test_2','',NULL,'2024-07-19',NULL,'90909090333','','','','','','','','','','','active','2024-07-19 11:06:08.695574','2024-07-19 11:06:08.695607','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(383,'pbkdf2_sha256$720000$YHJgEb0ERFg2jb4HtU9Zyf$K4nlePkxTEoqFebr736d/oEmGcKttPjKWp9LrpoE5xY=',NULL,0,'Test1','Test2','M',NULL,'2024-07-19',NULL,'90909090555','media/purpose/46045A4A-BD1F-475F-AE1F-BAFB2C8AF581.jpeg','','','','','','','','','','active','2024-07-19 14:13:38.450660','2024-07-19 14:15:20.553580','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(384,'pbkdf2_sha256$720000$JggI2IeEd2yVNqyVzoOEM2$lTZtF/zqFBE6yf89YiYYZaQJ/k+M5PHFtNF3RMtxIRc=',NULL,0,'Test1','Test2','',NULL,'2024-07-19',NULL,'909090905678','','','','','','','','','','','active','2024-07-19 14:29:18.291055','2024-07-19 14:29:18.291088','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(385,'pbkdf2_sha256$720000$iMKwFtbnrb2UYOhjU5UWAK$9BViExzzCX83KqMPA0I8JFC0HKBaTSW+VlUsczVVR8o=',NULL,0,'Test1','Test2','',NULL,'2024-07-19',NULL,'909090903213','','','','','','','','','','','active','2024-07-19 14:30:14.561361','2024-07-19 14:30:14.561395','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(386,'pbkdf2_sha256$720000$7WtTFrK8ekrw9tzD5Cxaxh$/aaWa4f7aiM3ZU7eHcccyxTlsF5JATsWEVmY8uybFo8=',NULL,0,'Dolly','John','F','1955-11-11','2024-07-23',NULL,'9880093060','','Indian','Christianity','married','','','Aadhar','media/purpose/08941730-24b1-43a6-aefe-dd78ac2860a9.jpeg','','','active','2024-07-23 09:57:42.796299','2024-07-23 10:01:43.938749','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(387,'pbkdf2_sha256$720000$M4ty8jnSWM3stXllPLIkEZ$N5jkV0+I4uVUeEE4jr+L0X6d9kdTaUPbXeKxZDxz0VE=',NULL,0,'Regina','Joseph','F',NULL,'2024-07-26',NULL,'000000000','','','','','','','','','','','active','2024-07-26 12:28:54.035077','2024-07-26 12:28:54.035111','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(388,'pbkdf2_sha256$720000$Q3sRxeCTgeqpDdzDNA7z4j$eEg5Oi3e7E2CRhzTl+3bLcOiSuXPSVNrG6sVsq7gYmQ=',NULL,0,'Muni','Kumar','M','1994-04-10','2024-07-28',NULL,'9880648496','media/purpose/images.jpg','Indian','Hindu','married','','Driver','Aadhar','media/purpose/kumar-aadhar.jpg','Ration Card','media/purpose/kumar-aadhar_QnOrQPT.jpg','active','2024-07-28 15:28:49.191535','2024-07-28 15:28:49.191569','benefactor',0,1,0,'','',20000.00,20000.00,'0','0','',NULL),(389,'pbkdf2_sha256$720000$tw699SMG1AnkpSCndgMexY$RMJkiUzjib8XGFQ6HpSON7ndPnTC+UJSmE9gvXHA4Ec=',NULL,0,'test_username','test_username2','F',NULL,'2024-08-23',NULL,'9898989898','media/purpose/download_1.jpeg','','','','','','Aadhar','media/purpose/pic_1.jpeg','','','active','2024-08-23 09:01:26.689788','2024-08-23 09:02:10.271339','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL),(390,'pbkdf2_sha256$720000$RH0RFh9P3vyuVYKLUxcZdI$sJi6/cbW3mn67AZ951D6g9B3V4+wWXpdKl9TriQldO8=',NULL,0,'Joseph','Sajan','M',NULL,'2024-10-19',NULL,'9902584268','','Indian','Christianity','married','Engineering','','','','','','active','2024-10-19 08:53:56.755667','2024-10-19 08:53:56.755701','benefactor',0,1,0,'','',0.00,0.00,'4','0','',NULL),(391,'pbkdf2_sha256$720000$UP5DEh0MFDLODR0blDhRUb$aQvmLguILZCLqpWb99r/D+qRmCzz3kh0ISlio2E57GU=',NULL,0,'Gouramma','S.','F',NULL,'2024-10-19',NULL,'9606189952','','Indian','Hindu','widowed','','','','','','','active','2024-10-19 09:08:26.183810','2024-10-19 09:08:26.183843','benefactor',0,1,0,'','',0.00,0.00,'0','0','',NULL);
/*!40000 ALTER TABLE `user_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customuser_groups`
--

DROP TABLE IF EXISTS `user_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_customuser_groups_customuser_id_group_id_e0a2f621_uniq` (`customuser_id`,`group_id`),
  KEY `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_customuser_grou_customuser_id_192632a7_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customuser_groups`
--

LOCK TABLES `user_customuser_groups` WRITE;
/*!40000 ALTER TABLE `user_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customuser_user_permissions`
--

DROP TABLE IF EXISTS `user_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_customuser_user_per_customuser_id_permission_a5da865d_uniq` (`customuser_id`,`permission_id`),
  KEY `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_customuser_user_customuser_id_4552d9cc_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  CONSTRAINT `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customuser_user_permissions`
--

LOCK TABLES `user_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'loancharity'
--

--
-- Dumping routines for database 'loancharity'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 12:11:04
CREATE DATABASE  IF NOT EXISTS `sys` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sys`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 20.197.14.90    Database: sys
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `host_summary`
--

DROP TABLE IF EXISTS `host_summary`;
/*!50001 DROP VIEW IF EXISTS `host_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary` AS SELECT 
 1 AS `host`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_users`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_file_io`
--

DROP TABLE IF EXISTS `host_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_file_io` AS SELECT 
 1 AS `host`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `host_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_file_io_type` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_stages`
--

DROP TABLE IF EXISTS `host_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_stages` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `host_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_statement_latency` AS SELECT 
 1 AS `host`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_statement_type`
--

DROP TABLE IF EXISTS `host_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_statement_type` AS SELECT 
 1 AS `host`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_buffer_stats_by_schema`
--

DROP TABLE IF EXISTS `innodb_buffer_stats_by_schema`;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_buffer_stats_by_schema` AS SELECT 
 1 AS `object_schema`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_buffer_stats_by_table`
--

DROP TABLE IF EXISTS `innodb_buffer_stats_by_table`;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_buffer_stats_by_table` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_lock_waits`
--

DROP TABLE IF EXISTS `innodb_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_lock_waits` AS SELECT 
 1 AS `wait_started`,
 1 AS `wait_age`,
 1 AS `wait_age_secs`,
 1 AS `locked_table`,
 1 AS `locked_table_schema`,
 1 AS `locked_table_name`,
 1 AS `locked_table_partition`,
 1 AS `locked_table_subpartition`,
 1 AS `locked_index`,
 1 AS `locked_type`,
 1 AS `waiting_trx_id`,
 1 AS `waiting_trx_started`,
 1 AS `waiting_trx_age`,
 1 AS `waiting_trx_rows_locked`,
 1 AS `waiting_trx_rows_modified`,
 1 AS `waiting_pid`,
 1 AS `waiting_query`,
 1 AS `waiting_lock_id`,
 1 AS `waiting_lock_mode`,
 1 AS `blocking_trx_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_query`,
 1 AS `blocking_lock_id`,
 1 AS `blocking_lock_mode`,
 1 AS `blocking_trx_started`,
 1 AS `blocking_trx_age`,
 1 AS `blocking_trx_rows_locked`,
 1 AS `blocking_trx_rows_modified`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_by_thread_by_latency`
--

DROP TABLE IF EXISTS `io_by_thread_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_by_thread_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `thread_id`,
 1 AS `processlist_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_file_by_bytes`
--

DROP TABLE IF EXISTS `io_global_by_file_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_file_by_bytes` AS SELECT 
 1 AS `file`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_write`,
 1 AS `total`,
 1 AS `write_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_file_by_latency`
--

DROP TABLE IF EXISTS `io_global_by_file_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_file_by_latency` AS SELECT 
 1 AS `file`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `count_read`,
 1 AS `read_latency`,
 1 AS `count_write`,
 1 AS `write_latency`,
 1 AS `count_misc`,
 1 AS `misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_wait_by_bytes`
--

DROP TABLE IF EXISTS `io_global_by_wait_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_wait_by_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`,
 1 AS `total_requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_wait_by_latency`
--

DROP TABLE IF EXISTS `io_global_by_wait_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_wait_by_latency` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `read_latency`,
 1 AS `write_latency`,
 1 AS `misc_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `latest_file_io`
--

DROP TABLE IF EXISTS `latest_file_io`;
/*!50001 DROP VIEW IF EXISTS `latest_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `latest_file_io` AS SELECT 
 1 AS `thread`,
 1 AS `file`,
 1 AS `latency`,
 1 AS `operation`,
 1 AS `requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_host_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_host_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_host_by_current_bytes` AS SELECT 
 1 AS `host`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_thread_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_thread_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_thread_by_current_bytes` AS SELECT 
 1 AS `thread_id`,
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_user_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_user_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_user_by_current_bytes` AS SELECT 
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_global_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_global_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_global_by_current_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `current_count`,
 1 AS `current_alloc`,
 1 AS `current_avg_alloc`,
 1 AS `high_count`,
 1 AS `high_alloc`,
 1 AS `high_avg_alloc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_global_total`
--

DROP TABLE IF EXISTS `memory_global_total`;
/*!50001 DROP VIEW IF EXISTS `memory_global_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_global_total` AS SELECT 
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!50001 DROP VIEW IF EXISTS `metrics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `metrics` AS SELECT 
 1 AS `Variable_name`,
 1 AS `Variable_value`,
 1 AS `Type`,
 1 AS `Enabled`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `processlist`
--

DROP TABLE IF EXISTS `processlist`;
/*!50001 DROP VIEW IF EXISTS `processlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `processlist` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ps_check_lost_instrumentation`
--

DROP TABLE IF EXISTS `ps_check_lost_instrumentation`;
/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ps_check_lost_instrumentation` AS SELECT 
 1 AS `variable_name`,
 1 AS `variable_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_auto_increment_columns`
--

DROP TABLE IF EXISTS `schema_auto_increment_columns`;
/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_auto_increment_columns` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `column_name`,
 1 AS `data_type`,
 1 AS `column_type`,
 1 AS `is_signed`,
 1 AS `is_unsigned`,
 1 AS `max_value`,
 1 AS `auto_increment`,
 1 AS `auto_increment_ratio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_index_statistics`
--

DROP TABLE IF EXISTS `schema_index_statistics`;
/*!50001 DROP VIEW IF EXISTS `schema_index_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_index_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `rows_selected`,
 1 AS `select_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_object_overview`
--

DROP TABLE IF EXISTS `schema_object_overview`;
/*!50001 DROP VIEW IF EXISTS `schema_object_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_object_overview` AS SELECT 
 1 AS `db`,
 1 AS `object_type`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_redundant_indexes`
--

DROP TABLE IF EXISTS `schema_redundant_indexes`;
/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_redundant_indexes` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `redundant_index_name`,
 1 AS `redundant_index_columns`,
 1 AS `redundant_index_non_unique`,
 1 AS `dominant_index_name`,
 1 AS `dominant_index_columns`,
 1 AS `dominant_index_non_unique`,
 1 AS `subpart_exists`,
 1 AS `sql_drop_index`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_lock_waits`
--

DROP TABLE IF EXISTS `schema_table_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_lock_waits` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `waiting_thread_id`,
 1 AS `waiting_pid`,
 1 AS `waiting_account`,
 1 AS `waiting_lock_type`,
 1 AS `waiting_lock_duration`,
 1 AS `waiting_query`,
 1 AS `waiting_query_secs`,
 1 AS `waiting_query_rows_affected`,
 1 AS `waiting_query_rows_examined`,
 1 AS `blocking_thread_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_account`,
 1 AS `blocking_lock_type`,
 1 AS `blocking_lock_duration`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_statistics`
--

DROP TABLE IF EXISTS `schema_table_statistics`;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `total_latency`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_statistics_with_buffer`
--

DROP TABLE IF EXISTS `schema_table_statistics_with_buffer`;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_statistics_with_buffer` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`,
 1 AS `innodb_buffer_allocated`,
 1 AS `innodb_buffer_data`,
 1 AS `innodb_buffer_free`,
 1 AS `innodb_buffer_pages`,
 1 AS `innodb_buffer_pages_hashed`,
 1 AS `innodb_buffer_pages_old`,
 1 AS `innodb_buffer_rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_tables_with_full_table_scans`
--

DROP TABLE IF EXISTS `schema_tables_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_tables_with_full_table_scans` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `rows_full_scanned`,
 1 AS `latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_unused_indexes`
--

DROP TABLE IF EXISTS `schema_unused_indexes`;
/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_unused_indexes` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `index_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `session`
--

DROP TABLE IF EXISTS `session`;
/*!50001 DROP VIEW IF EXISTS `session`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `session_ssl_status`
--

DROP TABLE IF EXISTS `session_ssl_status`;
/*!50001 DROP VIEW IF EXISTS `session_ssl_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session_ssl_status` AS SELECT 
 1 AS `thread_id`,
 1 AS `ssl_version`,
 1 AS `ssl_cipher`,
 1 AS `ssl_sessions_reused`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statement_analysis`
--

DROP TABLE IF EXISTS `statement_analysis`;
/*!50001 DROP VIEW IF EXISTS `statement_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statement_analysis` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `rows_affected`,
 1 AS `rows_affected_avg`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `rows_sorted`,
 1 AS `sort_merge_passes`,
 1 AS `max_controlled_memory`,
 1 AS `max_total_memory`,
 1 AS `digest`,
 1 AS `first_seen`,
 1 AS `last_seen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_errors_or_warnings`
--

DROP TABLE IF EXISTS `statements_with_errors_or_warnings`;
/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_errors_or_warnings` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `errors`,
 1 AS `error_pct`,
 1 AS `warnings`,
 1 AS `warning_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_full_table_scans`
--

DROP TABLE IF EXISTS `statements_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_full_table_scans` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `no_index_used_count`,
 1 AS `no_good_index_used_count`,
 1 AS `no_index_used_pct`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_runtimes_in_95th_percentile`
--

DROP TABLE IF EXISTS `statements_with_runtimes_in_95th_percentile`;
/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_runtimes_in_95th_percentile` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_sorting`
--

DROP TABLE IF EXISTS `statements_with_sorting`;
/*!50001 DROP VIEW IF EXISTS `statements_with_sorting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_sorting` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `sort_merge_passes`,
 1 AS `avg_sort_merges`,
 1 AS `sorts_using_scans`,
 1 AS `sort_using_range`,
 1 AS `rows_sorted`,
 1 AS `avg_rows_sorted`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_temp_tables`
--

DROP TABLE IF EXISTS `statements_with_temp_tables`;
/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_temp_tables` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `memory_tmp_tables`,
 1 AS `disk_tmp_tables`,
 1 AS `avg_tmp_tables_per_query`,
 1 AS `tmp_tables_to_disk_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `variable` varchar(128) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES ('diagnostics.allow_i_s_tables','OFF','2024-04-16 16:00:01',NULL),('diagnostics.include_raw','OFF','2024-04-16 16:00:01',NULL),('ps_thread_trx_info.max_length','65535','2024-04-16 16:00:01',NULL),('statement_performance_analyzer.limit','100','2024-04-16 16:00:01',NULL),('statement_performance_analyzer.view',NULL,'2024-04-16 16:00:01',NULL),('statement_truncate_len','64','2024-04-16 16:00:01',NULL);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mysql.sys`@`localhost`*/ /*!50003 TRIGGER `sys_config_insert_set_user` BEFORE INSERT ON `sys_config` FOR EACH ROW BEGIN
    IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN
        SET NEW.set_by = USER();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mysql.sys`@`localhost`*/ /*!50003 TRIGGER `sys_config_update_set_user` BEFORE UPDATE ON `sys_config` FOR EACH ROW BEGIN
    IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN
        SET NEW.set_by = USER();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `user_summary`
--

DROP TABLE IF EXISTS `user_summary`;
/*!50001 DROP VIEW IF EXISTS `user_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary` AS SELECT 
 1 AS `user`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_hosts`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_file_io`
--

DROP TABLE IF EXISTS `user_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_file_io` AS SELECT 
 1 AS `user`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `user_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_file_io_type` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_stages`
--

DROP TABLE IF EXISTS `user_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_stages` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `user_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_statement_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_statement_type`
--

DROP TABLE IF EXISTS `user_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_statement_type` AS SELECT 
 1 AS `user`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `version`
--

DROP TABLE IF EXISTS `version`;
/*!50001 DROP VIEW IF EXISTS `version`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `version` AS SELECT 
 1 AS `sys_version`,
 1 AS `mysql_version`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wait_classes_global_by_avg_latency`
--

DROP TABLE IF EXISTS `wait_classes_global_by_avg_latency`;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wait_classes_global_by_avg_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wait_classes_global_by_latency`
--

DROP TABLE IF EXISTS `wait_classes_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wait_classes_global_by_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_by_host_by_latency`
--

DROP TABLE IF EXISTS `waits_by_host_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_by_host_by_latency` AS SELECT 
 1 AS `host`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_by_user_by_latency`
--

DROP TABLE IF EXISTS `waits_by_user_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_by_user_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_global_by_latency`
--

DROP TABLE IF EXISTS `waits_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_global_by_latency` AS SELECT 
 1 AS `events`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary`
--

DROP TABLE IF EXISTS `x$host_summary`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary` AS SELECT 
 1 AS `host`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_users`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_file_io`
--

DROP TABLE IF EXISTS `x$host_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_file_io` AS SELECT 
 1 AS `host`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `x$host_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_file_io_type` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_stages`
--

DROP TABLE IF EXISTS `x$host_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_stages` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `x$host_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_statement_latency` AS SELECT 
 1 AS `host`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_statement_type`
--

DROP TABLE IF EXISTS `x$host_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_statement_type` AS SELECT 
 1 AS `host`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_buffer_stats_by_schema`
--

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_schema`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_buffer_stats_by_schema` AS SELECT 
 1 AS `object_schema`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_buffer_stats_by_table`
--

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_table`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_buffer_stats_by_table` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_lock_waits`
--

DROP TABLE IF EXISTS `x$innodb_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_lock_waits` AS SELECT 
 1 AS `wait_started`,
 1 AS `wait_age`,
 1 AS `wait_age_secs`,
 1 AS `locked_table`,
 1 AS `locked_table_schema`,
 1 AS `locked_table_name`,
 1 AS `locked_table_partition`,
 1 AS `locked_table_subpartition`,
 1 AS `locked_index`,
 1 AS `locked_type`,
 1 AS `waiting_trx_id`,
 1 AS `waiting_trx_started`,
 1 AS `waiting_trx_age`,
 1 AS `waiting_trx_rows_locked`,
 1 AS `waiting_trx_rows_modified`,
 1 AS `waiting_pid`,
 1 AS `waiting_query`,
 1 AS `waiting_lock_id`,
 1 AS `waiting_lock_mode`,
 1 AS `blocking_trx_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_query`,
 1 AS `blocking_lock_id`,
 1 AS `blocking_lock_mode`,
 1 AS `blocking_trx_started`,
 1 AS `blocking_trx_age`,
 1 AS `blocking_trx_rows_locked`,
 1 AS `blocking_trx_rows_modified`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_by_thread_by_latency`
--

DROP TABLE IF EXISTS `x$io_by_thread_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_by_thread_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `thread_id`,
 1 AS `processlist_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_file_by_bytes`
--

DROP TABLE IF EXISTS `x$io_global_by_file_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_file_by_bytes` AS SELECT 
 1 AS `file`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_write`,
 1 AS `total`,
 1 AS `write_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_file_by_latency`
--

DROP TABLE IF EXISTS `x$io_global_by_file_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_file_by_latency` AS SELECT 
 1 AS `file`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `count_read`,
 1 AS `read_latency`,
 1 AS `count_write`,
 1 AS `write_latency`,
 1 AS `count_misc`,
 1 AS `misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_wait_by_bytes`
--

DROP TABLE IF EXISTS `x$io_global_by_wait_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_wait_by_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`,
 1 AS `total_requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_wait_by_latency`
--

DROP TABLE IF EXISTS `x$io_global_by_wait_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_wait_by_latency` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `read_latency`,
 1 AS `write_latency`,
 1 AS `misc_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$latest_file_io`
--

DROP TABLE IF EXISTS `x$latest_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$latest_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$latest_file_io` AS SELECT 
 1 AS `thread`,
 1 AS `file`,
 1 AS `latency`,
 1 AS `operation`,
 1 AS `requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_host_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_host_by_current_bytes` AS SELECT 
 1 AS `host`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_thread_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_thread_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_thread_by_current_bytes` AS SELECT 
 1 AS `thread_id`,
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_user_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_user_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_user_by_current_bytes` AS SELECT 
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_global_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_global_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_global_by_current_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `current_count`,
 1 AS `current_alloc`,
 1 AS `current_avg_alloc`,
 1 AS `high_count`,
 1 AS `high_alloc`,
 1 AS `high_avg_alloc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_global_total`
--

DROP TABLE IF EXISTS `x$memory_global_total`;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_global_total` AS SELECT 
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$processlist`
--

DROP TABLE IF EXISTS `x$processlist`;
/*!50001 DROP VIEW IF EXISTS `x$processlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$processlist` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_digest_95th_percentile_by_avg_us`
--

DROP TABLE IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_digest_95th_percentile_by_avg_us` AS SELECT 
 1 AS `avg_us`,
 1 AS `percentile`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_digest_avg_latency_distribution`
--

DROP TABLE IF EXISTS `x$ps_digest_avg_latency_distribution`;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_digest_avg_latency_distribution` AS SELECT 
 1 AS `cnt`,
 1 AS `avg_us`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_schema_table_statistics_io`
--

DROP TABLE IF EXISTS `x$ps_schema_table_statistics_io`;
/*!50001 DROP VIEW IF EXISTS `x$ps_schema_table_statistics_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_schema_table_statistics_io` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `count_read`,
 1 AS `sum_number_of_bytes_read`,
 1 AS `sum_timer_read`,
 1 AS `count_write`,
 1 AS `sum_number_of_bytes_write`,
 1 AS `sum_timer_write`,
 1 AS `count_misc`,
 1 AS `sum_timer_misc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_flattened_keys`
--

DROP TABLE IF EXISTS `x$schema_flattened_keys`;
/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_flattened_keys` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `non_unique`,
 1 AS `subpart_exists`,
 1 AS `index_columns`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_index_statistics`
--

DROP TABLE IF EXISTS `x$schema_index_statistics`;
/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_index_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `rows_selected`,
 1 AS `select_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_lock_waits`
--

DROP TABLE IF EXISTS `x$schema_table_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_lock_waits` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `waiting_thread_id`,
 1 AS `waiting_pid`,
 1 AS `waiting_account`,
 1 AS `waiting_lock_type`,
 1 AS `waiting_lock_duration`,
 1 AS `waiting_query`,
 1 AS `waiting_query_secs`,
 1 AS `waiting_query_rows_affected`,
 1 AS `waiting_query_rows_examined`,
 1 AS `blocking_thread_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_account`,
 1 AS `blocking_lock_type`,
 1 AS `blocking_lock_duration`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_statistics`
--

DROP TABLE IF EXISTS `x$schema_table_statistics`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `total_latency`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_statistics_with_buffer`
--

DROP TABLE IF EXISTS `x$schema_table_statistics_with_buffer`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_statistics_with_buffer` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`,
 1 AS `innodb_buffer_allocated`,
 1 AS `innodb_buffer_data`,
 1 AS `innodb_buffer_free`,
 1 AS `innodb_buffer_pages`,
 1 AS `innodb_buffer_pages_hashed`,
 1 AS `innodb_buffer_pages_old`,
 1 AS `innodb_buffer_rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_tables_with_full_table_scans`
--

DROP TABLE IF EXISTS `x$schema_tables_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_tables_with_full_table_scans` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `rows_full_scanned`,
 1 AS `latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$session`
--

DROP TABLE IF EXISTS `x$session`;
/*!50001 DROP VIEW IF EXISTS `x$session`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$session` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statement_analysis`
--

DROP TABLE IF EXISTS `x$statement_analysis`;
/*!50001 DROP VIEW IF EXISTS `x$statement_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statement_analysis` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `exec_secondary_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `rows_affected`,
 1 AS `rows_affected_avg`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `rows_sorted`,
 1 AS `sort_merge_passes`,
 1 AS `max_controlled_memory`,
 1 AS `max_total_memory`,
 1 AS `digest`,
 1 AS `first_seen`,
 1 AS `last_seen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_errors_or_warnings`
--

DROP TABLE IF EXISTS `x$statements_with_errors_or_warnings`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_errors_or_warnings` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `errors`,
 1 AS `error_pct`,
 1 AS `warnings`,
 1 AS `warning_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_full_table_scans`
--

DROP TABLE IF EXISTS `x$statements_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_full_table_scans` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `no_index_used_count`,
 1 AS `no_good_index_used_count`,
 1 AS `no_index_used_pct`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_runtimes_in_95th_percentile`
--

DROP TABLE IF EXISTS `x$statements_with_runtimes_in_95th_percentile`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_runtimes_in_95th_percentile` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_sorting`
--

DROP TABLE IF EXISTS `x$statements_with_sorting`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_sorting` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `sort_merge_passes`,
 1 AS `avg_sort_merges`,
 1 AS `sorts_using_scans`,
 1 AS `sort_using_range`,
 1 AS `rows_sorted`,
 1 AS `avg_rows_sorted`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_temp_tables`
--

DROP TABLE IF EXISTS `x$statements_with_temp_tables`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_temp_tables` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `memory_tmp_tables`,
 1 AS `disk_tmp_tables`,
 1 AS `avg_tmp_tables_per_query`,
 1 AS `tmp_tables_to_disk_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary`
--

DROP TABLE IF EXISTS `x$user_summary`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary` AS SELECT 
 1 AS `user`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_hosts`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_file_io`
--

DROP TABLE IF EXISTS `x$user_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_file_io` AS SELECT 
 1 AS `user`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `x$user_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_file_io_type` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_stages`
--

DROP TABLE IF EXISTS `x$user_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_stages` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `x$user_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_statement_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_statement_type`
--

DROP TABLE IF EXISTS `x$user_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_statement_type` AS SELECT 
 1 AS `user`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$wait_classes_global_by_avg_latency`
--

DROP TABLE IF EXISTS `x$wait_classes_global_by_avg_latency`;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$wait_classes_global_by_avg_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$wait_classes_global_by_latency`
--

DROP TABLE IF EXISTS `x$wait_classes_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$wait_classes_global_by_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_by_host_by_latency`
--

DROP TABLE IF EXISTS `x$waits_by_host_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_by_host_by_latency` AS SELECT 
 1 AS `host`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_by_user_by_latency`
--

DROP TABLE IF EXISTS `x$waits_by_user_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_by_user_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_global_by_latency`
--

DROP TABLE IF EXISTS `x$waits_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_global_by_latency` AS SELECT 
 1 AS `events`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sys'
--

--
-- Dumping routines for database 'sys'
--
/*!50003 DROP FUNCTION IF EXISTS `extract_schema_from_file_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `extract_schema_from_file_name`(
        path VARCHAR(512)
    ) RETURNS varchar(64) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw file path, and attempts to extract the schema name from it.\n\nUseful for when interacting with Performance Schema data \nconcerning IO statistics, for example.\n\nCurrently relies on the fact that a table data file will be within a \nspecified database directory (will not work with partitions or tables\nthat specify an individual DATA_DIRECTORY).\n\nParameters\n-----------\n\npath (VARCHAR(512)):\n  The full file path to a data file to extract the schema name from.\n\nReturns\n-----------\n\nVARCHAR(64)\n\nExample\n-----------\n\nmysql> SELECT sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'');\n+----------------------------------------------------------------------------+\n| sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'') |\n+----------------------------------------------------------------------------+\n| employees                                                                  |\n+----------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN LEFT(SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(path, '\\', '/'), '/', -2), '/', 1), 64);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `extract_table_from_file_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `extract_table_from_file_name`(
        path VARCHAR(512)
    ) RETURNS varchar(64) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw file path, and extracts the table name from it.\n\nUseful for when interacting with Performance Schema data \nconcerning IO statistics, for example.\n\nParameters\n-----------\n\npath (VARCHAR(512)):\n  The full file path to a data file to extract the table name from.\n\nReturns\n-----------\n\nVARCHAR(64)\n\nExample\n-----------\n\nmysql> SELECT sys.extract_table_from_file_name(''/var/lib/mysql/employees/employee.ibd'');\n+---------------------------------------------------------------------------+\n| sys.extract_table_from_file_name(''/var/lib/mysql/employees/employee.ibd'') |\n+---------------------------------------------------------------------------+\n| employee                                                                  |\n+---------------------------------------------------------------------------+\n1 row in set (0.02 sec)\n'
BEGIN
    RETURN LEFT(SUBSTRING_INDEX(REPLACE(SUBSTRING_INDEX(REPLACE(path, '\\', '/'), '/', -1), '@0024', '$'), '.', 1), 64);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_bytes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_bytes`(
        -- We feed in and return TEXT here, as aggregates of
        -- bytes can return numbers larger than BIGINT UNSIGNED
        bytes TEXT
    ) RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw bytes value, and converts it to a human readable format.\n\nParameters\n-----------\n\nbytes (TEXT):\n  A raw bytes value.\n\nReturns\n-----------\n\nTEXT\n\nExample\n-----------\n\nmysql> SELECT sys.format_bytes(2348723492723746) AS size;\n+----------+\n| size     |\n+----------+\n| 2.09 PiB |\n+----------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.format_bytes(2348723492723) AS size;\n+----------+\n| size     |\n+----------+\n| 2.14 TiB |\n+----------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.format_bytes(23487234) AS size;\n+-----------+\n| size      |\n+-----------+\n| 22.40 MiB |\n+-----------+\n1 row in set (0.00 sec)\n'
BEGIN
  IF (bytes IS NULL) THEN
    RETURN NULL;
  ELSE
    RETURN format_bytes(bytes);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_path` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_path`(
        in_path VARCHAR(512)
    ) RETURNS varchar(512) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw path value, and strips out the datadir or tmpdir\nreplacing with @@datadir and @@tmpdir respectively.\n\nAlso normalizes the paths across operating systems, so backslashes\non Windows are converted to forward slashes\n\nParameters\n-----------\n\npath (VARCHAR(512)):\n  The raw file path value to format.\n\nReturns\n-----------\n\nVARCHAR(512) CHARSET UTF8MB4\n\nExample\n-----------\n\nmysql> select @@datadir;\n+-----------------------------------------------+\n| @@datadir                                     |\n+-----------------------------------------------+\n| /Users/mark/sandboxes/SmallTree/AMaster/data/ |\n+-----------------------------------------------+\n1 row in set (0.06 sec)\n\nmysql> select format_path(''/Users/mark/sandboxes/SmallTree/AMaster/data/mysql/proc.MYD'') AS path;\n+--------------------------+\n| path                     |\n+--------------------------+\n| @@datadir/mysql/proc.MYD |\n+--------------------------+\n1 row in set (0.03 sec)\n'
BEGIN
  DECLARE v_path VARCHAR(512);
  DECLARE v_undo_dir VARCHAR(1024);
  DECLARE path_separator CHAR(1) DEFAULT '/';
  IF @@global.version_compile_os LIKE 'win%' THEN
    SET path_separator = '\\';
  END IF;
  -- OSX hides /private/ in variables, but Performance Schema does not
  IF in_path LIKE '/private/%' THEN
    SET v_path = REPLACE(in_path, '/private', '');
  ELSE
    SET v_path = in_path;
  END IF;
  -- @@global.innodb_undo_directory is only set when separate undo logs are used
  SET v_undo_dir = IFNULL((SELECT VARIABLE_VALUE FROM performance_schema.global_variables WHERE VARIABLE_NAME = 'innodb_undo_directory'), '');
  IF v_path IS NULL THEN
    RETURN NULL;
  ELSEIF v_path LIKE CONCAT(@@global.datadir, IF(SUBSTRING(@@global.datadir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.datadir, CONCAT('@@datadir', IF(SUBSTRING(@@global.datadir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.tmpdir, IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.tmpdir, CONCAT('@@tmpdir', IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.replica_load_tmpdir, IF(SUBSTRING(@@global.replica_load_tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.replica_load_tmpdir, CONCAT('@@replica_load_tmpdir', IF(SUBSTRING(@@global.replica_load_tmpdir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.innodb_data_home_dir, IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.innodb_data_home_dir, CONCAT('@@innodb_data_home_dir', IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.innodb_log_group_home_dir, IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.innodb_log_group_home_dir, CONCAT('@@innodb_log_group_home_dir', IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(v_undo_dir, IF(SUBSTRING(v_undo_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, v_undo_dir, CONCAT('@@innodb_undo_directory', IF(SUBSTRING(v_undo_dir, -1) = path_separator, path_separator, '')));
  ELSEIF v_path LIKE CONCAT(@@global.basedir, IF(SUBSTRING(@@global.basedir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN
    SET v_path = REPLACE(v_path, @@global.basedir, CONCAT('@@basedir', IF(SUBSTRING(@@global.basedir, -1) = path_separator, path_separator, '')));
  END IF;
  RETURN v_path;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_statement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_statement`(
        statement LONGTEXT
    ) RETURNS longtext CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nFormats a normalized statement, truncating it if it is > 64 characters long by default.\n\nTo configure the length to truncate the statement to by default, update the `statement_truncate_len`\nvariable with `sys_config` table to a different value. Alternatively, to change it just for just \nyour particular session, use `SET @sys.statement_truncate_len := <some new value>`.\n\nUseful for printing statement related data from Performance Schema from \nthe command line.\n\nParameters\n-----------\n\nstatement (LONGTEXT): \n  The statement to format.\n\nReturns\n-----------\n\nLONGTEXT\n\nExample\n-----------\n\nmysql> SELECT sys.format_statement(digest_text)\n    ->   FROM performance_schema.events_statements_summary_by_digest\n    ->  ORDER by sum_timer_wait DESC limit 5;\n+-------------------------------------------------------------------+\n| sys.format_statement(digest_text)                                 |\n+-------------------------------------------------------------------+\n| CREATE SQL SECURITY INVOKER VI ... KE ? AND `variable_value` > ?  |\n| CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `esc` . ... |\n| CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `sys` . ... |\n| CREATE SQL SECURITY INVOKER VI ...  , `compressed_size` ) ) DESC  |\n| CREATE SQL SECURITY INVOKER VI ... LIKE ? ORDER BY `timer_start`  |\n+-------------------------------------------------------------------+\n5 rows in set (0.00 sec)\n'
BEGIN
  -- Check if we have the configured length, if not, init it
  IF @sys.statement_truncate_len IS NULL THEN
      SET @sys.statement_truncate_len = sys_get_config('statement_truncate_len', 64);
  END IF;
  IF CHAR_LENGTH(statement) > @sys.statement_truncate_len THEN
      RETURN REPLACE(CONCAT(LEFT(statement, (@sys.statement_truncate_len/2)-2), ' ... ', RIGHT(statement, (@sys.statement_truncate_len/2)-2)), '\n', ' ');
  ELSE 
      RETURN REPLACE(statement, '\n', ' ');
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `format_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_time`(
-- We feed in and return TEXT here, as aggregates of
-- picoseconds can return numbers larger than BIGINT UNSIGNED
        picoseconds TEXT
    ) RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a raw picoseconds value, and converts it to a human readable form.\n\nPicoseconds are the precision that all latency values are printed in\nwithin Performance Schema, however are not user friendly when wanting\nto scan output from the command line.\n\nParameters\n-----------\n\npicoseconds (TEXT):\n  The raw picoseconds value to convert.\n\nReturns\n-----------\n\nTEXT CHARSET UTF8MB4\n\nExample\n-----------\n\nmysql> select format_time(342342342342345);\n+------------------------------+\n| format_time(342342342342345) |\n+------------------------------+\n| 00:05:42                     |\n+------------------------------+\n1 row in set (0.00 sec)\n\nmysql> select format_time(342342342);\n+------------------------+\n| format_time(342342342) |\n+------------------------+\n| 342.34 us              |\n+------------------------+\n1 row in set (0.00 sec)\n\nmysql> select format_time(34234);\n+--------------------+\n| format_time(34234) |\n+--------------------+\n| 34.23 ns           |\n+--------------------+\n1 row in set (0.00 sec)\n'
BEGIN
  IF picoseconds IS NULL THEN RETURN NULL;
  ELSEIF picoseconds >= 604800000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 604800000000000000, 2), ' w');
  ELSEIF picoseconds >= 86400000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 86400000000000000, 2), ' d');
  ELSEIF picoseconds >= 3600000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 3600000000000000, 2), ' h');
  ELSEIF picoseconds >= 60000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 60000000000000, 2), ' m');
  ELSEIF picoseconds >= 1000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000000000, 2), ' s');
  ELSEIF picoseconds >= 1000000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000000, 2), ' ms');
  ELSEIF picoseconds >= 1000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000, 2), ' us');
  ELSEIF picoseconds >= 1000 THEN RETURN CONCAT(ROUND(picoseconds / 1000, 2), ' ns');
  ELSE RETURN CONCAT(picoseconds, ' ps');
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `list_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `list_add`(
        in_list TEXT,
        in_add_value TEXT
    ) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a list, and a value to add to the list, and returns the resulting list.\n\nUseful for altering certain session variables, like sql_mode or optimizer_switch for instance.\n\nParameters\n-----------\n\nin_list (TEXT):\n  The comma separated list to add a value to\n\nin_add_value (TEXT):\n  The value to add to the input list\n\nReturns\n-----------\n\nTEXT\n\nExample\n--------\n\nmysql> select @@sql_mode;\n+-----------------------------------------------------------------------------------+\n| @@sql_mode                                                                        |\n+-----------------------------------------------------------------------------------+\n| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+-----------------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> set sql_mode = sys.list_add(@@sql_mode, ''ANSI_QUOTES'');\nQuery OK, 0 rows affected (0.06 sec)\n\nmysql> select @@sql_mode;\n+-----------------------------------------------------------------------------------------------+\n| @@sql_mode                                                                                    |\n+-----------------------------------------------------------------------------------------------+\n| ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+-----------------------------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\n'
BEGIN
    IF (in_add_value IS NULL) THEN
        SIGNAL SQLSTATE '02200'
           SET MESSAGE_TEXT = 'Function sys.list_add: in_add_value input variable should not be NULL',
               MYSQL_ERRNO = 1138;
    END IF;
    IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN
        -- return the new value as a single value list
        RETURN in_add_value;
    END IF;
    RETURN (SELECT CONCAT(TRIM(BOTH ',' FROM TRIM(in_list)), ',', in_add_value));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `list_drop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `list_drop`(
        in_list TEXT,
        in_drop_value TEXT
    ) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a list, and a value to attempt to remove from the list, and returns the resulting list.\n\nUseful for altering certain session variables, like sql_mode or optimizer_switch for instance.\n\nParameters\n-----------\n\nin_list (TEXT):\n  The comma separated list to drop a value from\n\nin_drop_value (TEXT):\n  The value to drop from the input list\n\nReturns\n-----------\n\nTEXT\n\nExample\n--------\n\nmysql> select @@sql_mode;\n+-----------------------------------------------------------------------------------------------+\n| @@sql_mode                                                                                    |\n+-----------------------------------------------------------------------------------------------+\n| ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+-----------------------------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> set sql_mode = sys.list_drop(@@sql_mode, ''ONLY_FULL_GROUP_BY'');\nQuery OK, 0 rows affected (0.03 sec)\n\nmysql> select @@sql_mode;\n+----------------------------------------------------------------------------+\n| @@sql_mode                                                                 |\n+----------------------------------------------------------------------------+\n| ANSI_QUOTES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n+----------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\n'
BEGIN
    IF (in_drop_value IS NULL) THEN
        SIGNAL SQLSTATE '02200'
           SET MESSAGE_TEXT = 'Function sys.list_drop: in_drop_value input variable should not be NULL',
               MYSQL_ERRNO = 1138;
    END IF;
    IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN
        -- return the list as it was passed in
        RETURN in_list;
    END IF;
    -- ensure that leading / trailing commas are remove, support values with either spaces or not between commas
    RETURN (SELECT TRIM(BOTH ',' FROM REPLACE(REPLACE(CONCAT(',', in_list), CONCAT(',', in_drop_value), ''), CONCAT(', ', in_drop_value), '')));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_account_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_account_enabled`(
        in_host VARCHAR(255), 
        in_user VARCHAR(32)
    ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDetermines whether instrumentation of an account is enabled \nwithin Performance Schema.\n\nParameters\n-----------\n\nin_host VARCHAR(255): \n  The hostname of the account to check.\nin_user VARCHAR(32):\n  The username of the account to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'', ''PARTIAL'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_account_enabled(''localhost'', ''root'');\n+------------------------------------------------+\n| sys.ps_is_account_enabled(''localhost'', ''root'') |\n+------------------------------------------------+\n| YES                                            |\n+------------------------------------------------+\n1 row in set (0.01 sec)\n'
BEGIN
    RETURN IF(EXISTS(SELECT 1
                       FROM performance_schema.setup_actors
                      WHERE (`HOST` = '%' OR in_host LIKE `HOST`)
                        AND (`USER` = '%' OR `USER` = in_user)
                        AND (`ENABLED` = 'YES')
                    ),
              'YES', 'NO'
           );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_consumer_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_consumer_enabled`(
        in_consumer varchar(64)
   ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDetermines whether a consumer is enabled (taking the consumer hierarchy into consideration)\nwithin the Performance Schema.\n\nAn exception with errno 3047 is thrown if an unknown consumer name is passed to the function.\nA consumer name of NULL returns NULL.\n\nParameters\n-----------\n\nin_consumer VARCHAR(64): \n  The name of the consumer to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_consumer_enabled(''events_stages_history'');\n+-----------------------------------------------------+\n| sys.ps_is_consumer_enabled(''events_stages_history'') |\n+-----------------------------------------------------+\n| NO                                                  |\n+-----------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_is_enabled ENUM('YES', 'NO') DEFAULT NULL;
    DECLARE v_error_msg VARCHAR(128);
    -- Return NULL for a NULL argument.
    IF (in_consumer IS NULL) THEN
        RETURN NULL;
    END IF;
    SET v_is_enabled = (
        SELECT (CASE
                   WHEN c.NAME = 'global_instrumentation' THEN c.ENABLED
                   WHEN c.NAME = 'thread_instrumentation' THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   WHEN c.NAME LIKE '%\_digest'           THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   WHEN c.NAME LIKE '%\_current'          THEN IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO')
                   ELSE IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES'
                           AND ( SELECT cc.ENABLED FROM performance_schema.setup_consumers cc WHERE NAME = CONCAT(SUBSTRING_INDEX(c.NAME, '_', 2), '_current')
                               ) = 'YES', 'YES', 'NO')
                END) AS IsEnabled
          FROM performance_schema.setup_consumers c
               INNER JOIN performance_schema.setup_consumers cg
               INNER JOIN performance_schema.setup_consumers ct
         WHERE cg.NAME       = 'global_instrumentation'
               AND ct.NAME   = 'thread_instrumentation'
               AND c.NAME    = in_consumer
        );
    IF (v_is_enabled IS NOT NULL) THEN
        RETURN v_is_enabled;
    ELSE
        -- A value of NULL here means it is an unknown consumer name that was passed as an argument.
        -- Only an input value of NULL is allowed to return a NULL result value, to throw a signal instead.
        SET v_error_msg = CONCAT('Invalid argument error: ', in_consumer, ' in function sys.ps_is_consumer_enabled.');
        SIGNAL SQLSTATE 'HY000'
           SET MESSAGE_TEXT = v_error_msg,
               MYSQL_ERRNO  = 3047;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_instrument_default_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_instrument_default_enabled`(
        in_instrument VARCHAR(128)
    ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns whether an instrument is enabled by default in this version of MySQL.\n\nParameters\n-----------\n\nin_instrument VARCHAR(128): \n  The instrument to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_instrument_default_enabled(''statement/sql/select'');\n+--------------------------------------------------------------+\n| sys.ps_is_instrument_default_enabled(''statement/sql/select'') |\n+--------------------------------------------------------------+\n| YES                                                          |\n+--------------------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_enabled ENUM('YES', 'NO');
    IF (in_instrument LIKE 'stage/%') THEN
    BEGIN
      /* Stages are enabled by default if the progress property is set. */
      SET v_enabled = (SELECT
                        IF(find_in_set("progress", PROPERTIES) != 0, 'YES', 'NO')
                        FROM performance_schema.setup_instruments
                        WHERE NAME = in_instrument);
      SET v_enabled = IFNULL(v_enabled, 'NO');
    END;
    ELSE
      SET v_enabled = IF(in_instrument LIKE 'wait/synch/%'
                         OR in_instrument LIKE 'wait/io/socket/%'
                        ,
                         'NO',
                         'YES'
                      );
    END IF;
    RETURN v_enabled;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_instrument_default_timed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_instrument_default_timed`(
        in_instrument VARCHAR(128)
    ) RETURNS enum('YES','NO') CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns whether an instrument is timed by default in this version of MySQL.\n\nParameters\n-----------\n\nin_instrument VARCHAR(128): \n  The instrument to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_instrument_default_timed(''statement/sql/select'');\n+------------------------------------------------------------+\n| sys.ps_is_instrument_default_timed(''statement/sql/select'') |\n+------------------------------------------------------------+\n| YES                                                        |\n+------------------------------------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_timed ENUM('YES', 'NO');
    IF (in_instrument LIKE 'stage/%') THEN
    BEGIN
      -- Stages are timed by default if the progress property is set.
      SET v_timed = (SELECT
                      IF(find_in_set("progress", PROPERTIES) != 0, 'YES', 'NO')
                      FROM performance_schema.setup_instruments
                      WHERE NAME = in_instrument);
      SET v_timed = IFNULL(v_timed, 'NO');
    END;
    ELSE
      -- Mutex, rwlock, prlock, sxlock, cond are not timed by default
      -- Memory instruments are never timed.
      SET v_timed = IF(in_instrument LIKE 'wait/synch/%'
                       OR in_instrument LIKE 'memory/%'
                      ,
                       'NO',
                       'YES'
                    );
    END IF;
    RETURN v_timed;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_is_thread_instrumented` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_thread_instrumented`(
        in_connection_id BIGINT UNSIGNED
    ) RETURNS enum('YES','NO','UNKNOWN') CHARSET utf8mb4
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nChecks whether the provided connection id is instrumented within Performance Schema.\n\nParameters\n-----------\n\nin_connection_id (BIGINT UNSIGNED):\n  The id of the connection to check.\n\nReturns\n-----------\n\nENUM(''YES'', ''NO'', ''UNKNOWN'')\n\nExample\n-----------\n\nmysql> SELECT sys.ps_is_thread_instrumented(CONNECTION_ID());\n+------------------------------------------------+\n| sys.ps_is_thread_instrumented(CONNECTION_ID()) |\n+------------------------------------------------+\n| YES                                            |\n+------------------------------------------------+\n'
BEGIN
    DECLARE v_enabled ENUM('YES', 'NO', 'UNKNOWN');
    IF (in_connection_id IS NULL) THEN
        RETURN NULL;
    END IF;
    SELECT INSTRUMENTED INTO v_enabled
      FROM performance_schema.threads 
     WHERE PROCESSLIST_ID = in_connection_id;
    IF (v_enabled IS NULL) THEN
        RETURN 'UNKNOWN';
    ELSE
        RETURN v_enabled;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_account`(
        in_thread_id BIGINT UNSIGNED
    ) RETURNS text CHARSET utf8mb4
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturn the user@host account for the given Performance Schema thread id.\n\nParameters\n-----------\n\nin_thread_id (BIGINT UNSIGNED):\n  The id of the thread to return the account for.\n\nExample\n-----------\n\nmysql> select thread_id, processlist_user, processlist_host from performance_schema.threads where type = ''foreground'';\n+-----------+------------------+------------------+\n| thread_id | processlist_user | processlist_host |\n+-----------+------------------+------------------+\n|        23 | NULL             | NULL             |\n|        30 | root             | localhost        |\n|        31 | msandbox         | localhost        |\n|        32 | msandbox         | localhost        |\n+-----------+------------------+------------------+\n4 rows in set (0.00 sec)\n\nmysql> select sys.ps_thread_account(31);\n+---------------------------+\n| sys.ps_thread_account(31) |\n+---------------------------+\n| msandbox@localhost        |\n+---------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN (SELECT IF(
                      type = 'FOREGROUND',
                      CONCAT(processlist_user, '@', processlist_host),
                      type
                     ) AS account
              FROM `performance_schema`.`threads`
             WHERE thread_id = in_thread_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_id`(
        in_connection_id BIGINT UNSIGNED
    ) RETURNS bigint unsigned
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturn the Performance Schema THREAD_ID for the specified connection ID.\n\nParameters\n-----------\n\nin_connection_id (BIGINT UNSIGNED):\n  The id of the connection to return the thread id for. If NULL, the current\n  connection thread id is returned.\n\nExample\n-----------\n\nmysql> SELECT sys.ps_thread_id(79);\n+----------------------+\n| sys.ps_thread_id(79) |\n+----------------------+\n|                   98 |\n+----------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.ps_thread_id(CONNECTION_ID());\n+-----------------------------------+\n| sys.ps_thread_id(CONNECTION_ID()) |\n+-----------------------------------+\n|                                98 |\n+-----------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
  IF (in_connection_id IS NULL) THEN
    RETURN ps_current_thread_id();
  ELSE
    RETURN ps_thread_id(in_connection_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_stack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_stack`(
        thd_id BIGINT UNSIGNED,
        debug BOOLEAN
    ) RETURNS longtext CHARSET latin1
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nOutputs a JSON formatted stack of all statements, stages and events\nwithin Performance Schema for the specified thread.\n\nParameters\n-----------\n\nthd_id (BIGINT UNSIGNED):\n  The id of the thread to trace. This should match the thread_id\n  column from the performance_schema.threads table.\nin_verbose (BOOLEAN):\n  Include file:lineno information in the events.\n\nExample\n-----------\n\n(line separation added for output)\n\nmysql> SELECT sys.ps_thread_stack(37, FALSE) AS thread_stack\\G\n*************************** 1. row ***************************\nthread_stack: {"rankdir": "LR","nodesep": "0.10","stack_created": "2014-02-19 13:39:03",\n"mysql_version": "5.7.3-m13","mysql_user": "root@localhost","events": \n[{"nesting_event_id": "0", "event_id": "10", "timer_wait": 256.35, "event_info": \n"sql/select", "wait_info": "select @@version_comment limit 1\\nerrors: 0\\nwarnings: 0\\nlock time:\n...\n'
BEGIN
    DECLARE json_objects LONGTEXT;
    -- Do not track the current thread, it will kill the stack
    UPDATE performance_schema.threads
       SET instrumented = 'NO'
     WHERE processlist_id = CONNECTION_ID();
    SET SESSION group_concat_max_len=@@global.max_allowed_packet;
    -- Select the entire stack of events
    SELECT GROUP_CONCAT(CONCAT( '{'
              , CONCAT_WS( ', '
              , CONCAT('"nesting_event_id": "', IF(nesting_event_id IS NULL, '0', nesting_event_id), '"')
              , CONCAT('"event_id": "', event_id, '"')
              -- Convert from picoseconds to microseconds
              , CONCAT( '"timer_wait": ', ROUND(timer_wait/1000000, 2))  
              , CONCAT( '"event_info": "'
                  , CASE
                        WHEN event_name NOT LIKE 'wait/io%' THEN REPLACE(SUBSTRING_INDEX(event_name, '/', -2), '\\', '\\\\')
                        WHEN event_name NOT LIKE 'wait/io/file%' OR event_name NOT LIKE 'wait/io/socket%' THEN REPLACE(SUBSTRING_INDEX(event_name, '/', -4), '\\', '\\\\')
                        ELSE event_name
                    END
                  , '"'
              )
              -- Always dump the extra wait information gathered for statements
              , CONCAT( '"wait_info": "', IFNULL(wait_info, ''), '"')
              -- If debug is enabled, add the file:lineno information for waits
              , CONCAT( '"source": "', IF(true AND event_name LIKE 'wait%', IFNULL(wait_info, ''), ''), '"')
              -- Depending on the type of event, name it appropriately
              , CASE 
                     WHEN event_name LIKE 'wait/io/file%'      THEN '"event_type": "io/file"'
                     WHEN event_name LIKE 'wait/io/table%'     THEN '"event_type": "io/table"'
                     WHEN event_name LIKE 'wait/io/socket%'    THEN '"event_type": "io/socket"'
                     WHEN event_name LIKE 'wait/synch/mutex%'  THEN '"event_type": "synch/mutex"'
                     WHEN event_name LIKE 'wait/synch/cond%'   THEN '"event_type": "synch/cond"'
                     WHEN event_name LIKE 'wait/synch/rwlock%' THEN '"event_type": "synch/rwlock"'
                     WHEN event_name LIKE 'wait/lock%'         THEN '"event_type": "lock"'
                     WHEN event_name LIKE 'statement/%'        THEN '"event_type": "stmt"'
                     WHEN event_name LIKE 'stage/%'            THEN '"event_type": "stage"'
                     WHEN event_name LIKE '%idle%'             THEN '"event_type": "idle"'
                     ELSE '' 
                END                   
            )
            , '}'
          )
          ORDER BY event_id ASC SEPARATOR ',') event
    INTO json_objects
    FROM (
          -- Select all statements, with the extra tracing information available
          (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, 
                  CONCAT(sql_text, '\\n',
                         'errors: ', errors, '\\n',
                         'warnings: ', warnings, '\\n',
                         'lock time: ', ROUND(lock_time/1000000, 2),'us\\n',
                         'rows affected: ', rows_affected, '\\n',
                         'rows sent: ', rows_sent, '\\n',
                         'rows examined: ', rows_examined, '\\n',
                         'tmp tables: ', created_tmp_tables, '\\n',
                         'tmp disk tables: ', created_tmp_disk_tables, '\\n',
                         'select scan: ', select_scan, '\\n',
                         'select full join: ', select_full_join, '\\n',
                         'select full range join: ', select_full_range_join, '\\n',
                         'select range: ', select_range, '\\n',
                         'select range check: ', select_range_check, '\\n', 
                         'sort merge passes: ', sort_merge_passes, '\\n',
                         'sort rows: ', sort_rows, '\\n',
                         'sort range: ', sort_range, '\\n',
                         'sort scan: ', sort_scan, '\\n',
                         'no index used: ', IF(no_index_used, 'TRUE', 'FALSE'), '\\n',
                         'no good index used: ', IF(no_good_index_used, 'TRUE', 'FALSE'), '\\n'
                         ) AS wait_info
             FROM performance_schema.events_statements_history_long WHERE thread_id = thd_id)
          UNION 
          -- Select all stages
          (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, null AS wait_info
             FROM performance_schema.events_stages_history_long WHERE thread_id = thd_id) 
          UNION
          -- Select all events, adding information appropriate to the event
          (SELECT thread_id, event_id, 
                  CONCAT(event_name , 
                         IF(event_name NOT LIKE 'wait/synch/mutex%', IFNULL(CONCAT(' - ', operation), ''), ''), 
                         IF(number_of_bytes IS NOT NULL, CONCAT(' ', number_of_bytes, ' bytes'), ''),
                         IF(event_name LIKE 'wait/io/file%', '\\n', ''),
                         IF(object_schema IS NOT NULL, CONCAT('\\nObject: ', object_schema, '.'), ''), 
                         IF(object_name IS NOT NULL, 
                            IF (event_name LIKE 'wait/io/socket%',
                                -- Print the socket if used, else the IP:port as reported
                                CONCAT(IF (object_name LIKE ':0%', @@socket, object_name)),
                                object_name),
                            ''),
                         IF(index_name IS NOT NULL, CONCAT(' Index: ', index_name), ''),'\\n'
                         ) AS event_name,
                  timer_wait, timer_start, nesting_event_id, source AS wait_info
             FROM performance_schema.events_waits_history_long WHERE thread_id = thd_id)) events 
    ORDER BY event_id;
    RETURN CONCAT('{', 
                  CONCAT_WS(',', 
                            '"rankdir": "LR"',
                            '"nodesep": "0.10"',
                            CONCAT('"stack_created": "', NOW(), '"'),
                            CONCAT('"mysql_version": "', VERSION(), '"'),
                            CONCAT('"mysql_user": "', CURRENT_USER(), '"'),
                            CONCAT('"events": [', IFNULL(json_objects,''), ']')
                           ),
                  '}');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ps_thread_trx_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_trx_info`(
        in_thread_id BIGINT UNSIGNED
    ) RETURNS longtext CHARSET utf8mb4
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns a JSON object with info on the given threads current transaction, \nand the statements it has already executed, derived from the\nperformance_schema.events_transactions_current and\nperformance_schema.events_statements_history tables (so the consumers \nfor these also have to be enabled within Performance Schema to get full\ndata in the object).\n\nWhen the output exceeds the default truncation length (65535), a JSON error\nobject is returned, such as:\n\n{ "error": "Trx info truncated: Row 6 was cut by GROUP_CONCAT()" }\n\nSimilar error objects are returned for other warnings/and exceptions raised\nwhen calling the function.\n\nThe max length of the output of this function can be controlled with the\nps_thread_trx_info.max_length variable set via sys_config, or the\n@sys.ps_thread_trx_info.max_length user variable, as appropriate.\n\nParameters\n-----------\n\nin_thread_id (BIGINT UNSIGNED):\n  The id of the thread to return the transaction info for.\n\nExample\n-----------\n\nSELECT sys.ps_thread_trx_info(48)\\G\n*************************** 1. row ***************************\nsys.ps_thread_trx_info(48): [\n  {\n    "time": "790.70 us",\n    "state": "COMMITTED",\n    "mode": "READ WRITE",\n    "autocommitted": "NO",\n    "gtid": "AUTOMATIC",\n    "isolation": "REPEATABLE READ",\n    "statements_executed": [\n      {\n        "sql_text": "INSERT INTO info VALUES (1, ''foo'')",\n        "time": "471.02 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 1,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      },\n      {\n        "sql_text": "COMMIT",\n        "time": "254.42 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 0,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      }\n    ]\n  },\n  {\n    "time": "426.20 us",\n    "state": "COMMITTED",\n    "mode": "READ WRITE",\n    "autocommitted": "NO",\n    "gtid": "AUTOMATIC",\n    "isolation": "REPEATABLE READ",\n    "statements_executed": [\n      {\n        "sql_text": "INSERT INTO info VALUES (2, ''bar'')",\n        "time": "107.33 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 1,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      },\n      {\n        "sql_text": "COMMIT",\n        "time": "213.23 us",\n        "schema": "trx",\n        "rows_examined": 0,\n        "rows_affected": 0,\n        "rows_sent": 0,\n        "tmp_tables": 0,\n        "tmp_disk_tables": 0,\n        "sort_rows": 0,\n        "sort_merge_passes": 0\n      }\n    ]\n  }\n]\n1 row in set (0.03 sec)\n'
BEGIN
    DECLARE v_output LONGTEXT DEFAULT '{}';
    DECLARE v_msg_text TEXT DEFAULT '';
    DECLARE v_signal_msg TEXT DEFAULT '';
    DECLARE v_mysql_errno INT;
    DECLARE v_max_output_len BIGINT;
    -- Capture warnings/errors such as group_concat truncation
    -- and report as JSON error objects
    DECLARE EXIT HANDLER FOR SQLWARNING, SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_msg_text = MESSAGE_TEXT,
            v_mysql_errno = MYSQL_ERRNO;
        IF v_mysql_errno = 1260 THEN
            SET v_signal_msg = CONCAT('{ "error": "Trx info truncated: ', v_msg_text, '" }');
        ELSE
            SET v_signal_msg = CONCAT('{ "error": "', v_msg_text, '" }');
        END IF;
        RETURN v_signal_msg;
    END;
    -- Set configuration options
    IF (@sys.ps_thread_trx_info.max_length IS NULL) THEN
        SET @sys.ps_thread_trx_info.max_length = sys.sys_get_config('ps_thread_trx_info.max_length', 65535);
    END IF;
    IF (@sys.ps_thread_trx_info.max_length != @@session.group_concat_max_len) THEN
        SET @old_group_concat_max_len = @@session.group_concat_max_len;
        -- Convert to int value for the SET, and give some surrounding space
        SET v_max_output_len = (@sys.ps_thread_trx_info.max_length - 5);
        SET SESSION group_concat_max_len = v_max_output_len;
    END IF;
    SET v_output = (
        SELECT CONCAT('[', IFNULL(GROUP_CONCAT(trx_info ORDER BY event_id), ''), '\n]') AS trx_info
          FROM (SELECT trxi.thread_id, 
                       trxi.event_id,
                       GROUP_CONCAT(
                         IFNULL(
                           CONCAT('\n  {\n',
                                  '    "time": "', IFNULL(format_pico_time(trxi.timer_wait), ''), '",\n',
                                  '    "state": "', IFNULL(trxi.state, ''), '",\n',
                                  '    "mode": "', IFNULL(trxi.access_mode, ''), '",\n',
                                  '    "autocommitted": "', IFNULL(trxi.autocommit, ''), '",\n',
                                  '    "gtid": "', IFNULL(trxi.gtid, ''), '",\n',
                                  '    "isolation": "', IFNULL(trxi.isolation_level, ''), '",\n',
                                  '    "statements_executed": [', IFNULL(s.stmts, ''), IF(s.stmts IS NULL, ' ]\n', '\n    ]\n'),
                                  '  }'
                           ), 
                           '') 
                         ORDER BY event_id) AS trx_info
                  FROM (
                        (SELECT thread_id, event_id, timer_wait, state,access_mode, autocommit, gtid, isolation_level
                           FROM performance_schema.events_transactions_current
                          WHERE thread_id = in_thread_id
                            AND end_event_id IS NULL)
                        UNION
                        (SELECT thread_id, event_id, timer_wait, state,access_mode, autocommit, gtid, isolation_level
                           FROM performance_schema.events_transactions_history
                          WHERE thread_id = in_thread_id)
                       ) AS trxi
                  LEFT JOIN (SELECT thread_id,
                                    nesting_event_id,
                                    GROUP_CONCAT(
                                      IFNULL(
                                        CONCAT('\n      {\n',
                                               '        "sql_text": "', IFNULL(sys.format_statement(REPLACE(sql_text, '\\', '\\\\')), ''), '",\n',
                                               '        "time": "', IFNULL(format_pico_time(timer_wait), ''), '",\n',
                                               '        "schema": "', IFNULL(current_schema, ''), '",\n',
                                               '        "rows_examined": ', IFNULL(rows_examined, ''), ',\n',
                                               '        "rows_affected": ', IFNULL(rows_affected, ''), ',\n',
                                               '        "rows_sent": ', IFNULL(rows_sent, ''), ',\n',
                                               '        "tmp_tables": ', IFNULL(created_tmp_tables, ''), ',\n',
                                               '        "tmp_disk_tables": ', IFNULL(created_tmp_disk_tables, ''), ',\n',
                                               '        "sort_rows": ', IFNULL(sort_rows, ''), ',\n',
                                               '        "sort_merge_passes": ', IFNULL(sort_merge_passes, ''), '\n',
                                               '      }'), '') ORDER BY event_id) AS stmts
                               FROM performance_schema.events_statements_history
                              WHERE sql_text IS NOT NULL
                                AND thread_id = in_thread_id
                              GROUP BY thread_id, nesting_event_id
                            ) AS s 
                    ON trxi.thread_id = s.thread_id 
                   AND trxi.event_id = s.nesting_event_id
                 WHERE trxi.thread_id = in_thread_id
                 GROUP BY trxi.thread_id, trxi.event_id
                ) trxs
          GROUP BY thread_id
    );
    IF (@old_group_concat_max_len IS NOT NULL) THEN
        SET SESSION group_concat_max_len = @old_group_concat_max_len;
    END IF;
    RETURN v_output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `quote_identifier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `quote_identifier`(in_identifier TEXT) RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes an unquoted identifier (schema name, table name, etc.) and\nreturns the identifier quoted with backticks.\n\nParameters\n-----------\n\nin_identifier (TEXT):\n  The identifier to quote.\n\nReturns\n-----------\n\nTEXT CHARSET UTF8MB4\n\nExample\n-----------\n\nmysql> SELECT sys.quote_identifier(''my_identifier'') AS Identifier;\n+-----------------+\n| Identifier      |\n+-----------------+\n| `my_identifier` |\n+-----------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT sys.quote_identifier(''my`idenfier'') AS Identifier;\n+----------------+\n| Identifier     |\n+----------------+\n| `my``idenfier` |\n+----------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN CONCAT('`', REPLACE(in_identifier, '`', '``'), '`');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sys_get_config` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `sys_get_config`(
        in_variable_name VARCHAR(128),
        in_default_value VARCHAR(128)
    ) RETURNS varchar(128) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the value for the requested variable using the following logic:\n\n   1. If the option exists in sys.sys_config return the value from there.\n   2. Else fall back on the provided default value.\n\nNotes for using sys_get_config():\n\n   * If the default value argument to sys_get_config() is NULL and case 2. is reached, NULL is returned.\n     It is then expected that the caller is able to handle NULL for the given configuration option.\n   * The convention is to name the user variables @sys.<name of variable>. It is <name of variable> that\n     is stored in the sys_config table and is what is expected as the argument to sys_get_config().\n   * If you want to check whether the configuration option has already been set and if not assign with\n     the return value of sys_get_config() you can use IFNULL(...) (see example below). However this should\n     not be done inside a loop (e.g. for each row in a result set) as for repeated calls where assignment\n     is only needed in the first iteration using IFNULL(...) is expected to be significantly slower than\n     using an IF (...) THEN ... END IF; block (see example below).\n\nParameters\n-----------\n\nin_variable_name (VARCHAR(128)):\n  The name of the config option to return the value for.\n\nin_default_value (VARCHAR(128)):\n  The default value to return if the variable does not exist in sys.sys_config.\n\nReturns\n-----------\n\nVARCHAR(128)\n\nExample\n-----------\n\n-- Get the configuration value from sys.sys_config falling back on 128 if the option is not present in the table.\nmysql> SELECT sys.sys_get_config(''statement_truncate_len'', 128) AS Value;\n+-------+\n| Value |\n+-------+\n| 64    |\n+-------+\n1 row in set (0.00 sec)\n\n-- Check whether the option is already set, if not assign - IFNULL(...) one liner example.\nmysql> SET @sys.statement_truncate_len = IFNULL(@sys.statement_truncate_len, sys.sys_get_config(''statement_truncate_len'', 64));\nQuery OK, 0 rows affected (0.00 sec)\n\n-- Check whether the option is already set, if not assign - IF ... THEN ... END IF example.\nIF (@sys.statement_truncate_len IS NULL) THEN\n    SET @sys.statement_truncate_len = sys.sys_get_config(''statement_truncate_len'', 64);\nEND IF;\n'
BEGIN
    DECLARE v_value VARCHAR(128) DEFAULT NULL;
    -- Check if we have the variable in the sys.sys_config table
    SET v_value = (SELECT value FROM sys.sys_config WHERE variable = in_variable_name);
    -- Protection against the variable not existing in sys_config
    IF (v_value IS NULL) THEN
        SET v_value = in_default_value;
    END IF;
    RETURN v_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `version_major` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_major`() RETURNS tinyint unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the major version of MySQL Server.\n\nReturns\n-----------\n\nTINYINT UNSIGNED\n\nExample\n-----------\n\nmysql> SELECT VERSION(), sys.version_major();\n+--------------------------------------+---------------------+\n| VERSION()                            | sys.version_major() |\n+--------------------------------------+---------------------+\n| 5.7.9-enterprise-commercial-advanced | 5                   |\n+--------------------------------------+---------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `version_minor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_minor`() RETURNS tinyint unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the minor (release series) version of MySQL Server.\n\nReturns\n-----------\n\nTINYINT UNSIGNED\n\nExample\n-----------\n\nmysql> SELECT VERSION(), sys.server_minor();\n+--------------------------------------+---------------------+\n| VERSION()                            | sys.version_minor() |\n+--------------------------------------+---------------------+\n| 5.7.9-enterprise-commercial-advanced | 7                   |\n+--------------------------------------+---------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', 2), '.', -1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `version_patch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_patch`() RETURNS tinyint unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReturns the patch release version of MySQL Server.\n\nReturns\n-----------\n\nTINYINT UNSIGNED\n\nExample\n-----------\n\nmysql> SELECT VERSION(), sys.version_patch();\n+--------------------------------------+---------------------+\n| VERSION()                            | sys.version_patch() |\n+--------------------------------------+---------------------+\n| 5.7.9-enterprise-commercial-advanced | 9                   |\n+--------------------------------------+---------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', -1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_synonym_db` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `create_synonym_db`(
        IN in_db_name VARCHAR(64), 
        IN in_synonym VARCHAR(64)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes a source database name and synonym name, and then creates the \nsynonym database with views that point to all of the tables within\nthe source database.\n\nUseful for creating a "ps" synonym for "performance_schema",\nor "is" instead of "information_schema", for example.\n\nParameters\n-----------\n\nin_db_name (VARCHAR(64)):\n  The database name that you would like to create a synonym for.\nin_synonym (VARCHAR(64)):\n  The database synonym name.\n\nExample\n-----------\n\nmysql> SHOW DATABASES;\n+--------------------+\n| Database           |\n+--------------------+\n| information_schema |\n| mysql              |\n| performance_schema |\n| sys                |\n| test               |\n+--------------------+\n5 rows in set (0.00 sec)\n\nmysql> CALL sys.create_synonym_db(''performance_schema'', ''ps'');\n+---------------------------------------+\n| summary                               |\n+---------------------------------------+\n| Created 74 views in the `ps` database |\n+---------------------------------------+\n1 row in set (8.57 sec)\n\nQuery OK, 0 rows affected (8.57 sec)\n\nmysql> SHOW DATABASES;\n+--------------------+\n| Database           |\n+--------------------+\n| information_schema |\n| mysql              |\n| performance_schema |\n| ps                 |\n| sys                |\n| test               |\n+--------------------+\n6 rows in set (0.00 sec)\n\nmysql> SHOW FULL TABLES FROM ps;\n+------------------------------------------------------+------------+\n| Tables_in_ps                                         | Table_type |\n+------------------------------------------------------+------------+\n| accounts                                             | VIEW       |\n| cond_instances                                       | VIEW       |\n| events_stages_current                                | VIEW       |\n| events_stages_history                                | VIEW       |\n...\n'
BEGIN
    DECLARE v_done bool DEFAULT FALSE;
    DECLARE v_db_name_check VARCHAR(64);
    DECLARE v_db_err_msg TEXT;
    DECLARE v_table VARCHAR(64);
    DECLARE v_views_created INT DEFAULT 0;
    DECLARE db_doesnt_exist CONDITION FOR SQLSTATE '42000';
    DECLARE db_name_exists CONDITION FOR SQLSTATE 'HY000';
    DECLARE c_table_names CURSOR FOR 
        SELECT TABLE_NAME 
          FROM INFORMATION_SCHEMA.TABLES 
         WHERE TABLE_SCHEMA = in_db_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    -- Check if the source database exists
    SELECT SCHEMA_NAME INTO v_db_name_check
      FROM INFORMATION_SCHEMA.SCHEMATA
     WHERE SCHEMA_NAME = in_db_name;
    IF v_db_name_check IS NULL THEN
        SET v_db_err_msg = CONCAT('Unknown database ', in_db_name);
        SIGNAL SQLSTATE 'HY000'
            SET MESSAGE_TEXT = v_db_err_msg;
    END IF;
    -- Check if a database of the synonym name already exists
    SELECT SCHEMA_NAME INTO v_db_name_check
      FROM INFORMATION_SCHEMA.SCHEMATA
     WHERE SCHEMA_NAME = in_synonym;
    IF v_db_name_check = in_synonym THEN
        SET v_db_err_msg = CONCAT('Can\'t create database ', in_synonym, '; database exists');
        SIGNAL SQLSTATE 'HY000'
            SET MESSAGE_TEXT = v_db_err_msg;
    END IF;
    -- All good, create the database and views
    SET @create_db_stmt := CONCAT('CREATE DATABASE ', sys.quote_identifier(in_synonym));
    PREPARE create_db_stmt FROM @create_db_stmt;
    EXECUTE create_db_stmt;
    DEALLOCATE PREPARE create_db_stmt;
    SET v_done = FALSE;
    OPEN c_table_names;
    c_table_names: LOOP
        FETCH c_table_names INTO v_table;
        IF v_done THEN
            LEAVE c_table_names;
        END IF;
        SET @create_view_stmt = CONCAT(
            'CREATE SQL SECURITY INVOKER VIEW ',
            sys.quote_identifier(in_synonym),
            '.',
            sys.quote_identifier(v_table),
            ' AS SELECT * FROM ',
            sys.quote_identifier(in_db_name),
            '.',
            sys.quote_identifier(v_table)
        );
        PREPARE create_view_stmt FROM @create_view_stmt;
        EXECUTE create_view_stmt;
        DEALLOCATE PREPARE create_view_stmt;
        SET v_views_created = v_views_created + 1;
    END LOOP;
    CLOSE c_table_names;
    SELECT CONCAT(
        'Created ', v_views_created, ' view',
        IF(v_views_created != 1, 's', ''), ' in the ',
        sys.quote_identifier(in_synonym), ' database'
    ) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diagnostics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `diagnostics`(
        IN in_max_runtime int unsigned, IN in_interval int unsigned,
        IN in_auto_config enum ('current', 'medium', 'full')
    )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nCreate a report of the current status of the server for diagnostics purposes. Data collected includes (some items depends on versions and settings):\n\n   * The GLOBAL VARIABLES\n   * Several sys schema views including metrics or equivalent (depending on version and settings)\n   * Queries in the 95th percentile\n   * Several ndbinfo views for MySQL Cluster\n   * Replication (both master and slave) information.\n\nSome of the sys schema views are calculated as initial (optional), overall, delta:\n\n   * The initial view is the content of the view at the start of this procedure.\n     This output will be the same as the the start values used for the delta view.\n     The initial view is included if @sys.diagnostics.include_raw = ''ON''.\n   * The overall view is the content of the view at the end of this procedure.\n     This output is the same as the end values used for the delta view.\n     The overall view is always included.\n   * The delta view is the difference from the beginning to the end. Note that for min and max values\n     they are simply the min or max value from the end view respectively, so does not necessarily reflect\n     the minimum/maximum value in the monitored period.\n     Note: except for the metrics views the delta is only calculation between the first and last outputs.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_max_runtime (INT UNSIGNED):\n  The maximum time to keep collecting data.\n  Use NULL to get the default which is 60 seconds, otherwise enter a value greater than 0.\nin_interval (INT UNSIGNED):\n  How long to sleep between data collections.\n  Use NULL to get the default which is 30 seconds, otherwise enter a value greater than 0.\nin_auto_config (ENUM(''current'', ''medium'', ''full''))\n  Automatically enable Performance Schema instruments and consumers.\n  NOTE: The more that are enabled, the more impact on the performance.\n  Supported values are:\n     * current - use the current settings.\n     * medium - enable some settings. This requires the SUPER privilege.\n     * full - enables all settings. This will have a big impact on the\n              performance - be careful using this option. This requires\n              the SUPER privilege.\n  If another setting the ''current'' is chosen, the current settings\n  are restored at the end of the procedure.\n\n\nConfiguration Options\n----------------------\n\nsys.diagnostics.allow_i_s_tables\n  Specifies whether it is allowed to do table scan queries on information_schema.TABLES. This can be expensive if there\n  are many tables. Set to ''ON'' to allow, ''OFF'' to not allow.\n  Default is ''OFF''.\n\nsys.diagnostics.include_raw\n  Set to ''ON'' to include the raw data (e.g. the original output of "SELECT * FROM sys.metrics").\n  Use this to get the initial values of the various views.\n  Default is ''OFF''.\n\nsys.statement_truncate_len\n  How much of queries in the process list output to include.\n  Default is 64.\n\nsys.debug\n  Whether to provide debugging output.\n  Default is ''OFF''. Set to ''ON'' to include.\n\n\nExample\n--------\n\nTo create a report and append it to the file diag.out:\n\nmysql> TEE diag.out;\nmysql> CALL sys.diagnostics(120, 30, ''current'');\n...\nmysql> NOTEE;\n'
BEGIN
    DECLARE v_start, v_runtime, v_iter_start, v_sleep DECIMAL(20,2) DEFAULT 0.0;
    DECLARE v_has_innodb, v_has_ndb, v_has_ps, v_has_replication, v_has_ps_replication VARCHAR(8) CHARSET utf8mb4 DEFAULT 'NO';
    DECLARE v_this_thread_enabled  ENUM('YES', 'NO');
    DECLARE v_table_name, v_banner VARCHAR(64) CHARSET utf8mb4;
    DECLARE v_sql_status_summary_select, v_sql_status_summary_delta, v_sql_status_summary_from, v_no_delta_names TEXT;
    DECLARE v_output_time, v_output_time_prev DECIMAL(20,3) UNSIGNED;
    DECLARE v_output_count, v_count, v_old_group_concat_max_len INT UNSIGNED DEFAULT 0;
    -- The width of each of the status outputs in the summery
    DECLARE v_status_summary_width TINYINT UNSIGNED DEFAULT 50;
    DECLARE v_done BOOLEAN DEFAULT FALSE;
    -- Do not include the following ndbinfo views:
    --    'blocks'                    Static
    --    'config_params'             Static
    --    'dict_obj_types'            Static
    --    'disk_write_speed_base'     Can generate lots of output - only include aggregate views here
    --    'memory_per_fragment'       Can generate lots of output
    --    'memoryusage'               Handled separately
    --    'operations_per_fragment'   Can generate lots of output
    --    'threadblocks'              Only needed once
    DECLARE c_ndbinfo CURSOR FOR
        SELECT TABLE_NAME
          FROM information_schema.TABLES
         WHERE TABLE_SCHEMA = 'ndbinfo'
               AND TABLE_NAME NOT IN (
                  'blocks',
                  'config_params',
                  'dict_obj_types',
                  'disk_write_speed_base',
                  'memory_per_fragment',
                  'memoryusage',
                  'operations_per_fragment',
                  'threadblocks'
               );
    DECLARE c_sysviews_w_delta CURSOR FOR
        SELECT table_name
          FROM tmp_sys_views_delta
         ORDER BY table_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    -- Do not track the current thread - no reason to clutter the output
    SELECT INSTRUMENTED INTO v_this_thread_enabled FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    END IF;
    -- Check options are sane
    IF (in_max_runtime < in_interval) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_max_runtime must be greater than or equal to in_interval';
    END IF;
    IF (in_max_runtime = 0) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_max_runtime must be greater than 0';
    END IF;
    IF (in_interval = 0) THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'in_interval must be greater than 0';
    END IF;
    -- Set configuration options
    IF (@sys.diagnostics.allow_i_s_tables IS NULL) THEN
        SET @sys.diagnostics.allow_i_s_tables = sys.sys_get_config('diagnostics.allow_i_s_tables', 'OFF');
    END IF;
    IF (@sys.diagnostics.include_raw IS NULL) THEN
        SET @sys.diagnostics.include_raw      = sys.sys_get_config('diagnostics.include_raw'     , 'OFF');
    END IF;
    IF (@sys.debug IS NULL) THEN
        SET @sys.debug                        = sys.sys_get_config('debug'                       , 'OFF');
    END IF;
    IF (@sys.statement_truncate_len IS NULL) THEN
        SET @sys.statement_truncate_len       = sys.sys_get_config('statement_truncate_len'      , '64' );
    END IF;
    -- Temporary table are used - disable sql_log_bin if necessary to prevent them replicating
    SET @log_bin := @@sql_log_bin;
    IF ((@log_bin = 1) AND (@@binlog_format = 'STATEMENT')) THEN
        SET sql_log_bin = 0;
    END IF;
    -- Some metrics variables doesn't make sense in delta and rate calculations even if they are numeric
    -- as they really are more like settings or "current" status.
    SET v_no_delta_names = CONCAT('s%{COUNT}.Variable_name NOT IN (',
        '''innodb_buffer_pool_pages_total'', ',
        '''innodb_page_size'', ',
        '''last_query_cost'', ',
        '''last_query_partial_plans'', ',
        '''qcache_total_blocks'', ',
        '''slave_last_heartbeat'', ',
        '''ssl_ctx_verify_depth'', ',
        '''ssl_ctx_verify_mode'', ',
        '''ssl_session_cache_size'', ',
        '''ssl_verify_depth'', ',
        '''ssl_verify_mode'', ',
        '''ssl_version'', ',
        '''buffer_flush_lsn_avg_rate'', ',
        '''buffer_flush_pct_for_dirty'', ',
        '''buffer_flush_pct_for_lsn'', ',
        '''buffer_pool_pages_total'', ',
        '''lock_row_lock_time_avg'', ',
        '''lock_row_lock_time_max'', ',
        '''innodb_page_size''',
    ')');
    IF (in_auto_config <> 'current') THEN
        IF (@sys.debug = 'ON') THEN
            SELECT CONCAT('Updating Performance Schema configuration to ', in_auto_config) AS 'Debug';
        END IF;
        CALL sys.ps_setup_save(0);
        IF (in_auto_config = 'medium') THEN
            -- Enable all consumers except %history and %history_long
            UPDATE performance_schema.setup_consumers
                SET ENABLED = 'YES'
            WHERE NAME NOT LIKE '%\_history%';
            -- Enable all instruments except wait/synch/%
            UPDATE performance_schema.setup_instruments
                SET ENABLED = 'YES',
                    TIMED   = 'YES'
            WHERE NAME NOT LIKE 'wait/synch/%';
        ELSEIF (in_auto_config = 'full') THEN
            UPDATE performance_schema.setup_consumers
                SET ENABLED = 'YES';
            UPDATE performance_schema.setup_instruments
                SET ENABLED = 'YES',
                    TIMED   = 'YES';
        END IF;
        -- Enable all threads except this one
        UPDATE performance_schema.threads
           SET INSTRUMENTED = 'YES'
         WHERE PROCESSLIST_ID <> CONNECTION_ID();
    END IF;
    SET v_start        = UNIX_TIMESTAMP(NOW(2)),
        in_interval    = IFNULL(in_interval, 30),
        in_max_runtime = IFNULL(in_max_runtime, 60);
    -- Get a quick ref with hostname, server UUID, and the time for the report.
    SET v_banner = REPEAT(
                      '-',
                      LEAST(
                         GREATEST(
                            36,
                            CHAR_LENGTH(VERSION()),
                            CHAR_LENGTH(@@global.version_comment),
                            CHAR_LENGTH(@@global.version_compile_os),
                            CHAR_LENGTH(@@global.version_compile_machine),
                            CHAR_LENGTH(@@global.socket),
                            CHAR_LENGTH(@@global.datadir)
                         ),
                         64
                      )
                   );
    SELECT 'Hostname' AS 'Name', @@global.hostname AS 'Value'
    UNION ALL
    SELECT 'Port' AS 'Name', @@global.port AS 'Value'
    UNION ALL
    SELECT 'Socket' AS 'Name', @@global.socket AS 'Value'
    UNION ALL
    SELECT 'Datadir' AS 'Name', @@global.datadir AS 'Value'
    UNION ALL
    SELECT 'Server UUID' AS 'Name', @@global.server_uuid AS 'Value'
    UNION ALL
    SELECT REPEAT('-', 23) AS 'Name', v_banner AS 'Value'
    UNION ALL
    SELECT 'MySQL Version' AS 'Name', VERSION() AS 'Value'
    UNION ALL
    SELECT 'Sys Schema Version' AS 'Name', (SELECT sys_version FROM sys.version) AS 'Value'
    UNION ALL
    SELECT 'Version Comment' AS 'Name', @@global.version_comment AS 'Value'
    UNION ALL
    SELECT 'Version Compile OS' AS 'Name', @@global.version_compile_os AS 'Value'
    UNION ALL
    SELECT 'Version Compile Machine' AS 'Name', @@global.version_compile_machine AS 'Value'
    UNION ALL
    SELECT REPEAT('-', 23) AS 'Name', v_banner AS 'Value'
    UNION ALL
    SELECT 'UTC Time' AS 'Name', UTC_TIMESTAMP() AS 'Value'
    UNION ALL
    SELECT 'Local Time' AS 'Name', NOW() AS 'Value'
    UNION ALL
    SELECT 'Time Zone' AS 'Name', @@global.time_zone AS 'Value'
    UNION ALL
    SELECT 'System Time Zone' AS 'Name', @@global.system_time_zone AS 'Value'
    UNION ALL
    SELECT 'Time Zone Offset' AS 'Name', TIMEDIFF(NOW(), UTC_TIMESTAMP()) AS 'Value';
    -- Are the InnoDB, NDBCluster, and Performance Schema storage engines present?
    SET v_has_innodb         = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'InnoDB'), 'NO'),
        v_has_ndb            = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'NDBCluster'), 'NO'),
        v_has_ps             = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'PERFORMANCE_SCHEMA'), 'NO'),
        v_has_ps_replication = v_has_ps,
        v_has_replication    = IF(v_has_ps_replication = 'YES', IF((SELECT COUNT(*) FROM performance_schema.replication_connection_status) > 0, 'YES', 'NO'),
                                  IF(@@master_info_repository = 'TABLE', IF((SELECT COUNT(*) FROM mysql.slave_master_info) > 0, 'YES', 'NO'),
                                     IF(@@relay_log_info_repository = 'TABLE', IF((SELECT COUNT(*) FROM mysql.slave_relay_log_info) > 0, 'YES', 'NO'),
                                        'MAYBE')));
    IF (@sys.debug = 'ON') THEN
       SELECT v_has_innodb AS 'Has_InnoDB', v_has_ndb AS 'Has_NDBCluster',
              v_has_ps AS 'Has_Performance_Schema',
              v_has_ps_replication 'AS Has_P_S_Replication', v_has_replication AS 'Has_Replication';
    END IF;
    IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN
        -- Need to use prepared statement as just having the query as a plain command
        -- will generate an error if the InnoDB storage engine is not present
        SET @sys.diagnostics.sql = 'SHOW ENGINE InnoDB STATUS';
        PREPARE stmt_innodb_status FROM @sys.diagnostics.sql;
    END IF;
    IF (v_has_ps = 'YES') THEN
        -- Need to use prepared statement as just having the query as a plain command
        -- will generate an error if the InnoDB storage engine is not present
        SET @sys.diagnostics.sql = 'SHOW ENGINE PERFORMANCE_SCHEMA STATUS';
        PREPARE stmt_ps_status FROM @sys.diagnostics.sql;
    END IF;
    IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
        -- Need to use prepared statement as just having the query as a plain command
        -- will generate an error if the NDBCluster storage engine is not present
        SET @sys.diagnostics.sql = 'SHOW ENGINE NDBCLUSTER STATUS';
        PREPARE stmt_ndbcluster_status FROM @sys.diagnostics.sql;
    END IF;
    SET @sys.diagnostics.sql_gen_query_template = 'SELECT CONCAT(
           ''SELECT '',
           GROUP_CONCAT(
               CASE WHEN (SUBSTRING(TABLE_NAME, 3), COLUMN_NAME) IN (
                                (''io_global_by_file_by_bytes'', ''total''),
                                (''io_global_by_wait_by_bytes'', ''total_requested'')
                         )
                         THEN CONCAT(''format_bytes('', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME LIKE ''%latency''
                         THEN CONCAT(''format_pico_time('', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, -7) = ''_memory'' OR SUBSTRING(COLUMN_NAME, -17) = ''_memory_allocated''
                         OR ((SUBSTRING(COLUMN_NAME, -5) = ''_read'' OR SUBSTRING(COLUMN_NAME, -8) = ''_written'' OR SUBSTRING(COLUMN_NAME, -6) = ''_write'') AND SUBSTRING(COLUMN_NAME, 1, 6) <> ''COUNT_'')
                         THEN CONCAT(''format_bytes('', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    ELSE COLUMN_NAME
               END
               ORDER BY ORDINAL_POSITION
               SEPARATOR '',\n       ''
           ),
           ''\n  FROM tmp_'', SUBSTRING(TABLE_NAME FROM 3), ''_%{OUTPUT}''
       ) AS Query INTO @sys.diagnostics.sql_select
  FROM information_schema.COLUMNS
 WHERE TABLE_SCHEMA = ''sys'' AND TABLE_NAME = ?
 GROUP BY TABLE_NAME';
    SET @sys.diagnostics.sql_gen_query_delta = 'SELECT CONCAT(
           ''SELECT '',
           GROUP_CONCAT(
               CASE WHEN FIND_IN_SET(COLUMN_NAME COLLATE utf8mb3_general_ci, diag.pk)
                         THEN COLUMN_NAME
                    WHEN diag.TABLE_NAME = ''io_global_by_file_by_bytes'' AND COLUMN_NAME COLLATE utf8mb3_general_ci = ''write_pct''
                         THEN CONCAT(''IFNULL(ROUND(100-(((e.total_read-IFNULL(s.total_read, 0))'',
                                     ''/NULLIF(((e.total_read-IFNULL(s.total_read, 0))+(e.total_written-IFNULL(s.total_written, 0))), 0))*100), 2), 0.00) AS '',
                                     COLUMN_NAME)
                    WHEN (diag.TABLE_NAME, COLUMN_NAME) IN (
                                (''io_global_by_file_by_bytes'', ''total''),
                                (''io_global_by_wait_by_bytes'', ''total_requested'')
                         )
                         THEN CONCAT(''format_bytes(e.'', COLUMN_NAME, ''-IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, 1, 4) IN (''max_'', ''min_'') AND SUBSTRING(COLUMN_NAME, -8) = ''_latency''
                         THEN CONCAT(''format_pico_time(e.'', COLUMN_NAME, '') AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME COLLATE utf8mb3_general_ci = ''avg_latency''
                         THEN CONCAT(''format_pico_time((e.total_latency - IFNULL(s.total_latency, 0))'',
                                     ''/NULLIF(e.total - IFNULL(s.total, 0), 0)) AS '', COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, -12) = ''_avg_latency''
                         THEN CONCAT(''format_pico_time((e.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''_latency - IFNULL(s.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''_latency, 0))'',
                                     ''/NULLIF(e.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''s - IFNULL(s.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''s, 0), 0)) AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME LIKE ''%latency''
                         THEN CONCAT(''format_pico_time(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
                    WHEN COLUMN_NAME IN (''avg_read'', ''avg_write'', ''avg_written'')
                         THEN CONCAT(''format_bytes(IFNULL((e.total_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''written''), ''-IFNULL(s.total_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''written''), '', 0))'',
                                     ''/NULLIF(e.count_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''write''), ''-IFNULL(s.count_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''write''), '', 0), 0), 0)) AS '',
                                     COLUMN_NAME)
                    WHEN SUBSTRING(COLUMN_NAME, -7) = ''_memory'' OR SUBSTRING(COLUMN_NAME, -17) = ''_memory_allocated''
                         OR ((SUBSTRING(COLUMN_NAME, -5) = ''_read'' OR SUBSTRING(COLUMN_NAME, -8) = ''_written'' OR SUBSTRING(COLUMN_NAME, -6) = ''_write'') AND SUBSTRING(COLUMN_NAME, 1, 6) <> ''COUNT_'')
                         THEN CONCAT(''format_bytes(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
                    ELSE CONCAT(''(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME)
               END
               ORDER BY ORDINAL_POSITION
               SEPARATOR '',\n       ''
           ),
           ''\n  FROM tmp_'', diag.TABLE_NAME, ''_end e
       LEFT OUTER JOIN tmp_'', diag.TABLE_NAME, ''_start s USING ('', diag.pk, '')''
       ) AS Query INTO @sys.diagnostics.sql_select
  FROM tmp_sys_views_delta diag
       INNER JOIN information_schema.COLUMNS c ON c.TABLE_NAME COLLATE utf8mb3_general_ci = CONCAT(''x$'', diag.TABLE_NAME)
 WHERE c.TABLE_SCHEMA = ''sys'' AND diag.TABLE_NAME = ?
 GROUP BY diag.TABLE_NAME';
    IF (v_has_ps = 'YES') THEN
        -- Create temporary table with the ORDER BY clauses. Will be required both for the initial (if included) and end queries
        DROP TEMPORARY TABLE IF EXISTS tmp_sys_views_delta;
        CREATE TEMPORARY TABLE tmp_sys_views_delta (
            TABLE_NAME varchar(64) NOT NULL,
            order_by text COMMENT 'ORDER BY clause for the initial and overall views',
            order_by_delta text COMMENT 'ORDER BY clause for the delta views',
            where_delta text COMMENT 'WHERE clause to use for delta views to only include rows with a "count" > 0',
            limit_rows int unsigned COMMENT 'The maximum number of rows to include for the view',
            pk varchar(128) COMMENT 'Used with the FIND_IN_SET() function so use comma separated list without whitespace',
            PRIMARY KEY (TABLE_NAME)
        );
        -- %{OUTPUT} will be replace by the suffix used for the output.
        IF (@sys.debug = 'ON') THEN
            SELECT 'Populating tmp_sys_views_delta' AS 'Debug';
        END IF;
        INSERT INTO tmp_sys_views_delta
        VALUES ('host_summary'                       , '%{TABLE}.statement_latency DESC',
                                                       '(e.statement_latency-IFNULL(s.statement_latency, 0)) DESC',
                                                       '(e.statements - IFNULL(s.statements, 0)) > 0', NULL, 'host'),
               ('host_summary_by_file_io'            , '%{TABLE}.io_latency DESC',
                                                       '(e.io_latency-IFNULL(s.io_latency, 0)) DESC',
                                                       '(e.ios - IFNULL(s.ios, 0)) > 0', NULL, 'host'),
               ('host_summary_by_file_io_type'       , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event_name'),
               ('host_summary_by_stages'             , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event_name'),
               ('host_summary_by_statement_latency'  , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host'),
               ('host_summary_by_statement_type'     , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,statement'),
               ('io_by_thread_by_latency'            , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,thread_id,processlist_id'),
               ('io_global_by_file_by_bytes'         , '%{TABLE}.total DESC',
                                                       '(e.total-IFNULL(s.total, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', 100, 'file'),
               ('io_global_by_file_by_latency'       , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', 100, 'file'),
               ('io_global_by_wait_by_bytes'         , '%{TABLE}.total_requested DESC',
                                                       '(e.total_requested-IFNULL(s.total_requested, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_name'),
               ('io_global_by_wait_by_latency'       , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_name'),
               ('schema_index_statistics'            , '(%{TABLE}.select_latency+%{TABLE}.insert_latency+%{TABLE}.update_latency+%{TABLE}.delete_latency) DESC',
                                                       '((e.select_latency+e.insert_latency+e.update_latency+e.delete_latency)-IFNULL(s.select_latency+s.insert_latency+s.update_latency+s.delete_latency, 0)) DESC',
                                                       '((e.rows_selected+e.insert_latency+e.rows_updated+e.rows_deleted)-IFNULL(s.rows_selected+s.rows_inserted+s.rows_updated+s.rows_deleted, 0)) > 0',
                                                       100, 'table_schema,table_name,index_name'),
               ('schema_table_statistics'            , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) > 0', 100, 'table_schema,table_name'),
               ('schema_tables_with_full_table_scans', '%{TABLE}.rows_full_scanned DESC',
                                                       '(e.rows_full_scanned-IFNULL(s.rows_full_scanned, 0)) DESC',
                                                       '(e.rows_full_scanned-IFNULL(s.rows_full_scanned, 0)) > 0', 100, 'object_schema,object_name'),
               ('user_summary'                       , '%{TABLE}.statement_latency DESC',
                                                       '(e.statement_latency-IFNULL(s.statement_latency, 0)) DESC',
                                                       '(e.statements - IFNULL(s.statements, 0)) > 0', NULL, 'user'),
               ('user_summary_by_file_io'            , '%{TABLE}.io_latency DESC',
                                                       '(e.io_latency-IFNULL(s.io_latency, 0)) DESC',
                                                       '(e.ios - IFNULL(s.ios, 0)) > 0', NULL, 'user'),
               ('user_summary_by_file_io_type'       , '%{TABLE}.user, %{TABLE}.latency DESC',
                                                       'e.user, (e.latency-IFNULL(s.latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event_name'),
               ('user_summary_by_stages'             , '%{TABLE}.user, %{TABLE}.total_latency DESC',
                                                       'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event_name'),
               ('user_summary_by_statement_latency'  , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user'),
               ('user_summary_by_statement_type'     , '%{TABLE}.user, %{TABLE}.total_latency DESC',
                                                       'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,statement'),
               ('wait_classes_global_by_avg_latency' , 'IFNULL(%{TABLE}.total_latency / NULLIF(%{TABLE}.total, 0), 0) DESC',
                                                       'IFNULL((e.total_latency-IFNULL(s.total_latency, 0)) / NULLIF((e.total - IFNULL(s.total, 0)), 0), 0) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_class'),
               ('wait_classes_global_by_latency'     , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_class'),
               ('waits_by_host_by_latency'           , '%{TABLE}.host, %{TABLE}.total_latency DESC',
                                                       'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event'),
               ('waits_by_user_by_latency'           , '%{TABLE}.user, %{TABLE}.total_latency DESC',
                                                       'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event'),
               ('waits_global_by_latency'            , '%{TABLE}.total_latency DESC',
                                                       '(e.total_latency-IFNULL(s.total_latency, 0)) DESC',
                                                       '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'events')
        ;
    END IF;
    SELECT '

=======================

     Configuration

=======================

' AS '';
    -- Get the configuration.
    SELECT 'GLOBAL VARIABLES' AS 'The following output is:';
    SELECT LOWER(VARIABLE_NAME) AS Variable_name, VARIABLE_VALUE AS Variable_value FROM performance_schema.global_variables ORDER BY VARIABLE_NAME;
    IF (v_has_ps = 'YES') THEN
        -- Overview of the Performance Schema dynamic settings used for this report.
        SELECT 'Performance Schema Setup - Actors' AS 'The following output is:';
        SELECT * FROM performance_schema.setup_actors;
        SELECT 'Performance Schema Setup - Consumers' AS 'The following output is:';
        SELECT NAME AS Consumer, ENABLED, sys.ps_is_consumer_enabled(NAME) AS COLLECTS
          FROM performance_schema.setup_consumers;
        SELECT 'Performance Schema Setup - Instruments' AS 'The following output is:';
        SELECT SUBSTRING_INDEX(NAME, '/', 2) AS 'InstrumentClass',
               ROUND(100*SUM(IF(ENABLED = 'YES', 1, 0))/COUNT(*), 2) AS 'EnabledPct',
               ROUND(100*SUM(IF(TIMED = 'YES', 1, 0))/COUNT(*), 2) AS 'TimedPct'
          FROM performance_schema.setup_instruments
         GROUP BY SUBSTRING_INDEX(NAME, '/', 2)
         ORDER BY SUBSTRING_INDEX(NAME, '/', 2);
        SELECT 'Performance Schema Setup - Objects' AS 'The following output is:';
        SELECT * FROM performance_schema.setup_objects;
        SELECT 'Performance Schema Setup - Threads' AS 'The following output is:';
        SELECT `TYPE` AS ThreadType, COUNT(*) AS 'Total', ROUND(100*SUM(IF(INSTRUMENTED = 'YES', 1, 0))/COUNT(*), 2) AS 'InstrumentedPct'
          FROM performance_schema.threads
        GROUP BY TYPE;
    END IF;
    IF (v_has_replication = 'NO') THEN
        SELECT 'No Replication Configured' AS 'Replication Status';
    ELSE
        -- No guarantee that replication is actually configured, but we can't really know
        SELECT CONCAT('Replication Configured: ', v_has_replication, ' - Performance Schema Replication Tables: ', v_has_ps_replication) AS 'Replication Status';
        IF (v_has_ps_replication = 'YES') THEN
            SELECT 'Replication - Connection Configuration' AS 'The following output is:';
            SELECT * FROM performance_schema.replication_connection_configuration ORDER BY CHANNEL_NAME;
        END IF;
        IF (v_has_ps_replication = 'YES') THEN
            SELECT 'Replication - Applier Configuration' AS 'The following output is:';
            SELECT * FROM performance_schema.replication_applier_configuration ORDER BY CHANNEL_NAME;
        END IF;
        IF (@@master_info_repository = 'TABLE') THEN
            SELECT 'Replication - Master Info Repository Configuration' AS 'The following output is:';
            -- Can't just do SELECT *  as the password may be present in plain text
            -- Don't include binary log file and position as that will be determined in each iteration as well
            SELECT Channel_name, Host, User_name, Port, Connect_retry,
                   Enabled_ssl, Ssl_ca, Ssl_capath, Ssl_cert, Ssl_cipher, Ssl_key, Ssl_verify_server_cert,
                   Heartbeat, Bind, Ignored_server_ids, Uuid, Retry_count, Ssl_crl, Ssl_crlpath,
                   Tls_version, Enabled_auto_position
              FROM mysql.slave_master_info ORDER BY Channel_name;
        END IF;
        IF (@@relay_log_info_repository = 'TABLE') THEN
            SELECT 'Replication - Relay Log Repository Configuration' AS 'The following output is:';
            SELECT Channel_name, Sql_delay, Number_of_workers, Id
              FROM mysql.slave_relay_log_info ORDER BY Channel_name;
        END IF;
    END IF;
    IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
       SELECT 'Cluster Thread Blocks' AS 'The following output is:';
       SELECT * FROM ndbinfo.threadblocks;
    END IF;
    -- For a number of sys views as well as events_statements_summary_by_digest,
    -- just get the start data and then at the end output the overall and delta values
    IF (v_has_ps = 'YES') THEN
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            SELECT '

========================

     Initial Status

========================

' AS '';
        END IF;
        DROP TEMPORARY TABLE IF EXISTS tmp_digests_start;
        CALL sys.statement_performance_analyzer('create_tmp', 'tmp_digests_start', NULL);
        CALL sys.statement_performance_analyzer('snapshot', NULL, NULL);
        CALL sys.statement_performance_analyzer('save', 'tmp_digests_start', NULL);
        -- Loop over the sys views where deltas should be calculated.
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            SET @sys.diagnostics.sql = REPLACE(@sys.diagnostics.sql_gen_query_template, '%{OUTPUT}', 'start');
            IF (@sys.debug = 'ON') THEN
                SELECT 'The following query will be used to generate the query for each sys view' AS 'Debug';
                SELECT @sys.diagnostics.sql AS 'Debug';
            END IF;
            PREPARE stmt_gen_query FROM @sys.diagnostics.sql;
        END IF;
        SET v_done = FALSE;
        OPEN c_sysviews_w_delta;
        c_sysviews_w_delta_loop: LOOP
            FETCH c_sysviews_w_delta INTO v_table_name;
            IF v_done THEN
                LEAVE c_sysviews_w_delta_loop;
            END IF;
            IF (@sys.debug = 'ON') THEN
                SELECT CONCAT('The following queries are for storing the initial content of ', v_table_name) AS 'Debug';
            END IF;
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS `tmp_', v_table_name, '_start`'));
            CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE `tmp_', v_table_name, '_start` SELECT * FROM `sys`.`x$', v_table_name, '`'));
            IF (@sys.diagnostics.include_raw = 'ON') THEN
                SET @sys.diagnostics.table_name = CONCAT('x$', v_table_name);
                EXECUTE stmt_gen_query USING @sys.diagnostics.table_name;
                -- If necessary add ORDER BY and LIMIT
                SELECT CONCAT(@sys.diagnostics.sql_select,
                              IF(order_by IS NOT NULL, CONCAT('\n ORDER BY ', REPLACE(order_by, '%{TABLE}', CONCAT('tmp_', v_table_name, '_start'))), ''),
                              IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '')
                       )
                  INTO @sys.diagnostics.sql_select
                  FROM tmp_sys_views_delta
                 WHERE TABLE_NAME COLLATE utf8mb4_0900_as_ci = v_table_name;
                SELECT CONCAT('Initial ', v_table_name) AS 'The following output is:';
                CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select);
            END IF;
        END LOOP;
        CLOSE c_sysviews_w_delta;
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            DEALLOCATE PREPARE stmt_gen_query;
        END IF;
    END IF;
    -- If in_include_status_summary is TRUE then a temporary table is required to store the data
    SET v_sql_status_summary_select = 'SELECT Variable_name',
        v_sql_status_summary_delta  = '',
        v_sql_status_summary_from   = '';
    -- Start the loop
    REPEAT
        SET v_output_count = v_output_count + 1;
        IF (v_output_count > 1) THEN
            -- Don't sleep on the first execution
            SET v_sleep = in_interval-(UNIX_TIMESTAMP(NOW(2))-v_iter_start);
            SELECT NOW() AS 'Time', CONCAT('Going to sleep for ', v_sleep, ' seconds. Please do not interrupt') AS 'The following output is:';
            DO SLEEP(in_interval);
        END IF;
        SET v_iter_start = UNIX_TIMESTAMP(NOW(2));
        SELECT NOW(), CONCAT('Iteration Number ', IFNULL(v_output_count, 'NULL')) AS 'The following output is:';
        -- Even in 5.7 there is no way to get all the info from SHOW MASTER|SLAVE STATUS using the Performance Schema or
        -- other tables, so include them even though they are no longer optimal solutions and if present get the additional
        -- information from the other tables available.
        IF (@@log_bin = 1) THEN
            SELECT 'SHOW MASTER STATUS' AS 'The following output is:';
            SHOW MASTER STATUS;
        END IF;
        IF (v_has_replication <> 'NO') THEN
            SELECT 'SHOW SLAVE STATUS' AS 'The following output is:';
            SHOW SLAVE STATUS;
            IF (v_has_ps_replication = 'YES') THEN
                SELECT 'Replication Connection Status' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_connection_status;
                SELECT 'Replication Applier Status' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_applier_status ORDER BY CHANNEL_NAME;
                SELECT 'Replication Applier Status - Coordinator' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_applier_status_by_coordinator ORDER BY CHANNEL_NAME;
                SELECT 'Replication Applier Status - Worker' AS 'The following output is:';
                SELECT * FROM performance_schema.replication_applier_status_by_worker ORDER BY CHANNEL_NAME, WORKER_ID;
            END IF;
            IF (@@master_info_repository = 'TABLE') THEN
                SELECT 'Replication - Master Log Status' AS 'The following output is:';
                SELECT Master_log_name, Master_log_pos FROM mysql.slave_master_info;
            END IF;
            IF (@@relay_log_info_repository = 'TABLE') THEN
                SELECT 'Replication - Relay Log Status' AS 'The following output is:';
                SELECT sys.format_path(Relay_log_name) AS Relay_log_name, Relay_log_pos, Master_log_name, Master_log_pos FROM mysql.slave_relay_log_info;
                SELECT 'Replication - Worker Status' AS 'The following output is:';
                SELECT Id, sys.format_path(Relay_log_name) AS Relay_log_name, Relay_log_pos, Master_log_name, Master_log_pos,
                       sys.format_path(Checkpoint_relay_log_name) AS Checkpoint_relay_log_name, Checkpoint_relay_log_pos,
                       Checkpoint_master_log_name, Checkpoint_master_log_pos, Checkpoint_seqno, Checkpoint_group_size,
                       HEX(Checkpoint_group_bitmap) AS Checkpoint_group_bitmap, Channel_name
                  FROM mysql.slave_worker_info
              ORDER BY Channel_name, Id;
            END IF;
        END IF;
        -- We need one table per output as a temporary table cannot be opened twice in the same query, and we need to
        -- join the outputs in the summary at the end.
        SET v_table_name = CONCAT('tmp_metrics_', v_output_count);
        CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS ', v_table_name));
        -- Currently information_schema.GLOBAL_STATUS has VARIABLE_VALUE as varchar(1024)
        CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE ', v_table_name, ' (
  Variable_name VARCHAR(193) NOT NULL,
  Variable_value VARCHAR(1024),
  Type VARCHAR(225) NOT NULL,
  Enabled ENUM(''YES'', ''NO'', ''PARTIAL'') NOT NULL,
  PRIMARY KEY (Type, Variable_name)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4'));
        SET @sys.diagnostics.sql = CONCAT(
            'INSERT INTO ', v_table_name,
            ' SELECT Variable_name, REPLACE(Variable_value, ''\n'', ''\\\\n'') AS Variable_value, Type, Enabled FROM sys.metrics'
        );
        CALL sys.execute_prepared_stmt(@sys.diagnostics.sql);
        -- Prepare the query to retrieve the summary
        CALL sys.execute_prepared_stmt(
            CONCAT('(SELECT Variable_value INTO @sys.diagnostics.output_time FROM ', v_table_name, ' WHERE Type = ''System Time'' AND Variable_name = ''UNIX_TIMESTAMP()'')')
        );
        SET v_output_time = @sys.diagnostics.output_time;
        -- Limit each value to v_status_summary_width chars (when v_has_ndb = TRUE the values can be very wide - refer to the output here for the full values)
        -- v_sql_status_summary_select, v_sql_status_summary_delta, v_sql_status_summary_from
        SET v_sql_status_summary_select = CONCAT(v_sql_status_summary_select, ',
       CONCAT(
           LEFT(s', v_output_count, '.Variable_value, ', v_status_summary_width, '),
           IF(', REPLACE(v_no_delta_names, '%{COUNT}', v_output_count), ' AND s', v_output_count, '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'', CONCAT('' ('', ROUND(s', v_output_count, '.Variable_value/', v_output_time, ', 2), ''/sec)''), '''')
       ) AS ''Output ', v_output_count, ''''),
            v_sql_status_summary_from   = CONCAT(v_sql_status_summary_from, '
',
                                                    IF(v_output_count = 1, '  FROM ', '       INNER JOIN '),
                                                    v_table_name, ' s', v_output_count,
                                                    IF (v_output_count = 1, '', ' USING (Type, Variable_name)'));
        IF (v_output_count > 1) THEN
            SET v_sql_status_summary_delta  = CONCAT(v_sql_status_summary_delta, ',
       IF(', REPLACE(v_no_delta_names, '%{COUNT}', v_output_count), ' AND s', (v_output_count-1), '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'' AND s', v_output_count, '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'',
          CONCAT(IF(s', (v_output_count-1), '.Variable_value REGEXP ''^[0-9]+\\\\.[0-9]+$'' OR s', v_output_count, '.Variable_value REGEXP ''^[0-9]+\\\\.[0-9]+$'',
                    ROUND((s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value), 2),
                    (s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value)
                   ),
                 '' ('', ROUND((s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value)/(', v_output_time, '-', v_output_time_prev, '), 2), ''/sec)''
          ),
          ''''
       ) AS ''Delta (', (v_output_count-1), ' -> ', v_output_count, ')''');
        END IF;
        SET v_output_time_prev = v_output_time;
        IF (@sys.diagnostics.include_raw = 'ON') THEN
            SELECT 'SELECT * FROM sys.metrics' AS 'The following output is:';
            -- Ensures that the output here is the same as the one used in the status summary at the end
            CALL sys.execute_prepared_stmt(CONCAT('SELECT Type, Variable_name, Enabled, Variable_value FROM ', v_table_name, ' ORDER BY Type, Variable_name'));
        END IF;
        -- InnoDB
        IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN
            SELECT 'SHOW ENGINE INNODB STATUS' AS 'The following output is:';
            EXECUTE stmt_innodb_status;
            SELECT 'InnoDB - Transactions' AS 'The following output is:';
            SELECT * FROM information_schema.INNODB_TRX;
        END IF;
        -- NDBCluster
        IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
            SELECT 'SHOW ENGINE NDBCLUSTER STATUS' AS 'The following output is:';
            EXECUTE stmt_ndbcluster_status;
            SELECT 'ndbinfo.memoryusage' AS 'The following output is:';
            SELECT node_id, memory_type, format_bytes(used) AS used, used_pages, format_bytes(total) AS total, total_pages,
                   ROUND(100*(used/total), 2) AS 'Used %'
            FROM ndbinfo.memoryusage;
            -- Loop over the ndbinfo tables (except memoryusage which was handled separately above).
            -- The exact tables available are version dependent, so get the list from the Information Schema.
            SET v_done = FALSE;
            OPEN c_ndbinfo;
            c_ndbinfo_loop: LOOP
                FETCH c_ndbinfo INTO v_table_name;
                IF v_done THEN
                LEAVE c_ndbinfo_loop;
                END IF;
                SELECT CONCAT('SELECT * FROM ndbinfo.', v_table_name) AS 'The following output is:';
                CALL sys.execute_prepared_stmt(CONCAT('SELECT * FROM `ndbinfo`.`', v_table_name, '`'));
            END LOOP;
            CLOSE c_ndbinfo;
            SELECT * FROM information_schema.FILES;
        END IF;
        SELECT 'SELECT * FROM sys.processlist' AS 'The following output is:';
        SELECT processlist.* FROM sys.processlist;
        IF (v_has_ps = 'YES') THEN
            -- latest_file_io
            IF (sys.ps_is_consumer_enabled('events_waits_history_long') = 'YES') THEN
                SELECT 'SELECT * FROM sys.latest_file_io' AS 'The following output is:';
                SELECT * FROM sys.latest_file_io;
            END IF;
            -- current memory usage
            IF (EXISTS(SELECT 1 FROM performance_schema.setup_instruments WHERE NAME LIKE 'memory/%' AND ENABLED = 'YES')) THEN
                SELECT 'SELECT * FROM sys.memory_by_host_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_by_host_by_current_bytes;
                SELECT 'SELECT * FROM sys.memory_by_thread_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_by_thread_by_current_bytes;
                SELECT 'SELECT * FROM sys.memory_by_user_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_by_user_by_current_bytes;
                SELECT 'SELECT * FROM sys.memory_global_by_current_bytes' AS 'The following output is:';
                SELECT * FROM sys.memory_global_by_current_bytes;
            END IF;
        END IF;
        SET v_runtime = (UNIX_TIMESTAMP(NOW(2)) - v_start);
    UNTIL (v_runtime + in_interval >= in_max_runtime) END REPEAT;
    -- Get Performance Schema status
    IF (v_has_ps = 'YES') THEN
        SELECT 'SHOW ENGINE PERFORMANCE_SCHEMA STATUS' AS 'The following output is:';
        EXECUTE stmt_ps_status;
    END IF;
    -- Deallocate prepared statements
    IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN
        DEALLOCATE PREPARE stmt_innodb_status;
    END IF;
    IF (v_has_ps = 'YES') THEN
        DEALLOCATE PREPARE stmt_ps_status;
    END IF;
    IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN
        DEALLOCATE PREPARE stmt_ndbcluster_status;
    END IF;
    SELECT '

============================

     Schema Information

============================

' AS '';
    SELECT COUNT(*) AS 'Total Number of Tables' FROM information_schema.TABLES;
    -- The cost of information_schema.TABLES.DATA_LENGTH depends mostly on the number of tables
    IF (@sys.diagnostics.allow_i_s_tables = 'ON') THEN
        SELECT 'Storage Engine Usage' AS 'The following output is:';
        SELECT ENGINE, COUNT(*) AS NUM_TABLES,
                format_bytes(SUM(DATA_LENGTH)) AS DATA_LENGTH,
                format_bytes(SUM(INDEX_LENGTH)) AS INDEX_LENGTH,
                format_bytes(SUM(DATA_LENGTH+INDEX_LENGTH)) AS TOTAL
            FROM information_schema.TABLES
            GROUP BY ENGINE;
        SELECT 'Schema Object Overview' AS 'The following output is:';
        SELECT * FROM sys.schema_object_overview;
        SELECT 'Tables without a PRIMARY KEY' AS 'The following output is:';
        SELECT TABLES.TABLE_SCHEMA, ENGINE, COUNT(*) AS NumTables
          FROM information_schema.TABLES
               LEFT OUTER JOIN information_schema.STATISTICS ON STATISTICS.TABLE_SCHEMA = TABLES.TABLE_SCHEMA
                                                                AND STATISTICS.TABLE_NAME = TABLES.TABLE_NAME
                                                                AND STATISTICS.INDEX_NAME = 'PRIMARY'
         WHERE STATISTICS.TABLE_NAME IS NULL
               AND TABLES.TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys')
               AND TABLES.TABLE_TYPE = 'BASE TABLE'
         GROUP BY TABLES.TABLE_SCHEMA, ENGINE;
    END IF;
    IF (v_has_ps = 'YES') THEN
        SELECT 'Unused Indexes' AS 'The following output is:';
        SELECT object_schema, COUNT(*) AS NumUnusedIndexes
          FROM performance_schema.table_io_waits_summary_by_index_usage
         WHERE index_name IS NOT NULL
               AND count_star = 0
               AND object_schema NOT IN ('mysql', 'sys')
               AND index_name != 'PRIMARY'
         GROUP BY object_schema;
    END IF;
    IF (v_has_ps = 'YES') THEN
        SELECT '

=========================

     Overall Status

=========================

' AS '';
        SELECT 'CALL sys.ps_statement_avg_latency_histogram()' AS 'The following output is:';
        CALL sys.ps_statement_avg_latency_histogram();
        CALL sys.statement_performance_analyzer('snapshot', NULL, NULL);
        CALL sys.statement_performance_analyzer('overall', NULL, 'with_runtimes_in_95th_percentile');
        SET @sys.diagnostics.sql = REPLACE(@sys.diagnostics.sql_gen_query_template, '%{OUTPUT}', 'end');
        IF (@sys.debug = 'ON') THEN
            SELECT 'The following query will be used to generate the query for each sys view' AS 'Debug';
            SELECT @sys.diagnostics.sql AS 'Debug';
        END IF;
        PREPARE stmt_gen_query FROM @sys.diagnostics.sql;
        SET v_done = FALSE;
        OPEN c_sysviews_w_delta;
        c_sysviews_w_delta_loop: LOOP
            FETCH c_sysviews_w_delta INTO v_table_name;
            IF v_done THEN
                LEAVE c_sysviews_w_delta_loop;
            END IF;
            IF (@sys.debug = 'ON') THEN
                SELECT CONCAT('The following queries are for storing the final content of ', v_table_name) AS 'Debug';
            END IF;
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS `tmp_', v_table_name, '_end`'));
            CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE `tmp_', v_table_name, '_end` SELECT * FROM `sys`.`x$', v_table_name, '`'));
            SET @sys.diagnostics.table_name = CONCAT('x$', v_table_name);
            EXECUTE stmt_gen_query USING @sys.diagnostics.table_name;
            -- If necessary add ORDER BY and LIMIT
            SELECT CONCAT(@sys.diagnostics.sql_select,
                            IF(order_by IS NOT NULL, CONCAT('\n ORDER BY ', REPLACE(order_by, '%{TABLE}', CONCAT('tmp_', v_table_name, '_end'))), ''),
                            IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '')
                    )
                INTO @sys.diagnostics.sql_select
                FROM tmp_sys_views_delta
                WHERE TABLE_NAME COLLATE utf8mb4_0900_as_ci = v_table_name;
            SELECT CONCAT('Overall ', v_table_name) AS 'The following output is:';
            CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select);
        END LOOP;
        CLOSE c_sysviews_w_delta;
        DEALLOCATE PREPARE stmt_gen_query;
        SELECT '

======================

     Delta Status

======================

' AS '';
        CALL sys.statement_performance_analyzer('delta', 'tmp_digests_start', 'with_runtimes_in_95th_percentile');
        CALL sys.statement_performance_analyzer('cleanup', NULL, NULL);
        DROP TEMPORARY TABLE tmp_digests_start;
        -- @sys.diagnostics.sql_gen_query_delta is defined near the to together with @sys.diagnostics.sql_gen_query_template
        IF (@sys.debug = 'ON') THEN
            SELECT 'The following query will be used to generate the query for each sys view delta' AS 'Debug';
            SELECT @sys.diagnostics.sql_gen_query_delta AS 'Debug';
        END IF;
        PREPARE stmt_gen_query_delta FROM @sys.diagnostics.sql_gen_query_delta;
        SET v_old_group_concat_max_len = @@session.group_concat_max_len;
        SET @@session.group_concat_max_len = 2048;
        SET v_done = FALSE;
        OPEN c_sysviews_w_delta;
        c_sysviews_w_delta_loop: LOOP
            FETCH c_sysviews_w_delta INTO v_table_name;
            IF v_done THEN
                LEAVE c_sysviews_w_delta_loop;
            END IF;
            SET @sys.diagnostics.table_name = v_table_name;
            EXECUTE stmt_gen_query_delta USING @sys.diagnostics.table_name;
            -- If necessary add WHERE, ORDER BY, and LIMIT
            SELECT CONCAT(@sys.diagnostics.sql_select,
                            IF(where_delta IS NOT NULL, CONCAT('\n WHERE ', where_delta), ''),
                            IF(order_by_delta IS NOT NULL, CONCAT('\n ORDER BY ', order_by_delta), ''),
                            IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '')
                    )
                INTO @sys.diagnostics.sql_select
                FROM tmp_sys_views_delta
                WHERE TABLE_NAME COLLATE utf8mb4_0900_as_ci = v_table_name;
            SELECT CONCAT('Delta ', v_table_name) AS 'The following output is:';
            CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select);
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE `tmp_', v_table_name, '_end`'));
            CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE `tmp_', v_table_name, '_start`'));
        END LOOP;
        CLOSE c_sysviews_w_delta;
        SET @@session.group_concat_max_len = v_old_group_concat_max_len;
        DEALLOCATE PREPARE stmt_gen_query_delta;
        DROP TEMPORARY TABLE tmp_sys_views_delta;
    END IF;
    SELECT 'SELECT * FROM sys.metrics' AS 'The following output is:';
    CALL sys.execute_prepared_stmt(
        CONCAT(v_sql_status_summary_select, v_sql_status_summary_delta, ', Type, s1.Enabled', v_sql_status_summary_from,
               '
 ORDER BY Type, Variable_name'
        )
    );
    -- Remove all the metrics temporary tables again
    SET v_count = 0;
    WHILE (v_count < v_output_count) DO
        SET v_count = v_count + 1;
        SET v_table_name = CONCAT('tmp_metrics_', v_count);
        CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS ', v_table_name));
    END WHILE;
    IF (in_auto_config <> 'current') THEN
        CALL sys.ps_setup_reload_saved();
        IF ((@log_bin = 1) AND (@@binlog_format = 'STATEMENT')) THEN
            SET sql_log_bin = @log_bin;
        END IF;
    END IF;
    -- Reset the @sys.diagnostics.% user variables internal to this procedure
    SET @sys.diagnostics.output_time            = NULL,
        @sys.diagnostics.sql                    = NULL,
        @sys.diagnostics.sql_gen_query_delta    = NULL,
        @sys.diagnostics.sql_gen_query_template = NULL,
        @sys.diagnostics.sql_select             = NULL,
        @sys.diagnostics.table_name             = NULL;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    IF ((@log_bin = 1) AND (@@binlog_format = 'STATEMENT')) THEN
        SET sql_log_bin = @log_bin;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `execute_prepared_stmt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `execute_prepared_stmt`(
        IN in_query longtext CHARACTER SET UTF8MB4
    )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTakes the query in the argument and executes it using a prepared statement. The prepared statement is deallocated,\nso the procedure is mainly useful for executing one off dynamically created queries.\n\nThe sys_execute_prepared_stmt prepared statement name is used for the query and is required not to exist.\n\n\nParameters\n-----------\n\nin_query (longtext CHARACTER SET UTF8MB4):\n  The query to execute.\n\n\nConfiguration Options\n----------------------\n\nsys.debug\n  Whether to provide debugging output.\n  Default is ''OFF''. Set to ''ON'' to include.\n\n\nExample\n--------\n\nmysql> CALL sys.execute_prepared_stmt(''SELECT * FROM sys.sys_config'');\n+------------------------+-------+---------------------+--------+\n| variable               | value | set_time            | set_by |\n+------------------------+-------+---------------------+--------+\n| statement_truncate_len | 64    | 2015-06-30 13:06:00 | NULL   |\n+------------------------+-------+---------------------+--------+\n1 row in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.00 sec)\n'
BEGIN
    -- Set configuration options
    IF (@sys.debug IS NULL) THEN
        SET @sys.debug = sys.sys_get_config('debug', 'OFF');
    END IF;
    -- Verify the query exists
    -- The shortest possible query is "DO 1"
    IF (in_query IS NULL OR LENGTH(in_query) < 4) THEN
       SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = "The @sys.execute_prepared_stmt.sql must contain a query";
    END IF;
    SET @sys.execute_prepared_stmt.sql = in_query;
    IF (@sys.debug = 'ON') THEN
        SELECT @sys.execute_prepared_stmt.sql AS 'Debug';
    END IF;
    PREPARE sys_execute_prepared_stmt FROM @sys.execute_prepared_stmt.sql;
    EXECUTE sys_execute_prepared_stmt;
    DEALLOCATE PREPARE sys_execute_prepared_stmt;
    SET @sys.execute_prepared_stmt.sql = NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_background_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_background_threads`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisable all background thread instrumentation within Performance Schema.\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_disable_background_threads();\n+--------------------------------+\n| summary                        |\n+--------------------------------+\n| Disabled 18 background threads |\n+--------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'NO'
     WHERE type = 'BACKGROUND';
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' background thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_consumer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_consumer`(
        IN consumer VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisables consumers within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nconsumer (VARCHAR(128)):\n  A LIKE pattern match (using "%consumer%") of consumers to disable\n\nExample\n-----------\n\nTo disable all consumers:\n\nmysql> CALL sys.ps_setup_disable_consumer('''');\n+--------------------------+\n| summary                  |\n+--------------------------+\n| Disabled 15 consumers    |\n+--------------------------+\n1 row in set (0.02 sec)\n\nTo disable just the event_stage consumers:\n\nmysql> CALL sys.ps_setup_disable_comsumers(''stage'');\n+------------------------+\n| summary                |\n+------------------------+\n| Disabled 3 consumers   |\n+------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.setup_consumers
       SET enabled = 'NO'
     WHERE name LIKE CONCAT('%', consumer, '%');
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' consumer', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_instrument` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_instrument`(
        IN in_pattern VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisables instruments within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nin_pattern (VARCHAR(128)):\n  A LIKE pattern match (using "%in_pattern%") of events to disable\n\nExample\n-----------\n\nTo disable all mutex instruments:\n\nmysql> CALL sys.ps_setup_disable_instrument(''wait/synch/mutex'');\n+--------------------------+\n| summary                  |\n+--------------------------+\n| Disabled 155 instruments |\n+--------------------------+\n1 row in set (0.02 sec)\n\nTo disable just a specific TCP/IP based network IO instrument:\n\nmysql> CALL sys.ps_setup_disable_instrument(''wait/io/socket/sql/server_tcpip_socket'');\n+------------------------+\n| summary                |\n+------------------------+\n| Disabled 1 instruments |\n+------------------------+\n1 row in set (0.00 sec)\n\nTo disable all instruments:\n\nmysql> CALL sys.ps_setup_disable_instrument('''');\n+--------------------------+\n| summary                  |\n+--------------------------+\n| Disabled 547 instruments |\n+--------------------------+\n1 row in set (0.01 sec)\n'
BEGIN
    UPDATE performance_schema.setup_instruments
       SET enabled = 'NO', timed = 'NO'
     WHERE name LIKE CONCAT('%', in_pattern, '%');
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' instrument', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_disable_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_thread`(
        IN in_connection_id BIGINT
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDisable the given connection/thread in Performance Schema.\n\nParameters\n-----------\n\nin_connection_id (BIGINT):\n  The connection ID (PROCESSLIST_ID from performance_schema.threads\n  or the ID shown within SHOW PROCESSLIST)\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_disable_thread(3);\n+-------------------+\n| summary           |\n+-------------------+\n| Disabled 1 thread |\n+-------------------+\n1 row in set (0.01 sec)\n\nTo disable the current connection:\n\nmysql> CALL sys.ps_setup_disable_thread(CONNECTION_ID());\n+-------------------+\n| summary           |\n+-------------------+\n| Disabled 1 thread |\n+-------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'NO'
     WHERE processlist_id = in_connection_id;
    SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_background_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_background_threads`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnable all background thread instrumentation within Performance Schema.\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_enable_background_threads();\n+-------------------------------+\n| summary                       |\n+-------------------------------+\n| Enabled 18 background threads |\n+-------------------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'YES'
     WHERE type = 'BACKGROUND';
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' background thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_consumer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_consumer`(
        IN consumer VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnables consumers within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nconsumer (VARCHAR(128)):\n  A LIKE pattern match (using "%consumer%") of consumers to enable\n\nExample\n-----------\n\nTo enable all consumers:\n\nmysql> CALL sys.ps_setup_enable_consumer('''');\n+-------------------------+\n| summary                 |\n+-------------------------+\n| Enabled 10 consumers    |\n+-------------------------+\n1 row in set (0.02 sec)\n\nQuery OK, 0 rows affected (0.02 sec)\n\nTo enable just "waits" consumers:\n\nmysql> CALL sys.ps_setup_enable_consumer(''waits'');\n+-----------------------+\n| summary               |\n+-----------------------+\n| Enabled 3 consumers   |\n+-----------------------+\n1 row in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.setup_consumers
       SET enabled = 'YES'
     WHERE name LIKE CONCAT('%', consumer, '%');
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' consumer', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_instrument` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_instrument`(
        IN in_pattern VARCHAR(128)
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnables instruments within Performance Schema \nmatching the input pattern.\n\nParameters\n-----------\n\nin_pattern (VARCHAR(128)):\n  A LIKE pattern match (using "%in_pattern%") of events to enable\n\nExample\n-----------\n\nTo enable all mutex instruments:\n\nmysql> CALL sys.ps_setup_enable_instrument(''wait/synch/mutex'');\n+-------------------------+\n| summary                 |\n+-------------------------+\n| Enabled 155 instruments |\n+-------------------------+\n1 row in set (0.02 sec)\n\nQuery OK, 0 rows affected (0.02 sec)\n\nTo enable just a specific TCP/IP based network IO instrument:\n\nmysql> CALL sys.ps_setup_enable_instrument(''wait/io/socket/sql/server_tcpip_socket'');\n+-----------------------+\n| summary               |\n+-----------------------+\n| Enabled 1 instruments |\n+-----------------------+\n1 row in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.00 sec)\n\nTo enable all instruments:\n\nmysql> CALL sys.ps_setup_enable_instrument('''');\n+-------------------------+\n| summary                 |\n+-------------------------+\n| Enabled 547 instruments |\n+-------------------------+\n1 row in set (0.01 sec)\n\nQuery OK, 0 rows affected (0.01 sec)\n'
BEGIN
    UPDATE performance_schema.setup_instruments
       SET enabled = 'YES', timed = 'YES'
     WHERE name LIKE CONCAT('%', in_pattern, '%');
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' instrument', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_enable_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_thread`(
        IN in_connection_id BIGINT
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nEnable the given connection/thread in Performance Schema.\n\nParameters\n-----------\n\nin_connection_id (BIGINT):\n  The connection ID (PROCESSLIST_ID from performance_schema.threads\n  or the ID shown within SHOW PROCESSLIST)\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_enable_thread(3);\n+------------------+\n| summary          |\n+------------------+\n| Enabled 1 thread |\n+------------------+\n1 row in set (0.01 sec)\n\nTo enable the current connection:\n\nmysql> CALL sys.ps_setup_enable_thread(CONNECTION_ID());\n+------------------+\n| summary          |\n+------------------+\n| Enabled 1 thread |\n+------------------+\n1 row in set (0.00 sec)\n'
BEGIN
    UPDATE performance_schema.threads
       SET instrumented = 'YES'
     WHERE processlist_id = in_connection_id;
    SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' thread', IF(@rows != 1, 's', '')) AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_reload_saved` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_reload_saved`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nReloads a saved Performance Schema configuration,\nso that you can alter the setup for debugging purposes, \nbut restore it to a previous state.\n\nUse the companion procedure - ps_setup_save(), to \nsave a configuration.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_save();\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> UPDATE performance_schema.setup_instruments SET enabled = ''YES'', timed = ''YES'';\nQuery OK, 547 rows affected (0.40 sec)\nRows matched: 784  Changed: 547  Warnings: 0\n\n/* Run some tests that need more detailed instrumentation here */\n\nmysql> CALL sys.ps_setup_reload_saved();\nQuery OK, 0 rows affected (0.32 sec)\n'
BEGIN
    DECLARE v_done bool DEFAULT FALSE;
    DECLARE v_lock_result INT;
    DECLARE v_lock_used_by BIGINT;
    DECLARE v_signal_message TEXT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SIGNAL SQLSTATE VALUE '90001'
           SET MESSAGE_TEXT = 'An error occurred, was sys.ps_setup_save() run before this procedure?';
    END;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    SELECT IS_USED_LOCK('sys.ps_setup_save') INTO v_lock_used_by;
    IF (v_lock_used_by != CONNECTION_ID()) THEN
        SET v_signal_message = CONCAT('The sys.ps_setup_save lock is currently owned by ', v_lock_used_by);
        SIGNAL SQLSTATE VALUE '90002'
           SET MESSAGE_TEXT = v_signal_message;
    END IF;
    DELETE FROM performance_schema.setup_actors;
    INSERT INTO performance_schema.setup_actors SELECT * FROM tmp_setup_actors;
    BEGIN
        -- Workaround for http://bugs.mysql.com/bug.php?id=70025
        DECLARE v_name varchar(64);
        DECLARE v_enabled enum('YES', 'NO');
        DECLARE c_consumers CURSOR FOR SELECT NAME, ENABLED FROM tmp_setup_consumers;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
        SET v_done = FALSE;
        OPEN c_consumers;
        c_consumers_loop: LOOP
            FETCH c_consumers INTO v_name, v_enabled;
            IF v_done THEN
               LEAVE c_consumers_loop;
            END IF;
            UPDATE performance_schema.setup_consumers
               SET ENABLED = v_enabled
             WHERE NAME = v_name;
         END LOOP;
         CLOSE c_consumers;
    END;
    UPDATE performance_schema.setup_instruments
     INNER JOIN tmp_setup_instruments USING (NAME)
       SET performance_schema.setup_instruments.ENABLED = tmp_setup_instruments.ENABLED,
           performance_schema.setup_instruments.TIMED   = tmp_setup_instruments.TIMED;
    BEGIN
        -- Workaround for http://bugs.mysql.com/bug.php?id=70025
        DECLARE v_thread_id bigint unsigned;
        DECLARE v_instrumented enum('YES', 'NO');
        DECLARE c_threads CURSOR FOR SELECT THREAD_ID, INSTRUMENTED FROM tmp_threads;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
        SET v_done = FALSE;
        OPEN c_threads;
        c_threads_loop: LOOP
            FETCH c_threads INTO v_thread_id, v_instrumented;
            IF v_done THEN
               LEAVE c_threads_loop;
            END IF;
            UPDATE performance_schema.threads
               SET INSTRUMENTED = v_instrumented
             WHERE THREAD_ID = v_thread_id;
        END LOOP;
        CLOSE c_threads;
    END;
    UPDATE performance_schema.threads
       SET INSTRUMENTED = IF(PROCESSLIST_USER IS NOT NULL,
                             sys.ps_is_account_enabled(PROCESSLIST_HOST, PROCESSLIST_USER),
                             'YES')
     WHERE THREAD_ID NOT IN (SELECT THREAD_ID FROM tmp_threads);
    DROP TEMPORARY TABLE tmp_setup_actors;
    DROP TEMPORARY TABLE tmp_setup_consumers;
    DROP TEMPORARY TABLE tmp_setup_instruments;
    DROP TEMPORARY TABLE tmp_threads;
    SELECT RELEASE_LOCK('sys.ps_setup_save') INTO v_lock_result;
    SET sql_log_bin = @log_bin; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_reset_to_default` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_reset_to_default`(
       IN in_verbose BOOLEAN
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nResets the Performance Schema setup to the default settings.\n\nParameters\n-----------\n\nin_verbose (BOOLEAN):\n  Whether to print each setup stage (including the SQL) whilst running.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_reset_to_default(true)\\G\n*************************** 1. row ***************************\nstatus: Resetting: setup_actors\nDELETE\nFROM performance_schema.setup_actors\n WHERE NOT (HOST = ''%'' AND USER = ''%'' AND `ROLE` = ''%'')\n1 row in set (0.00 sec)\n\n*************************** 1. row ***************************\nstatus: Resetting: setup_actors\nINSERT IGNORE INTO performance_schema.setup_actors\nVALUES (''%'', ''%'', ''%'')\n1 row in set (0.00 sec)\n...\n\nmysql> CALL sys.ps_setup_reset_to_default(false)\\G\nQuery OK, 0 rows affected (0.00 sec)\n'
BEGIN
    SET @query = 'DELETE
                    FROM performance_schema.setup_actors
                   WHERE NOT (HOST = ''%'' AND USER = ''%'' AND `ROLE` = ''%'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_actors\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'INSERT IGNORE INTO performance_schema.setup_actors
                  VALUES (''%'', ''%'', ''%'', ''YES'', ''YES'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_actors\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'UPDATE performance_schema.setup_instruments
                     SET ENABLED = sys.ps_is_instrument_default_enabled(NAME),
                         TIMED   = sys.ps_is_instrument_default_timed(NAME)';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_instruments\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'UPDATE performance_schema.setup_consumers
                     SET ENABLED = IF(NAME IN (''events_statements_current'', ''events_transactions_current'', ''global_instrumentation'', ''thread_instrumentation'', ''statements_digest''), ''YES'', ''NO'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_consumers\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'DELETE
                    FROM performance_schema.setup_objects
                   WHERE NOT (OBJECT_TYPE IN (''EVENT'', ''FUNCTION'', ''PROCEDURE'', ''TABLE'', ''TRIGGER'') AND OBJECT_NAME = ''%'' 
                     AND (OBJECT_SCHEMA = ''mysql''              AND ENABLED = ''NO''  AND TIMED = ''NO'' )
                      OR (OBJECT_SCHEMA = ''performance_schema'' AND ENABLED = ''NO''  AND TIMED = ''NO'' )
                      OR (OBJECT_SCHEMA = ''information_schema'' AND ENABLED = ''NO''  AND TIMED = ''NO'' )
                      OR (OBJECT_SCHEMA = ''%''                  AND ENABLED = ''YES'' AND TIMED = ''YES''))';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_objects\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'INSERT IGNORE INTO performance_schema.setup_objects
                  VALUES (''EVENT''    , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''EVENT''    , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''EVENT''    , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''EVENT''    , ''%''                 , ''%'', ''YES'', ''YES''),
                         (''FUNCTION'' , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''FUNCTION'' , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''FUNCTION'' , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''FUNCTION'' , ''%''                 , ''%'', ''YES'', ''YES''),
                         (''PROCEDURE'', ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''PROCEDURE'', ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''PROCEDURE'', ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''PROCEDURE'', ''%''                 , ''%'', ''YES'', ''YES''),
                         (''TABLE''    , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''TABLE''    , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TABLE''    , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TABLE''    , ''%''                 , ''%'', ''YES'', ''YES''),
                         (''TRIGGER''  , ''mysql''             , ''%'', ''NO'' , ''NO'' ),
                         (''TRIGGER''  , ''performance_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TRIGGER''  , ''information_schema'', ''%'', ''NO'' , ''NO'' ),
                         (''TRIGGER''  , ''%''                 , ''%'', ''YES'', ''YES'')';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: setup_objects\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
    SET @query = 'UPDATE performance_schema.threads
                     SET INSTRUMENTED = ''YES''';
    IF (in_verbose) THEN
        SELECT CONCAT('Resetting: threads\n', REPLACE(@query, '  ', '')) AS status;
    END IF;
    PREPARE reset_stmt FROM @query;
    EXECUTE reset_stmt;
    DEALLOCATE PREPARE reset_stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_save`(
        IN in_timeout INT
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nSaves the current configuration of Performance Schema, \nso that you can alter the setup for debugging purposes, \nbut restore it to a previous state.\n\nUse the companion procedure - ps_setup_reload_saved(), to \nrestore the saved config.\n\nThe named lock "sys.ps_setup_save" is taken before the\ncurrent configuration is saved. If the attempt to get the named\nlock times out, an error occurs.\n\nThe lock is released after the settings have been restored by\ncalling ps_setup_reload_saved().\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_timeout INT\n  The timeout in seconds used when trying to obtain the lock.\n  A negative timeout means infinite timeout.\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_save(-1);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> UPDATE performance_schema.setup_instruments \n    ->    SET enabled = ''YES'', timed = ''YES'';\nQuery OK, 547 rows affected (0.40 sec)\nRows matched: 784  Changed: 547  Warnings: 0\n\n/* Run some tests that need more detailed instrumentation here */\n\nmysql> CALL sys.ps_setup_reload_saved();\nQuery OK, 0 rows affected (0.32 sec)\n'
BEGIN
    DECLARE v_lock_result INT;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    SELECT GET_LOCK('sys.ps_setup_save', in_timeout) INTO v_lock_result;
    IF v_lock_result THEN
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_actors;
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_consumers;
        DROP TEMPORARY TABLE IF EXISTS tmp_setup_instruments;
        DROP TEMPORARY TABLE IF EXISTS tmp_threads;
        CREATE TEMPORARY TABLE tmp_setup_actors SELECT * FROM performance_schema.setup_actors LIMIT 0;
        CREATE TEMPORARY TABLE tmp_setup_consumers LIKE performance_schema.setup_consumers;
        CREATE TEMPORARY TABLE tmp_setup_instruments LIKE performance_schema.setup_instruments;
        CREATE TEMPORARY TABLE tmp_threads (THREAD_ID bigint unsigned NOT NULL PRIMARY KEY, INSTRUMENTED enum('YES','NO') NOT NULL);
        INSERT INTO tmp_setup_actors SELECT * FROM performance_schema.setup_actors;
        INSERT INTO tmp_setup_consumers SELECT * FROM performance_schema.setup_consumers;
        INSERT INTO tmp_setup_instruments SELECT * FROM performance_schema.setup_instruments;
        INSERT INTO tmp_threads SELECT THREAD_ID, INSTRUMENTED FROM performance_schema.threads;
    ELSE
        SIGNAL SQLSTATE VALUE '90000'
           SET MESSAGE_TEXT = 'Could not lock the sys.ps_setup_save user lock, another thread has a saved configuration';
    END IF;
    SET sql_log_bin = @log_bin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_disabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled`(
        IN in_show_instruments BOOLEAN,
        IN in_show_threads BOOLEAN
    )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently disable Performance Schema configuration.\n\nDisabled users is only available for MySQL 5.7.6 and later.\nIn earlier versions it was only possible to enable users.\n\nParameters\n-----------\n\nin_show_instruments (BOOLEAN):\n  Whether to print disabled instruments (can print many items)\n\nin_show_threads (BOOLEAN):\n  Whether to print disabled threads\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_disabled(TRUE, TRUE);\n+----------------------------+\n| performance_schema_enabled |\n+----------------------------+\n|                          1 |\n+----------------------------+\n1 row in set (0.00 sec)\n\n+--------------------+\n| disabled_users     |\n+--------------------+\n| ''mark''@''localhost'' |\n+--------------------+\n1 row in set (0.00 sec)\n\n+-------------+----------------------+---------+-------+\n| object_type | objects              | enabled | timed |\n+-------------+----------------------+---------+-------+\n| EVENT       | mysql.%              | NO      | NO    |\n| EVENT       | performance_schema.% | NO      | NO    |\n| EVENT       | information_schema.% | NO      | NO    |\n| FUNCTION    | mysql.%              | NO      | NO    |\n| FUNCTION    | performance_schema.% | NO      | NO    |\n| FUNCTION    | information_schema.% | NO      | NO    |\n| PROCEDURE   | mysql.%              | NO      | NO    |\n| PROCEDURE   | performance_schema.% | NO      | NO    |\n| PROCEDURE   | information_schema.% | NO      | NO    |\n| TABLE       | mysql.%              | NO      | NO    |\n| TABLE       | performance_schema.% | NO      | NO    |\n| TABLE       | information_schema.% | NO      | NO    |\n| TRIGGER     | mysql.%              | NO      | NO    |\n| TRIGGER     | performance_schema.% | NO      | NO    |\n| TRIGGER     | information_schema.% | NO      | NO    |\n+-------------+----------------------+---------+-------+\n15 rows in set (0.00 sec)\n\n+----------------------------------+\n| disabled_consumers               |\n+----------------------------------+\n| events_stages_current            |\n| events_stages_history            |\n| events_stages_history_long       |\n| events_statements_history        |\n| events_statements_history_long   |\n| events_transactions_history      |\n| events_transactions_history_long |\n| events_waits_current             |\n| events_waits_history             |\n| events_waits_history_long        |\n+----------------------------------+\n10 rows in set (0.00 sec)\n\nEmpty set (0.00 sec)\n\n+---------------------------------------------------------------------------------------+-------+\n| disabled_instruments                                                                  | timed |\n+---------------------------------------------------------------------------------------+-------+\n| wait/synch/mutex/sql/TC_LOG_MMAP::LOCK_tc                                             | NO    |\n| wait/synch/mutex/sql/LOCK_des_key_file                                                | NO    |\n| wait/synch/mutex/sql/MYSQL_BIN_LOG::LOCK_commit                                       | NO    |\n...\n| memory/sql/servers_cache                                                              | NO    |\n| memory/sql/udf_mem                                                                    | NO    |\n| wait/lock/metadata/sql/mdl                                                            | NO    |\n+---------------------------------------------------------------------------------------+-------+\n547 rows in set (0.00 sec)\n\nQuery OK, 0 rows affected (0.01 sec)\n'
BEGIN
    SELECT @@performance_schema AS performance_schema_enabled;
    SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS disabled_users
      FROM performance_schema.setup_actors
     WHERE enabled = 'NO'
     ORDER BY disabled_users;
    SELECT object_type,
           CONCAT(object_schema, '.', object_name) AS objects,
           enabled,
           timed
      FROM performance_schema.setup_objects
     WHERE enabled = 'NO'
     ORDER BY object_type, objects;
    SELECT name AS disabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'NO'
     ORDER BY disabled_consumers;
    IF (in_show_threads) THEN
        SELECT IF(name = 'thread/sql/one_connection', 
                  CONCAT(processlist_user, '@', processlist_host), 
                  REPLACE(name, 'thread/', '')) AS disabled_threads,
        TYPE AS thread_type
          FROM performance_schema.threads
         WHERE INSTRUMENTED = 'NO'
         ORDER BY disabled_threads;
    END IF;
    IF (in_show_instruments) THEN
        SELECT name AS disabled_instruments,
               timed
          FROM performance_schema.setup_instruments
         WHERE enabled = 'NO'
         ORDER BY disabled_instruments;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_disabled_consumers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled_consumers`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently disabled consumers.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_disabled_consumers();\n\n+---------------------------+\n| disabled_consumers        |\n+---------------------------+\n| events_statements_current |\n| global_instrumentation    |\n| thread_instrumentation    |\n| statements_digest         |\n+---------------------------+\n4 rows in set (0.05 sec)\n'
BEGIN
    SELECT name AS disabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'NO'
     ORDER BY disabled_consumers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_disabled_instruments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled_instruments`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently disabled instruments.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_disabled_instruments();\n'
BEGIN
    SELECT name AS disabled_instruments, timed
      FROM performance_schema.setup_instruments
     WHERE enabled = 'NO'
     ORDER BY disabled_instruments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_enabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled`(
        IN in_show_instruments BOOLEAN,
        IN in_show_threads BOOLEAN
    )
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently enabled Performance Schema configuration.\n\nParameters\n-----------\n\nin_show_instruments (BOOLEAN):\n  Whether to print enabled instruments (can print many items)\n\nin_show_threads (BOOLEAN):\n  Whether to print enabled threads\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_enabled(TRUE, TRUE);\n+----------------------------+\n| performance_schema_enabled |\n+----------------------------+\n|                          1 |\n+----------------------------+\n1 row in set (0.00 sec)\n\n+---------------+\n| enabled_users |\n+---------------+\n| ''%''@''%''       |\n+---------------+\n1 row in set (0.01 sec)\n\n+-------------+---------+---------+-------+\n| object_type | objects | enabled | timed |\n+-------------+---------+---------+-------+\n| EVENT       | %.%     | YES     | YES   |\n| FUNCTION    | %.%     | YES     | YES   |\n| PROCEDURE   | %.%     | YES     | YES   |\n| TABLE       | %.%     | YES     | YES   |\n| TRIGGER     | %.%     | YES     | YES   |\n+-------------+---------+---------+-------+\n5 rows in set (0.01 sec)\n\n+---------------------------+\n| enabled_consumers         |\n+---------------------------+\n| events_statements_current |\n| global_instrumentation    |\n| thread_instrumentation    |\n| statements_digest         |\n+---------------------------+\n4 rows in set (0.05 sec)\n\n+---------------------------------+-------------+\n| enabled_threads                 | thread_type |\n+---------------------------------+-------------+\n| sql/main                        | BACKGROUND  |\n| sql/thread_timer_notifier       | BACKGROUND  |\n| innodb/io_ibuf_thread           | BACKGROUND  |\n| innodb/io_log_thread            | BACKGROUND  |\n| innodb/io_read_thread           | BACKGROUND  |\n| innodb/io_read_thread           | BACKGROUND  |\n| innodb/io_write_thread          | BACKGROUND  |\n| innodb/io_write_thread          | BACKGROUND  |\n| innodb/page_cleaner_thread      | BACKGROUND  |\n| innodb/srv_lock_timeout_thread  | BACKGROUND  |\n| innodb/srv_error_monitor_thread | BACKGROUND  |\n| innodb/srv_monitor_thread       | BACKGROUND  |\n| innodb/srv_master_thread        | BACKGROUND  |\n| innodb/srv_purge_thread         | BACKGROUND  |\n| innodb/srv_worker_thread        | BACKGROUND  |\n| innodb/srv_worker_thread        | BACKGROUND  |\n| innodb/srv_worker_thread        | BACKGROUND  |\n| innodb/buf_dump_thread          | BACKGROUND  |\n| innodb/dict_stats_thread        | BACKGROUND  |\n| sql/signal_handler              | BACKGROUND  |\n| sql/compress_gtid_table         | FOREGROUND  |\n| root@localhost                  | FOREGROUND  |\n+---------------------------------+-------------+\n22 rows in set (0.01 sec)\n\n+-------------------------------------+-------+\n| enabled_instruments                 | timed |\n+-------------------------------------+-------+\n| wait/io/file/sql/map                | YES   |\n| wait/io/file/sql/binlog             | YES   |\n...\n| statement/com/Error                 | YES   |\n| statement/com/                      | YES   |\n| idle                                | YES   |\n+-------------------------------------+-------+\n210 rows in set (0.08 sec)\n\nQuery OK, 0 rows affected (0.89 sec)\n'
BEGIN
    SELECT @@performance_schema AS performance_schema_enabled;
    SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS enabled_users
      FROM performance_schema.setup_actors
     WHERE enabled = 'YES'
     ORDER BY enabled_users;
    SELECT object_type,
           CONCAT(object_schema, '.', object_name) AS objects,
           enabled,
           timed
      FROM performance_schema.setup_objects
     WHERE enabled = 'YES'
     ORDER BY object_type, objects;
    SELECT name AS enabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'YES'
     ORDER BY enabled_consumers;
    IF (in_show_threads) THEN
        SELECT IF(name = 'thread/sql/one_connection', 
                  CONCAT(processlist_user, '@', processlist_host), 
                  REPLACE(name, 'thread/', '')) AS enabled_threads,
        TYPE AS thread_type
          FROM performance_schema.threads
         WHERE INSTRUMENTED = 'YES'
         ORDER BY enabled_threads;
    END IF;
    IF (in_show_instruments) THEN
        SELECT name AS enabled_instruments,
               timed
          FROM performance_schema.setup_instruments
         WHERE enabled = 'YES'
         ORDER BY enabled_instruments;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_enabled_consumers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled_consumers`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently enabled consumers.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_enabled_consumers();\n\n+---------------------------+\n| enabled_consumers         |\n+---------------------------+\n| events_statements_current |\n| global_instrumentation    |\n| thread_instrumentation    |\n| statements_digest         |\n+---------------------------+\n4 rows in set (0.05 sec)\n'
BEGIN
    SELECT name AS enabled_consumers
      FROM performance_schema.setup_consumers
     WHERE enabled = 'YES'
     ORDER BY enabled_consumers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_setup_show_enabled_instruments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled_instruments`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nShows all currently enabled instruments.\n\nParameters\n-----------\n\nNone\n\nExample\n-----------\n\nmysql> CALL sys.ps_setup_show_enabled_instruments();\n'
BEGIN
    SELECT name AS enabled_instruments, timed
      FROM performance_schema.setup_instruments
     WHERE enabled = 'YES'
     ORDER BY enabled_instruments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_statement_avg_latency_histogram` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_statement_avg_latency_histogram`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nOutputs a textual histogram graph of the average latency values\nacross all normalized queries tracked within the Performance Schema\nevents_statements_summary_by_digest table.\n\nCan be used to show a very high level picture of what kind of \nlatency distribution statements running within this instance have.\n\nParameters\n-----------\n\nNone.\n\nExample\n-----------\n\nmysql> CALL sys.ps_statement_avg_latency_histogram()\\G\n*************************** 1. row ***************************\nPerformance Schema Statement Digest Average Latency Histogram:\n\n  . = 1 unit\n  * = 2 units\n  # = 3 units\n\n(0 - 38ms)     240 | ################################################################################\n(38 - 77ms)    38  | ......................................\n(77 - 115ms)   3   | ...\n(115 - 154ms)  62  | *******************************\n(154 - 192ms)  3   | ...\n(192 - 231ms)  0   |\n(231 - 269ms)  0   |\n(269 - 307ms)  0   |\n(307 - 346ms)  0   |\n(346 - 384ms)  1   | .\n(384 - 423ms)  1   | .\n(423 - 461ms)  0   |\n(461 - 499ms)  0   |\n(499 - 538ms)  0   |\n(538 - 576ms)  0   |\n(576 - 615ms)  1   | .\n\n  Total Statements: 350; Buckets: 16; Bucket Size: 38 ms;\n'
BEGIN
SELECT CONCAT('\n',
       '\n  . = 1 unit',
       '\n  * = 2 units',
       '\n  # = 3 units\n',
       @label := CONCAT(@label_inner := CONCAT('\n(0 - ',
                                               ROUND((@bucket_size := (SELECT ROUND((MAX(avg_us) - MIN(avg_us)) / (@buckets := 16)) AS size
                                                                         FROM sys.x$ps_digest_avg_latency_distribution)) / (@unit_div := 1000)),
                                                (@unit := 'ms'), ')'),
                        REPEAT(' ', (@max_label_size := ((1 + LENGTH(ROUND((@bucket_size * 15) / @unit_div)) + 3 + LENGTH(ROUND(@bucket_size * 16) / @unit_div)) + 1)) - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us <= @bucket_size), 0)),
       REPEAT(' ', (@max_label_len := (@max_label_size + LENGTH((@total_queries := (SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution)))) + 1) - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < (@one_unit := 40), '.', IF(@count_in_bucket < (@two_unit := 80), '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND(@bucket_size / @unit_div), ' - ', ROUND((@bucket_size * 2) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size AND b1.avg_us <= @bucket_size * 2), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 2) / @unit_div), ' - ', ROUND((@bucket_size * 3) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 2 AND b1.avg_us <= @bucket_size * 3), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 3) / @unit_div), ' - ', ROUND((@bucket_size * 4) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 3 AND b1.avg_us <= @bucket_size * 4), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 4) / @unit_div), ' - ', ROUND((@bucket_size * 5) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 4 AND b1.avg_us <= @bucket_size * 5), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 5) / @unit_div), ' - ', ROUND((@bucket_size * 6) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 5 AND b1.avg_us <= @bucket_size * 6), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 6) / @unit_div), ' - ', ROUND((@bucket_size * 7) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 6 AND b1.avg_us <= @bucket_size * 7), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 7) / @unit_div), ' - ', ROUND((@bucket_size * 8) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 7 AND b1.avg_us <= @bucket_size * 8), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 8) / @unit_div), ' - ', ROUND((@bucket_size * 9) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 8 AND b1.avg_us <= @bucket_size * 9), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 9) / @unit_div), ' - ', ROUND((@bucket_size * 10) / @unit_div), @unit, ')'),
                         REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                         @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                       FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                      WHERE b1.avg_us > @bucket_size * 9 AND b1.avg_us <= @bucket_size * 10), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 10) / @unit_div), ' - ', ROUND((@bucket_size * 11) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 10 AND b1.avg_us <= @bucket_size * 11), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 11) / @unit_div), ' - ', ROUND((@bucket_size * 12) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 11 AND b1.avg_us <= @bucket_size * 12), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 12) / @unit_div), ' - ', ROUND((@bucket_size * 13) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 12 AND b1.avg_us <= @bucket_size * 13), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 13) / @unit_div), ' - ', ROUND((@bucket_size * 14) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 13 AND b1.avg_us <= @bucket_size * 14), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 14) / @unit_div), ' - ', ROUND((@bucket_size * 15) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 14 AND b1.avg_us <= @bucket_size * 15), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 15) / @unit_div), ' - ', ROUND((@bucket_size * 16) / @unit_div), @unit, ')'),
                        REPEAT(' ', @max_label_size - LENGTH(@label_inner)),
                        @count_in_bucket := IFNULL((SELECT SUM(cnt)
                                                      FROM sys.x$ps_digest_avg_latency_distribution AS b1 
                                                     WHERE b1.avg_us > @bucket_size * 15 AND b1.avg_us <= @bucket_size * 16), 0)),
       REPEAT(' ', @max_label_len - LENGTH(@label)), '| ',
       IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')), 
       	             IF(@count_in_bucket < @one_unit, @count_in_bucket,
       	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),
       '\n\n  Total Statements: ', @total_queries, '; Buckets: ', @buckets , '; Bucket Size: ', ROUND(@bucket_size / @unit_div) , ' ', @unit, ';\n'
      ) AS `Performance Schema Statement Digest Average Latency Histogram`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_trace_statement_digest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_trace_statement_digest`(
        IN in_digest VARCHAR(64),
        IN in_runtime INT,
        IN in_interval DECIMAL(2,2),
        IN in_start_fresh BOOLEAN,
        IN in_auto_enable BOOLEAN
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTraces all instrumentation within Performance Schema for a specific\nStatement Digest.\n\nWhen finding a statement of interest within the\nperformance_schema.events_statements_summary_by_digest table, feed\nthe DIGEST value in to this procedure, set how long to poll for,\nand at what interval to poll, and it will generate a report of all\nstatistics tracked within Performance Schema for that digest for the\ninterval.\n\nIt will also attempt to generate an EXPLAIN for the longest running\nexample of the digest during the interval. Note this may fail, as:\n\n   * Performance Schema truncates long SQL_TEXT values (and hence the\n     EXPLAIN will fail due to parse errors)\n   * the default schema is sys (so tables that are not fully qualified\n     in the query may not be found)\n   * some queries such as SHOW are not supported in EXPLAIN.\n\nWhen the EXPLAIN fails, the error will be ignored and no EXPLAIN\noutput generated.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_digest (VARCHAR(64)):\n  The statement digest identifier you would like to analyze\nin_runtime (INT):\n  The number of seconds to run analysis for\nin_interval (DECIMAL(2,2)):\n  The interval (in seconds, may be fractional) at which to try\n  and take snapshots\nin_start_fresh (BOOLEAN):\n  Whether to TRUNCATE the events_statements_history_long and\n  events_stages_history_long tables before starting\nin_auto_enable (BOOLEAN):\n  Whether to automatically turn on required consumers\n\nExample\n-----------\n\nmysql> call ps_trace_statement_digest(''891ec6860f98ba46d89dd20b0c03652c'', 10, 0.1, true, true);\n+--------------------+\n| SUMMARY STATISTICS |\n+--------------------+\n| SUMMARY STATISTICS |\n+--------------------+\n1 row in set (9.11 sec)\n\n+------------+-----------+-----------+-----------+---------------+------------+------------+\n| executions | exec_time | lock_time | rows_sent | rows_examined | tmp_tables | full_scans |\n+------------+-----------+-----------+-----------+---------------+------------+------------+\n|         21 | 4.11 ms   | 2.00 ms   |         0 |            21 |          0 |          0 |\n+------------+-----------+-----------+-----------+---------------+------------+------------+\n1 row in set (9.11 sec)\n\n+------------------------------------------+-------+-----------+\n| event_name                               | count | latency   |\n+------------------------------------------+-------+-----------+\n| stage/sql/checking query cache for query |    16 | 724.37 us |\n| stage/sql/statistics                     |    16 | 546.92 us |\n| stage/sql/freeing items                  |    18 | 520.11 us |\n| stage/sql/init                           |    51 | 466.80 us |\n...\n| stage/sql/cleaning up                    |    18 | 11.92 us  |\n| stage/sql/executing                      |    16 | 6.95 us   |\n+------------------------------------------+-------+-----------+\n17 rows in set (9.12 sec)\n\n+---------------------------+\n| LONGEST RUNNING STATEMENT |\n+---------------------------+\n| LONGEST RUNNING STATEMENT |\n+---------------------------+\n1 row in set (9.16 sec)\n\n+-----------+-----------+-----------+-----------+---------------+------------+-----------+\n| thread_id | exec_time | lock_time | rows_sent | rows_examined | tmp_tables | full_scan |\n+-----------+-----------+-----------+-----------+---------------+------------+-----------+\n|    166646 | 618.43 us | 1.00 ms   |         0 |             1 |          0 |         0 |\n+-----------+-----------+-----------+-----------+---------------+------------+-----------+\n1 row in set (9.16 sec)\n\n// Truncated for clarity...\n+-----------------------------------------------------------------+\n| sql_text                                                        |\n+-----------------------------------------------------------------+\n| select hibeventhe0_.id as id1382_, hibeventhe0_.createdTime ... |\n+-----------------------------------------------------------------+\n1 row in set (9.17 sec)\n\n+------------------------------------------+-----------+\n| event_name                               | latency   |\n+------------------------------------------+-----------+\n| stage/sql/init                           | 8.61 us   |\n| stage/sql/Waiting for query cache lock   | 453.23 us |\n| stage/sql/init                           | 331.07 ns |\n| stage/sql/checking query cache for query | 43.04 us  |\n...\n| stage/sql/freeing items                  | 30.46 us  |\n| stage/sql/cleaning up                    | 662.13 ns |\n+------------------------------------------+-----------+\n18 rows in set (9.23 sec)\n\n+----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n| id | select_type | table        | type  | possible_keys | key       | key_len | ref         | rows | Extra |\n+----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n|  1 | SIMPLE      | hibeventhe0_ | const | fixedTime     | fixedTime | 775     | const,const |    1 | NULL  |\n+----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n1 row in set (9.27 sec)\n\nQuery OK, 0 rows affected (9.28 sec)\n'
BEGIN
    DECLARE v_start_fresh BOOLEAN DEFAULT false;
    DECLARE v_auto_enable BOOLEAN DEFAULT false;
    DECLARE v_explain     BOOLEAN DEFAULT true;
    DECLARE v_this_thread_enabed ENUM('YES', 'NO');
    DECLARE v_runtime INT DEFAULT 0;
    DECLARE v_start INT DEFAULT 0;
    DECLARE v_found_stmts INT;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    -- Do not track the current thread, it will kill the stack
    SELECT INSTRUMENTED INTO v_this_thread_enabed FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    DROP TEMPORARY TABLE IF EXISTS stmt_trace;
    CREATE TEMPORARY TABLE stmt_trace (
        thread_id BIGINT UNSIGNED,
        timer_start BIGINT UNSIGNED,
        event_id BIGINT UNSIGNED,
        sql_text longtext,
        timer_wait BIGINT UNSIGNED,
        lock_time BIGINT UNSIGNED,
        errors BIGINT UNSIGNED,
        mysql_errno INT,
        rows_sent BIGINT UNSIGNED,
        rows_affected BIGINT UNSIGNED,
        rows_examined BIGINT UNSIGNED,
        created_tmp_tables BIGINT UNSIGNED,
        created_tmp_disk_tables BIGINT UNSIGNED,
        no_index_used BIGINT UNSIGNED,
        PRIMARY KEY (thread_id, timer_start)
    );
    DROP TEMPORARY TABLE IF EXISTS stmt_stages;
    CREATE TEMPORARY TABLE stmt_stages (
       event_id BIGINT UNSIGNED,
       stmt_id BIGINT UNSIGNED,
       event_name VARCHAR(128),
       timer_wait BIGINT UNSIGNED,
       PRIMARY KEY (event_id)
    );
    SET v_start_fresh = in_start_fresh;
    IF v_start_fresh THEN
        TRUNCATE TABLE performance_schema.events_statements_history_long;
        TRUNCATE TABLE performance_schema.events_stages_history_long;
    END IF;
    SET v_auto_enable = in_auto_enable;
    IF v_auto_enable THEN
        CALL sys.ps_setup_save(0);
        UPDATE performance_schema.threads
           SET INSTRUMENTED = IF(PROCESSLIST_ID IS NOT NULL, 'YES', 'NO');
        -- Only the events_statements_history_long and events_stages_history_long tables and their ancestors are needed
        UPDATE performance_schema.setup_consumers
           SET ENABLED = 'YES'
         WHERE NAME NOT LIKE '%\_history'
               AND NAME NOT LIKE 'events_wait%'
               AND NAME NOT LIKE 'events_transactions%'
               AND NAME <> 'statements_digest';
        UPDATE performance_schema.setup_instruments
           SET ENABLED = 'YES',
               TIMED   = 'YES'
         WHERE NAME LIKE 'statement/%' OR NAME LIKE 'stage/%';
    END IF;
    WHILE v_runtime < in_runtime DO
        SELECT UNIX_TIMESTAMP() INTO v_start;
        INSERT IGNORE INTO stmt_trace
        SELECT thread_id, timer_start, event_id, sql_text, timer_wait, lock_time, errors, mysql_errno, 
               rows_sent, rows_affected, rows_examined, created_tmp_tables, created_tmp_disk_tables, no_index_used
          FROM performance_schema.events_statements_history_long
        WHERE digest = in_digest;
        INSERT IGNORE INTO stmt_stages
        SELECT stages.event_id, stmt_trace.event_id,
               stages.event_name, stages.timer_wait
          FROM performance_schema.events_stages_history_long AS stages
          JOIN stmt_trace ON stages.nesting_event_id = stmt_trace.event_id;
        SELECT SLEEP(in_interval) INTO @sleep;
        SET v_runtime = v_runtime + (UNIX_TIMESTAMP() - v_start);
    END WHILE;
    SELECT "SUMMARY STATISTICS";
    SELECT COUNT(*) executions,
           format_pico_time(SUM(timer_wait)) AS exec_time,
           format_pico_time(SUM(lock_time)) AS lock_time,
           SUM(rows_sent) AS rows_sent,
           SUM(rows_affected) AS rows_affected,
           SUM(rows_examined) AS rows_examined,
           SUM(created_tmp_tables) AS tmp_tables,
           SUM(no_index_used) AS full_scans
      FROM stmt_trace;
    SELECT event_name,
           COUNT(*) as count,
           format_pico_time(SUM(timer_wait)) as latency
      FROM stmt_stages
     GROUP BY event_name
     ORDER BY SUM(timer_wait) DESC;
    SELECT "LONGEST RUNNING STATEMENT";
    SELECT thread_id,
           format_pico_time(timer_wait) AS exec_time,
           format_pico_time(lock_time) AS lock_time,
           rows_sent,
           rows_affected,
           rows_examined,
           created_tmp_tables AS tmp_tables,
           no_index_used AS full_scan
      FROM stmt_trace
     ORDER BY timer_wait DESC LIMIT 1;
    SELECT sql_text
      FROM stmt_trace
     ORDER BY timer_wait DESC LIMIT 1;
    SELECT sql_text, event_id INTO @sql, @sql_id
      FROM stmt_trace
    ORDER BY timer_wait DESC LIMIT 1;
    IF (@sql_id IS NOT NULL) THEN
        SELECT event_name,
               format_pico_time(timer_wait) as latency
          FROM stmt_stages
         WHERE stmt_id = @sql_id
         ORDER BY event_id;
    END IF;
    DROP TEMPORARY TABLE stmt_trace;
    DROP TEMPORARY TABLE stmt_stages;
    IF (@sql IS NOT NULL) THEN
        SET @stmt := CONCAT("EXPLAIN FORMAT=JSON ", @sql);
        BEGIN
            -- Not all queries support EXPLAIN, so catch the cases that are
            -- not supported. Currently that includes cases where the table
            -- is not fully qualified and is not in the default schema for this
            -- procedure as it's not possible to change the default schema inside
            -- a procedure.
            --
            -- Errno = 1064: You have an error in your SQL syntax
            -- Errno = 1146: Table '...' doesn't exist
            DECLARE CONTINUE HANDLER FOR 1064, 1146 SET v_explain = false;
            PREPARE explain_stmt FROM @stmt;
        END;
        IF (v_explain) THEN
            EXECUTE explain_stmt;
            DEALLOCATE PREPARE explain_stmt;
        END IF;
    END IF;
    IF v_auto_enable THEN
        CALL sys.ps_setup_reload_saved();
    END IF;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabed = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    SET sql_log_bin = @log_bin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_trace_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_trace_thread`(
        IN in_thread_id BIGINT UNSIGNED,
        IN in_outfile VARCHAR(255),
        IN in_max_runtime DECIMAL(20,2),
        IN in_interval DECIMAL(20,2),
        IN in_start_fresh BOOLEAN,
        IN in_auto_setup BOOLEAN,
        IN in_debug BOOLEAN
    )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nDumps all data within Performance Schema for an instrumented thread,\nto create a DOT formatted graph file. \n\nEach resultset returned from the procedure should be used for a complete graph\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_thread_id (BIGINT UNSIGNED):\n  The thread that you would like a stack trace for\nin_outfile  (VARCHAR(255)):\n  The filename the dot file will be written to\nin_max_runtime (DECIMAL(20,2)):\n  The maximum time to keep collecting data.\n  Use NULL to get the default which is 60 seconds.\nin_interval (DECIMAL(20,2)): \n  How long to sleep between data collections. \n  Use NULL to get the default which is 1 second.\nin_start_fresh (BOOLEAN):\n  Whether to reset all Performance Schema data before tracing.\nin_auto_setup (BOOLEAN):\n  Whether to disable all other threads and enable all consumers/instruments. \n  This will also reset the settings at the end of the run.\nin_debug (BOOLEAN):\n  Whether you would like to include file:lineno in the graph\n\nExample\n-----------\n\nmysql> CALL sys.ps_trace_thread(25, CONCAT(''/tmp/stack-'', REPLACE(NOW(), '' '', ''-''), ''.dot''), NULL, NULL, TRUE, TRUE, TRUE);\n+-------------------+\n| summary           |\n+-------------------+\n| Disabled 1 thread |\n+-------------------+\n1 row in set (0.00 sec)\n\n+---------------------------------------------+\n| Info                                        |\n+---------------------------------------------+\n| Data collection starting for THREAD_ID = 25 |\n+---------------------------------------------+\n1 row in set (0.03 sec)\n\n+-----------------------------------------------------------+\n| Info                                                      |\n+-----------------------------------------------------------+\n| Stack trace written to /tmp/stack-2014-02-16-21:18:41.dot |\n+-----------------------------------------------------------+\n1 row in set (60.07 sec)\n\n+-------------------------------------------------------------------+\n| Convert to PDF                                                    |\n+-------------------------------------------------------------------+\n| dot -Tpdf -o /tmp/stack_25.pdf /tmp/stack-2014-02-16-21:18:41.dot |\n+-------------------------------------------------------------------+\n1 row in set (60.07 sec)\n\n+-------------------------------------------------------------------+\n| Convert to PNG                                                    |\n+-------------------------------------------------------------------+\n| dot -Tpng -o /tmp/stack_25.png /tmp/stack-2014-02-16-21:18:41.dot |\n+-------------------------------------------------------------------+\n1 row in set (60.07 sec)\n\n+------------------+\n| summary          |\n+------------------+\n| Enabled 1 thread |\n+------------------+\n1 row in set (60.32 sec)\n'
BEGIN
    DECLARE v_done bool DEFAULT FALSE;
    DECLARE v_start, v_runtime DECIMAL(20,2) DEFAULT 0.0;
    DECLARE v_min_event_id bigint unsigned DEFAULT 0;
    DECLARE v_this_thread_enabed ENUM('YES', 'NO');
    DECLARE v_event longtext;
    DECLARE c_stack CURSOR FOR
        SELECT CONCAT(IF(nesting_event_id IS NOT NULL, CONCAT(nesting_event_id, ' -> '), ''), 
                    event_id, '; ', event_id, ' [label="',
                    -- Convert from picoseconds to microseconds
                    '(', format_pico_time(timer_wait), ') ',
                    IF (event_name NOT LIKE 'wait/io%', 
                        SUBSTRING_INDEX(event_name, '/', -2), 
                        IF (event_name NOT LIKE 'wait/io/file%' OR event_name NOT LIKE 'wait/io/socket%',
                            SUBSTRING_INDEX(event_name, '/', -4),
                            event_name)
                        ),
                    -- Always dump the extra wait information gathered for transactions and statements
                    IF (event_name LIKE 'transaction', IFNULL(CONCAT('\\n', wait_info), ''), ''),
                    IF (event_name LIKE 'statement/%', IFNULL(CONCAT('\\n', wait_info), ''), ''),
                    -- If debug is enabled, add the file:lineno information for waits
                    IF (in_debug AND event_name LIKE 'wait%', wait_info, ''),
                    '", ', 
                    -- Depending on the type of event, style appropriately
                    CASE WHEN event_name LIKE 'wait/io/file%' THEN 
                           'shape=box, style=filled, color=red'
                         WHEN event_name LIKE 'wait/io/table%' THEN 
                           'shape=box, style=filled, color=green'
                         WHEN event_name LIKE 'wait/io/socket%' THEN
                           'shape=box, style=filled, color=yellow'
                         WHEN event_name LIKE 'wait/synch/mutex%' THEN
                           'style=filled, color=lightskyblue'
                         WHEN event_name LIKE 'wait/synch/cond%' THEN
                           'style=filled, color=darkseagreen3'
                         WHEN event_name LIKE 'wait/synch/rwlock%' THEN
                           'style=filled, color=orchid'
                         WHEN event_name LIKE 'wait/synch/sxlock%' THEN
                           'style=filled, color=palevioletred' 
                         WHEN event_name LIKE 'wait/lock%' THEN
                           'shape=box, style=filled, color=tan'
                         WHEN event_name LIKE 'statement/%' THEN
                           CONCAT('shape=box, style=bold',
                                  -- Style statements depending on COM vs SQL
                                  CASE WHEN event_name LIKE 'statement/com/%' THEN
                                         ' style=filled, color=darkseagreen'
                                       ELSE
                                         -- Use long query time from the server to
                                         -- flag long running statements in red
                                         IF((timer_wait/1000000000000) > @@long_query_time, 
                                            ' style=filled, color=red', 
                                            ' style=filled, color=lightblue')
                                  END
                           )
                         WHEN event_name LIKE 'transaction' THEN
                           'shape=box, style=filled, color=lightblue3'
                         WHEN event_name LIKE 'stage/%' THEN
                           'style=filled, color=slategray3'
                         -- IDLE events are on their own, call attention to them
                         WHEN event_name LIKE '%idle%' THEN
                           'shape=box, style=filled, color=firebrick3'
                         ELSE '' END,
                     '];\n'
                   ) event, event_id
        FROM (
             -- Select all transactions
             (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id,
                     CONCAT('trx_id: ',  IFNULL(trx_id, ''), '\\n',
                            'gtid: ', IFNULL(gtid, ''), '\\n',
                            'state: ', state, '\\n',
                            'mode: ', access_mode, '\\n',
                            'isolation: ', isolation_level, '\\n',
                            'autocommit: ', autocommit, '\\n',
                            'savepoints: ', number_of_savepoints, '\\n'
                     ) AS wait_info
                FROM performance_schema.events_transactions_history_long
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
             UNION
             -- Select all statements, with the extra tracing information available
             (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, 
                     CONCAT('statement: ', sql_text, '\\n',
                            'errors: ', errors, '\\n',
                            'warnings: ', warnings, '\\n',
                            'lock time: ', format_pico_time(lock_time),'\\n',
                            'rows affected: ', rows_affected, '\\n',
                            'rows sent: ', rows_sent, '\\n',
                            'rows examined: ', rows_examined, '\\n',
                            'tmp tables: ', created_tmp_tables, '\\n',
                            'tmp disk tables: ', created_tmp_disk_tables, '\\n'
                            'select scan: ', select_scan, '\\n',
                            'select full join: ', select_full_join, '\\n',
                            'select full range join: ', select_full_range_join, '\\n',
                            'select range: ', select_range, '\\n',
                            'select range check: ', select_range_check, '\\n', 
                            'sort merge passes: ', sort_merge_passes, '\\n',
                            'sort rows: ', sort_rows, '\\n',
                            'sort range: ', sort_range, '\\n',
                            'sort scan: ', sort_scan, '\\n',
                            'no index used: ', IF(no_index_used, 'TRUE', 'FALSE'), '\\n',
                            'no good index used: ', IF(no_good_index_used, 'TRUE', 'FALSE'), '\\n'
                     ) AS wait_info
                FROM performance_schema.events_statements_history_long
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
             UNION
             -- Select all stages
             (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, null AS wait_info
                FROM performance_schema.events_stages_history_long 
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
             UNION 
             -- Select all events, adding information appropriate to the event
             (SELECT thread_id, event_id, 
                     CONCAT(event_name, 
                            IF(event_name NOT LIKE 'wait/synch/mutex%', IFNULL(CONCAT(' - ', operation), ''), ''), 
                            IF(number_of_bytes IS NOT NULL, CONCAT(' ', number_of_bytes, ' bytes'), ''),
                            IF(event_name LIKE 'wait/io/file%', '\\n', ''),
                            IF(object_schema IS NOT NULL, CONCAT('\\nObject: ', object_schema, '.'), ''), 
                            IF(object_name IS NOT NULL, 
                               IF (event_name LIKE 'wait/io/socket%',
                                   -- Print the socket if used, else the IP:port as reported
                                   CONCAT('\\n', IF (object_name LIKE ':0%', @@socket, object_name)),
                                   object_name),
                               ''
                            ),
                            IF(index_name IS NOT NULL, CONCAT(' Index: ', index_name), ''), '\\n'
                     ) AS event_name,
                     timer_wait, timer_start, nesting_event_id, source AS wait_info
                FROM performance_schema.events_waits_history_long
               WHERE thread_id = in_thread_id AND event_id > v_min_event_id)
           ) events 
       ORDER BY event_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    SET @log_bin := @@sql_log_bin;
    SET sql_log_bin = 0;
    -- Do not track the current thread, it will kill the stack
    SELECT INSTRUMENTED INTO v_this_thread_enabed FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    IF (in_auto_setup) THEN
        CALL sys.ps_setup_save(0);
        -- Ensure only the thread to create the stack trace for is instrumented and that we instrument everything.
        DELETE FROM performance_schema.setup_actors;
        UPDATE performance_schema.threads
           SET INSTRUMENTED = IF(THREAD_ID = in_thread_id, 'YES', 'NO');
        -- only the %_history_long tables and it ancestors are needed
        UPDATE performance_schema.setup_consumers
           SET ENABLED = 'YES'
         WHERE NAME NOT LIKE '%\_history';
        UPDATE performance_schema.setup_instruments
           SET ENABLED = 'YES',
               TIMED   = 'YES';
    END IF;
    IF (in_start_fresh) THEN
        TRUNCATE performance_schema.events_transactions_history_long;
        TRUNCATE performance_schema.events_statements_history_long;
        TRUNCATE performance_schema.events_stages_history_long;
        TRUNCATE performance_schema.events_waits_history_long;
    END IF;
    DROP TEMPORARY TABLE IF EXISTS tmp_events;
    CREATE TEMPORARY TABLE tmp_events (
      event_id bigint unsigned NOT NULL,
      event longblob,
      PRIMARY KEY (event_id)
    );
    -- Print headers for a .dot file
    INSERT INTO tmp_events VALUES (0, CONCAT('digraph events { rankdir=LR; nodesep=0.10;\n',
                                             '// Stack created .....: ', NOW(), '\n',
                                             '// MySQL version .....: ', VERSION(), '\n',
                                             '// MySQL hostname ....: ', @@hostname, '\n',
                                             '// MySQL port ........: ', @@port, '\n',
                                             '// MySQL socket ......: ', @@socket, '\n',
                                             '// MySQL user ........: ', CURRENT_USER(), '\n'));
    SELECT CONCAT('Data collection starting for THREAD_ID = ', in_thread_id) AS 'Info';
    SET v_min_event_id = 0,
        v_start        = UNIX_TIMESTAMP(),
        in_interval    = IFNULL(in_interval, 1.00),
        in_max_runtime = IFNULL(in_max_runtime, 60.00);
    WHILE (v_runtime < in_max_runtime
           AND (SELECT INSTRUMENTED FROM performance_schema.threads WHERE THREAD_ID = in_thread_id) = 'YES') DO
        SET v_done = FALSE;
        OPEN c_stack;
        c_stack_loop: LOOP
            FETCH c_stack INTO v_event, v_min_event_id;
            IF v_done THEN
                LEAVE c_stack_loop;
            END IF;
            IF (LENGTH(v_event) > 0) THEN
                INSERT INTO tmp_events VALUES (v_min_event_id, v_event);
            END IF;
        END LOOP;
        CLOSE c_stack;
        SELECT SLEEP(in_interval) INTO @sleep;
        SET v_runtime = (UNIX_TIMESTAMP() - v_start);
    END WHILE;
    INSERT INTO tmp_events VALUES (v_min_event_id+1, '}');
    SET @query = CONCAT('SELECT event FROM tmp_events ORDER BY event_id INTO OUTFILE ''', in_outfile, ''' FIELDS ESCAPED BY '''' LINES TERMINATED BY ''''');
    PREPARE stmt_output FROM @query;
    EXECUTE stmt_output;
    DEALLOCATE PREPARE stmt_output;
    SELECT CONCAT('Stack trace written to ', in_outfile) AS 'Info';
    SELECT CONCAT('dot -Tpdf -o /tmp/stack_', in_thread_id, '.pdf ', in_outfile) AS 'Convert to PDF';
    SELECT CONCAT('dot -Tpng -o /tmp/stack_', in_thread_id, '.png ', in_outfile) AS 'Convert to PNG';
    DROP TEMPORARY TABLE tmp_events;
    -- Reset the settings for the performance schema
    IF (in_auto_setup) THEN
        CALL sys.ps_setup_reload_saved();
    END IF;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabed = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    SET sql_log_bin = @log_bin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_truncate_all_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_truncate_all_tables`(
        IN in_verbose BOOLEAN
    )
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTruncates all summary tables within Performance Schema, \nresetting all aggregated instrumentation as a snapshot.\n\nParameters\n-----------\n\nin_verbose (BOOLEAN):\n  Whether to print each TRUNCATE statement before running\n\nExample\n-----------\n\nmysql> CALL sys.ps_truncate_all_tables(false);\n+---------------------+\n| summary             |\n+---------------------+\n| Truncated 44 tables |\n+---------------------+\n1 row in set (0.10 sec)\n\nQuery OK, 0 rows affected (0.10 sec)\n'
BEGIN
    DECLARE v_done INT DEFAULT FALSE;
    DECLARE v_total_tables INT DEFAULT 0;
    DECLARE v_ps_table VARCHAR(64);
    DECLARE ps_tables CURSOR FOR
        SELECT table_name 
          FROM INFORMATION_SCHEMA.TABLES 
         WHERE table_schema = 'performance_schema' 
           AND (table_name LIKE '%summary%' 
            OR table_name LIKE '%history%');
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN ps_tables;
    ps_tables_loop: LOOP
        FETCH ps_tables INTO v_ps_table;
        IF v_done THEN
          LEAVE ps_tables_loop;
        END IF;
        SET @truncate_stmt := CONCAT('TRUNCATE TABLE performance_schema.', v_ps_table);
        IF in_verbose THEN
            SELECT CONCAT('Running: ', @truncate_stmt) AS status;
        END IF;
        PREPARE truncate_stmt FROM @truncate_stmt;
        EXECUTE truncate_stmt;
        DEALLOCATE PREPARE truncate_stmt;
        SET v_total_tables = v_total_tables + 1;
    END LOOP;
    CLOSE ps_tables;
    SELECT CONCAT('Truncated ', v_total_tables, ' tables') AS summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `statement_performance_analyzer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `statement_performance_analyzer`(
        IN in_action ENUM('snapshot', 'overall', 'delta', 'create_table', 'create_tmp', 'save', 'cleanup'),
        IN in_table VARCHAR(129),
        IN in_views SET ('with_runtimes_in_95th_percentile', 'analysis', 'with_errors_or_warnings', 'with_full_table_scans', 'with_sorting', 'with_temp_tables', 'custom')
    )
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nCreate a report of the statements running on the server.\n\nThe views are calculated based on the overall and/or delta activity.\n\nRequires the SUPER privilege for "SET sql_log_bin = 0;".\n\nParameters\n-----------\n\nin_action (ENUM(''snapshot'', ''overall'', ''delta'', ''create_tmp'', ''create_table'', ''save'', ''cleanup'')):\n  The action to take. Supported actions are:\n    * snapshot      Store a snapshot. The default is to make a snapshot of the current content of\n                    performance_schema.events_statements_summary_by_digest, but by setting in_table\n                    this can be overwritten to copy the content of the specified table.\n                    The snapshot is stored in the sys.tmp_digests temporary table.\n    * overall       Generate analyzis based on the content specified by in_table. For the overall analyzis,\n                    in_table can be NOW() to use a fresh snapshot. This will overwrite an existing snapshot.\n                    Use NULL for in_table to use the existing snapshot. If in_table IS NULL and no snapshot\n                    exists, a new will be created.\n                    See also in_views and @sys.statement_performance_analyzer.limit.\n    * delta         Generate a delta analysis. The delta will be calculated between the reference table in\n                    in_table and the snapshot. An existing snapshot must exist.\n                    The action uses the sys.tmp_digests_delta temporary table.\n                    See also in_views and @sys.statement_performance_analyzer.limit.\n    * create_table  Create a regular table suitable for storing the snapshot for later use, e.g. for\n                    calculating deltas.\n    * create_tmp    Create a temporary table suitable for storing the snapshot for later use, e.g. for\n                    calculating deltas.\n    * save          Save the snapshot in the table specified by in_table. The table must exists and have\n                    the correct structure.\n                    If no snapshot exists, a new is created.\n    * cleanup       Remove the temporary tables used for the snapshot and delta.\n\nin_table (VARCHAR(129)):\n  The table argument used for some actions. Use the format ''db1.t1'' or ''t1'' without using any backticks (`)\n  for quoting. Periods (.) are not supported in the database and table names.\n\n  The meaning of the table for each action supporting the argument is:\n\n    * snapshot      The snapshot is created based on the specified table. Set to NULL or NOW() to use\n                    the current content of performance_schema.events_statements_summary_by_digest.\n    * overall       The table with the content to create the overall analyzis for. The following values\n                    can be used:\n                      - A table name - use the content of that table.\n                      - NOW()        - create a fresh snapshot and overwrite the existing snapshot.\n                      - NULL         - use the last stored snapshot.\n    * delta         The table name is mandatory and specified the reference view to compare the currently\n                    stored snapshot against. If no snapshot exists, a new will be created.\n    * create_table  The name of the regular table to create.\n    * create_tmp    The name of the temporary table to create.\n    * save          The name of the table to save the currently stored snapshot into.\n\nin_views (SET (''with_runtimes_in_95th_percentile'', ''analysis'', ''with_errors_or_warnings'',\n               ''with_full_table_scans'', ''with_sorting'', ''with_temp_tables'', ''custom''))\n  Which views to include:\n\n    * with_runtimes_in_95th_percentile  Based on the sys.statements_with_runtimes_in_95th_percentile view\n    * analysis                          Based on the sys.statement_analysis view\n    * with_errors_or_warnings           Based on the sys.statements_with_errors_or_warnings view\n    * with_full_table_scans             Based on the sys.statements_with_full_table_scans view\n    * with_sorting                      Based on the sys.statements_with_sorting view\n    * with_temp_tables                  Based on the sys.statements_with_temp_tables view\n    * custom                            Use a custom view. This view must be specified in @sys.statement_performance_analyzer.view to an existing view or a query\n\nDefault is to include all except ''custom''.\n\n\nConfiguration Options\n----------------------\n\nsys.statement_performance_analyzer.limit\n  The maximum number of rows to include for the views that does not have a built-in limit (e.g. the 95th percentile view).\n  If not set the limit is 100.\n\nsys.statement_performance_analyzer.view\n  Used together with the ''custom'' view. If the value contains a space, it is considered a query, otherwise it must be\n  an existing view querying the performance_schema.events_statements_summary_by_digest table. There cannot be any limit\n  clause including in the query or view definition if @sys.statement_performance_analyzer.limit > 0.\n  If specifying a view, use the same format as for in_table.\n\nsys.debug\n  Whether to provide debugging output.\n  Default is ''OFF''. Set to ''ON'' to include.\n\n\nExample\n--------\n\nTo create a report with the queries in the 95th percentile since last truncate of performance_schema.events_statements_summary_by_digest\nand the delta for a 1 minute period:\n\n   1. Create a temporary table to store the initial snapshot.\n   2. Create the initial snapshot.\n   3. Save the initial snapshot in the temporary table.\n   4. Wait one minute.\n   5. Create a new snapshot.\n   6. Perform analyzis based on the new snapshot.\n   7. Perform analyzis based on the delta between the initial and new snapshots.\n\nmysql> CALL sys.statement_performance_analyzer(''create_tmp'', ''mydb.tmp_digests_ini'', NULL);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL);\nQuery OK, 0 rows affected (0.02 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''save'', ''mydb.tmp_digests_ini'', NULL);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DO SLEEP(60);\nQuery OK, 0 rows affected (1 min 0.00 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL);\nQuery OK, 0 rows affected (0.02 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''overall'', NULL, ''with_runtimes_in_95th_percentile'');\n+-----------------------------------------+\n| Next Output                             |\n+-----------------------------------------+\n| Queries with Runtime in 95th Percentile |\n+-----------------------------------------+\n1 row in set (0.05 sec)\n\n...\n\nmysql> CALL sys.statement_performance_analyzer(''delta'', ''mydb.tmp_digests_ini'', ''with_runtimes_in_95th_percentile'');\n+-----------------------------------------+\n| Next Output                             |\n+-----------------------------------------+\n| Queries with Runtime in 95th Percentile |\n+-----------------------------------------+\n1 row in set (0.03 sec)\n\n...\n\n\nTo create an overall report of the 95th percentile queries and the top 10 queries with full table scans:\n\nmysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SET @sys.statement_performance_analyzer.limit = 10;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''overall'', NULL, ''with_runtimes_in_95th_percentile,with_full_table_scans'');\n+-----------------------------------------+\n| Next Output                             |\n+-----------------------------------------+\n| Queries with Runtime in 95th Percentile |\n+-----------------------------------------+\n1 row in set (0.01 sec)\n\n...\n\n+-------------------------------------+\n| Next Output                         |\n+-------------------------------------+\n| Top 10 Queries with Full Table Scan |\n+-------------------------------------+\n1 row in set (0.09 sec)\n\n...\n\n\nUse a custom view showing the top 10 query sorted by total execution time refreshing the view every minute using\nthe watch command in Linux.\n\nmysql> CREATE OR REPLACE VIEW mydb.my_statements AS\n    -> SELECT sys.format_statement(DIGEST_TEXT) AS query,\n    ->        SCHEMA_NAME AS db,\n    ->        COUNT_STAR AS exec_count,\n    ->        format_pico_time(SUM_TIMER_WAIT) AS total_latency,\n    ->        format_pico_time(AVG_TIMER_WAIT) AS avg_latency,\n    ->        ROUND(IFNULL(SUM_ROWS_SENT / NULLIF(COUNT_STAR, 0), 0)) AS rows_sent_avg,\n    ->        ROUND(IFNULL(SUM_ROWS_EXAMINED / NULLIF(COUNT_STAR, 0), 0)) AS rows_examined_avg,\n    ->        ROUND(IFNULL(SUM_ROWS_AFFECTED / NULLIF(COUNT_STAR, 0), 0)) AS rows_affected_avg,\n    ->        DIGEST AS digest\n    ->   FROM performance_schema.events_statements_summary_by_digest\n    -> ORDER BY SUM_TIMER_WAIT DESC;\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> CALL sys.statement_performance_analyzer(''create_table'', ''mydb.digests_prev'', NULL);\nQuery OK, 0 rows affected (0.10 sec)\n\nshell$ watch -n 60 "mysql sys --table -e "\n> SET @sys.statement_performance_analyzer.view = ''mydb.my_statements'';\n> SET @sys.statement_performance_analyzer.limit = 10;\n> CALL statement_performance_analyzer(''snapshot'', NULL, NULL);\n> CALL statement_performance_analyzer(''delta'', ''mydb.digests_prev'', ''custom'');\n> CALL statement_performance_analyzer(''save'', ''mydb.digests_prev'', NULL);\n> ""\n\nEvery 60.0s: mysql sys --table -e "                                                                                                   ...  Mon Dec 22 10:58:51 2014\n\n+----------------------------------+\n| Next Output                      |\n+----------------------------------+\n| Top 10 Queries Using Custom View |\n+----------------------------------+\n+-------------------+-------+------------+---------------+-------------+---------------+-------------------+-------------------+----------------------------------+\n| query             | db    | exec_count | total_latency | avg_latency | rows_sent_avg | rows_examined_avg | rows_affected_avg | digest                           |\n+-------------------+-------+------------+---------------+-------------+---------------+-------------------+-------------------+----------------------------------+\n...\n'
BEGIN
    DECLARE v_table_exists, v_tmp_digests_table_exists, v_custom_view_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY') DEFAULT '';
    DECLARE v_this_thread_enabled ENUM('YES', 'NO');
    DECLARE v_force_new_snapshot BOOLEAN DEFAULT FALSE;
    DECLARE v_digests_table VARCHAR(133);
    DECLARE v_quoted_table, v_quoted_custom_view VARCHAR(133) DEFAULT '';
    DECLARE v_table_db, v_table_name, v_custom_db, v_custom_name VARCHAR(64);
    DECLARE v_digest_table_template, v_checksum_ref, v_checksum_table text;
    DECLARE v_sql longtext;
    -- Maximum supported length for MESSAGE_TEXT with the SIGNAL command is 128 chars.
    DECLARE v_error_msg VARCHAR(128);
    DECLARE v_old_group_concat_max_len INT UNSIGNED DEFAULT 0;
    -- Don't instrument this thread
    SELECT INSTRUMENTED INTO v_this_thread_enabled FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID();
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_disable_thread(CONNECTION_ID());
    END IF;
    -- Temporary table are used - disable sql_log_bin if necessary to prevent them replicating
    SET @log_bin := @@sql_log_bin;
    IF ((@log_bin = 1) AND (@@binlog_format = 'STATEMENT')) THEN
        SET sql_log_bin = 0;
    END IF;
    -- Set configuration options
    IF (@sys.statement_performance_analyzer.limit IS NULL) THEN
        SET @sys.statement_performance_analyzer.limit = sys.sys_get_config('statement_performance_analyzer.limit', '100');
    END IF;
    IF (@sys.debug IS NULL) THEN
        SET @sys.debug                                = sys.sys_get_config('debug'                               , 'OFF');
    END IF;
    -- If in_table is set, break in_table into a db and table component and check whether it exists
    -- in_table = NOW() is considered like it's not set.
    IF (in_table = 'NOW()') THEN
        SET v_force_new_snapshot = TRUE,
            in_table             = NULL;
    ELSEIF (in_table IS NOT NULL) THEN
        IF (NOT INSTR(in_table, '.')) THEN
            -- No . in the table name - use current database
            -- DATABASE() will be the database of the procedure
            SET v_table_db   = DATABASE(),
                v_table_name = in_table;
        ELSE
            SET v_table_db   = SUBSTRING_INDEX(in_table, '.', 1);
            SET v_table_name = SUBSTRING(in_table, CHAR_LENGTH(v_table_db)+2);
        END IF;
        SET v_quoted_table = CONCAT('`', v_table_db, '`.`', v_table_name, '`');
        IF (@sys.debug = 'ON') THEN
            SELECT CONCAT('in_table is: db = ''', v_table_db, ''', table = ''', v_table_name, '''') AS 'Debug';
        END IF;
        IF (v_table_db = DATABASE() AND (v_table_name = 'tmp_digests' OR v_table_name = 'tmp_digests_delta')) THEN
            SET v_error_msg = CONCAT('Invalid value for in_table: ', v_quoted_table, ' is reserved table name.');
            SIGNAL SQLSTATE '45000'
               SET MESSAGE_TEXT = v_error_msg;
        END IF;
        CALL sys.table_exists(v_table_db, v_table_name, v_table_exists);
        IF (@sys.debug = 'ON') THEN
            SELECT CONCAT('v_table_exists = ', v_table_exists) AS 'Debug';
        END IF;
        IF (v_table_exists = 'BASE TABLE') THEN
            SET v_old_group_concat_max_len = @@session.group_concat_max_len;
            SET @@session.group_concat_max_len = 2048;
            -- Verify that the table has the correct table definition
            -- This can only be done for base tables as temporary aren't in information_schema.COLUMNS.
            -- This also minimises the risk of using a production table.
            SET v_checksum_ref = (
                 SELECT GROUP_CONCAT(CONCAT(COLUMN_NAME, COLUMN_TYPE) ORDER BY ORDINAL_POSITION) AS Checksum
                   FROM information_schema.COLUMNS
                  WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'events_statements_summary_by_digest'
                ),
                v_checksum_table = (
                 SELECT GROUP_CONCAT(CONCAT(COLUMN_NAME, COLUMN_TYPE) ORDER BY ORDINAL_POSITION) AS Checksum
                   FROM information_schema.COLUMNS
                  WHERE TABLE_SCHEMA = v_table_db AND TABLE_NAME = v_table_name
                );
            SET @@session.group_concat_max_len = v_old_group_concat_max_len;
            IF (v_checksum_ref <> v_checksum_table) THEN
                -- The table does not have the correct definition, so abandon
                SET v_error_msg = CONCAT('The table ',
                                         IF(CHAR_LENGTH(v_quoted_table) > 93, CONCAT('...', SUBSTRING(v_quoted_table, -90)), v_quoted_table),
                                         ' has the wrong definition.');
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
        END IF;
    END IF;
    IF (in_views IS NULL OR in_views = '') THEN
        -- Set to default
        SET in_views = 'with_runtimes_in_95th_percentile,analysis,with_errors_or_warnings,with_full_table_scans,with_sorting,with_temp_tables';
    END IF;
    -- Validate settings
    CALL sys.table_exists(DATABASE(), 'tmp_digests', v_tmp_digests_table_exists);
    IF (@sys.debug = 'ON') THEN
        SELECT CONCAT('v_tmp_digests_table_exists = ', v_tmp_digests_table_exists) AS 'Debug';
    END IF;
    CASE
        WHEN in_action IN ('snapshot', 'overall') THEN
            -- in_table must be NULL, NOW(), or an existing table
            IF (in_table IS NOT NULL) THEN
                IF (NOT v_table_exists IN ('TEMPORARY', 'BASE TABLE')) THEN
                    SET v_error_msg = CONCAT('The ', in_action, ' action requires in_table to be NULL, NOW() or specify an existing table.',
                                             ' The table ',
                                             IF(CHAR_LENGTH(v_quoted_table) > 16, CONCAT('...', SUBSTRING(v_quoted_table, -13)), v_quoted_table),
                                             ' does not exist.');
                    SIGNAL SQLSTATE '45000'
                       SET MESSAGE_TEXT = v_error_msg;
                END IF;
            END IF;
        WHEN in_action IN ('delta', 'save') THEN
            -- in_table must be an existing table
            IF (v_table_exists NOT IN ('TEMPORARY', 'BASE TABLE')) THEN
                SET v_error_msg = CONCAT('The ', in_action, ' action requires in_table to be an existing table.',
                                         IF(in_table IS NOT NULL, CONCAT(' The table ',
                                             IF(CHAR_LENGTH(v_quoted_table) > 39, CONCAT('...', SUBSTRING(v_quoted_table, -36)), v_quoted_table),
                                             ' does not exist.'), ''));
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
            IF (in_action = 'delta' AND v_tmp_digests_table_exists <> 'TEMPORARY') THEN
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = 'An existing snapshot generated with the statement_performance_analyzer() must exist.';
            END IF;
        WHEN in_action = 'create_tmp' THEN
            -- in_table must not exists as a temporary table
            IF (v_table_exists = 'TEMPORARY') THEN
                SET v_error_msg = CONCAT('Cannot create the table ',
                                         IF(CHAR_LENGTH(v_quoted_table) > 72, CONCAT('...', SUBSTRING(v_quoted_table, -69)), v_quoted_table),
                                         ' as it already exists.');
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
        WHEN in_action = 'create_table' THEN
            -- in_table must not exists at all
            IF (v_table_exists <> '') THEN
                SET v_error_msg = CONCAT('Cannot create the table ',
                                         IF(CHAR_LENGTH(v_quoted_table) > 52, CONCAT('...', SUBSTRING(v_quoted_table, -49)), v_quoted_table),
                                         ' as it already exists',
                                         IF(v_table_exists = 'TEMPORARY', ' as a temporary table.', '.'));
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = v_error_msg;
            END IF;
        WHEN in_action = 'cleanup' THEN
            -- doesn't use any of the arguments
            DO (SELECT 1);
        ELSE
            SIGNAL SQLSTATE '45000'
               SET MESSAGE_TEXT = 'Unknown action. Supported actions are: cleanup, create_table, create_tmp, delta, overall, save, snapshot';
    END CASE;
    SET v_digest_table_template = 'CREATE %{TEMPORARY}TABLE %{TABLE_NAME} (
  `SCHEMA_NAME` varchar(64) DEFAULT NULL,
  `DIGEST` varchar(64) DEFAULT NULL,
  `DIGEST_TEXT` longtext,
  `COUNT_STAR` bigint unsigned NOT NULL,
  `SUM_TIMER_WAIT` bigint unsigned NOT NULL,
  `MIN_TIMER_WAIT` bigint unsigned NOT NULL,
  `AVG_TIMER_WAIT` bigint unsigned NOT NULL,
  `MAX_TIMER_WAIT` bigint unsigned NOT NULL,
  `SUM_LOCK_TIME` bigint unsigned NOT NULL,
  `SUM_ERRORS` bigint unsigned NOT NULL,
  `SUM_WARNINGS` bigint unsigned NOT NULL,
  `SUM_ROWS_AFFECTED` bigint unsigned NOT NULL,
  `SUM_ROWS_SENT` bigint unsigned NOT NULL,
  `SUM_ROWS_EXAMINED` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint unsigned NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE` bigint unsigned NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint unsigned NOT NULL,
  `SUM_SELECT_SCAN` bigint unsigned NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint unsigned NOT NULL,
  `SUM_SORT_RANGE` bigint unsigned NOT NULL,
  `SUM_SORT_ROWS` bigint unsigned NOT NULL,
  `SUM_SORT_SCAN` bigint unsigned NOT NULL,
  `SUM_NO_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint unsigned NOT NULL,
  `SUM_CPU_TIME` bigint unsigned NOT NULL,
  `MAX_CONTROLLED_MEMORY` bigint unsigned NOT NULL,
  `MAX_TOTAL_MEMORY` bigint unsigned NOT NULL,
  `COUNT_SECONDARY` bigint unsigned NOT NULL,
  `FIRST_SEEN` timestamp(6) NULL DEFAULT NULL,
  `LAST_SEEN` timestamp(6) NULL DEFAULT NULL,
  `QUANTILE_95` bigint unsigned NOT NULL,
  `QUANTILE_99` bigint unsigned NOT NULL,
  `QUANTILE_999` bigint unsigned NOT NULL,
  `QUERY_SAMPLE_TEXT` longtext,
  `QUERY_SAMPLE_SEEN` timestamp(6) NULL DEFAULT NULL,
  `QUERY_SAMPLE_TIMER_WAIT` bigint unsigned NOT NULL,
  INDEX (SCHEMA_NAME, DIGEST)
) DEFAULT CHARSET=utf8mb4';
    -- Do the action
    -- The actions snapshot, ... requires a fresh snapshot - create it now
    IF (v_force_new_snapshot
           OR in_action = 'snapshot'
           OR (in_action = 'overall' AND in_table IS NULL)
           OR (in_action = 'save' AND v_tmp_digests_table_exists <> 'TEMPORARY')
       ) THEN
        IF (v_tmp_digests_table_exists = 'TEMPORARY') THEN
            IF (@sys.debug = 'ON') THEN
                SELECT 'DROP TEMPORARY TABLE IF EXISTS tmp_digests' AS 'Debug';
            END IF;
            DROP TEMPORARY TABLE IF EXISTS tmp_digests;
        END IF;
        CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', 'TEMPORARY '), '%{TABLE_NAME}', 'tmp_digests'));
        SET v_sql = CONCAT('INSERT INTO tmp_digests SELECT * FROM ',
                           IF(in_table IS NULL OR in_action = 'save', 'performance_schema.events_statements_summary_by_digest', v_quoted_table));
        CALL sys.execute_prepared_stmt(v_sql);
    END IF;
    -- Go through the remaining actions
    IF (in_action IN ('create_table', 'create_tmp')) THEN
        IF (in_action = 'create_table') THEN
            CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', ''), '%{TABLE_NAME}', v_quoted_table));
        ELSE
            CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', 'TEMPORARY '), '%{TABLE_NAME}', v_quoted_table));
        END IF;
    ELSEIF (in_action = 'save') THEN
        CALL sys.execute_prepared_stmt(CONCAT('DELETE FROM ', v_quoted_table));
        CALL sys.execute_prepared_stmt(CONCAT('INSERT INTO ', v_quoted_table, ' SELECT * FROM tmp_digests'));
    ELSEIF (in_action = 'cleanup') THEN
        DROP TEMPORARY TABLE IF EXISTS sys.tmp_digests;
        DROP TEMPORARY TABLE IF EXISTS sys.tmp_digests_delta;
    ELSEIF (in_action IN ('overall', 'delta')) THEN
        -- These are almost the same - for delta calculate the delta in tmp_digests_delta and use that instead of tmp_digests.
        -- And overall allows overriding the table to use.
        IF (in_action = 'overall') THEN
            IF (in_table IS NULL) THEN
                SET v_digests_table = 'tmp_digests';
            ELSE
                SET v_digests_table = v_quoted_table;
            END IF;
        ELSE
            SET v_digests_table = 'tmp_digests_delta';
            DROP TEMPORARY TABLE IF EXISTS tmp_digests_delta;
            CREATE TEMPORARY TABLE tmp_digests_delta LIKE tmp_digests;
            SET v_sql = CONCAT('INSERT INTO tmp_digests_delta
SELECT `d_end`.`SCHEMA_NAME`,
       `d_end`.`DIGEST`,
       `d_end`.`DIGEST_TEXT`,
       `d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0) AS ''COUNT_STAR'',
       `d_end`.`SUM_TIMER_WAIT`-IFNULL(`d_start`.`SUM_TIMER_WAIT`, 0) AS ''SUM_TIMER_WAIT'',
       `d_end`.`MIN_TIMER_WAIT` AS ''MIN_TIMER_WAIT'',
       IFNULL((`d_end`.`SUM_TIMER_WAIT`-IFNULL(`d_start`.`SUM_TIMER_WAIT`, 0))/NULLIF(`d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0), 0), 0) AS ''AVG_TIMER_WAIT'',
       `d_end`.`MAX_TIMER_WAIT` AS ''MAX_TIMER_WAIT'',
       `d_end`.`SUM_LOCK_TIME`-IFNULL(`d_start`.`SUM_LOCK_TIME`, 0) AS ''SUM_LOCK_TIME'',
       `d_end`.`SUM_ERRORS`-IFNULL(`d_start`.`SUM_ERRORS`, 0) AS ''SUM_ERRORS'',
       `d_end`.`SUM_WARNINGS`-IFNULL(`d_start`.`SUM_WARNINGS`, 0) AS ''SUM_WARNINGS'',
       `d_end`.`SUM_ROWS_AFFECTED`-IFNULL(`d_start`.`SUM_ROWS_AFFECTED`, 0) AS ''SUM_ROWS_AFFECTED'',
       `d_end`.`SUM_ROWS_SENT`-IFNULL(`d_start`.`SUM_ROWS_SENT`, 0) AS ''SUM_ROWS_SENT'',
       `d_end`.`SUM_ROWS_EXAMINED`-IFNULL(`d_start`.`SUM_ROWS_EXAMINED`, 0) AS ''SUM_ROWS_EXAMINED'',
       `d_end`.`SUM_CREATED_TMP_DISK_TABLES`-IFNULL(`d_start`.`SUM_CREATED_TMP_DISK_TABLES`, 0) AS ''SUM_CREATED_TMP_DISK_TABLES'',
       `d_end`.`SUM_CREATED_TMP_TABLES`-IFNULL(`d_start`.`SUM_CREATED_TMP_TABLES`, 0) AS ''SUM_CREATED_TMP_TABLES'',
       `d_end`.`SUM_SELECT_FULL_JOIN`-IFNULL(`d_start`.`SUM_SELECT_FULL_JOIN`, 0) AS ''SUM_SELECT_FULL_JOIN'',
       `d_end`.`SUM_SELECT_FULL_RANGE_JOIN`-IFNULL(`d_start`.`SUM_SELECT_FULL_RANGE_JOIN`, 0) AS ''SUM_SELECT_FULL_RANGE_JOIN'',
       `d_end`.`SUM_SELECT_RANGE`-IFNULL(`d_start`.`SUM_SELECT_RANGE`, 0) AS ''SUM_SELECT_RANGE'',
       `d_end`.`SUM_SELECT_RANGE_CHECK`-IFNULL(`d_start`.`SUM_SELECT_RANGE_CHECK`, 0) AS ''SUM_SELECT_RANGE_CHECK'',
       `d_end`.`SUM_SELECT_SCAN`-IFNULL(`d_start`.`SUM_SELECT_SCAN`, 0) AS ''SUM_SELECT_SCAN'',
       `d_end`.`SUM_SORT_MERGE_PASSES`-IFNULL(`d_start`.`SUM_SORT_MERGE_PASSES`, 0) AS ''SUM_SORT_MERGE_PASSES'',
       `d_end`.`SUM_SORT_RANGE`-IFNULL(`d_start`.`SUM_SORT_RANGE`, 0) AS ''SUM_SORT_RANGE'',
       `d_end`.`SUM_SORT_ROWS`-IFNULL(`d_start`.`SUM_SORT_ROWS`, 0) AS ''SUM_SORT_ROWS'',
       `d_end`.`SUM_SORT_SCAN`-IFNULL(`d_start`.`SUM_SORT_SCAN`, 0) AS ''SUM_SORT_SCAN'',
       `d_end`.`SUM_NO_INDEX_USED`-IFNULL(`d_start`.`SUM_NO_INDEX_USED`, 0) AS ''SUM_NO_INDEX_USED'',
       `d_end`.`SUM_NO_GOOD_INDEX_USED`-IFNULL(`d_start`.`SUM_NO_GOOD_INDEX_USED`, 0) AS ''SUM_NO_GOOD_INDEX_USED'',
       `d_end`.`SUM_CPU_TIME`-IFNULL(`d_start`.`SUM_CPU_TIME`, 0) AS ''SUM_CPU_TIME'',
       `d_end`.`MAX_CONTROLLED_MEMORY` AS ''MAX_CONTROLLED_MEMORY'',
       `d_end`.`MAX_TOTAL_MEMORY` AS ''MAX_TOTAL_MEMORY'',
       `d_end`.`COUNT_SECONDARY`-IFNULL(`d_start`.`COUNT_SECONDARY`, 0) AS ''COUNT_SECONDARY'',
       `d_end`.`FIRST_SEEN`,
       `d_end`.`LAST_SEEN`,
       `d_end`.`QUANTILE_95`,
       `d_end`.`QUANTILE_99`,
       `d_end`.`QUANTILE_999`,
       `d_end`.`QUERY_SAMPLE_TEXT`,
       `d_end`.`QUERY_SAMPLE_SEEN`,
       `d_end`.`QUERY_SAMPLE_TIMER_WAIT`
  FROM tmp_digests d_end
       LEFT OUTER JOIN ', v_quoted_table, ' d_start ON `d_start`.`DIGEST` = `d_end`.`DIGEST`
                                                    AND (`d_start`.`SCHEMA_NAME` = `d_end`.`SCHEMA_NAME`
                                                          OR (`d_start`.`SCHEMA_NAME` IS NULL AND `d_end`.`SCHEMA_NAME` IS NULL)
                                                        )
 WHERE `d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0) > 0');
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_runtimes_in_95th_percentile', in_views)) THEN
            SELECT 'Queries with Runtime in 95th Percentile' AS 'Next Output';
            DROP TEMPORARY TABLE IF EXISTS tmp_digest_avg_latency_distribution1;
            DROP TEMPORARY TABLE IF EXISTS tmp_digest_avg_latency_distribution2;
            DROP TEMPORARY TABLE IF EXISTS tmp_digest_95th_percentile_by_avg_us;
            CREATE TEMPORARY TABLE tmp_digest_avg_latency_distribution1 (
              cnt bigint unsigned NOT NULL,
              avg_us decimal(21,0) NOT NULL,
              PRIMARY KEY (avg_us)
            ) ENGINE=InnoDB;
            SET v_sql = CONCAT('INSERT INTO tmp_digest_avg_latency_distribution1
SELECT COUNT(*) cnt,
       ROUND(avg_timer_wait/1000000) AS avg_us
  FROM ', v_digests_table, '
 GROUP BY avg_us');
            CALL sys.execute_prepared_stmt(v_sql);
            CREATE TEMPORARY TABLE tmp_digest_avg_latency_distribution2 LIKE tmp_digest_avg_latency_distribution1;
            INSERT INTO tmp_digest_avg_latency_distribution2 SELECT * FROM tmp_digest_avg_latency_distribution1;
            CREATE TEMPORARY TABLE tmp_digest_95th_percentile_by_avg_us (
              avg_us decimal(21,0) NOT NULL,
              percentile decimal(46,4) NOT NULL,
              PRIMARY KEY (avg_us)
            ) ENGINE=InnoDB;
            SET v_sql = CONCAT('INSERT INTO tmp_digest_95th_percentile_by_avg_us
SELECT s2.avg_us avg_us,
       IFNULL(SUM(s1.cnt)/NULLIF((SELECT COUNT(*) FROM ', v_digests_table, '), 0), 0) percentile
  FROM tmp_digest_avg_latency_distribution1 AS s1
       JOIN tmp_digest_avg_latency_distribution2 AS s2 ON s1.avg_us <= s2.avg_us
 GROUP BY s2.avg_us
HAVING percentile > 0.95
 ORDER BY percentile
 LIMIT 1');
            CALL sys.execute_prepared_stmt(v_sql);
            SET v_sql =
                REPLACE(
                    REPLACE(
                        (SELECT VIEW_DEFINITION
                           FROM information_schema.VIEWS
                          WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_runtimes_in_95th_percentile'
                        ),
                        '`performance_schema`.`events_statements_summary_by_digest`',
                        v_digests_table
                    ),
                    'sys.x$ps_digest_95th_percentile_by_avg_us',
                    '`sys`.`x$ps_digest_95th_percentile_by_avg_us`'
              );
            CALL sys.execute_prepared_stmt(v_sql);
            DROP TEMPORARY TABLE tmp_digest_avg_latency_distribution1;
            DROP TEMPORARY TABLE tmp_digest_avg_latency_distribution2;
            DROP TEMPORARY TABLE tmp_digest_95th_percentile_by_avg_us;
        END IF;
        IF (FIND_IN_SET('analysis', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries Ordered by Total Latency') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statement_analysis'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_errors_or_warnings', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Errors') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_errors_or_warnings'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_full_table_scans', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Full Table Scan') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_full_table_scans'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_sorting', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Sorting') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_sorting'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('with_temp_tables', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Internal Temporary Tables') AS 'Next Output';
            SET v_sql =
                REPLACE(
                    (SELECT VIEW_DEFINITION
                       FROM information_schema.VIEWS
                      WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_temp_tables'
                    ),
                    '`performance_schema`.`events_statements_summary_by_digest`',
                    v_digests_table
                );
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
        IF (FIND_IN_SET('custom', in_views)) THEN
            SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries Using Custom View') AS 'Next Output';
            IF (@sys.statement_performance_analyzer.view IS NULL) THEN
                SET @sys.statement_performance_analyzer.view = sys.sys_get_config('statement_performance_analyzer.view', NULL);
            END IF;
            IF (@sys.statement_performance_analyzer.view IS NULL) THEN
                SIGNAL SQLSTATE '45000'
                   SET MESSAGE_TEXT = 'The @sys.statement_performance_analyzer.view user variable must be set with the view or query to use.';
            END IF;
            IF (NOT INSTR(@sys.statement_performance_analyzer.view, ' ')) THEN
                -- No spaces, so can't be a query
                IF (NOT INSTR(@sys.statement_performance_analyzer.view, '.')) THEN
                    -- No . in the table name - use current database
                    -- DATABASE() will be the database of the procedure
                    SET v_custom_db   = DATABASE(),
                        v_custom_name = @sys.statement_performance_analyzer.view;
                ELSE
                    SET v_custom_db   = SUBSTRING_INDEX(@sys.statement_performance_analyzer.view, '.', 1);
                    SET v_custom_name = SUBSTRING(@sys.statement_performance_analyzer.view, CHAR_LENGTH(v_custom_db)+2);
                END IF;
                CALL sys.table_exists(v_custom_db, v_custom_name, v_custom_view_exists);
                IF (v_custom_view_exists <> 'VIEW') THEN
                    SIGNAL SQLSTATE '45000'
                       SET MESSAGE_TEXT = 'The @sys.statement_performance_analyzer.view user variable is set but specified neither an existing view nor a query.';
                END IF;
                SET v_sql =
                    REPLACE(
                        (SELECT VIEW_DEFINITION
                           FROM information_schema.VIEWS
                          WHERE TABLE_SCHEMA = v_custom_db AND TABLE_NAME = v_custom_name
                        ),
                        '`performance_schema`.`events_statements_summary_by_digest`',
                        v_digests_table
                    );
            ELSE
                SET v_sql = REPLACE(@sys.statement_performance_analyzer.view, '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table);
            END IF;
            IF (@sys.statement_performance_analyzer.limit > 0) THEN
                SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit);
            END IF;
            CALL sys.execute_prepared_stmt(v_sql);
        END IF;
    END IF;
    -- Restore INSTRUMENTED for this thread
    IF (v_this_thread_enabled = 'YES') THEN
        CALL sys.ps_setup_enable_thread(CONNECTION_ID());
    END IF;
    IF ((@log_bin = 1) AND (@@binlog_format = 'STATEMENT')) THEN
        SET sql_log_bin = @log_bin;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `table_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `table_exists`(
        IN in_db VARCHAR(64), IN in_table VARCHAR(64),
        OUT out_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY')
    )
    SQL SECURITY INVOKER
    COMMENT '\nDescription\n-----------\n\nTests whether the table specified in in_db and in_table exists either as a regular\ntable, or as a temporary table. The returned value corresponds to the table that\nwill be used, so if there''s both a temporary and a permanent table with the given\nname, then ''TEMPORARY'' will be returned.\n\nParameters\n-----------\n\nin_db (VARCHAR(64)):\n  The database name to check for the existance of the table in.\n\nin_table (VARCHAR(64)):\n  The name of the table to check the existance of.\n\nout_exists ENUM('''', ''BASE TABLE'', ''VIEW'', ''TEMPORARY''):\n  The return value: whether the table exists. The value is one of:\n    * ''''           - the table does not exist neither as a base table, view, nor temporary table.\n    * ''BASE TABLE'' - the table name exists as a permanent base table table.\n    * ''VIEW''       - the table name exists as a view.\n    * ''TEMPORARY''  - the table name exists as a temporary table.\n\nExample\n--------\n\nmysql> CREATE DATABASE db1;\nQuery OK, 1 row affected (0.07 sec)\n\nmysql> use db1;\nDatabase changed\nmysql> CREATE TABLE t1 (id INT PRIMARY KEY);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> CREATE TABLE t2 (id INT PRIMARY KEY);\nQuery OK, 0 rows affected (0.08 sec)\n\nmysql> CREATE view v_t1 AS SELECT * FROM t1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CREATE TEMPORARY TABLE t1 (id INT PRIMARY KEY);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''t1'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.00 sec)\n\n+------------+\n| @exists    |\n+------------+\n| TEMPORARY  |\n+------------+\n1 row in set (0.00 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''t2'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.00 sec)\n\n+------------+\n| @exists    |\n+------------+\n| BASE TABLE |\n+------------+\n1 row in set (0.01 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''v_t1'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.00 sec)\n\n+---------+\n| @exists |\n+---------+\n| VIEW    |\n+---------+\n1 row in set (0.00 sec)\n\nmysql> CALL sys.table_exists(''db1'', ''t3'', @exists); SELECT @exists;\nQuery OK, 0 rows affected (0.01 sec)\n\n+---------+\n| @exists |\n+---------+\n|         |\n+---------+\n1 row in set (0.00 sec)\n'
BEGIN
    DECLARE v_error BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR 1050 SET v_error = TRUE;
    DECLARE CONTINUE HANDLER FOR 1146 SET v_error = TRUE;
    SET out_exists = '';
    -- Verify whether the table name exists as a normal table
    IF (EXISTS(SELECT 1 FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table)) THEN
        -- Unfortunately the only way to determine whether there is also a temporary table is to try to create
        -- a temporary table with the same name. If it succeeds the table didn't exist as a temporary table.
        SET @sys.tmp.table_exists.SQL = CONCAT('CREATE TEMPORARY TABLE `', in_db, '`.`', in_table, '` (id INT PRIMARY KEY)');
        PREPARE stmt_create_table FROM @sys.tmp.table_exists.SQL;
        EXECUTE stmt_create_table;
        DEALLOCATE PREPARE stmt_create_table;
        IF (v_error) THEN
            SET out_exists = 'TEMPORARY';
        ELSE
            -- The temporary table was created, i.e. it didn't exist. Remove it again so we don't leave garbage around.
            SET @sys.tmp.table_exists.SQL = CONCAT('DROP TEMPORARY TABLE `', in_db, '`.`', in_table, '`');
            PREPARE stmt_drop_table FROM @sys.tmp.table_exists.SQL;
            EXECUTE stmt_drop_table;
            DEALLOCATE PREPARE stmt_drop_table;
            SET out_exists = (SELECT TABLE_TYPE FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table);
        END IF;
    ELSE
        -- Check whether a temporary table exists with the same name.
        -- If it does it's possible to SELECT from the table without causing an error.
        -- If it does not exist even a PREPARE using the table will fail.
        SET @sys.tmp.table_exists.SQL = CONCAT('SELECT COUNT(*) FROM `', in_db, '`.`', in_table, '`');
        PREPARE stmt_select FROM @sys.tmp.table_exists.SQL;
        IF (NOT v_error) THEN
            DEALLOCATE PREPARE stmt_select;
            SET out_exists = 'TEMPORARY';
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `host_summary`
--

/*!50001 DROP VIEW IF EXISTS `host_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary` (`host`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_users`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,format_pico_time(sum(`stmt`.`total_latency`)) AS `statement_latency`,format_pico_time(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,format_pico_time(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,format_bytes(sum(`mem`.`current_allocated`)) AS `current_memory`,format_bytes(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_file_io` (`host`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_file_io_type` (`host`,`event_name`,`total`,`total_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_stages` (`host`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_statement_latency` (`host`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME`)) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_statement_type` (`host`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_buffer_stats_by_schema`
--

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_buffer_stats_by_schema` (`object_schema`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,format_bytes(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,format_bytes(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_buffer_stats_by_table`
--

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_buffer_stats_by_table` (`object_schema`,`object_name`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,format_bytes(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,format_bytes(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_lock_waits` (`wait_started`,`wait_age`,`wait_age_secs`,`locked_table`,`locked_table_schema`,`locked_table_name`,`locked_table_partition`,`locked_table_subpartition`,`locked_index`,`locked_type`,`waiting_trx_id`,`waiting_trx_started`,`waiting_trx_age`,`waiting_trx_rows_locked`,`waiting_trx_rows_modified`,`waiting_pid`,`waiting_query`,`waiting_lock_id`,`waiting_lock_mode`,`blocking_trx_id`,`blocking_pid`,`blocking_query`,`blocking_lock_id`,`blocking_lock_mode`,`blocking_trx_started`,`blocking_trx_age`,`blocking_trx_rows_locked`,`blocking_trx_rows_modified`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,concat(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`),'.',`sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,`rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,`rl`.`OBJECT_NAME` AS `locked_table_name`,`rl`.`PARTITION_NAME` AS `locked_table_partition`,`rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,`rl`.`INDEX_NAME` AS `locked_index`,`rl`.`LOCK_TYPE` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`sys`.`format_statement`(`r`.`trx_query`) AS `waiting_query`,`rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,`rl`.`LOCK_MODE` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`sys`.`format_statement`(`b`.`trx_query`) AS `blocking_query`,`bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,`bl`.`LOCK_MODE` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`performance_schema`.`data_lock_waits` `w` join `information_schema`.`INNODB_TRX` `b` on((`b`.`trx_id` = cast(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `information_schema`.`INNODB_TRX` `r` on((`r`.`trx_id` = cast(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `performance_schema`.`data_locks` `bl` on(((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`) and (`bl`.`ENGINE` = `w`.`ENGINE`)))) join `performance_schema`.`data_locks` `rl` on(((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`) and (`rl`.`ENGINE` = `w`.`ENGINE`)))) order by `r`.`trx_wait_started` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_by_thread_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_by_thread_by_latency` (`user`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`thread_id`,`processlist_id`) AS select if((`performance_schema`.`threads`.`PROCESSLIST_ID` is null),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',convert(`performance_schema`.`threads`.`PROCESSLIST_HOST` using utf8mb4))) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`)) AS `avg_latency`,format_pico_time(max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_file_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_file_by_bytes` (`file`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_write`,`total`,`write_pct`) AS select `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00)) AS `avg_write`,format_bytes((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`)) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_file_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_file_by_latency` (`file`,`total`,`total_latency`,`count_read`,`read_latency`,`count_write`,`write_latency`,`count_misc`,`misc_latency`) AS select `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_wait_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_wait_by_bytes` (`event_name`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`,`total_requested`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written`,format_bytes((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`)) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_wait_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_wait_by_latency` (`event_name`,`total`,`total_latency`,`avg_latency`,`max_latency`,`read_latency`,`write_latency`,`misc_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ`) AS `read_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE`) AS `write_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC`) AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_file_io`
--

/*!50001 DROP VIEW IF EXISTS `latest_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `latest_file_io` (`thread`,`file`,`latency`,`operation`,`requested`) AS select if((`processlist`.`ID` is null),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),convert(concat(`processlist`.`USER`,'@',`processlist`.`HOST`,':',`processlist`.`ID`) using utf8mb4)) AS `thread`,`sys`.`format_path`(`performance_schema`.`events_waits_history_long`.`OBJECT_NAME`) AS `file`,format_pico_time(`performance_schema`.`events_waits_history_long`.`TIMER_WAIT`) AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,format_bytes(`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES`) AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`PROCESSLIST` `processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_host_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_thread_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_thread_by_current_bytes` (`thread_id`,`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select `mt`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `mt`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_user_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_user_by_current_bytes` (`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_global_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_global_by_current_bytes` (`event_name`,`current_count`,`current_alloc`,`current_avg_alloc`,`high_count`,`high_alloc`,`high_avg_alloc`) AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_alloc`,format_bytes(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0)) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED`) AS `high_alloc`,format_bytes(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0)) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_global_total`
--

/*!50001 DROP VIEW IF EXISTS `memory_global_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_global_total` (`total_allocated`) AS select format_bytes(sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `metrics`
--

/*!50001 DROP VIEW IF EXISTS `metrics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `metrics` (`Variable_name`,`Variable_value`,`Type`,`Enabled`) AS select lower(`performance_schema`.`global_status`.`VARIABLE_NAME`) AS `Variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `Variable_value`,'Global Status' AS `Type`,'YES' AS `Enabled` from `performance_schema`.`global_status` union all select `information_schema`.`INNODB_METRICS`.`NAME` AS `Variable_name`,`information_schema`.`INNODB_METRICS`.`COUNT` AS `Variable_value`,concat('InnoDB Metrics - ',`information_schema`.`INNODB_METRICS`.`SUBSYSTEM`) AS `Type`,if((`information_schema`.`INNODB_METRICS`.`STATUS` = 'enabled'),'YES','NO') AS `Enabled` from `information_schema`.`INNODB_METRICS` where (`information_schema`.`INNODB_METRICS`.`NAME` not in ('lock_row_lock_time','lock_row_lock_time_avg','lock_row_lock_time_max','lock_row_lock_waits','buffer_pool_reads','buffer_pool_read_requests','buffer_pool_write_requests','buffer_pool_wait_free','buffer_pool_read_ahead','buffer_pool_read_ahead_evicted','buffer_pool_pages_total','buffer_pool_pages_misc','buffer_pool_pages_data','buffer_pool_bytes_data','buffer_pool_pages_dirty','buffer_pool_bytes_dirty','buffer_pool_pages_free','buffer_pages_created','buffer_pages_written','buffer_pages_read','buffer_data_reads','buffer_data_written','file_num_open_files','os_log_bytes_written','os_log_fsyncs','os_log_pending_fsyncs','os_log_pending_writes','log_waits','log_write_requests','log_writes','innodb_dblwr_writes','innodb_dblwr_pages_written','innodb_page_size')) union all select 'memory_current_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name` union all select 'memory_total_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name` union all select 'NOW()' AS `Variable_name`,now(3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled` union all select 'UNIX_TIMESTAMP()' AS `Variable_name`,round(unix_timestamp(now(3)),3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled` order by `Type`,`Variable_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `processlist`
--

/*!50001 DROP VIEW IF EXISTS `processlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `processlist` (`thd_id`,`conn_id`,`user`,`db`,`command`,`state`,`time`,`current_statement`,`execution_engine`,`statement_latency`,`progress`,`lock_latency`,`cpu_latency`,`rows_examined`,`rows_sent`,`rows_affected`,`tmp_tables`,`tmp_disk_tables`,`full_scan`,`last_statement`,`last_statement_latency`,`current_memory`,`last_wait`,`last_wait_latency`,`source`,`trx_latency`,`trx_state`,`trx_autocommit`,`pid`,`program_name`) AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',convert(`pps`.`PROCESSLIST_HOST` using utf8mb4)),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`sys`.`format_statement`(`pps`.`PROCESSLIST_INFO`) AS `current_statement`,`pps`.`EXECUTION_ENGINE` AS `execution_engine`,if((`esc`.`END_EVENT_ID` is null),format_pico_time(`esc`.`TIMER_WAIT`),NULL) AS `statement_latency`,if((`esc`.`END_EVENT_ID` is null),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,format_pico_time(`esc`.`LOCK_TIME`) AS `lock_latency`,format_pico_time(`esc`.`CPU_TIME`) AS `cpu_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`sys`.`format_statement`(`esc`.`SQL_TEXT`),NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),format_pico_time(`esc`.`TIMER_WAIT`),NULL) AS `last_statement_latency`,format_bytes(`mem`.`current_allocated`) AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if(((`ewc`.`END_EVENT_ID` is null) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',convert(format_pico_time(`ewc`.`TIMER_WAIT`) using utf8mb4)) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,format_pico_time(`etc`.`TIMER_WAIT`) AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ps_check_lost_instrumentation`
--

/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `ps_check_lost_instrumentation` (`variable_name`,`variable_value`) AS select `performance_schema`.`global_status`.`VARIABLE_NAME` AS `variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `variable_value` from `performance_schema`.`global_status` where ((`performance_schema`.`global_status`.`VARIABLE_NAME` like 'perf%lost') and (`performance_schema`.`global_status`.`VARIABLE_VALUE` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_auto_increment_columns`
--

/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_auto_increment_columns` (`table_schema`,`table_name`,`column_name`,`data_type`,`column_type`,`is_signed`,`is_unsigned`,`max_value`,`auto_increment`,`auto_increment_ratio`) AS select `information_schema`.`COLUMNS`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`COLUMNS`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`COLUMNS`.`COLUMN_NAME` AS `COLUMN_NAME`,`information_schema`.`COLUMNS`.`DATA_TYPE` AS `DATA_TYPE`,`information_schema`.`COLUMNS`.`COLUMN_TYPE` AS `COLUMN_TYPE`,(locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) = 0) AS `is_signed`,(locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0) AS `is_unsigned`,((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1)) AS `max_value`,`information_schema`.`TABLES`.`AUTO_INCREMENT` AS `AUTO_INCREMENT`,(`information_schema`.`TABLES`.`AUTO_INCREMENT` / ((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1))) AS `auto_increment_ratio` from (`information_schema`.`COLUMNS` join `information_schema`.`TABLES` on(((`information_schema`.`COLUMNS`.`TABLE_SCHEMA` = `information_schema`.`TABLES`.`TABLE_SCHEMA`) and (`information_schema`.`COLUMNS`.`TABLE_NAME` = `information_schema`.`TABLES`.`TABLE_NAME`)))) where ((`information_schema`.`COLUMNS`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','performance_schema')) and (`information_schema`.`TABLES`.`TABLE_TYPE` = 'BASE TABLE') and (`information_schema`.`COLUMNS`.`EXTRA` = 'auto_increment')) order by (`information_schema`.`TABLES`.`AUTO_INCREMENT` / ((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1))) desc,((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_index_statistics`
--

/*!50001 DROP VIEW IF EXISTS `schema_index_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_index_statistics` (`table_schema`,`table_name`,`index_name`,`rows_selected`,`select_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH`) AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT`) AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE`) AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE`) AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_object_overview`
--

/*!50001 DROP VIEW IF EXISTS `schema_object_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_object_overview` (`db`,`object_type`,`count`) AS select `information_schema`.`routines`.`ROUTINE_SCHEMA` AS `db`,`information_schema`.`routines`.`ROUTINE_TYPE` AS `object_type`,count(0) AS `count` from `information_schema`.`ROUTINES` `routines` group by `information_schema`.`routines`.`ROUTINE_SCHEMA`,`information_schema`.`routines`.`ROUTINE_TYPE` union select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` AS `TABLE_TYPE`,count(0) AS `COUNT(*)` from `information_schema`.`TABLES` `tables` group by `information_schema`.`tables`.`TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` union select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,concat('INDEX (',`information_schema`.`statistics`.`INDEX_TYPE`,')') AS `CONCAT('INDEX (', INDEX_TYPE, ')')`,count(0) AS `COUNT(*)` from `information_schema`.`STATISTICS` `statistics` group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`INDEX_TYPE` union select `information_schema`.`triggers`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,'TRIGGER' AS `TRIGGER`,count(0) AS `COUNT(*)` from `information_schema`.`TRIGGERS` `triggers` group by `information_schema`.`triggers`.`TRIGGER_SCHEMA` union select `information_schema`.`events`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,'EVENT' AS `EVENT`,count(0) AS `COUNT(*)` from `information_schema`.`EVENTS` `events` group by `information_schema`.`events`.`EVENT_SCHEMA` order by `db`,`object_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_redundant_indexes`
--

/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_redundant_indexes` (`table_schema`,`table_name`,`redundant_index_name`,`redundant_index_columns`,`redundant_index_non_unique`,`dominant_index_name`,`dominant_index_columns`,`dominant_index_non_unique`,`subpart_exists`,`sql_drop_index`) AS select `redundant_keys`.`table_schema` AS `table_schema`,`redundant_keys`.`table_name` AS `table_name`,`redundant_keys`.`index_name` AS `redundant_index_name`,`redundant_keys`.`index_columns` AS `redundant_index_columns`,`redundant_keys`.`non_unique` AS `redundant_index_non_unique`,`dominant_keys`.`index_name` AS `dominant_index_name`,`dominant_keys`.`index_columns` AS `dominant_index_columns`,`dominant_keys`.`non_unique` AS `dominant_index_non_unique`,if(((0 <> `redundant_keys`.`subpart_exists`) or (0 <> `dominant_keys`.`subpart_exists`)),1,0) AS `subpart_exists`,concat('ALTER TABLE `',`redundant_keys`.`table_schema`,'`.`',`redundant_keys`.`table_name`,'` DROP INDEX `',`redundant_keys`.`index_name`,'`') AS `sql_drop_index` from (`x$schema_flattened_keys` `redundant_keys` join `x$schema_flattened_keys` `dominant_keys` on(((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`) and (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`)))) where ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`) and (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`) and ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`) or ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`) and (if((`redundant_keys`.`index_name` = 'PRIMARY'),'',`redundant_keys`.`index_name`) > if((`dominant_keys`.`index_name` = 'PRIMARY'),'',`dominant_keys`.`index_name`))))) or ((locate(concat(`redundant_keys`.`index_columns`,','),`dominant_keys`.`index_columns`) = 1) and (`redundant_keys`.`non_unique` = 1)) or ((locate(concat(`dominant_keys`.`index_columns`,','),`redundant_keys`.`index_columns`) = 1) and (`dominant_keys`.`non_unique` = 0)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_lock_waits` (`object_schema`,`object_name`,`waiting_thread_id`,`waiting_pid`,`waiting_account`,`waiting_lock_type`,`waiting_lock_duration`,`waiting_query`,`waiting_query_secs`,`waiting_query_rows_affected`,`waiting_query_rows_examined`,`blocking_thread_id`,`blocking_pid`,`blocking_account`,`blocking_lock_type`,`blocking_lock_duration`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`sys`.`format_statement`(`pt`.`PROCESSLIST_INFO`) AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_statistics`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_statistics` (`table_schema`,`table_name`,`total_latency`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,format_pico_time(`pst`.`SUM_TIMER_WAIT`) AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,format_pico_time(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,format_pico_time(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,format_pico_time(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,format_pico_time(`fsbi`.`sum_timer_misc`) AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_statistics_with_buffer`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_statistics_with_buffer` (`table_schema`,`table_name`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`,`innodb_buffer_allocated`,`innodb_buffer_data`,`innodb_buffer_free`,`innodb_buffer_pages`,`innodb_buffer_pages_hashed`,`innodb_buffer_pages_old`,`innodb_buffer_rows_cached`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,format_pico_time(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,format_pico_time(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,format_pico_time(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,format_pico_time(`fsbi`.`sum_timer_misc`) AS `io_misc_latency`,format_bytes(`ibp`.`allocated`) AS `innodb_buffer_allocated`,format_bytes(`ibp`.`data`) AS `innodb_buffer_data`,format_bytes((`ibp`.`allocated` - `ibp`.`data`)) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_tables_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_tables_with_full_table_scans` (`object_schema`,`object_name`,`rows_full_scanned`,`latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT`) AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is null) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_unused_indexes`
--

/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_unused_indexes` (`object_schema`,`object_name`,`index_name`) AS select `t`.`OBJECT_SCHEMA` AS `object_schema`,`t`.`OBJECT_NAME` AS `object_name`,`t`.`INDEX_NAME` AS `index_name` from (`performance_schema`.`table_io_waits_summary_by_index_usage` `t` join `information_schema`.`STATISTICS` `s` on(((`t`.`OBJECT_SCHEMA` = `information_schema`.`s`.`TABLE_SCHEMA`) and (`t`.`OBJECT_NAME` = `information_schema`.`s`.`TABLE_NAME`) and (`t`.`INDEX_NAME` = `information_schema`.`s`.`INDEX_NAME`)))) where ((`t`.`INDEX_NAME` is not null) and (`t`.`COUNT_STAR` = 0) and (`t`.`OBJECT_SCHEMA` <> 'mysql') and (`t`.`INDEX_NAME` <> 'PRIMARY') and (`information_schema`.`s`.`NON_UNIQUE` = 1) and (`information_schema`.`s`.`SEQ_IN_INDEX` = 1)) order by `t`.`OBJECT_SCHEMA`,`t`.`OBJECT_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session`
--

/*!50001 DROP VIEW IF EXISTS `session`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `session` AS select `processlist`.`thd_id` AS `thd_id`,`processlist`.`conn_id` AS `conn_id`,`processlist`.`user` AS `user`,`processlist`.`db` AS `db`,`processlist`.`command` AS `command`,`processlist`.`state` AS `state`,`processlist`.`time` AS `time`,`processlist`.`current_statement` AS `current_statement`,`processlist`.`execution_engine` AS `execution_engine`,`processlist`.`statement_latency` AS `statement_latency`,`processlist`.`progress` AS `progress`,`processlist`.`lock_latency` AS `lock_latency`,`processlist`.`cpu_latency` AS `cpu_latency`,`processlist`.`rows_examined` AS `rows_examined`,`processlist`.`rows_sent` AS `rows_sent`,`processlist`.`rows_affected` AS `rows_affected`,`processlist`.`tmp_tables` AS `tmp_tables`,`processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`processlist`.`full_scan` AS `full_scan`,`processlist`.`last_statement` AS `last_statement`,`processlist`.`last_statement_latency` AS `last_statement_latency`,`processlist`.`current_memory` AS `current_memory`,`processlist`.`last_wait` AS `last_wait`,`processlist`.`last_wait_latency` AS `last_wait_latency`,`processlist`.`source` AS `source`,`processlist`.`trx_latency` AS `trx_latency`,`processlist`.`trx_state` AS `trx_state`,`processlist`.`trx_autocommit` AS `trx_autocommit`,`processlist`.`pid` AS `pid`,`processlist`.`program_name` AS `program_name` from `processlist` where ((`processlist`.`conn_id` is not null) and (`processlist`.`command` <> 'Daemon')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session_ssl_status`
--

/*!50001 DROP VIEW IF EXISTS `session_ssl_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `session_ssl_status` (`thread_id`,`ssl_version`,`ssl_cipher`,`ssl_sessions_reused`) AS select `sslver`.`THREAD_ID` AS `thread_id`,`sslver`.`VARIABLE_VALUE` AS `ssl_version`,`sslcip`.`VARIABLE_VALUE` AS `ssl_cipher`,`sslreuse`.`VARIABLE_VALUE` AS `ssl_sessions_reused` from ((`performance_schema`.`status_by_thread` `sslver` left join `performance_schema`.`status_by_thread` `sslcip` on(((`sslcip`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslcip`.`VARIABLE_NAME` = 'Ssl_cipher')))) left join `performance_schema`.`status_by_thread` `sslreuse` on(((`sslreuse`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslreuse`.`VARIABLE_NAME` = 'Ssl_sessions_reused')))) where (`sslver`.`VARIABLE_NAME` = 'Ssl_version') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statement_analysis`
--

/*!50001 DROP VIEW IF EXISTS `statement_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statement_analysis` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`rows_affected`,`rows_affected_avg`,`tmp_tables`,`tmp_disk_tables`,`rows_sorted`,`sort_merge_passes`,`max_controlled_memory`,`max_total_memory`,`digest`,`first_seen`,`last_seen`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME`) AS `lock_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CPU_TIME`) AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,format_bytes(`performance_schema`.`events_statements_summary_by_digest`.`MAX_CONTROLLED_MEMORY`) AS `max_controlled_memory`,format_bytes(`performance_schema`.`events_statements_summary_by_digest`.`MAX_TOTAL_MEMORY`) AS `max_total_memory`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_errors_or_warnings`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_errors_or_warnings` (`query`,`db`,`exec_count`,`errors`,`error_pct`,`warnings`,`warning_pct`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_full_table_scans` (`query`,`db`,`exec_count`,`total_latency`,`no_index_used_count`,`no_good_index_used_count`,`no_index_used_pct`,`rows_sent`,`rows_examined`,`rows_sent_avg`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_runtimes_in_95th_percentile`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_runtimes_in_95th_percentile` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`stmts`.`DIGEST_TEXT`) AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,format_pico_time(`stmts`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`stmts`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`stmts`.`AVG_TIMER_WAIT`) AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_sorting`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_sorting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_sorting` (`query`,`db`,`exec_count`,`total_latency`,`sort_merge_passes`,`avg_sort_merges`,`sorts_using_scans`,`sort_using_range`,`rows_sorted`,`avg_rows_sorted`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_temp_tables`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_temp_tables` (`query`,`db`,`exec_count`,`total_latency`,`memory_tmp_tables`,`disk_tmp_tables`,`avg_tmp_tables_per_query`,`tmp_tables_to_disk_pct`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary`
--

/*!50001 DROP VIEW IF EXISTS `user_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary` (`user`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_hosts`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,format_pico_time(sum(`stmt`.`total_latency`)) AS `statement_latency`,format_pico_time(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,format_pico_time(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,format_bytes(sum(`mem`.`current_allocated`)) AS `current_memory`,format_bytes(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_file_io` (`user`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_file_io_type` (`user`,`event_name`,`total`,`latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_stages` (`user`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_statement_latency` (`user`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME`)) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_statement_type` (`user`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `version`
--

/*!50001 DROP VIEW IF EXISTS `version`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `version` (`sys_version`,`mysql_version`) AS select '2.1.3' AS `sys_version`,version() AS `mysql_version` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wait_classes_global_by_avg_latency`
--

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `wait_classes_global_by_avg_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,format_pico_time(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wait_classes_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `wait_classes_global_by_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,format_pico_time(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_by_host_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_by_host_by_latency` (`host`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_by_user_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_by_user_by_latency` (`user`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary` (`host`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_users`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_file_io` (`host`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_file_io_type` (`host`,`event_name`,`total`,`total_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_stages` (`host`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_statement_latency` (`host`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_statement_type` (`host`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME` AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_buffer_stats_by_schema`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_buffer_stats_by_schema` (`object_schema`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_buffer_stats_by_table`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_buffer_stats_by_table` (`object_schema`,`object_name`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_lock_waits` (`wait_started`,`wait_age`,`wait_age_secs`,`locked_table`,`locked_table_schema`,`locked_table_name`,`locked_table_partition`,`locked_table_subpartition`,`locked_index`,`locked_type`,`waiting_trx_id`,`waiting_trx_started`,`waiting_trx_age`,`waiting_trx_rows_locked`,`waiting_trx_rows_modified`,`waiting_pid`,`waiting_query`,`waiting_lock_id`,`waiting_lock_mode`,`blocking_trx_id`,`blocking_pid`,`blocking_query`,`blocking_lock_id`,`blocking_lock_mode`,`blocking_trx_started`,`blocking_trx_age`,`blocking_trx_rows_locked`,`blocking_trx_rows_modified`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,concat(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`),'.',`sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,`rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,`rl`.`OBJECT_NAME` AS `locked_table_name`,`rl`.`PARTITION_NAME` AS `locked_table_partition`,`rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,`rl`.`INDEX_NAME` AS `locked_index`,`rl`.`LOCK_TYPE` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`r`.`trx_query` AS `waiting_query`,`rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,`rl`.`LOCK_MODE` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`b`.`trx_query` AS `blocking_query`,`bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,`bl`.`LOCK_MODE` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`performance_schema`.`data_lock_waits` `w` join `information_schema`.`INNODB_TRX` `b` on((`b`.`trx_id` = cast(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `information_schema`.`INNODB_TRX` `r` on((`r`.`trx_id` = cast(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `performance_schema`.`data_locks` `bl` on(((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`) and (`bl`.`ENGINE` = `w`.`ENGINE`)))) join `performance_schema`.`data_locks` `rl` on(((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`) and (`rl`.`ENGINE` = `w`.`ENGINE`)))) order by `r`.`trx_wait_started` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_by_thread_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_by_thread_by_latency` (`user`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`thread_id`,`processlist_id`) AS select if((`performance_schema`.`threads`.`PROCESSLIST_ID` is null),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',convert(`performance_schema`.`threads`.`PROCESSLIST_HOST` using utf8mb4))) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_file_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_file_by_bytes` (`file`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_write`,`total`,`write_pct`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00) AS `avg_write`,(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_file_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_file_by_latency` (`file`,`total`,`total_latency`,`count_read`,`read_latency`,`count_write`,`write_latency`,`count_misc`,`misc_latency`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC` AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_wait_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_wait_by_bytes` (`event_name`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`,`total_requested`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_wait_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_wait_by_latency` (`event_name`,`total`,`total_latency`,`avg_latency`,`max_latency`,`read_latency`,`write_latency`,`misc_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC` AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$latest_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$latest_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$latest_file_io` (`thread`,`file`,`latency`,`operation`,`requested`) AS select if((`processlist`.`ID` is null),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),convert(concat(`processlist`.`USER`,'@',`processlist`.`HOST`,':',`processlist`.`ID`) using utf8mb4)) AS `thread`,`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,`performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`PROCESSLIST` `processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_host_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_thread_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_thread_by_current_bytes` (`thread_id`,`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select `t`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `t`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_user_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_user_by_current_bytes` (`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_global_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_global_by_current_bytes` (`event_name`,`current_count`,`current_alloc`,`current_avg_alloc`,`high_count`,`high_alloc`,`high_avg_alloc`) AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` AS `current_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` AS `high_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_global_total`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_global_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_global_total` (`total_allocated`) AS select sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$processlist`
--

/*!50001 DROP VIEW IF EXISTS `x$processlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$processlist` (`thd_id`,`conn_id`,`user`,`db`,`command`,`state`,`time`,`current_statement`,`execution_engine`,`statement_latency`,`progress`,`lock_latency`,`cpu_latency`,`rows_examined`,`rows_sent`,`rows_affected`,`tmp_tables`,`tmp_disk_tables`,`full_scan`,`last_statement`,`last_statement_latency`,`current_memory`,`last_wait`,`last_wait_latency`,`source`,`trx_latency`,`trx_state`,`trx_autocommit`,`pid`,`program_name`) AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',convert(`pps`.`PROCESSLIST_HOST` using utf8mb4)),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`pps`.`PROCESSLIST_INFO` AS `current_statement`,`pps`.`EXECUTION_ENGINE` AS `execution_engine`,if((`esc`.`END_EVENT_ID` is null),`esc`.`TIMER_WAIT`,NULL) AS `statement_latency`,if((`esc`.`END_EVENT_ID` is null),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,`esc`.`LOCK_TIME` AS `lock_latency`,`esc`.`CPU_TIME` AS `cpu_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,`mem`.`current_allocated` AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if(((`ewc`.`END_EVENT_ID` is null) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,`etc`.`TIMER_WAIT` AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_digest_95th_percentile_by_avg_us`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_digest_95th_percentile_by_avg_us` (`avg_us`,`percentile`) AS select `s2`.`avg_us` AS `avg_us`,ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) AS `percentile` from (`x$ps_digest_avg_latency_distribution` `s1` join `x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) > 0.95) order by `percentile` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_digest_avg_latency_distribution`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_digest_avg_latency_distribution` (`cnt`,`avg_us`) AS select count(0) AS `cnt`,round((`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` / 1000000),0) AS `avg_us` from `performance_schema`.`events_statements_summary_by_digest` group by `avg_us` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_schema_table_statistics_io`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_schema_table_statistics_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_schema_table_statistics_io` (`table_schema`,`table_name`,`count_read`,`sum_number_of_bytes_read`,`sum_timer_read`,`count_write`,`sum_number_of_bytes_write`,`sum_timer_write`,`count_misc`,`sum_timer_misc`) AS select `extract_schema_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_schema`,`extract_table_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_name`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`) AS `count_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `sum_number_of_bytes_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `sum_timer_read`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`) AS `count_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `sum_number_of_bytes_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `sum_timer_write`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_MISC`) AS `count_misc`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `sum_timer_misc` from `performance_schema`.`file_summary_by_instance` group by `table_schema`,`table_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_flattened_keys`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_flattened_keys` (`table_schema`,`table_name`,`index_name`,`non_unique`,`subpart_exists`,`index_columns`) AS select `information_schema`.`STATISTICS`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`STATISTICS`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`STATISTICS`.`INDEX_NAME` AS `INDEX_NAME`,max(`information_schema`.`STATISTICS`.`NON_UNIQUE`) AS `non_unique`,max(if((`information_schema`.`STATISTICS`.`SUB_PART` is null),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`STATISTICS`.`COLUMN_NAME` order by `information_schema`.`STATISTICS`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns` from `information_schema`.`STATISTICS` where ((`information_schema`.`STATISTICS`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`STATISTICS`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`STATISTICS`.`TABLE_SCHEMA`,`information_schema`.`STATISTICS`.`TABLE_NAME`,`information_schema`.`STATISTICS`.`INDEX_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_index_statistics`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_index_statistics` (`table_schema`,`table_name`,`index_name`,`rows_selected`,`select_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH` AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT` AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE` AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE` AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_lock_waits` (`object_schema`,`object_name`,`waiting_thread_id`,`waiting_pid`,`waiting_account`,`waiting_lock_type`,`waiting_lock_duration`,`waiting_query`,`waiting_query_secs`,`waiting_query_rows_affected`,`waiting_query_rows_examined`,`blocking_thread_id`,`blocking_pid`,`blocking_account`,`blocking_lock_type`,`blocking_lock_duration`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`pt`.`PROCESSLIST_INFO` AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_statistics`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_statistics` (`table_schema`,`table_name`,`total_latency`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`SUM_TIMER_WAIT` AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_statistics_with_buffer`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_statistics_with_buffer` (`table_schema`,`table_name`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`,`innodb_buffer_allocated`,`innodb_buffer_data`,`innodb_buffer_free`,`innodb_buffer_pages`,`innodb_buffer_pages_hashed`,`innodb_buffer_pages_old`,`innodb_buffer_rows_cached`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency`,`ibp`.`allocated` AS `innodb_buffer_allocated`,`ibp`.`data` AS `innodb_buffer_data`,(`ibp`.`allocated` - `ibp`.`data`) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_tables_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_tables_with_full_table_scans` (`object_schema`,`object_name`,`rows_full_scanned`,`latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is null) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$session`
--

/*!50001 DROP VIEW IF EXISTS `x$session`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$session` AS select `x$processlist`.`thd_id` AS `thd_id`,`x$processlist`.`conn_id` AS `conn_id`,`x$processlist`.`user` AS `user`,`x$processlist`.`db` AS `db`,`x$processlist`.`command` AS `command`,`x$processlist`.`state` AS `state`,`x$processlist`.`time` AS `time`,`x$processlist`.`current_statement` AS `current_statement`,`x$processlist`.`execution_engine` AS `execution_engine`,`x$processlist`.`statement_latency` AS `statement_latency`,`x$processlist`.`progress` AS `progress`,`x$processlist`.`lock_latency` AS `lock_latency`,`x$processlist`.`cpu_latency` AS `cpu_latency`,`x$processlist`.`rows_examined` AS `rows_examined`,`x$processlist`.`rows_sent` AS `rows_sent`,`x$processlist`.`rows_affected` AS `rows_affected`,`x$processlist`.`tmp_tables` AS `tmp_tables`,`x$processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`x$processlist`.`full_scan` AS `full_scan`,`x$processlist`.`last_statement` AS `last_statement`,`x$processlist`.`last_statement_latency` AS `last_statement_latency`,`x$processlist`.`current_memory` AS `current_memory`,`x$processlist`.`last_wait` AS `last_wait`,`x$processlist`.`last_wait_latency` AS `last_wait_latency`,`x$processlist`.`source` AS `source`,`x$processlist`.`trx_latency` AS `trx_latency`,`x$processlist`.`trx_state` AS `trx_state`,`x$processlist`.`trx_autocommit` AS `trx_autocommit`,`x$processlist`.`pid` AS `pid`,`x$processlist`.`program_name` AS `program_name` from `x$processlist` where ((`x$processlist`.`conn_id` is not null) and (`x$processlist`.`command` <> 'Daemon')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statement_analysis`
--

/*!50001 DROP VIEW IF EXISTS `x$statement_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statement_analysis` (`query`,`db`,`full_scan`,`exec_count`,`exec_secondary_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`rows_affected`,`rows_affected_avg`,`tmp_tables`,`tmp_disk_tables`,`rows_sorted`,`sort_merge_passes`,`max_controlled_memory`,`max_total_memory`,`digest`,`first_seen`,`last_seen`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_SECONDARY` AS `exec_secondary_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CPU_TIME` AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_CONTROLLED_MEMORY` AS `max_controlled_memory`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_TOTAL_MEMORY` AS `max_total_memory`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_errors_or_warnings`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_errors_or_warnings` (`query`,`db`,`exec_count`,`errors`,`error_pct`,`warnings`,`warning_pct`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_full_table_scans` (`query`,`db`,`exec_count`,`total_latency`,`no_index_used_count`,`no_good_index_used_count`,`no_index_used_pct`,`rows_sent`,`rows_examined`,`rows_sent_avg`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_runtimes_in_95th_percentile`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_runtimes_in_95th_percentile` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `stmts`.`DIGEST_TEXT` AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,`stmts`.`SUM_TIMER_WAIT` AS `total_latency`,`stmts`.`MAX_TIMER_WAIT` AS `max_latency`,`stmts`.`AVG_TIMER_WAIT` AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_sorting`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_sorting` (`query`,`db`,`exec_count`,`total_latency`,`sort_merge_passes`,`avg_sort_merges`,`sorts_using_scans`,`sort_using_range`,`rows_sorted`,`avg_rows_sorted`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_temp_tables`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_temp_tables` (`query`,`db`,`exec_count`,`total_latency`,`memory_tmp_tables`,`disk_tmp_tables`,`avg_tmp_tables_per_query`,`tmp_tables_to_disk_pct`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary` (`user`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_hosts`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_file_io` (`user`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_file_io_type` (`user`,`event_name`,`total`,`latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_stages` (`user`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_statement_latency` (`user`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_statement_type` (`user`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME` AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$wait_classes_global_by_avg_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$wait_classes_global_by_avg_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$wait_classes_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$wait_classes_global_by_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_by_host_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_by_host_by_latency` (`host`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_by_user_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_by_user_by_latency` (`user`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 12:12:10
