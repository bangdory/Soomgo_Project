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
-- Table structure for table `market_order`
--

DROP TABLE IF EXISTS `market_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_order` (
  `mk_order_no` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) NOT NULL,
  `user_num` int NOT NULL,
  `mk_selling_no` int NOT NULL,
  `mk_order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mk_order_reserve_date` date NOT NULL,
  PRIMARY KEY (`mk_order_no`),
  KEY `user_num` (`user_num`),
  KEY `mk_selling_no` (`mk_selling_no`),
  CONSTRAINT `market_order_ibfk_1` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE,
  CONSTRAINT `market_order_ibfk_2` FOREIGN KEY (`mk_selling_no`) REFERENCES `market_selling` (`mk_selling_no`) ON DELETE CASCADE,
  CONSTRAINT `market_order_ibfk_3` FOREIGN KEY (`user_num`) REFERENCES `user` (`user_num`) ON DELETE CASCADE,
  CONSTRAINT `market_order_ibfk_4` FOREIGN KEY (`mk_selling_no`) REFERENCES `market_selling` (`mk_selling_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_order`
--

LOCK TABLES `market_order` WRITE;
/*!40000 ALTER TABLE `market_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_order` ENABLE KEYS */;
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
