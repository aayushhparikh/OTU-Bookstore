CREATE DATABASE  IF NOT EXISTS `ontechu_bookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ontechu_bookstore`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: ontechu_bookstore
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `authors` varchar(45) DEFAULT NULL,
  `course_id` varchar(45) DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `availability_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `book_course_id_idx` (`course_id`),
  CONSTRAINT `book_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Introduction to Psychology','Charles Stangor','PSYC1010',150,-1,1),(2,'Calculus','James Stewart','MATH1010',120,0,2),(3,'Introduction to Engineering','Gordon C. Andrews','ENGR1015',160,298,2),(4,'Physics','Randal D. Night','PHY1010',160,435,2),(5,'Engineering Communication','Robert Irish','COMM1050',100,-1,1),(6,'Introduction to Algorithms','Thomas H. Cormen','SOFE3770',180,-1,1),(7,'Introduction to Chemistry','Shirley Wacowich','CHEM1010',150,193,2),(8,'Calculus Volume 2','Gilbert Strang','MATH1020',140,232,2),(9,'University Physics Volume 2','Jeff Sanny','PHY1020',130,337,2);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('CHEM1010','Chemistry I'),('COMM1050','Technical Communications'),('ENGR1015','Introduction to Engineering'),('MATH1010','Calculus I'),('MATH1020','Calculus II'),('PHY1010','Physics I'),('PHY1020','Physics II'),('PSYC1010','Introduction to Psychology'),('SOFE3770','Software Design');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled`
--

DROP TABLE IF EXISTS `enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `course_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `enrolled_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled`
--

LOCK TABLES `enrolled` WRITE;
/*!40000 ALTER TABLE `enrolled` DISABLE KEYS */;
INSERT INTO `enrolled` VALUES (4,100100043,'PHY1010'),(5,100100043,'MATH1010'),(6,100100044,'SOFE3770'),(7,100100044,'PHY1010'),(8,100100044,'MATH1010'),(9,100100045,'SOFE3770'),(10,100100045,'PHY1010'),(11,100100045,'MATH1010');
/*!40000 ALTER TABLE `enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_due` decimal(10,0) DEFAULT NULL,
  `pick_up_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `book_id_idx` (`book_id`),
  KEY `student_id_idx_order` (`student_id`),
  KEY `book_id_idx_order` (`book_id`),
  CONSTRAINT `order_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON UPDATE CASCADE,
  CONSTRAINT `order_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (13,100100039,4,1,160,'2020-12-09 14:36:24',1),(15,100100039,1,1,150,'2020-11-24 22:55:07',1),(16,100100039,3,1,160,'2020-11-24 14:56:26',-1),(20,100100040,1,1,169,'2020-11-25 00:52:46',-1),(21,100100040,3,1,181,'2020-11-25 14:53:02',-1),(22,100100040,8,1,158,'2020-11-25 12:44:58',1),(23,100100043,1,1,169,'2020-11-25 14:24:35',-1),(24,100100044,4,1,181,'2020-11-25 14:25:20',-1),(25,100100039,3,1,181,'2020-11-25 15:27:26',0),(26,100100045,4,1,181,'2020-11-27 16:23:13',-1),(27,100100045,4,1,181,'2020-11-27 12:33:57',-1),(28,100100045,1,1,169,'2020-11-25 16:36:45',0),(29,100100045,5,1,113,'2020-11-25 18:12:10',1),(30,100100045,4,1,181,'2020-11-26 15:49:17',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('4BkKC1_z9hUvf4_nuXBXDXQG0wEDBaQg',1606514081,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":\"admin@uoit.ca\"}}'),('GVd82673Oq8kN2iiyE2G8ao7tuFjegtn',1606514024,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":\"admin@uoit.ca\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `program` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `users_student_id_uindex` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100100046 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (100100000,'maz@ontariotechu.net','$2b$10$QMFshb8mU03ViyC0dzsSn.u6qJfR02CWUTYiH3hW7Bs.8EqNkfm5C','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100004,'mazen@uoit.net','$2b$10$4N670G6z2UNQo84z/HcR/.XpU3hIvSdYmP1PF3WCyyFlTCNBER2xK','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100030,'maz@uoit.net','$2b$10$nZcW/s/16HyKRUaHvMdDK.av/wY6lZhK0jJKVKTdhm3Y2O8nivco6','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100031,'mazn@uoit.net','$2b$10$wUO/elI0J3tCdoawzuYIdOoCjn/y4sjxP01Ok3xnP3JyZkntaMnDO','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100032,'m@uoit.net','$2b$10$D0GTjodao9Av4BjoiLNGfuN/0pkOIwCV2tOwdU1VA9yhF3uAvURtu','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100033,'n@uoit.net','$2b$10$ABwGmk0T/SaaSWejT0xzW.E/9.MU9ai/GPuLjIZ.4EBfQoUsFLorO','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100034,'mz@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$9VopYBQjMxxQBy4dDVENjA$s6Brj//qqGc4gnWQjc+vzbIn9E6Y+hiRS6Co5HwmtYo','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100035,'m@uoit.ca','$argon2i$v=19$m=4096,t=3,p=1$YuvDjPi7iRzJ6W7oy19bFA$MApRpltXRbFtrLDPlvSZbPFc6pHkmVU8OJKGHBo9BE0','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100036,'wow@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$yceqROgBovQDjo+ToLJlSg$NQX7/HxGXrVRmoGlO+IFhyGIqPKX0kCNjSoBExgVzIY','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100037,'wow@uoit.ca','$argon2i$v=19$m=4096,t=3,p=1$APfHuAEQF42SRTKDr/ON/Q$n72C7Si5pKl8aj2N80wq2l1C72ms6PUQH1M8VdO/W0c','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100038,'maz@uoit.ca','$argon2i$v=19$m=4096,t=3,p=1$zxU05sxM1nExJp5qGujx4Q$ksjsXiwUmaKz/Ugdxr7R6vUc0VIXVxLNTLC0s6nsfQQ','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100039,'mazen.massoud@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$/Aii0jm+Jy6vGV3A2Bs7wg$iCSppeHciswJuZNl3YB0sxxQrR1z5FiTYEPiAkkXiI0','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100040,'didi@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$DiXGM+WFXbT/R4tWEOKtiw$w5gVjnEz+ZwbgYxOsIw8u9B5QZM9w+W3/URjLazlp8s','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100041,'admin@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$xXiGTg74xbW5eO67zzqj5A$6YykIiuw0Y6x6NR+LqrHAg5Tx/kOAtUGM8RXYyB+zYE','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100042,'test@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$zwURiPN+AsXE8SdUf/IHTQ$HU0nf9wDjpz3Yh2VJ9zSlt1OtTWOXBUBmQhTm88ZioA','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100043,'testing@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$h2rZoF5kQRt36eBS7qRZZw$5ilTNZmKMSjGyLhNC5Vqg2QNaAaWTEXe7TRHdq9quRc','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100044,'h@uoit.net','$argon2i$v=19$m=4096,t=3,p=1$Wql7/nTcFCKYz0sdmJzYwA$zPTcY3KULVjwBgJJfzCntZk4c3crBRkU1pCd8sD2hfs','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1),(100100045,'admin@uoit.ca','$argon2i$v=19$m=4096,t=3,p=1$flbLRehhP3/L34b1ko+enA$AmzAe/XAg+9IGErX7p22qCinuTxtCN/gx6JpeYkWgPw','John','Doe','2000 Simcoe St. North','L1L 1L1','416-888-2222',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-26 16:58:48
