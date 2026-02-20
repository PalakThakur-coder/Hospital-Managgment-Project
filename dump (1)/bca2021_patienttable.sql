-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bca2021
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `patienttable`
--

DROP TABLE IF EXISTS `patienttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patienttable` (
  `s_no` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `fathername` varchar(20) DEFAULT NULL,
  `grandfathername` varchar(20) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `houseno` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `idname` varchar(100) DEFAULT NULL,
  `idno` varchar(100) DEFAULT NULL,
  `age` varchar(5) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `bookingdate` varchar(100) DEFAULT NULL,
  `patienttype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`s_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patienttable`
--

LOCK TABLES `patienttable` WRITE;
/*!40000 ALTER TABLE `patienttable` DISABLE KEYS */;
INSERT INTO `patienttable` VALUES (1,'p1001','a','Female','vhjk','','9996868823','ritu@gmail.com','67','gjh','sonipat','haryana','2024-04-06',NULL,'','20','',NULL,'opd'),(2,'p1002','ab','Female','vhjk','','9996868823','ritu@gmail.com','67','gjh','sonipat','haryana','2024-04-06',NULL,'','20','',NULL,'opd'),(3,'p1003','Ritus','Female','vhjk','','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-04-08',NULL,'','20','',NULL,'opd'),(4,'p1004','Ritushukj','Female','vhjk','','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-04-08',NULL,'','20','',NULL,'ipd'),(5,'p1005','Ri','Female','vhjk','','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-04-09',NULL,'','20','',NULL,'opd'),(6,'p1006','Riq','Female','vhjk','','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-04-09',NULL,'','20','',NULL,'ipd');
/*!40000 ALTER TABLE `patienttable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-09 20:03:42
