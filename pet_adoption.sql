-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pet_adotion
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `Adimin_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `manager_name` varchar(10) NOT NULL COMMENT '管理员账号',
  `password` varchar(255) DEFAULT NULL,
  `Contact` varchar(50) NOT NULL COMMENT '联系方式',
  PRIMARY KEY (`Adimin_id`),
  UNIQUE KEY `manager_name` (`manager_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'admin1','ad0ee044fc2281e605831a6792878c3d005e2926a42cbf0828f110a9ec1c3b74','1111122233'),(2,'admin2','5ff441fb3dbf2f4914b1bbbd1335a894149b6356f1b8f28219ef3d7cb46034e5','1234444@qq.com'),(3,'admin3','dbd58de0f08cc3261da30224f157e88c66206cb5af8bd81a44f71bb64286f4cf','1asfa44@qq.com'),(4,'admin4','0c5bb501cb5c709a01146458abc21fd075cb07797397d453cd06cf6169f9676f','afsag@qq.com'),(5,'admin5','2c8990c6c58db3153005e1d9c120a92d91a72aba08a26eba5b2791b158acac4b','gerwgh@qq.com'),(6,'admin6','1354756f2431eae30867f2d1fb2aced1ee3b527ebf3709ebb4d91358254f16a6','dfgasfg44@qq.com'),(7,'admin7','fe7fb49d6e1431678dc28a5f07573fdd48953aeee7e1f50e4e7387612bff7915','1asfgagf444@qq.com'),(8,'admin8','1ee27fa170b4f5d6bf8ab67000a8faa5d678020777eb4541d351febe78ee1faa','fgaswe4444@qq.com'),(9,'admin9','57bed1c6a87fa61aa65a3069236349582e21bd8e56518c0326046bfdc9c27935','aaaaa444@qq.com'),(10,'admin10','49d2639ab146b2c9728fa40ef9dc89c54e18ee0e1c3ed08034dff7e1e40ee343','1234444@qq.com');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption_applications`
--

DROP TABLE IF EXISTS `adoption_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_applications` (
  `Application_id` int NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `User_id` int NOT NULL COMMENT '用户id',
  `Pet_id` int NOT NULL COMMENT '宠物id',
  `Application_Time` datetime NOT NULL COMMENT '申请时间',
  `Adoption_Status` tinyint NOT NULL COMMENT '申请处理状态\r\n0：未处理\r\n1：已处理\r\n',
  `Ccomment` int NOT NULL COMMENT '1:申请领养  0:申请归还',
  PRIMARY KEY (`Application_id`),
  KEY `fk_ID` (`User_id`),
  KEY `fk_pet_id` (`Pet_id`),
  CONSTRAINT `fk_ID` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  CONSTRAINT `fk_pet_id` FOREIGN KEY (`Pet_id`) REFERENCES `pets` (`Pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='领养申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_applications`
--

LOCK TABLES `adoption_applications` WRITE;
/*!40000 ALTER TABLE `adoption_applications` DISABLE KEYS */;
INSERT INTO `adoption_applications` VALUES (1,7,1,'2024-05-13 10:30:00',1,1),(2,8,1,'2024-05-12 09:45:00',1,1),(3,10,3,'2024-05-11 08:20:00',1,1),(4,4,4,'2024-01-13 11:10:00',1,1),(5,9,4,'2024-05-10 14:55:00',1,1),(6,1,1,'2024-01-10 10:30:00',1,1),(7,1,1,'2024-01-11 14:20:00',1,1),(8,2,2,'2024-01-12 09:15:00',1,0),(9,4,2,'2024-01-13 11:00:00',1,1),(10,5,5,'2024-01-14 16:45:00',1,1),(11,6,6,'2024-01-15 12:30:00',1,1),(12,7,7,'2024-01-16 14:50:00',1,1),(13,8,8,'2024-01-17 10:10:00',1,1),(14,9,9,'2024-01-18 15:40:00',1,1),(15,10,10,'2024-01-19 13:25:00',1,1),(16,1,11,'2024-01-20 09:50:00',1,1),(17,2,12,'2024-01-21 11:35:00',1,1),(18,3,13,'2024-01-22 12:50:00',1,1),(19,4,14,'2024-01-23 14:10:00',1,1),(20,5,15,'2024-01-24 16:30:00',1,1),(21,1,1,'2024-01-25 09:25:00',1,0),(22,2,2,'2024-01-26 14:40:00',1,0),(23,3,3,'2024-01-27 13:50:00',1,0),(24,4,4,'2024-01-28 15:10:00',1,0),(25,5,5,'2024-06-07 11:20:00',1,1),(26,3,3,'2024-01-12 10:25:38',1,1),(27,5,5,'2024-05-09 10:33:41',1,0),(28,2,2,'2024-01-11 16:38:53',1,1),(29,8,8,'2024-06-18 10:40:27',0,0),(30,9,18,'2024-06-20 10:41:26',0,1),(31,10,19,'2024-07-05 14:17:12',1,1),(32,9,18,'2024-07-05 14:17:58',0,0),(33,9,18,'2024-07-05 15:16:15',0,1),(34,10,20,'2024-07-05 15:23:26',1,1),(35,10,18,'2024-07-05 15:24:33',0,1);
/*!40000 ALTER TABLE `adoption_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption_records`
--

DROP TABLE IF EXISTS `adoption_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_records` (
  `Adoption_Records_id` int NOT NULL AUTO_INCREMENT COMMENT '领养记录id',
  `User_id` int DEFAULT NULL COMMENT '用户id',
  `Pet_id` int DEFAULT NULL COMMENT '宠物id',
  `Adoption_Time` date DEFAULT NULL COMMENT '领养时间',
  `adoption_Status` tinyint NOT NULL COMMENT '0：已归还\r\n1：正在领养\r\n',
  PRIMARY KEY (`Adoption_Records_id`),
  KEY `fk_User_id` (`User_id`),
  KEY `fk_Pet_id1` (`Pet_id`),
  CONSTRAINT `fk_Pet_id1` FOREIGN KEY (`Pet_id`) REFERENCES `pets` (`Pet_id`),
  CONSTRAINT `fk_User_id` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='领养记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_records`
--

LOCK TABLES `adoption_records` WRITE;
/*!40000 ALTER TABLE `adoption_records` DISABLE KEYS */;
INSERT INTO `adoption_records` VALUES (1,7,1,'2024-05-13',1),(2,8,2,'2024-05-12',1),(3,10,3,'2024-05-11',1),(4,9,4,'2024-05-10',1),(5,5,5,'2024-05-09',0),(6,4,2,'2024-01-13',1),(7,2,2,'2024-01-12',0),(8,1,1,'2024-01-11',1),(9,2,2,'2024-01-11',1),(10,3,3,'2024-01-12',1),(11,4,4,'2024-01-13',1),(12,5,5,'2024-01-14',1),(13,6,6,'2024-01-15',1),(14,7,7,'2024-01-16',1),(15,8,8,'2024-01-17',1),(16,9,9,'2024-01-18',1),(17,10,10,'2024-01-19',1),(18,1,11,'2024-01-20',1),(19,2,12,'2024-01-21',1),(20,3,13,'2024-01-22',1),(21,4,14,'2024-01-23',1),(22,5,15,'2024-01-24',1),(23,1,1,'2024-01-25',0),(24,4,2,'2024-01-26',0),(25,3,3,'2024-01-27',0),(26,4,4,'2024-01-28',0),(27,5,5,'2024-06-07',1),(28,8,8,'2024-07-05',1),(29,9,9,'2024-07-05',1),(30,9,9,'2024-07-05',0),(31,9,9,'2024-07-05',1),(32,9,18,'2024-07-05',1),(33,10,19,'2024-07-05',1),(34,9,18,'2024-07-05',0),(35,9,18,'2024-07-05',0),(36,9,18,'2024-07-05',0),(37,9,18,'2024-07-05',0),(38,9,18,'2024-07-05',0),(39,9,18,'2024-07-05',0),(40,9,18,'2024-07-05',0),(41,10,19,'2024-07-05',1),(42,9,18,'2024-07-05',1),(43,9,18,'2024-07-06',1),(44,9,18,'2024-07-07',0),(45,10,18,'2024-07-08',1),(46,9,18,'2024-07-09',1),(47,10,19,'2024-07-09',1),(48,9,18,'2024-07-09',0),(49,10,18,'2024-07-09',1),(50,8,8,'2024-07-10',0);
/*!40000 ALTER TABLE `adoption_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `Notification_id` int NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `User_id` int DEFAULT NULL COMMENT '用户id',
  `Notification_Time` date DEFAULT NULL COMMENT '通知时间',
  `Notification_Content` text COMMENT '通知内容',
  `Admin_id` int NOT NULL,
  `Adoption_Status` tinyint NOT NULL COMMENT '投诉处理状态\r\n0：未处理\r\n1：已处理\r\n2：正在处理\r\n',
  PRIMARY KEY (`Notification_id`),
  KEY `fk_User_id1` (`User_id`),
  KEY `fk_Admin_id3` (`Admin_id`),
  CONSTRAINT `fk_Admin_id3` FOREIGN KEY (`Admin_id`) REFERENCES `administrators` (`Adimin_id`),
  CONSTRAINT `fk_User_id1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投诉记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,1,'2024-05-13','宠物领养流程不透明，希望能有更多信息公开。',1,1),(2,2,'2024-05-12','我领养的宠物有健康问题，希望得到处理。',2,1),(3,3,'2024-05-11','宠物领养中心服务态度不佳，希望能有改善。',3,1),(4,4,'2024-05-10','领养的宠物不符合描述，希望能退还押金。',4,1),(5,1,'2024-01-10','宠物未按照承诺进行绝育手术。',5,1),(6,2,'2024-01-11','领养程序过于复杂。',6,1),(7,3,'2024-01-12','客服响应时间太长。',7,1),(8,4,'2024-01-13','领养的宠物健康状况不佳。',8,1),(9,5,'2024-01-14','宠物信息与实际不符。',9,1),(10,6,'2024-01-15','领养流程中断，系统出错。',10,1),(11,7,'2024-01-16','未收到领养确认通知。',1,1),(12,8,'2024-01-17','领养的宠物行为异常。',2,1),(13,9,'2024-01-18','缺少领养协议文档。',3,1),(14,10,'2024-01-19','领养费用不明确。',4,1),(15,1,'2024-01-20','宠物领养后的跟进服务不足。',5,1),(16,2,'2024-01-21','领养网站经常宕机。',6,1),(17,3,'2024-01-22','客服态度不好。',7,1),(18,4,'2024-01-23','领养的宠物品种不符。',8,1),(19,5,'2024-01-24','领养申请被无故拒绝。',9,2),(20,6,'2024-01-25','宠物领养后的健康检查不彻底。',10,2),(21,7,'2024-01-26','领养后的宠物出现健康问题。',1,2),(22,8,'2024-01-27','领养申请处理时间过长。',2,2),(23,9,'2024-01-28','领养的宠物年龄与描述不符。',3,2),(24,10,'2024-01-29','系统错误导致无法提交领养申请。',4,2);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `Favorite_id` int NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `User_id` int DEFAULT NULL COMMENT '用户id',
  `Pet_id` int DEFAULT NULL COMMENT '宠物id',
  `Favorite_Time` date DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`Favorite_id`),
  KEY `fk_user_id2` (`User_id`),
  KEY `fk_pet_id2` (`Pet_id`),
  CONSTRAINT `fk_pet_id2` FOREIGN KEY (`Pet_id`) REFERENCES `pets` (`Pet_id`),
  CONSTRAINT `fk_user_id2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1,1,'2024-05-13'),(2,1,3,'2024-05-12'),(3,2,2,'2024-05-11'),(4,3,4,'2024-05-10'),(5,4,5,'2024-05-09'),(6,1,1,'2024-01-10'),(7,2,3,'2024-01-11'),(8,3,2,'2024-01-12'),(9,4,4,'2024-01-13'),(10,5,5,'2024-01-14'),(11,6,6,'2024-01-15'),(12,7,7,'2024-01-16'),(13,8,8,'2024-01-17'),(14,9,9,'2024-01-18'),(15,10,10,'2024-01-19'),(16,1,11,'2024-01-20'),(17,2,12,'2024-01-21'),(18,3,13,'2024-01-22'),(19,4,14,'2024-01-23'),(20,5,15,'2024-01-24'),(21,6,1,'2024-01-25'),(22,7,2,'2024-01-26'),(23,8,3,'2024-01-27'),(24,9,4,'2024-01-28'),(25,10,5,'2024-01-29');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_health_records`
--

DROP TABLE IF EXISTS `pet_health_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_health_records` (
  `Record_id` int NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `pet_id` int DEFAULT NULL COMMENT '宠物id',
  `Vet_Records` text COMMENT '兽医记录',
  `Vaccination_Records` text COMMENT '疫苗接种情况',
  `Treatmen_Records` text COMMENT '治疗记录',
  `Last_Modified_Time` date DEFAULT NULL COMMENT '上次修改时间',
  `Vaccination_Status` tinyint NOT NULL COMMENT '疫苗接种状态\n1：已接种\n0：未接种\n',
  PRIMARY KEY (`Record_id`),
  KEY `fk_pet_id3` (`pet_id`),
  CONSTRAINT `fk_pet_id3` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`Pet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物健康信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_health_records`
--

LOCK TABLES `pet_health_records` WRITE;
/*!40000 ALTER TABLE `pet_health_records` DISABLE KEYS */;
INSERT INTO `pet_health_records` VALUES (1,1,'哈士奇的兽医记录1111111111','已接种基本的疫苗','治疗了炎症','2024-06-11',1),(2,2,'英国','英国短毛猫的疫苗接种情况','英国短毛猫的治疗记录...','2024-05-12',1),(3,3,'金毛的兽医记录','金毛的疫苗接种情况...','金毛的治疗记录...','2024-05-11',1),(4,4,'鹦鹉的兽医记录','鹦鹉的疫苗接种情况...','鹦鹉的治疗记录...','2024-05-10',1),(5,5,'波斯猫的兽医记录...','波斯猫的疫苗接种情况...','波斯猫的治疗记录...','2024-05-09',1),(6,6,'定期健康检查，状况良好。','未接种疫苗',NULL,'2024-02-01',0),(7,7,'发现轻微的眼部感染。','已接种所有常规疫苗。','眼部感染治疗。','2024-02-02',1),(8,8,'体重略超标，需要控制饮食。','疫苗接种完成。','饮食管理建议。','2024-02-03',1),(9,9,'轻微呼吸道感染。','狂犬疫苗和常规疫苗接种。','呼吸道感染治疗。','2024-02-04',1),(10,10,'健康状况良好。','已接种所有必需疫苗。',NULL,'2024-02-05',1),(11,11,'体重正常，营养状况良好。','未接中疫苗',NULL,'2024-02-06',0),(12,12,'皮肤健康状况正常。','已接种所有必需疫苗。',NULL,'2024-02-07',1),(13,13,'消化系统检查正常。','所有疫苗接种完成。',NULL,'2024-02-08',1),(14,14,'轻微的关节问题。','狂犬疫苗接种完成。',NULL,'2024-02-09',1),(15,15,'牙齿健康，已做过清洁。','所有常规疫苗接种完成。','牙齿清洁','2024-02-10',1),(16,15,'英国','英国短毛猫的疫苗接种情况...',NULL,'2024-05-12',0),(17,18,'英国','英国短毛猫的疫苗接种情况...',NULL,'2024-05-12',0),(19,22,'1111','1111','11111','2024-07-23',0),(20,24,'1111111111111','1111111111111','111111111111','2024-07-16',1),(21,25,'123333','123','123','2024-07-22',0),(22,23,'asdada','adadad','adasfa','2024-07-15',0),(23,27,'有记录','无接种','无记录','2024-07-08',0),(24,26,'qaaa','aaaa','aaa','2024-07-22',0),(25,19,'11111','1111','1111','2024-07-22',1),(26,29,'qqqqqqqq','qqqqq','qqqq','2024-07-29',1);
/*!40000 ALTER TABLE `pet_health_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_tag_management`
--

DROP TABLE IF EXISTS `pet_tag_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_tag_management` (
  `Pet_Tag_management_id` int NOT NULL AUTO_INCREMENT COMMENT '管理id',
  `Pet_id` int DEFAULT NULL COMMENT '宠物id',
  `Tag_id` int DEFAULT NULL COMMENT '标签id',
  PRIMARY KEY (`Pet_Tag_management_id`),
  KEY `fk_Pet_id4` (`Pet_id`),
  KEY `fk_tag_id` (`Tag_id`),
  CONSTRAINT `fk_Pet_id4` FOREIGN KEY (`Pet_id`) REFERENCES `pets` (`Pet_id`),
  CONSTRAINT `fk_tag_id` FOREIGN KEY (`Tag_id`) REFERENCES `tags` (`Tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物标签管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_tag_management`
--

LOCK TABLES `pet_tag_management` WRITE;
/*!40000 ALTER TABLE `pet_tag_management` DISABLE KEYS */;
INSERT INTO `pet_tag_management` VALUES (4,2,4),(5,3,5),(6,3,7),(9,5,9),(13,3,4),(14,4,5),(16,6,7),(18,8,9),(20,10,11),(21,11,1),(24,14,4),(25,15,5),(26,1,7);
/*!40000 ALTER TABLE `pet_tag_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `petdetails`
--

DROP TABLE IF EXISTS `petdetails`;
/*!50001 DROP VIEW IF EXISTS `petdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `petdetails` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `Type`,
 1 AS `Breed`,
 1 AS `Age`,
 1 AS `Gender`,
 1 AS `Weight`,
 1 AS `Color`,
 1 AS `Location`,
 1 AS `Neutered`,
 1 AS `Has_Adoption_History`,
 1 AS `Adoption_Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `Pet_id` int NOT NULL AUTO_INCREMENT COMMENT '宠物id',
  `Category` varchar(50) NOT NULL COMMENT '种类',
  `Breed` varchar(50) NOT NULL COMMENT '品种',
  `Age` int DEFAULT NULL COMMENT '年龄',
  `Gender` char(1) DEFAULT NULL COMMENT '性别',
  `Weight` float(4,1) DEFAULT NULL COMMENT '体重',
  `Color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `Region` text COMMENT '所在地区',
  `pet_name` char(50) DEFAULT NULL,
  `Neutered` tinyint NOT NULL COMMENT '是否绝孕\r\n1：是\r\n0：否\r\n',
  `Adoption_History` tinyint NOT NULL COMMENT '是否有被领养历史\r\n1：是\r\n0：否\r\n',
  `Adoption_Status` tinyint NOT NULL COMMENT '1：已领养\n0：未领养\n3：不能领养',
  PRIMARY KEY (`Pet_id`),
  CONSTRAINT `pets_chk_1` CHECK (((`Age` > 0) and (`Age` < 100))),
  CONSTRAINT `pets_chk_2` CHECK ((`Weight` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='宠物信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'狗111','哈士奇123',11,'公',25.5,'红色','北京市','Bella123',1,1,0),(2,'猫','英国短毛猫',2,'母',123.4,'黑白','上海市','小黑',1,0,1),(3,'狗','金毛',1,'公',32.0,'金黄色','广州市','Luna',1,0,1),(4,'鸟','鹦鹉',5,'公',0.5,'彩色','成都市','Charlie',0,1,1),(5,'猫','波斯猫',4,'母',6.7,'白色','深圳市','Daisy',1,0,1),(6,'狗','拉布拉多',3,'公',30.5,'黄色','纽约','Rocky',0,0,1),(7,'猫','暹罗猫',2,'母',10.2,'奶油色','洛杉矶','Molly',0,1,1),(8,'狗','贵宾犬',4,'公',15.3,'白色','芝加哥','Buddy',1,0,1),(9,'兔子','安哥拉兔',1,'公',2.5,'白色','休斯顿','Coco',0,0,1),(10,'鸟','鹦鹉',5,'母',0.9,'绿色','菲尼克斯','Lucy',1,1,1),(11,'猫','缅因猫',3,'公',12.4,'棕色','费城','Milo',1,0,1),(12,'狗','斗牛犬',6,'母',20.1,'斑纹色','圣安东尼奥','Ruby',1,0,1),(13,'猫','英国短毛猫',2,'公',9.8,'蓝色','圣地亚哥','Oscaraaaaa',0,1,1),(14,'狗','哈士奇',4,'母',25.6,'黑白色','达拉斯','Ginger',1,0,1),(15,'兔子','荷兰兔',1,'公',1.8,'黑白色','圣何塞','Zoe',0,1,1),(16,'狗','比特犬',11,'母',23.2,'红色','成都','aaa',0,0,0),(17,'熊','黑熊',12,'公',52.1,'黑白','四川','aaaa',0,0,0),(18,'鳄鱼','abc',12,'公',25.5,'绿色','北京市','abcv',0,0,1),(19,'狼','金毛',1,'公',32.0,'金黄色','广州市','Luna',0,0,1),(20,'222','222',22,'公',22.0,'22','广州市','222',0,0,3),(21,'222','222',22,'公',22.0,'22','广州市','222',1,0,3),(22,'111','111',11,'母',111.0,'111','11','11',1,0,3),(23,'222','222',12,'公',12.1,'12345','222','222',1,0,3),(24,'123','123',12,'公',12.1,'11111','123','123',0,0,3),(25,'22','22',2,'公',11.0,'11','222','22',1,0,3),(26,'22','22',22,'公',22.0,'22','22','22',1,0,3),(27,'狮子','金毛狮王',45,'公',82.1,'金色','明教','谢逊',0,0,3),(28,'1111qqq','111',1,'公',11.0,'111','11','111',1,1,0),(29,'222222222','222222222',2,'母',2.0,'2222222','222222222','22222222',1,1,3),(30,'1212','12',12,'公',12.0,'12','12','12',1,1,3),(31,'111111','1111',11,'公',12.0,'13','111','111',1,1,3);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notifications`
--

DROP TABLE IF EXISTS `system_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_notifications` (
  `System_Notification_id` int NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `User_id` int DEFAULT NULL COMMENT '用户id',
  `Notification_TIme` date DEFAULT NULL,
  `Notification_Content` text,
  `Adimin_id` int DEFAULT NULL,
  PRIMARY KEY (`System_Notification_id`),
  KEY `fk_User_id4` (`User_id`),
  KEY `fk_Admin_id` (`Adimin_id`),
  CONSTRAINT `fk_Admin_id` FOREIGN KEY (`Adimin_id`) REFERENCES `administrators` (`Adimin_id`),
  CONSTRAINT `fk_User_id4` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notifications`
--

LOCK TABLES `system_notifications` WRITE;
/*!40000 ALTER TABLE `system_notifications` DISABLE KEYS */;
INSERT INTO `system_notifications` VALUES (1,8,'2024-01-10','您的领养申请已通过审核。',1),(2,1,'2024-01-10','您的领养申请已通过审核。',1),(3,2,'2024-01-11','您的投诉已收到，我们会尽快处理。',2),(4,3,'2024-01-12','您的领养记录已更新。',3),(5,4,'2024-01-13','您的宠物健康信息已更新。',4),(6,5,'2024-01-14','系统维护通知：2024-01-15 将进行系统维护。',5),(7,6,'2024-01-15','您的收藏记录已更新。',6),(8,7,'2024-01-16','您的宠物标签已更新。',7),(9,8,'2024-01-17','新的宠物领养活动即将开始。',8),(10,9,'2024-01-18','请尽快更新您的联系方式。',9),(12,1,'2024-01-20','感谢您参与我们的调查问卷。',2),(13,2,'2024-01-21','您的投诉已处理完毕。',3),(14,3,'2024-01-22','新的宠物到店，请前往查看。',4),(15,4,'2024-01-23','您的宠物健康检查预约已确认。',5),(16,5,'2024-01-24','您的领养申请需要更多信息。',6),(17,6,'2024-01-25','请查看您的领养协议。',7),(18,7,'2024-01-26','您的领养申请正在处理中。',8),(19,8,'2024-01-27','您的宠物健康检查结果已出。',9),(21,10,'2024-01-29','您的收藏记录存在异常，请检查。',1),(22,1,'2024-01-10','您的领养申请已通过审核。',1),(23,5,'2024-01-11','您的投诉已收到，我们会尽快处理。',2),(25,1,'2024-07-04','您的投诉我们已经处理，感谢您的建议！',NULL),(26,3,'2024-07-04','您的投诉我们已经处理，感谢您的建议！',NULL),(27,3,'2024-07-05','您的投诉我们已经处理，感谢您的建议！',NULL),(28,4,'2024-07-05','您的投诉我们已经处理，感谢您的建议！',NULL),(29,9,'2024-07-05','您的领养申请已通过，感谢您的支持！！',NULL),(30,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(31,9,'2024-07-05','您的领养申请已通过，感谢您的支持！！',NULL),(32,9,'2024-07-05','您的领养申请已通过，感谢您的支持！！',NULL),(33,10,'2024-07-05','您的领养申请已通过，感谢您的支持！！',NULL),(34,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(35,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(36,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(37,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(38,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(39,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(40,9,'2024-07-05','您的申请归还宠物已通过，请注意查看短信！！',NULL),(41,10,'2024-07-05','您的领养申请已通过，感谢您的支持！！',NULL),(42,9,'2024-07-05','您的领养申请已通过，感谢您的支持！！',NULL),(43,10,'2024-07-05','不好意思，您申请的宠物现在不能被领养',NULL),(44,10,'2024-07-05','您的申请宠物已已经被领养，抱歉！！',NULL),(45,2,'2024-07-05','您的投诉我们已经处理，感谢您的建议！',NULL),(46,9,'2024-07-06','您的申请宠物已已经被领养，抱歉！！',NULL),(47,9,'2024-07-06','您的领养申请已通过，感谢您的支持！！',NULL),(48,1,'2024-07-06','您的投诉我们已经处理，感谢您的建议！',NULL),(49,9,'2024-07-07','您的申请宠物已已经被领养，抱歉！！',NULL),(50,9,'2024-07-07','您的申请宠物已已经被领养，抱歉！！',NULL),(51,9,'2024-07-07','您的申请宠物已已经被领养，抱歉！！',NULL),(52,9,'2024-07-07','您的归还申请已通过，期待下次领养！！',NULL),(53,10,'2024-07-08','不好意思，您申请的宠物现在不能被领养',NULL),(54,10,'2024-07-08','您的领养申请已通过，感谢您的支持！！',NULL),(55,10,'2024-07-08','您的申请宠物已已经被领养，抱歉！！',NULL),(56,3,'2024-07-09','您的投诉我们已经处理，感谢您的建议！',NULL),(57,9,'2024-07-09','您的申请宠物已已经被领养，抱歉！！',NULL),(58,9,'2024-07-09','您的领养申请已通过，感谢您的支持！！',NULL),(59,10,'2024-07-09','您的领养申请已通过，感谢您的支持！！',NULL),(60,9,'2024-07-09','您的申请宠物已已经被领养，抱歉！！',NULL),(61,9,'2024-07-09','您的归还申请已通过，期待下次领养！！',NULL),(62,10,'2024-07-09','您的领养申请已通过，感谢您的支持！！',NULL),(63,10,'2024-07-09','不好意思，您申请的宠物现在不能被领养',NULL),(64,4,'2024-07-09','您的投诉我们已经处理，感谢您的建议！',NULL),(65,8,'2024-07-10','您的归还申请已通过，期待下次领养！！',NULL),(66,9,'2024-07-10','您的申请宠物已已经被领养，抱歉！！',NULL),(67,9,'2024-07-10','您的申请宠物已已经被领养，抱歉！！',NULL),(68,10,'2024-07-10','您的申请宠物已已经被领养，抱歉！！',NULL),(69,10,'2024-07-10','不好意思，您申请的宠物现在不能被领养',NULL);
/*!40000 ALTER TABLE `system_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `Tag_id` int NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `Tag_Name` varchar(10) NOT NULL COMMENT '标签，名称',
  PRIMARY KEY (`Tag_id`),
  UNIQUE KEY `Tag_Name` (`Tag_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (45,'asfasdg'),(11,'乖乖的'),(1,'勇敢'),(4,'安静'),(30,'强壮的'),(32,'极品'),(5,'活泼'),(34,'神品'),(31,'神话'),(46,'神话111'),(40,'神话的'),(7,'粘人'),(41,'聪明的'),(9,'胆小'),(33,'良品');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_tag_insert_check_duplicate` BEFORE INSERT ON `tags` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM tags WHERE Tag_Name = NEW.Tag_Name) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '标签名称已存在';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `useradoptedpets`
--

DROP TABLE IF EXISTS `useradoptedpets`;
/*!50001 DROP VIEW IF EXISTS `useradoptedpets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `useradoptedpets` AS SELECT 
 1 AS `UserID`,
 1 AS `Username`,
 1 AS `Contact`,
 1 AS `Address`,
 1 AS `PetID`,
 1 AS `PetName`,
 1 AS `PetType`,
 1 AS `Breed`,
 1 AS `Age`,
 1 AS `Gender`,
 1 AS `Weight`,
 1 AS `Color`,
 1 AS `Location`,
 1 AS `AdoptionTime`,
 1 AS `AdoptionStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `useradoptionapplications`
--

DROP TABLE IF EXISTS `useradoptionapplications`;
/*!50001 DROP VIEW IF EXISTS `useradoptionapplications`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `useradoptionapplications` AS SELECT 
 1 AS `UserID`,
 1 AS `Username`,
 1 AS `Contact`,
 1 AS `Address`,
 1 AS `ApplicationID`,
 1 AS `PetID`,
 1 AS `PetName`,
 1 AS `ApplicationTime`,
 1 AS `ApplicationStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `userfavoritepets`
--

DROP TABLE IF EXISTS `userfavoritepets`;
/*!50001 DROP VIEW IF EXISTS `userfavoritepets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userfavoritepets` AS SELECT 
 1 AS `UserID`,
 1 AS `Username`,
 1 AS `Contact`,
 1 AS `FavoriteID`,
 1 AS `PetID`,
 1 AS `PetName`,
 1 AS `FavoriteTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `User_Password` varchar(255) DEFAULT NULL,
  `Contact_Phonenumber` varchar(11) NOT NULL COMMENT '联系方式',
  `Address` text COMMENT '居住地区',
  `Gender` char(1) DEFAULT NULL COMMENT '性别',
  `Last_Modified_Time` date DEFAULT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Usrname` (`username`),
  UNIQUE KEY `Contact_Phonenumber` (`Contact_Phonenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aaauser','9ee3a8c31a8090f65f63872dccfff2a602798beac985cb6d251bbae6eccadbf0','132451820','北京市朝阳区','男','2024-05-13'),(2,'catlover','18a048315e2bee033209181c23f5928d078e1df6897725f1b535c34280e32455','13987654321','上海市徐汇区','女','2024-05-12'),(3,'dogfanatic','38202e077dabf05b422245c122b25a110288db75df3f5c5f74c16ea1a10580fb','13711112222','广州市天河区','男','2024-05-11'),(4,'birdwatcher','c154dd5bb05df437285cbdbfdc18f6c4c763c857fc3e3db81885614d5da84516','13699998888','成都市武侯区','女','2024-05-10'),(5,'petlover','23f9f7d957e581ab53926eebfb95c6c42ba7beccb064f574ebe0c4519398b953','13544445555','深圳市福田区','男','2024-05-09'),(6,'furryfriend','4950caacab796f895a6d930734b337a03e5bf66f3f11bc0a74cfc19f0cf88a7f','13377776666','杭州市西湖区','女','2024-05-08'),(7,'animalcare','236e03b0f6926329fe15e30a70359ecb4fc8c5be69441a8b9e13b2f744808032','13188889999','重庆市渝中区','男','2024-05-07'),(8,'petparent','f75c2e7f92977a2255f502c45833fd4acbc16436818254508ae377d03aae3984','13022223333','南京市玄武区','女','2024-05-06'),(9,'critterlover','e43b43c1b49811aa1c9ace221914dcf7156513c1bc18e6f6782d84ab1ef6632f','13255554444','武汉市江汉区','男','2024-05-05'),(10,'pawfriend','aeda675325129aa20ad78243fea41fd4b92c888b53392b509cce730fe33cfcbc','13466667777','天津市和平区','女','2024-05-04'),(11,'tom','d53da05864d2b274a2694e110e96330abc1c4c772b7af321a596780698d99f98','12345677889','成都市双流区','男','1924-07-12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `petdetails`
--

/*!50001 DROP VIEW IF EXISTS `petdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `petdetails` AS select `pets`.`Pet_id` AS `ID`,`pets`.`pet_name` AS `Name`,`pets`.`Category` AS `Type`,`pets`.`Breed` AS `Breed`,`pets`.`Age` AS `Age`,`pets`.`Gender` AS `Gender`,`pets`.`Weight` AS `Weight`,`pets`.`Color` AS `Color`,`pets`.`Region` AS `Location`,(case when (`pets`.`Neutered` = 1) then 'Yes' else 'No' end) AS `Neutered`,(case when (`pets`.`Adoption_History` = 1) then 'Yes' else 'No' end) AS `Has_Adoption_History`,(case when (`pets`.`Adoption_Status` = 1) then 'Adopted' else 'Available' end) AS `Adoption_Status` from `pets` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `useradoptedpets`
--

/*!50001 DROP VIEW IF EXISTS `useradoptedpets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `useradoptedpets` AS select `u`.`User_id` AS `UserID`,`u`.`username` AS `Username`,`u`.`Contact_Phonenumber` AS `Contact`,`u`.`Address` AS `Address`,`p`.`Pet_id` AS `PetID`,`p`.`pet_name` AS `PetName`,`p`.`Category` AS `PetType`,`p`.`Breed` AS `Breed`,`p`.`Age` AS `Age`,`p`.`Gender` AS `Gender`,`p`.`Weight` AS `Weight`,`p`.`Color` AS `Color`,`p`.`Region` AS `Location`,`ar`.`Adoption_Time` AS `AdoptionTime`,(case when (`ar`.`adoption_Status` = 1) then 'Adopted' else 'Returned' end) AS `AdoptionStatus` from ((`users` `u` join `adoption_records` `ar` on((`u`.`User_id` = `ar`.`User_id`))) join `pets` `p` on((`ar`.`Pet_id` = `p`.`Pet_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `useradoptionapplications`
--

/*!50001 DROP VIEW IF EXISTS `useradoptionapplications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `useradoptionapplications` AS select `u`.`User_id` AS `UserID`,`u`.`username` AS `Username`,`u`.`Contact_Phonenumber` AS `Contact`,`u`.`Address` AS `Address`,`a`.`Application_id` AS `ApplicationID`,`a`.`Pet_id` AS `PetID`,`p`.`pet_name` AS `PetName`,`a`.`Application_Time` AS `ApplicationTime`,(case when (`a`.`Adoption_Status` = 0) then 'Pending' else 'Processed' end) AS `ApplicationStatus` from ((`users` `u` join `adoption_applications` `a` on((`u`.`User_id` = `a`.`User_id`))) join `pets` `p` on((`a`.`Pet_id` = `p`.`Pet_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userfavoritepets`
--

/*!50001 DROP VIEW IF EXISTS `userfavoritepets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `userfavoritepets` AS select `u`.`User_id` AS `UserID`,`u`.`username` AS `Username`,`u`.`Contact_Phonenumber` AS `Contact`,`f`.`Favorite_id` AS `FavoriteID`,`f`.`Pet_id` AS `PetID`,`p`.`pet_name` AS `PetName`,`f`.`Favorite_Time` AS `FavoriteTime` from ((`users` `u` join `favorites` `f` on((`u`.`User_id` = `f`.`User_id`))) join `pets` `p` on((`f`.`Pet_id` = `p`.`Pet_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-11 10:15:48
