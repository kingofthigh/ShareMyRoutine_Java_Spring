-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `amountfood`
--

DROP TABLE IF EXISTS `amountfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amountfood` (
  `food_id` int NOT NULL,
  `meal_id` int NOT NULL,
  `amount` float DEFAULT '1',
  PRIMARY KEY (`food_id`,`meal_id`),
  KEY `fk_Food_has_Meal_Meal1_idx` (`meal_id`),
  KEY `fk_Food_has_Meal_Food1_idx` (`food_id`),
  CONSTRAINT `fk_Food_has_Meal_Food1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`),
  CONSTRAINT `fk_Food_has_Meal_Meal1` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amountfood`
--

LOCK TABLES `amountfood` WRITE;
/*!40000 ALTER TABLE `amountfood` DISABLE KEYS */;
/*!40000 ALTER TABLE `amountfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `comment_content` varchar(100) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `fk_post_comment_idx` (`post_id`),
  KEY `fk_user_comment_idx` (`user_id`),
  CONSTRAINT `fk_post_comment` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `fk_user_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet_comment_like`
--

DROP TABLE IF EXISTS `diet_comment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_comment_like` (
  `diet_comment_id` int NOT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`diet_comment_id`,`user_id`),
  KEY `fk_DietComment_has_User_User1_idx` (`user_id`),
  KEY `fk_DietComment_has_User_DietComment1_idx` (`diet_comment_id`),
  CONSTRAINT `fk_DietComment_has_User_DietComment1` FOREIGN KEY (`diet_comment_id`) REFERENCES `dietcomment` (`diet_comment_id`),
  CONSTRAINT `fk_DietComment_has_User_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_comment_like`
--

LOCK TABLES `diet_comment_like` WRITE;
/*!40000 ALTER TABLE `diet_comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `diet_comment_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietcomment`
--

DROP TABLE IF EXISTS `dietcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietcomment` (
  `diet_comment_id` int NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `diet_post_id` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diet_comment_id`),
  KEY `fk_DP_DC_idx` (`diet_post_id`),
  KEY `fk_user_d_comment_idx` (`user_id`),
  CONSTRAINT `fk_DP_DC` FOREIGN KEY (`diet_post_id`) REFERENCES `dietpost` (`diet_post_id`),
  CONSTRAINT `fk_user_d_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietcomment`
--

LOCK TABLES `dietcomment` WRITE;
/*!40000 ALTER TABLE `dietcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietpost`
--

DROP TABLE IF EXISTS `dietpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietpost` (
  `diet_post_id` int NOT NULL,
  `diet_post_content` varchar(200) DEFAULT NULL,
  `diet_post_img` varchar(45) DEFAULT NULL,
  `meal_id` int NOT NULL,
  PRIMARY KEY (`diet_post_id`),
  KEY `fk_Diet_Meal1_idx` (`meal_id`),
  CONSTRAINT `fk_Diet_Meal1` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietpost`
--

LOCK TABLES `dietpost` WRITE;
/*!40000 ALTER TABLE `dietpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `dietpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excercise`
--

DROP TABLE IF EXISTS `excercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excercise` (
  `exercise_id` int NOT NULL,
  `exercise_name` varchar(45) DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  PRIMARY KEY (`exercise_id`),
  KEY `fk_part_work_idx` (`part_id`),
  CONSTRAINT `fk_part_work` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excercise`
--

LOCK TABLES `excercise` WRITE;
/*!40000 ALTER TABLE `excercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `excercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise` (
  `exercise_id` int NOT NULL,
  `exercise_name` varchar(45) DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  PRIMARY KEY (`exercise_id`),
  KEY `fk_part_work_idx` (`part_id`),
  CONSTRAINT `fk_part_exercise` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'벤치프레스',1),(2,'체스트 프레스',1),(3,'덤벨 벤치 프레스',1),(4,'스미스 머신 벤치프레스',1),(5,'인클라인 벤치프레스',1),(6,'인클라인 덤벨 벤치프레스',1),(7,'스미스 머신 인클라인 벤치 프레스',1),(8,'머신 플라이',1),(9,'덤벨 플라이',1),(10,'인클라인 덤벨 플라ㅣ',1),(11,'디클라인 벤치프레스',1),(12,'딥스',1),(13,'덤벨 풀오버',1),(14,'푸쉬업',1),(15,'케이블 크로스 오버',1),(16,'바벨 로우',2),(17,'티바 로우',2),(18,'시티드 로우',2),(19,'롱 풀',2),(20,'원암 덤벨 로우',2),(21,'원암 시티드 로우',2),(22,'덤벨 로우',2),(23,'랫 풀 다운',2),(24,'풀업',2),(25,'원암 풀 다운',2),(26,'암 풀 다운',2),(27,'슈러그',2),(28,'데드리프트',2),(29,'루마니안 데드리프트',2),(30,'랙풀',2),(31,'스쿼트',3),(32,'파워 레그 프레스',3),(33,'레그 프레스 머신',3),(34,'브이 스쿼트',3),(35,'핵스쿼트',3),(36,'레그 익스텐션',3),(37,'레그컬',3),(38,'이너 싸이',3),(39,'아웃 싸이',3),(40,'힙 쓰러스트',3),(41,'런지',3),(42,'고블릿 스쿼트',3),(43,'카프레이즈',3),(44,'힙 어브덕션',3),(45,'고블릿 런지',3),(46,'스탠딩 바벨 숄더 플레스',4),(47,'스탠딩 덤벨 숄더 프레스',4),(48,'시티드 바벨 숄더 프레스',4),(49,'시티드 덤벨 프레스',4),(50,'스미스 머신 숄더 프레스',4),(51,'사이드 레터럴 레이즈',4),(52,'프론트 레터럴 레이즈',4),(53,'벤트 오버 레터럴 레이즈',4),(54,'머신 사이드 레터럴 레이즈',4),(55,'페이스풀',4),(56,'업라이트 로우',4),(57,'케이블 레터럴 레이즈',4),(58,'리어 델트 플라이',4),(59,'아놀드 프레스',4),(60,'비하인드 바벨 숄더 프레스',4);
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `following` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`following`,`follower`),
  KEY `fk_User_has_User_User2_idx` (`follower`),
  KEY `fk_User_has_User_User1_idx` (`following`),
  CONSTRAINT `fk_User_has_User_User1` FOREIGN KEY (`following`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_User_has_User_User2` FOREIGN KEY (`follower`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES ('rkdgus','wjddmlals');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL,
  `food_name` varchar(45) NOT NULL,
  `carbo` float DEFAULT '0',
  `protein` float DEFAULT '0',
  `fat` float DEFAULT '0',
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecomment`
--

DROP TABLE IF EXISTS `likecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likecomment` (
  `user_id` varchar(20) NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `fk_User_has_Commet_Commet1_idx` (`comment_id`),
  CONSTRAINT `fk_udrt_has_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_User_has_Commet_Commet1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecomment`
--

LOCK TABLES `likecomment` WRITE;
/*!40000 ALTER TABLE `likecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `likecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likedietpost`
--

DROP TABLE IF EXISTS `likedietpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likedietpost` (
  `user_id` varchar(20) NOT NULL,
  `diet_post_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`diet_post_id`),
  KEY `fk_User_has_DietPost_DietPost1_idx` (`diet_post_id`),
  CONSTRAINT `fk_User_has_DietPost_DietPost1` FOREIGN KEY (`diet_post_id`) REFERENCES `dietpost` (`diet_post_id`),
  CONSTRAINT `fk_User_has_DietPost_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likedietpost`
--

LOCK TABLES `likedietpost` WRITE;
/*!40000 ALTER TABLE `likedietpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `likedietpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likepost`
--

DROP TABLE IF EXISTS `likepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likepost` (
  `user_id` varchar(20) NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `fk_User_has_Post_Post1_idx` (`post_id`),
  CONSTRAINT `fk_User_has_Post_Post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `fk_User_has_Post_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likepost`
--

LOCK TABLES `likepost` WRITE;
/*!40000 ALTER TABLE `likepost` DISABLE KEYS */;
/*!40000 ALTER TABLE `likepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likevideo`
--

DROP TABLE IF EXISTS `likevideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likevideo` (
  `video_id` varchar(45) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`video_id`,`user_id`),
  KEY `fk_Video_has_User_User1_idx` (`user_id`),
  KEY `fk_Video_has_User_Video1_idx` (`video_id`),
  CONSTRAINT `fk_Video_has_User_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_Video_has_User_Video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likevideo`
--

LOCK TABLES `likevideo` WRITE;
/*!40000 ALTER TABLE `likevideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `likevideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `meal_id` int NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `meal_carbo` float DEFAULT '0',
  `meal_protein` float DEFAULT '0',
  `meal_fat` float DEFAULT '0',
  PRIMARY KEY (`meal_id`),
  KEY `fk_user_meal_idx` (`user_id`),
  CONSTRAINT `fk_user_meal` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part` (
  `part_id` int NOT NULL,
  `part_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'가슴'),(2,'등'),(3,'하체'),(4,'어깨');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `post_content` varchar(200) DEFAULT NULL,
  `post_img` varchar(100) DEFAULT NULL,
  `workpage_id` int NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `fk_Post_WorkPage1_idx` (`workpage_id`),
  KEY `fk_user_post_idx` (`user_id`),
  CONSTRAINT `fk_Post_WorkPage1` FOREIGN KEY (`workpage_id`) REFERENCES `workpage` (`workpage_id`),
  CONSTRAINT `fk_user_post` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'rkdgus','ㄴㅇㄹㄴㅇ','no',12,'2023-05-25 06:20:12'),(2,'rkdgus','ㄴㅁㅇㄴㅁㅇㅁ','no',6,'2023-05-25 06:21:05'),(3,'rkdgus','ㄴㅇㄹㄹㄹ','no',6,'2023-05-25 06:23:33'),(4,'rkdgus','ㅇㄴㅇㄴ','no',7,'2023-05-25 06:24:57'),(5,'rkdgus','ㅁㄴㅇㅁㄴㅇ','no',7,'2023-05-25 06:26:02'),(6,'rkdgus','ㅓㅓㅐㅑ','no',7,'2023-05-25 06:34:06'),(7,'rkdgus','ㄷㄷㄷ','no',7,'2023-05-25 06:34:42'),(8,'rkdgus','ㅋㅌㅊㅋㅌㅊ','no',7,'2023-05-25 06:36:20'),(9,'rkdgus','ㅁㄴㅇㅁㄴ','no',7,'2023-05-25 06:36:46'),(10,'rkdgus','ㅇㄹㄴㅇㄹ','no',7,'2023-05-25 06:38:45'),(11,'rkdgus','123123','no',6,'2023-05-25 06:39:58'),(12,'rkdgus','111','no',8,'2023-05-25 06:40:45'),(13,'rkdgus','ㄴㅇㄴㅇ','no',8,'2023-05-25 06:44:32'),(14,'rkdgus','ㄴㅇㄹㄴㅇ','no',8,'2023-05-25 06:45:14'),(15,'rkdgus','ㄹㄹㄹㄹ','no',8,'2023-05-25 06:45:45'),(16,'rkdgus','333','no',8,'2023-05-25 06:45:56'),(17,'rkdgus','ㄴㅇㄴㅇ','no',7,'2023-05-25 06:47:19'),(18,'rkdgus','ㄴㅇㄹㄴㅇㄹ','no',7,'2023-05-25 06:47:42'),(19,'rkdgus','ㄴㅇㄹㄴㅇㄹ','no',7,'2023-05-25 06:49:16'),(20,'rkdgus','23123','no',12,'2023-05-25 06:54:34'),(21,'rkdgus','ㄴㅇㄹㄴㅇㄹ','no',8,'2023-05-25 06:55:11'),(22,'rkdgus','ㄴㅇㄹㄴㅇㄹ','no',8,'2023-05-25 07:02:49'),(23,'rkdgus','ㄴㅇㄹㄴ','no',12,'2023-05-25 07:15:10'),(24,'rkdgus','ㄴㅇㄹㄴㅇㄹ','no',12,'2023-05-25 07:15:33'),(25,'rkdgus','ㄴㅇㄹㄴㅇ','no',8,'2023-05-25 07:20:00'),(26,'rkdgus','ㄴㅇㄹㄴㅇㄹ','no',8,'2023-05-25 07:38:54'),(27,'rkdgus','ㄴㅇㄹㄴ','no',8,'2023-05-25 07:39:27'),(28,'rkdgus','ㄴㅇㄹㄴㅇㄹ','no',8,'2023-05-25 07:40:54'),(29,'rkdgus','ㄴㅇㄹㄴ','no',7,'2023-05-25 07:42:13'),(30,'wjddmlals','sdfsdf','no',9,'2023-05-25 08:10:51'),(31,'wjddmlals','sdfs','no',11,'2023-05-25 08:11:33'),(32,'wjddmlals','sdfs','no',11,'2023-05-25 08:12:36'),(33,'wjddmlals','sdfsd','no',11,'2023-05-25 08:13:04'),(34,'wjddmlals','sdfsd','no',10,'2023-05-25 08:13:49'),(35,'wjddmlals','sdfsd','no',9,'2023-05-25 08:14:29');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `review_content` varchar(100) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `video_id` varchar(50) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `fk_user_review_idx` (`user_id`),
  KEY `fk_video_review_idx` (`video_id`),
  CONSTRAINT `fk_user_review` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_video_review` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'fadffa\n','rkdgus','gc7fxvzFOds','2023-05-25 08:08:19','2023-05-25 08:08:19');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sets`
--

DROP TABLE IF EXISTS `sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sets` (
  `sets_id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `exercise_id` int NOT NULL,
  `reps` int DEFAULT '0',
  `weight` float DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sets_id`),
  KEY `fk_exercise_set_idx` (`exercise_id`),
  KEY `fk_workpage_set` (`page_id`),
  CONSTRAINT `fk_exercise_set` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`),
  CONSTRAINT `fk_workpage_set` FOREIGN KEY (`page_id`) REFERENCES `workpage` (`workpage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sets`
--

LOCK TABLES `sets` WRITE;
/*!40000 ALTER TABLE `sets` DISABLE KEYS */;
INSERT INTO `sets` VALUES (1,7,31,2,122,'2023-05-24 08:58:23'),(2,5,1,12,122,'2023-05-24 08:58:23'),(3,6,2,11,123,'2023-05-24 08:58:23'),(4,6,47,12,56,'2023-05-24 08:58:23'),(5,5,16,11,23,'2023-05-24 08:58:23'),(6,7,18,10,50,'2023-05-24 08:58:23'),(7,6,17,33,122,'2023-05-24 08:58:23'),(8,6,1,11,111,'2023-05-24 08:58:23'),(9,5,17,12,45,'2023-05-24 08:58:23'),(10,7,17,12,50,'2023-05-24 08:58:23'),(11,7,16,2,123,'2023-05-24 08:58:23'),(12,5,46,11,56,'2023-05-24 08:58:23'),(13,5,48,8,61,'2023-05-24 08:58:23'),(14,8,31,6,100,'2023-05-24 08:58:23'),(15,12,48,12,144,'2023-05-24 08:58:23'),(16,12,47,11,45,'2023-05-24 08:58:23'),(17,12,46,11,55,'2023-05-24 08:58:23'),(18,12,48,11,21,'2023-05-24 08:58:23'),(19,12,48,11,21,'2023-05-24 08:58:23'),(20,13,31,50,100,'2023-05-24 08:58:23'),(21,13,31,70,80,'2023-05-24 08:58:23'),(22,13,31,50,60,'2023-05-24 08:58:23'),(23,5,3,4,100,'2023-05-24 08:58:23');
/*!40000 ALTER TABLE `sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `height` float DEFAULT '0',
  `weight` float DEFAULT '0',
  `career` float DEFAULT '0',
  `goal` varchar(45) DEFAULT NULL,
  `growpart` varchar(45) DEFAULT NULL,
  `smm` float DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('rkdgus','1234','qwe@qwe','male',180,70,1,'벌크업','하체',35),('wjddmlals','1234','wer@wer','male',168.7,72.7,5,'다이어트','가슴',33.7);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `video_id` varchar(45) NOT NULL,
  `video_title` varchar(100) DEFAULT NULL,
  `channel_name` varchar(45) DEFAULT NULL,
  `view_cnt` int DEFAULT '0',
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES ('1sg3RDMpHGk','이것이 안되면 벌크업을 하면 안 되는 이유 (절대 하지 마세요)','헬마드 (헬스 건강 정보)',0,'벌크업'),('4NjfuHsk_jc','여러분들은 어떤 운동이 가장 쉽게 느껴지시나요? 물론 쉬운 운동이라는 것은 없겠지만, 초보자일 때는 상대적으로 가슴운동이 쉽게 ...','헬린이 탈출을 위한 운동정보',0,'가슴'),('7NPwSCjqka0','운동 다시 시작하시게요? 헬스 초,중급 상체 루틴 가이드','김강민',0,'중급'),('9ehdY_9B5jY','많은 분들이 하체가 중요하다는 사실은 알고 있습니다.','쇠질연구소',0,'하체'),('9_AiWMlH87U','하체운동 딱&#39;3가지&#39;만 하면 허벅지 쫙쫙 갈라집니다!!! (하체 필수 운동루틴)','헬린이 탈출을 위한 운동정보',0,'하체'),('AohcRMuEoP4','[헬스루틴] 헬스 3개월 때 배우는 이두 운동 3','딩고 헬스 / dingo fitness',0,'고수'),('bkBjjD-bbRM','초보자라면 운동을 할 때마다 중량을 올리셔야 합니다[Feat. 운동 프로그램]','세계적으로 유명한 운동 정보',0,'초보'),('cfioLE83by0','오늘은 등운동!! 해봐요~ 등은 광배근, 견갑거근, 능형근, 승모근 이렇게 4가지 근육으로 구성되어 있어요. 골고루 근육 쓰이도록 동작 ...','소미핏 SOMIFIT',0,'등'),('CgJB-vZM8hY','팔 근육이 빠르게 좋아지는 운동 루틴','안전헬스',0,'고수'),('D7iZMIy0C5E','제가 추천하는 부위별 운동 - 어깨, 팔, 하체 (초, 중급자 이 영상으로 끝내세요, 강경원 추천 루틴 완결편)','강경원',0,'초보'),('E57td9jBfxU','커팅, 린매스업, 바디리컴포지션에 대한 확실한 가이드라인','네츄럴보디빌딩학과',0,'린매스업'),('FpN6mySIjJ0','케이블 원암 풀다운은 상체 근육 강화 운동 중 하나로,광배근 타겟에 아주 좋은 운동입니다! 이 운동의 포인트는 상체를 일직선으로 ...','핏블리 FITVELY',0,'등'),('g9_9Z5F6CWU','비만의 늪에 빠진 30대 소정 씨! 초절식 다이어트로 폭식증이 왔었던 과거','채널A 캔버스',0,'다이어트'),('gc7fxvzFOds','가슴 운동은 딱 이 3가지만 하면 됩니다.','잘자요 헬스',2,'가슴'),('GCSyCDEvVK0','범스테드처럼 강력해지기 위한 최고의 벌크업 꿀팁 3가지!','일반인클라쓰 RONIE',6,'벌크업'),('gsFShSYOovU','Lv.3 덤벨 하나로 어깨 깡패 만드는 루틴 (떠먹는홈트)','권혁TV',0,'어깨'),('H-kguuJ2CR0','2달동안 10kg뺐었던 너무 평범하지만 효과적인 다이어트 식단과 꿀팁! (과일,빵,디저트먹는법) 이건 비밀임ㅋㅋㅋ | 윤쨔미','윤쨔미 YoonCharmi',1,'다이어트'),('Ha235jYUtig','처음 알려주는 꿀팁 가슴+삼두 운동루틴 6가지','준규빌더',0,'가슴'),('hrXfOwoEwSI','탄탄한 하체 만드는 필수 하체운동 5가지','준규빌더',0,'하체'),('js8z5wIZ0wg','(층간소음X, 설명O) 진짜 힘듦주의.. 초강력 힙으뜸 하체운동 2주 챌린지','힙으뜸',0,'하체'),('K3Nrl-vl03Q','헬스 초보자가 이 식단법으로도 벌크업 못하면 사기입니다. (벌크업 식단, 루틴, 운동 식단, 벌크업 전, 벌크업 프로그램)','쇠질연구소',0,'벌크업'),('KCAwey51gUc','헬스초보자가 &#39;이 순서&#39;대로 운동하면, 무조건 벌크업됩니다! (헬린이 운동루틴/종류/순서/분할)','보통사람을 위한 운동채널',0,'초보'),('kmxu6d4172U','어깨가 더 발전 할 수 있었던 비밀 알려드립니다. (어깨 풀루틴 공개)','총총TV SILVER GUN',0,'어깨'),('KXYi6bI-UPE','Lv.5 13분만에 하체 마비시키는 루틴! 근육통100% 옵니다. (누구나 집에서 가능) 13mins intense Legs Workout','권혁TV',0,'하체'),('Mchlz_VC-1g','린매스업 하는 방법 3단계 | 벌크업 하는 방법 | how to bulk up 3 steps | 살 찌는 방법 | 린매스업이란?','야수 Beast',0,'린매스업'),('mxXpilOq9lY','[건강 알고리즐]실패할 수 없는 다이어트…이것만 보세요!','채널A 뉴스',0,'다이어트'),('n2a4aN4Yv2o','내가 추천하는 분할법 - 초급, 중급, 고급','강경원',0,'중급'),('OB1w-oGKTX8','등운동#운동루틴#김명섭의헬스교실 오늘은 초중급자들을 위한 등운동루틴에 대한 영상을 올려드리니 여러분들께서는 도움이 ...','김명섭의 헬스교실',0,'등'),('OKaUO6aktN4','&#39;스쿼트&#39; 하지 마세요! 하체 가늘어집니다. (부상없는 하체운동 / 헬스루틴)','헬창극장',0,'고수'),('OoytN1a8Klc','기초체력 기르는 20분 전신 유산소 운동 (No 런지, No 스쿼트)','빵느',0,'초보'),('OqhzDuA1znE','따라하면 무조건 커지는 어깨루틴!','헬쭌',0,'중급'),('Qi23AoDGXlM','린매스업의 진실','Fitology',0,'린매스업'),('R9zEyvREGTA','넓은 가슴! 넓은 등! 을 위한 필수운동 초급,중급,상급자 분들까지 해주셔야합니다','테리우스준',0,'중급'),('rL2HNZWRWCs','[중급] 블랙에디션. 당신을 특별한 운동 시리즈로 초대합니다.','모멘트핏 록코치',0,'중급'),('sm-yrBDtqpo','벌크업 이렇게 해볼걸... 너무 후회되는 실수 4가지','바벨라토르 홈트레이닝 BARBELLATOR',1,'벌크업'),('SnPVKyJnYRI','별 거 없는 -20kg 다이어트 비법','헬퀸 [Health Queen]',0,'다이어트'),('sUwJubtbaBg','과학적으로 밝혀진 어깨뽕을 가장 빠르게 키우는 운동 3가지!?','쇠질연구소',0,'어깨'),('TGYhlPICXHE','다이어트로 환골탈태한 연예인들의 비법 大 공개! {연예계 다이어트의 신} 모음','tvN',0,'다이어트'),('u5OgcZdNbMo','저는 &#39;하체&#39;식주의자 입니다..','김종국 GYM JONG KOOK',0,'고수'),('UwXWqCPLxIA','무조건 &#39;벌크업&#39;부터 하세요. 인생이 달라집니다.(린매스업/컷팅/상승다이어트)','보통사람을 위한 운동채널',0,'벌크업'),('V-Pg-MrVBeE','[운동 꿀팁] 체지방 안늘리고 근성장 극대화시키는 방법','일반인클라쓰 RONIE',0,'린매스업'),('VkHR6qC5zYM','[근비대 12일차] 첫 태닝을하다ㅣ린매스업시 반드시 알아야 할 3가지','권혁TV',0,'린매스업'),('vMLYQm2Q_q0','딱 2가지 운동만으로, &#39;어깨&#39;는 무조건 벌크업 됩니다!!','보통사람을 위한 운동채널',0,'어깨'),('vTA9T4ehM1o','등 근육을 어떻게 해야 가장 빠르게 키울 수 있을까요? 어러분들은 턱걸이나 랫풀다운 동작으로 등을 넓히고 로우와 같은 운동으로 등','잘자요 헬스',0,'등'),('W4SpM2gxGdE','왕초보 탈출 - 전신운동 초보 홈트 여자','빅씨스 Bigsis',0,'초보'),('wluK0T1ajtk','어깨뽕을 가장 빠르게 키워주는 운동 1위는?(사레레 vs 프레스)','보통사람을 위한 운동채널',0,'어깨'),('xs9hhAQYbj8','아래는 다양한 프레스 운동할 때 손목이 꺾임을 방지하고 단단하게 지지해주는 손목보호대 정보입니다. 참고가 되시길 바라겠습니다!','보통사람을 위한 운동채널',0,'가슴'),('YHZSd5H6ppY','시간이 없는 직장인과 학생들에게 추천하는 꼭 해야하는 알찬 루틴만 쏙쏙 뽑았습니다 등+이두 6가지와 많은 꿀팁이 포함되어있으니 ...','준규빌더',0,'등'),('ySCSNVnAeFU','이대로 따라해보시면 바로 웅장해지는 가슴  을 느낄 수 있을 거예요.인클라인 벤치프레스 5set 15-10reps 플랫벤치프레스','핏블리 FITVELY',0,'가슴'),('YV3x7m-pg-s','+20Kg 벌크업 방법 드디어 공개!! 운동 분할법+식단Tip','핏블리 FITVELY',0,'고수');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weighttracker`
--

DROP TABLE IF EXISTS `weighttracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weighttracker` (
  `weightTracker_id` int NOT NULL AUTO_INCREMENT,
  `weight` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`weightTracker_id`),
  KEY `fk_user_weighttracker_idx` (`user_id`),
  CONSTRAINT `fk_user_weighttracker` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weighttracker`
--

LOCK TABLES `weighttracker` WRITE;
/*!40000 ALTER TABLE `weighttracker` DISABLE KEYS */;
INSERT INTO `weighttracker` VALUES (2,98,'2023-05-24 00:32:17','rkdgus'),(3,77,'2023-05-24 00:32:17','wjddmlals');
/*!40000 ALTER TABLE `weighttracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workpage`
--

DROP TABLE IF EXISTS `workpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workpage` (
  `workpage_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `memo` varchar(150) DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  PRIMARY KEY (`workpage_id`),
  KEY `fk_user_workpage_idx` (`user_id`),
  KEY `fk_part_workpage_idx` (`part_id`),
  CONSTRAINT `fk_part_workpage` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`),
  CONSTRAINT `fk_user_workpage` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workpage`
--

LOCK TABLES `workpage` WRITE;
/*!40000 ALTER TABLE `workpage` DISABLE KEYS */;
INSERT INTO `workpage` VALUES (5,'rkdgus','2023-05-24 01:19:49','윗 가슴 운동',1),(6,'rkdgus','2023-05-24 01:20:06','등 운동',2),(7,'rkdgus','2023-05-24 01:21:38','각진 가슴 운동',1),(8,'rkdgus','2023-05-24 01:22:15','항아리 같은 허벅지',3),(9,'wjddmlals','2023-05-24 01:46:37','ssafy',2),(10,'wjddmlals','2023-05-24 01:46:45','ㅈㄷㄱ',1),(11,'wjddmlals','2023-05-24 02:00:40','sdf',2),(12,'rkdgus','2023-05-24 07:16:11','대포알 어깨 루틴',4),(13,'rkdgus','2023-05-24 08:19:30','체지방 감소를 위한 무한 스쿼트 열차',3),(14,'rkdgus','2023-05-24 08:25:16','ㄴㅇㄹ',2);
/*!40000 ALTER TABLE `workpage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26  8:59:10
