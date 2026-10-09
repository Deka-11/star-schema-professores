-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: star_schema_professores
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
-- Table structure for table `dados_curso`
--

DROP TABLE IF EXISTS `dados_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dados_curso` (
  `idCurso` int NOT NULL,
  `Nome_Curso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dados_data`
--

DROP TABLE IF EXISTS `dados_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dados_data` (
  `idData` int NOT NULL,
  `Data_Oferta` date DEFAULT NULL,
  `Dia` int DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `Trimestre` int DEFAULT NULL,
  `Semestre` int DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  PRIMARY KEY (`idData`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dados_departamento`
--

DROP TABLE IF EXISTS `dados_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dados_departamento` (
  `idDepartamento` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Campus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dados_disciplina`
--

DROP TABLE IF EXISTS `dados_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dados_disciplina` (
  `idDisciplina` int NOT NULL,
  `Nome_Disciplina` varchar(100) DEFAULT NULL,
  `Carga_Horaria` int DEFAULT NULL,
  PRIMARY KEY (`idDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dados_professor`
--

DROP TABLE IF EXISTS `dados_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dados_professor` (
  `idProfessor` int NOT NULL,
  `Nome_Professor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fato_professor`
--

DROP TABLE IF EXISTS `fato_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fato_professor` (
  `idFato` int NOT NULL AUTO_INCREMENT,
  `idProfessor` int DEFAULT NULL,
  `idDepartamento` int DEFAULT NULL,
  `idDisciplina` int DEFAULT NULL,
  `idCurso` int DEFAULT NULL,
  `idData` int DEFAULT NULL,
  `Quantidade_Ofertas` int DEFAULT NULL,
  PRIMARY KEY (`idFato`),
  KEY `idProfessor` (`idProfessor`),
  KEY `idDepartamento` (`idDepartamento`),
  KEY `idDisciplina` (`idDisciplina`),
  KEY `idCurso` (`idCurso`),
  KEY `idData` (`idData`),
  CONSTRAINT `fato_professor_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `dados_professor` (`idProfessor`),
  CONSTRAINT `fato_professor_ibfk_2` FOREIGN KEY (`idDepartamento`) REFERENCES `dados_departamento` (`idDepartamento`),
  CONSTRAINT `fato_professor_ibfk_3` FOREIGN KEY (`idDisciplina`) REFERENCES `dados_disciplina` (`idDisciplina`),
  CONSTRAINT `fato_professor_ibfk_4` FOREIGN KEY (`idCurso`) REFERENCES `dados_curso` (`idCurso`),
  CONSTRAINT `fato_professor_ibfk_5` FOREIGN KEY (`idData`) REFERENCES `dados_data` (`idData`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-09 18:32:39
