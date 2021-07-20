-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: TREK
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'Рабочее место',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='отдел';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'ОТК','2021-07-20 17:38:44','2021-07-20 17:38:44'),(2,'ИТР','2021-07-20 17:38:44','2021-07-20 17:38:44'),(3,'Слесарная мастерская','2021-07-20 17:38:44','2021-07-20 17:38:44'),(4,'Шлифовальная мастерская','2021-07-20 17:38:44','2021-07-20 17:38:44'),(5,'Токарная группа','2021-07-20 17:38:44','2021-07-20 17:38:44'),(6,'Фрезерная группа','2021-07-20 17:38:44','2021-07-20 17:38:44'),(7,'Склад','2021-07-20 17:38:44','2021-07-20 17:38:44');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'оборудование',
  `deskription` varchar(250) NOT NULL COMMENT 'описание',
  `those_service` date DEFAULT NULL COMMENT 'дата тех обслуживания',
  `status_equipment_id` bigint unsigned NOT NULL COMMENT 'Статус Рабочего места(ремонт, тех обсл. итд.)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `equipment_status_id_fk` (`status_equipment_id`),
  CONSTRAINT `equipment_status_id_fk` FOREIGN KEY (`status_equipment_id`) REFERENCES `status` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='оборудование';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'310','токарный станок','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(2,'510','токарный станок','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(3,'120','фрезерный','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(4,'KGM','координатно измерительный станок','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(5,'VIM','видио измерительный станок','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(6,'SH','шлифовальный станок','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(7,'hs','шлифовально-полировальны станок','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(8,'echo','фрезерный','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45'),(9,'p2','компьютер','2025-10-05',8,'2021-07-20 17:38:45','2021-07-20 17:38:45');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskd`
--

DROP TABLE IF EXISTS `eskd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eskd` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Название',
  `filename` varchar(255) NOT NULL COMMENT 'Путь к файлу',
  `filename_doc` varchar(255) NOT NULL COMMENT 'Ссылка на документацию',
  `tz_eskd_id` bigint unsigned NOT NULL COMMENT 'Ссылка на тех задание',
  `workers_razr_eskd_id` bigint unsigned NOT NULL COMMENT 'кто разработал',
  `workers_prov_eskd_id` bigint unsigned NOT NULL COMMENT 'кто проверил',
  `workers_utv_eskd_id` bigint unsigned NOT NULL COMMENT 'кто утвердил',
  `material_id` bigint unsigned NOT NULL COMMENT 'материал',
  `metadata` json DEFAULT NULL COMMENT 'Метаданные изделия(размеры, допуска, посадки итд.)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `eskd_specification_fk` (`tz_eskd_id`),
  KEY `workers_razr_eskd_id_workers_id_fk` (`workers_razr_eskd_id`),
  KEY `workers_prov_eskd_id_workers_id_fk` (`workers_prov_eskd_id`),
  KEY `workers_utv_eskd_id_workers_id_fk` (`workers_utv_eskd_id`),
  KEY `eskd_material_id_fk` (`material_id`),
  CONSTRAINT `eskd_material_id_fk` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `eskd_specification_fk` FOREIGN KEY (`tz_eskd_id`) REFERENCES `specification` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workers_prov_eskd_id_workers_id_fk` FOREIGN KEY (`workers_prov_eskd_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workers_razr_eskd_id_workers_id_fk` FOREIGN KEY (`workers_razr_eskd_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workers_utv_eskd_id_workers_id_fk` FOREIGN KEY (`workers_utv_eskd_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='единая система конструкторской документации';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskd`
--

LOCK TABLES `eskd` WRITE;
/*!40000 ALTER TABLE `eskd` DISABLE KEYS */;
INSERT INTO `eskd` VALUES (1,'55001-04','https://www','https://www',2,10,1,1,2,NULL,'2021-07-20 17:39:05','2021-07-20 17:39:05');
/*!40000 ALTER TABLE `eskd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estd`
--

DROP TABLE IF EXISTS `estd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estd` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Название',
  `filename` varchar(255) NOT NULL COMMENT 'Путь к файлу',
  `eskd_id` bigint unsigned NOT NULL COMMENT 'Ссылка на конструкторскую документацию',
  `tz_estd_id` bigint unsigned NOT NULL COMMENT 'Ссылка на тех задание',
  `workers_razr_estd_id` bigint unsigned NOT NULL COMMENT 'кто разработал',
  `workers_prov_estd_id` bigint unsigned NOT NULL COMMENT 'кто проверил',
  `workers_utv_estd_id` bigint unsigned NOT NULL COMMENT 'кто утвердил',
  `material_count` varchar(50) NOT NULL COMMENT 'материал на 1 ед изделия',
  `metadata` json DEFAULT NULL COMMENT 'Метаданные изделия(размеры, допуска, посадки итд.)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `estd_eskd_fk` (`eskd_id`),
  KEY `estd_specification_fk` (`tz_estd_id`),
  KEY `workers_razr_estd_id_workers_id_fk` (`workers_razr_estd_id`),
  KEY `workers_prov_estd_id_workers_id_fk` (`workers_prov_estd_id`),
  KEY `workers_utv_estd_id_workers_id_fk` (`workers_utv_estd_id`),
  CONSTRAINT `estd_eskd_fk` FOREIGN KEY (`eskd_id`) REFERENCES `eskd` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `estd_specification_fk` FOREIGN KEY (`tz_estd_id`) REFERENCES `specification` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workers_prov_estd_id_workers_id_fk` FOREIGN KEY (`workers_prov_estd_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workers_razr_estd_id_workers_id_fk` FOREIGN KEY (`workers_razr_estd_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workers_utv_estd_id_workers_id_fk` FOREIGN KEY (`workers_utv_estd_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='единая система технологической документации';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estd`
--

LOCK TABLES `estd` WRITE;
/*!40000 ALTER TABLE `estd` DISABLE KEYS */;
INSERT INTO `estd` VALUES (1,'55001-04','https://www',1,3,10,1,1,'2',NULL,'2021-07-20 17:39:07','2021-07-20 17:39:07');
/*!40000 ALTER TABLE `estd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `in_work`
--

DROP TABLE IF EXISTS `in_work`;
/*!50001 DROP VIEW IF EXISTS `in_work`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `in_work` (
  `id` tinyint NOT NULL,
  `Номер МП` tinyint NOT NULL,
  `Номер партии` tinyint NOT NULL,
  `Номер приказа` tinyint NOT NULL,
  `ЕСТД` tinyint NOT NULL,
  `Дет в партии` tinyint NOT NULL,
  `Тех ОП` tinyint NOT NULL,
  `Рабочий` tinyint NOT NULL,
  `Статус` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'название материала',
  `deskription` varchar(250) NOT NULL COMMENT 'свойства материала',
  `amount` varchar(100) NOT NULL COMMENT 'колличество на складе',
  `forma` varchar(100) NOT NULL COMMENT 'форма выпуска',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='материал';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'VT-6','Титановый сплав','10','пруток  метры','2021-07-20 17:38:54','2021-07-20 17:38:54'),(2,'VT-4','Титановый сплав','10','пруток  метры','2021-07-20 17:38:54','2021-07-20 17:38:54'),(3,'VT-1','Титановый сплав','10','колокол  шт','2021-07-20 17:38:54','2021-07-20 17:38:54'),(4,'12х18н10т','Нержавейка','5','пруток  метры','2021-07-20 17:38:54','2021-07-20 17:38:54'),(5,'херулен','полимер','20','пруток метры','2021-07-20 17:38:54','2021-07-20 17:38:54'),(6,'фторопласт','полимер','20','пруток метры','2021-07-20 17:38:54','2021-07-20 17:38:54');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp`
--

DROP TABLE IF EXISTS `mp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `namber_mp` int unsigned NOT NULL COMMENT 'Номер мп',
  `namber_part` int unsigned NOT NULL COMMENT 'Номер партии',
  `specification_id` bigint unsigned NOT NULL COMMENT 'Ссылка на техзадание(изготовить столькото таких то деталей)',
  `estd_id` bigint unsigned NOT NULL COMMENT 'Ссылка на технологическую документацию',
  `namber_detail` int unsigned NOT NULL COMMENT 'Колличество деталей в партии',
  `status_id` bigint unsigned NOT NULL COMMENT 'Статус мп(в работе, выполнен итд.)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `mp_specification_fk` (`specification_id`),
  KEY `mp_estd_fk` (`estd_id`),
  KEY `mp_status_fk` (`status_id`),
  CONSTRAINT `mp_estd_fk` FOREIGN KEY (`estd_id`) REFERENCES `estd` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `mp_specification_fk` FOREIGN KEY (`specification_id`) REFERENCES `specification` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `mp_status_fk` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='маршрутный паспорт';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp`
--

LOCK TABLES `mp` WRITE;
/*!40000 ALTER TABLE `mp` DISABLE KEYS */;
INSERT INTO `mp` VALUES (1,1,2,1,1,10,5,'2021-07-20 17:39:12','2021-07-20 17:39:12');
/*!40000 ALTER TABLE `mp` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`angrew`@`localhost`*/ /*!50003 TRIGGER `check_material_specification_insert` BEFORE INSERT ON `mp` FOR EACH ROW BEGIN
DECLARE a, b INT;

IF
(SELECT amount FROM material 
JOIN eskd
ON eskd.material_id = material.id
JOIN estd
ON estd.eskd_id = eskd.id
JOIN mp
ON mp.estd_id = estd.id
WHERE estd.id = NEW.mp.estd_id LIMIT 1)
<
(SELECT estd.material_count FROM material 
JOIN eskd
ON eskd.material_id = material.id
JOIN estd
ON estd.eskd_id = eskd.id
JOIN mp
ON mp.estd_id = estd.id
WHERE mp.id = NEW.mp.estd_id LIMIT 1)
 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Материалов на складе не достаточно';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mp_tech_op`
--

DROP TABLE IF EXISTS `mp_tech_op`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp_tech_op` (
  `mp_id` bigint unsigned NOT NULL COMMENT 'Ссылка мп',
  `tech_op_id` bigint unsigned NOT NULL COMMENT 'Ссылка на тех операцию',
  `workers_id` bigint unsigned NOT NULL COMMENT 'Кто будет выполнять данную тех операцию',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`mp_id`,`tech_op_id`) COMMENT 'Составной первичный ключ',
  KEY `mp_tech_op_tech_op_fk` (`tech_op_id`),
  KEY `mp_tech_op_workers_fk` (`workers_id`),
  CONSTRAINT `mp_tech_op_mp_fk` FOREIGN KEY (`mp_id`) REFERENCES `mp` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `mp_tech_op_tech_op_fk` FOREIGN KEY (`tech_op_id`) REFERENCES `tech_op` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `mp_tech_op_workers_fk` FOREIGN KEY (`workers_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='маршрутные паспорта и тех операции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_tech_op`
--

LOCK TABLES `mp_tech_op` WRITE;
/*!40000 ALTER TABLE `mp_tech_op` DISABLE KEYS */;
INSERT INTO `mp_tech_op` VALUES (1,1,5,'2021-07-20 17:39:15'),(1,2,5,'2021-07-20 17:39:15'),(1,3,15,'2021-07-20 17:39:15'),(1,4,5,'2021-07-20 17:39:15'),(1,5,5,'2021-07-20 17:39:15');
/*!40000 ALTER TABLE `mp_tech_op` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'Название должности',
  `responsibilities` text NOT NULL COMMENT 'Обязанности',
  `salary` varchar(100) NOT NULL COMMENT 'Оклад',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Должности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Генеральный директор','Управление всем','200000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(2,'Начальник производства','Ответственный по производству(мне очень не хочется закапыватся и прописывать все обязанности каждого)','100000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(3,'Начальник ОТК','мне очень не хочется закапыватся и прописывать все обязанности каждого','100000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(4,'Зам начальника производства','мне очень не хочется закапыватся и прописывать все обязанности каждого','70000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(5,'Мастер на производстве','мне очень не хочется закапыватся и прописывать все обязанности каждого','70000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(6,'Слесарь','мне очень не хочется закапыватся и прописывать все обязанности каждого','50000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(7,'Оператор ЧПУ','мне очень не хочется закапыватся и прописывать все обязанности каждого','65000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(8,'Контролер ОТК','мне очень не хочется закапыватся и прописывать все обязанности каждого','100000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(9,'Шлифовщик','мне очень не хочется закапыватся и прописывать все обязанности каждого','56000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(10,'Наладчик ЧПУ','мне очень не хочется закапыватся и прописывать все обязанности каждого','80000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(11,'Программист ЧПУ','мне очень не хочется закапыватся и прописывать все обязанности каждого','80000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(12,'Главный конструктор','мне очень не хочется закапыватся и прописывать все обязанности каждого','100000','2021-07-20 17:38:43','2021-07-20 17:38:43'),(13,'Бухгалтер','мне очень не хочется закапыватся и прописывать все обязанности каждого','100000','2021-07-20 17:38:43','2021-07-20 17:38:43');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'название',
  `adress` varchar(100) NOT NULL COMMENT 'адрес',
  `deskription` varchar(250) NOT NULL COMMENT 'описание',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='поставщики';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'DMGGGG','Москва','Поставщик станков','2021-07-20 17:38:55','2021-07-20 17:38:55'),(2,'SUNDVIKKKK','Москва','Поставщик режущего инструмента','2021-07-20 17:38:55','2021-07-20 17:38:55'),(3,'VIDIAAAA','Москва','Поставщик режущего инструмента','2021-07-20 17:38:55','2021-07-20 17:38:55'),(4,'Материал','Москва','Поставщик материалов','2021-07-20 17:38:55','2021-07-20 17:38:55');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_equipment`
--

DROP TABLE IF EXISTS `provider_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_equipment` (
  `provider_id` bigint unsigned NOT NULL COMMENT 'Ссылка на поставщиков',
  `equipment_id` bigint unsigned NOT NULL COMMENT 'Ссылка на таблицу оборудования',
  `price` varchar(100) NOT NULL COMMENT 'цена',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`provider_id`,`equipment_id`) COMMENT 'Составной первичный ключ',
  KEY `provider_equipment_equipment_fk` (`equipment_id`),
  CONSTRAINT `provider_equipment_equipment_fk` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `provider_equipment_provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='поставщики, инструменты и цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_equipment`
--

LOCK TABLES `provider_equipment` WRITE;
/*!40000 ALTER TABLE `provider_equipment` DISABLE KEYS */;
INSERT INTO `provider_equipment` VALUES (1,1,'1000','2021-07-20 17:38:58'),(1,2,'2000','2021-07-20 17:38:58'),(1,3,'2000','2021-07-20 17:38:58'),(1,4,'500','2021-07-20 17:38:58'),(1,5,'1000','2021-07-20 17:38:58'),(1,6,'5000','2021-07-20 17:38:58'),(1,7,'2000','2021-07-20 17:38:58'),(1,8,'1000','2021-07-20 17:38:58'),(1,9,'5000','2021-07-20 17:38:58');
/*!40000 ALTER TABLE `provider_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_material`
--

DROP TABLE IF EXISTS `provider_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_material` (
  `provider_id` bigint unsigned NOT NULL COMMENT 'Ссылка на поставщиков',
  `material_id` bigint unsigned NOT NULL COMMENT 'Ссылка на таблицу материалов',
  `price` varchar(100) NOT NULL COMMENT 'цена',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`provider_id`,`material_id`) COMMENT 'Составной первичный ключ',
  KEY `provider_material_material_id_fk` (`material_id`),
  CONSTRAINT `provider_material_material_id_fk` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `provider_material_provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='поставщики, инструменты и цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_material`
--

LOCK TABLES `provider_material` WRITE;
/*!40000 ALTER TABLE `provider_material` DISABLE KEYS */;
INSERT INTO `provider_material` VALUES (4,1,'1000','2021-07-20 17:38:57'),(4,2,'2000','2021-07-20 17:38:57'),(4,3,'2000','2021-07-20 17:38:57'),(4,4,'500','2021-07-20 17:38:57'),(4,5,'1000','2021-07-20 17:38:57'),(4,6,'5000','2021-07-20 17:38:57');
/*!40000 ALTER TABLE `provider_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_tool`
--

DROP TABLE IF EXISTS `provider_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_tool` (
  `provider_id` bigint unsigned NOT NULL COMMENT 'Ссылка на поставщиков',
  `tool_id` bigint unsigned NOT NULL COMMENT 'Ссылка на таблицу инструмента',
  `price` varchar(100) NOT NULL COMMENT 'цена',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`provider_id`,`tool_id`) COMMENT 'Составной первичный ключ',
  KEY `provider_tool_tool_fk` (`tool_id`),
  CONSTRAINT `provider_tool_provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `provider_tool_tool_fk` FOREIGN KEY (`tool_id`) REFERENCES `tool` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='поставщики, инструменты и цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_tool`
--

LOCK TABLES `provider_tool` WRITE;
/*!40000 ALTER TABLE `provider_tool` DISABLE KEYS */;
INSERT INTO `provider_tool` VALUES (2,1,'1000','2021-07-20 17:39:01'),(2,2,'2000','2021-07-20 17:39:01'),(2,3,'2000','2021-07-20 17:39:01'),(2,4,'500','2021-07-20 17:39:01'),(3,5,'1000','2021-07-20 17:39:01'),(3,6,'5000','2021-07-20 17:39:01'),(3,7,'2000','2021-07-20 17:39:01'),(3,8,'1000','2021-07-20 17:39:01');
/*!40000 ALTER TABLE `provider_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!50001 DROP VIEW IF EXISTS `salary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `salary` (
  `Рабочий` tinyint NOT NULL,
  `Зарплата сотрудника` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `specification`
--

DROP TABLE IF EXISTS `specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specification` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'название',
  `type_id` bigint unsigned NOT NULL COMMENT 'тип служебки(на изготовление, на разработку итд)',
  `deskription` varchar(250) NOT NULL COMMENT 'описание',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `specification_type_idd_fk` (`type_id`),
  CONSTRAINT `specification_type_idd_fk` FOREIGN KEY (`type_id`) REFERENCES `specification_type` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='тех записка, тех задание, служебка итд';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specification`
--

LOCK TABLES `specification` WRITE;
/*!40000 ALTER TABLE `specification` DISABLE KEYS */;
INSERT INTO `specification` VALUES (1,'Изготовление изделия №55001-04',1,'Задание на изготовление чашки бесцементной фиксации 4того типа размера','2021-07-20 17:39:04','2021-07-20 17:39:04'),(2,'Разработка конструкции изделия 55001-04',4,'Задание на разработку','2021-07-20 17:39:04','2021-07-20 17:39:04'),(3,'Разработка технологии на изделия 55001-04',2,'Задание на разработку технологии','2021-07-20 17:39:04','2021-07-20 17:39:04'),(4,'Разработка программы на изготовление изделия 55001-04',3,'Задание на разработку программы','2021-07-20 17:39:04','2021-07-20 17:39:04');
/*!40000 ALTER TABLE `specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specification_type`
--

DROP TABLE IF EXISTS `specification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specification_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'название',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='тех записка(на изготовление, разработку, починку, улучшение, доработку итд)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specification_type`
--

LOCK TABLES `specification_type` WRITE;
/*!40000 ALTER TABLE `specification_type` DISABLE KEYS */;
INSERT INTO `specification_type` VALUES (1,'Изготовление','2021-07-20 17:39:02'),(2,'Разработка технологии','2021-07-20 17:39:02'),(3,'Разработка программы','2021-07-20 17:39:02'),(4,'Разработка конструкции','2021-07-20 17:39:02');
/*!40000 ALTER TABLE `specification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Статус',
  `deskription` varchar(100) NOT NULL COMMENT 'Описание(статус рабочего, инструмента итд)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Болен, в отпуске итд, оборудование сломано, тех обсл. итд.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Работает','Статус рабочего','2021-07-20 17:38:42'),(2,'В отпуске','Статус рабочего','2021-07-20 17:38:42'),(3,'Уволен','Статус рабочего','2021-07-20 17:38:42'),(4,'На больничном','Статус рабочего','2021-07-20 17:38:42'),(5,'В работе','Статус маршрутного паспорта','2021-07-20 17:38:42'),(6,'Выполнен','Статус маршрутного паспорта','2021-07-20 17:38:42'),(7,'Заморожен','Статус маршрутного паспорта','2021-07-20 17:38:42'),(8,'В рабочем состоянии','Статус оборудования','2021-07-20 17:38:42'),(9,'На ремонте','Статус оборудования','2021-07-20 17:38:42'),(10,'Проводится тех обслуживание','Статус оборудования','2021-07-20 17:38:42'),(11,'Списан','Статус оборудования','2021-07-20 17:38:42'),(12,'Работоспособно','Статус рабочего места','2021-07-20 17:38:42'),(13,'Реконструкция','Статус рабочего места','2021-07-20 17:38:42'),(14,'Закрыто','Статус рабочего места','2021-07-20 17:38:42'),(15,'В работе','Статус инструмента','2021-07-20 17:38:42'),(16,'На складе','Статус инструмента','2021-07-20 17:38:42'),(17,'Списан','Статус инструмента','2021-07-20 17:38:42');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech_op`
--

DROP TABLE IF EXISTS `tech_op`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tech_op` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Название',
  `estd_id` bigint unsigned NOT NULL COMMENT 'Ссылка на технологическую документацию',
  `namber` int unsigned DEFAULT NULL COMMENT 'порядковый номер тех операции',
  `workplace_id` bigint unsigned NOT NULL COMMENT 'На каком рабочем месте происходит',
  `previous_id` bigint unsigned DEFAULT NULL COMMENT 'предыдущая тех операция',
  `next_id` bigint unsigned DEFAULT NULL COMMENT 'следующая тех операция',
  `time_op` time DEFAULT NULL COMMENT 'время на прохождение тех операции',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tech_op_estd_fk` (`estd_id`),
  KEY `tech_op_workplace_fk` (`workplace_id`),
  CONSTRAINT `tech_op_estd_fk` FOREIGN KEY (`estd_id`) REFERENCES `estd` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `tech_op_workplace_fk` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='технологические операции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech_op`
--

LOCK TABLES `tech_op` WRITE;
/*!40000 ALTER TABLE `tech_op` DISABLE KEYS */;
INSERT INTO `tech_op` VALUES (1,'1сторона',1,1,1,NULL,2,'00:10:12','2021-07-20 17:39:10','2021-07-20 17:39:10'),(2,'Проверка',1,2,4,1,3,'00:10:12','2021-07-20 17:39:10','2021-07-20 17:39:10'),(3,'Фрезерная обработка',1,3,3,2,4,'00:10:12','2021-07-20 17:39:10','2021-07-20 17:39:10'),(4,'Проверка',1,4,4,3,5,'00:10:12','2021-07-20 17:39:10','2021-07-20 17:39:10'),(5,'2сторона',1,5,1,4,NULL,'00:10:12','2021-07-20 17:39:10','2021-07-20 17:39:10');
/*!40000 ALTER TABLE `tech_op` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'инструмент',
  `status_tool_id` bigint unsigned NOT NULL COMMENT 'статус(списан, в работе, итд.)',
  `deskription` varchar(250) NOT NULL COMMENT 'описание',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tool_status_id_fk` (`status_tool_id`),
  CONSTRAINT `tool_status_id_fk` FOREIGN KEY (`status_tool_id`) REFERENCES `status` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='инструмент';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,'SUNDVIK D10',15,'фреза D10','2021-07-20 17:38:46','2021-07-20 17:38:46'),(2,'SUNDVIK D8',15,'фреза D8','2021-07-20 17:38:46','2021-07-20 17:38:46'),(3,'SUNDVIK D6',16,'фреза D6','2021-07-20 17:38:46','2021-07-20 17:38:46'),(4,'SUNDVIK D4',16,'фреза D4','2021-07-20 17:38:46','2021-07-20 17:38:46'),(5,'SUNDVIK R02',15,'пластина R02','2021-07-20 17:38:46','2021-07-20 17:38:46'),(6,'SUNDVIK R04',15,'пластина R04','2021-07-20 17:38:46','2021-07-20 17:38:46'),(7,'SUNDVIK R06',16,'пластина R06','2021-07-20 17:38:46','2021-07-20 17:38:46'),(8,'SUNDVIK R08',16,'пластина R08','2021-07-20 17:38:46','2021-07-20 17:38:46');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_workplace`
--

DROP TABLE IF EXISTS `tool_workplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_workplace` (
  `workplace_id` bigint unsigned NOT NULL COMMENT 'Ссылка на рабочего',
  `tool_id` bigint unsigned NOT NULL COMMENT 'Ссылка на аттестацию',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`tool_id`,`workplace_id`) COMMENT 'Составной первичный ключ',
  KEY `tool_workplace_workplace_id_fk` (`workplace_id`),
  CONSTRAINT `tool_workplace_tool_id_fk` FOREIGN KEY (`tool_id`) REFERENCES `tool` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `tool_workplace_workplace_id_fk` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='где находится инструмент';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_workplace`
--

LOCK TABLES `tool_workplace` WRITE;
/*!40000 ALTER TABLE `tool_workplace` DISABLE KEYS */;
INSERT INTO `tool_workplace` VALUES (1,1,'2021-07-20 17:38:48'),(2,2,'2021-07-20 17:38:48'),(9,3,'2021-07-20 17:38:48'),(3,4,'2021-07-20 17:38:48'),(9,5,'2021-07-20 17:38:48'),(9,6,'2021-07-20 17:38:48'),(9,7,'2021-07-20 17:38:48'),(9,8,'2021-07-20 17:38:48');
/*!40000 ALTER TABLE `tool_workplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `val_type`
--

DROP TABLE IF EXISTS `val_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `val_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'типы аттестации',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Аттестация для рабочего места(оборудования)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `val_type`
--

LOCK TABLES `val_type` WRITE;
/*!40000 ALTER TABLE `val_type` DISABLE KEYS */;
INSERT INTO `val_type` VALUES (1,'Аттестован на работу','2021-07-20 17:38:49','2021-07-20 17:38:49'),(2,'Аттестован на наладку','2021-07-20 17:38:49','2021-07-20 17:38:49'),(3,'Аттестован на написание программ','2021-07-20 17:38:49','2021-07-20 17:38:49'),(4,'Аттестован на тех обслуживание','2021-07-20 17:38:49','2021-07-20 17:38:49'),(5,'Аттестация провалена','2021-07-20 17:38:49','2021-07-20 17:38:49');
/*!40000 ALTER TABLE `val_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validation`
--

DROP TABLE IF EXISTS `validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `val_type_id` bigint unsigned NOT NULL COMMENT 'типы аттестации',
  `workplace_id` bigint unsigned NOT NULL COMMENT 'Рабочее место',
  `worker_val_id` bigint unsigned NOT NULL COMMENT 'кто проводил аттестацию',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `validation_val_type_fk` (`val_type_id`),
  KEY `validation_workplace_id_fk` (`workplace_id`),
  KEY `validation_worker_val_id_fk` (`worker_val_id`),
  CONSTRAINT `validation_val_type_fk` FOREIGN KEY (`val_type_id`) REFERENCES `val_type` (`id`),
  CONSTRAINT `validation_worker_val_id_fk` FOREIGN KEY (`worker_val_id`) REFERENCES `workers` (`id`),
  CONSTRAINT `validation_workplace_id_fk` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Аттестация для рабочего места(оборудования)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validation`
--

LOCK TABLES `validation` WRITE;
/*!40000 ALTER TABLE `validation` DISABLE KEYS */;
INSERT INTO `validation` VALUES (1,1,1,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(2,1,2,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(3,1,3,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(4,1,4,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(5,1,5,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(6,1,6,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(7,1,7,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(8,1,8,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(9,2,1,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(10,2,2,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(11,2,3,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(12,2,4,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(13,2,5,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(14,2,6,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(15,2,7,2,'2021-07-20 17:38:50','2021-07-20 17:38:50'),(16,2,8,2,'2021-07-20 17:38:50','2021-07-20 17:38:50');
/*!40000 ALTER TABLE `validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `work_working`
--

DROP TABLE IF EXISTS `work_working`;
/*!50001 DROP VIEW IF EXISTS `work_working`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `work_working` (
  `id` tinyint NOT NULL,
  `CONCAT(last_name, ' ', first_name, ' ', patronymic)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worker_post`
--

DROP TABLE IF EXISTS `worker_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_post` (
  `worker_id` bigint unsigned NOT NULL COMMENT 'Ссылка на рабочего',
  `post_id` bigint unsigned NOT NULL COMMENT 'Ссылка на должность',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`worker_id`,`post_id`) COMMENT 'Составной первичный ключ',
  KEY `worker_post_post_id_fk` (`post_id`),
  CONSTRAINT `worker_post_post_id_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `worker_post_worker_id_fk` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Совмещение рабочим должностей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_post`
--

LOCK TABLES `worker_post` WRITE;
/*!40000 ALTER TABLE `worker_post` DISABLE KEYS */;
INSERT INTO `worker_post` VALUES (1,1,'2021-07-20 17:38:44'),(2,2,'2021-07-20 17:38:44'),(3,3,'2021-07-20 17:38:44'),(4,4,'2021-07-20 17:38:44'),(5,7,'2021-07-20 17:38:44'),(5,10,'2021-07-20 17:38:44'),(5,11,'2021-07-20 17:38:44'),(6,5,'2021-07-20 17:38:44'),(7,6,'2021-07-20 17:38:44'),(8,8,'2021-07-20 17:38:44'),(9,9,'2021-07-20 17:38:44'),(10,12,'2021-07-20 17:38:44'),(11,13,'2021-07-20 17:38:44'),(12,6,'2021-07-20 17:38:44'),(13,6,'2021-07-20 17:38:44'),(14,9,'2021-07-20 17:38:44'),(15,7,'2021-07-20 17:38:44'),(16,7,'2021-07-20 17:38:44'),(18,7,'2021-07-20 17:38:44'),(19,7,'2021-07-20 17:38:44'),(20,7,'2021-07-20 17:38:44');
/*!40000 ALTER TABLE `worker_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_validation`
--

DROP TABLE IF EXISTS `worker_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_validation` (
  `worker_id` bigint unsigned NOT NULL COMMENT 'Ссылка на рабочего',
  `validation_id` bigint unsigned NOT NULL COMMENT 'Ссылка на аттестацию',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`worker_id`,`validation_id`) COMMENT 'Составной первичный ключ',
  KEY `worker_validation_validation_fk` (`validation_id`),
  CONSTRAINT `worker_validation_validation_fk` FOREIGN KEY (`validation_id`) REFERENCES `validation` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `worker_validation_workers_id_fk` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='рабочий может быть аттестован на многое оборудование и наоборот';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_validation`
--

LOCK TABLES `worker_validation` WRITE;
/*!40000 ALTER TABLE `worker_validation` DISABLE KEYS */;
INSERT INTO `worker_validation` VALUES (5,1,'2021-07-20 17:38:51'),(5,2,'2021-07-20 17:38:51'),(5,4,'2021-07-20 17:38:51'),(15,3,'2021-07-20 17:38:51'),(16,5,'2021-07-20 17:38:51'),(18,6,'2021-07-20 17:38:51'),(19,7,'2021-07-20 17:38:51'),(20,8,'2021-07-20 17:38:51');
/*!40000 ALTER TABLE `worker_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL COMMENT 'Имя',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия',
  `patronymic` varchar(100) NOT NULL COMMENT 'Отчество',
  `gender` varchar(1) NOT NULL COMMENT 'Пол',
  `adress` varchar(100) NOT NULL COMMENT 'адрес',
  `prize` varchar(250) NOT NULL COMMENT 'Премия ежемесечная',
  `experience` int unsigned NOT NULL COMMENT 'Стаж до начала работы',
  `status_id` bigint unsigned NOT NULL COMMENT 'Ссылка на таблицу Статус',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `workers_status_id_fk` (`status_id`),
  CONSTRAINT `workers_status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Рабочие';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'Алексей','Алексеев','Алексеевич','m','Москва','10000',3,1,'1978-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(2,'Михаил','Михайлов','Михайлович','m','Серпухов','20000',5,2,'1995-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(3,'Сергей','Сергеев','Сергеевич','m','Тула','15000',6,3,'2006-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(4,'Петр','Петров','Петрович','m','Москва','11000',3,4,'1956-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(5,'Андрей','Шубин','Сергеевич','m','Москва','10000',6,1,'1989-07-01','2021-07-20 17:38:42','2021-07-20 17:38:42'),(6,'Андрей','Андреев','Андреевич','m','Москва','18000',8,2,'1999-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(7,'Игорь','Игоров','Игоревич','m','Москва','11000',9,3,'1995-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(8,'Василий','Васильев','Васильевич','m','Москва','10040',5,4,'1990-11-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(9,'Игнат','Игнатьев','Игнатьевич','m','Благовещенск','10200',2,1,'1990-11-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(10,'Алексей','Алексеев','Алексеевич','m','Москва','16000',4,2,'1990-06-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(11,'Ирина','Иринова','Ириновна','f','Москва','11000',4,3,'1990-05-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(12,'Лена','Ленина','Ленина','f','Ростов','17000',2,4,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(13,'Ксения','Ксенова','Ксеньевна','f','Москва','16000',1,1,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(14,'Виктория','Виктор','Викториевна','f','Москва','12000',14,2,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(15,'Светлана','Светланова','Светлановна','f','Москва','18000',2,3,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(16,'Дарья','Дашина','Дарьевна','f','Екатеринбург','12000',5,4,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(17,'Лидия','Лидова','Лидиевна','f','Москва','12300',3,1,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(18,'Ольга','Ольгина','Ольгиевна','f','Москва','14300',4,2,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(19,'Наталия','Наталь','Натальевна','f','Москва','11000',2,3,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42'),(20,'Василиса','Васина','Василисовна','f','Москва','16000',6,4,'1990-10-05','2021-07-20 17:38:42','2021-07-20 17:38:42');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplace`
--

DROP TABLE IF EXISTS `workplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workplace` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT 'Рабочее место',
  `those_service` datetime DEFAULT NULL COMMENT 'дата проверки',
  `status_workplace_id` bigint unsigned NOT NULL COMMENT 'Статус Рабочего места(ремонт, тех обсл. итд.)',
  `branch_id` bigint unsigned NOT NULL COMMENT 'Отдел, где находится рабочее место',
  `equipment_id` bigint unsigned NOT NULL COMMENT 'Оборудование',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `workplace_status_fk` (`status_workplace_id`),
  KEY `workplace_equipment_fk` (`equipment_id`),
  KEY `workplace_branch_fk` (`branch_id`),
  CONSTRAINT `workplace_branch_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workplace_equipment_fk` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `workplace_status_fk` FOREIGN KEY (`status_workplace_id`) REFERENCES `status` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Рабочее место';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace`
--

LOCK TABLES `workplace` WRITE;
/*!40000 ALTER TABLE `workplace` DISABLE KEYS */;
INSERT INTO `workplace` VALUES (1,'токарный участок 1','2025-10-05 00:00:00',12,5,1,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(2,'токарный участок 2','2025-10-05 00:00:00',12,5,2,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(3,'фрезерный участок','2025-10-05 00:00:00',12,6,3,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(4,'ОТК KGM','2025-12-30 00:00:00',12,1,4,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(5,'ОТК VIM','2025-12-30 00:00:00',13,1,5,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(6,'Слесарка ','2025-12-30 00:00:00',12,3,6,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(7,'Шлифовка','2025-12-30 00:00:00',12,4,7,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(8,'фрезерная группа','2025-12-30 00:00:00',12,6,8,'2021-07-20 17:38:47','2021-07-20 17:38:47'),(9,'Склад','2025-12-30 00:00:00',12,7,9,'2021-07-20 17:38:47','2021-07-20 17:38:47');
/*!40000 ALTER TABLE `workplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'TREK'
--
/*!50003 DROP PROCEDURE IF EXISTS `detail_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`angrew`@`localhost` PROCEDURE `detail_search`(IN value VARCHAR(50))
BEGIN
DECLARE i VARCHAR(50);

SET i = value;
SELECT 
mp.id,
mp.namber_mp AS 'Номер МП',
mp.namber_part AS 'Номер партии',
specification_id AS 'Номер приказа',
(SELECT name FROM estd WHERE id = mp.estd_id) AS 'ЕСТД',
namber_detail AS 'Дет в партии',
tech_op.name AS 'Тех ОП',
(SELECT CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers WHERE id = mp_tech_op.workers_id ) AS 'Рабочий',
(SELECT name FROM status WHERE id = mp.status_id) AS 'Статус',
mp.created_at,
mp.updated_at
FROM mp
JOIN mp_tech_op 
ON id = mp_tech_op.mp_id
JOIN tech_op
ON mp_tech_op.tech_op_id = tech_op.id 
WHERE (SELECT name FROM status WHERE id = mp.status_id) = i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mp_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`angrew`@`localhost` PROCEDURE `mp_search`(IN value INT)
BEGIN
DECLARE i INT;

SET i = value;
SELECT 
mp.id,
mp.namber_mp AS 'Номер МП',
mp.namber_part AS 'Номер партии',
specification_id AS 'Номер приказа',
(SELECT name FROM estd WHERE id = mp.estd_id) AS 'ЕСТД',
namber_detail AS 'Дет в партии',
tech_op.name AS 'Тех ОП',
tech_op.namber AS 'Порядок выполнения ТО',
(SELECT CONCAT(last_name, ' ', first_name, ' ', patronymic) FROM workers WHERE id = mp_tech_op.workers_id ) AS 'Рабочий',
(SELECT name FROM status WHERE id = mp.status_id) AS 'Статус',
mp.created_at,
mp.updated_at
FROM mp
JOIN mp_tech_op 
ON id = mp_tech_op.mp_id
JOIN tech_op
ON mp_tech_op.tech_op_id = tech_op.id 
WHERE namber_mp = i
ORDER BY tech_op.namber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `in_work`
--

/*!50001 DROP TABLE IF EXISTS `in_work`*/;
/*!50001 DROP VIEW IF EXISTS `in_work`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`angrew`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `in_work` AS select `mp`.`id` AS `id`,`mp`.`namber_mp` AS `Номер МП`,`mp`.`namber_part` AS `Номер партии`,`mp`.`specification_id` AS `Номер приказа`,(select `estd`.`name` from `estd` where (`estd`.`id` = `mp`.`estd_id`)) AS `ЕСТД`,`mp`.`namber_detail` AS `Дет в партии`,`tech_op`.`name` AS `Тех ОП`,(select concat(`workers`.`last_name`,' ',`workers`.`first_name`,' ',`workers`.`patronymic`) from `workers` where (`workers`.`id` = `mp_tech_op`.`workers_id`)) AS `Рабочий`,(select `status`.`name` from `status` where (`status`.`id` = `mp`.`status_id`)) AS `Статус`,`mp`.`created_at` AS `created_at`,`mp`.`updated_at` AS `updated_at` from ((`mp` join `mp_tech_op` on((`mp`.`id` = `mp_tech_op`.`mp_id`))) join `tech_op` on((`mp_tech_op`.`tech_op_id` = `tech_op`.`id`))) where ((select `status`.`name` from `status` where (`status`.`id` = `mp`.`status_id`)) = 'В работе') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salary`
--

/*!50001 DROP TABLE IF EXISTS `salary`*/;
/*!50001 DROP VIEW IF EXISTS `salary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`angrew`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salary` AS select concat(`workers`.`last_name`,' ',`workers`.`first_name`,' ',`workers`.`patronymic`) AS `Рабочий`,(`post`.`salary` + `workers`.`prize`) AS `Зарплата сотрудника` from ((`workers` join `worker_post` on((`workers`.`id` = `worker_post`.`worker_id`))) join `post` on((`worker_post`.`post_id` = `post`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `work_working`
--

/*!50001 DROP TABLE IF EXISTS `work_working`*/;
/*!50001 DROP VIEW IF EXISTS `work_working`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`angrew`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `work_working` AS select `workers`.`id` AS `id`,concat(`workers`.`last_name`,' ',`workers`.`first_name`,' ',`workers`.`patronymic`) AS `CONCAT(last_name, ' ', first_name, ' ', patronymic)` from (`workers` join `status` on((`workers`.`status_id` = `status`.`id`))) where (`status`.`name` = 'Работает') */;
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

-- Dump completed on 2021-07-20 19:02:46
