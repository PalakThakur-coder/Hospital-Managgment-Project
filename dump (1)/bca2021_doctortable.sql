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
-- Table structure for table `doctortable`
--

DROP TABLE IF EXISTS `doctortable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctortable` (
  `id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `specialisation` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `houseno` varchar(20) DEFAULT NULL,
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
-- Dumping data for table `doctortable`
--

LOCK TABLES `doctortable` WRITE;
/*!40000 ALTER TABLE `doctortable` DISABLE KEYS */;
INSERT INTO `doctortable` VALUES ('d1001','palak','23','Female','sdsf','dfd','353465','999palakthakur@gmail.com','34','werg','sdfgh','sdffgh','29-09-2023','ww','45657',NULL),('d1002','Minal','20','Female','nurshing','heart','9996868827','minal@gmail.com','','','sonipat','haryana','2023-11-29',NULL,'',''),('d1003','Ritu','20','Female','MBBS','General','9996868827','ritu@gmail.com','','','gohana','haryana','',NULL,'',''),('d1004','abc','20','Female','MBBS','mind','09996868827','ritu@gmail.com','67','gjh','sonipat','haryana','',NULL,'',''),('d1005','abca','20','Female','MBBS','mind','09996868827','ritu@gmail.com','67','gjh','sonipat','haryana','',NULL,'',''),('d1006','abcaa','20','Female','MBBS','mind','09996868827','ritu@gmail.com','67','gjh','sonipat','haryana','',NULL,'',''),(NULL,'abcaan','20','Female','MBBS','mind','9996868827','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-17',NULL,'',NULL),(NULL,'Rituhjeeuosmn','20','Female','nurshing','heart','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-20','','',NULL),('d1007','Rituhjeeuosmns','20','Female','nurshing','heart','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-20',NULL,'',NULL),('d1008','a','20','Female','nurshing','heart','0123333333','ritu@gmail.com','67','gjh','sonipat','sd','2024-03-23','ghfh','887766554488',NULL),('d1009','ad','20','Female','nurshing','heart','0123333333','ritu@gmail.com','67','gjh','sonipat','sd','2024-03-23','Voter','ABC1234567',NULL),('d1010','Ritu','44','Female','nurshing','heart','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-31','Aadhar','66778844',NULL),('d1011','Ritu','44','Female','nurshing','heart','0999686882','ritu@gmail.com','67','gjh','sonipat','haryana','2024-03-31',NULL,'',NULL);
/*!40000 ALTER TABLE `doctortable` ENABLE KEYS */;
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
