-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: base1
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'miguel');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add cliente',7,'add_cliente'),(26,'Can change cliente',7,'change_cliente'),(27,'Can delete cliente',7,'delete_cliente'),(28,'Can view cliente',7,'view_cliente'),(29,'Can add vendedor',8,'add_vendedor'),(30,'Can change vendedor',8,'change_vendedor'),(31,'Can delete vendedor',8,'delete_vendedor'),(32,'Can view vendedor',8,'view_vendedor'),(33,'Can add dependiente',9,'add_dependiente'),(34,'Can change dependiente',9,'change_dependiente'),(35,'Can delete dependiente',9,'delete_dependiente'),(36,'Can view dependiente',9,'view_dependiente'),(37,'Can add venta',10,'add_venta'),(38,'Can change venta',10,'change_venta'),(39,'Can delete venta',10,'delete_venta'),(40,'Can view venta',10,'view_venta'),(41,'Can view all sales',10,'can_view_all_sales'),(42,'Can view all clients',7,'can_view_all_clients'),(43,'Can view all dependents',9,'can_view_all_dependents'),(44,'Can view all clientes',7,'can_view_clientes'),(45,'Can export clientes data',7,'can_export_clientes'),(46,'Can edit clientes',7,'can_edit_clientes'),(47,'Can view all vendedores',8,'can_view_vendedores'),(48,'Can edit vendedores',8,'can_edit_vendedores'),(49,'Can view all dependientes',9,'can_view_dependientes'),(50,'Can edit dependientes',9,'can_edit_dependientes'),(51,'Can view all sales',10,'view_all_sales'),(52,'Can export sales data',10,'can_export_sales'),(53,'Can edit sales',10,'can_edit_sales');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$ueeYL20L4o7GyL20kIut5J$XOqVuiK7CQ5JmSdjfE0ByT2q88YL3dU2U0ndG+RUcTI=','2024-06-03 22:52:51.076238',1,'adminpunto','','','admin@mail.com',1,1,'2024-06-03 22:50:06.010808'),(2,'pbkdf2_sha256$720000$MYaxmQnIy4VpkP9lLZMIqX$yQz8g/te7anSdLWiJ7ZCTdD86d9KhS2eWgpgTKu7ePA=','2024-06-21 20:13:50.146106',1,'miguel','','','miguel@mail.com',1,1,'2024-06-05 04:56:27.615787'),(3,'pbkdf2_sha256$720000$eXt83mlY1nz3D3n7n6DAz1$t0BVKXvydhoMnD2Tsjsh0RQbPtW+VTwysIO5NAKyvzc=',NULL,0,'juan','','','',0,1,'2024-06-05 08:49:02.399154'),(4,'pbkdf2_sha256$720000$xk41ZTvph4KqOjah28TLKq$AcrlIQgjmtZzpgXeRHsZp4ijxkWwTAvPpxzswBQEYTA=',NULL,0,'luis','','','',0,1,'2024-06-06 01:23:28.030910'),(5,'pbkdf2_sha256$720000$NLXRpQKoiUZ3Gyrc7F6MvT$optJ5/EB9ad2ZFbiFE5y6kVeCAXEDW5DLgfjCoq1W4I=','2024-06-21 05:13:17.666097',0,'Yennis','','','',1,1,'2024-06-21 00:55:44.000000'),(6,'pbkdf2_sha256$720000$wKjkv3qYZatlO34eDvK5kT$FC1x0rBQqXYwK+ukG5YDwN2PhJtHQx+7aI5AyQ20uIA=','2024-06-21 05:19:32.451219',0,'Andry','','','',1,1,'2024-06-21 00:55:47.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (2,5,28),(3,5,36),(1,5,40),(10,5,47),(7,6,25),(9,6,33),(6,6,36),(8,6,37);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-04 04:18:15.236650','1','miguel bernier',1,'[{\"added\": {}}]',7,1),(2,'2024-06-04 05:15:54.749343','1','miguel bernier',1,'[{\"added\": {}}]',8,1),(3,'2024-06-04 05:38:24.761771','2','yenis palacio',1,'[{\"added\": {}}]',8,1),(4,'2024-06-05 06:15:13.591752','1','miguel',1,'[{\"added\": {}}]',3,2),(5,'2024-06-05 08:49:03.401428','3','juan',1,'[{\"added\": {}}]',4,2),(6,'2024-06-06 00:27:44.738161','2','mifue',1,'[{\"added\": {}}, {\"added\": {\"name\": \"dependiente\", \"object\": \"akjef\"}}, {\"added\": {\"name\": \"venta\", \"object\": \"obama - mifue\"}}]',7,2),(7,'2024-06-06 01:23:29.905372','4','luis',1,'[{\"added\": {}}]',4,2),(8,'2024-06-21 01:25:27.180202','6','Andry',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,2),(9,'2024-06-21 01:25:41.226207','5','Yennis',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,2),(10,'2024-06-21 04:37:22.966325','6','Andry',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,2),(11,'2024-06-21 04:37:56.221433','6','Andry',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,2),(12,'2024-06-21 04:47:01.124671','5','Yennis',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,2),(13,'2024-06-21 04:55:26.191141','3','kkasfn',1,'[{\"added\": {}}, {\"added\": {\"name\": \"venta\", \"object\": \"obama - kkasfn\"}}]',7,6),(14,'2024-06-21 05:10:46.907376','4','miguel bernier',1,'[{\"added\": {}}, {\"added\": {\"name\": \"venta\", \"object\": \"obama - miguel bernier\"}}]',7,6);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'ventas','cliente'),(9,'ventas','dependiente'),(11,'ventas','record'),(8,'ventas','vendedor'),(10,'ventas','venta');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-03 22:44:40.881981'),(2,'auth','0001_initial','2024-06-03 22:45:09.291680'),(3,'admin','0001_initial','2024-06-03 22:45:14.554323'),(4,'admin','0002_logentry_remove_auto_add','2024-06-03 22:45:14.717213'),(5,'admin','0003_logentry_add_action_flag_choices','2024-06-03 22:45:14.805156'),(6,'contenttypes','0002_remove_content_type_name','2024-06-03 22:45:17.450400'),(7,'auth','0002_alter_permission_name_max_length','2024-06-03 22:45:20.243535'),(8,'auth','0003_alter_user_email_max_length','2024-06-03 22:45:20.976048'),(9,'auth','0004_alter_user_username_opts','2024-06-03 22:45:21.110963'),(10,'auth','0005_alter_user_last_login_null','2024-06-03 22:45:22.731885'),(11,'auth','0006_require_contenttypes_0002','2024-06-03 22:45:22.820824'),(12,'auth','0007_alter_validators_add_error_messages','2024-06-03 22:45:22.981713'),(13,'auth','0008_alter_user_username_max_length','2024-06-03 22:45:25.447636'),(14,'auth','0009_alter_user_last_name_max_length','2024-06-03 22:45:30.846706'),(15,'auth','0010_alter_group_name_max_length','2024-06-03 22:45:31.351370'),(16,'auth','0011_update_proxy_permissions','2024-06-03 22:45:31.570225'),(17,'auth','0012_alter_user_first_name_max_length','2024-06-03 22:45:33.600878'),(18,'sessions','0001_initial','2024-06-03 22:45:34.703386'),(19,'ventas','0001_initial','2024-06-03 22:45:45.445427'),(20,'ventas','0002_alter_cliente_options_alter_dependiente_options_and_more','2024-06-04 02:54:47.473406'),(21,'ventas','0003_alter_cliente_options_alter_dependiente_options_and_more','2024-06-04 20:00:16.753775'),(22,'ventas','0004_alter_venta_options_cliente_audio_cliente_imagen_and_more','2024-06-14 19:06:16.986193'),(23,'ventas','0005_cliente_observaciones_cliente_telefono_and_more','2024-06-21 03:51:16.002091'),(24,'ventas','0006_alter_cliente_options_alter_dependiente_options_and_more','2024-06-21 04:05:05.060345');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cc4wgl9l8b15pczyd8iekknyuevgpm4l','.eJxVjEEOwiAQRe_C2pBCcRhcuvcMhIFBqgaS0q6Md7dNutDtf-_9t_BhXYpfO89-SuIitDj9bhTik-sO0iPUe5Ox1WWeSO6KPGiXt5b4dT3cv4MSetnqwTIlTHFEogBoMiAQOzcgMChHdI4aLVAclWXFgwGl3SYi5QwmKfH5AvHWN-8:1sEnFk:hx5TEDuhd_Olt740FywamY1wEw_Iy4AM4oXcU9F_EZc','2024-06-19 09:48:20.899500'),('xjlwuo87azh5vl6c1zeqt8u4iaht0sfo','.eJxVjEEOwiAQRe_C2pBCcRhcuvcMhIFBqgaS0q6Md7dNutDtf-_9t_BhXYpfO89-SuIitDj9bhTik-sO0iPUe5Ox1WWeSO6KPGiXt5b4dT3cv4MSetnqwTIlTHFEogBoMiAQOzcgMChHdI4aLVAclWXFgwGl3SYi5QwmKfH5AvHWN-8:1sKkdq:-6g4pY8fgU-KTlIBO-TyQUnuJTLz6Ht5peGHui6_Vbk','2024-07-05 20:13:50.479895');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_cliente`
--

DROP TABLE IF EXISTS `ventas_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `condado` varchar(100) NOT NULL,
  `estatus` varchar(100) NOT NULL,
  `estado_civil` varchar(100) NOT NULL,
  `taxes` double NOT NULL,
  `ocupacion` varchar(100) NOT NULL,
  `modo_declaracion` varchar(100) NOT NULL,
  `nombre_conyuge` varchar(100) DEFAULT NULL,
  `fecha_nacimiento_conyuge` date DEFAULT NULL,
  `estatus_conyuge` varchar(100) DEFAULT NULL,
  `ocupacion_conyuge` varchar(100) DEFAULT NULL,
  `cuanto_declara_conyuge` double DEFAULT NULL,
  `aplica` tinyint(1) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `observaciones` longtext,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_cliente`
--

LOCK TABLES `ventas_cliente` WRITE;
/*!40000 ALTER TABLE `ventas_cliente` DISABLE KEYS */;
INSERT INTO `ventas_cliente` VALUES (1,'miguel bernier','2023-01-12','masculino','arizona','legal','soltero',20,'barbero','electronica',NULL,NULL,NULL,NULL,NULL,0,'info@example.com',NULL,NULL,NULL,NULL),(2,'mifue','2000-06-10','masculino','arizona','legal','soltero',18234823,'barbero','electronica',NULL,NULL,NULL,NULL,NULL,1,'info@example.com',NULL,NULL,NULL,NULL),(3,'kkasfn','2020-01-22','masculino','arizona','legal','soltero',54326535,'barbero','electronica',NULL,NULL,NULL,NULL,NULL,0,'info@example.com','','','','asfkaskdf'),(4,'miguel bernier','2000-06-10','masculino','arizona','legal','soltero',65456476,'barbero','electronica',NULL,NULL,NULL,NULL,NULL,0,'info@example.com','','','','asfkaskdf');
/*!40000 ALTER TABLE `ventas_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_dependiente`
--

DROP TABLE IF EXISTS `ventas_dependiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_dependiente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estatus` varchar(100) NOT NULL,
  `ocupacion` varchar(100) NOT NULL,
  `cuanto_declara` double NOT NULL,
  `cliente_id` bigint NOT NULL,
  `correo` varchar(254) NOT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_dependiente_cliente_id_dee1b3a5_fk_ventas_cliente_id` (`cliente_id`),
  CONSTRAINT `ventas_dependiente_cliente_id_dee1b3a5_fk_ventas_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `ventas_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_dependiente`
--

LOCK TABLES `ventas_dependiente` WRITE;
/*!40000 ALTER TABLE `ventas_dependiente` DISABLE KEYS */;
INSERT INTO `ventas_dependiente` VALUES (1,'akjef','2005-06-13','legal','ama de casa',3782948,2,'ineo@example.com',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ventas_dependiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_vendedor`
--

DROP TABLE IF EXISTS `ventas_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_vendedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_vendedor`
--

LOCK TABLES `ventas_vendedor` WRITE;
/*!40000 ALTER TABLE `ventas_vendedor` DISABLE KEYS */;
INSERT INTO `ventas_vendedor` VALUES (1,'miguel bernier'),(2,'yenis palacio');
/*!40000 ALTER TABLE `ventas_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_venta`
--

DROP TABLE IF EXISTS `ventas_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_plan` varchar(100) NOT NULL,
  `compania` varchar(100) NOT NULL,
  `link_plan` varchar(200) NOT NULL,
  `credito_fiscal` double NOT NULL,
  `primas_mensual` double NOT NULL,
  `cliente_id` bigint NOT NULL,
  `vendedor_id` bigint NOT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_venta_cliente_id_85f33a80_fk_ventas_cliente_id` (`cliente_id`),
  KEY `ventas_venta_vendedor_id_2f6b0d76_fk_ventas_vendedor_id` (`vendedor_id`),
  CONSTRAINT `ventas_venta_cliente_id_85f33a80_fk_ventas_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `ventas_cliente` (`id`),
  CONSTRAINT `ventas_venta_vendedor_id_2f6b0d76_fk_ventas_vendedor_id` FOREIGN KEY (`vendedor_id`) REFERENCES `ventas_vendedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_venta`
--

LOCK TABLES `ventas_venta` WRITE;
/*!40000 ALTER TABLE `ventas_venta` DISABLE KEYS */;
INSERT INTO `ventas_venta` VALUES (1,'obama','obama','https://chatgpt.com/',2385475,25824,2,1,NULL,NULL),(2,'obama','obama','https://chatgpt.com/',5342356776,6336553,3,1,'',''),(3,'obama','obama','https://chatgpt.com/',6454765,434647,4,1,'','ventas/images/WhatsApp_Image_2024-05-16_at_1.32.26_PM.jpeg');
/*!40000 ALTER TABLE `ventas_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28  2:24:07
