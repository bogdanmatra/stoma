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
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (22,'da da','2014-03-24 12:24:18','2014-03-24 12:24:18',8,173),(24,'bla','2014-03-24 12:26:36','2014-03-24 12:26:36',8,173),(30,'DA','2014-03-24 13:21:30','2014-03-24 13:21:30',8,185),(194,'answer','2014-04-02 09:21:35','2014-04-02 09:21:35',7,187),(196,'raspuns','2014-04-02 09:23:53','2014-04-02 09:23:53',7,363);
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
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (237,'Alt articol','mai  tare',NULL,NULL,NULL);
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
  CONSTRAINT `fk_c_events` FOREIGN KEY (`id_event`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c_article` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c_news` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (428,'frumos',NULL,NULL,7,NULL,30,NULL),(441,'si mai frumos',NULL,NULL,7,NULL,30,NULL),(478,'da','2014-04-04 07:22:31','2014-04-04 07:22:31',7,NULL,30,NULL),(505,'fsdfsdf','2014-04-04 07:53:27','2014-04-04 07:53:27',7,NULL,30,NULL),(518,'user comments again','2014-04-04 08:32:37','2014-04-04 08:32:37',8,NULL,30,NULL),(535,'gigi','2014-04-04 08:51:40','2014-04-04 08:51:40',8,NULL,30,NULL),(536,'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff','2014-04-04 08:57:57','2014-04-04 08:57:57',8,NULL,30,NULL),(537,'   bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ','2014-04-04 08:58:22','2014-04-04 08:58:22',8,NULL,30,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (53,'Aparatura dentara',NULL,NULL,NULL,'ro','st'),(54,'Pasta de dinti',NULL,NULL,NULL,'ro','st'),(55,'Oftalmologie',NULL,NULL,NULL,'ro','ge'),(131,'Alt domeniu',NULL,NULL,NULL,'ro','ge'),(132,'Alt domeniu 2',NULL,NULL,NULL,'ro','ge'),(133,'Domeniu englez',NULL,NULL,NULL,'en','st'),(134,'Alt domeniu englez',NULL,NULL,NULL,'en','ge'),(135,'Alt domeniu englez 2',NULL,NULL,NULL,'en','ge');
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
  CONSTRAINT `fk_da_article` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_da_domain` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains_articles`
--

LOCK TABLES `domains_articles` WRITE;
/*!40000 ALTER TABLE `domains_articles` DISABLE KEYS */;
INSERT INTO `domains_articles` VALUES (135,237);
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (30,'Super news','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.',NULL,NULL,1),(49,'news 5','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(50,'news 6','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(51,'news 7','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(53,'news 7','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(54,'news 7 da da da dad a da da da','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(55,' dada da da da dad ad ad da da da da lomg title lomg title lomg title lomg title','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolv',NULL,NULL,NULL),(56,'news 7 da da da da da dad a','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(57,' dadad ada  da da da da da da da da','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(58,'news 7 dad ad ad ','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(59,' da da da da da da dad  a da dada ','cool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool coolcool cool cool cool cool cool coolcool cool cool',NULL,NULL,NULL),(62,'news 7 dad ad ad ','da',NULL,NULL,NULL);
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
  CONSTRAINT `fk_nd_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nd_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_domains`
--

LOCK TABLES `news_domains` WRITE;
/*!40000 ALTER TABLE `news_domains` DISABLE KEYS */;
INSERT INTO `news_domains` VALUES (30,53),(49,53),(50,53),(51,53),(53,53),(54,53),(55,53),(56,53),(57,53),(58,53),(59,53),(30,54);
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
  CONSTRAINT `fk_p_event` FOREIGN KEY (`id_event`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_p_news` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_p_article` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (262,'default.jpg',NULL,NULL,30,0),(299,'default.jpg',NULL,NULL,30,0),(300,'default.jpg',NULL,NULL,30,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (173,'noua intrebare','2014-03-24 09:40:43','2014-03-24 09:40:43',7),(185,'topic man','2014-03-24 12:34:36','2014-03-24 12:34:36',8),(187,'some new Q','2014-03-24 12:44:41','2014-03-24 12:44:41',7),(363,'Bla','2014-04-02 09:21:56','2014-04-02 09:21:56',7),(366,'bla1','2014-04-03 12:53:24','2014-04-03 12:53:24',7),(367,'bla2\r\n','2014-04-03 12:53:35','2014-04-03 12:53:35',7),(368,'bla3\r\n','2014-04-03 12:53:43','2014-04-03 12:53:43',7),(369,'bla4\r\n','2014-04-03 12:53:49','2014-04-03 12:53:49',7),(370,'bla5\r\n','2014-04-03 12:54:00','2014-04-03 12:54:00',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'superuser','2494f0dc95e9b6c92a43651d060042d361f4a0603ffd2ef3e53809415b83b5ea','bogdanmatra@gmail.com',NULL,NULL,'Bogdan','Matragociu'),(8,'user','a5700387a0b64f00ff5fe28ee22eb088c2f684a7ad9645d231bdac76b9456c7f','anna.dumitrache@gmail.com',NULL,NULL,'Ana','Dumitrache');
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
INSERT INTO `users_roles` VALUES (7,1),(7,2),(8,2);
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

-- Dump completed on 2014-04-04 17:00:57
