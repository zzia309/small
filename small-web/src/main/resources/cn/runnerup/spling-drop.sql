
drop database test;
CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
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

DROP TABLE IF EXISTS `sp_woflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_woflows` (
  `wof_id` int(11) NOT NULL AUTO_INCREMENT,
  `wof_wo` int(11) NOT NULL,
  `wof_wotype` varchar(64) NOT NULL,
  `wof_oldStatus` varchar(64) DEFAULT NULL,
  `wof_status` varchar(64) DEFAULT NULL,
  `wof_operator` int(11) DEFAULT NULL,
  `wof_descr` text,
  `wof_createdby` int(11) DEFAULT NULL,
  `wof_creater` varchar(64) DEFAULT NULL,
  `wof_created` datetime NOT NULL DEFAULT '2014-01-03 12:05:53',
  PRIMARY KEY (`wof_id`),
  KEY `wof_operator` (`wof_operator`),
  KEY `wof_createdby` (`wof_createdby`),
  KEY `idx_woFlowwotype` (`wof_wotype`),
  CONSTRAINT `sp_woflows_ibfk_1` FOREIGN KEY (`wof_operator`) REFERENCES `sp_users` (`usr_id`),
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

--
-- Dumping data for table `sp_users`
--
DROP TABLE IF EXISTS `sp_businesses`;
CREATE TABLE `sp_businesses` (

  `buss_id` int(11) NOT NULL AUTO_INCREMENT,

  `buss_lenderName` varchar(64) DEFAULT NULL,
  `buss_lenderSex` char(1) DEFAULT NULL,
  `buss_lenderAge` int(11) DEFAULT NULL,
  `buss_lenderCard` varchar(64) DEFAULT NULL,
  `buss_lenderTel` varchar(64) DEFAULT NULL,
  `buss_lenderEstate` varchar(64) DEFAULT NULL,
  `buss_lenderUnit` varchar(64) DEFAULT NULL,
  `buss_lenderUnitTel` varchar(64) DEFAULT NULL,
  `buss_lenderArea` varchar(64) DEFAULT NULL,


  `buss_mateName` varchar(64) DEFAULT NULL,
  `buss_mateSex` char(1) DEFAULT NULL,
  `buss_mateAge` int(11) DEFAULT NULL,
  `buss_mateCard` varchar(64) DEFAULT NULL,
  `buss_mateTel` varchar(64) DEFAULT NULL,
  `buss_mateEstate` varchar(64) DEFAULT NULL,
  `buss_mateUnit` varchar(64) DEFAULT NULL,
  `buss_mateUnitTel` varchar(64) DEFAULT NULL,
  `buss_mateArea` varchar(64) DEFAULT NULL,


  `buss_guaranteeName` varchar(64) DEFAULT NULL,
  `buss_guaranteeSex` char(1) DEFAULT NULL,
  `buss_guaranteeAge` int(11) DEFAULT NULL,
  `buss_guaranteeCard` varchar(64) DEFAULT NULL,
  `buss_guaranteeTel` varchar(64) DEFAULT NULL,
  `buss_guaranteeEstate` varchar(64) DEFAULT NULL,
  `buss_guaranteeUnit` varchar(64) DEFAULT NULL,
  `buss_guaranteeUnitTel` varchar(64) DEFAULT NULL,
  `buss_guaranteeArea` varchar(64) DEFAULT NULL,


  `buss_sales` varchar(64) DEFAULT NULL,
  `buss_manager` varchar(64) DEFAULT NULL,
  `buss_carType` varchar(32) DEFAULT NULL,
  `buss_years` int(11) DEFAULT NULL,


  `buss_bail` decimal(10,0) DEFAULT NULL,
  `buss_notaryFee` decimal(10,0) DEFAULT NULL,
  `buss_other_fee` decimal(10,0) DEFAULT NULL,
  `buss_guaranteeFees` decimal(10,0) DEFAULT NULL,

  `buss_credit` varchar(256) DEFAULT NULL,

  `buss_branch` varchar(64) DEFAULT NULL,
  `buss_advances` decimal(10,0) DEFAULT NULL,
  `buss_advanceDate` datetime DEFAULT NULL,

  `buss_insuranceAgent` varchar(64) DEFAULT NULL,
  `buss_insuranceStart` datetime DEFAULT NULL,
  `buss_insuranceEnd` datetime DEFAULT NULL,
  `buss_certificate` varchar(64) DEFAULT NULL,
  `buss_isImpawn` tinyint(4) DEFAULT NULL,
  `buss_isSongHang` tinyint(4) DEFAULT NULL,

  `buss_status` varchar(64) DEFAULT NULL,

  PRIMARY KEY (`buss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `sp_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_attachments` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `att_user` int(11) NOT NULL,
  `att_model` varchar(64) DEFAULT NULL,
  `att_record` varchar(128) DEFAULT NULL,
  `att_type` int(11) NOT NULL DEFAULT '1',
  `att_filename` varchar(255) NOT NULL,
  `att_path` varchar(2047) NOT NULL,
  `att_mime` varchar(255) DEFAULT NULL,
  `att_size` bigint(20) NOT NULL,
  `att_created` datetime NOT NULL DEFAULT '2013-10-11 10:48:48',
  PRIMARY KEY (`att_id`),
  KEY `idx_attachmentuser` (`att_user`),
  KEY `idx_attachmentrecord` (`att_model`,`att_record`,`att_type`),
  CONSTRAINT `sp_attachments_ibfk_1` FOREIGN KEY (`att_user`) REFERENCES `sp_users` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_attachments`
--

LOCK TABLES `sp_attachments` WRITE;
/*!40000 ALTER TABLE `sp_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_attachments` ENABLE KEYS */;

UNLOCK TABLES;
