-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: netflix
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `idactor` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `birthday` date DEFAULT NULL,
  `photo` longtext,
  PRIMARY KEY (`idactor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Tom','Hanks','Estados Unidos','1956-07-09',NULL),(2,'Roberto','Benigni','Italia','1952-10-27',NULL),(3,'John','Travolta','Estados Unidos','1954-02-18',NULL);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors_appear_movies`
--

DROP TABLE IF EXISTS `actors_appear_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors_appear_movies` (
  `actors_idactor` int NOT NULL,
  `movies_idmovies` int NOT NULL,
  PRIMARY KEY (`actors_idactor`,`movies_idmovies`),
  KEY `fk_actors_has_movies_movies1_idx` (`movies_idmovies`),
  KEY `fk_actors_has_movies_actors1_idx` (`actors_idactor`),
  CONSTRAINT `fk_actors_has_movies_actors1` FOREIGN KEY (`actors_idactor`) REFERENCES `actors` (`idactor`),
  CONSTRAINT `fk_actors_has_movies_movies1` FOREIGN KEY (`movies_idmovies`) REFERENCES `movies` (`idmovies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors_appear_movies`
--

LOCK TABLES `actors_appear_movies` WRITE;
/*!40000 ALTER TABLE `actors_appear_movies` DISABLE KEYS */;
INSERT INTO `actors_appear_movies` VALUES (3,1),(2,2),(1,3);
/*!40000 ALTER TABLE `actors_appear_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `idmovies` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `category` varchar(45) NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`idmovies`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Pulp Fiction','Crimen.','https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg','Top 10',1994),(2,'La vita è bella','Comedia','https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg','Top 10',1997),(3,'Forrest Gump','Comedia','https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg','Top 10',1994);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `plan_details` varchar(45) NOT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'laura_dev','laura','Laura','laura@gmail.com','Standard'),(2,'maria_dev','maria','Maria','maria@gmail.com','Standard'),(3,'ester_dev','ester','Ester','ester@gmail.com','Standard');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_love_movies`
--

DROP TABLE IF EXISTS `users_love_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_love_movies` (
  `users_idusers` int NOT NULL,
  `movies_idmovies` int NOT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`users_idusers`,`movies_idmovies`),
  KEY `fk_users_has_movies_movies1_idx` (`movies_idmovies`),
  KEY `fk_users_has_movies_users_idx` (`users_idusers`),
  CONSTRAINT `fk_users_has_movies_movies1` FOREIGN KEY (`movies_idmovies`) REFERENCES `movies` (`idmovies`),
  CONSTRAINT `fk_users_has_movies_users` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_love_movies`
--

LOCK TABLES `users_love_movies` WRITE;
/*!40000 ALTER TABLE `users_love_movies` DISABLE KEYS */;
INSERT INTO `users_love_movies` VALUES (1,1,10),(1,2,10),(2,2,10);
/*!40000 ALTER TABLE `users_love_movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-23  9:57:09
