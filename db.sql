-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_2proj_form
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id_question` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `type` enum('short answer','long answer','multiple choice','checkbox','dropdown list','linear scale','multiple choice grid','checkbox grid','date','time','datetime') NOT NULL,
  `mandatory` tinyint(1) NOT NULL,
  `id_survey` int NOT NULL,
  PRIMARY KEY (`id_question`),
  KEY `id_survey_idx` (`id_survey`),
  CONSTRAINT `id_survey` FOREIGN KEY (`id_survey`) REFERENCES `survey` (`id_survey`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_question_linear_scale`
--

DROP TABLE IF EXISTS `sub_question_linear_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_question_linear_scale` (
  `id_sub` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `down_scale` tinyint NOT NULL,
  `up_scale` tinyint NOT NULL,
  `down_scale_name` varchar(200) NOT NULL,
  `up_scale_name` varchar(200) NOT NULL,
  `id_question` int NOT NULL,
  PRIMARY KEY (`id_sub`),
  KEY `id_question_idx` (`id_question`),
  CONSTRAINT `id_question_ls` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_question_mc_cb_ddl`
--

DROP TABLE IF EXISTS `sub_question_mc_cb_ddl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_question_mc_cb_ddl` (
  `id_sub` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `id_question` int NOT NULL,
  PRIMARY KEY (`id_sub`),
  KEY `id_question_idx` (`id_question`),
  CONSTRAINT `id_question_mc_cb_ddl` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_question_mcg_cbg_column`
--

DROP TABLE IF EXISTS `sub_question_mcg_cbg_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_question_mcg_cbg_column` (
  `id_sub` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `id_sub_line` int NOT NULL,
  PRIMARY KEY (`id_sub`),
  KEY `id_sub_line_idx` (`id_sub_line`),
  CONSTRAINT `id_sub_line` FOREIGN KEY (`id_sub_line`) REFERENCES `sub_question_mcg_cbg_line` (`id_sub`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_question_mcg_cbg_line`
--

DROP TABLE IF EXISTS `sub_question_mcg_cbg_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_question_mcg_cbg_line` (
  `id_sub` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `id_question` int NOT NULL,
  PRIMARY KEY (`id_sub`),
  KEY `id_question_multiple_idx` (`id_question`),
  CONSTRAINT `id_question_multiple` FOREIGN KEY (`id_question`) REFERENCES `question` (`id_question`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `id_survey` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_survey`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-16 19:34:43
