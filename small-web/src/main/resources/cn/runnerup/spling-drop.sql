
USE `longyuedatabase`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: sp
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sp_flowauthorizations`
--

DROP TABLE IF EXISTS `sp_flowauthorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_flowauthorizations` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_role` int(11) DEFAULT NULL,
  `fa_fromStatus` varchar(64) DEFAULT NULL,
  `fa_toStatus` varchar(64) NOT NULL,
  `fa_priority` int(11) NOT NULL DEFAULT '0',
  `fa_created` datetime NOT NULL DEFAULT '2014-01-03 12:05:53',
  PRIMARY KEY (`fa_id`),
  UNIQUE KEY `fa_role` (`fa_role`,`fa_fromStatus`,`fa_toStatus`),
  KEY `idx_flowAuthorizationpriority` (`fa_priority`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_flowauthorizations`
--


--
-- Table structure for table `sp_woflows`
--
DROP TABLE IF EXISTS `sp_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_codes` (
  `cod_id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_type` varchar(128) DEFAULT NULL,
  `cod_code` varchar(64) DEFAULT NULL,
  `cod_name` varchar(64) DEFAULT NULL,
  `cod_created` datetime NOT NULL DEFAULT '2014-01-03 12:05:53',
  `cod_createdby` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_id`),
  UNIQUE KEY `cod_code_UNIQUE` (`cod_code`),
  KEY `key1` (`cod_createdby`),
  CONSTRAINT `key1` FOREIGN KEY (`cod_createdby`) REFERENCES `sp_users` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `sp_woflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_woflows` (
  `wof_id` int(11) NOT NULL AUTO_INCREMENT,
  `wof_wo` int(11) NOT NULL,
  `wof_oldStatus` varchar(64) DEFAULT NULL,
  `wof_status` varchar(64) DEFAULT NULL,
  `wof_descr` text,
  `wof_createdby` int(11) DEFAULT NULL,
  `wof_created` datetime NOT NULL DEFAULT '2014-01-03 12:05:53',
  PRIMARY KEY (`wof_id`),
  KEY `wof_createdby` (`wof_createdby`),
  CONSTRAINT `sp_woflows_ibfk_2` FOREIGN KEY (`wof_createdby`) REFERENCES `sp_users` (`usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_woflows`
--

--
-- Table structure for table `sp_users`
--

DROP TABLE IF EXISTS `sp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_username` varchar(64) NOT NULL,
  `usr_password` char(40) NOT NULL,
  `usr_fullname` varchar(128) DEFAULT NULL,
  `usr_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `usr_idnumber` varchar(32) DEFAULT NULL,
  `usr_gender` varchar(1) DEFAULT 'M',
  `usr_address` varchar(256) DEFAULT NULL,
  `usr_postalcode` varchar(32) DEFAULT NULL,
  `usr_tel` varchar(32) DEFAULT NULL,
  `usr_mobile` varchar(32) DEFAULT NULL,
  `usr_email` varchar(128) DEFAULT NULL,
  `usr_qq` varchar(32) DEFAULT NULL,
  `usr_priority` int(11) DEFAULT 0,
  `usr_created` datetime NOT NULL DEFAULT '2013-10-11 10:48:48',
  `usr_updated` datetime NOT NULL DEFAULT '2013-10-11 10:48:48',
  `usr_createdby` int(11) DEFAULT NULL,
  `usr_updatedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `usr_username` (`usr_username`),
  KEY `usr_createdby` (`usr_createdby`),
  KEY `usr_updatedby` (`usr_updatedby`),
  CONSTRAINT `sp_users_ibfk_4` FOREIGN KEY (`usr_createdby`) REFERENCES `sp_users` (`usr_id`) ON DELETE SET NULL,
  CONSTRAINT `sp_users_ibfk_5` FOREIGN KEY (`usr_updatedby`) REFERENCES `sp_users` (`usr_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `sp_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_customers` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cs_loanerName` varchar(64) DEFAULT NULL,
  `cs_loanerSex`  varchar(1) DEFAULT 'M',
  `cs_loanerAge` int(11) DEFAULT NULL,
  `cs_loanerCard` varchar(64) DEFAULT NULL,
  `cs_loanerTel` varchar(64) DEFAULT NULL,
  `cs_loanerHomeAddress` varchar(64) DEFAULT NULL,
  `cs_loanerUnit` varchar(64) DEFAULT NULL,
  `cs_loanerUnitTel` varchar(64) DEFAULT NULL,
  `cs_loanerMarry` varchar(64) DEFAULT NULL,
  `cs_loanerBirthplace` varchar(64) DEFAULT NULL,
  `cs_loanerHukou` varchar(64) DEFAULT NULL,
  `cs_loanerUnitAddress` varchar(64) DEFAULT NULL,
  `cs_loanerPosition` varchar(64) DEFAULT NULL,
  `cs_mateName` varchar(64) DEFAULT NULL,
  `cs_mateAge` int(11) DEFAULT NULL,
  `cs_mateCard` varchar(64) DEFAULT NULL,
  `cs_mateTel` varchar(64) DEFAULT NULL,
  `cs_mateUnit` varchar(64) DEFAULT NULL,
  `cs_mateUnitTel` varchar(64) DEFAULT NULL,
  `cs_mateBirthplace` varchar(64) DEFAULT NULL,
  `cs_mateHukou` varchar(64) DEFAULT NULL,
  `cs_mateUnitAddress` varchar(64) DEFAULT NULL,
  `cs_matePosition` varchar(64) DEFAULT NULL,
  `cs_guaranteeName` varchar(64) DEFAULT NULL,
  `cs_guaranteeSex`  varchar(1) DEFAULT NULL,
  `cs_guaranteeAge` int(11) DEFAULT NULL,
  `cs_guaranteeCard` varchar(64) DEFAULT NULL,
  `cs_guaranteeTel` varchar(64) DEFAULT NULL,
  `cs_guaranteeHomeAddress` varchar(64) DEFAULT NULL,
  `cs_guaranteeUnit` varchar(64) DEFAULT NULL,
  `cs_guaranteeUnitTel` varchar(64) DEFAULT NULL,
  `cs_guaranteeArea` varchar(64) DEFAULT NULL,
  `cs_guaranteeMarry` varchar(64) DEFAULT NULL,
  `cs_guaranteeBirthplace` varchar(64) DEFAULT NULL,
  `cs_guaranteeHukou` varchar(64) DEFAULT NULL,
  `cs_guaranteeUnitAddress` varchar(64) DEFAULT NULL,
  `cs_guaranteePosition` varchar(64) DEFAULT NULL,
  `cs_sales` varchar(64) DEFAULT NULL,
  `cs_manager` varchar(64) DEFAULT NULL,
  `cs_years` int(11) DEFAULT NULL,
  `cs_stages` int(11) DEFAULT NULL,
  `cs_carType` varchar(32) DEFAULT NULL,
  `cs_carPrice` double(32, 4) DEFAULT NULL,
  `cs_carLoans` double(32, 4) DEFAULT NULL,
  `cs_carRate` double(32, 4) DEFAULT NULL,
  `cs_carBrokerage` double(32, 4) DEFAULT NULL,
  `cs_carToObject` varchar(64) DEFAULT NULL,
  `cs_carToAccount` varchar(64) DEFAULT NULL,
  `cs_bail` double(32, 4) DEFAULT NULL,
  `cs_notaryFees` double(32, 4) DEFAULT NULL,
  `cs_otherFees` double(32, 4) DEFAULT NULL,
  `cs_guaranteeFees` double(32, 4) DEFAULT NULL,
  `cs_isflow` tinyint(1) NOT NULL DEFAULT '0',
  `cs_createdby` int(11) NOT NULL,
  `cs_created` datetime NOT NULL,
  `cs_guaranteeMateName` varchar(64) DEFAULT NULL,
  `cs_guaranteeMateCard` varchar(64) DEFAULT NULL,
  `cs_guaranteeMateTel` varchar(64) DEFAULT NULL,
  `cs_isBank` tinyint(1) NOT NULL DEFAULT '0',
  `cs_bankAccount` varchar(64) DEFAULT NULL,
  `cs_isGps` tinyint(1) NOT NULL DEFAULT '0',
  `cs_prepayments` double(32, 4) DEFAULT NULL,
  `cs_listedAreas` varchar(64) DEFAULT NULL,
  `cs_dealer` varchar(128) DEFAULT NULL,

  `cs_lianxiren1`  varchar(64) DEFAULT NULL,
  `cs_lianxiren1dianhua` varchar(64) DEFAULT NULL,
  `cs_lianxiren1sex` varchar(64) DEFAULT NULL,
  `cs_lianxiren1guanxi` varchar(64) DEFAULT NULL,

  `cs_lianxiren2`  varchar(64) DEFAULT NULL,
  `cs_lianxiren2dianhua` varchar(64) DEFAULT NULL,
  `cs_lianxiren2sex` varchar(64) DEFAULT NULL,
  `cs_lianxiren2guanxi` varchar(64) DEFAULT NULL,



  PRIMARY KEY (`cs_id`),
  KEY `foreign_key_createdby` (`cs_createdby`),
  CONSTRAINT `foreign_key_createdby` FOREIGN KEY (`cs_createdby`) REFERENCES `sp_users` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `sp_users`
--
DROP TABLE IF EXISTS `sp_businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_businesses` (
  `buss_id` int(11) NOT NULL AUTO_INCREMENT,
  `buss_customer` int(11) NOT NULL,
  `buss_credit` varchar(256) DEFAULT NULL,
  `buss_publicOrder` varchar(256) DEFAULT NULL,
  `buss_court` varchar(256) DEFAULT NULL,
  `buss_advances` double(32, 4) DEFAULT NULL,
  `buss_advanceDate` datetime DEFAULT NULL,
  `buss_loanDate` datetime DEFAULT NULL,
  `buss_insuranceAgent` varchar(64) DEFAULT NULL,
  `buss_insuranceStart` datetime DEFAULT NULL,
  `buss_insuranceEnd` datetime DEFAULT NULL,
  `buss_certificate` varchar(64) DEFAULT NULL,
  `buss_isImpawn` tinyint(4) DEFAULT NULL,
  `buss_isSongHang` tinyint(4) DEFAULT NULL,
  `buss_carModel` varchar(64) DEFAULT NULL,
  `buss_carEngine` varchar(64) DEFAULT NULL,
  `buss_carFrame` varchar(64) DEFAULT NULL,
  `buss_status` varchar(64) DEFAULT NULL,
  `buss_carNo` varchar(64) DEFAULT NULL,
  `buss_advanceBank` varchar(64) DEFAULT NULL,
  `buss_amounts` double(32, 4) DEFAULT NULL,
  `buss_profits` double(32, 4) DEFAULT NULL,
  `buss_finishTime` datetime DEFAULT NULL,
  `buss_buqicailiao` varchar(256) DEFAULT NULL,

  `buss_songdayinhangriqi` datetime DEFAULT NULL,

  PRIMARY KEY (`buss_id`),
  KEY `foreign_key_customer` (`buss_customer`),
  CONSTRAINT `foreign_key_customer` FOREIGN KEY (`buss_customer`) REFERENCES `sp_customers` (`cs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `sp_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table if not exists sp_attachments(
	att_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	att_user int NOT NULL,
	att_model varchar(64) NULL,
	att_record varchar(128) NULL,
	att_type int DEFAULT 1 NOT NULL,
	att_filename varchar(255) NOT NULL,
	att_path varchar(2047) NOT NULL,
	att_mime varchar(255) NULL,
	att_size bigint NOT NULL,
	att_created datetime DEFAULT '2013-11-07 12:52:54.893' NOT NULL,
	foreign key (att_user) references sp_users (usr_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_attachments`
--

LOCK TABLES `sp_attachments` WRITE;
/*!40000 ALTER TABLE `sp_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_attachments` ENABLE KEYS */;

UNLOCK TABLES;
