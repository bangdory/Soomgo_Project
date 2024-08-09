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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
                            `CategoryNum` int NOT NULL AUTO_INCREMENT,
                            `Id` int DEFAULT NULL,
                            `P_Id` int DEFAULT NULL,
                            `CategoryName` varchar(20) DEFAULT NULL,
                            PRIMARY KEY (`CategoryNum`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,NULL,'디자인외주'),(2,1,1,'3D모델링'),(3,2,1,'3D영상제작'),(4,3,1,'VR/AR제작'),(5,4,1,'간판디자인'),(6,5,1,'라벨디자인'),(7,6,1,'로고디자인'),(8,7,1,'명함디자인'),(9,8,1,'상세페이지제작'),(10,9,1,'스토리보드/콘티제작'),(11,10,1,'썸네일제작'),(12,11,1,'애니메이션제작'),(13,12,1,'앱디자인'),(14,13,1,'웹디자인'),(15,14,1,'인쇄물디자인'),(16,15,1,'인터넷배너/디스플레이광고디자인'),(17,16,1,'인테리어도면(캐드/3D)'),(18,17,1,'일러스트디자인'),(19,18,1,'제품디자인'),(20,19,1,'캐릭터/이모티콘제작'),(21,20,1,'캘리그라피디자인'),(22,21,1,'커스텀제작'),(23,22,1,'패키지디자인'),(24,23,1,'폰트제작'),(25,24,1,'프레젠테이션디자인'),(26,25,1,'주택설계'),(27,2,NULL,'개발외주'),(28,1,2,'ERP개발'),(29,2,2,'iOS개발'),(30,3,2,'QA/테스트'),(31,4,2,'게임개발'),(32,5,2,'매크로/VGA개발'),(33,6,2,'보안관제'),(34,7,2,'소프트웨어개발'),(35,8,2,'안드로이드개발'),(36,9,2,'앱/웹기획'),(37,10,2,'워드프레스개발'),(38,11,2,'웹개발'),(39,12,2,'웹/앱유지보수'),(40,13,2,'인공지능(AI)개발'),(41,14,2,'챗봇개발'),(42,15,2,'커머스/쇼핑몰개발'),(43,16,2,'퍼블리싱'),(44,3,NULL,'데이터외주'),(45,1,3,'데이터가공및라벨링'),(46,2,3,'데이터복구'),(47,3,3,'데이터크롤링'),(48,4,3,'데이터베이스구축'),(49,5,3,'통계분석'),(50,4,NULL,'컴퓨터실무'),(51,1,4,'데이터분석레슨'),(52,2,4,'정보보안레슨'),(53,3,4,'컴퓨터활용레슨'),(54,4,4,'프로그래밍/코딩레슨'),(55,5,4,'프로토타이핑레슨'),(56,5,NULL,'디자인실무'),(57,1,5,'3D모델링/캐드(CAD)레슨'),(58,2,5,'UI/UX디자인레슨'),(59,3,5,'그래픽디자인레슨'),(60,4,5,'인디자인레슨'),(61,5,5,'일러스트레이터레슨'),(62,6,5,'포토샵레슨');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-02 18:03:50

desc category;

SELECT CategoryName
FROM category
WHERE CategoryName IN (
    SELECT CategoryName
    FROM category
    WHERE P_Id = (
        SELECT Id
        FROM category
        WHERE CategoryName = '디자인외주'
    )
    AND P_Id IS NOT NULL
)
;