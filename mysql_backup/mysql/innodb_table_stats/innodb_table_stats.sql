-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!50606 SET @OLD_INNODB_STATS_AUTO_RECALC=@@INNODB_STATS_AUTO_RECALC */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=OFF */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `innodb_table_stats`
--

/*!40000 ALTER TABLE `innodb_table_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_table_stats` VALUES ('mysql','component','2024-01-22 12:56:29',0,1,0),('sys','sys_config','2024-01-22 12:56:44',6,1,0),('wordpress_db','wp_commentmeta','2024-01-22 14:43:09',0,1,2),('wordpress_db','wp_comments','2024-01-22 14:43:10',0,1,5),('wordpress_db','wp_links','2024-01-22 14:43:11',0,1,1),('wordpress_db','wp_options','2024-01-27 10:50:06',137,6,2),('wordpress_db','wp_postmeta','2024-01-22 14:43:15',6,1,2),('wordpress_db','wp_posts','2024-01-22 14:43:16',8,3,4),('wordpress_db','wp_term_relationships','2024-01-22 14:43:17',3,1,1),('wordpress_db','wp_term_taxonomy','2024-01-22 14:43:27',2,1,2),('wordpress_db','wp_termmeta','2024-01-22 14:43:16',0,1,2),('wordpress_db','wp_terms','2024-01-22 14:43:37',2,1,2),('wordpress_db','wp_usermeta','2024-01-22 14:43:47',19,1,2),('wordpress_db','wp_users','2024-01-22 14:43:18',0,1,3);
/*!40000 ALTER TABLE `innodb_table_stats` ENABLE KEYS */;

--
-- Dumping events for database 'mysql'
--

--
-- Dumping routines for database 'mysql'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=@OLD_INNODB_STATS_AUTO_RECALC */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-28 15:00:54
