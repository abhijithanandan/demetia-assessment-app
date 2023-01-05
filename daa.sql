-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: daa
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Q_choice`
--

DROP TABLE IF EXISTS `Q_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Q_choice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `value` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Q_choice_question_id_54a7345e_fk_Q_question_id` (`question_id`),
  CONSTRAINT `Q_choice_question_id_54a7345e_fk_Q_question_id` FOREIGN KEY (`question_id`) REFERENCES `Q_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Q_choice`
--

LOCK TABLES `Q_choice` WRITE;
/*!40000 ALTER TABLE `Q_choice` DISABLE KEYS */;
INSERT INTO `Q_choice` VALUES (1,'I\'ve been sleeping more than usual',1,0,1),(2,'I\'ve been sleeping less than usual',2,-1,1),(3,'I\'ve haven\'t noticed any changes',3,1,1),(4,'I have a larger appetite than usual',1,0,2),(5,'I have a smaller appetite than usual',2,-1,2),(6,'I\'ve haven\'t noticed any changes',3,1,2),(7,'Not really',1,1,3),(8,'Maybe a little',2,0,3),(9,'Somewhat',3,0,3),(10,'Quite a bit',4,-1,3),(11,'Strongly disagree',1,1,4),(12,'Disagree',1,1,4),(13,'Neutral',3,0,4),(14,'Agree',4,-1,4),(15,'Completely untrue',1,1,5),(16,'Somewhat untrue',2,0,5),(17,'I am unsure',3,0,5),(18,'Somewhat true',4,-1,5),(19,'Not at all',1,1,6),(20,'Hardly ever',2,1,6),(21,'Maybe sometimes',3,-1,6),(22,'Most of the time',4,-1,6),(23,'Strongly disagree',1,2,7),(24,'Disagree',2,1,7),(25,'Neutral',3,0,7),(26,'Agree',4,-1,7),(27,'Completely untrue',1,1,8),(28,'Somewhat untrue',2,0,8),(29,'I am unsure',3,0,8),(30,'Somewhat true',4,-1,8),(31,'Never',1,1,9),(32,'Not very often',2,0,9),(33,'Maybe, sometimes',3,0,9),(34,'A lot of the time',4,-1,9),(35,'No, Never',1,1,10),(36,'Rarely',2,0,10),(37,'Yes, sometimes',3,0,10),(38,'Yes, often',4,-1,10);
/*!40000 ALTER TABLE `Q_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Q_question`
--

DROP TABLE IF EXISTS `Q_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Q_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Q_question`
--

LOCK TABLES `Q_question` WRITE;
/*!40000 ALTER TABLE `Q_question` DISABLE KEYS */;
INSERT INTO `Q_question` VALUES (1,'Can you tell us about your sleep over the last few weeks?'),(2,'How has your appetite been over the last few weeks?'),(3,'Have you been less active than usual?'),(4,'I\'m not interested in doing things I used to enjoy before?'),(5,'I feel tired and it takes me a lot of effort to do even the smallest of things'),(6,'I find it hard to concentrate on activites, like reading or watching TV'),(7,'I feel that I\'m not good enough'),(8,'I tend to have some negative perspective of things'),(9,'I feel nervous or anxious'),(10,'Do you think depression hinders your ability to work, be with people, or take care of yourself?');
/*!40000 ALTER TABLE `Q_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add question',7,'add_question'),(26,'Can change question',7,'change_question'),(27,'Can delete question',7,'delete_question'),(28,'Can view question',7,'view_question'),(29,'Can add choice',8,'add_choice'),(30,'Can change choice',8,'change_choice'),(31,'Can delete choice',8,'delete_choice'),(32,'Can view choice',8,'view_choice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$7efpCDxnbLHwfX6trNP8Ey$us6A+LMFgU074q7Mx5j4NCQFIII+zWFl8oerJn41b8E=','2023-01-05 09:25:00.520272',1,'abhijith','','','anandakrishnanabhijith@gmail.com',1,1,'2023-01-05 09:24:32.373737');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-05 09:25:39.954051','1','Can you tell us about your sleep over the last few weeks?',1,'[{\"added\": {}}]',7,1),(2,'2023-01-05 09:25:58.173146','2','How has your appetite been over the last few weeks?',1,'[{\"added\": {}}]',7,1),(3,'2023-01-05 09:49:43.138529','1','I\'ve been sleeping more than usual',1,'[{\"added\": {}}]',8,1),(4,'2023-01-05 09:50:10.019373','2','I\'ve been sleeping less than usual',1,'[{\"added\": {}}]',8,1),(5,'2023-01-05 09:50:41.253430','3','I\'ve haven\'t noticed any changes',1,'[{\"added\": {}}]',8,1),(6,'2023-01-05 09:52:56.830328','4','I have a larger appetite than usual',1,'[{\"added\": {}}]',8,1),(7,'2023-01-05 09:53:49.142744','5','I have a smaller appetite than usual',1,'[{\"added\": {}}]',8,1),(8,'2023-01-05 09:54:15.077947','6','I\'ve haven\'t noticed any changes',1,'[{\"added\": {}}]',8,1),(9,'2023-01-05 10:19:39.418023','3','Have you been less active than usual?',1,'[{\"added\": {}}]',7,1),(10,'2023-01-05 10:20:16.693505','7','Not really',1,'[{\"added\": {}}]',8,1),(11,'2023-01-05 10:20:42.924572','8','Maybe a little',1,'[{\"added\": {}}]',8,1),(12,'2023-01-05 10:21:03.194456','9','Somewhat',1,'[{\"added\": {}}]',8,1),(13,'2023-01-05 10:21:25.532766','10','Quite a bit',1,'[{\"added\": {}}]',8,1),(14,'2023-01-05 10:22:11.502007','4','I\'m not interested in doing things I used to enjoy before?',1,'[{\"added\": {}}]',7,1),(15,'2023-01-05 10:22:46.456081','11','Strongly disagree',1,'[{\"added\": {}}]',8,1),(16,'2023-01-05 10:23:00.975787','12','Disagree',1,'[{\"added\": {}}]',8,1),(17,'2023-01-05 10:23:18.846017','13','Neutral',1,'[{\"added\": {}}]',8,1),(18,'2023-01-05 10:23:40.759734','14','Agree',1,'[{\"added\": {}}]',8,1),(19,'2023-01-05 10:25:21.741565','5','I feel tired and it takes me a lot of effort to do even the smallest of things',1,'[{\"added\": {}}]',7,1),(20,'2023-01-05 10:25:48.391717','15','Completely untrue',1,'[{\"added\": {}}]',8,1),(21,'2023-01-05 10:26:12.988851','16','Somewhat untrue',1,'[{\"added\": {}}]',8,1),(22,'2023-01-05 10:26:37.776529','17','I am unsure',1,'[{\"added\": {}}]',8,1),(23,'2023-01-05 10:26:57.832594','18','Somewhat true',1,'[{\"added\": {}}]',8,1),(24,'2023-01-05 10:27:19.358554','6','I find it hard to concentrate on activites, like reading or watching TV',1,'[{\"added\": {}}]',7,1),(25,'2023-01-05 10:27:42.865295','19','Not at all',1,'[{\"added\": {}}]',8,1),(26,'2023-01-05 10:28:03.302520','20','Hardly ever',1,'[{\"added\": {}}]',8,1),(27,'2023-01-05 10:28:27.261346','21','Maybe sometimes',1,'[{\"added\": {}}]',8,1),(28,'2023-01-05 10:28:52.614052','22','Most of the time',1,'[{\"added\": {}}]',8,1),(29,'2023-01-05 10:29:13.250958','7','I feel that I\'m not good enough',1,'[{\"added\": {}}]',7,1),(30,'2023-01-05 10:29:41.081996','23','Strongly disagree',1,'[{\"added\": {}}]',8,1),(31,'2023-01-05 10:30:08.979100','24','Disagree',1,'[{\"added\": {}}]',8,1),(32,'2023-01-05 10:30:28.194085','25','Neutral',1,'[{\"added\": {}}]',8,1),(33,'2023-01-05 10:30:45.700506','26','Agree',1,'[{\"added\": {}}]',8,1),(34,'2023-01-05 10:31:02.728308','8','I tend to have some negative perspective of things',1,'[{\"added\": {}}]',7,1),(35,'2023-01-05 10:31:30.047494','27','Completely untrue',1,'[{\"added\": {}}]',8,1),(36,'2023-01-05 10:31:46.838073','28','Somewhat untrue',1,'[{\"added\": {}}]',8,1),(37,'2023-01-05 10:32:06.432095','29','I am unsure',1,'[{\"added\": {}}]',8,1),(38,'2023-01-05 10:32:23.937161','30','Somewhat true',1,'[{\"added\": {}}]',8,1),(39,'2023-01-05 10:32:44.540771','9','I feel nervous or anxious',1,'[{\"added\": {}}]',7,1),(40,'2023-01-05 10:34:05.444325','31','Never',1,'[{\"added\": {}}]',8,1),(41,'2023-01-05 10:34:28.972825','32','Not very often',1,'[{\"added\": {}}]',8,1),(42,'2023-01-05 10:35:11.318040','33','Maybe, sometimes',1,'[{\"added\": {}}]',8,1),(43,'2023-01-05 10:35:22.010149','34','A lot of the time',1,'[{\"added\": {}}]',8,1),(44,'2023-01-05 10:35:38.402011','10','Do you think depression hinders your ability to work, be with people, or take care of yourself?',1,'[{\"added\": {}}]',7,1),(45,'2023-01-05 10:36:07.701729','35','No, Never',1,'[{\"added\": {}}]',8,1),(46,'2023-01-05 10:36:22.232746','36','Rarely',1,'[{\"added\": {}}]',8,1),(47,'2023-01-05 10:36:40.278499','37','Yes, sometimes',1,'[{\"added\": {}}]',8,1),(48,'2023-01-05 10:36:57.574799','38','Yes, often',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'Q','choice'),(7,'Q','question'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-05 09:16:43.478182'),(2,'auth','0001_initial','2023-01-05 09:16:51.934119'),(3,'admin','0001_initial','2023-01-05 09:16:55.317593'),(4,'admin','0002_logentry_remove_auto_add','2023-01-05 09:16:55.372226'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-05 09:16:55.425771'),(6,'contenttypes','0002_remove_content_type_name','2023-01-05 09:16:56.254060'),(7,'auth','0002_alter_permission_name_max_length','2023-01-05 09:16:56.932830'),(8,'auth','0003_alter_user_email_max_length','2023-01-05 09:16:57.690021'),(9,'auth','0004_alter_user_username_opts','2023-01-05 09:16:57.746172'),(10,'auth','0005_alter_user_last_login_null','2023-01-05 09:16:58.238850'),(11,'auth','0006_require_contenttypes_0002','2023-01-05 09:16:58.271395'),(12,'auth','0007_alter_validators_add_error_messages','2023-01-05 09:16:58.327651'),(13,'auth','0008_alter_user_username_max_length','2023-01-05 09:16:58.449138'),(14,'auth','0009_alter_user_last_name_max_length','2023-01-05 09:16:58.603633'),(15,'auth','0010_alter_group_name_max_length','2023-01-05 09:16:59.372087'),(16,'auth','0011_update_proxy_permissions','2023-01-05 09:16:59.419491'),(17,'auth','0012_alter_user_first_name_max_length','2023-01-05 09:16:59.528666'),(18,'sessions','0001_initial','2023-01-05 09:16:59.998070'),(19,'Q','0001_initial','2023-01-05 09:17:48.510835'),(20,'Q','0002_alter_choice_value','2023-01-05 09:52:30.760908');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('h8tka5z29vzsnbqjo5h6pvoouvwgwpzn','.eJxVjMsOwiAURP-FtSFQlIdL934DmQtXqRpISrsy_rtt0oXuJnPOzFtELHOJS-cpjlmchRaH346Qnlw3kB-o9yZTq_M0ktwUudMury3z67K7fwcFvaxrh5R9SI7YW4c8qCGsKSBoMsbnRMxWuRN0grXAjQwDdGTltQcZLT5fBUo46g:1pDMUe:JO8pUdKkmQK9EtHubhBBrvbfXbkNwKo9V9D25EuB1JI','2023-01-19 09:25:00.621390');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-05 16:12:50
