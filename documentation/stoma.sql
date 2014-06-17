CREATE DATABASE  IF NOT EXISTS `licenta` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `licenta`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: licenta
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(400) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `id_user` int(10) NOT NULL,
  `id_question` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_a_user_idx` (`id_user`),
  KEY `fk_a_question` (`id_question`),
  CONSTRAINT `fk_a_question` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_a_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (194,'answer','2014-04-02 09:21:35','2014-04-02 09:21:35',7,187),(196,'raspuns','2014-04-02 09:23:53','2014-04-02 09:23:53',7,363);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `viewed` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (237,'Alt articol','mai  tare',NULL,NULL,NULL),(241,'dd','dd','2014-04-11 08:26:22','2014-04-11 08:26:22',NULL),(242,'gg','gg','2014-04-11 08:27:13','2014-04-11 08:27:13',NULL),(243,'www','www','2014-04-11 08:28:12','2014-04-17 15:01:26',2);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(400) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `id_user` int(20) NOT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `id_news` bigint(20) DEFAULT NULL,
  `id_event` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_c_user_idx` (`id_user`),
  KEY `fk_c_news_idx` (`id_news`),
  KEY `fk_c_article_idx` (`id_article`),
  KEY `fk_c_events_idx` (`id_event`),
  CONSTRAINT `fk_c_article` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c_events` FOREIGN KEY (`id_event`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c_news` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=773 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (428,'frumos',NULL,NULL,7,NULL,30,NULL),(441,'si mai frumos',NULL,NULL,7,NULL,30,NULL),(478,'da','2014-04-04 07:22:31','2014-04-04 07:22:31',7,NULL,30,NULL),(505,'fsdfsdf','2014-04-04 07:53:27','2014-04-04 07:53:27',7,NULL,30,NULL),(614,'comment baby','2014-04-08 12:23:42','2014-04-08 12:23:42',7,NULL,101,NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `details` longtext,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `locale` varchar(2) NOT NULL,
  `dom_medical` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (53,'Aparatura dentara',NULL,NULL,NULL,'ro','st'),(55,'Oftalmologie',NULL,NULL,NULL,'ro','ge'),(133,'Domeniu englez',NULL,NULL,NULL,'en','st'),(134,'Alt domeniu englez',NULL,NULL,NULL,'en','ge'),(270,'Domeniu cu tooltip','Detalii','2014-04-17 12:28:42','2014-04-17 12:28:42','ro','st'),(272,'domeniu','domeniu cu tooltip','2014-04-17 12:30:25','2014-04-17 12:30:25','en','st'),(287,'cool','cool\r\n','2014-04-17 15:09:19','2014-04-17 15:09:19','ro','st'),(292,'coolsd','coolsd','2014-04-17 15:10:44','2014-04-17 15:10:44','ro','st'),(297,'dda','da','2014-04-17 15:11:40','2014-04-17 15:11:40','ro','st');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains_articles`
--

DROP TABLE IF EXISTS `domains_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains_articles` (
  `domain_id` int(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`domain_id`,`article_id`),
  KEY `fk_da_article_idx` (`article_id`),
  CONSTRAINT `fk_da_domain` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_da_article` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains_articles`
--

LOCK TABLES `domains_articles` WRITE;
/*!40000 ALTER TABLE `domains_articles` DISABLE KEYS */;
INSERT INTO `domains_articles` VALUES (133,241),(133,242),(133,243);
/*!40000 ALTER TABLE `domains_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `details` longtext,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `viewed` bigint(20) DEFAULT NULL,
  `locale` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (84,'event','enet details',NULL,NULL,NULL,'en');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `viewed` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (30,'Super news','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.',NULL,'2014-04-17 15:07:23',57),(50,'news 6','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,'2014-04-17 14:51:26',11),(51,'news 7','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,'2014-04-17 15:04:52',15),(53,'news 7','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(54,'news 7 da da da dad a da da da','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(55,' dada da da da dad ad ad da da da da lomg title lomg title lomg title lomg title','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolv',NULL,NULL,NULL),(56,'news 7 da da da da da dad a','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(57,' dadad ada  da da da da da da da da','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(58,'news 7 dad ad ad ','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(59,' da da da da da da dad  a da dada ','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(62,'news 7 dad ad ad ','da',NULL,NULL,NULL),(101,'io man','io man','2014-04-08 12:19:59','2014-04-17 12:26:58',1),(151,'da','da','2014-04-09 07:27:36','2014-04-09 07:27:36',NULL),(152,'da','da','2014-04-09 07:27:51','2014-04-09 07:27:51',NULL),(186,'qwqw','qwqw','2014-04-09 09:03:04','2014-04-09 09:03:04',NULL),(258,'bla','bla','2014-04-17 09:22:48','2014-04-17 13:53:10',59);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_domains`
--

DROP TABLE IF EXISTS `news_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_domains` (
  `news_id` bigint(20) NOT NULL,
  `domain_id` int(20) NOT NULL,
  PRIMARY KEY (`news_id`,`domain_id`),
  KEY `fk_ed_domain_idx` (`domain_id`),
  CONSTRAINT `fk_nd_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nd_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_domains`
--

LOCK TABLES `news_domains` WRITE;
/*!40000 ALTER TABLE `news_domains` DISABLE KEYS */;
INSERT INTO `news_domains` VALUES (30,53),(50,53),(51,53),(53,53),(54,53),(55,53),(56,53),(57,53),(58,53),(59,53),(151,133),(152,133),(186,133),(258,133),(101,134);
/*!40000 ALTER TABLE `news_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(45) NOT NULL,
  `id_event` bigint(20) DEFAULT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `id_news` bigint(20) DEFAULT NULL,
  `primar` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_p_event_idx` (`id_event`),
  KEY `fk_p_article_idx` (`id_article`),
  KEY `fk_p_news_idx` (`id_news`),
  CONSTRAINT `fk_p_article` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_p_event` FOREIGN KEY (`id_event`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_p_news` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=630 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (262,'default.jpg',NULL,NULL,30,0),(471,'default.jpg',NULL,NULL,30,0),(472,'default.jpg',NULL,NULL,30,0);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(400) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_q_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (173,'noua intrebare','2014-03-24 09:40:43','2014-03-24 09:40:43',7),(187,'some new Q','2014-03-24 12:44:41','2014-03-24 12:44:41',7),(363,'Bla','2014-04-02 09:21:56','2014-04-02 09:21:56',7),(366,'bla1','2014-04-03 12:53:24','2014-04-03 12:53:24',7),(367,'bla2\r\n','2014-04-03 12:53:35','2014-04-03 12:53:35',7),(368,'bla3\r\n','2014-04-03 12:53:43','2014-04-03 12:53:43',7),(369,'bla4\r\n','2014-04-03 12:53:49','2014-04-03 12:53:49',7),(370,'bla5\r\n','2014-04-03 12:54:00','2014-04-03 12:54:00',7);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authority` varchar(45) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN',NULL,NULL),(2,'ROLE_USER',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` char(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'superuser','2494f0dc95e9b6c92a43651d060042d361f4a0603ffd2ef3e53809415b83b5ea','bogdanmatra@gmail.com','2014-04-07 12:50:45','2014-04-07 12:50:45','Bogdan','Matragociu'),(25,'user','a5700387a0b64f00ff5fe28ee22eb088c2f684a7ad9645d231bdac76b9456c7f','anna.dumitrache@gmail.com','2014-04-11 14:06:26','2014-04-11 14:06:26','Ana','Dumitrache');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fx_role_idx` (`role_id`),
  CONSTRAINT `fk_ur_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fx_ur_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (7,1),(7,2),(25,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-18 15:49:32
