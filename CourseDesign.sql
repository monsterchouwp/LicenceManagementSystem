-- MySQL dump 10.13  Distrib 8.0.30, for macos12.4 (x86_64)
--
-- Host: 127.0.0.1    Database: CourseDesign
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `num` int DEFAULT NULL,
  `eid_1` int DEFAULT NULL,
  `eid_2` int DEFAULT NULL,
  `eid_3` int DEFAULT NULL,
  `eid_4` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realName` varchar(200) DEFAULT NULL,
  `idNum` varchar(200) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `admin_idNum_uindex` (`idNum`),
  KEY `fk_borrow1` (`eid_1`),
  KEY `fk_borrow2` (`eid_2`),
  KEY `fk_borrow3` (`eid_3`),
  KEY `fk_borrow4` (`eid_4`),
  CONSTRAINT `fk_borrow1` FOREIGN KEY (`eid_1`) REFERENCES `entity` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_borrow2` FOREIGN KEY (`eid_2`) REFERENCES `entity` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_borrow3` FOREIGN KEY (`eid_3`) REFERENCES `entity` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_borrow4` FOREIGN KEY (`eid_4`) REFERENCES `entity` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','123','666',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Fan','123456','13393866138',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Jie','123','18675645345',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Zhao','123','15136378136',1,1,5,NULL,NULL,NULL,NULL,'zhao','123456',NULL),('张三','123','13782634098',1,2,1,2,NULL,NULL,'翻斗花园三号楼','张三','233823377712837823',NULL),('李四','123','18638729383',1,NULL,NULL,NULL,NULL,NULL,'M78星云一号仓','李四','422833377182739832',NULL),('王五','123','18533722617',1,0,NULL,NULL,NULL,NULL,'中州大学','null','null','未实名');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity` (
  `eid` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `entity_name_uindex` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` VALUES (1,'郑州854966',0,'在2022年11月20日闯红绿灯罚款未交'),(2,'郑州792818',0,''),(3,'郑州668723',0,''),(4,'郑州228731',1,''),(5,'郑州666666',0,'special'),(6,'郑州987721',1,''),(10,'郑州854018',1,''),(11,'郑州457553',1,NULL),(12,'郑州354018',1,''),(13,'郑州886755',1,NULL),(15,'郑州186456',1,NULL),(22,'郑州852318',1,''),(33,'郑州899999',1,'该车牌号码特殊，优先为优先级高的分配');
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `realName` varchar(20) DEFAULT NULL,
  `idNum` varchar(200) DEFAULT NULL,
  `u_name` varchar(20) DEFAULT NULL,
  `eid` int DEFAULT NULL,
  `e_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `begintime` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('张三','233823377712837823','张三',1,'郑州854932','13782634098','2022-11-23'),('张三','233823377712837823','张三',2,'郑州792818','13782634098','2022-11-24'),('zhao','123456','Zhao',5,'郑州666666','15136378136','2022-11-26');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `u_name` varchar(20) NOT NULL,
  `eid` int NOT NULL,
  `e_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `begintime` varchar(255) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES ('张三',3,'郑州668723','13782634098','2022-11-25',1);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordID`
--

DROP TABLE IF EXISTS `recordID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recordID` (
  `realName` varchar(20) DEFAULT NULL,
  `idNum` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `begintime` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordID`
--

LOCK TABLES `recordID` WRITE;
/*!40000 ALTER TABLE `recordID` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordID` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26 15:45:11
