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
-- Table structure for table `ipdslip`
--

DROP TABLE IF EXISTS `ipdslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipdslip` (
  `s_id` varchar(100) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `doctor` varchar(100) DEFAULT NULL,
  `checkup_status` varchar(100) DEFAULT 'Pending',
  `fathername` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `bedno` varchar(100) DEFAULT NULL,
  `disease` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipdslip`
--

LOCK TABLES `ipdslip` WRITE;
/*!40000 ALTER TABLE `ipdslip` DISABLE KEYS */;
INSERT INTO `ipdslip` VALUES ('2024-03-19_01','p1040','ss','22','Female','2024-03-19','Ritu','Pending','xcz','0999686882','gjh','sonipat','haryana','2',NULL),('2024-03-19_02','p1039','Ravi','22','Female','2024-03-19','abc','Pending','xcz','0999686882','gjh','sonipat','haryana','1','mind Problem'),('2024-03-19_03','p1006','Rituscywmnh','32','Female','2024-03-19','Ritu','Pending','xcz','0999686882','gjh','sonipat','haryana','1','mind Problem'),('2024-03-19_04','p1007','Rituscywmnh','32','Female','2024-03-19','Ritu','Pending','xcz','0999686882678','gjh','sonipat','haryana','1','mind Problem'),('2024-03-19_05','p1040','ss','22','Female','2024-03-19','Ritu','Pending','xcz','0999686882','gjh','sonipat','haryana','2','heart'),('2024-03-19_06','p1040','ss','22','Female','2024-03-19','Ritu','Pending','xcz','0999686882','gjh','sonipat','haryana','2','heart'),('2024-03-21_01','p1001','R','45','Female','2024-03-21','Ritu','Pending','vhjk','09996868827','gjh','sonipat','haryana','1','mind Problem'),('2024-03-22_01','p1001','R','45','Female','2024-03-22','Ritu','Pending','vhjk','09996868827','gjh','sonipat','haryana','1','mind Problem'),('2024-03-23_01','p1002','ssaaa','22','Female','2024-03-23','Ritu','Pending','xcz','0999686882','gjh','sonipat','haryana','1','mind Problem');
/*!40000 ALTER TABLE `ipdslip` ENABLE KEYS */;
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
