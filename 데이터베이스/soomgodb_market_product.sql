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
-- Table structure for table `market_product`
--

DROP TABLE IF EXISTS `market_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_product` (
  `mk_product_no` int NOT NULL AUTO_INCREMENT,
  `expert_num` int NOT NULL,
  `mk_product_title` varchar(50) NOT NULL,
  `mk_product_title_image` json DEFAULT NULL,
  `mk_product_content` longtext NOT NULL,
  `mk_product_content_image` json DEFAULT NULL,
  `mk_product_qna_title` varchar(50) NOT NULL,
  `mk_product_rules` longtext NOT NULL,
  `mk_product_method` enum('1','2','3') NOT NULL,
  `mk_product_thumbs` int NOT NULL DEFAULT '0',
  `mk_product_click` int NOT NULL DEFAULT '0',
  `mk_product_consent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`mk_product_no`),
  KEY `expert_num` (`expert_num`),
  CONSTRAINT `market_product_ibfk_1` FOREIGN KEY (`expert_num`) REFERENCES `expert` (`expert_num`) ON DELETE CASCADE,
  CONSTRAINT `market_product_ibfk_2` FOREIGN KEY (`expert_num`) REFERENCES `expert` (`expert_num`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_product`
--

LOCK TABLES `market_product` WRITE;
/*!40000 ALTER TABLE `market_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-02 18:03:49
