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
-- Table structure for table `community_board`
--

DROP TABLE IF EXISTS `community_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_board` (
  `cb_no` int NOT NULL AUTO_INCREMENT,
  `board_no` tinyint NOT NULL,
  `cb_title` varchar(50) NOT NULL,
  `cb_content` longtext NOT NULL,
  `cb_file` json DEFAULT NULL,
  `user_num` int NOT NULL,
  `CategoryNum` int NOT NULL,
  `cb_addr` varchar(50) DEFAULT NULL,
  `cb_currentview` int NOT NULL DEFAULT '0',
  `cb_view` int NOT NULL DEFAULT '0',
  `cb_like` int NOT NULL DEFAULT '0',
  `cb_regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cb_no`),
  KEY `user_num` (`user_num`),
  KEY `CategoryNum` (`CategoryNum`),
  CONSTRAINT `community_board_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE,
  CONSTRAINT `community_board_ibfk_2` FOREIGN KEY (`CategoryNum`) REFERENCES `category` (`CategoryNum`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_board`
--

LOCK TABLES `community_board` WRITE;
/*!40000 ALTER TABLE `community_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_board` ENABLE KEYS */;
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
