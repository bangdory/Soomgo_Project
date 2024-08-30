-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: soomgodb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `request_newbie`
--

DROP TABLE IF EXISTS `request_newbie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_newbie` (
  `req_id` int NOT NULL AUTO_INCREMENT,
  `user_num` int NOT NULL,
  `req_regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `req_sort` varchar(50) NOT NULL,
  `req_type` varchar(50) NOT NULL,
  `req_sub` varchar(100) NOT NULL,
  `req_file1` json DEFAULT NULL,
  `req_file2` json DEFAULT NULL,
  `req_cr` tinyint(1) DEFAULT '0',
  `req_amount` json DEFAULT NULL,
  `req_addService` json DEFAULT NULL,
  `req_result` json DEFAULT NULL,
  `req_day` json DEFAULT NULL,
  `req_time` json DEFAULT NULL,
  `req_age` json DEFAULT NULL,
  `req_sex` json DEFAULT NULL,
  `req_fav` json DEFAULT NULL,
  `req_place` json DEFAULT NULL,
  `req_date` json DEFAULT NULL,
  `req_region` json DEFAULT NULL,
  `req_ref` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `user_num` (`user_num`),
  CONSTRAINT `request_newbie_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_newbie`
--

LOCK TABLES `request_newbie` WRITE;
/*!40000 ALTER TABLE `request_newbie` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_newbie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-02 18:03:48
