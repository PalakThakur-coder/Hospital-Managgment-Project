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
-- Table structure for table `recptable`
--

DROP TABLE IF EXISTS `recptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recptable` (
  `id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `responsibility` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `houseno` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `idname` varchar(100) DEFAULT NULL,
  `idno` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recptable`
--

LOCK TABLES `recptable` WRITE;
/*!40000 ALTER TABLE `recptable` DISABLE KEYS */;
INSERT INTO `recptable` VALUES ('d1001','Palak Thakur','18','Female','jdks','kjdfx','648377493','999palakthakur@gmail.com','','','gohana','Haryana','',NULL,'343232w',NULL),('d1002','abc','45','Female','nurshing','recp','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-09',NULL,'',''),('d1003','abc','45','Female','nurshing','recp','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-17',NULL,'',NULL),('d1004','abca','45','Female','nurshing','recp','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-17',NULL,'',NULL),('r1005','Ritu','20','Female','nurshing','recp','09996868827','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-20',NULL,'',NULL),('r1006','Rituaa','20','Female','nurshing','recp','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-23',NULL,'',NULL);
/*!40000 ALTER TABLE `recptable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-09 20:03:43
