-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: adn
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `dna`
--

DROP TABLE IF EXISTS `dna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dna` (
  `idDna` int unsigned NOT NULL AUTO_INCREMENT,
  `dna` varchar(45) NOT NULL,
  `idTipoDna` int unsigned NOT NULL,
  PRIMARY KEY (`idDna`),
  UNIQUE KEY `dnaUnico` (`dna`),
  KEY `fk_dna_tipoDna_idx` (`idTipoDna`),
  CONSTRAINT `fk_dna_tipoDna` FOREIGN KEY (`idTipoDna`) REFERENCES `tipoDna` (`idTipoDna`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dna`
--

LOCK TABLES `dna` WRITE;
/*!40000 ALTER TABLE `dna` DISABLE KEYS */;
INSERT INTO `dna` VALUES (1,'CCCCTA',2),(2,'GGGGTT',2),(3,'AAAATG',2),(4,'undefined',2),(5,'ATGCGA',1),(6,'CAGTGC',1),(7,'TTATGT',1),(8,'AGAAGG',1),(10,'TCACTG',1);
/*!40000 ALTER TABLE `dna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoDna`
--

DROP TABLE IF EXISTS `tipoDna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoDna` (
  `idTipoDna` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDna`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoDna`
--

LOCK TABLES `tipoDna` WRITE;
/*!40000 ALTER TABLE `tipoDna` DISABLE KEYS */;
INSERT INTO `tipoDna` VALUES (1,'Humano'),(2,'Mutante');
/*!40000 ALTER TABLE `tipoDna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-16 20:21:12
