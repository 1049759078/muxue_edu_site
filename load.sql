-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: muxue
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户信息',6,'add_userprofile'),(17,'Can change 用户信息',6,'change_userprofile'),(18,'Can delete 用户信息',6,'delete_userprofile'),(19,'Can add 轮播图',7,'add_banner'),(20,'Can change 轮播图',7,'change_banner'),(21,'Can delete 轮播图',7,'delete_banner'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can add 课程',9,'add_course'),(26,'Can change 课程',9,'change_course'),(27,'Can delete 课程',9,'delete_course'),(28,'Can add 视频',10,'add_video'),(29,'Can change 视频',10,'change_video'),(30,'Can delete 视频',10,'delete_video'),(31,'Can add 课程资源',11,'add_courseresource'),(32,'Can change 课程资源',11,'change_courseresource'),(33,'Can delete 课程资源',11,'delete_courseresource'),(34,'Can add 章节',12,'add_lesson'),(35,'Can change 章节',12,'change_lesson'),(36,'Can delete 章节',12,'delete_lesson'),(37,'Can add 用户咨询',13,'add_userask'),(38,'Can change 用户咨询',13,'change_userask'),(39,'Can delete 用户咨询',13,'delete_userask'),(40,'Can add 用户收藏',14,'add_userfavorite'),(41,'Can change 用户收藏',14,'change_userfavorite'),(42,'Can delete 用户收藏',14,'delete_userfavorite'),(43,'Can add 课程评论',15,'add_coursecomments'),(44,'Can change 课程评论',15,'change_coursecomments'),(45,'Can delete 课程评论',15,'delete_coursecomments'),(46,'Can add 用户课程',16,'add_usercourse'),(47,'Can change 用户课程',16,'change_usercourse'),(48,'Can delete 用户课程',16,'delete_usercourse'),(49,'Can add 用户消息',17,'add_usermessage'),(50,'Can change 用户消息',17,'change_usermessage'),(51,'Can delete 用户消息',17,'delete_usermessage'),(52,'Can add 课程机构',18,'add_courseorg'),(53,'Can change 课程机构',18,'change_courseorg'),(54,'Can delete 课程机构',18,'delete_courseorg'),(55,'Can add 城市',19,'add_citydict'),(56,'Can change 城市',19,'change_citydict'),(57,'Can delete 城市',19,'delete_citydict'),(58,'Can add 讲师',20,'add_teacher'),(59,'Can change 讲师',20,'change_teacher'),(60,'Can delete 讲师',20,'delete_teacher'),(61,'Can view log entry',1,'view_logentry'),(62,'Can view group',3,'view_group'),(63,'Can view permission',2,'view_permission'),(64,'Can view content type',4,'view_contenttype'),(65,'Can view 课程',9,'view_course'),(66,'Can view 课程资源',11,'view_courseresource'),(67,'Can view 章节',12,'view_lesson'),(68,'Can view 视频',10,'view_video'),(69,'Can view 课程评论',15,'view_coursecomments'),(70,'Can view 用户咨询',13,'view_userask'),(71,'Can view 用户课程',16,'view_usercourse'),(72,'Can view 用户收藏',14,'view_userfavorite'),(73,'Can view 用户消息',17,'view_usermessage'),(74,'Can view 城市',19,'view_citydict'),(75,'Can view 课程机构',18,'view_courseorg'),(76,'Can view 讲师',20,'view_teacher'),(77,'Can view session',5,'view_session'),(78,'Can view 轮播图',7,'view_banner'),(79,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(80,'Can view 用户信息',6,'view_userprofile'),(81,'Can add User Setting',21,'add_usersettings'),(82,'Can change User Setting',21,'change_usersettings'),(83,'Can delete User Setting',21,'delete_usersettings'),(84,'Can add Bookmark',22,'add_bookmark'),(85,'Can change Bookmark',22,'change_bookmark'),(86,'Can delete Bookmark',22,'delete_bookmark'),(87,'Can add log entry',23,'add_log'),(88,'Can change log entry',23,'change_log'),(89,'Can delete log entry',23,'delete_log'),(90,'Can add User Widget',24,'add_userwidget'),(91,'Can change User Widget',24,'change_userwidget'),(92,'Can delete User Widget',24,'delete_userwidget'),(93,'Can view Bookmark',22,'view_bookmark'),(94,'Can view log entry',23,'view_log'),(95,'Can view User Setting',21,'view_usersettings'),(96,'Can view User Widget',24,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore'),(101,'Can add server_ tel',26,'add_server_tel'),(102,'Can change server_ tel',26,'change_server_tel'),(103,'Can delete server_ tel',26,'delete_server_tel'),(104,'Can view server_ tel',26,'view_server_tel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (207,'EQKL','eqkl','6fd3161608521172a37ee1af68f000e590bf19ee','2018-02-23 16:58:38.625994'),(208,'SDQK','sdqk','509d82896829a49a8359bcd6dff955916d3beaea','2018-02-23 16:58:46.021997'),(209,'JEMX','jemx','827f63c427b0e719de33ac62300446fa195fb678','2018-02-23 16:58:48.373996'),(210,'LSIJ','lsij','9b580fb2abce43c347efbecdcf12462e0ebafcb5','2018-02-23 16:58:50.078016'),(211,'XOMC','xomc','1325e08a5bee1670e6c21ab41202276d0c704f15','2018-02-23 16:58:51.032001'),(212,'LUCV','lucv','25258102283f194b1a506a59328a0f8e7edc10d7','2018-02-23 16:58:51.761997'),(213,'IUKK','iukk','286901f4ee20338eca891ee3805dc1d0ddba0d48','2018-02-23 16:58:52.419997'),(214,'YLWZ','ylwz','c52486ced2e8b24fcf2e8d573420d4158facbc83','2018-02-23 16:58:53.075998'),(215,'QJOY','qjoy','b2e21ac2a278580680228d4178b04584fa3043d0','2018-02-23 16:58:53.707996'),(216,'SKMI','skmi','4462268bf944487f795bb3983f322fae61974f52','2018-02-23 16:58:54.465997'),(217,'EGDP','egdp','b76cd0f652b2e7c3616c2e0e6ded8d2dd1dd7153','2018-02-23 16:58:55.126004'),(218,'CYCS','cycs','e9b4a3f31eac6ed2173a4b0d68ecede0edbfa18c','2018-02-23 16:59:00.869001'),(219,'CDKH','cdkh','858213ff71ad81a1305dbc3b6b69467713330762','2018-02-23 16:59:03.496001'),(220,'CWTW','cwtw','a71c5b07992cde9cef3a7b1f15e24cefe430c023','2018-02-23 16:59:58.675819'),(221,'TOOR','toor','2fa4ec7263102387314c4afdd71c788861371f05','2018-02-23 16:59:59.670821'),(222,'AVGX','avgx','4be784feb7f3738c6da964ca869dd88c84d568ce','2018-02-23 17:00:00.583819'),(223,'HUKC','hukc','47d9fe402355b15ae8e929956cf687cc05550d87','2018-02-23 17:00:36.847829'),(224,'YTJA','ytja','e5e94815dcdc9015b28de5b8134134f933db6185','2018-02-23 17:00:39.004829'),(225,'TIZD','tizd','49fbdcd1af1356ef1b2f1d5b0185ed8baa95f859','2018-02-23 17:00:40.015829'),(226,'KRPS','krps','5b3d9e038c04ccb6a3c0ca085390299c6c777a96','2018-02-23 17:00:41.023828'),(227,'KPKI','kpki','eb2c9e44ffad2eed26b199153691613cb2df892d','2018-02-23 17:00:41.667826'),(228,'IGFX','igfx','6554cd02f7c0c5379ed0f1584674d7c3b273eefe','2018-02-23 17:00:42.152829'),(229,'NHKA','nhka','371dfe17ab6c0b6774bdf59e614ef0eab6dc3002','2018-02-23 17:00:42.437842'),(230,'TMRI','tmri','640e8aa6a3968549f82a8f58b1edabc2393edaf6','2018-02-23 17:00:42.824828'),(231,'AZMM','azmm','3750ed8b8a1cde75172c21d94b83a790ae45e997','2018-02-23 17:00:43.226829'),(232,'CTOM','ctom','e6a9188d7a2422dac9001a32fcd65e5b17993776','2018-02-23 17:00:58.040836'),(233,'UCBR','ucbr','af99ea4a28e6936820151aaf05f095372f4d7999','2018-02-23 17:00:59.237831'),(234,'LOID','loid','4e4fd319ea44426aac57cbee59893a23c877f400','2018-02-23 17:00:59.719837'),(235,'UORV','uorv','48e2f4e86f9917fbd17c528c78df6343332e6b15','2018-02-23 17:01:00.063832'),(236,'RMJY','rmjy','f8501200c368411d7d1ec32d85d4731883ec57c0','2018-02-23 17:01:00.514835'),(237,'ZMRK','zmrk','11760f2c45c83d7e28dd263bfbc59d98b3d1dc80','2018-02-23 17:01:01.020833'),(238,'BUGX','bugx','d32fc92dcfc7addd5037904eefa6be8dfb1dd373','2018-02-23 17:01:13.562836'),(239,'LKQQ','lkqq','eb34aa16f44984c5932283443d2b1a2e2a374745','2018-02-23 17:06:53.116600'),(240,'MUGK','mugk','7abc9ce159d4c770e1856db4fc08a07db6988189','2018-02-25 13:12:56.909205'),(241,'AURH','aurh','9c727c4efb6c6afd3ae59876287ae06f0bdd3307','2018-02-27 08:14:52.951079'),(242,'PPSZ','ppsz','008a0222da798f4129511365f5012c374ae9bc65','2018-02-27 08:14:55.530579'),(243,'USML','usml','dc741f189a75e1366cca6bd83e4b97d20fae78f8','2018-02-27 08:15:02.827131'),(244,'LMYB','lmyb','73188debf212db6d54ba13620814d338ac38f037','2018-02-27 08:15:04.494632'),(245,'JTJA','jtja','79a0056008263a852d99efd5f07279c2f17157d5','2018-02-27 08:15:05.796649'),(246,'FYES','fyes','d5ca7665bc46b4a39197ecb1e96743c96ad67749','2018-02-27 08:15:06.649632'),(247,'BYFU','byfu','d777b3ecfc76ea9f207f7e51f58f496b5bda08a3','2018-02-27 08:15:09.383655'),(248,'OINO','oino','708bbd1d91aef7ab2ecb4fa8dc44edc9dd5bdf01','2018-02-27 08:15:09.878653'),(249,'ENIW','eniw','43912000cda2679c4cce8e375896cc4aee26ea37','2018-02-27 08:15:42.371205'),(250,'WFEW','wfew','81e459339c987b54b3f7d713f79a23e0909b5384','2018-02-27 08:16:46.840582'),(251,'DMHJ','dmhj','7b8c8beb5cb6bb9a48dba350911e67981a93eee3','2018-02-27 08:16:47.587581'),(252,'KQKJ','kqkj','0a5edcaa18bd09784f08425cf1b44859b24a12fb','2018-02-27 08:16:47.786110'),(253,'XBFW','xbfw','eedb155f5f19ebf64c6d2eb95838e3e2e372c49b','2018-02-27 08:16:48.004109'),(254,'AVBA','avba','69e3c2417d902bc6a5d03d81f3f42c5e974910b0','2018-02-27 08:16:48.210611'),(255,'GPRT','gprt','d820c68324f2e2ddbd8914bf57030d6d9639a368','2018-02-27 08:16:48.482611'),(256,'HWYB','hwyb','07efd46acd366cf2ca5174347dc8da6fe3478901','2018-02-27 08:21:17.991433'),(257,'FOQQ','foqq','a785e9912a55278bfe38d600962aebd28dbb238e','2018-02-27 08:21:18.197930'),(258,'TSHT','tsht','b4696b78c37511f274f55b0be4af24ebe36c4561','2018-02-27 08:21:18.413929'),(259,'JHVV','jhvv','4b4b850e321d96ff883b42c80534e429381f46aa','2018-02-27 08:21:18.608932'),(260,'SXGU','sxgu','f7db61ab957f3a0a5e8f3b5c477b3e98ce51cfd4','2018-02-27 08:21:19.421430'),(261,'PNKZ','pnkz','b42fd97940afb671396c9e8528a1963467ec0501','2018-02-27 08:21:19.891930'),(262,'ILCT','ilct','1f8b8cf11e1720ac7d61a5510562b2342e32950a','2018-02-27 08:21:20.187430'),(263,'PAOQ','paoq','50f4f94530ff0fb2ec84d2bb3b480a526935b53c','2018-02-27 08:21:20.457430'),(264,'HKYX','hkyx','6027bc5c4e80f679b3d3f58a35665491334c04b7','2018-02-27 08:21:20.668432'),(265,'DZXY','dzxy','9dc4c83f0406d75f112fdc3dee6278f0d1f3c94d','2018-02-27 08:21:20.872930'),(266,'RQWE','rqwe','29975e1f25a844af0b07396e10132cf4e6e23a54','2018-02-27 08:21:21.098429'),(267,'GDPC','gdpc','8a8d663d4e9fdb0169cee46cc599d11cea274f42','2018-02-27 08:21:25.443056'),(268,'QOBO','qobo','a2f0389bfc509083392af35bac4e11fcfe094f63','2018-02-27 08:21:27.198059'),(269,'EGZM','egzm','6d8a6684111dd99a8e282fdf839d1d40a1877be1','2018-02-27 08:21:27.805057'),(270,'BXNY','bxny','5691cfe6de1345e91c747d9e289fe20e2379698c','2018-02-27 08:21:28.026056'),(271,'IRTO','irto','10b5598904723cc58381a60072605b9a179c3924','2018-02-27 08:21:30.367165'),(272,'MJOX','mjox','4065a58e3021e5c8ffc8b4c70c7689fcbe8e7d03','2018-02-27 08:21:31.730165'),(273,'IJZV','ijzv','70c4852a762fdb74150808d01517ab9dccdaae96','2018-02-27 08:21:32.417783'),(274,'NQIE','nqie','7ae7ad7ebe85495ce803a41b712c4f7f22f1af6b','2018-02-27 08:21:32.993283'),(275,'DAUW','dauw','722c6d3ea4a4193abfe0b004216dec6120f1f626','2018-02-27 08:21:33.481783'),(276,'DMLO','dmlo','a5754da4f7060d7f5f2368756ca0fdccb4247569','2018-02-27 08:21:34.960824'),(277,'JENY','jeny','fdeee60d5245c253541e600d9e9b94fb3cdf96c8','2018-02-27 08:21:37.723957'),(278,'EZUM','ezum','afa94909615217bfe66cb4464f981514ec7f2309','2018-02-27 08:21:38.712956'),(279,'LZIA','lzia','1009303aac96b2e9c6bc584f5b7d2e6636e52dc0','2018-02-27 08:22:03.514401'),(280,'UBPW','ubpw','9ac57fe42d060a28a5c4333c17efb9320732d834','2018-02-27 08:22:04.365897'),(281,'LIIR','liir','b17fead6a99b2ac459cc7c03db1fd460a2725b8b','2018-02-27 08:22:07.047899'),(282,'JMJW','jmjw','479c04679a9f7ff1e3f44522a387a11889dfe5c9','2018-02-27 08:22:07.958901'),(283,'WCBI','wcbi','79e61f92ef65c6f21ba9dc8733ba65eeb9327a39','2018-02-27 08:22:09.056399'),(284,'GBAH','gbah','b89b3dd85b0708ebfde9ad104c6b97b1d02e2de7','2018-02-27 08:22:09.831966'),(285,'GVJZ','gvjz','1a058972ded26cf5c0607c60a2f8b6759e316bfd','2018-02-27 08:22:11.168965'),(286,'WQCO','wqco','b719f8fd41eea3e8df71e5bb5cdcf8a8b064541f','2018-02-27 08:22:16.518969'),(287,'VALI','vali','e944b502fd467f53777b92ab835bbe7af6905a5d','2018-02-27 08:22:38.641132'),(288,'NVKU','nvku','4de13a6b41b25e30bb3845708759813e2de64e24','2018-02-27 08:22:40.011632'),(289,'EOIO','eoio','df5d914d3300f258f33fe986e3a2fb4f39ed6268','2018-02-27 08:22:40.761133'),(290,'MMEY','mmey','d4804a69af45b227ec47e94aa15b3205030c2afe','2018-02-27 08:22:44.032584'),(291,'LEJQ','lejq','9bfb1e9b400994819bb092d7fc01ed6a54fa0a05','2018-02-27 08:23:14.781999'),(292,'GWAN','gwan','cae756ba3c105ee9b1461ced14f93b9f35bac2d1','2018-02-27 08:23:21.070547'),(293,'TFHP','tfhp','fcf3965b8c119d6000f90d6d4eaf172c33c81228','2018-02-27 08:23:45.276311'),(294,'GTQJ','gtqj','99e0ad98468aad6e422c3a637c23d8d102d3d5bc','2018-02-27 08:23:48.512811'),(295,'VJTY','vjty','c8682e4aab660749df0bf14d75595268c8310d2e','2018-02-27 08:23:50.360640'),(296,'UYKD','uykd','600ee4134f68985816044818c74e9d1f81572308','2018-02-27 08:23:52.026138'),(297,'UQVP','uqvp','ac872c3704c225a41c84164385869ac819d96e52','2018-02-27 08:23:53.731138'),(298,'IBAR','ibar','fb4fd4b6dc85e86e197837acc6e3b96fe2d95ebc','2018-02-27 08:26:51.574614'),(299,'PMUV','pmuv','69a51573fede21c4a9b716d61e64b5fa0c8f41be','2018-02-27 08:26:55.369573'),(300,'TSBI','tsbi','d4bb6b463ab36e5f6271e14e67b8bbf5b7e02ae3','2018-02-27 08:26:57.895588'),(301,'AGYX','agyx','d5785a943f09018d4da44ed7722e3a1b83910b0d','2018-02-27 08:27:00.657072'),(302,'ECHU','echu','d33370939756eaac2390bf023b57f6e1e03679ec','2018-02-27 08:27:03.414602'),(303,'ATRX','atrx','ddae075bc680517502d0a8e926e303fd534918d3','2018-02-27 08:27:04.707574'),(304,'UDBP','udbp','8e070daef1af8b5e1e51c471e1a5e61a5cd7c1e5','2018-02-27 08:27:14.306711'),(305,'VNLF','vnlf','1fa59e9514fa40dde98a29e4f5e0e41b0ea28b9f','2018-02-27 08:27:15.818723'),(306,'RTZS','rtzs','7051a07a9d4266c335f91b479150d598c6c8437e','2018-02-27 08:27:17.002212'),(307,'AFZM','afzm','1212f4e44a05d94642ba35a5559652bc4b16f7c1','2018-02-27 08:27:55.504138'),(308,'RUPW','rupw','d584caf82259cf52686a20ba29050b495c65a60c','2018-02-27 08:30:01.938635'),(309,'MONG','mong','deaea90a49f59b7cd2a6763fda44dacb2864e47e','2018-02-27 08:30:26.370956'),(310,'KDIG','kdig','97f50c5966f4100f76efd3c25676b4bd68d51a77','2018-02-27 08:30:36.209074'),(311,'CWJY','cwjy','8647578215752bf161d92b4b9ff890183aec6ece','2018-02-27 08:30:38.952615'),(312,'TKXE','tkxe','874d0b29ee7236843e2d9a1d3852def5a4ef3202','2018-02-27 08:30:44.976190'),(313,'ARAN','aran','40cf25b1de31e0872287446e74d28922297f8bd0','2018-02-27 08:31:17.078304'),(314,'VRFP','vrfp','845e0aede80670433c547c942440b8d69fa5d4f2','2018-02-27 08:31:18.476804'),(315,'ZIWC','ziwc','32ffdca8245e4aa66e924005d0ab5eee75f5363d','2018-02-27 08:31:19.785806'),(316,'IGGX','iggx','a6f26e53d9a9982344f225a8f3fcbf6cba49edcd','2018-02-27 08:31:21.918807'),(317,'KZZT','kzzt','a58a1d7152e4c33fe5150ae8027b39a19fdba0b8','2018-02-27 08:31:23.680806'),(318,'HIPH','hiph','70d4289cf2a2040551f67ed3cb01acef89782f18','2018-02-27 08:31:35.512590'),(319,'RFVC','rfvc','8333533c9d1e27f8610f9d19bd2c61c1f7b89fbf','2018-02-28 11:04:16.423180'),(320,'PZXJ','pzxj','4e97aa3abce1fd7b4de43bc8c8322c5f45ad3014','2018-02-28 11:04:18.887139'),(321,'AJAN','ajan','ddc9762e006e3b92e1bcc75c46172524b4aa4ac3','2018-02-28 11:05:33.511639');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(15) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `you_need_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (2,'python','学习','学习','zj',100,1,2,'courses/2018/02/qianxun_K3v5kYg.png',218,'2018-02-24 13:42:00.000000',1,'python开发','python开发',1,'考试洛','爱学习',1),(3,'java','java','厉害','gj',200,0,2,'courses/2018/02/xx_CYWATT4.jpg',51,'2018-02-24 17:17:00.000000',2,'java','java',4,'考试洛','爱学习',1),(4,'js','js','js','zj',0,1,1,'courses/2018/02/xx_TYHDwjU.jpg',19,'2018-02-24 17:17:00.000000',3,'python开发','java',2,'考试洛','爱学习',0),(5,'编程1','编程1','编程1','zj',0,1,0,'courses/2018/02/xx_Jdujauz.jpg',22,'2018-02-24 18:02:00.000000',4,'python开发','python开发',6,'考试洛','爱学习',0),(6,'编程2','编程2','编程2','cj',0,1,0,'courses/2018/02/qianxun_zaDeu1a.png',6,'2018-02-24 18:03:00.000000',2,'','',NULL,'考试洛','爱学习',0),(7,'编程3','编程3','编程3','zj',0,1,1,'courses/2018/02/xx_cKpaotq.jpg',11,'2018-02-24 18:03:00.000000',1,'python开发','python开发',3,'考试洛','爱学习',0),(37,'厉害的课程','厉害的课程','厉害的课程','gj',0,0,0,'courses/2018/02/qianxun_SkwxI0C.png',4,'2018-02-26 18:50:00.000000',2,'java','java开发',2,'考试洛','爱学习',1),(38,'再来一门课程','再来一门课程','再来一门课程','zj',0,1,0,'courses/2018/02/qianxun_H4H1aEX.png',11,'2018-02-26 19:28:00.000000',4,'python开发','python开发',1,'考试洛','爱学习是好孩子',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (2,'学习资料','course/resource/2018/02/新建文本文档.txt','2018-02-24 20:56:00.000000',2),(3,'资料','course/resource/2018/02/新建文本文档_1.txt','2018-02-24 23:05:00.000000',2);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (2,'第一章','2018-02-24 13:43:00.000000',2),(3,'第二章','2018-02-24 20:22:00.000000',2),(4,'第三章','2018-02-24 20:22:00.000000',2),(5,'第四章','2018-02-24 22:46:00.000000',2),(6,'第一章','2018-02-25 14:19:00.000000',3),(7,'第二章','2018-02-25 14:19:00.000000',3);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (2,'第一节视频','2018-02-24 13:43:00.000000',2,10,'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4'),(3,'第二节视频','2018-02-24 22:51:00.000000',3,0,'https://www.cnblogs.com/guigujun'),(4,'第一节','2018-02-25 14:20:00.000000',6,0,'https://www.cnblogs.com/guigujun'),(5,'第二节视频','2018-02-25 16:00:00.000000',2,0,'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4');
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(9,'courses','course'),(11,'courses','courseresource'),(12,'courses','lesson'),(10,'courses','video'),(15,'operation','coursecomments'),(13,'operation','userask'),(16,'operation','usercourse'),(14,'operation','userfavorite'),(17,'operation','usermessage'),(19,'organization','citydict'),(18,'organization','courseorg'),(20,'organization','teacher'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(26,'users','server_tel'),(6,'users','userprofile'),(22,'xadmin','bookmark'),(23,'xadmin','log'),(21,'xadmin','usersettings'),(24,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-22 13:49:21.062834'),(2,'contenttypes','0002_remove_content_type_name','2018-02-22 13:49:21.090829'),(3,'auth','0001_initial','2018-02-22 13:49:21.270829'),(4,'auth','0002_alter_permission_name_max_length','2018-02-22 13:49:21.290828'),(5,'auth','0003_alter_user_email_max_length','2018-02-22 13:49:21.299857'),(6,'auth','0004_alter_user_username_opts','2018-02-22 13:49:21.320830'),(7,'auth','0005_alter_user_last_login_null','2018-02-22 13:49:21.329829'),(8,'auth','0006_require_contenttypes_0002','2018-02-22 13:49:21.333831'),(9,'auth','0007_alter_validators_add_error_messages','2018-02-22 13:49:21.341829'),(10,'auth','0008_alter_user_username_max_length','2018-02-22 13:49:21.349830'),(11,'users','0001_initial','2018-02-22 13:49:21.564843'),(12,'admin','0001_initial','2018-02-22 13:49:21.617832'),(13,'admin','0002_logentry_remove_auto_add','2018-02-22 13:49:21.628861'),(14,'sessions','0001_initial','2018-02-22 13:49:21.651858'),(15,'courses','0001_initial','2018-02-22 15:18:32.460512'),(16,'operation','0001_initial','2018-02-22 15:18:32.640544'),(17,'organization','0001_initial','2018-02-22 15:18:32.714524'),(18,'users','0002_banner_emailverifyrecord','2018-02-22 15:18:32.742527'),(19,'users','0003_auto_20180222_1531','2018-02-22 15:31:45.855320'),(20,'xadmin','0001_initial','2018-02-22 15:48:54.878982'),(21,'xadmin','0002_log','2018-02-22 15:48:54.947980'),(22,'xadmin','0003_auto_20160715_0100','2018-02-22 15:48:54.988979'),(23,'operation','0002_auto_20180222_1659','2018-02-22 16:59:48.406621'),(24,'captcha','0001_initial','2018-02-23 11:25:33.511140'),(25,'users','0004_auto_20180223_1125','2018-02-23 11:25:33.546153'),(26,'organization','0002_courseorg_category','2018-02-23 18:28:47.708557'),(27,'organization','0003_auto_20180224_0955','2018-02-24 09:55:22.183490'),(28,'courses','0002_course_course_org','2018-02-24 13:34:32.691129'),(29,'courses','0003_auto_20180224_1337','2018-02-24 13:46:32.920679'),(30,'organization','0004_teacher_image','2018-02-24 14:33:47.185901'),(31,'courses','0004_auto_20180224_2025','2018-02-24 20:25:57.788215'),(32,'courses','0005_course_tag','2018-02-24 21:12:08.103034'),(33,'courses','0006_lesson_url','2018-02-24 22:41:03.009159'),(34,'courses','0007_video_learn_times','2018-02-24 22:55:33.375450'),(35,'courses','0008_courseresource_teacher','2018-02-24 23:21:05.988960'),(36,'courses','0009_auto_20180224_2323','2018-02-24 23:23:33.601415'),(37,'courses','0010_auto_20180224_2335','2018-02-24 23:35:43.470250'),(38,'courses','0011_auto_20180225_1609','2018-02-25 16:09:22.680610'),(39,'organization','0005_teacher_age','2018-02-25 16:44:21.632359'),(40,'users','0005_auto_20180226_1321','2018-02-26 13:21:21.273185'),(41,'courses','0012_course_is_banner','2018-02-27 09:02:17.432802'),(42,'organization','0006_courseorg_tag','2018-02-27 10:22:09.798909'),(43,'users','0006_auto_20180227_1653','2018-02-27 16:53:55.012381'),(44,'users','0007_auto_20180227_1654','2018-02-27 16:54:57.228898'),(45,'users','0008_auto_20180227_1659','2018-02-27 16:59:43.849338'),(46,'users','0009_userprofile_server_tel','2018-02-28 18:59:38.420803'),(47,'users','0010_auto_20180228_1905','2018-02-28 19:05:58.722361');
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
INSERT INTO `django_session` VALUES ('7ri9r5mic0ykpgr1c41laera89x3y1to','ZDQwYTY1ODZhYjY2MjJiODQ5ZTQ0OTdhZDllZmFmZjc2Zjk2ZjRiODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNjg2MmJlMWEyYjNkYzgxY2UzNGE5NGQ1ZjljODJjNTllYWNjYTU0IiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2018-03-15 13:33:02.188801'),('bamhlvahzqt68mmrnw9xskm96loc9ep1','ZmEwOTJkNTM3NDZkNDBkOWI1MzgxODk0NGYwMWVkYjM2NDdkNzIwOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTg1YjVmNjA2NmQ3NWQ1YzE2MDVlMGFhMDkzODhjZjhhMzIwYmQxZSIsIkxJU1RfUVVFUlkiOltbImNvdXJzZXMiLCJ2aWRlbyJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCJ9','2018-03-11 16:11:14.380340'),('j8t7ie97qwgwk4kxxw1u5f962k3kp1hv','NTUwM2U5YTE4OGM3ZTY0M2RhMDQ0MDhiYzM4ZDQ5YTVlNTQ0OThmMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzYWU1ZjE5ZTIzMzJmYjE3YmUyYzAzODU4NGU2NWEzZTFmOGY1MThkIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-03-15 13:27:23.045565'),('kf5twzq94rfi1q7wms34gyezs3mfxni2','YTFiZDE5ZTYyYjk5MmZlNTVjN2NlMjcyMjU0NmMwOTU4OTI3Yzk3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjczMTE4YTMwMTYwZjkwMWQ2MWI3OThkZGFlZmU4NjA3MTc4YTk2MjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2018-03-09 14:02:40.620408'),('n0xgvyz682ocu4g1i8ift2z9d2bbnqxu','NzhmNDJhZTI4Y2JjNzU3ZDNiMjVmOWQ0MzY0ZTY4MjU2ZjdiNzc2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI2ODYyYmUxYTJiM2RjODFjZTM0YTk0ZDVmOWM4MmM1OWVhY2NhNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2018-03-09 16:49:38.173940'),('nor3j3h53mh9a6dpubzrqporyrqv561w','NzY4ZTQxMTlmYjVhMGJhZDk0MGY3NTkwZDhjOGMyNTVhNTlmOGIzNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZjgyMTRlMDRiNzI1NTBiZWJmNGI4NzEzOGZjMGIxZWUwZGVjMmVlIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==','2018-03-09 13:17:32.388186'),('zlrsseh9donvjr6a8lxmtx6svuvboh8p','OWE5N2EyMTMwY2E4ZDdlYjQxMDE1Y2ZlNzYyZjlhYzI0ODQ4MzQyOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfaGFzaCI6IjI2ODYyYmUxYTJiM2RjODFjZTM0YTk0ZDVmOWM4MmM1OWVhY2NhNTQifQ==','2018-03-11 13:36:02.763610');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(250) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (2,'不错','2018-02-24 20:56:00.000000',2,1),(3,'是是是','2018-02-25 13:28:11.706701',2,1),(4,'试试','2018-02-25 13:33:37.095065',2,1),(5,'嘻嘻嘻','2018-02-25 13:33:57.240069',2,1),(6,'是是是','2018-02-25 13:34:14.566076',2,1),(7,'ddd','2018-02-25 13:36:22.403616',2,6),(8,'ee','2018-02-25 13:36:28.538478',2,6),(9,'反反复复付','2018-02-25 13:37:26.562634',2,1),(10,'的点点滴滴多多多多多','2018-02-25 13:43:32.109742',2,1),(11,'少时诵诗书所所所所所所所所所所所所所','2018-02-25 13:43:40.029747',2,1),(12,'哦哦哦哦哦哦哦哦哦哦哦哦','2018-02-25 13:44:41.710460',2,1),(13,'男男女女女女女','2018-02-25 13:44:56.957466',2,1),(14,'，，，，','2018-02-25 13:45:02.539465',2,1),(15,'啊啊','2018-02-25 13:45:08.470490',2,1),(16,'aaa','2018-02-25 13:48:30.607334',2,6),(17,'是技术是技术计算机技术节省时间','2018-02-25 13:48:42.048318',2,6),(18,'啊啊','2018-02-25 13:52:47.697674',2,1),(19,'啊啊啊啊啊啊啊啊啊啊啊','2018-02-25 13:53:28.599091',2,1),(20,'安全','2018-02-25 13:53:35.695064',2,1),(21,'噼噼啪啪铺铺铺','2018-02-25 13:53:43.359084',2,1),(22,'少时诵诗书所所所所','2018-02-25 14:08:17.461753',2,1),(23,'去去去','2018-02-25 14:08:23.063756',2,1),(24,'三生三世','2018-02-25 16:19:55.840110',2,1),(25,'啊啊啊啊啊啊啊啊啊啊啊啊啊','2018-02-25 16:20:01.794113',2,1),(26,'bucuo','2018-02-26 09:40:45.418628',2,1),(27,'三生三世','2018-02-26 18:56:40.062795',4,1),(28,'我来看看','2018-02-26 19:07:30.951504',2,1),(29,'我来了','2018-02-26 19:07:57.625948',3,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'小小','111111','明月','2018-02-22 17:08:00.000000'),(2,'小小','18351922582','啊啊啊','2018-02-24 12:47:06.585056'),(3,'小小','18351922582','啊啊啊','2018-02-24 12:47:06.589556'),(4,'小小','18351922582','啊啊啊','2018-02-24 12:47:08.216080'),(5,'小小','18351922582','啊啊啊','2018-02-24 12:47:08.219556'),(6,'小小','18351922582','啊啊啊','2018-02-24 12:47:16.128560'),(7,'小小','18351922582','啊啊啊','2018-02-24 12:47:16.132574'),(8,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:47:56.561278'),(9,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:47:56.566277'),(10,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:03.553390'),(11,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:03.557390'),(12,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:14.361919'),(13,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:14.365895'),(14,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:43.729057'),(15,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:43.730588'),(16,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:53.672181'),(17,'小小1111111','18351922582','呃呃鹅鹅鹅','2018-02-24 12:48:53.676180'),(18,'嗯嗯','18351922582','222','2018-02-24 12:49:10.070780'),(19,'嗯嗯','18351922582','222','2018-02-24 12:49:21.568863'),(20,'嗯嗯','18351922582','222','2018-02-24 12:49:22.208363'),(21,'嗯嗯','18351922582','222','2018-02-24 12:49:22.831863'),(22,'嗯嗯','18351922582','222','2018-02-24 12:49:23.639365'),(23,'嗯嗯','18351922582','222','2018-02-24 12:49:24.425364'),(24,'嗯嗯','18351922582','222','2018-02-24 12:49:24.985863'),(25,'嗯嗯','18351922582','222','2018-02-24 12:49:25.537364'),(26,'嗯嗯','18351922582','222','2018-02-24 12:49:26.112436'),(27,'嗯嗯','18351922582','222','2018-02-24 12:49:26.457935'),(28,'嗯嗯','18351922582','222','2018-02-24 12:49:26.680936'),(29,'嗯嗯','18351922582','222','2018-02-24 12:49:27.208435'),(30,'嗯嗯','18351922582','222','2018-02-24 12:49:27.400437'),(31,'嗯嗯','18351922582','222','2018-02-24 12:49:27.577935'),(32,'嗯嗯','18351922582','222','2018-02-24 12:49:27.968435'),(33,'嗯嗯','18351922582','222','2018-02-24 12:49:28.384436'),(34,'嗯嗯','18351922582','222','2018-02-24 12:49:28.584436'),(35,'嗯嗯','18351922582','222','2018-02-24 12:49:28.751936'),(36,'嗯嗯','18351922582','222','2018-02-24 12:49:28.944935'),(37,'嗯嗯','18351922582','222','2018-02-24 12:50:41.328059'),(38,'嗯嗯','183','222','2018-02-24 12:51:25.144290'),(39,'嗯嗯','183','222','2018-02-24 12:51:30.529791'),(40,'55','5555','555','2018-02-24 13:03:48.387976'),(41,'55','5555','555~~~~~~','2018-02-24 13:04:03.009111'),(42,'55','5555','555~-*----~~~~~','2018-02-24 13:04:16.074112'),(43,'222222','111111','111111','2018-02-24 13:06:54.217264'),(44,'222222','111111','111111','2018-02-24 13:06:57.808765'),(45,'222222','111111','111111','2018-02-24 13:06:59.239766'),(46,'999','33','份饭','2018-02-24 13:07:11.542316'),(47,'55555','66666','1111111','2018-02-24 13:09:34.182716'),(48,'3333','18351922582','啦啦','2018-02-24 13:18:25.746516'),(49,'4444','18868752541','ffff','2018-02-24 13:18:53.568234'),(50,'99','18351922582','8888','2018-02-26 20:01:58.494213'),(51,'2222222222','18351922582','33','2018-02-26 20:02:27.925047');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (5,'2018-02-25 15:08:21.605633',2,1),(6,'2018-02-25 16:06:05.080621',2,6),(7,'2018-02-26 18:53:19.116565',3,1),(8,'2018-02-27 09:37:35.645871',6,1),(9,'2018-02-27 09:37:51.850233',4,1),(10,'2018-02-27 09:37:58.868318',38,1),(11,'2018-02-28 14:17:49.684832',5,1),(12,'2018-03-01 14:36:54.245454',7,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (50,2,'2018-02-25 18:44:53.718916',6,1),(78,1,'2018-02-25 19:44:22.226853',1,3),(80,1,'2018-02-26 09:12:10.537041',6,2),(91,4,'2018-02-26 19:29:51.267392',1,2),(93,2,'2018-02-26 19:45:05.437393',1,3),(96,4,'2018-02-26 19:45:29.648914',1,3),(99,5,'2018-02-26 19:49:00.635449',1,3),(113,1,'2018-02-27 10:14:22.306141',1,2),(115,3,'2018-02-27 10:58:32.345408',6,2),(116,4,'2018-02-27 10:58:37.171759',6,3),(125,4,'2018-03-01 13:11:56.746575',1,1),(126,3,'2018-03-01 13:11:57.609657',1,2),(127,7,'2018-03-01 14:36:50.881429',1,1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,1,'99999999999',1,'2018-02-22 17:09:00.000000'),(2,1,'欢迎光临本站',1,'2018-02-27 08:47:00.000000'),(3,1,'在干嘛',1,'2018-02-27 08:48:00.000000'),(4,1,'啦啦啦啦啦',1,'2018-02-27 08:49:00.000000'),(5,1,'呵呵',1,'2018-02-27 08:49:00.000000'),(6,2,'的点点滴滴多多多多多',0,'2018-02-27 08:50:00.000000'),(7,1,'鹅鹅鹅鹅鹅鹅鹅鹅鹅',1,'2018-02-27 08:51:00.000000'),(8,1,'阿阿阿阿阿阿',1,'2018-02-27 08:52:00.000000'),(9,1,'dddddddd',1,'2018-02-27 13:31:00.000000'),(10,1,'大家好',1,'2018-02-28 14:00:00.000000'),(11,1,'333333333',1,'2018-02-28 14:28:00.000000'),(12,6,'333333333333333',1,'2018-02-28 14:29:00.000000'),(13,0,'fffffffff',0,'2018-02-28 14:31:00.000000');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'杭州','杭州','2018-02-22 16:45:00.000000'),(2,'北京市','首都','2018-02-23 18:11:00.000000'),(3,'西安市','古都','2018-02-23 18:11:00.000000'),(4,'上海市','金融中心','2018-02-23 18:12:00.000000'),(5,'重庆市','雾都','2018-02-23 18:12:00.000000'),(6,'成都市','平原','2018-02-23 18:12:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'杭州机构','啛啛喳喳错错错错错',84,2,'org/2018/02/qianxun_Fvft9mu.png','西湖区','2018-02-22 16:46:00.000000',1,'pxjg',1,1,'国内知名'),(2,'北京机构','北京机构',4,1,'org/2018/02/qianxun.png','北京','2018-02-23 18:19:00.000000',2,'pxjg',1,1,'国内名校'),(3,'重庆机构','重庆机构',4,2,'org/2018/02/qianxun_dnujXLq.png','重庆市','2018-02-23 18:22:00.000000',5,'gr',1,1,'国内名校'),(4,'上海机构','上海机构',0,2,'org/2018/02/qianxun_FAmL4iN.png','上海市','2018-02-23 18:23:00.000000',4,'pxjg',0,0,'国内名校'),(5,'成都机构','成都机构',0,1,'org/2018/02/qianxun_OCkwvaD.png','成都市','2018-02-23 18:40:00.000000',6,'gx',0,0,'国内名校'),(6,'西安机构','西安机构',1,1,'org/2018/02/qianxun_cW5LwKq.png','西安','2018-02-24 09:16:00.000000',3,'gx',0,0,'国内名校');
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'小小',2,'小夏','试试','厉害',7,1,'2018-02-22 16:47:00.000000',1,'teacher/2018/02/xx.jpg',10),(2,'风云',5,'阿里巴巴','CEO','幽默，可爱',0,2,'2018-02-25 17:39:00.000000',1,'teacher/2018/02/xx_XkVvzSl.jpg',21),(3,'哈哈',1,'金山','老板','好看',0,0,'2018-02-25 17:41:00.000000',2,'teacher/2018/02/xx_Jjfe3qe.jpg',31),(4,'大大',3,'百度','开发','厉害',11,2,'2018-02-25 17:42:00.000000',3,'teacher/2018/02/xx_eF8So0w.jpg',33),(5,'你好',4,'360','老板','好',0,1,'2018-02-25 17:43:00.000000',2,'teacher/2018/02/xx_SQz58l3.jpg',55),(6,'你好',4,'360','老板','好',0,0,'2018-02-25 17:43:00.000000',2,'teacher/2018/02/xx_rrBYTYU.jpg',55);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'111','banner/2018/02/qianxun_MsRLKjQ.png','https://www.baidu.com',100,'2018-02-22 16:16:00.000000'),(2,'123','banner/2018/02/qianxun_mIofgJZ.png','https://www.baidu.com',100,'2018-02-27 09:14:00.000000'),(3,'345','banner/2018/02/qianxun_MUWDh9G.png','https://www.baidu.com',1,'2018-02-27 09:14:00.000000'),(4,'111111','banner/2018/02/qianxun_Rti7YMv.png','https://www.baidu.com',2,'2018-02-27 09:14:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(20) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (1,'33333','22@2.com','register','2018-02-22 15:57:00.000000'),(2,'dRbsdVclksCQQ19F','1049759078@qq.com','register','2018-02-23 12:28:08.782187'),(3,'Walk1KZx3fFwE1kt','2721593215@qq.com','register','2018-02-23 13:38:39.698145'),(4,'DEHx9BISI9SBFRka','1049759078@qq.com','register','2018-02-23 13:56:18.179548'),(5,'TSEjefAHWOJAWuTk','1049759078@qq.com','register','2018-02-23 14:02:00.218579'),(6,'YsNG2LIXI8ZejGSQ','1049759078@qq.com','forget','2018-02-23 14:57:53.608310'),(7,'I4oAFM40lbhQx9u0','1049759078@qq.com','forget','2018-02-23 14:59:09.205605'),(8,'IradF05mHUhjxFcT','1049759078@qq.com','forget','2018-02-23 15:00:14.612828'),(9,'gSktoR3J2umRCkCi','admin@admin.com','forget','2018-02-23 15:08:29.400266'),(10,'Oi6Kil0ISLozsk5A','admin@admin.com','forget','2018-02-23 15:21:54.245117'),(11,'TZzPncpg9HjLd2y2','admin@admin.com','forget','2018-02-23 15:22:42.852128'),(12,'MzQWzOLnP5LTusoH','admin@admin.com','forget','2018-02-23 15:23:46.060147'),(13,'BYHjNhnQPI5QzJXN','1049759078@qq.com','forget','2018-02-23 15:28:54.756210'),(14,'R5qw26HssPzK9QBr','1049759078@qq.com','forget','2018-02-23 15:30:44.435302'),(15,'0CNtrSHcxm9kAHgJ','1049759078@qq.com','forget','2018-02-23 15:40:56.142767'),(16,'8VwLWv4PscaTD9L3','1049759078@qq.com','forget','2018-02-23 15:42:02.524781'),(17,'4WkQS5qjMmiotCgZ','1049759078@qq.com','forget','2018-02-23 15:44:16.928812'),(18,'a916Szose7SLcJ5T','1049759078@qq.com','forget','2018-02-23 15:48:45.343194'),(19,'iclibkrgtdKxy3JC','1049759078@qq.com','forget','2018-02-23 15:51:31.580202'),(20,'YxXBsDZNkOLsEJnT','1049759078@qq.com','forget','2018-02-23 15:54:22.497673'),(21,'UifC3rkdD9HtPAMo','1049759078@qq.com','forget','2018-02-23 16:10:11.541384'),(22,'umI7Ra5HnUyq6sIp','1049759078@qq.com','forget','2018-02-23 16:19:09.081993'),(23,'pFbSF3PHIqL2TCfI','1049759078@qq.com','forget','2018-02-23 16:27:05.032808'),(24,'hA4lOitETatJWz46','1049759078@qq.com','forget','2018-02-23 16:29:38.109838'),(25,'53Kwk8cqFV7TEtcl','1049759078@qq.com','forget','2018-02-23 16:31:54.484391'),(26,'qAoeanNQtyljDe3Z','1049759078@qq.com','forget','2018-02-23 16:38:30.534866'),(27,'qw1UnMn2eH7zkWDe','1049759078@qq.com','forget','2018-02-23 16:41:43.998899'),(28,'tZvZzBDy9cx4fn1q','2721593215@qq.com','update_email','2018-02-26 14:01:21.328909'),(29,'0MNBlP3PNhwytCoh','2721593215@qq.com','update_email','2018-02-26 14:19:02.995776'),(30,'j62vQGnRn8vHLnwv','2721593215@qq.com','update_email','2018-02-26 14:19:48.342850'),(31,'P2VXaQpSWblZHJSi','2721593215@qq.com','update_email','2018-02-26 14:22:04.802009'),(32,'BBg2o0lfWeLWGq5Y','2721593215@qq.com','update_email','2018-02-28 14:11:18.118685');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_server_tel`
--

DROP TABLE IF EXISTS `users_server_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_server_tel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_server_tel`
--

LOCK TABLES `users_server_tel` WRITE;
/*!40000 ALTER TABLE `users_server_tel` DISABLE KEYS */;
INSERT INTO `users_server_tel` VALUES (1,'0571-888888');
/*!40000 ALTER TABLE `users_server_tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nike_name` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$36000$sxT7kDZmNUCo$pgD97FNu5ECg03o8ylpfKTvJ8WCyK/pCVtjHyaESXEg=','2018-03-01 13:32:37.517295',1,'admin','','','admin@admin.com',1,1,'2018-02-22 15:32:17.286333','小小小小','2018-02-10','male','订单','15864932154','image/default.png'),(6,'pbkdf2_sha256$36000$ClgcYPr57aYT$pgQV66Cj9Pa/Cv62YaOr0l9Y0Zn31qDnyG2VSpdRJz8=','2018-03-01 13:33:02.183801',0,'1049759078@qq.com','','','1049759078@qq.com',0,1,'2018-02-23 14:02:00.000000','大大',NULL,'male','杭州',NULL,'image/2018/02/xx.jpg');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-02-22 15:58:36.280453','127.0.0.1','1','EmailVerifyRecord object','create','已添加。',8,1),(2,'2018-02-22 16:16:59.054562','127.0.0.1','1','Banner object','create','已添加。',7,1),(3,'2018-02-22 16:26:44.306526','127.0.0.1','1','Course object','create','已添加。',9,1),(4,'2018-02-22 16:32:46.722594','127.0.0.1','1','啊啊啊','create','已添加。',12,1),(5,'2018-02-22 16:38:00.433083','127.0.0.1','1','第一课','create','已添加。',10,1),(6,'2018-02-22 16:38:29.673091','127.0.0.1','1','学习资料','create','已添加。',11,1),(7,'2018-02-22 16:41:28.554077','127.0.0.1','1','《明月》课程的章节 >> 明月第一章','change','修改 name',12,1),(8,'2018-02-22 16:45:44.352131','127.0.0.1','1','CityDict object','create','已添加。',19,1),(9,'2018-02-22 16:47:20.453152','127.0.0.1','1','杭州机构','create','已添加。',18,1),(10,'2018-02-22 16:47:52.632160','127.0.0.1','1','小小','create','已添加。',20,1),(11,'2018-02-22 17:08:44.144408','127.0.0.1','3','用户(admin)收藏了2 ','create','已添加。',14,1),(12,'2018-02-22 17:09:12.514122','127.0.0.1','1','用户: 小小 手机号: 111111','create','已添加。',13,1),(13,'2018-02-22 17:09:32.749471','127.0.0.1','4','用户(admin)学习了明月 ','create','已添加。',16,1),(14,'2018-02-22 17:09:56.693047','127.0.0.1','1','用户(0)接收了99999999999 ','create','已添加。',17,1),(15,'2018-02-22 17:10:14.261731','127.0.0.1','1','用户(admin)对于《明月》 评论 :','create','已添加。',15,1),(16,'2018-02-23 18:11:45.179962','127.0.0.1','2','北京市','create','已添加。',19,1),(17,'2018-02-23 18:12:00.937951','127.0.0.1','3','西安市','create','已添加。',19,1),(18,'2018-02-23 18:12:12.845948','127.0.0.1','4','上海市','create','已添加。',19,1),(19,'2018-02-23 18:12:25.701952','127.0.0.1','5','重庆市','create','已添加。',19,1),(20,'2018-02-23 18:12:37.221955','127.0.0.1','6','成都市','create','已添加。',19,1),(21,'2018-02-23 18:20:11.418693','127.0.0.1','2','北京机构','create','已添加。',18,1),(22,'2018-02-23 18:23:25.188760','127.0.0.1','3','重庆机构','create','已添加。',18,1),(23,'2018-02-23 18:23:51.292747','127.0.0.1','4','上海机构','create','已添加。',18,1),(24,'2018-02-23 18:40:30.891931','127.0.0.1','5','成都机构','create','已添加。',18,1),(25,'2018-02-24 09:17:23.745137','127.0.0.1','6','西安机构','create','已添加。',18,1),(26,'2018-02-24 09:36:44.662826','127.0.0.1','3','重庆机构','change','修改 image 和 category',18,1),(27,'2018-02-24 13:35:12.212562','127.0.0.1','1','明月','change','修改 image，click_nums 和 course_org',9,1),(28,'2018-02-24 13:42:37.002706','127.0.0.1','1','明月','delete','',9,1),(29,'2018-02-24 13:43:10.825194','127.0.0.1','2','python','create','已添加。',9,1),(30,'2018-02-24 13:43:39.201904','127.0.0.1','2','《python》课程的章节 >> 第一章','create','已添加。',12,1),(31,'2018-02-24 13:43:52.230781','127.0.0.1','2','第一节视频','create','已添加。',10,1),(32,'2018-02-24 14:48:29.039137','127.0.0.1','1','[杭州机构]的教师: 小小','change','修改 image',20,1),(33,'2018-02-24 15:15:02.283436','127.0.0.1','2','python','change','修改 learn_times 和 image',9,1),(34,'2018-02-24 17:17:53.987851','127.0.0.1','3','java','create','已添加。',9,1),(35,'2018-02-24 17:18:18.134928','127.0.0.1','4','js','create','已添加。',9,1),(36,'2018-02-24 18:03:23.054267','127.0.0.1','5','编程1','create','已添加。',9,1),(37,'2018-02-24 18:03:43.102390','127.0.0.1','6','编程2','create','已添加。',9,1),(38,'2018-02-24 18:04:01.408977','127.0.0.1','7','编程3','create','已添加。',9,1),(39,'2018-02-24 20:22:26.414489','127.0.0.1','3','《python》课程的章节 >> 第二章','create','已添加。',12,1),(40,'2018-02-24 20:22:34.785458','127.0.0.1','4','《python》课程的章节 >> 第三章','create','已添加。',12,1),(41,'2018-02-24 20:27:56.341332','127.0.0.1','2','python','change','修改 image 和 category',9,1),(42,'2018-02-24 20:56:31.245379','127.0.0.1','2','学习资料','create','已添加。',11,1),(43,'2018-02-24 20:56:59.298465','127.0.0.1','2','用户(admin)对于《python》 评论 :','create','已添加。',15,1),(44,'2018-02-24 21:22:36.898841','127.0.0.1',NULL,'','delete','批量删除 29 个 课程',NULL,1),(45,'2018-02-24 21:23:11.373360','127.0.0.1','2','python','change','修改 image 和 tag',9,1),(46,'2018-02-24 21:23:38.801345','127.0.0.1','5','编程1','change','修改 image，category 和 tag',9,1),(47,'2018-02-24 21:27:20.578287','127.0.0.1','7','编程3','change','修改 image，course_org，category 和 tag',9,1),(48,'2018-02-24 22:47:10.500009','127.0.0.1','5','《python》课程的章节 >> 第四章','create','已添加。',12,1),(49,'2018-02-24 22:51:56.234783','127.0.0.1','3','第二节视频','create','已添加。',10,1),(50,'2018-02-24 22:56:18.645389','127.0.0.1','2','第一节视频','change','修改 learn_times',10,1),(51,'2018-02-24 23:05:21.804305','127.0.0.1','3','资料','create','已添加。',11,1),(52,'2018-02-24 23:24:14.617425','127.0.0.1','2','python','change','修改 image 和 teacher',9,1),(53,'2018-02-25 13:51:02.998650','127.0.0.1','6','1049759078@qq.com','change','修改 last_login，gender，address 和 image',6,1),(54,'2018-02-25 14:19:46.894534','127.0.0.1','6','《java》课程的章节 >> 第一章','create','已添加。',12,1),(55,'2018-02-25 14:19:54.156560','127.0.0.1','7','《java》课程的章节 >> 第二章','create','已添加。',12,1),(56,'2018-02-25 14:20:15.397541','127.0.0.1','4','第一节','create','已添加。',10,1),(57,'2018-02-25 15:15:44.837860','127.0.0.1','2','《python》课程的章节 >> 第一章','change','修改 url',12,1),(58,'2018-02-25 15:32:30.850015','127.0.0.1','2','《python》课程的章节 >> 第一章','change','修改 url',12,1),(59,'2018-02-25 15:47:38.363771','127.0.0.1','2','《python》课程的章节 >> 第一章','change','修改 url',12,1),(60,'2018-02-25 15:53:32.595398','127.0.0.1','2','《python》课程的章节 >> 第一章','change','修改 url',12,1),(61,'2018-02-25 16:00:33.587597','127.0.0.1','5','第二节视频','create','已添加。',10,1),(62,'2018-02-25 16:10:03.205486','127.0.0.1','2','第一节视频','change','修改 url',10,1),(63,'2018-02-25 16:11:14.191839','127.0.0.1','5','第二节视频','change','修改 url',10,1),(64,'2018-02-25 17:40:10.969196','127.0.0.1','2','[杭州机构]的教师: 风云','create','已添加。',20,1),(65,'2018-02-25 17:42:43.538406','127.0.0.1','3','[北京机构]的教师: 哈哈','create','已添加。',20,1),(66,'2018-02-25 17:43:31.251926','127.0.0.1','4','[重庆机构]的教师: 大大','create','已添加。',20,1),(67,'2018-02-25 17:44:13.924401','127.0.0.1','5','[北京机构]的教师: 你好','create','已添加。',20,1),(68,'2018-02-25 17:44:14.300901','127.0.0.1','6','[北京机构]的教师: 你好','create','已添加。',20,1),(69,'2018-02-26 18:51:11.301165','127.0.0.1','37','厉害的课程','create','已添加。',9,1),(70,'2018-02-26 18:52:25.755346','127.0.0.1','3','java','change','修改 image，category，tag 和 teacher',9,1),(71,'2018-02-26 18:54:13.104531','127.0.0.1','7','编程3','change','修改 image 和 teacher',9,1),(72,'2018-02-26 18:54:32.187660','127.0.0.1','5','编程1','change','修改 image 和 teacher',9,1),(73,'2018-02-26 18:55:06.193783','127.0.0.1','4','js','change','修改 image，category，tag 和 teacher',9,1),(74,'2018-02-26 19:29:22.393257','127.0.0.1','38','再来一门课程','create','已添加。',9,1),(75,'2018-02-27 08:47:37.502691','127.0.0.1','2','用户(0)接收了欢迎光临本站 ','create','已添加。',17,1),(76,'2018-02-27 08:48:01.965875','127.0.0.1','1','用户(1)接收了99999999999 ','change','修改 user',17,1),(77,'2018-02-27 08:48:21.899667','127.0.0.1','2','用户(1)接收了欢迎光临本站 ','change','修改 user',17,1),(78,'2018-02-27 08:48:45.634988','127.0.0.1','3','用户(1)接收了在干嘛 ','create','已添加。',17,1),(79,'2018-02-27 08:49:29.318815','127.0.0.1','4','用户(1)接收了啦啦啦啦啦 ','create','已添加。',17,1),(80,'2018-02-27 08:49:51.962031','127.0.0.1','5','用户(1)接收了呵呵 ','create','已添加。',17,1),(81,'2018-02-27 08:50:18.244681','127.0.0.1','6','用户(2)接收了的点点滴滴多多多多多 ','create','已添加。',17,1),(82,'2018-02-27 08:51:43.946255','127.0.0.1','7','用户(1)接收了鹅鹅鹅鹅鹅鹅鹅鹅鹅 ','create','已添加。',17,1),(83,'2018-02-27 08:52:23.142949','127.0.0.1','8','用户(1)接收了阿阿阿阿阿阿 ','create','已添加。',17,1),(84,'2018-02-27 09:14:24.155585','127.0.0.1','2','Banner object','create','已添加。',7,1),(85,'2018-02-27 09:14:40.260599','127.0.0.1','3','Banner object','create','已添加。',7,1),(86,'2018-02-27 09:15:15.434676','127.0.0.1','4','Banner object','create','已添加。',7,1),(87,'2018-02-27 09:16:22.050178','127.0.0.1','4','Banner object','change','修改 image 和 url',7,1),(88,'2018-02-27 09:16:33.100681','127.0.0.1','3','Banner object','change','修改 image 和 url',7,1),(89,'2018-02-27 09:16:44.615662','127.0.0.1','2','Banner object','change','修改 image 和 url',7,1),(90,'2018-02-27 09:16:55.028715','127.0.0.1','1','Banner object','change','修改 image 和 url',7,1),(91,'2018-02-27 09:28:30.998752','127.0.0.1','37','厉害的课程','change','修改 image 和 is_banner',9,1),(92,'2018-02-27 10:26:55.648531','127.0.0.1','1','杭州机构','change','修改 image 和 tag',18,1),(93,'2018-02-27 13:32:00.482727','127.0.0.1','9','用户(1)接收了dddddddd ','create','已添加。',17,1),(94,'2018-02-28 14:00:13.003988','127.0.0.1','10','用户(1)接收了大家好 ','create','已添加。',17,1),(95,'2018-02-28 14:01:30.808235','127.0.0.1','10','用户(1)接收了大家好 ','change','修改 has_read',17,1),(96,'2018-02-28 14:28:57.966756','127.0.0.1','11','用户(1)接收了333333333 ','create','已添加。',17,1),(97,'2018-02-28 14:29:13.036227','127.0.0.1','12','用户(2)接收了333333333333333 ','create','已添加。',17,1),(98,'2018-02-28 14:30:15.800488','127.0.0.1','12','用户(6)接收了333333333333333 ','change','修改 user',17,1),(99,'2018-02-28 14:31:57.401480','127.0.0.1','13','用户(0)接收了fffffffff ','create','已添加。',17,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 14:44:10
