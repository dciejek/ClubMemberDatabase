CREATE DATABASE  IF NOT EXISTS `scholarship` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `scholarship`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: scholarship
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `club_member`
--

DROP TABLE IF EXISTS `club_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club_member` (
  `member_id` int NOT NULL,
  `member_name` varchar(256) NOT NULL,
  `phone_number` bigint NOT NULL,
  `email` varchar(256) NOT NULL,
  `admission_year` int NOT NULL,
  `expected_grad` int NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_member`
--

LOCK TABLES `club_member` WRITE;
/*!40000 ALTER TABLE `club_member` DISABLE KEYS */;
INSERT INTO `club_member` VALUES (1,'Joe Smith',21833,'kjasdhf',2020,2028),(299,'Jon Khazzaka',2037706722,'khazzaka.j@northeastern.edu',2021,2026),(303,'Wes Rising',2037256748,'rising.w@northeastern.edu',2021,2025),(307,'Daniel Ciejek',4134411706,'ciejek.d@northeastern.edu',2023,2027),(314,'Quinn Moran',6147467532,'moran.q@northeastern.edu',2020,2024);
/*!40000 ALTER TABLE `club_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `college_id` int NOT NULL,
  `college_name` varchar(256) NOT NULL,
  PRIMARY KEY (`college_name`),
  UNIQUE KEY `college_id` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,'Bouve College of Health Sciences'),(2,'College of Arts, Media, & Design'),(3,'College of Engineering'),(4,'College of Professional Studies'),(5,'College of Science'),(6,'College of Social Sciences & Humanities'),(7,'D\'Amore-McKim School of Business'),(8,'Khoury College of Computer Sciences');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_abbrev` varchar(16) NOT NULL,
  `course_name` varchar(256) NOT NULL,
  `credit_hours` int NOT NULL,
  PRIMARY KEY (`course_abbrev`),
  UNIQUE KEY `course_name` (`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('COMM1125','Communication Theory',4),('CS2500','Fundamentals of Computer Science I',4),('CS2510','Fundamentals of Computer Science II',4),('CS3200','Database Design',4),('CS3500','Object Oriented Design',4),('ENGW3302','Advanced Writing in the Technical Professions',4),('HIST2220','History of Technology',4),('MATH3081','Probability & Statistics',4),('MATH4545','Fourier Series & PDEs',4),('ME3455','Dynamics',4),('ME4550','Mechanical Design',4),('MEIE4701','Mechanical Engineering Capstone I',1),('MEIE4702','Mechanical Engineering Capstone II',5);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `declares_major`
--

DROP TABLE IF EXISTS `declares_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `declares_major` (
  `member_id` int NOT NULL,
  `major_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`major_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `declares_major_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `club_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `declares_major_ibfk_2` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `declares_major`
--

LOCK TABLES `declares_major` WRITE;
/*!40000 ALTER TABLE `declares_major` DISABLE KEYS */;
INSERT INTO `declares_major` VALUES (303,3),(307,8);
/*!40000 ALTER TABLE `declares_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `declares_minor`
--

DROP TABLE IF EXISTS `declares_minor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `declares_minor` (
  `member_id` int NOT NULL,
  `minor_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`minor_id`),
  KEY `minor_id` (`minor_id`),
  CONSTRAINT `declares_minor_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `club_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `declares_minor_ibfk_2` FOREIGN KEY (`minor_id`) REFERENCES `minor` (`minor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `declares_minor`
--

LOCK TABLES `declares_minor` WRITE;
/*!40000 ALTER TABLE `declares_minor` DISABLE KEYS */;
INSERT INTO `declares_minor` VALUES (303,16),(303,25);
/*!40000 ALTER TABLE `declares_minor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `major_id` int NOT NULL AUTO_INCREMENT,
  `major_name` varchar(256) NOT NULL,
  `college_name` varchar(256) NOT NULL,
  PRIMARY KEY (`major_id`),
  UNIQUE KEY `major_name` (`major_name`),
  KEY `college_name` (`college_name`),
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`college_name`) REFERENCES `college` (`college_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Bioengineering','College of Engineering'),(2,'Chemical Engineering','College of Engineering'),(3,'Mechanical Engineering','College of Engineering'),(4,'Electrical Engineering','College of Engineering'),(5,'Civil Engineering','College of Engineering'),(6,'Industrial Engineering','College of Engineering'),(7,'Computer Engineering','College of Engineering'),(8,'Computer Science','Khoury College of Computer Sciences'),(9,'Data Science','Khoury College of Computer Sciences'),(10,'Cybersecurity','Khoury College of Computer Sciences'),(11,'Business Administration','D\'Amore-McKim School of Business'),(12,'International Business','D\'Amore-McKim School of Business'),(13,'Biology','College of Science'),(14,'Chemistry','College of Science'),(15,'Marine & Environmental Sciences','College of Science'),(16,'Mathematics','College of Science'),(17,'Physics','College of Science'),(18,'Psychology','College of Science');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minor`
--

DROP TABLE IF EXISTS `minor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minor` (
  `minor_id` int NOT NULL AUTO_INCREMENT,
  `minor_name` varchar(256) NOT NULL,
  `college_name` varchar(256) NOT NULL,
  PRIMARY KEY (`minor_id`),
  UNIQUE KEY `minor_name` (`minor_name`),
  KEY `college_name` (`college_name`),
  CONSTRAINT `minor_ibfk_1` FOREIGN KEY (`college_name`) REFERENCES `college` (`college_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minor`
--

LOCK TABLES `minor` WRITE;
/*!40000 ALTER TABLE `minor` DISABLE KEYS */;
INSERT INTO `minor` VALUES (1,'Aerospace','College of Engineering'),(2,'Architectural Engineering','College of Engineering'),(3,'Biochemical Engineering','College of Engineering'),(4,'Biomechanical Engineering','College of Engineering'),(5,'Civil Engineering','College of Engineering'),(6,'Computational Data Analytics','College of Engineering'),(7,'Computer Engineering','College of Engineering'),(8,'Electrical Engineering','College of Engineering'),(9,'Entrepreneurial Engineering','College of Engineering'),(10,'Industrial Engineering','College of Engineering'),(11,'Materials Science & Engineering','College of Engineering'),(12,'Mechanical Engineering','College of Engineering'),(13,'Robotics','College of Engineering'),(14,'Sustainable Energy Systems','College of Engineering'),(15,'Data Science','Khoury College of Computer Sciences'),(16,'Computer Science','Khoury College of Computer Sciences'),(17,'Biology','College of Professional Studies'),(18,'Business','College of Professional Studies'),(19,'Creative Writing','College of Professional Studies'),(20,'Healthcare Administration','College of Professional Studies'),(21,'Information Technology','College of Professional Studies'),(22,'Organizational Communication','College of Professional Studies'),(23,'Psychology','College of Professional Studies'),(24,'Sociology','College of Professional Studies'),(25,'Mathematics','College of Science'),(26,'Physics','College of Science');
/*!40000 ALTER TABLE `minor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `professor_name` varchar(256) NOT NULL,
  PRIMARY KEY (`professor_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('George Prasanth'),('Jahir Pabon'),('Kathleen Durant'),('Lee-Peng Lee'),('Lucia Nunez'),('Malcolm Purinton'),('Michael Allshouse'),('Susan Mello'),('Talia Vestri'),('Yustianto Tjiptowidjojo');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `semester_type` enum('Fall','Spring','Summer 1','Summer 2') NOT NULL,
  `semester_year` int NOT NULL,
  PRIMARY KEY (`semester_type`,`semester_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES ('Fall',2021),('Fall',2022),('Fall',2023),('Fall',2024),('Fall',2025),('Spring',2022),('Spring',2023),('Spring',2024),('Spring',2025),('Summer 1',2022),('Summer 1',2023),('Summer 1',2024),('Summer 1',2025),('Summer 2',2022),('Summer 2',2023),('Summer 2',2024),('Summer 2',2025);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `member_id` int NOT NULL,
  `semester_type` enum('Fall','Spring','Summer 1','Summer 2') NOT NULL,
  `semester_year` int NOT NULL,
  `course_abbrev` varchar(16) NOT NULL,
  `professor_name` varchar(256) NOT NULL,
  PRIMARY KEY (`member_id`,`semester_type`,`semester_year`,`course_abbrev`),
  KEY `semester_type` (`semester_type`,`semester_year`),
  KEY `course_abbrev` (`course_abbrev`),
  KEY `professor_name` (`professor_name`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `club_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`semester_type`, `semester_year`) REFERENCES `semester` (`semester_type`, `semester_year`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `takes_ibfk_3` FOREIGN KEY (`course_abbrev`) REFERENCES `course` (`course_abbrev`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `takes_ibfk_4` FOREIGN KEY (`professor_name`) REFERENCES `professor` (`professor_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES (303,'Fall',2024,'MATH4545','George Prasanth'),(299,'Fall',2024,'ME3455','Jahir Pabon'),(303,'Fall',2024,'ME3455','Jahir Pabon'),(303,'Fall',2024,'CS3200','Kathleen Durant'),(307,'Fall',2024,'CS3200','Kathleen Durant'),(303,'Summer 2',2024,'MATH3081','Lee-Peng Lee'),(307,'Fall',2024,'CS3500','Lucia Nunez'),(307,'Fall',2024,'HIST2220','Malcolm Purinton'),(303,'Fall',2024,'MEIE4702','Michael Allshouse'),(303,'Summer 2',2024,'MEIE4701','Michael Allshouse'),(307,'Fall',2024,'COMM1125','Susan Mello'),(303,'Spring',2024,'ENGW3302','Talia Vestri'),(303,'Summer 2',2024,'ME4550','Yustianto Tjiptowidjojo');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'scholarship'
--
/*!50003 DROP FUNCTION IF EXISTS `count_member_credits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_member_credits`(member_id_p VARCHAR(256)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE credit_count INT;
    IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
	SELECT IFNULL(SUM(c.credit_hours), 0)
    INTO credit_count
	FROM club_member cm
    LEFT JOIN takes t ON cm.member_id = t.member_id
    LEFT JOIN course c ON t.course_abbrev = c.course_abbrev
    WHERE member_id_p = cm.member_id;
    RETURN credit_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_course` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_course`(
	course_abbrev_p VARCHAR(16),
    course_name_p VARCHAR(256),
    credit_hours_p INT,
    member_id_p INT,
    professor_name_p VARCHAR(256),
    semester_type_p ENUM("Fall", "Spring", "Summer 1", "Summer 2"),
    semester_year_p INT)
BEGIN
	IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
	IF professor_name_p NOT IN (SELECT professor_name FROM professor) THEN
		INSERT INTO professor(professor_name)
		VALUES (professor_name_p);
	END IF;
	IF course_abbrev_p NOT IN (SELECT course_abbrev FROM course) THEN
		INSERT INTO course(course_abbrev, course_name, credit_hours)
		VALUES  (course_abbrev_p, course_name_p, credit_hours_p);
	END IF;
	IF (SELECT count(semester_type) FROM semester WHERE semester_type = semester_type_p
													AND semester_year = semester_year_p) = 0 THEN
		INSERT INTO semester(semester_type, semester_year)
		VALUES (semester_type_p, semester_year_p);
	END IF;
	INSERT INTO takes(member_id, semester_type, semester_year, course_abbrev, professor_name)
	VALUES(member_id_p, semester_type_p, semester_year_p, course_abbrev_p, professor_name_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_major` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_major`(
    major_name_p VARCHAR(256),
    college_name_p VARCHAR(256))
BEGIN
	IF major_name_p IN (SELECT major_name FROM major) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Major already exists.';
	END IF;
        
	INSERT INTO major (major_name, college_name)
	VALUES (major_name_p, college_name_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_member`(
	member_id_p INT,
    member_name_p VARCHAR(256),
    phone_number_p BIGINT,
    email_p VARCHAR(256),
    admission_year_p INT,
    expected_grad_p INT)
BEGIN
	INSERT INTO club_member (member_id, member_name, phone_number, email, admission_year, expected_grad)
	VALUES (
		member_id_p, 
		member_name_p, 
		phone_number_p, 
		email_p, 
		admission_year_p, 
		expected_grad_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_minor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_minor`(
    minor_name_p VARCHAR(256),
    college_name_p VARCHAR(256))
BEGIN
	IF minor_name_p IN (SELECT minor_name FROM minor) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Minor already exists.';
	END IF;
        
	INSERT INTO minor (minor_name, college_name)
	VALUES (minor_name_p, college_name_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `associate_major` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `associate_major`(
	member_id_p INT,
    major_id_p INT)
BEGIN
	IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
    IF major_id_p NOT IN (SELECT major_id FROM major) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Major does not exist';
	END IF;
    IF (SELECT COUNT(*) FROM declares_major dm WHERE dm.major_id = major_id_p AND dm.member_id = member_id_p) > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'This member has already declared this major.';
	END IF;
		
	INSERT INTO declares_major(member_id, major_id)
	VALUES (member_id_p, major_id_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `associate_minor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `associate_minor`(
	member_id_p INT,
    minor_id_p INT)
BEGIN
	IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
    IF minor_id_p NOT IN (SELECT minor_id FROM minor) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Minor does not exist.';
	END IF;
    IF (SELECT COUNT(*) FROM declares_minor dm WHERE dm.minor_id = minor_id_p AND dm.member_id = member_id_p) > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'This member has already declared this minor.';
	END IF;
		
	INSERT INTO declares_minor(member_id, minor_id)
	VALUES (member_id_p, minor_id_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `by_college` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `by_college`()
BEGIN
	SELECT maj.college_name, COUNT(cm.member_id) num_members
	FROM club_member cm
    JOIN declares_major dmaj ON dmaj.member_id = cm.member_id
    JOIN major maj ON maj.major_id = dmaj.major_id
    GROUP BY maj.college_name
    ORDER BY num_members;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `by_major` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `by_major`()
BEGIN
	SELECT maj.major_name, COUNT(cm.member_id) num_members
	FROM club_member cm
    JOIN declares_major dmaj ON dmaj.member_id = cm.member_id
    JOIN major maj ON maj.major_id = dmaj.major_id
    GROUP BY maj.major_name
    ORDER BY num_members;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `by_minor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `by_minor`()
BEGIN
	SELECT min.minor_name, COUNT(cm.member_id) num_members
	FROM club_member cm
    JOIN declares_minor dmin ON dmin.member_id = cm.member_id
    JOIN minor min ON dmin.minor_id = min.minor_id
    GROUP BY min.minor_name
    ORDER BY num_members;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_credits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_credits`()
BEGIN
	SELECT cm.member_id, cm.member_name, IFNULL(SUM(c.credit_hours), 0) credit_total
	FROM club_member cm
    LEFT JOIN takes t ON cm.member_id = t.member_id
    LEFT JOIN course c ON t.course_abbrev = c.course_abbrev
    GROUP BY cm.member_id
    ORDER BY cm.member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disassociate_major` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `disassociate_major`(
	member_id_p INT,
    major_id_p INT)
BEGIN
	IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
    IF major_id_p NOT IN (SELECT major_id FROM major) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Major does not exist.';
	END IF;
    IF (SELECT COUNT(*) FROM declares_major dm WHERE dm.major_id = major_id_p AND dm.member_id = member_id_p) = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'This member does not have this major.';
	END IF;
	DELETE FROM declares_major WHERE member_id_p = member_id AND major_id_p = major_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disassociate_minor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `disassociate_minor`(
	member_id_p INT,
    minor_id_p INT)
BEGIN
	IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
    IF minor_id_p NOT IN (SELECT minor_id FROM minor) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Major does not exist.';
	END IF;
    IF (SELECT COUNT(*) FROM declares_minor dm WHERE dm.minor_id = minor_id_p AND dm.member_id = member_id_p) = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'This member does not have this minor.';
	END IF;
	DELETE FROM declares_minor WHERE member_id_p = member_id AND minor_id_p = minor_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_courses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_courses`(member_id_p VARCHAR(16))
BEGIN
	IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
	SELECT
		t.course_abbrev,
        c.course_name,
        c.credit_hours,
        t.semester_type, 
        t.semester_year, 
        t.professor_name
	FROM takes t
    JOIN course c ON t.course_abbrev = c.course_abbrev
    WHERE member_id_p = t.member_id
    ORDER BY course_abbrev;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `majors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `majors`()
BEGIN
	SELECT * FROM major;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `minors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `minors`()
BEGIN
	SELECT * FROM minor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_major` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_major`(
	major_id_p INT)
BEGIN
	IF major_id_p NOT IN (SELECT major_id FROM major) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Major does not exist.';
	END IF;
	DELETE FROM major WHERE major_id = major_id_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_member`(member_id_p INT)
BEGIN
	IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
	DELETE FROM club_member WHERE member_id = member_id_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_minor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_minor`(
	minor_id_p INT)
BEGIN
	IF minor_id_p NOT IN (SELECT minor_id FROM minor) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Minor does not exist.';
	END IF;
	DELETE FROM minor WHERE minor_id = minor_id_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_member`(
    member_id_p INT,
    member_name_p VARCHAR(256),
    phone_number_p BIGINT,
    email_p VARCHAR(256),
    admission_year_p INT,
    expected_grad_p INT)
BEGIN
    IF member_id_p NOT IN (SELECT member_id FROM club_member) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No member exists with given ID.';
	END IF;
	UPDATE club_member cm
    SET cm.member_name = member_name_p,
		cm.phone_number = phone_number_p,
        cm.email = email_p,
        cm.admission_year = admission_year_p,
        cm.expected_grad = expected_grad_p
	WHERE cm.member_id = member_id_p;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `who_has_taken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `who_has_taken`(course_abbrev_p VARCHAR(16))
BEGIN
	IF course_abbrev_p NOT IN (SELECT course_abbrev FROM course) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'The course you have provided does not exist or has not been taken by a member of the club yet.';
	END IF;
	SELECT 
		cm.member_id, 
        cm.member_name, 
        YEAR(CURDATE()) - cm.admission_year + 1 AS current_year, 
        cm.phone_number, 
        cm.email, 
        t.semester_type, 
        t.semester_year, 
        t.professor_name
	FROM club_member cm
    JOIN takes t ON cm.member_id = t.member_id
    WHERE course_abbrev_p = t.course_abbrev
    GROUP BY cm.member_id, t.semester_type, t.semester_year, t.professor_name
    ORDER BY cm.member_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 23:30:14
