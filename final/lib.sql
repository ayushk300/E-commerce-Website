-- MySQL dump 10.13  Distrib 5.5.40, for Win32 (x86)
--
-- Host: localhost    Database: lib
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlogin` (
  `ID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES ('e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `BOOK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BOOK_NAME` varchar(20) NOT NULL,
  `BOOK_ISBN` int(20) NOT NULL,
  `BORROW_STATUS` varchar(5) NOT NULL,
  `BUY_DATE` date DEFAULT NULL,
  PRIMARY KEY (`BOOK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Physics',123459,'No','2016-03-30'),(3,'Maths',951235,'No','2016-03-30'),(5,'New bbok',12548545,'Yes','2016-03-31'),(6,'Herbert Schildt',952317,'Yes','2016-04-01'),(9,'kite runner',8582348,'Yes','2016-05-17'),(10,'geography',388439,'No','2016-05-17'),(11,'civics',73329,'No','2016-05-17');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowed` (
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `BOOK_ID` int(11) NOT NULL DEFAULT '0',
  `BORROW_DATE` date NOT NULL,
  PRIMARY KEY (`USER_ID`,`BOOK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
INSERT INTO `borrowed` VALUES (1,5,'2016-04-05'),(6,6,'2016-05-17'),(6,9,'2016-05-17');
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowedqueue`
--

DROP TABLE IF EXISTS `borrowedqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowedqueue` (
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `BOOK_ID` int(11) NOT NULL DEFAULT '0',
  `REQUEST_DATE` date NOT NULL,
  PRIMARY KEY (`USER_ID`,`BOOK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedqueue`
--

LOCK TABLES `borrowedqueue` WRITE;
/*!40000 ALTER TABLE `borrowedqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowedqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(64) NOT NULL,
  `LAST_NAME` varchar(64) NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `REG_DATE` date NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Amit','Sharma','Male','2016-03-30','d8578edf8458ce06fbc5bb76a58c5ca4'),(4,'Ayush','Khandelwal','Male','2016-04-01','d8578edf8458ce06fbc5bb76a58c5ca4'),(5,'kanika','bakshi','Female','2016-04-07','d8578edf8458ce06fbc5bb76a58c5ca4'),(6,'saksham','garg','Male','2016-05-10','81dc9bdb52d04dc20036dbd8313ed055'),(7,'Apoorva','Jain','Female','2016-05-14','21b72c0b7adc5c7b4a50ffcb90d92dd6');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-17  9:46:25
