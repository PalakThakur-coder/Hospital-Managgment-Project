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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` varchar(100) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `selectedtest` varchar(100) DEFAULT NULL,
  `totalamount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('p1001','palak thakur','blood test-Rs 500.00, blood test-Rs 500.00, ','1000.00','2023-11-01'),('p1003','minal','blood test-Rs 500.00, Ultrasound-Rs 1000.00, ','1500.00','2023-11-01'),('p1001','palak thakur','x-ray-Rs 700.00, Ultrasound-Rs 1000.00, ','1700.00','2023-11-04'),('p1003','minal','blood test-Rs 500.00, Ultrasound-Rs 1000.00, ','1500.00','2023-11-20'),('p1007','Palak Thakur','blood test-Rs 500.00, blood test-Rs 500.00, ','1000.00','2023-11-20'),('p1004','Palak Thakur','blood test-Rs 500.00, blood test-Rs 500.00, ','1000.00','2023-11-22'),('p1003','minal','blood test-Rs 500.00, blood test-Rs 500.00, ','1000.00','2023-12-01'),('p1020','palak','blood test-Rs 500.00, Ultrasound-Rs 1000.00, ','1500.00','2024-01-18'),('p1004','Rituscywmnh','blood test-Rs 500.00, x-ray-Rs 700.00, ','1200.00','2024-03-17'),('p1004','Rituscywmnh','x-ray-Rs 700.00, x-ray-Rs 700.00, ','1400.00','2024-03-20'),('p1002','ssaaa','[{\"name\":\"x-ray - Rs 700.00\",\"fee\":67427}], ','2.00','2024-03-26'),('p1002','ssaaa','[{\"name\":\"blood test\",\"price\":400},{\"name\":\"Ultrasound\",\"price\":400}], ','800.00','2024-03-26'),('p1002','ssaaa','[{\"name\":\"blood test\",\"price\":null},{\"name\":\"tb\",\"price\":200}], ','NaN','2024-03-26'),('p1002','ssaaa','[{\"name\":\"blood test\",\"price\":400}], ','1066.00','2024-03-27');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
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
