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
-- Table structure for table `offlineslip`
--

DROP TABLE IF EXISTS `offlineslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offlineslip` (
  `s_id` varchar(100) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `doctor` varchar(100) DEFAULT NULL,
  `checkup_status` varchar(100) DEFAULT 'Pending',
  `fathername` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `bedno` varchar(100) DEFAULT NULL,
  `disease` varchar(100) DEFAULT NULL,
  `patienttype` varchar(100) DEFAULT NULL,
  `dischargedate` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offlineslip`
--

LOCK TABLES `offlineslip` WRITE;
/*!40000 ALTER TABLE `offlineslip` DISABLE KEYS */;
INSERT INTO `offlineslip` VALUES ('2024-04-06_01','p1001','a','20','Female','2024-04-06','Normal','Ritu','Pending','vhjk','9996868823','gjh','sonipat','haryana',NULL,NULL,'opd',NULL),('2024-04-06_02','p1002','ab','20','Female','2024-04-06','Normal','Ritu','Pending','vhjk','9996868823','gjh','sonipat','haryana',NULL,NULL,'opd','2024-04-09'),('2024-04-08_01','p1004','Ritushukj','20','Female','2024-04-08',NULL,'Ritu','Pending','vhjk','0999686882','gjh','sonipat','haryana','8','heart','ipd',NULL),('2024-04-08_02','p1002','ab','20','Female','2024-04-08','Normal','Ritu','Pending','vhjk','9996868823','gjh','sonipat','haryana',NULL,NULL,'opd','2024-04-09'),('2024-04-08_03','p1001','a','20','Female','2024-04-08','Normal','Ritu','Pending','vhjk','9996868823','gjh','sonipat','haryana',NULL,NULL,'opd',NULL),('2024-04-09_01','p1005','Ri','20','Female','2024-04-09','Normal','Ritu','Pending','vhjk','0999686882','gjh','sonipat','haryana',NULL,NULL,'opd',NULL),('2024-04-09_02','p1006','Riq','20','Female','2024-04-09',NULL,'Ritu','Pending','vhjk','0999686882','gjh','sonipat','haryana','8','heart','ipd',NULL),('2024-04-09_03','p1003','Ritus','20','Female','2024-04-09','Normal','Ritu','Pending','vhjk','0999686882','gjh','sonipat','haryana',NULL,NULL,'opd',NULL),('2024-04-09_04','p1006','Riq','20','Female','2024-04-09',NULL,'Ritu','Pending','vhjk','0999686882','gjh','sonipat','haryana','3','heart','ipd',NULL);
/*!40000 ALTER TABLE `offlineslip` ENABLE KEYS */;
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
