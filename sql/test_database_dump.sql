-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: opencaching
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.45-MariaDB-1~bionic

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
-- Table structure for table `attribute_categories`
--

DROP TABLE IF EXISTS `attribute_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_categories` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `color` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_categories`
--

LOCK TABLES `attribute_categories` WRITE;
/*!40000 ALTER TABLE `attribute_categories` DISABLE KEYS */;
INSERT INTO `attribute_categories` (`id`, `name`, `trans_id`, `color`) VALUES (1,'Properties',1342,'#FFDD51'),(2,'Restrictions / Preconditions',1343,'#69F765'),(3,'Recommendations / Prohibitions',1344,'#00F0FF');
/*!40000 ALTER TABLE `attribute_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_groups` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` (`id`, `category_id`, `name`, `trans_id`) VALUES (1,1,'Dangers',1331),(2,1,'Infrastructure',1332),(3,1,'Route',1658),(4,1,'Waypoints',1333),(5,2,'General',1334),(6,2,'Time',1335),(7,2,'Seasonal',1336),(8,2,'Listing',1337),(9,2,'Tools needed',1338),(10,2,'Preparation needed',1339),(11,3,'Persons',1340),(12,3,'Transportation',1341),(13,3,'Infrastructure',1332);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_adoption`
--

DROP TABLE IF EXISTS `cache_adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_adoption` (
  `cache_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL COMMENT 'via Trigger',
  UNIQUE KEY `id` (`cache_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_adoption`
--

LOCK TABLES `cache_adoption` WRITE;
/*!40000 ALTER TABLE `cache_adoption` DISABLE KEYS */;
INSERT INTO `cache_adoption` (`cache_id`, `user_id`, `date_created`) VALUES (17,170294,'2020-12-18 10:18:35');
/*!40000 ALTER TABLE `cache_adoption` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheAdoptionBeforeInsert` BEFORE INSERT ON `cache_adoption`
     FOR EACH ROW BEGIN
         SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheAdoptionBeforeUpdate` BEFORE UPDATE ON `cache_adoption`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_adoptions`
--

DROP TABLE IF EXISTS `cache_adoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_adoptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cache_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`cache_id`,`date`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_adoptions`
--

LOCK TABLES `cache_adoptions` WRITE;
/*!40000 ALTER TABLE `cache_adoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_adoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_attrib`
--

DROP TABLE IF EXISTS `cache_attrib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_attrib` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `group_id` tinyint(3) unsigned NOT NULL,
  `selectable` tinyint(1) NOT NULL DEFAULT '1',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `search_default` tinyint(1) unsigned NOT NULL,
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `icon_large` varchar(80) NOT NULL COMMENT 'obsolete',
  `icon_no` varchar(80) NOT NULL COMMENT 'obsolete',
  `icon_undef` varchar(80) NOT NULL COMMENT 'obsolete',
  `html_desc` mediumtext NOT NULL,
  `html_desc_trans_id` int(10) unsigned NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `gc_id` tinyint(3) unsigned NOT NULL,
  `gc_inc` tinyint(1) NOT NULL,
  `gc_name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`,`id`),
  KEY `default` (`default`),
  KEY `selectable` (`selectable`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_attrib`
--

LOCK TABLES `cache_attrib` WRITE;
/*!40000 ALTER TABLE `cache_attrib` DISABLE KEYS */;
INSERT INTO `cache_attrib` (`id`, `name`, `icon`, `trans_id`, `group_id`, `selectable`, `category`, `search_default`, `default`, `icon_large`, `icon_no`, `icon_undef`, `html_desc`, `html_desc_trans_id`, `hidden`, `gc_id`, `gc_inc`, `gc_name`) VALUES (1,'Only at night','night',1541,6,1,0,1,0,'resource2/ocstyle/images/attributes/night.png','resource2/ocstyle/images/attributes/night-no.png','resource2/ocstyle/images/attributes/night-disabled.png','This geocache can be found at night only - it is a so-called <i>night cache</i>. There may be reflectors which have to be flashlighted and will point to the hiding place, or other special night-caching mechanisms.',1545,0,52,1,'Night Cache'),(6,'Only loggable at Opencaching','oconly',1345,8,1,0,1,0,'resource2/ocstyle/images/attributes/oconly.png','resource2/ocstyle/images/attributes/oconly-no.png','resource2/ocstyle/images/attributes/oconly-disabled.png','This geocache is listed at Opencaching only. This attribute will enable users of other geocaching platforms to find interesting OC caches quickly.',1546,0,106,1,'Only loggable at Opencaching'),(7,'Hyperlink to another caching portal only','wwwlink',1542,8,0,0,1,2,'resource2/ocstyle/images/attributes/wwwlink.png','resource2/ocstyle/images/attributes/wwwlink-no.png','resource2/ocstyle/images/attributes/wwwlink-disabled.png','<i>Obsolete: This attribute cannot be assigned to new caches, because it does not fit our current terms of use.</i><br />This cache is listed at multiple geocaching sites, and the cache description at Opencaching may be incomplete. Links to the description at the external site(s) should be included in the listing. Please note that descriptions and status of multiple-listed caches have to be equally maintained at all sites including Opencaching, according to our current terms of use.',1705,0,107,1,'Hyperlink to another caching portal only'),(8,'Letterbox (needs stamp)','letter',1543,4,1,0,1,0,'resource2/ocstyle/images/attributes/letter.png','resource2/ocstyle/images/attributes/letter-no.png','resource2/ocstyle/images/attributes/letter-disabled.png','There is a stamp in the cache for stamping your personal logbook, and the cache’s logbook will be stamped with your personal stamp. Take care not to mix up stamps and to leave the cache’s stamp in the cache! Frequently letterboxes can be found without GPS, maybe with a compass and paces from a location - add the \"without GPS\" attribute for those.',1548,0,108,1,'Letterbox (needs stamp)'),(9,'Dangerous area','danger',1544,1,1,0,0,0,'resource2/ocstyle/images/attributes/danger.png','resource2/ocstyle/images/attributes/danger-no.png','resource2/ocstyle/images/attributes/danger-disabled.png','The cache is located within a dangerous area. Use this attribute to mark non-obvious dangers, like high-traffic roads, steep ground or falling rocks. Security measures should be taken or the cache be omitted, especially when geocaching with children, large groups or at unfavourable weather conditions.',1549,0,23,1,'Dangerous area'),(10,'Active railway nearby','train',1550,1,1,0,0,0,'resource2/ocstyle/images/attributes/train.png','resource2/ocstyle/images/attributes/train-no.png','resource2/ocstyle/images/attributes/train-disabled.png','There are active railroads nearby. Please be careful, keep a safe distance and cross the rails only at level crossings etc.!',1599,0,110,1,'Active railway nearby'),(11,'Cliff / Rocks','cliff',1551,1,1,0,0,0,'resource2/ocstyle/images/attributes/cliff.png','resource2/ocstyle/images/attributes/cliff-no.png','resource2/ocstyle/images/attributes/cliff-disabled.png','There are cliffs or dangerous rocks nearby. Beware of falling rocks at the lower side, and be careful at the upper side of cliffs - especially with children and while mountain biking. It can be very dangerous to take a steep slope towards a cliff, because you may not notice in time where the former ends and the latter starts.',1600,0,21,1,'Cliff / falling rocks'),(12,'Hunting','hunting',1552,1,1,0,0,0,'resource2/ocstyle/images/attributes/hunting.png','resource2/ocstyle/images/attributes/hunting-no.png','resource2/ocstyle/images/attributes/hunting-disabled.png','The geocache is placed within a hunting ground. At twilight and in the dark, a flashlight or headlight should always be used for security reasons. Be considerate when meeting hunters.',1601,0,22,1,'Hunting'),(13,'Thorns','thorn',1553,1,1,0,0,0,'resource2/ocstyle/images/attributes/thorn.png','resource2/ocstyle/images/attributes/thorn-no.png','resource2/ocstyle/images/attributes/thorn-disabled.png','There are thorns near the cache. Wear appropriate clothes.',1602,0,39,1,'Thorns'),(14,'Ticks','ticks',1554,1,1,0,0,0,'resource2/ocstyle/images/attributes/ticks.png','resource2/ocstyle/images/attributes/ticks-no.png','resource2/ocstyle/images/attributes/ticks-disabled.png','There are seasonably many ticks in this area. It is recommended to wear long trousers and to check yourself for ticks after geocaching. There are risk maps for <i>tick-borne encephalitis</i> in the internet, e.g. for Germany at sites like www.meningitis.de (look for FSME there).',1603,0,19,1,'Ticks'),(15,'Abandoned mines','mine',1555,1,1,0,0,0,'resource2/ocstyle/images/attributes/mine.png','resource2/ocstyle/images/attributes/mine-no.png','resource2/ocstyle/images/attributes/mine-disabled.png','This cache leads into a (former) mining area. There may be dangers by collapsing adits, or you may need to enter adits. Be careful and use appropriate equipment, especially in the dark. Old mines may be covered by historic preservation.',1625,0,20,1,'Abandoned mines'),(16,'Poisonous plants','plants',1556,1,1,0,0,0,'resource2/ocstyle/images/attributes/plants.png','resource2/ocstyle/images/attributes/plants-no.png','resource2/ocstyle/images/attributes/plants-disabled.png','There are poisonous plants near the cache. Take care and prevent children and dogs from touching or eating them.',1626,0,17,1,'Poisonous plants'),(17,'Dangerous animals','animals',1557,1,1,0,0,0,'resource2/ocstyle/images/attributes/animals.png','resource2/ocstyle/images/attributes/animals-no.png','resource2/ocstyle/images/attributes/animals-disabled.png','The area is inhabited by possibly dangerous animals, e.g. rabies areas, venomous snakes, scorpions or bears.',1627,0,18,1,'Dangerous animals'),(18,'Parking area nearby','parking',1558,2,1,0,1,0,'resource2/ocstyle/images/attributes/parking.png','resource2/ocstyle/images/attributes/parking-no.png','resource2/ocstyle/images/attributes/parking-disabled.png','A nearby parking area is situated as starting point for doing this cache. If no free parking is available, add the \"access or parking fee\" attribute.',1628,0,25,1,'Parking available'),(19,'Public transportation','public',1559,2,1,0,1,0,'resource2/ocstyle/images/attributes/public.png','resource2/ocstyle/images/attributes/public-no.png','resource2/ocstyle/images/attributes/public-disabled.png','This cache is located outside of urban areas and has a public transport station nearby. Don’t set this attribute for geocaches in urban areas that are commonly equipped with public transportation.',1629,0,26,1,'Public transportation'),(20,'Drinking water nearby','water',1560,2,1,0,0,0,'resource2/ocstyle/images/attributes/water.png','resource2/ocstyle/images/attributes/water-no.png','resource2/ocstyle/images/attributes/water-disabled.png','There is drinking water along the trail or near the cache. This attribute is useful especially for planning event caches, longer hikes or caches at probably dirty locations like caves.',1630,0,27,1,'Drinking water nearby'),(21,'Public restrooms nearby','restrooms',1561,2,1,0,0,0,'resource2/ocstyle/images/attributes/restrooms.png','resource2/ocstyle/images/attributes/restrooms-no.png','resource2/ocstyle/images/attributes/restrooms-disabled.png','There are public restrooms along the way or near the cache. This attribute is useful especially for planning event caches or extensive multicaches.',1631,0,28,1,'Public restrooms nearby'),(22,'Public phone nearby','phone',1562,2,1,0,0,0,'resource2/ocstyle/images/attributes/phone.png','resource2/ocstyle/images/attributes/phone-no.png','resource2/ocstyle/images/attributes/phone-disabled.png','There is a public phone along the way or near the cache. Especially for event caches you should enquire for nearby phones and set this attribute if applicable.',1632,0,29,1,'Telephone nearby'),(23,'First aid available','firstaid',1563,2,1,0,0,0,'resource2/ocstyle/images/attributes/firstaid.png','resource2/ocstyle/images/attributes/firstaid-no.png','resource2/ocstyle/images/attributes/firstaid-disabled.png','There is a first aid station, call box, mountain rescue or similar arrangement near the cache. This attribute is useful especially in demanding areas, like climbing caches, cave caches, high mountains or at the water. Check if you can add emergency phone numbers (like a mountain rescue) to your cache listing.',1633,0,123,1,'First aid available'),(24,'Near the parking area','car',1564,3,1,0,1,0,'resource2/ocstyle/images/attributes/car.png','resource2/ocstyle/images/attributes/car-no.png','resource2/ocstyle/images/attributes/car-disabled.png','The geocache is located close to a parking area, only a few steps away - it’s a \"cache and dash\".',1634,0,53,1,'Park and grab'),(25,'Long walk','hiking',1565,3,1,0,1,0,'resource2/ocstyle/images/attributes/hiking.png','resource2/ocstyle/images/attributes/hiking-no.png','resource2/ocstyle/images/attributes/hiking-disabled.png','This cache requires a long walk - more than 5 km round trip. In the mountains and other steep areas, the distance for a \"long walk\" may be shorter. Walking shoes and appropriate equipment are recommended.',1635,0,9,1,'Significant hike'),(26,'Swamp, marsh or wading','wading',1566,3,1,0,1,0,'resource2/ocstyle/images/attributes/wading.png','resource2/ocstyle/images/attributes/wading-no.png','resource2/ocstyle/images/attributes/wading-disabled.png','This cache requires passing swampy or marshy ground or wading through shallow water. Wear appropriate clothes. After rainfall, the terrain may be very demanding or not passable at all.',1636,0,11,1,'May require wading'),(27,'Hilly area','steep',1567,3,1,0,1,0,'resource2/ocstyle/images/attributes/steep.png','resource2/ocstyle/images/attributes/steep-no.png','resource2/ocstyle/images/attributes/steep-disabled.png','One or more ascents lie between you and the cache.',1637,0,127,1,'Hilly area'),(28,'Some climbing (no gear needed)','climbing',1568,3,1,0,1,0,'resource2/ocstyle/images/attributes/climbing.png','resource2/ocstyle/images/attributes/climbing-no.png','resource2/ocstyle/images/attributes/climbing-disabled.png','This cache requires some climbing and you may have to use your hands, but you won’t need climbing gear. Be very careful during rainy weather or before thunderstorms!',1638,0,10,1,'Difficult climbing'),(29,'Swimming required','swimming',1569,3,1,0,0,0,'resource2/ocstyle/images/attributes/swimming.png','resource2/ocstyle/images/attributes/swimming-no.png','resource2/ocstyle/images/attributes/swimming-disabled.png','This cache requires crossing a river or a lake. The water is steep.',1639,0,12,1,'May require swimming'),(30,'Point of interest','interestsign',1570,4,1,0,1,0,'resource2/ocstyle/images/attributes/interestsign.png','resource2/ocstyle/images/attributes/interestsign-no.png','resource2/ocstyle/images/attributes/interestsign-disabled.png','There is a point of interest at the cache, like a nice scenic overlook or a larger castle ruin. This place is worth visiting it even without a geocache nearby.',1640,0,130,1,'Point of interest'),(31,'Moving target','moving',1571,4,1,0,0,0,'resource2/ocstyle/images/attributes/moving.png','resource2/ocstyle/images/attributes/moving-no.png','resource2/ocstyle/images/attributes/moving-disabled.png','This geocache is moving around. For example, the owner might regularly move the cache from one place to another, or the finders will do this task and post new coordinates in their log entries. The owner must update coordinates in the cache description after each move.',1641,0,131,1,'Moving target'),(32,'Webcam','webcam',1572,4,1,0,0,0,'resource2/ocstyle/images/attributes/webcam.png','resource2/ocstyle/images/attributes/webcam-no.png','resource2/ocstyle/images/attributes/webcam-disabled.png','There is a webcam at the target location. You must record a webcam picture of your visit and include it in your \"found\" log entry. There may be additional requirements like a geocaching banner on the photo. The webcam’s address is included in the cache description, and it must be publicly accessible, i.e. no user account or similar is required.',1642,0,132,1,'Webcam'),(33,'Wihin enclosed rooms (caves, buildings etc.)','indoor',1573,4,1,0,0,0,'resource2/ocstyle/images/attributes/indoor.png','resource2/ocstyle/images/attributes/indoor-no.png','resource2/ocstyle/images/attributes/indoor-disabled.png','This geocache is not hidden in the open air, but within a building, a cave or similar.',1643,0,133,1,'Wihin enclosed rooms'),(34,'In the water','submerged',1604,4,1,0,1,0,'resource2/ocstyle/images/attributes/submerged.png','resource2/ocstyle/images/attributes/submerged-no.png','resource2/ocstyle/images/attributes/submerged-disabled.png','This cache or one of the stages is placed underwater. You may have to enter the water, swim or dive.',1644,0,134,1,'In the water'),(35,'Without GPS (letterboxes, cistes, compass juggling ...)','nogps',1575,4,1,0,1,0,'resource2/ocstyle/images/attributes/nogps.png','resource2/ocstyle/images/attributes/nogps-no.png','resource2/ocstyle/images/attributes/nogps-disabled.png','This cache can be found without a GPS device. No additional coordinates are used besides of the starting coordinates.',1645,0,135,1,'Without GPS'),(36,'Access or parking fee','fee',1576,5,1,0,1,0,'resource2/ocstyle/images/attributes/fee.png','resource2/ocstyle/images/attributes/fee-no.png','resource2/ocstyle/images/attributes/fee-disabled.png','You must pay an access or parking fee to access this cache, e.g. if the cache is located within a theme park. If there are alternative free parking areas nearby, please include them in the cache description. Please note our current terms of use regarding \"commercial geocaches\".',1646,0,2,1,'Access or parking fee'),(37,'Overnight stay necessary','overnight',1577,5,1,0,0,0,'resource2/ocstyle/images/attributes/overnight.png','resource2/ocstyle/images/attributes/overnight-no.png','resource2/ocstyle/images/attributes/overnight-disabled.png','This cache cannot be done within a single day or a single night. You will have to visit the location for more than one time, or you must stay overnight. Preparation time is not included in this calculation, but only the time on site.',1647,0,137,1,'Overnight stay necessary'),(38,'Available 24 hours','available',1578,6,1,0,0,0,'resource2/ocstyle/images/attributes/available.png','resource2/ocstyle/images/attributes/available-no.png','resource2/ocstyle/images/attributes/available-disabled.png','This cache can be done both at daylight and at night, and on all weekdays.',1605,0,13,1,'Available at all times'),(39,'Only available at specified times','time',1579,6,1,0,0,0,'resource2/ocstyle/images/attributes/time.png','resource2/ocstyle/images/attributes/time-no.png','resource2/ocstyle/images/attributes/time-disabled.png','This cache can only be done at certain times of day - see the cache description for more details. For example, the cache may be placed in an area with restricted opening hours.',1606,0,13,0,'Available at all times'),(40,'By day only','day',1580,6,1,0,0,0,'resource2/ocstyle/images/attributes/day.png','resource2/ocstyle/images/attributes/day-no.png','resource2/ocstyle/images/attributes/day-disabled.png','This cache shoud be attempted during daylight only. For example, the area may be dangerous and contain cliffs or abysses. Or using flashlights may be inadvisable because it would look suspicious within a residential area.',1607,0,14,0,'Recommended at night'),(41,'Not at high water level','tide',1581,6,1,0,0,0,'resource2/ocstyle/images/attributes/tide.png','resource2/ocstyle/images/attributes/tide-no.png','resource2/ocstyle/images/attributes/tide-disabled.png','This cache can be done only at low or normal water level. At flood or high-tide it is not accessible.',1608,0,142,1,'Not at high water level'),(42,'All seasons','date',1582,7,1,0,0,0,'resource2/ocstyle/images/attributes/date.png','resource2/ocstyle/images/attributes/date-no.png','resource2/ocstyle/images/attributes/date-disabled.png','This cache can be found the whole year round, while difficulty may depend on seasons. Specify difficulty for <i>good</i> conditions.',1609,0,62,0,'Seasonal access'),(43,'Breeding season / protected nature','naturschutz',1583,7,1,0,1,0,'resource2/ocstyle/images/attributes/naturschutz.png','resource2/ocstyle/images/attributes/naturschutz-no.png','resource2/ocstyle/images/attributes/naturschutz-disabled.png','Don’t seek this cache during animal breeding season! Please indicate in the cache description which time of year must be avoided. Also, pay attention to the local terms and signs regarding nature protection.',1610,0,143,1,'Breeding season / protected nature'),(44,'Snow-proof hiding place','snow',1584,7,1,0,1,0,'resource2/ocstyle/images/attributes/snow.png','resource2/ocstyle/images/attributes/snow-no.png','resource2/ocstyle/images/attributes/snow-disabled.png','This cache can be found even after heavy snowing. All stages and the geocache are hidden in a snow-safe way: they will not be covered by fallen snow an not by snow-piles created by snow-clearing vehicles.',1611,0,15,1,'Available during winter'),(46,'Special equipment','tools',1585,9,1,0,0,0,'resource2/ocstyle/images/attributes/tools.png','resource2/ocstyle/images/attributes/tools-no.png','resource2/ocstyle/images/attributes/tools-disabled.png','You will need special equipment which is not specified by other attributes, e.g. a laser pointer, walkie-talkies or a car jack.',1612,0,51,1,'Special tool required'),(47,'Compass','compass',1586,9,1,0,1,0,'resource2/ocstyle/images/attributes/compass.png','resource2/ocstyle/images/attributes/compass-no.png','resource2/ocstyle/images/attributes/compass-disabled.png','A compass is required.',1613,0,147,1,'Compass'),(48,'Flashlight','flashlight',1587,9,1,0,1,0,'resource2/ocstyle/images/attributes/flashlight.png','resource2/ocstyle/images/attributes/flashlight-no.png','resource2/ocstyle/images/attributes/flashlight-disabled.png','A flashlight is required for finding this cache. Don’t forget spare batteries!',1614,0,44,1,'Flashlight required'),(49,'Climbing gear','rappeling',1588,9,1,0,1,0,'resource2/ocstyle/images/attributes/rappeling.png','resource2/ocstyle/images/attributes/rappeling-no.png','resource2/ocstyle/images/attributes/rappeling-disabled.png','For this cache, you will need climbing equipment and the knowledge how to use it properly. If you are a beginner, don’t do it alone but use the support of an experienced climber or mountaineer.',1615,0,3,1,'Climbing gear'),(50,'Cave equipment','cave',1589,9,1,0,1,0,'resource2/ocstyle/images/attributes/cave.png','resource2/ocstyle/images/attributes/cave-no.png','resource2/ocstyle/images/attributes/cave-disabled.png','This geocache is hidden in a cave, and you should use appropriate equipment to access it. Beware: Even small caves may confront you with unforeseen problems and dangers, like thunder storms (water!) or a sprained ankle. Have advice first from cave-experienced people! Also take care of protected nature; e.g. bat places must not be disturbed.',1616,0,150,1,'Cave equipment'),(51,'Diving equipment','scuba',1590,9,1,0,1,0,'resource2/ocstyle/images/attributes/scuba.png','resource2/ocstyle/images/attributes/scuba-no.png','resource2/ocstyle/images/attributes/scuba-disabled.png','You will need diving equipment to find this geocache. The water depth of the cache location is specified in the description. Please note that secure diving requires special training. Without diving experience, you may search this cache in company of a diving teacher.',1617,0,5,1,'Scuba gear'),(52,'Watercraft','boat',1591,9,1,0,0,0,'resource2/ocstyle/images/attributes/boat.png','resource2/ocstyle/images/attributes/boat-no.png','resource2/ocstyle/images/attributes/boat-disabled.png','This cache usually can be found only using a watercraft. Swimming is impossible because of the distance or currents. See the cache description for more details.',1618,0,4,1,'Boat'),(53,'Aircraft','aircraft',1592,9,0,0,0,0,'resource2/ocstyle/images/attributes/aircraft.png','resource2/ocstyle/images/attributes/aircraft-no.png','resource2/ocstyle/images/attributes/aircraft-disabled.png','',0,0,153,1,'Aircraft'),(54,'Investigation','wiki',1593,10,1,0,1,0,'resource2/ocstyle/images/attributes/wiki.png','resource2/ocstyle/images/attributes/wiki-no.png','resource2/ocstyle/images/attributes/wiki-disabled.png','You must investigate additional information before you can seek this cache. This commonly applies to puzzle/mystery caches.',1619,0,154,1,'Investigation'),(55,'Puzzle / Mystery','riddle',1594,10,1,0,1,0,'resource2/ocstyle/images/attributes/riddle.png','resource2/ocstyle/images/attributes/riddle-no.png','resource2/ocstyle/images/attributes/riddle-disabled.png','Puzzles or mysteries have to be solved before or while seeking this cache.',1620,0,47,1,'Field puzzle'),(56,'Arithmetical problem','arith_prob',1595,10,1,0,1,0,'resource2/ocstyle/images/attributes/arith_prob.png','resource2/ocstyle/images/attributes/arith_prob-no.png','resource2/ocstyle/images/attributes/arith_prob-disabled.png','Before or while seeking this cache, arithmetical problems must be solved which go beyond very basic calculations.',1621,0,156,1,'Arithmetical problem'),(57,'Other cache type','othercache',1596,8,1,0,0,0,'resource2/ocstyle/images/attributes/othercache.png','resource2/ocstyle/images/attributes/othercache-no.png','resource2/ocstyle/images/attributes/othercache-disabled.png','This is none of the standard, pre-defined types of cache. Use this attribute for special, unusual caches.',1622,0,157,1,'Other cache type'),(58,'Ask owner for start conditions','ask',1597,10,1,0,0,0,'resource2/ocstyle/images/attributes/ask.png','resource2/ocstyle/images/attributes/ask-no.png','resource2/ocstyle/images/attributes/ask-disabled.png','Before doing this cache, you must ask the owner for the starting conditions. E.g. the cache may be linked to certain events at varying dates.',1623,0,158,1,'Ask owner for start conditions'),(59,'Suited for children','kids',1598,11,1,0,1,0,'resource2/ocstyle/images/attributes/kids.png','resource2/ocstyle/images/attributes/kids-no.png','resource2/ocstyle/images/attributes/kids-disabled.png','This geocache is suitable for children. All challenges can be solved by child in the age of 10 to 12 years and the terrain has no risks (like highways, abysms). There should be a large geocache container with trading items inside and the challanges are interesting.',1624,0,6,1,'Recommended for kids'),(60,'Only available during specified seasons','calendar',1799,7,1,0,0,0,'resource2/ocstyle/images/attributes/calendar.png','resource2/ocstyle/images/attributes/calendar-no.png','resource2/ocstyle/images/attributes/calendar-disabled.png','This cache can be done at certain seasons only - see the cache description for more details. For example, the cache may be placed in a corn labyrinth, which only exists from bloom to harvest season.',1800,0,62,1,'Seasonal access'),(61,'Safari Cache','safari',2015,4,1,0,1,0,'resource2/ocstyle/images/attributes/safari.png','resource2/ocstyle/images/attributes/safari-no.png','resource2/ocstyle/images/attributes/safari-disabled.png','This geocache can be found at different places. The places to look for are explained in the cache description. They must be located \"away from home\" and exist for a considerable period of time, so that they can be re-visited later. There is no container and no logbook; instead the find must be documented by a photo and noting the coordinates.',2016,0,161,1,'Safari Cache'),(62,'Handicap: Blind','blind-people',2632,11,1,0,1,0,'resource2/ocstyle/images/attributes/blind-people.png','resource2/ocstyle/images/attributes/blind-people-no.png','resource2/ocstyle/images/attributes/blind-people-disabled.png','This Cache can be found by blind people.',2633,0,162,1,'Handicap: Blind'),(63,'Handicap: Wheelchair','wheelchair',2662,11,1,0,1,0,'resource2/ocstyle/images/attributes/wheelchair.png','resource2/ocstyle/images/attributes/wheelchair-no.png','resource2/ocstyle/images/attributes/wheelchair-disabled.png','This cache is findable for persons with a wheelchair!',2663,0,24,1,'Handicap: Wheelchair');
/*!40000 ALTER TABLE `cache_attrib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_coordinates`
--

DROP TABLE IF EXISTS `cache_coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_coordinates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `restored_by` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`cache_id`,`date_created`),
  KEY `longitude` (`longitude`),
  KEY `latitude` (`latitude`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='via Trigger (caches)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_coordinates`
--

LOCK TABLES `cache_coordinates` WRITE;
/*!40000 ALTER TABLE `cache_coordinates` DISABLE KEYS */;
INSERT INTO `cache_coordinates` (`id`, `date_created`, `cache_id`, `longitude`, `latitude`, `restored_by`) VALUES (1,'2020-12-17 13:38:05',1,6.9038833333333,51.965583333333,0),(2,'2020-12-17 13:45:50',3,11.593333333333,48.046383333333,0),(3,'2020-12-17 14:18:27',4,6.9160833333333,51.99065,0),(4,'2020-12-17 14:23:31',5,6.9104,51.988283333333,0),(5,'2020-12-17 14:27:51',6,13.014133333333,47.648083333333,0),(6,'2020-12-18 08:23:47',7,10.865333333333,48.3865,0),(7,'2020-12-18 08:27:46',8,12.906383333333,54.921533333333,0),(8,'2020-12-18 08:32:21',9,10.867633333333,49.480583333333,0),(9,'2020-12-18 09:07:26',10,2.9120166666667,51.231766666667,0),(10,'2020-12-18 09:16:33',11,6.7019,51.622033333333,0),(11,'2020-12-18 09:22:55',12,6.8514166666667,51.930683333333,0),(12,'2020-12-18 09:29:03',13,28.071833333333,-26.536933333333,0),(13,'2020-12-18 09:45:23',14,-168.08986666667,65.612866666667,0),(14,'2020-12-18 09:59:49',15,33.572216666667,59.35555,0),(15,'2020-12-18 10:13:03',16,9.527,54.838733333333,0),(16,'2020-12-18 10:16:42',17,11.692316666667,47.90275,0),(17,'2020-12-18 10:17:12',17,11.6923,47.90275,0),(18,'2020-12-18 10:20:00',17,11.628583333333,48.213733333333,0),(19,'2020-12-18 10:23:18',18,6.7346166666667,51.476033333333,0),(20,'2020-12-18 10:30:33',19,9.5247666666667,54.8373,0),(21,'2020-12-18 10:39:54',20,6.63895,49.754683333333,0),(22,'2020-12-18 10:44:51',21,-77,38.8976,0),(23,'2020-12-18 11:11:15',22,11.185183333333,44.740733333333,0),(24,'2020-12-18 11:22:26',23,11.185183333333,55.925916666667,0);
/*!40000 ALTER TABLE `cache_coordinates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_countries`
--

DROP TABLE IF EXISTS `cache_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  `country` char(2) NOT NULL DEFAULT '',
  `restored_by` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`cache_id`,`date_created`),
  KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='via Trigger (caches)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_countries`
--

LOCK TABLES `cache_countries` WRITE;
/*!40000 ALTER TABLE `cache_countries` DISABLE KEYS */;
INSERT INTO `cache_countries` (`id`, `date_created`, `cache_id`, `country`, `restored_by`) VALUES (1,'2020-12-17 13:38:05',1,'DE',0),(2,'2020-12-17 13:45:50',3,'DE',0),(3,'2020-12-17 14:18:27',4,'DE',0),(4,'2020-12-17 14:23:31',5,'DE',0),(5,'2020-12-17 14:27:51',6,'DE',0),(6,'2020-12-18 08:23:47',7,'DE',0),(7,'2020-12-18 08:27:46',8,'DE',0),(8,'2020-12-18 08:32:21',9,'DE',0),(9,'2020-12-18 09:07:26',10,'BE',0),(10,'2020-12-18 09:16:33',11,'DE',0),(11,'2020-12-18 09:22:55',12,'DE',0),(12,'2020-12-18 09:29:03',13,'ZA',0),(13,'2020-12-18 09:45:23',14,'US',0),(14,'2020-12-18 09:59:49',15,'RU',0),(15,'2020-12-18 10:13:03',16,'DE',0),(16,'2020-12-18 10:16:42',17,'JP',0),(17,'2020-12-18 10:23:18',18,'DE',0),(18,'2020-12-18 10:30:33',19,'DE',0),(19,'2020-12-18 10:39:54',20,'DE',0),(20,'2020-12-18 10:44:51',21,'US',0),(21,'2020-12-18 11:11:15',22,'DE',0),(22,'2020-12-18 11:22:26',23,'DE',0);
/*!40000 ALTER TABLE `cache_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_desc`
--

DROP TABLE IF EXISTS `cache_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_desc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL COMMENT 'via Trigger (cache_desc)',
  `last_modified` datetime NOT NULL COMMENT 'via Trigger (cache_desc)',
  `cache_id` int(10) unsigned NOT NULL,
  `language` char(2) NOT NULL,
  `desc` longtext NOT NULL,
  `desc_html` tinyint(1) NOT NULL DEFAULT '1',
  `desc_htmledit` tinyint(1) NOT NULL DEFAULT '1',
  `hint` longtext NOT NULL,
  `short_desc` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cache_id` (`cache_id`,`language`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `last_modified` (`last_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_desc`
--

LOCK TABLES `cache_desc` WRITE;
/*!40000 ALTER TABLE `cache_desc` DISABLE KEYS */;
INSERT INTO `cache_desc` (`id`, `uuid`, `node`, `date_created`, `last_modified`, `cache_id`, `language`, `desc`, `desc_html`, `desc_htmledit`, `hint`, `short_desc`) VALUES (1,'8d335293-3fd8-11eb-96df-0242ac120002',4,'2020-12-17 13:38:05','2020-12-17 13:39:00',1,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC1239F ###</strong></em><br /><img src=\"https://d1u1p2xjjiahg3.cloudfront.net/b6f0f586-f5a6-439e-8210-1738cadb2c2d_l.jpg\" alt=\"Wanted - Der Osterhase\" /></p>\n<p style=\"text-align:center;\"><br /><br /><strong>Liebe Cachercommunitiy,</strong><br /><br />die CSW* benötigt eure <strong>HILFE</strong>!<br />Wie euch bei <a href=\"http://coord.info/GC5GXMV\">Weihnachtsbaum@night</a> aufgefallen sein sollte, gibt es im Stadtlohner Raum einen \"Verstecker\", genannt \"Osterhase\", der den Weihnachtsmann/Weichnachten gar nicht mag. Er hat unseren Cache in Gewahrsam genommen und am ehemaligen Ort ein Bekennerschreiben hinterlassen (<a href=\"http://coord.info/GLGMC6P1\">Quelle</a>).<br /><br />Der CSW* ist es nun gelungen, den Aufenthaltsort des \"Osterhasen\", wie sich der Verstecker nennte, zu finden. An oben genannter Position soll sich der \"Osterhase\" zuletzt aufgehalten haben. Neben dem Weihnachtsbaum lagert er offenbar auch viele Eier, die aus den nahliegenden Ställen \"bezieht\".<br />Um diesem Treiben ein Ende zu bereiten, bitten wir um eure <strong>HILFE</strong>. Begebt euch zu den oben genannten Koordinaten und schaut nach, ob unsere Vermutungen stimmen.<br /><br /><br /><strong>Zur Cachelocation:</strong><br />Der Cache liegt auf dem Grundstück des Restaurant \"Hundewicker Bahnhof\". Der Restaurantbesitzer (hoffentlich auch das Personal) ist über den Cache informiert. An Wochenenden oder anderen Tagen, wenn der Saal des Restaurant belegt ist, kann es sein, dass ihr bei der Suche/beim Loggen von ein \"paar\" Leuten beobachtet werden könnt. Das ist dann eben so.<br /><br /></p>\n<h1 style=\"text-align:center;\"><span style=\"color:#04b404;\">Die CSW* wünscht frohe Ostern</span></h1>',1,1,'Zum Öffnen: finde die 3 Eier<br />\r\n(Edit: ein Ei fehlt zur Zeit.-&gt; B = 3)','Finde den Osterhasen, der die CSW* bestohlen hat.'),(2,'a25f2b53-3fd9-11eb-96df-0242ac120002',4,'2020-12-17 13:45:50','2020-12-17 13:46:34',3,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC11AE0 ###</strong></em></p>\n<p>Â </p>\n<p>Im Rahmen des Projektes 12 für <a rel=\"noreferrer noopener\" href=\"http://blog.opencaching.de/2015/01/projekt-12/\" target=\"_blank\">http://blog.opencaching.de/2015/01/projekt-12/</a> wurde der nachfolgende Cache angelegt.<br /><br />\nDieser Cache zeigt die örtliche Imkerei und Schäferei. Für mich ist der Platz ein kleines Idyl. Auch der angrenzende Friedhof zeigt für mich ein Besonderheit, die ich eigentlich nur aus südlichen Ländern kenne. Regalurnengräber. Seltsam. Das hätte ich hier nicht erwartet. <br /><br />\nNutzt das â€žTorâ€œ in den Perlacher. Entdeckt selbst die Geheimnisse des schönen Mischwaldes.</p>',1,1,'Der Cache ist vom Weg aus nicht sichtbar. Orangefarbener Deckel.','Imkerei und Schäferei Taufkirchen (Projekt 12)'),(3,'30b42c64-3fde-11eb-96df-0242ac120002',4,'2020-12-17 14:18:27','2020-12-17 14:18:27',4,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC1239E ###</strong></em></p>\n<p>Â </p>\nWillkommen in der<br /><br /><h3>Töpferstadt Stadtlohn</h3>\n<br /><br /><img src=\"http://imgcdn.geocaching.com/cache/large/c4e962d2-4985-460b-bd8a-fc46996573cb.jpg\" alt=\"c4e962d2-4985-460b-bd8a-fc46996573cb.jpg\" /><p>\n<br />\nDiese Letterbox dauert 20 - 30 Minuten und soll euch das Stadtlohner Traditionshandwerk, das Töpfern, etwas näher bringen.<br /><br /><strong>Die Geschichte des Stadtlohner Töpferhandwerks:</strong><br />\nDas Töpferhandwerk hat eine lange Tradition in Stadtlohn. So wird Stadtlohn noch heute oft als â€žTöpferstadtâ€œ tituliert. Das Töpferhandwerk kam aus dem Rheinland, wahrscheinlich aus dem Raum Frechen zu Anfang des 17. Jahrhunderts nach Stadtlohn.<br /><br />\nBereits 1630 wird in einem Verzeichnis der Bürgermeister ein Heinrich von Frechen, genannt Krukenbäcker, aufgeführt. In Frechen stand die Krugfabrikation schon im 15. Jahrhundert in hoher Blüte, so dass man vermuten kann, dass dieser Heinrich von Frechen nach Stadtlohn übersiedelte und die in seiner Heimat erlernte Krukenbäckerei fortsetzte. Die Töpferei entwickelte sich zu einem florierenden Kunsthandwerk, dem die Tonvorkommen in der näheren Umgebung zugute kamen. 1812 gab es bereits vier Töpfereien mit 12 Arbeitern. Die Ware wurde auf den Märkten im Land verkauft. Außerdem gab es eine Fabrik von irdenen Tabakspfeifen mit sechs Arbeitern.<br /><br />\nAus dem Westerwald kam die Familie Gertz, die hauptsächlich Puppen- und Tierfiguren, Kruzifixe, Flöten und Nachtigallen herstellte. An den Wallfahrtstagen stellte sie ihre Ware in der Nähe der Kirche aus, um sie zu verkaufen. Beliebte Mitbringsel der Pilger zur wundertätigen Madonna waren vor allem die Nachtigallen, die mit Wasser gefüllt, Trillertöne abgaben. Mit dem Tod der Gebrüder Gertz hörte der Betrieb ihrer Öfen auf. An gleicher Stelle stand später die Töpferstube Brockhoff KG.<br /><br /></p> <img style=\"margin-right:10px;\" src=\"http://imgcdn.geocaching.com/cache/large/ca58596d-d85e-405c-855b-228930dff29a.jpg\" alt=\"ca58596d-d85e-405c-855b-228930dff29a.jpg\" width=\"300\" height=\"220\" /><img style=\"margin-right:10px;\" src=\"http://imgcdn.geocaching.com/cache/large/1038a728-863e-436f-b766-6836bb5d885f.jpg\" alt=\"1038a728-863e-436f-b766-6836bb5d885f.jpg\" width=\"300\" height=\"220\" /><p>\n<br />\nNachdem 1886 die Madonnenstatue aus der Wallfahrtskirche gestohlen wurde und damit die Prozessionen auswärtiger Wallfahrer nach Stadtlohn ausblieben, gingen die Zahlen der Töpfereien weiter zurück. Die Regierung setzte sich 1887 für die Hebung des Töpfergewerbes ein, was von den Töpfermeistern Stadtlohns begrüßt wurde. Die Förderung der Industrie bezog sich dabei auf das Anlernen neuer Formen und Verzierungen in besserer Arbeitsart und noch besserer Vorbereitung des Stoffes, auf Teilung hinsichtlich des Erzeugens der Ware und auf das Ausbilden von Besonderheiten für die einzelnen Töpfer und auf die Entwicklung eines geregelten Absatzes zu besseren Preisen.<br /><br />\n1924 gab es in Stadtlohn die Töpfereien Arnold Brockhoff, B. Erning, B.W. Erning, J.W. Erning und die Töpferei Thiry, deren Pächter G. Tenbrink war. Alle hatten ihren Standort am Eschtor. Die Ware konnte mittlerweile auch mittels der Eisenbahn transportiert werden und fand im Münsterland, dem rheinisch- westfälischen Industriebezirk, dem benachbarten Hannover und Holland guten Absatz. Die Tonerde wurde aus Lünten geholt und durch Mischung mit fettem Westerwälder Ton zum Gebrauch geeigneter gemacht. Den früher in Wenningfeld betriebenen Tonabbau hatte man aufgegeben, weil die Beseitigung des Wassers, das sich in den Gruben ansammelte, zu kostspielig wurde. Das Material wurde meist einige Monate zum Trocknen gelagert, dann mit der Potthacke zerkleinert, in Gruben mit Wasser eingeweicht und dann in der Tonmühle gemahlen und gewallt, bevor es zur Verarbeitung auf der Töpferscheibe geeignet war.<br /><br />\nDie Zahl der Töpfereien nahm im 20. Jahrhundert kontinuierlich ab. Heute gibt es in Stadtlohn nur noch die Töpferei B. Erning Söhne.Die Töpferei Erning blickt auf eine über 200 Jahre alte Geschichte zurück und führt die Tradition bis zum heutigen Tage, als einer der wenigen Töpfereien Deutschlands, weiter. Vieles wird heute noch so gemacht wie vor 200 Jahren. Die alten Töpfertechniken und Fertigkeiten von früher sind der Töpferei Erning bis heute erhalten geblieben. So fertigen sie bis zum heutigen Tage Einzelstücke mit liebevollen Details und maßgefertige Serien für Kunden in der ganzen Welt.<br /><br /></p> <img style=\"margin-right:10px;\" src=\"http://imgcdn.geocaching.com/cache/large/7325cbe2-83e7-435f-a232-889bd2e6245f.jpg\" alt=\"7325cbe2-83e7-435f-a232-889bd2e6245f.jpg\" width=\"300\" height=\"219\" /><img style=\"margin-right:10px;\" src=\"http://imgcdn.geocaching.com/cache/large/24096024-fafd-4ac9-8adc-1378125887d2.jpg\" alt=\"24096024-fafd-4ac9-8adc-1378125887d2.jpg\" width=\"300\" height=\"219\" /><p>\n<br /><strong>Zur Letterbox:</strong><br />\nAn den Startkords lernt ihr \"Jänsken te Küte\" kennen, ein Stadtlohner Original (er war übrigens exakt so groß, wie ihr ihn an Station 1 vorfindet). Den bürgerlichen Namen Johann Niehues kannte wohl kaum einer. Hier eine kleine Anekdote zu ihm:<br /><br /></p>\n<table><tbody><tr><td width=\"30\">      </td>\n<td><em>Kaum zu zählen sind die Döhnkes, die man sich von Jänsken erzählt: Einmal hatte er bei Erich Jansen in der Adler-Apotheke Kohlen hereingeschaufelt. Es war ein heißer Tag und Jänsken hatte wohl einen Schnaps verdient. Nun brauchen die Apotheker häufig lateinische Ausdrücke und er sagte zu Marianne Holtz: â€˜â€˜Geben Sie Jänsken mal einen ordentlichen Schnaps, aber mit wenig Aqua.\" Jänsken, der natürlich kein Lateiner ist, aber sprach zu Marianne: â€˜â€˜Do Du men düffdig Aqua inn, ick kannâ€™t wall verdrägenâ€™â€™</em></td>\n</tr></tbody></table><p><br />\nNun zur Aufgabe bei \"Jänsken te Küte\":<br />\nDas Final ist durch ein dreistelliges Schloss (welchen ein wenig klemmt) gesichert (ABC).<br /><br />\nA= Wieviel Knöpfe hat Jänskens Jacke?<br /><br />\nB=Welchen Bart hat Jänsken? Vollbart = 5, Schnäuzer = 6, Ziegenbart =3<br /><br />\nC=Was hat Jänsken links von sich stehen? Eimer = 2, Korb = 9, Schubkarre = 3<br /><br />\nDann macht folgenden Peilung:<br /><br />\nMesst den Stiel von Jänskens Besen und geht um die 70 fache Verlängerung in(wie alt wurde Jänsken*3-4)Grad.<br />\nDafür wäre es gut ein <strong>Maßband</strong> dabei zu haben.<br /><br />\nNun solltet ihr vor einer Kachelwand stehen, wo zwei Jahreszahlen abgebildet sind. Bildet die Quersumme beider Jahreszahlen, addiert 2 dazu,und ihr habt \"D\".<br /><br />\nDie obere Jahreszahl ist durch eine Fuge getrennt. Nehmt die dreistellige Zahl auf der einen Kachel und addiert zu dieser dreistelligen Zahl 14 und ihr habt \"E\". Peilt nun von hier \"D\" Meter in \"E\" Grad und ihr seid am Final.<br /><br />\nDa uns aufgefallen ist, dass leider einige ohne Stempel loggen ... hier nochmal der Hinweis:<br />\nIhr braucht keinen eigenen Stempel zu besitzten um den Cache zu loggen. Im Final gibt es eine Box, in der sich <strong>Materialien für euren do-it-youself-3-Minuten-Stempel</strong> für diesen Cache befinden. So könnt ihr euch euren eigenen Stempel in nullkommanichts für den Cache basteln und müsst nicht mit Figerabdruck (Figerabdruck ist immer etwas einfallslos) loggen!<br /><br /></p>\n<hr /><table style=\"table-layout:auto;\"><tbody><tr><td style=\"width:inherit;\"><img class=\"InsideTable\" src=\"http://www.geocaching.com/images/WptTypes/letter_72.gif\" alt=\"letter_72.gif\" /></td>\n<td style=\"vertical-align:middle;width:inherit;\"><em>Dieser Geocache ist ein <strong>Letterbox Hybrid</strong>.<br />\nBitte beachtet die folgenden Regeln:</em></td>\n</tr></tbody></table><ul><li>Ihr stempelt mit dem in der Letterbox liegenden Stempel in euer eigenes Stempelbuch.<br /><strong>Dieser Stempel verbleibt in der Letterbox!</strong></li>\n<li>Ihr könnt ganz normal im Logbuch loggen. Cacher, die keinen eigenen Stempel besizten, können einen minimalistischen 1-mal Stempel beim Cache selbst basteln. Die Materialien findet ihr im Cache. Finger-Stempelabdrücke finden wir recht unkreativ - also bastelt doch lieber :-).</li>\n<li>Die Dose bietet Platz für Travelbugs, Geokretys oder Coins.</li>\n</ul><p>Â </p>\n<hr /><p><br /><br />\nThanx an Hr Söbbing, vom Stadtarchiv Stadtlohn für die Hintergrundinfos, Hr. Erning, für das erstellen des Finals, Berkel_83, Team4Münsterland und Team4??? für die beiden Betatests, Emma und Finja für die farblichen Glanzpunkte im Logbuch und Marillos fürs Freimachen der Stelle.<br /><br />\nZuletzt noch die Bitte keine Bilder vom Final hochzulanden, damit die Überraschung für alle erhalten bleibt <img src=\"http://www.geocaching.com/images/icons/icon_smile.gif\" border=\"0\" alt=\"icon_smile.gif\" align=\"middle\" />.<br /><br />\nViel Spaß mit dieser Letterbox wünscht die CSW*.<br /><br /><br /></p>\n<p><a href=\"http://2014gakb.slini11.de/\"><img style=\"border:0px;\" title=\"BRONZE (Multi) - Geocaching Award Kreis Borken 2014\" src=\"http://2014gakb.slini11.de/pic/2014multibronze.png\" alt=\"BRONZE (Multi) - Geocaching Award Kreis Borken 2014\" /></a></p>\nDanke für eure Stimmen <img src=\"resource2/tinymce/plugins/emotions/img/smiley-smile.gif\" border=\"0\" alt=\":)\" width=\"18\" height=\"18\" /> !\n<p>\n<br /><a href=\"http://s08.flagcounter.com/more/wu\"><img style=\"display:none;\" src=\"http://s08.flagcounter.com/count/wu/bg_FFFFFF/txt_000000/border_CCCCCC/columns_2/maxflags_12/viewers_0/labels_0/pageviews_0/flags_0/\" border=\"0\" alt=\"Flag Counter\" /></a><br /><br /></p>',1,1,'Das Schloss am Final klemmt manchmal ein wenig...','Letterbox mit 2 Station + Final am Rande der Innennstadt'),(4,'e65d6151-3fde-11eb-96df-0242ac120002',4,'2020-12-17 14:23:31','2020-12-17 14:23:31',5,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC104DA ###</strong></em></p>\n<p>Â </p>\n<p><img src=\"https://www.slini11.de/pic/block1.png\" alt=\"block1.png\" width=\"700\" height=\"125\" /><br /><br /><img src=\"https://www.slini11.de/pic/block2.png\" alt=\"block2.png\" width=\"700\" height=\"125\" /><br /><br /><img src=\"https://www.slini11.de/pic/block3.png\" alt=\"block3.png\" width=\"700\" height=\"125\" /><br /><br /><img src=\"https://www.slini11.de/pic/block4.png\" alt=\"block4.png\" width=\"700\" height=\"125\" /><br /><br /><img src=\"https://www.slini11.de/pic/block5.png\" alt=\"block5.png\" width=\"700\" height=\"125\" /><br /><br /><a href=\"https://geocheck.org/geo_inputchkcoord.php?gid=61017514fd82b19-934f-47f2-885f-2f82d5e25e8b\"><img style=\"border-width:0px;border-style:solid;height:40px;width:150px;\" title=\"Prüfe Deine Lösung\" src=\"https://geocheck.org/geocheck_small.php?gid=61017514fd82b19-934f-47f2-885f-2f82d5e25e8b\" alt=\"GeoCheck.org\" /></a></p>',1,1,'',''),(5,'812391a4-3fdf-11eb-96df-0242ac120002',4,'2020-12-17 14:27:51','2020-12-17 14:27:51',6,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC14C8E ###</strong></em></p>\n<p>Â </p>\n<p>In der Stadt Logika der Cacheindianer, bei denen Opencaching ein Volkssport ist, gibt es einen Ur-Cache. Doch plötzlich ist er verschwunden. Die Verwirrung ist groß. Wer könnte ihn weggenommen haben? Wo könnte er sein? Welches Unglück könnte geschehen, wenn uns der Cachegott nun nicht mehr wohlgesonnen ist? Die Suche läuft in der ganzen Stadt auf Hochtouren, doch er bleibt verschwunden. Da kann nur noch die Hellseherin helfen. Diese weiß alles, was innerhalb der Stadt passiert und in der Vergangenheit passiert ist. Aber sie hat zwei Schwächen:<br /><br />\na) An manchen Tagen sagt sie konsequent immer die Wahrheit und an anderen Tagen lügt sie wider besseren Wissens immer â€“ je nachdem, mit welchem Fuß sie zuerst aufgestanden ist.<br /><br />\nb) Auf Fragen antwortet sie nur mit ja oder nein. <br /><br /><br />\nUm den Cache wiederzufinden, begibt sich ein tapferer Held zur Hellseherin und stellt ihr folgende Fragen:<br /><br />\n1. Befindet sich der Cache noch in der Stadt?<br /><br />\n2. Hast du ihn gefunden? <br /><br /><br />\nNun war dem Held sofort klar, ob der Cache noch in der Stadt ist und er macht sich auf die Suche. Weißt du, was sie ihm geantwortet hat? <br /><br />\nCache ist in der Stadt: A = 5<br /><br />\nCache ist nicht in der Stadt: A = 4<br /><br />\nHellseherin hat ihn gesehen: B = 15<br /><br />\nHellseherin hat ihn nicht gesehen: B = 25<br /><br /><br />\nSuper! Dann kannst die Koordinaten des aktuellen Lageorts mit folgender Formel ermitteln: N 47 3(3+A).(3+A)B E013 B-A*A.B*B+(A-1)*A<br /><br /><br />\nAn den angegebenen Koordinaten gibt\'s nichts zu finden. Der Ort eignet sich aber als Ausgangspunkt für die Suche.<br /><br />\nAm Final erwartet euch eine tolle Aussicht. Der Cache ist insoweit für Kinder geeignet, als der Anstieg nicht allzuweit ist und es in der Nähe des Finals etwas gibt, das Kindern gefallen könnte.<br /><br />\nViel Spaß!</p>',1,1,'Stein, s. Spoilerbild','Ein einfaches Logik-Rätsel'),(6,'f8d120d8-4039-11eb-96df-0242ac120002',4,'2020-12-18 08:23:47','2020-12-18 08:23:47',7,'DE','<div class=\"content2-container cachedesc\" style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC1491A ###</strong></em></div>\n<div class=\"content2-container cachedesc\"></div>\n<div class=\"content2-container cachedesc\"></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\">GaswerkAugsburg on Tour</span></div>\n<div class=\"content2-container cachedesc\"></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\">Ich wollte nun mal einen beweglichen Cache machen.</span></div>\n<div class=\"content2-container cachedesc\"></div>\n<div class=\"content2-container cachedesc\">\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\"><strong>Das Passwort um den Cache zu loggen ist das Nummernschild von meinem grauen Skoda Kodiaq Cachemobil, </strong></span></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\"><strong>wenn ihr mich trifft und mich danach fragt sag ich es euch auch gerne.</strong></span></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\"><strong>Bitte kein Foto von meinem Auto worauf das Kennzeichen erkennbar ist.</strong></span></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\"><strong><br /></strong></span></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\"><strong>Schreibt bitte ins Log, wo und wann ihr das Auto oder mich getroffen habt.</strong></span></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\"><strong><br /></strong></span></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\">Entweder trefft ihr mich beim Cachen oder auf einer der Events rund um Augsburg, bei denen ich immer wieder anzutreffen bin.</span></div>\n<div class=\"content2-container cachedesc\"><span style=\"font-size:medium;\">Oder ihr legt eine Dose in Augsburg und wartet, bis ich mit dem Auto komme ;-)</span></div>\n<p>Â </p>\n<p><span style=\"font-size:medium;\"><strong>Pro Cacher bitte nur ein Log</strong></span></p>\n</div>',1,1,'Wie auf dem Nummernschild ohne &quot;-&quot; und alles zusammengeschrieben und ohne Leerzeichen.<br />\r\nBuchstaben alle GROSS',''),(7,'879a1830-403a-11eb-96df-0242ac120002',4,'2020-12-18 08:27:46','2020-12-18 08:27:46',8,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC122AD ###</strong></em></p>\n<p>Â </p>\n<div style=\"border:solid 2px #5f90bb;background:#dbe6f1;color:#000000;padding:5px;text-align:justify;\"> <img style=\"float:left;\" src=\"resource2/ocstyle/images/attributes/safari.png\" alt=\"safari.png\" /><p style=\"margin-left:45px;\">Dies ist ein virtueller <a href=\"http://wiki.opencaching.de/index.php/Safari-Cache\">Safari-Cache</a>. Es ist nicht an einen festen Ort gebunden, sondern kann an verschiedenen Orten gelöst werden. Die oben angegebenen Koordinaten dienen nur als Beispiel.<br /> Weitere Caches mit dem Attribut \"Safari-Cache\" findet man mit dieser <a href=\"search.php?searchto=searchbyname&amp;showresult=1&amp;output=HTML&amp;utf8=1&amp;sort=byname&amp;cache_attribs=61\">Suche</a>.<br /> Safari-Caches und die zugehörigen Logs werden auf der <a href=\"http://www.flopp.net/safari/\">Safari-Cache-Karte</a> angezeigt.<br /> Der Cache und seine Logs werden <a href=\"http://www.flopp.net/safari/OCF858\">hier</a> angezeigt. </p>\n</div>\n<p style=\"text-align:center;\"><img style=\"vertical-align:middle;border:0;\" src=\"http://gc.clanfamily.de/oc122ad/titel.jpg\" alt=\"OC122AD Titelbild\" width=\"770\" height=\"300\" /></p>\n<p><span style=\"font-family:\'arial black\', \'avant garde\';font-size:medium;\">Freizeitpark-Safari: Junkie vs. Spass</span></p>\n<p>Urlaubszeit ist doch die schönste Zeit, auch ein langes Wochenende erfreut einen gern.</p>\n<p>Als echter Freizeit-Junkie kann keine Achterbahn hoch genug, keine Abfahrt senkrecht genug und keine Geschwindigkeit schnell genug sein. Es gibt aber auch \"Spass\"-(Bremsen), die sich lieber alles von unten anschauen und auf das Gepack aufpassen wollen.</p>\n<p>In diesem Safari-Cache geht es darum, Freizeitparks zu entdecken. Damit die \"wenigen\" Parks nicht schnell zum Ende des Caches führen, erweitern wir die Anforderungen an diesen Cache. Ihr könnt nicht nur einen Park angeben, sondern wir bitten euch - nennt uns eurer Lieblings-Fahrgeschäft oder Show oder was auch immer in diesem Freizeitpark zu finden ist. Ein Tierpark ist in diesem Sinne auch ein Freizeit-Park. Es muss natürlich kein Park betreten werden. Ein Foto mit dem Park oder Fahrgeschäft im Hintergrund ist auch ok.</p>\n<p>Macht bitte ein Foto mit Euch oder einem persönlichen Gegenstand wie GPS, Handy (gerne mit GPS Anzeige oder ähnlichem) und ladet es hoch. Bilder, die man so bei Google findet zählen nicht! Die finden wir auch <img src=\"resource2/tinymce/plugins/emotions/img/smiley-wink.gif\" border=\"0\" alt=\";)\" width=\"18\" height=\"18\" /> Damit das ganze in der Safari-Ansicht noch verknüpft werden kann, schreibt einfach die Koordinaten mit in eurer Log.</p>\n<p>Viel Spass beim Coastern!</p>\n<div style=\"border:solid 2px #5f90bb;background:#dbe6f1;color:#000000;padding:5px;text-align:justify;\">\n<p>Bitte die in der Logbedingung geforderten Koordinaten im Format \"N/S DD MM.MMM E/W DDD MM.MMM\" (z.B. \"N 48 00.000 E 008 00.000\") ins Log eintragen, damit die Positionen von der <a href=\"http://www.flopp.net/safari/\">Safari-Cache-Karte</a> korrekt erkannt und angezeigt werden können!</p>\n<p style=\"text-align:center;\"><strong><span style=\"font-size:medium;\">Der Cache und seine Logs werden <a href=\"http://www.flopp.net/safari/OC122AD\">hier</a> angezeigt.</span></strong> </p>\n</div>',1,1,'','Zeige uns Deinen Lieblingsfreizeitpark oder das beste Fahrgeschäft'),(8,'2b6c6d6f-403b-11eb-96df-0242ac120002',4,'2020-12-18 08:32:21','2020-12-18 08:55:40',9,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC138F5 ###</strong></em></p>\n<p>Â </p>\n<p><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">Na, ist das Cachemobil dreckig von der letzten Cachetour? Und kann man die ursprüngliche Lackfarbe schon nicht mehr erkennen?</span><br /><br /><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">\nDann wird es wohl wieder einmal Zeit für eine Wäsche, die ihr hier erledigen könnt! ;-) </span><br /><br /></p>\n<hr style=\"width:350px;\" /><p><br /><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">Um\n diesen Cache loggen zu können, müsst ihr ein Webcamfoto von euch vor \nOrt, mit dem GPS-Gerät in der Hand, machen und es dem Log hinzufügen. Ob\n ihr dabei mit oder ohne Cachemobil anreist und das Foto macht, bleibt \neuch überlassen. Den Link zur Webcam findet ihr hier: </span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\"><a href=\"http://www.autowaschen24.de/#webcam\">http://www.autowaschen24.de/#webcam</a></span></p>\n<p style=\"text-align:center;\">Â </p>\n<p style=\"text-align:left;\"><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">Viel Spaß!<br /></span></p>',1,1,'',''),(9,'43d578ac-403c-11eb-96df-0242ac120002',4,'2020-12-18 08:40:11','2020-12-18 08:55:40',9,'EN','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC138F5 ###</strong></em></p>\n<p>Â </p>\n<p><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">Na, is ze Cachemobil dirty from ze last Cachetour? And can man ze ursprüngliche lack color yet not more see?</span><br /><br /><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">Then be it well again time for a wash, that you here execute can! ;-) </span><br /><br /></p>\n<hr style=\"width:350px;\" /><p><br /><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">At this Cache logging can, must you a Webcam photo from you before place, with ze GPS-Gerät in ze Hand, making and it hanging on ze Log. If you thereby with or without Cachemobil arrive and ze photo make, stays you to deliver. Ze Link to ze Webcam find you here: </span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\"><a href=\"http://www.autowaschen24.de/#webcam\">http://www.autowaschen24.de/#webcam</a></span></p>\n<p style=\"text-align:center;\">Â </p>\n<p style=\"text-align:left;\"><span style=\"font-size:small;font-family:\'comic sans ms\', sans-serif;\">Much fun!<br /></span></p>',1,1,'',''),(10,'12169814-4040-11eb-96df-0242ac120002',4,'2020-12-18 09:07:26','2020-12-18 09:10:23',10,'EN','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC15BA5 ###</strong></em></p>\n<p>Â </p>\n<p><span class=\"VIiyi\" style=\"font-size:medium;\" lang=\"en\" xml:lang=\"en\"><span class=\"JLqJ4b\">This year there is again a Christmas market event at the Kurhaus.</span></span></p>\n<p><span class=\"VIiyi\" style=\"font-size:medium;\" lang=\"en\" xml:lang=\"en\"><span class=\"JLqJ4b\">In Oostende, the Christmas market is taking place in the courtyard of the Kurhaus for the 18th time this year. With this event I am happy to introduce you to this pearl among the Oostende\'s Christmas markets.</span></span></p>\n<p><span class=\"VIiyi\" style=\"font-size:medium;\" lang=\"en\" xml:lang=\"en\"><span class=\"JLqJ4b\"><span class=\"VIiyi\" style=\"font-size:medium;\" lang=\"en\" xml:lang=\"en\"><span class=\"JLqJ4b\">Oostende</span></span> merchants have a small selection from their range ready. This gives you a good overview of what you can buy in their shops (the \"Let the click in your city\" campaign can still be really lived here). In addition, craftsmen and artists offer e.g. Decorative items and nativity figurines. So you can take care of Christmas gifts at an early stage and at the same time collect an event point. Of course, there is sufficient provision for your physical well-being.</span></span></p>\n<p><span class=\"VIiyi\" style=\"font-size:medium;\" lang=\"en\" xml:lang=\"en\"><span class=\"JLqJ4b\">Since the market has long ceased to be an insider tip, the rush is correspondingly large. Therefore, the event takes place outside at the Red Fountain. The official event time is from 1:30 p.m. to 7:00 p.m., but it usually lasts longer. :)</span></span></p>\n<p>Â </p>\n<p><span class=\"VIiyi\" style=\"font-size:medium;\" lang=\"en\" xml:lang=\"en\"><span class=\"JLqJ4b\">I look forward to your numerous appearances!</span></span></p>\n<p><span class=\"VIiyi\" style=\"font-size:medium;\" lang=\"en\" xml:lang=\"en\"><span class=\"JLqJ4b\">p.s. the log password will be handed out during the event in the <strong><span style=\"text-decoration:underline;\">Kurhaus</span></strong></span></span></p>',1,1,'[Travel by public transport!]','meet, swim, eat, have fun'),(11,'57f00a4f-4041-11eb-96df-0242ac120002',4,'2020-12-18 09:16:33','2020-12-18 09:16:33',11,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OCEB44 ###</strong></em><br /><br /></p>\n<div style=\"width:670px;font-family:Arial, Helvetica, sans-serif;font-size:10pt;\">\n<div style=\"height:400px;width:670px;float:left;background:url(&quot;http://oc.clanfamily.de/oceb44/kopf.jpg&quot;) no-repeat;\"> </div>\n<div style=\"width:610px;float:left;background:url(&quot;http://oc.clanfamily.de/oceb44/content.jpg&quot;) repeat;padding:0px 30px;text-align:justify;\">\n<h1 style=\"font-size:14pt;color:#b79b4c;\">\"Unterm Zaun durch\" - ein Tornado-Jet auf abwegen</h1>\nDieser Werbeslogan des Flugzeugherstellers â€žPANAVIAâ€œ (aus den 1980er Jahren), wurde vor 25Jahren in Hünxe-Bucholtwelmen leider Realität.<br /><br />\nAm Morgen des 30.03.1987, stürzte ein Jagdbomber des Typs â€žTornadoâ€œ, der Royal Airforce, bei der Siedlung am Waldheideweg ab. Wie durch ein Wunder wurde bei diesem Flugzeugabsturz â€žnurâ€œ der Pilot und Copilot leicht verletzt.\nHeute sieht man nichts mehr von den Schäden. Bei einem Wäldchen, an der Weseler Straße kann man erkennen, dass hier â€“zwischen alten Bäumen- auch jüngere Bäume stehen. Hier ist das Flugzeug durchgepflügt. \nAm Tag des Absturzes war ich selber vor Ort, da Verwandte dort wohnen. Es sah schlimm aus. Überall Flugzeugteile, beschädigte Häuser, Soldaten der britischen Armee und Bundeswehr. Solche Bilder kannte man bisher nur aus der Presse. Nun waren diese Bilder Realität! <br /><br />\nDieser Cache ist ohne große Rätselei oder Gehirnakrobatik lösbar.<br />\nIch möchte Euch vielmehr einladen, an den einzelnen Stationen den Verlauf des Absturzes und die Ausmaße des Trümmerfeldes zeigen. Dieses Ereignis ist 25 Jahre her, manche von Euch waren damals noch nicht geboren oder noch ein Kind. Die Fotos zeigen nur einen kleinen Teil der vielen Schäden, die hier entstanden sind.<br /><br /><hr style=\"width:600px;border:2px dashed #CCB982;\" /><h1 style=\"font-size:14pt;color:#b79b4c;\">Download:</h1>\nDu brauchst natürlich die WiG Datei. Diese kannst Du direkt [<a href=\"http://oc.clanfamily.de/oceb44/wig_unterm_zaun.gwc\">hier</a>] herunterladen.\n<br /><hr style=\"width:600px;border:2px dashed #CCB982;\" /><h1 style=\"font-size:14pt;color:#b79b4c;\">Hilfe zu diesem Modus:</h1>\nEin \"WiG\" ist für viele ein unbekanntes und fremdes Gebiet - eine noch nicht erforschte Cache-Variante.\nDamit alles funktioniert versuchen wir hier kurz das Wichtistgste aufzuzählen.<br /><br /><strong>Was braucht man: einen \"Player\"</strong><br />\nEin Player ist das \"Abspielgerät\" in der man die \"Cartrigde\" läd um den WiG zu spielen... Natürlich macht das ganze nur dann Sinn wenn auch ein GPS Signal dabei verwendet werden kann.<br />\nDie uns zur Zeit bekannten Player sind:<br /><ul><li style=\"padding-left:10px;list-style-type:square;\">Garmin Oregon-Serien</li>\n<li style=\"padding-left:10px;list-style-type:square;\">Garmin Colorado-Serien</li>\n<li style=\"padding-left:10px;list-style-type:square;\">Android-Smartphones mit dem App \"Where you go\" [<a href=\"https://play.google.com/store/apps/details?id=menion.android.whereyougo&amp;hl=de\">Download</a>]</li>\n<li style=\"padding-left:10px;list-style-type:square;\">iPhone\'s mit dem App \"Pi-Go\" [<a href=\"http://itunes.apple.com/de/app/wherigo/id385035547?mt=8\">Download</a>]</li>\n<li style=\"padding-left:10px;list-style-type:square;\">Windows Pocket-PCs mit Windows Mobile und dem passenden App [<a href=\"http://www.wherigo.com/player/download.aspx\">Download</a>]</li>\n</ul><br />\nUm diesen Cache nun begehen zu können, solltest Du einen Player haben und die WiG-Datei (Cartdridge) vorher runterladen und auf Deinem Gerät gespeichert haben. Als nächstes fährtst Du das angegebene Zielgebiet an. Starte dann die WiG-Datei. Folge dem Spielverlauf. Am Ende steht ein \"Freischalt-Code\" zur Verfügung, mit dem Du \"loggen\" kannst.<br />\nDie von Clanfamily programmierten WiG Caches sind immer so konzepiert, dass bei Abschluss eines wichtigen Schritts gespeichert wird. Stürzt Dein Player ab oder geben die Akkus auf, kein Problem. Starte am letzten Speicherpunkt.<br />\nFür Fragen und Anregungen triggert uns doch einfach an: gc@clanfamily.de<br />\nJetzt aber VIEL SPASS!</div>\n<div style=\"height:200px;width:670px;background:url(&quot;http://oc.clanfamily.de/oceb44/footer.jpg&quot;) no-repeat;float:left;padding-left:30px;padding-top:60px;font-size:8pt;\">\nDesign Â© Clanfamily.de<br />\nDie Verantwortung für die Ausführung des GeoCache übernimmt der Cacher selbst.<br />\nWir bitten euch: schont die Natur, wie auch wir dies beim legen unseres Cache berücksichtigt haben.</div>\n</div>',1,1,'Lade zu erst die Cartridge herunter!!<br />\r\nFinale - Spoilerfoto beachten. Links davon. Achte auf &quot;Killerameisen&quot;.','Where I Go mit kleiner Zeitgeschichte.'),(12,'3bcb07c7-4042-11eb-96df-0242ac120002',4,'2020-12-18 09:22:55','2020-12-18 09:22:55',12,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OCF1D7 ###</strong></em><br /><br /></p>\n<div class=\"UserSuppliedContent\">\n<div style=\"width:670px;height:inherit;\">\n<div style=\"width:650px;font-family:\'Comic Sans MS\', Verdana, Tahoma, Arial;text-align:left;\"><span><img style=\"border:0px solid #333;float:right;margin:45px 0 10px 10px;\" title=\"Borken Logo\" src=\"http://imgcdn.geocaching.com/cache/large/9269f843-69a9-4d96-9c94-d1e657d3caca.png?rnd=0.4573786\" alt=\"Steg am Aasee\" width=\"207\" height=\"234\" /></span>\n<p><span><span style=\"font-size:20px;\"><strong>Hallo Geocacher,</strong></span><br /><br /><span style=\"font-size:16px;\">es ist wieder soweit: Zum zweiten mal findet der Geocaching Award nun schon im Kreis Borken statt und besitzt jetzt erstmals auch einen eigenen Cache - ein verkehrsgünstig gelegenes TB-Hotel in der Mitte des Kreises.<br /><br />\nDaher sollen auch wieder die besten Caches des vergangenen Jahres 2013 in unserer Homezone mit dem â€žGeocache Award Kreis Borkenâ€œ prämiert werden. Wie im vergangenen Jahr gibt es getrennte Kategorien: Traditional Caches, Multi Caches und Mystery Caches. Abgestimmt werden kann vom 1. Februar - 31. März. Es kommt also wieder auf eure Stimme an!</span></span></p>\n<br /><p><span style=\"font-size:24px;\"><strong>Gewählt wird unter <a href=\"http://2013gakb.slini11.de\">http://2013gakb.slini11.de</a></strong></span></p>\n<span style=\"font-size:16px;\">Zum Cache:<br />\nBitte lauft via. WP 1 zum Cache und NICHT querfeldein. Sonst entsteht dort Zudem behandelt den Cache bitte sorgfältig und rüttelt NICHT an ihm herum ! Beachtet bitte auch, dass das Schloss manchmal ein wenig klemmt.<br /><br />Ich habe das Listing(GC4D2H1) an sich bei GCcom archiviert aber der gleiche Cache wird nun unter einem neuen Listing unter GC6AMMK ( GAKB - The Lost Hotel ) weitergeführt. Daher kann man hier gerne loggen, wenn GC6AMMK gefunden wurde.<br /><br /></span>\n<p style=\"text-align:center;\"><span style=\"font-size:16px;\">Viel Spaß beim Wählen &amp; Finden wünschen euch die</span></p>\n<p style=\"text-align:center;font-size:20px;\"><span style=\"font-size:16px;\"><strong>Geocacher des Kreies Borken <img src=\"http://www.geocaching.com/images/icons/icon_smile_big.gif\" border=\"0\" alt=\"icon_smile_big.gif\" align=\"middle\" /></strong></span></p>\n</div>\n</div>\n<hr /><div style=\"text-align:center;width:670px;height:inherit;\"><span style=\"font-size:16px;\"><span style=\"font-size:16px;\"><span style=\"font-size:16px;\"><strong><img src=\"http://imgcdn.geocaching.com/cache/large/f2aa3e34-b0e8-45ea-b702-d8ade1d218e3.png?rnd=0.540646\" alt=\"f2aa3e34-b0e8-45ea-b702-d8ade1d218e3.png\" /></strong></span></span></span></div>\n</div>',1,1,'',''),(13,'177b3f31-4043-11eb-96df-0242ac120002',4,'2020-12-18 09:29:04','2020-12-18 09:29:04',13,'EN','<p style=\"text-align:center;\"><strong><em>### Dieser Testcache basiert auf OC13E39 ###</em></strong><br /><br /></p>\n<div class=\"content2-container cachedesc\">\n<p><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\">In\n the Garden of Rememberance is a plaque remembering Ted Prior who was a \nscoutmaster at the Henley scout troop in the 1980\'s. In Scouting the \nadults take on a \"Scout name\" which is used to reduce the formality for \nthe scouts. Ted Prior\'s scout name was \"<strong>Shrike</strong>\"<br /></span></p>\n<p>Â </p>\n<p><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\">There is onle little mistake on the plaque...<br />The name of Ted\'s house was \"Shrikes Loft\" (from his Scouting name) and not Squire\'s loft!</span></p>\n<p><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\"><br /></span></p>\n<p><span style=\"font-family:arial, helvetica, sans-serif;\"><strong><span style=\"font-size:large;\">Scouting</span></strong></span></p>\n<p><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\">Scouts\n is an organisation for the development of the youth and geocaching is a\n hobby well suited to cubs and scouts because it involves some important\n life skills:</span></p>\n<ul><li><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\"><strong>Mapwork</strong> - developing your geospacial skills and sense of direction - still needed even in the days of GPS,</span></li>\n<li><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\"><strong>Observation</strong> - good geocachers have keen observation skills and are able to spotsomething that is a little out of order,</span></li>\n<li><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\"><strong>Outdoors</strong> - Getting up and out! There is nothing better to do to prevent boredom... get outdoors!</span></li>\n<li><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\"><strong>Challenge</strong> - You learn best when we are forced to think.</span></li>\n</ul><p>Â </p>\n<p><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\">To record this cache you need to find a password on the plaque.The password is the <strong><em>year that Ted and June were married</em></strong>?</span></p>\n<p><span style=\"font-size:medium;font-family:arial, helvetica, sans-serif;\">Take some time to walk around the spiral and read of the people who have lived and built Henley.</span></p>\n</div>',1,1,'Cache is magnetic at waist height.','Remembering Shrike - a scoutmaster'),(14,'5f3d6ae3-4045-11eb-96df-0242ac120002',4,'2020-12-18 09:45:23','2020-12-18 09:45:23',14,'EN','<p style=\"text-align:center;\"><em><strong>### Dieser Testcachebasiert auf OC135D1 ###</strong></em><br /><br /></p>\n<table><tbody><tr><td valign=\"middle\"><img src=\"https://s3.amazonaws.com/gs-geo-images/ef199d9b-4af6-4378-8089-190f3d1cd6e3_l.png\" alt=\"ef199d9b-4af6-4378-8089-190f3d1cd6e3_l.p\" width=\"80\" /></td>\n<td>  </td>\n<td>Als alljährliches CSW*-Weihnachtsprojekt ist dieser Multi in diesem Jahr für das <strong><a href=\"https://opencaching.de/OC1346E\">8-te Ad(E)vent</a> (Samstag, 10. Dezember ab 16 Uhr)</strong> entstanden. Es bietet sich also an den Cache während des Ad(E)vents zu suchen, da dieser an der diesjährigen Event-Location startet <img src=\"images/icons/icon_smile.gif\" border=\"0\" alt=\"icon_smile.gif\" align=\"middle\" />. Daher können für den 10. Dezember keine Termine gebucht werden!</td>\n</tr></tbody></table><p>Â </p>\n<p><span style=\"color:#ff0000;\">Bitte tragt euch in den Kalender ein. Das ist mit dem Grundstückseigentümer &amp; Jagdpächter so vereinbart. Und die wohnen an der Runde! Also haltet euch bitte an die Startzeiten, damit der Cache lang leben kann! Leuchtet bitte außerdem nicht in die Häuser/Fenster (bei einem anderen NC haben sich Anwohner schonmal beschwert)!<br /><br /><a rel=\"noreferrer noopener\" href=\"http://www.gocaching.de/calendar.php?book=60E\" target=\"_blank\"><img src=\"https://www.gocaching.de/calendar.php?cid=60E\" border=\"0\" alt=\"calendar.php?cid=60E\" /></a></span></p>\n<p>\n<strong>Story:</strong></p>\n<p>â€žPengâ€œ â€“ laut war der Knall über der Kleinstadt Gescher im westlichen Münsterland zu hören. Doch was war das? Ein Jäger im Wald? Oder doch ein Autounfall? Aber welcher Autounfall war denn so laut? Die Bewohner der Kleinstadt mögen an diesem Winterlichen Abend vielleicht unterschiedliche Vermutung gehabt haben. Ein Autounfall wäre gut möglich gewesen, konnte man doch durch den starken Schneefall fast gar nichts sehen. Doch keine der Vermutungen kam auch nur annähernd an die Realität heran. Im Gegensatz zu ihnen wusste der Flugkontrollwichtel auf dem Grundstück des Weihnachtsmanns besser Bescheid. Die kleine Weihnachtsbaumkugel neben dem Modellschlitten am Weihnachtsbaum leuchtete rot auf! Der Weihnachtsmann musste unterwegs mit dem Schlitten einen Unfall gehabt haben!</p>\n<p><img src=\"https://s3.amazonaws.com/gs-geo-images/95baab49-3635-44d8-9973-8ad9fe44d0f9_l.jpg\" alt=\"95baab49-3635-44d8-9973-8ad9fe44d0f9_l.j\" /></p>\n<p>Und genau so war es auch. Im Moment nach dem lauten Knall schlitterte der Schlitten in der Luft herum und der Weihnachtsmann hatte Mühe die Rentiere wieder in die richtige Bahn zu lenken um nicht abzustürzen. Doch was war passiert? Durch das stürmische Schneewetter über Gescher war der Weihnachtsmann bei geringer Sichtweite in eine zu schnell Wolke geflogen und als er diese gerade wieder verließ, stieß der Schlitten mit dem Stern GelbusSpekulatius Alpha (dem Bruder von GelbusSpekulatius Beta) zusammen. Der Stern fluchte im ersten Moment des Schocks, fing dann aber an zu weinen und stürzte den Himmel hinunter Richtung Gescher. Der Weihnachtsmann, sichtlich geschockt, war mit den Rentieren und seinem Schlitten durchgeschüttelt worden und hatte tatsächlich einen Stern gerammt und Geschenke verloren! Geschenke, auf die die Kinder so sehnlich warteten waren einfach weg â€“ ein Albtraum für den Weihnachtsmann. Außerdem kannte er den Bruder des Sternes sehr gut. Das würde doppelten Ärger geben!</p>\n<p><img src=\"https://s3.amazonaws.com/gs-geo-images/18c1262f-261f-4026-b513-cbc8711ec77e_l.jpg\" alt=\"18c1262f-261f-4026-b513-cbc8711ec77e_l.j\" /></p>\n<p>Bereits im letzten Jahr habt ihr dem Weihnachtsmann als Weihnachtsaushilfswichtel tatkräftig unter die Arme gegriffen. Auch in diesem Jahr benötigen die Wichtel und der Weihnachtsmann dringend eure Hilfe. Sie selbst sind viel zu sehr mit den Vorbereitungen für Weihnachten beschäftigt und haben daher keine Zeit nach den verloren gegangenen Geschenken zu suchen. Würdet ihr die Aufgabe nochmal übernehmen? Der erste Anhaltpunkt sollte die Absturzstelle von GelbusSpekulatius Alpha sein. Er muss irgendwo nord-westlich von Gescher gelandet sein. Wenn ihr ihn trefft, seid doch bitte so lieb, tröstet ihn und bittet im Namen des Weihnachtsmanns um Entschuldigung. Es sei keine Absicht gewesen und er habe es sehr eilig gehabt. Außerdem würde er den Stern gerne zu einem Versöhnungskakao einladen. So, nun aber los!</p>\n<p>Wenn Ihr GelbusSpekulatius Alpha getroffen habt, folgt weiter den Sternen am Himmelszelt. Die unterschiedlichen Farben der Sterne zeigen euch wohin es geht und wo ihr die Geschenke findet:</p>\n<table align=\"center\"><tbody><tr><td colspan=\"2\" align=\"center\"><img src=\"https://s3.amazonaws.com/gs-geo-images/77f56c49-4d46-485f-a5b4-f15d98046b21_l.jpg\" alt=\"77f56c49-4d46-485f-a5b4-f15d98046b21_l.j\" width=\"100\" height=\"100\" /></td>\n<td valign=\"middle\">Die weißen Sterne weisen den Weg.</td>\n</tr><tr><td colspan=\"2\" align=\"center\"><img src=\"https://s3.amazonaws.com/gs-geo-images/c5597442-5102-46fd-8d7a-f9f7707cbbf0_l.png\" alt=\"c5597442-5102-46fd-8d7a-f9f7707cbbf0_l.p\" width=\"100\" height=\"100\" /></td>\n<td valign=\"middle\">Bei einem roten Stern solltet ihr nach noch einem roten oder einem grünen Stern umsehen.</td>\n</tr><tr><td><img src=\"https://s3.amazonaws.com/gs-geo-images/c5597442-5102-46fd-8d7a-f9f7707cbbf0_l.png\" alt=\"c5597442-5102-46fd-8d7a-f9f7707cbbf0_l.p\" width=\"100\" height=\"100\" /></td>\n<td><img src=\"https://s3.amazonaws.com/gs-geo-images/c5597442-5102-46fd-8d7a-f9f7707cbbf0_l.png\" alt=\"c5597442-5102-46fd-8d7a-f9f7707cbbf0_l.p\" width=\"100\" height=\"100\" /></td>\n<td valign=\"middle\">Zwei rote Sterne signalisieren, dass ihr hier ein Geschenk oder alte Bekannte trefft, die euch womöglich weiter helfen.</td>\n</tr></tbody></table><p>Bei diesem Multi handelt es sich um einen Nachtcache mit 6 Stationen + Final, der vor allem für Kinder geeignet ist und etwa 60 Minuten beansprucht (ohne Kinder vielleicht auch etwas kürzer). Habt ihr alle Geschenke gefunden, begebt euch zum Schlitten des Weihnachtsmannes und gebt die Geschenke bei ihm ab. Eure Ausrüstung sollte eine Taschenlampe, einen (starken) Magneten und eine UV-Lampe (wenn Station 3 nicht will) umfassen. Beachtet bitte die Beschreibung zu den Webpunkten unten im Listing, da dort oder an der Station erklärt wird, was zu tun ist.</p>\n<p>Vielen Dank auch an Christina (Slinis Schwester) für die Bilder im Listing und Finja(Pathfinders Tochter) für Station 1.</p>\n<p>\n<br /><a rel=\"noreferrer noopener\" href=\"http://www.gocaching.de/calendar.php?book=60E\" target=\"_blank\"><img src=\"https://www.gocaching.de/calendar.php?cid=60E\" border=\"0\" alt=\"calendar.php?cid=60E\" /></a></p>\n<p>Die CSW* wünscht allen Cachern viel Erfolg bei der Suche eine schöne <a href=\"http://opencaching.de/OC1346E\">Ad(E)vent</a>szeit, frohe Weihnachten und einen guten Rutsch in\'s neue Jahr!</p>\n<p><img src=\"https://s3.amazonaws.com/gs-geo-images/5884a226-5c34-4c85-8c63-407cff39a745_l.png\" alt=\"5884a226-5c34-4c85-8c63-407cff39a745_l.p\" width=\"100\" /></p>\n<p>\n<br /><br /></p>\n<table><tbody><tr><td><strong>S1: Absturzstelle GelbusSpekulatius Alpha (N 65Â° 36.772 E 168Â° 05.392)</strong></td>\n</tr><tr><td>Hier findet ihr GelbusSpekulatius Alpha. Er wird euch sicherlich gegen eine Entschuldigung für den Unfall einen Hinweis (eine Ziffer) für \"S1\" geben. Mehr wird hier nicht benötigt und es kann auch schon weiter gehen.<br /><br /></td>\n<td>Â </td>\n</tr><tr><td><strong>S2: Das erste Geschenk</strong></td>\n</tr><tr><td>Hier muss irgendwo das erste Geschenk gelandet sein. Ganz wichtig: Geschenk Nicht! öffnen, sondern schütteln und hören. Beachtet dabei bitte die beigelegte Stationsbeschreibung.<br /><br /></td>\n</tr><tr><td><strong>S3: Außenstation der Wichtel</strong></td>\n</tr><tr><td>Die Wichtel haben überall Außenstationen im ganzen Land um die Weihnachtsmann bei seiner Aufgabe zu unterstützen. Sie können dir sicherlich auch einen Hinweis (eine Ziffer) für \"S3\" geben (wenn es nicht funktioniert: UV).<br /><br /></td>\n</tr><tr><td><strong>S4: Das zweite Geschenk</strong></td>\n</tr><tr><td>In unmittelbarer Nähe muss Geschenk zwei gelandet sein. Auch hier gilt wieder: Geschenk nicht öffnen und nur hören! Die Anweisungen gab es ja bereits an Station 2. <br /><br /></td>\n</tr><tr><td><strong>S5: Das dritte Geschenk</strong></td>\n</tr><tr><td>Ah, dort muss das letzte Geschenk gelandet sein. Als guter Aushilfswichtel sollte das Erhören des Inhalts mittlerweile kein Problem sein. Nun aber auf weiter zur letzten Station. Achtet bitte darauf NICHT auf den Hof des Bauern zu laufen sondern an der Y-Kreuzung links anzubiegen! <br /><br /></td>\n</tr><tr><td><strong>S6: Zu Besuch auf Olis Wiese</strong></td>\n</tr><tr><td>Hier trefft ihr einen alten Bekannten wieder: Oli, das Schaf. Allerdings ist er bei der Futterwahl etwas verunsichert. Vielleicht könnt ihr Ihm helfen um so den Hinweis (eine Ziffer) für \"S6\" zu erhalten. Außerdem findet ihr in seinem Keller die Formel fürs Final. <br /><br /></td>\n</tr><tr><td><strong>Final: Geschenkabgabe beim Weihnachtsmann</strong></td>\n</tr><tr><td>Gebt hier beim Weihnachtsmann die Geschenke ab und tragt euch als Dankeschön in Weihnachtsbuch ein. </td>\n</tr></tbody></table><p>Das Logpasswort lautet: <strong>ALASKA</strong></p>',1,1,'Station 1: Notiert die blaue Zahl. Mehr müsst ihr hier nicht machen.<br />\r\nStation 6: In Olis Keller findet ihr Anweisungen für die Station sowie die Formel fürs Final<br />\r\nFinalformel: Quersumme der letzten VIER Ziffern Nord: 20, Ost: 18',''),(15,'63a95de6-4047-11eb-96df-0242ac120002',4,'2020-12-18 09:59:49','2020-12-18 10:04:06',15,'RU','<p style=\"text-align:center;\"><span style=\"font-size:small;\"><em><strong>### Dieser Testcache basiert auf OCEE9C ###</strong></em></span></p>\n<p>Â </p>\n<p>In diesem WO BIN ICH dreht sich alles um dieses Objekt hier:<br /><img src=\"http://www.clanfamily.de/gc/GC3A735/wobinich.jpg\" alt=\"wobinich.jpg\" /><br /><br />\nDamit wir nicht einfach eine Dose im Vorgarten vergraben müssen, machen \nwir daraus einen Kurz-Multi. Um das Logbuch zu finden - findet zunächst \ndas gesuchte Objekt. Stellt euch am Zaun davor und Peilt auf 350Â° - \n230m.<br /><br />\nNun haben wir selber mal bei anderen Caches dieser Art festgestellt, \ndass man als Ortsunkundiger schnell ein Problem hat, gerade was solche \nObjekte angeht. Wir haben uns deshalb überlegt, dass wir ein \nYouTube-Video als Spoiler zur Verfügung stellen. Doch einfach so dahin \nklatschen wollen wir Euch das Video nun auch nicht. Also... Wissen ist \nMacht - nichts Wissen; macht nichts... und wer nichts Weiß muss manchmal\n einen etwas längeren Weg zum Erfolg gehen.<br /><br />\nUpdates:\n</p>\n<ul><li>18.05.2013 Neue Final-KO</li>\n</ul><p>\n</p><hr style=\"width:100%;\" /><p><em>\"kaputte Zeichenkodierungen sind doof..\"</em></p>\n<p>Â </p>\n<p><span class=\"VIiyi\" style=\"font-size:small;\" lang=\"ru\" xml:lang=\"ru\"><span class=\"JLqJ4b ChMk0b\">Ð’ ÑÑ‚Ð¾Ð¼ WHERE AM I Ð²ÑÐµ Ð²Ñ€Ð°Ñ‰Ð°ÐµÑ‚ÑÑ Ð²Ð¾ÐºÑ€ÑƒÐ³ ÑÑ‚Ð¾Ð³Ð¾ Ð¾Ð±ÑŠÐµÐºÑ‚Ð°:</span><span class=\"JLqJ4b\">\n</span><span class=\"JLqJ4b ChMk0b\">wobinich.jpg</span><span class=\"JLqJ4b\"><br /><br /></span><span class=\"JLqJ4b ChMk0b\">Ð§Ñ‚Ð¾Ð±Ñ‹ Ð±Ð°Ð½ÐºÑƒ Ð¿Ñ€Ð¾ÑÑ‚Ð¾ Ð½Ðµ Ð·Ð°ÐºÐ°Ð¿Ñ‹Ð²Ð°Ñ‚ÑŒ Ð²Ð¾ Ð´Ð²Ð¾Ñ€Ðµ, Ð¼Ñ‹ Ð´ÐµÐ»Ð°ÐµÐ¼ Ð¸Ð· Ð½ÐµÐµ ÐºÐ¾Ñ€Ð¾Ñ‚ÐµÐ½ÑŒÐºÑƒÑŽ Ð¼ÑƒÐ»ÑŒÑ‚Ð¸Ð²Ð°Ñ€ÐºÑƒ.</span> <span class=\"JLqJ4b ChMk0b\">Ð§Ñ‚Ð¾Ð±Ñ‹ Ð½Ð°Ð¹Ñ‚Ð¸ Ð±Ð¾Ñ€Ñ‚Ð¾Ð²Ð¾Ð¹ Ð¶ÑƒÑ€Ð½Ð°Ð» - ÑÐ½Ð°Ñ‡Ð°Ð»Ð° Ð½Ð°Ð¹Ð´Ð¸Ñ‚Ðµ Ð¾Ð±ÑŠÐµÐºÑ‚, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ð¹ Ð¸Ñ‰ÐµÑ‚Ðµ.</span> <span class=\"JLqJ4b ChMk0b\">Ð’ÑÑ‚Ð°Ð½ÑŒÑ‚Ðµ Ñƒ Ð·Ð°Ð±Ð¾Ñ€Ð° Ð¿ÐµÑ€ÐµÐ´ Ð½Ð¸Ð¼ Ð¸ Ð¿Ñ€Ð¸Ñ†ÐµÐ»Ð¸Ñ‚ÐµÑÑŒ Ð½Ð° ÑƒÐ³Ð¾Ð» 350 Â° - 230Ð¼.</span><br /><br /><span class=\"JLqJ4b\">\n</span><span class=\"JLqJ4b ChMk0b\">Ð¢ÐµÐ¿ÐµÑ€ÑŒ Ð¼Ñ‹ Ð¾Ð±Ð½Ð°Ñ€ÑƒÐ¶Ð¸Ð»Ð¸, Ñ‡Ñ‚Ð¾ Ñƒ Ð½Ð°Ñ ÐµÑÑ‚ÑŒ Ð´Ñ€ÑƒÐ³Ð¸Ðµ ÐºÐµÑˆÐ¸ ÑÑ‚Ð¾Ð³Ð¾ Ñ‚Ð¸Ð¿Ð°, Ð¸ ÐµÑÐ»Ð¸ Ð²Ñ‹ Ð½Ðµ Ð·Ð½Ð°ÐµÑ‚Ðµ Ð¸Ñ… Ð¼ÐµÑÑ‚Ð¾Ð¿Ð¾Ð»Ð¾Ð¶ÐµÐ½Ð¸Ðµ, Ñƒ Ð²Ð°Ñ Ð±Ñ‹ÑÑ‚Ñ€Ð¾ Ð²Ð¾Ð·Ð½Ð¸ÐºÐ°ÐµÑ‚ Ð¿Ñ€Ð¾Ð±Ð»ÐµÐ¼Ð°, Ð¾ÑÐ¾Ð±ÐµÐ½Ð½Ð¾ ÐºÐ¾Ð³Ð´Ð° Ð´ÐµÐ»Ð¾ ÐºÐ°ÑÐ°ÐµÑ‚ÑÑ Ñ‚Ð°ÐºÐ¸Ñ… Ð¾Ð±ÑŠÐµÐºÑ‚Ð¾Ð².</span> <span class=\"JLqJ4b ChMk0b\">ÐŸÐ¾ÑÑ‚Ð¾Ð¼Ñƒ Ð¼Ñ‹ Ñ€ÐµÑˆÐ¸Ð»Ð¸ ÑÐ´ÐµÐ»Ð°Ñ‚ÑŒ Ð²Ð¸Ð´ÐµÐ¾ Ñ YouTube Ð² ÐºÐ°Ñ‡ÐµÑÑ‚Ð²Ðµ ÑÐ¿Ð¾Ð¹Ð»ÐµÑ€Ð°.</span> <span class=\"JLqJ4b ChMk0b\">ÐÐ¾ Ð¼Ñ‹ Ð½Ðµ Ñ…Ð¾Ñ‚Ð¸Ð¼ Ð¸ Ð²Ð°Ð¼ Ð°Ð¿Ð»Ð¾Ð´Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ð²Ð¸Ð´ÐµÐ¾.</span> <span class=\"JLqJ4b ChMk0b\">Ð˜Ñ‚Ð°Ðº ... Ð·Ð½Ð°Ð½Ð¸Ðµ - ÑÐ¸Ð»Ð° - Ð½Ð¸Ñ‡ÐµÐ³Ð¾ Ð½Ðµ Ð·Ð½Ð°Ð½Ð¸Ðµ;</span> <span class=\"JLqJ4b ChMk0b\">Ð½Ðµ Ð¸Ð¼ÐµÐµÑ‚ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ñ ... Ð° ÐµÑÐ»Ð¸ Ð²Ñ‹ Ð½Ð¸Ñ‡ÐµÐ³Ð¾ Ð½Ðµ Ð·Ð½Ð°ÐµÑ‚Ðµ, Ð²Ð°Ð¼ Ð¸Ð½Ð¾Ð³Ð´Ð° Ð¿Ñ€Ð¸Ð´ÐµÑ‚ÑÑ Ð¿Ñ€Ð¾Ð¹Ñ‚Ð¸ Ð±Ð¾Ð»ÐµÐµ Ð´Ð»Ð¸Ð½Ð½Ñ‹Ð¹ Ð¿ÑƒÑ‚ÑŒ Ðº ÑƒÑÐ¿ÐµÑ…Ñƒ.</span><span class=\"JLqJ4b\"><br /><br /></span><span class=\"JLqJ4b ChMk0b\">ÐžÐ±Ð½Ð¾Ð²Ð»ÐµÐ½Ð¸Ñ:</span><span class=\"JLqJ4b\">Â </span></span></p>\n<ul><li><span class=\"VIiyi\" style=\"font-size:small;\" lang=\"ru\" xml:lang=\"ru\"><span class=\"JLqJ4b ChMk0b\">18 Ð¼Ð°Ñ 2013 Ð³. ÐÐ¾Ð²Ñ‹Ð¹ Ð½Ð¾ÐºÐ°ÑƒÑ‚-Ñ„Ð¸Ð½Ð°Ð»</span></span></li>\n</ul>',1,1,'YouTube Link: http://youtu.be/lxzMGmK-CrM<br />\r\nÐ¡ÑÑ‹Ð»ÐºÐ° Ð½Ð° YouTube: http://youtu.be/lxzMGmK-CrM',''),(16,'3c80a890-4049-11eb-96df-0242ac120002',4,'2020-12-18 10:13:03','2020-12-18 10:13:03',16,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC14E3B ###</strong></em><br /><br /></p>\n<p style=\"text-align:justify;\">Dieser Cache ist auf einer anderen Plattform im Zuge des Fördesteigs gepublisht, aber ich möchte ihn der Opencaching-Community nicht vorenthalten - gerade weil das Fördesteigprojekt hier nicht unbedingt so begeistert aufgenommen wurde. Aber das soll nur am Rande erwähnt bleiben und uns nicht länger aufhalten. Hier kommt nun ein Physik-Cache hin!</p>\n<p style=\"text-align:justify;\">Â </p>\n<p style=\"text-align:center;\"><img src=\"http://www.gchn.de/Daten/allgemein/GCHN_Logos/GCHN_Logo_120.jpg\" alt=\"\" width=\"120\" height=\"141\" /></p>\n<p style=\"text-align:center;\">Â </p>\n<p style=\"text-align:justify;\">Der Cache an sich steht so an den angegebenen Koordinaten und ist so vom Grundstückseigentümer abgesegnet. Aber um ans Logbuch zu gelangen müsst ihr hier die astronomisch schweren Aufgaben lösen!</p>\n<p style=\"text-align:justify;\">Â </p>\n<p style=\"text-align:justify;\">1. Wie viele Planeten gibt es nach alter Zählweise in unserem Sonnensystem?</p>\n<p style=\"text-align:justify;\">2. Wie viele Apollomissionen landeten auf dem Mond? - 1</p>\n<p style=\"text-align:justify;\">3. Wie viele AE (Astronomische Einheiten) ist die Erde im Mittel von der Sonne entfernt?</p>\n<p style=\"text-align:justify;\">Â </p>\n<p style=\"text-align:justify;\">Mit diesem Wissen werdet ihr vor Ort dann auch ans Logbuch gelangen! Viel Spaß!</p>\n<p>Â </p>\n<p><img style=\"display:block;margin-left:auto;margin-right:auto;\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Moon_Sketch_vector.svg/2000px-Moon_Sketch_vector.svg.png\" alt=\"\" width=\"200\" height=\"200\" /></p>',1,1,'','Ein kleiner interstellarer Cache in Glücksburg...'),(17,'bf7a6b55-4049-11eb-96df-0242ac120002',4,'2020-12-18 10:16:42','2020-12-18 10:16:42',17,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC12E53 ###</strong></em><br /><br /></p>\n<table style=\"background-color:#b8e4e9;\" border=\"1\" cellpadding=\"1\" align=\"center\"><tbody><tr><td>\n<span style=\"font-size:small;\"><img style=\"float:left;\" src=\"resource2/ocstyle/images/attributes/moving.png\" border=\"0\" alt=\"\" width=\"52\" height=\"49\" /> Bewegliche Caches gibt es nur bei Opencaching. Sie können nicht nur \ngesucht und geloggt, sondern danach auch mitgenommen und an einem \nanderen Ort wieder versteckt werden. (Natürlich kann man sie aber auch \neinfach nur finden, loggen und am gleichen Ort wiederverstecken.)\n</span>\n</td>\n</tr></tbody></table><p>Â </p>\n<p><span style=\"font-size:small;\"><strong>Die Wanderdose ist ein beweglicher Cache, der schöne Spazierwege im Münchner Umland (S-Bahn-Bereich) zeigen soll. </strong></span></p>\n<p><span style=\"font-size:small;\"><strong>Damit die Wanderdose möglichst weit herum kommt wäre es schön, wenn sie ein Stück mit Dir reisen dürfte:</strong></span></p>\n<ul><li><span style=\"font-size:small;\">Suche den Cache an den angegebenen Koordinaten und logge ihn online als Fund. <em><br />(Eine kleine Anmerkung wann es weitergehen soll wäre super.) </em></span></li>\n<li><span style=\"font-size:small;\">Suche ein neues Versteck für die Dose in der Nähe eines Spazierweges im Münchner Umland und deponiere sie dort. <em><br />(Vergiss nicht, Dir die Koordinaten zu notieren!) </em></span></li>\n<li><span style=\"font-size:small;\">Schreibe online eine Notiz mit den neuen Koordinaten. <em><br />(Ein Hinweis zum neuen Versteck oder falls sich die D-/T-Wertung geändert hat wäre ggf. auch praktisch.)   <br /></em></span></li>\n</ul><p>Â </p>\n<p><span style=\"font-size:small;\"><img style=\"vertical-align:middle;display:block;margin-left:auto;margin-right:auto;\" src=\"images/uploads/B7071215-110D-11E6-9D14-0A81D9C03CF3.jpg\" alt=\"Otterfing\" width=\"439\" height=\"246\" /></span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\"><strong>Reiseverlauf:</strong></span><br /><span style=\"font-size:small;\">\nStart - Otterfing: N 47Â° 54.165  E 011Â° 41.539 </span><br /><span style=\"font-size:small;\">\n1. Station - Markt Schwaben: N 48Â° 11.524  E 011Â° 53.232 <em>(Danke an Biman!)</em></span><br /><span style=\"font-size:small;\">\n2. Station - Unterschleißheim: N 48Â° 16.002 E 011Â° 33.963 <em>(Danke an habined1!)</em></span><br /><span style=\"font-size:small;\">\n3. Station - Siegertsbrunn: N 48Â° 00.679 E 011Â° 44.005 <em>(Danke an Eddiemuc!)</em></span><br /><span style=\"font-size:small;\">\n4. Station - Grünwalder Forst: N 48Â° 01.418 E 011Â° 31.471 <em>(Danke an Schatzforscher!)</em></span><br /><span style=\"font-size:small;\">\n5. Station - Gröbenzell: N 48Â° 12.228 E 011Â° 21.802 <em style=\"letter-spacing:0px;\">(Danke an bear2006!)</em></span><span style=\"font-size:small;\"><br />\n6. Station - Langwieder See: N 48Â° 11.776 E 011Â° 25.040<em> (Danke an mape180!)</em></span><span style=\"font-size:small;\"><br />\n7. Station - Gierlinger Park: N 48Â° 05.853  E 011Â° 32.532<em> (Danke an Fredymaus!)</em></span><span style=\"font-size:small;\"><br />\n8. Station - Weltwald Freising: N 48Â° 24.872 E 011Â° 40.481<em> (Danke an rkschlotte!)</em><span style=\"font-size:small;\"><br />\n9. Station - Walderlebnispfad Kuhfluchtwasserfälle: N 47Â° 31.815 E 011Â° 07.242<em> (Danke an Yarkos!)</em><span style=\"font-size:small;\"><br />\n10. Station - Icking: N 47Â° 57.750 E 011Â° 26.217<em> (Danke an unertl!)</em><span style=\"font-size:small;\"><br />\n11. Station - Frötmaninger Berg: N 48Â° 12.824 E 011Â° 37.715 <em>(Danke an Puttenchor!)</em><span style=\"font-size:small;\"> </span></span></span></span></span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\"><strong>aktuell: =&gt;   <strong><span style=\"font-size:small;\"><span style=\"font-size:small;\"> <span>N 48Â° 12.824</span><span> E 011Â° 37.715</span></span></span></strong></strong></span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\"><strong><strong><span style=\"font-size:small;\"><span style=\"font-size:small;\"><span><img style=\"vertical-align:middle;\" src=\"images/uploads/C21659EA-5C00-11EA-8DF9-D516ED642EB6.jpg\" alt=\"Karte\" /></span></span></span></strong></strong></span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\"><span style=\"font-size:small;\"><span style=\"font-size:small;\"><span style=\"font-size:xx-small;\"><em>(Karte: OSM/flopp-caching.de)</em></span></span></span></span></p>',1,1,'','...unterwegs im Münchner Umland...'),(18,'ab40370a-404a-11eb-96df-0242ac120002',4,'2020-12-18 10:23:18','2020-12-18 10:24:30',18,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OCFD54 ###</strong></em><br /><br /></p>\n<div style=\"width:670px;font-family:Arial, Helvetica, sans-serif;font-size:10pt;\">\n<div style=\"height:400px;width:670px;float:left;background:url(&quot;http://gc.clanfamily.de/ocfd54/kopf.jpg&quot;) no-repeat;\"> </div>\n<div style=\"width:610px;float:left;background:url(&quot;http://gc.clanfamily.de/ocfd54/content.jpg&quot;) repeat;padding:0px 30px;text-align:justify;\">\n	\nDie Duisburger Traditionsbrauerei kurz \"KöPi\" ist bereits über 100 Jahre bekannt. Sie bildet das Bild vom Stadtteil Beek wie kein anderes Unternehmen. Bevor ich jetzt seitenweise Wikipedia zitiere [<a href=\"http://de.wikipedia.org/wiki/K%C3%B6nig-Brauerei\">nachlesen</a>] komme ich direkt zur Aufgabe des Caches.<br /><br /><hr style=\"width:600px;border:2px dashed #99cc33;\" /><strong>So solltet ihr diesen Cache loggen...</strong><br />\n- besucht die Brauerei vor Ort und nehmt euer GPS/Smartphone/Karte/Kompass mit<br />\n- Macht ein Foto von/mit euch vor dem Kupferkessel<br />\n- Loggt mit Foto auf opencaching.de<br /><br />\nBeispiel:<br /><img src=\"http://gc.clanfamily.de/ocfd54/spoiler.jpg\" alt=\"spoiler.jpg\" /><br /><br />\nWer als Tourist nach Duisburg kommt - die Brauerei bietet auch Besichtigungstermine an!<br />\nAllerdings ohne anschließender Verköstigung :)\n</div>\n<div style=\"height:200px;width:670px;background:url(&quot;http://gc.clanfamily.de/ocfd54/footer.jpg&quot;) no-repeat;float:left;padding-left:30px;padding-top:60px;font-size:8pt;\">\n<p>\nDesign Â© Clanfamily.de<br />\nDie Verantwortung für jeden GeoCache übernimmt der Cacher selbst.<br />\nWir bitten euch: schont die Natur, wie auch wir dies beim legen unseres Cache berücksichtigt haben.</p>\n<p>Â </p>\n<p><em><strong>---</strong></em></p>\n<p><em><strong>Logpasswort: KÖNIG</strong></em></p>\n</div>\n</div>',1,1,'','Das Duisburger Traditionsbrauhaus.'),(19,'ae8d494e-404b-11eb-96df-0242ac120002',4,'2020-12-18 10:30:33','2020-12-18 10:31:42',19,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC15A42 ###</strong></em></p>\n<p>Â </p>\n<p style=\"text-align:center;\"><br /><span style=\"font-size:medium;\"><strong>Kein Cache ist es wert, sich oder andere in Gefahr zu bringen!</strong></span></p>\n<hr size=\"4\" /><p><br /><a rel=\"noreferrer noopener\" href=\"https://www.opencaching.de/viewcache.php?cacheid=173943\" target=\"_blank\"><img style=\"display:none;\" title=\"Der Fahrplan\" src=\"https://www.4shared.com/img/LICRRB7nfi/s25/169d2f8ce78/Werbebanner_deutsch_\" border=\"0\" alt=\"Werbebanner_deutsch_\" width=\"700\" height=\"168\" /></a><br /><br />\nMein Opa hat mir einmal die Geschichte über Drohnen erzählt<br /><br />\nDie fliegen hoch über unseren Köpfen und machen fleißig Photos. Manchmal lassen sie auch \"Dinge\" fallen, die Menschen sehr weh tun.<br />\nIch kann das gar nicht glauben, wenn ich in den Himmel schaue. Da ist doch nichts zu sehen außer Engeln?<br />\nOpa bewies mir das Gegenteil. Er stellte mit seinem \"Walkie-Talkie\" eine Funk-Verbindung zu so einem Ding her und steuerte damit die Kamera für ein Photo von der Erde.<br />\nPotzblitz! Da ist Opa zu sehen, mit seinem Spezialfahrrad. Und neben ihm, hinter der Hecke: <strong>ich</strong> <img title=\"Cool\" src=\"resource2/tinymce/plugins/emotions/img/smiley-cool.gif\" border=\"0\" alt=\"Cool\" />.<br /><a rel=\"noreferrer noopener\" href=\"https://www.opencaching.de/images/uploads/6D73B57A-C34B-11E9-9ECD-0AAA1AAB5A07.jpg\" target=\"_blank\"><img style=\"vertical-align:middle;\" title=\"Logproof\" src=\"images/uploads/6D73B57A-C34B-11E9-9ECD-0AAA1AAB5A07.jpg\" alt=\"Logproof\" width=\"200\" /></a>\n<br /><br /><br /><em>Was tun? Begebt Euch zum Flensburger Segel-Club an den Startkoordinaten. Verbindet Euch mit der <a title=\"FSC Webcam2\" rel=\"noreferrer noopener\" href=\"http://62.214.4.38/view/view.shtml?id=5544&amp;imagepath=%2Fmjpg%2Fvideo.mjpg&amp;size=1&amp;streamprofile=Bandwidth\" target=\"_blank\">Webcam2 des FSC</a>. Macht ein Photo <strong>damit</strong> von Euch oder einem markanten persönlichem Gegenstand. Ladet das Photo hoch.<br /><span>Sollte die Webcam ausgefallen oder kein Internet verfügbar sein oder Ihr anonym bleiben wollen, dürft <strong>Ihr</strong> alternativ/umgekehrt <strong>die Webcam</strong> knipsen - mit einem persönlichen Gegenstand vor der Linse!</span>\n</em><br /><br /></p>\n<hr size=\"4\" /><p>Â </p>\n<div> <span style=\"font-size:large;\">Bus: Linie <strong>21</strong>, Haltestelle \"Quellental\".</span></div>\n<p><br /><a rel=\"noreferrer noopener\" href=\"http://www.handicaching.com/show.php?waypoint=OC15A42\" target=\"_blank\"><img title=\"Handicap-Wertung\" src=\"https://www.opencaching.de/images/uploads/F1D8F644-2DA9-11E5-9CA8-525400E33611.jpg\" border=\"0\" alt=\"Handicap-Wertung\" /> <img src=\"https://www.opencaching.de/images/uploads/403BE2B2-946F-11E7-BEE1-E297132BC419.jpg\" alt=\"Für Rollstuhl\" hspace=\"5\" width=\"130\" height=\"130\" /> <img src=\"https://www.opencaching.de/images/uploads/70BD83BA-946F-11E7-BEE1-E297132BC419.jpg\" alt=\"Bus hält\" hspace=\"5\" width=\"130\" height=\"130\" /></a></p>',1,1,'Brötchenfahrradständer am Restaurant-Zuweg aufsuchen und Position &quot;kleine Halle&quot; aus dem Menü oben auf der Website wählen.','Opa erzählt: 1000und1 Nacht #86'),(20,'fd1b9afe-404c-11eb-96df-0242ac120002',4,'2020-12-18 10:39:54','2020-12-18 10:39:54',20,'DE','<p style=\"text-align:center;\"><em><strong>### Dieser Testcache basiert auf OC1284B ###</strong></em><br /><br /></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\">Nachdem in diesem Jahr die Anzahl der OC Dosen in dieser Region in 2015 um einige angestiegen ist, </span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\">ist es nun am Ende des Jahres Zeit für ein OC-Only Event in Trier.</span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\"><br /></span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:medium;\">Wir treffen uns</span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:medium;\"> am <strong>Mittwoch</strong>,<strong> 09.12.2015</strong> um <strong>20:30</strong> Uhr </span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:medium;\">im <strong>Bitburger Wirtshaus </strong>am <strong>Kornmarkt</strong> in <strong>Trier</strong>.</span></p>\n<p style=\"text-align:center;\">Â </p>\n<p style=\"text-align:justify;\"><span style=\"font-size:small;\">Das Event ist  zu einen zum Austauch von Erfahrungen und Ideen gedacht und zu anderen, um einfach mal die Leute kennenzulernen, die Dosen bei OC suchen und finden. Die Location ist nicht reserviert oder gebucht. Ich denke, das geht auch so. Haltet im Wirtshaus einfach Ausschau nach einem Logbuch mit OC-Logo (oder so...wir werden uns schon irgendwie kenntlich machen <img title=\"Lachend\" src=\"resource2/tinymce/plugins/emotions/img/smiley-laughing.gif\" border=\"0\" alt=\"Lachend\" />).</span></p>\n<p style=\"text-align:center;\"><span style=\"font-size:small;\">Freue mich über jeden, der vorbeischaut. <img title=\"Lächelnd\" src=\"resource2/tinymce/plugins/emotions/img/smiley-smile.gif\" border=\"0\" alt=\"Lächelnd\" />.</span></p>',1,1,'','Gemütlicher Plausch im Bitburger Wirtshaus'),(21,'adf744cb-404d-11eb-96df-0242ac120002',4,'2020-12-18 10:44:51','2020-12-18 10:44:51',21,'EN','<p style=\"text-align:center;\"><strong><em>### Dieser Testcache basiert auf OC107A ###</em></strong><br /><br /><br />\nIt\'s not very simple, but it\'s a simple locationless cache: You have to show the Laputian Salute in a certain way:\n</p>\n<ul><li> Move from your home two miles and fivehundred meters towards the last salute-position. If you don\'t have a home start at the local bakery.</li>\n<li> Turn towards your predecessor and show him or her the Laputian Salute.</li>\n<li> Take a picture of yourself and your GPSr.</li>\n<li> Take the coordinates so the next person can show you the Laputian Salute.</li>\n<li> If you like to, you can include a short explanation why you are showing the salute.</li>\n</ul><p>\n\nSince we have to start somewhere, the first cacher can show the salute to the occupant of this building.\n</p>\n<p>Â </p>\n<p> <img src=\"https://www.opencaching.de/images/uploads/E21242A8-0FEB-5772-6C86-3E480C8C5A34.jpg\" border=\"0\" alt=\"E21242A8-0FEB-5772-6C86-3E480C8C5A34.jpg\" /></p>\n<p>Â </p>\n<p>\n<strong>Long live Laputa!</strong></p>\n<p>Â </p>\n<p>\nFurther information about The Free Republic of Laputa might be found <a rel=\"noreferrer noopener\" href=\"http://laputa.de/\" target=\"_blank\">here</a></p>',1,1,'','Show the Laputian Salute'),(22,'5dd94d09-4051-11eb-96df-0242ac120002',4,'2020-12-18 11:11:15','2020-12-18 11:15:32',22,'DE','<p>Das ist ein Listing..</p>',1,1,'',''),(23,'ee63495c-4052-11eb-96df-0242ac120002',4,'2020-12-18 11:22:27','2020-12-18 11:22:27',23,'DE','<p>[insert text here]</p>',1,1,'','');
/*!40000 ALTER TABLE `cache_desc` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheDescBeforeInsert` BEFORE INSERT ON `cache_desc`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`last_modified`=NOW();
        END IF;
                
        IF ISNULL(NEW.`uuid`) OR NEW.`uuid`='' THEN
            SET NEW.`uuid`=CREATE_UUID();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheDescAfterInsert` AFTER INSERT ON `cache_desc`
     FOR EACH ROW BEGIN
        CALL sp_update_cache_listingdate(NEW.`cache_id`);
        IF
            (SELECT `date_created` FROM `caches` WHERE `cache_id`=NEW.`cache_id`) < LEFT(NOW(),10)
            AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=NEW.`cache_id`) != 5
        THEN
            INSERT IGNORE INTO `cache_desc_modified` (`cache_id`, `language`, `date_modified`, `desc`, `restored_by`) VALUES (NEW.`cache_id`, NEW.`language`, NOW(), NULL, IFNULL(@restoredby,0));
        END IF;
        CALL sp_update_caches_descLanguages(NEW.`cache_id`);
        CALL sp_update_searchindex(3, NEW.`cache_id`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheDescBeforeUpdate` BEFORE UPDATE ON `cache_desc`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            IF
                NEW.`id` != OLD.`id`
                OR NEW.`uuid` != OLD.`uuid`
                OR NEW.`node` != OLD.`node`
                OR NEW.`date_created` != OLD.`date_created`
                OR NEW.`cache_id` != OLD.`cache_id`
                OR NEW.`language` != OLD.`language`
                OR NEW.`desc` != OLD.`desc`
                OR NEW.`desc_html` != OLD.`desc_html`
                OR NEW.`hint` != OLD.`hint`
                OR NEW.`short_desc` != OLD.`short_desc`
            THEN
                SET NEW.`last_modified`=NOW();
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheDescAfterUpdate` AFTER UPDATE ON `cache_desc`
     FOR EACH ROW BEGIN
        IF OLD.`language`!=BINARY NEW.`language` OR OLD.`cache_id`!=NEW.`cache_id` THEN
            IF OLD.`cache_id`!=NEW.`cache_id` THEN
                CALL sp_update_caches_descLanguages(OLD.`cache_id`);
                CALL sp_update_cache_listingdate(OLD.`cache_id`);
            END IF;
            CALL sp_update_caches_descLanguages(NEW.`cache_id`);
        END IF;
        CALL sp_update_cache_listingdate(NEW.`cache_id`);
        
        IF
            NEW.`cache_id`=OLD.`cache_id`
            AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=OLD.`cache_id`) != 5
        THEN
            IF (OLD.`date_created` < LEFT(NOW(),10)) THEN
                INSERT IGNORE INTO `cache_desc_modified` (`cache_id`, `language`, `date_modified`, `date_created`, `desc`, `desc_html`, `desc_htmledit`, `hint`, `short_desc`, `restored_by`) VALUES (OLD.`cache_id`, OLD.`language`, NOW(), OLD.`date_created`, OLD.`desc`, OLD.`desc_html`, OLD.`desc_htmledit`, OLD.`hint`, OLD.`short_desc`, IFNULL(@restoredby,0));
            END IF;
            IF NEW.`language`!=BINARY OLD.`language` THEN
                INSERT IGNORE INTO `cache_desc_modified` (`cache_id`, `language`, `date_modified`, `desc`) VALUES (NEW.`cache_id`, NEW.`language`, NOW(), NULL);
            END IF;
        END IF;
        IF NEW.`desc`!=OLD.`desc` OR NEW.`short_desc`!=OLD.`short_desc` THEN
            CALL sp_update_searchindex(3, NEW.`cache_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheDescAfterDelete` AFTER DELETE ON `cache_desc`
     FOR EACH ROW BEGIN
        INSERT IGNORE INTO `removed_objects` (`localId`, `uuid`, `type`, `node`)
        VALUES (OLD.`id`, OLD.`uuid`, 3, OLD.`node`);

        IF IFNULL(@deleting_cache,0)=0 THEN
            CALL sp_update_cache_listingdate(OLD.`cache_id`);
            
            IF
                (OLD.`date_created` < LEFT(NOW(),10))
                AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=OLD.`cache_id`) != 5
            THEN
                INSERT IGNORE INTO `cache_desc_modified` (`cache_id`, `language`, `date_modified`, `date_created`, `desc`, `desc_html`, `desc_htmledit`, `hint`, `short_desc`, `restored_by`) VALUES (OLD.`cache_id`, OLD.`language`, NOW(), OLD.`date_created`, OLD.`desc`, OLD.`desc_html`, OLD.`desc_htmledit`, OLD.`hint`, OLD.`short_desc`, IFNULL(@restoredby,0));
            END IF;
            CALL sp_update_caches_descLanguages(OLD.`cache_id`);
            CALL sp_update_searchindex(3, OLD.`cache_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_desc_modified`
--

DROP TABLE IF EXISTS `cache_desc_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_desc_modified` (
  `cache_id` int(10) unsigned NOT NULL,
  `language` char(2) NOT NULL,
  `date_modified` date NOT NULL COMMENT 'no time! see restorecaches.php',
  `date_created` datetime NOT NULL,
  `desc` longtext,
  `desc_html` tinyint(1) NOT NULL DEFAULT '0',
  `desc_htmledit` tinyint(1) NOT NULL DEFAULT '0',
  `hint` longtext,
  `short_desc` varchar(120) NOT NULL,
  `restored_by` int(10) NOT NULL,
  UNIQUE KEY `cache_id` (`cache_id`,`date_modified`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_desc_modified`
--

LOCK TABLES `cache_desc_modified` WRITE;
/*!40000 ALTER TABLE `cache_desc_modified` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_desc_modified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_ignore`
--

DROP TABLE IF EXISTS `cache_ignore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_ignore` (
  `cache_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cache_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_ignore`
--

LOCK TABLES `cache_ignore` WRITE;
/*!40000 ALTER TABLE `cache_ignore` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_ignore` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheIgnoreAfterInsert` AFTER INSERT ON `cache_ignore`
     FOR EACH ROW BEGIN
        CALL sp_update_ignorestat(NEW.`cache_id`, FALSE);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheIgnoreAfterUpdate` AFTER UPDATE ON `cache_ignore`
     FOR EACH ROW BEGIN
        IF NEW.`cache_id`!=OLD.`cache_id` THEN
            CALL sp_update_ignorestat(OLD.`cache_id`, TRUE);
            CALL sp_update_ignorestat(NEW.`cache_id`, FALSE);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheIgnoreAfterDelete` AFTER DELETE ON `cache_ignore`
     FOR EACH ROW BEGIN
        CALL sp_update_ignorestat(OLD.`cache_id`, TRUE);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_list_bookmarks`
--

DROP TABLE IF EXISTS `cache_list_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_list_bookmarks` (
  `cache_list_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `password` varchar(80) NOT NULL,
  UNIQUE KEY `cache_list_id` (`cache_list_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_list_bookmarks`
--

LOCK TABLES `cache_list_bookmarks` WRITE;
/*!40000 ALTER TABLE `cache_list_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_list_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_list_items`
--

DROP TABLE IF EXISTS `cache_list_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_list_items` (
  `cache_list_id` int(10) NOT NULL,
  `cache_id` int(10) NOT NULL,
  UNIQUE KEY `cache_list_id` (`cache_list_id`,`cache_id`),
  KEY `cache_id` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_list_items`
--

LOCK TABLES `cache_list_items` WRITE;
/*!40000 ALTER TABLE `cache_list_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_list_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListItemsAfterInsert` AFTER INSERT ON `cache_list_items`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            UPDATE `cache_lists`
            SET `last_modified`=NOW(), `last_added`=NOW()
            WHERE `cache_lists`.`id`=NEW.`cache_list_id`;

            UPDATE `stat_cache_lists`
            SET `entries`=`entries`+1
            WHERE `stat_cache_lists`.`cache_list_id`=NEW.`cache_list_id`;

            IF (SELECT `user_id` FROM `cache_list_watches` `clw` WHERE `clw`.`cache_list_id`=NEW.`cache_list_id` LIMIT 1) IS NOT NULL THEN
                CALL sp_update_watchstat(NEW.`cache_id`);
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListItemsAfterUpdate` AFTER UPDATE ON `cache_list_items`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            UPDATE `cache_lists` SET `last_modified`=NOW() WHERE `cache_lists`.`id`=OLD.`cache_list_id`;

            IF NEW.`cache_list_id` != OLD.`cache_list_id` THEN
                UPDATE `stat_cache_lists` SET `entries`=`entries`-1 WHERE `stat_cache_lists`.`cache_list_id`=OLD.`cache_list_id`;
                UPDATE `stat_cache_lists` SET `entries`=`entries`+1 WHERE `stat_cache_lists`.`cache_list_id`=NEW.`cache_list_id`;
                UPDATE `cache_lists` SET `last_modified`=NOW(), `last_added`=NOW() WHERE `cache_lists`.`id`=NEW.`cache_list_id`;
            END IF;
            IF
                (SELECT `user_id`
                 FROM `cache_list_watches` `clw`
                 WHERE `clw`.`cache_list_id`=OLD.`cache_list_id`
                 LIMIT 1
                ) IS NOT NULL
            THEN
                CALL sp_update_watchstat(OLD.`cache_id`);
            END IF;
            IF
                (SELECT `user_id`
                 FROM `cache_list_watches` `clw`
                 WHERE `clw`.`cache_list_id`=NEW.`cache_list_id`
                 LIMIT 1
                ) IS NOT NULL THEN
                CALL sp_update_watchstat(NEW.`cache_id`);
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListItemsAfterDelete` AFTER DELETE ON `cache_list_items`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            
            IF NOT IFNULL(@DELETING_CACHELIST,FALSE) THEN
                UPDATE `stat_cache_lists` SET `entries`=`entries`-1 WHERE `stat_cache_lists`.`cache_list_id`=OLD.`cache_list_id`;
                UPDATE `cache_lists` SET `last_modified`=NOW() WHERE `cache_lists`.`id`=OLD.`cache_list_id`;
            END IF;
            IF
                (SELECT `user_id`
                 FROM `cache_list_watches` `clw`
                 WHERE `clw`.`cache_list_id`=OLD.`cache_list_id`
                 LIMIT 1
                ) IS NOT NULL
            THEN
                CALL sp_update_watchstat(OLD.`cache_id`);
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_list_watches`
--

DROP TABLE IF EXISTS `cache_list_watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_list_watches` (
  `cache_list_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  UNIQUE KEY `cache_list_id` (`cache_list_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_list_watches`
--

LOCK TABLES `cache_list_watches` WRITE;
/*!40000 ALTER TABLE `cache_list_watches` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_list_watches` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListWatchesAfterInsert` AFTER INSERT ON `cache_list_watches`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            UPDATE `stat_cache_lists` SET `watchers`=`watchers`+1 WHERE `stat_cache_lists`.`cache_list_id`=NEW.`cache_list_id`;
            CALL sp_update_list_watchstat(NEW.`cache_list_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListWatchesAfterUpdate` AFTER UPDATE ON `cache_list_watches`
     FOR EACH ROW BEGIN
         
         IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            IF NEW.`cache_list_id` != OLD.`cache_list_id` THEN
                UPDATE `stat_cache_lists` SET `watchers`=`watchers`-1 WHERE `stat_cache_lists`.`cache_list_id`=OLD.`cache_list_id`;
                UPDATE `stat_cache_lists` SET `watchers`=`watchers`+1 WHERE `stat_cache_lists`.`cache_list_id`=NEW.`cache_list_id`;
            END IF;
            CALL sp_update_list_watchstat(OLD.`cache_list_id`);
            CALL sp_update_list_watchstat(NEW.`cache_list_id`);
         END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListWatchesAfterDelete` AFTER DELETE ON `cache_list_watches`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            
            IF NOT IFNULL(@DELETING_CACHELIST,FALSE) THEN
                UPDATE `stat_cache_lists` SET `watchers`=`watchers`-1 WHERE `stat_cache_lists`.`cache_list_id`=OLD.`cache_list_id`;
            END IF;
            CALL sp_update_list_watchstat(OLD.`cache_list_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_lists`
--

DROP TABLE IF EXISTS `cache_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_lists` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `last_added` datetime DEFAULT NULL,
  `last_state_change` datetime DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `desc_htmledit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_lists`
--

LOCK TABLES `cache_lists` WRITE;
/*!40000 ALTER TABLE `cache_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_lists` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListsBeforeInsert` BEFORE INSERT ON `cache_lists`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`last_modified`=NOW();
        END IF;

        IF ISNULL(NEW.`uuid`) OR NEW.`uuid`='' THEN
            SET NEW.`uuid`=CREATE_UUID();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListsAfterInsert` AFTER INSERT ON `cache_lists`
     FOR EACH ROW BEGIN
        INSERT IGNORE INTO `stat_cache_lists` (`cache_list_id`) VALUES (NEW.`id`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListsBeforeUpdate` BEFORE UPDATE ON `cache_lists`
     FOR EACH ROW BEGIN
        IF NEW.`id` != OLD.`id` THEN
            CALL error_cache_list_id_must_not_be_changed();
        END IF;
        IF
            NEW.`uuid` != BINARY OLD.`uuid`
            OR NEW.`node` != OLD.`node`
            OR NEW.`user_id` != OLD.`user_id`
            OR NEW.`name` != BINARY OLD.`name`
            OR NEW.`is_public` != OLD.`is_public`
            OR NEW.`description` != BINARY OLD.`description`
        THEN
            
            IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
                SET NEW.`last_modified`=NOW();
            END IF;
        END IF;
        IF OLD.`is_public` != NEW.`is_public` THEN
            SET NEW.`last_state_change`=NOW();   
            IF NOT NEW.`is_public` THEN
                DELETE FROM `cache_list_watches`
                WHERE
                    `cache_list_watches`.`cache_list_id`=NEW.`id`
                    AND `cache_list_watches`.`user_id` != NEW.`user_id`;
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListsBeforeDelete` BEFORE DELETE ON `cache_lists`
     FOR EACH ROW BEGIN
        SET @DELETING_CACHELIST=TRUE;
        DELETE FROM `cache_list_items` WHERE `cache_list_items`.`cache_list_id`=OLD.`id`;
        DELETE FROM `cache_list_watches` WHERE `cache_list_watches`.`cache_list_id`=OLD.`id`;
        DELETE FROM `stat_cache_lists` WHERE `cache_list_id`=OLD.`id`;
        SET @DELETING_CACHELIST=FALSE;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheListsAfterDelete` AFTER DELETE ON `cache_lists`
     FOR EACH ROW BEGIN
        INSERT IGNORE INTO `removed_objects` (`localId`, `uuid`, `type`, `node`)
        VALUES (OLD.`id`, OLD.`uuid`, 8, OLD.`node`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_location`
--

DROP TABLE IF EXISTS `cache_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_location` (
  `cache_id` int(10) unsigned NOT NULL,
  `last_modified` datetime NOT NULL COMMENT 'via Trigger (cache_location)',
  `adm1` varchar(120) DEFAULT NULL,
  `adm2` varchar(120) DEFAULT NULL,
  `adm3` varchar(120) DEFAULT NULL,
  `adm4` varchar(120) DEFAULT NULL,
  `code1` varchar(2) DEFAULT NULL,
  `code2` varchar(3) DEFAULT NULL,
  `code3` varchar(4) DEFAULT NULL,
  `code4` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`cache_id`),
  KEY `code1` (`code1`,`code2`,`code3`,`code4`),
  KEY `adm1` (`adm1`,`adm2`),
  KEY `adm1_2` (`adm1`,`code1`),
  KEY `code1_2` (`code1`,`adm3`),
  KEY `adm1_3` (`adm1`,`adm3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via cronjob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_location`
--

LOCK TABLES `cache_location` WRITE;
/*!40000 ALTER TABLE `cache_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_location` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLocationBeforeInsert` BEFORE INSERT ON `cache_location`
     FOR EACH ROW BEGIN
        SET NEW.`last_modified`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLocationBeforeUpdate` BEFORE UPDATE ON `cache_location`
     FOR EACH ROW BEGIN
        SET NEW.`last_modified`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_logs`
--

DROP TABLE IF EXISTS `cache_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL COMMENT 'via Trigger (cache_logs)',
  `entry_last_modified` datetime NOT NULL COMMENT 'via Trigger (cache_logs)',
  `last_modified` datetime NOT NULL COMMENT 'via Trigger (cache_logs)',
  `okapi_syncbase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_last_modified` datetime NOT NULL COMMENT 'via Triggers',
  `cache_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `oc_team_comment` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `order_date` datetime NOT NULL,
  `needs_maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `listing_outdated` tinyint(1) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `text_html` tinyint(1) NOT NULL DEFAULT '1',
  `text_htmledit` tinyint(1) NOT NULL DEFAULT '1',
  `owner_notified` tinyint(1) NOT NULL DEFAULT '0',
  `picture` smallint(5) unsigned NOT NULL COMMENT 'via Trigger (picture)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `owner_notified` (`owner_notified`),
  KEY `last_modified` (`last_modified`),
  KEY `type` (`type`,`cache_id`),
  KEY `date_created` (`date_created`),
  KEY `user_id` (`user_id`,`cache_id`),
  KEY `cache_id` (`cache_id`,`user_id`),
  KEY `date` (`cache_id`,`date`,`date_created`),
  KEY `order_date` (`cache_id`,`order_date`,`date_created`,`id`),
  KEY `okapi_syncbase` (`okapi_syncbase`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='Attention: modifications to this table may need to be applied also to cache_logs_archived, cache_logs_modified and trigger cacheLogsBeforeUpdate!';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_logs`
--

LOCK TABLES `cache_logs` WRITE;
/*!40000 ALTER TABLE `cache_logs` DISABLE KEYS */;
INSERT INTO `cache_logs` (`id`, `uuid`, `node`, `date_created`, `entry_last_modified`, `last_modified`, `okapi_syncbase`, `log_last_modified`, `cache_id`, `user_id`, `type`, `oc_team_comment`, `date`, `order_date`, `needs_maintenance`, `listing_outdated`, `text`, `text_html`, `text_htmledit`, `owner_notified`, `picture`) VALUES (1,'3722f4ce-403d-11eb-96df-0242ac120002',5,'2020-12-18 08:47:00','2020-12-18 08:47:00','2020-12-18 08:55:40','2020-12-18 08:55:40','2020-12-18 08:55:40',9,170291,3,0,'2020-12-18 00:00:00','2020-12-18 08:47:00',2,2,'<p><span style=\"font-size:large;\">Oh, wie schade, gerade eben wurde der Cache gepublisht und schon funktioniert der Webcamlink nicht mehr. </span></p>\n<p><span style=\"font-size:large;\"><img title=\"Frown\" src=\"resource2/tinymce/plugins/emotions/img/smiley-frown.gif\" border=\"0\" alt=\"Frown\" /></span></p>',1,1,0,0),(2,'72ac8550-403d-11eb-96df-0242ac120002',5,'2020-12-18 08:48:40','2020-12-18 08:48:53','2020-12-18 08:55:40','2020-12-18 08:55:40','2020-12-18 08:55:40',9,170290,11,0,'2020-12-18 00:00:00','2020-12-18 08:48:40',2,0,'<p>Oh, da brat mir doch einer \'nen Storch.. der Link funtioniert ja tatsächlich nicht. Ich schaue mir das an.</p>',1,1,0,0),(3,'6d7e6a68-403e-11eb-96df-0242ac120002',5,'2020-12-18 08:55:40','2020-12-18 08:57:37','2020-12-18 08:57:37','2020-12-18 08:57:37','2020-12-18 08:57:37',9,170290,9,0,'2020-12-18 00:00:00','2020-12-18 08:55:40',0,0,'<p>Oh, die Webcam samt Waschstraße und Storch sind nicht mehr existent. Ich muss den Cache daher archivieren. #Publish\'n\'Archive</p>',1,1,0,0),(4,'8cb94bda-4042-11eb-96df-0242ac120002',5,'2020-12-18 09:25:11','2020-12-18 09:25:11','2020-12-18 09:25:11','2020-12-18 09:25:11','2020-12-18 09:25:11',3,170293,1,0,'2020-12-18 00:00:00','2020-12-18 09:25:11',1,0,'<p><span style=\"font-size:small;\">Juhu! Erster! Danke  für den Cache!</span> <img title=\"Laughing\" src=\"resource2/tinymce/plugins/emotions/img/smiley-laughing.gif\" border=\"0\" alt=\"Laughing\" /></p>',1,1,0,0),(5,'888f4dab-4047-11eb-96df-0242ac120002',5,'2020-12-18 10:00:51','2020-12-18 10:01:41','2020-12-18 10:01:41','2020-12-18 10:01:41','2020-12-18 10:01:41',15,170294,1,0,'2020-12-18 00:00:00','2020-12-18 10:00:51',0,0,'<p>Lösch mich..!</p>',1,1,0,0),(6,'be6104a2-404d-11eb-96df-0242ac120002',5,'2020-12-18 10:45:18','2020-12-18 10:45:18','2020-12-18 10:45:18','2020-12-18 10:45:18','2020-12-18 10:45:18',10,170292,8,0,'2020-12-18 00:00:00','2020-12-18 10:45:18',0,0,'<p>Da bin ich gerne dabei!</p>',1,1,0,0),(7,'9a7c5f12-4051-11eb-96df-0242ac120002',5,'2020-12-18 11:12:56','2020-12-18 11:12:56','2020-12-18 11:12:56','2020-12-18 11:12:56','2020-12-18 11:12:56',3,170298,1,0,'2020-12-18 00:00:00','2020-12-18 11:12:56',0,0,'<p>FOUND! LOL! rofl!</p>',1,1,0,0),(8,'f77bf871-4051-11eb-96df-0242ac120002',5,'2020-12-18 11:15:32','2020-12-18 11:15:32','2020-12-18 11:15:32','2020-12-18 11:15:32','2020-12-18 11:15:32',22,107469,13,1,'2020-12-18 00:00:00','2020-12-18 11:15:32',0,0,'Der Benutzeraccount wurde deaktiviert.',0,1,0,0),(9,'0d5d4831-4053-11eb-96df-0242ac120002',5,'2020-12-18 11:23:18','2020-12-18 11:23:18','2020-12-18 11:23:18','2020-12-18 11:23:18','2020-12-18 11:23:18',3,170299,1,0,'2020-12-18 00:00:00','2020-12-18 11:23:18',0,0,'<p>auch gfunden!</p>',1,1,0,0);
/*!40000 ALTER TABLE `cache_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLogsBeforeInsert` BEFORE INSERT ON `cache_logs`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`entry_last_modified`=NEW.`date_created`;
            SET NEW.`last_modified`=NEW.`date_created`;
            SET NEW.`log_last_modified`=NEW.`date_created`;
            SET NEW.`order_date`=
                IF(
                    RIGHT(NEW.`date`, 8) <> '00:00:00' OR NEW.`date` > NEW.`date_created`,
                    NEW.`date`,
                    IF(
                        LEFT(NEW.`date_created`, 10) = LEFT(NEW.`date`, 10),
                        NEW.`date_created`,
                        CONCAT(LEFT(NEW.`date`, 11), '23:59:58')
                    )
                );
        END IF;

        IF ISNULL(NEW.`uuid`) OR NEW.`uuid`='' THEN
            SET NEW.`uuid`=CREATE_UUID();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLogsAfterInsert` AFTER INSERT ON `cache_logs`
     FOR EACH ROW BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE notify_user_id INT;
        DECLARE cur1 CURSOR FOR

        

        
        SELECT `cache_watches`.`user_id`
        FROM `cache_watches`
        INNER JOIN `caches` ON `cache_watches`.`cache_id`=`caches`.`cache_id`
        INNER JOIN `cache_status` ON `caches`.`status`=`cache_status`.`id`
        WHERE `cache_watches`.`cache_id`=NEW.cache_id AND `cache_status`.`allow_user_view`=1
        UNION    
        
        SELECT `clw`.`user_id` FROM `cache_list_watches` `clw`
        INNER JOIN `cache_list_items` `cli` ON `clw`.`cache_list_id`=`cli`.`cache_list_id`
        INNER JOIN `caches` ON `cli`.`cache_id`=`caches`.`cache_id`
        INNER JOIN `cache_status` ON `caches`.`status`=`cache_status`.`id`
        WHERE `cli`.`cache_id`=NEW.cache_id AND `cache_status`.`allow_user_view`=1;

        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

        CALL sp_update_logstat(NEW.`cache_id`, NEW.`user_id`, NEW.`type`, FALSE);

        OPEN cur1;
        REPEAT
            FETCH cur1 INTO notify_user_id;
            IF NOT done THEN
                INSERT INTO `watches_logqueue` (`log_id`, `user_id`) VALUES (NEW.id, notify_user_id);
            END IF;
        UNTIL done END REPEAT;
        CLOSE cur1;

        CALL sp_update_searchindex(1, NEW.`cache_id`);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLogsBeforeUpdate` BEFORE UPDATE ON `cache_logs`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            IF
                NEW.`id`!=OLD.`id`
                OR NEW.`uuid`!=BINARY OLD.`uuid`
                OR NEW.`node`!=OLD.`node`
                OR NEW.`date_created`!=OLD.`date_created`
                OR NEW.`cache_id`!=OLD.`cache_id`
                OR NEW.`user_id`!=OLD.`user_id`
                OR NEW.`type`!=OLD.`type`
                OR NEW.`oc_team_comment`!=OLD.`oc_team_comment`
                OR NEW.`date`!=OLD.`date`
                OR NEW.`needs_maintenance`!=OLD.`needs_maintenance`
                OR NEW.`listing_outdated`!=OLD.`listing_outdated`
                OR NEW.`text`!=BINARY OLD.`text`
                OR NEW.`text_html`!=OLD.`text_html`
            THEN
                SET NEW.`log_last_modified`=NEW.`date_created`;
                SET NEW.`order_date` =
                    IF(
                        RIGHT(NEW.`date`, 8) <> '00:00:00' OR NEW.`date` > NEW.`date_created`,
                        NEW.`date`,
                        IF(
                            LEFT(NEW.`date_created`, 10) = LEFT(NEW.`date`, 10), NEW.`date_created`,
                            CONCAT(LEFT(NEW.`date`, 11),
                            '23:59:58')
                        )
                    );

                
                IF DATEDIFF(NOW(), OLD.`date_created`) > 1 THEN
                    INSERT IGNORE INTO `cache_logs_modified`
                        (`id`, `uuid`, `node`, `date_created`, `entry_last_modified`, `last_modified`,
                         `log_last_modified`, `cache_id`, `user_id`, `type`, `oc_team_comment`, `date`,
                         `needs_maintenance`, `listing_outdated`, `text`, `text_html`, `modify_date`
                        )
                    VALUES (
                        OLD.`id`, OLD.`uuid`, OLD.`node`, OLD.`date_created`, OLD.`entry_last_modified`, OLD.`last_modified`,
                        OLD.`log_last_modified`, OLD.`cache_id`, OLD.`user_id`, OLD.`type`, OLD.`oc_team_comment`, OLD.`date`,
                        OLD.`needs_maintenance`, OLD.`listing_outdated`, OLD.`text`, OLD.`text_html`, NOW()
                    );
                END IF;

                SET NEW.`last_modified`=NOW();
            END IF;
            
            
            IF
                NEW.`type`!=OLD.`type`
                OR NEW.`oc_team_comment`!=OLD.`oc_team_comment`
                OR NEW.`date`!=OLD.`date`
                OR NEW.`needs_maintenance`!=OLD.`needs_maintenance`
                OR NEW.`listing_outdated`!=OLD.`listing_outdated`
                OR NEW.`text`!=BINARY OLD.`text`
                OR NEW.`picture`!=OLD.`picture`
            THEN
                SET NEW.`entry_last_modified`=NOW();
            END IF;
            IF NEW.`picture`!=OLD.`picture` THEN
                SET NEW.`log_last_modified`=NOW();
            END IF;
            IF NEW.`last_modified` > NEW.`log_last_modified` THEN
                SET NEW.`log_last_modified`=NEW.`last_modified`;
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLogsAfterUpdate` AFTER UPDATE ON `cache_logs`
     FOR EACH ROW BEGIN
        IF
            OLD.`cache_id`!=NEW.`cache_id`
            OR OLD.`user_id`!=NEW.`user_id`
            OR OLD.`type`!=NEW.`type`
            OR OLD.`date`!=NEW.`date`
            OR OLD.`needs_maintenance`!=NEW.`needs_maintenance`
            OR OLD.`listing_outdated`!=NEW.`listing_outdated`
        THEN
            CALL sp_update_logstat(OLD.`cache_id`, OLD.`user_id`, OLD.`type`, TRUE);
            CALL sp_update_logstat(NEW.`cache_id`, NEW.`user_id`, NEW.`type`, FALSE);
        END IF;
        IF NEW.`text`!=OLD.`text` THEN
            CALL sp_update_searchindex(1, NEW.`cache_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLogsBeforeDelete` BEFORE DELETE ON `cache_logs`
     FOR EACH ROW BEGIN
        
        SET @deleting_log=1;
        DELETE FROM `pictures` WHERE `object_type`=1 AND `object_id`=OLD.`id`;
        DELETE FROM `cache_logs_restored` WHERE `cache_logs_restored`.`id`=OLD.`id`;
        SET @deleting_log=0;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheLogsAfterDelete` AFTER DELETE ON `cache_logs`
     FOR EACH ROW BEGIN
        CALL sp_update_logstat(OLD.`cache_id`, OLD.`user_id`, OLD.`type`, TRUE);

        INSERT IGNORE INTO `removed_objects` (`localId`, `uuid`, `type`, `node`)
        VALUES (OLD.`id`, OLD.`uuid`, 1, OLD.`node`);
        CALL sp_update_searchindex(1, OLD.`cache_id`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_logs_archived`
--

DROP TABLE IF EXISTS `cache_logs_archived`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_logs_archived` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `entry_last_modified` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `okapi_syncbase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_last_modified` datetime NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `oc_team_comment` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `order_date` datetime NOT NULL,
  `needs_maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `listing_outdated` tinyint(1) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `text_html` tinyint(1) NOT NULL,
  `text_htmledit` tinyint(1) NOT NULL,
  `owner_notified` tinyint(1) NOT NULL,
  `picture` smallint(5) unsigned NOT NULL,
  `deletion_date` datetime NOT NULL,
  `deleted_by` int(10) NOT NULL DEFAULT '0',
  `restored_by` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`cache_id`),
  KEY `userid` (`user_id`),
  KEY `okapi_syncbase` (`okapi_syncbase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_logs_archived`
--

LOCK TABLES `cache_logs_archived` WRITE;
/*!40000 ALTER TABLE `cache_logs_archived` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_logs_archived` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_logs_modified`
--

DROP TABLE IF EXISTS `cache_logs_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_logs_modified` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `entry_last_modified` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `log_last_modified` datetime NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `oc_team_comment` tinyint(1) NOT NULL,
  `date` datetime NOT NULL,
  `needs_maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `listing_outdated` tinyint(1) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `text_html` tinyint(1) NOT NULL,
  `modify_date` date DEFAULT NULL,
  UNIQUE KEY `id` (`id`,`modify_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_logs_modified`
--

LOCK TABLES `cache_logs_modified` WRITE;
/*!40000 ALTER TABLE `cache_logs_modified` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_logs_modified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_logs_restored`
--

DROP TABLE IF EXISTS `cache_logs_restored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_logs_restored` (
  `id` int(10) NOT NULL,
  `date_modified` datetime NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  `original_id` int(10) unsigned NOT NULL,
  `restored_by` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `original_id` (`original_id`),
  KEY `cache_id` (`cache_id`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_logs_restored`
--

LOCK TABLES `cache_logs_restored` WRITE;
/*!40000 ALTER TABLE `cache_logs_restored` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_logs_restored` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_logtype`
--

DROP TABLE IF EXISTS `cache_logtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_logtype` (
  `cache_type_id` tinyint(3) unsigned NOT NULL,
  `log_type_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`cache_type_id`,`log_type_id`),
  KEY `log_type_id` (`log_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='obsolete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_logtype`
--

LOCK TABLES `cache_logtype` WRITE;
/*!40000 ALTER TABLE `cache_logtype` DISABLE KEYS */;
INSERT INTO `cache_logtype` (`cache_type_id`, `log_type_id`) VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,3),(6,7),(6,8),(7,1),(7,2),(7,3),(8,1),(8,2),(8,3),(9,1),(9,2),(9,3),(10,1),(10,2),(10,3);
/*!40000 ALTER TABLE `cache_logtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_maps`
--

DROP TABLE IF EXISTS `cache_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_maps` (
  `cache_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_refresh` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cache_id`),
  KEY `last_refresh` (`last_refresh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via cronjob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_maps`
--

LOCK TABLES `cache_maps` WRITE;
/*!40000 ALTER TABLE `cache_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_npa_areas`
--

DROP TABLE IF EXISTS `cache_npa_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_npa_areas` (
  `cache_id` int(10) unsigned NOT NULL,
  `npa_id` int(10) unsigned NOT NULL,
  `calculated` tinyint(1) NOT NULL,
  PRIMARY KEY (`cache_id`,`npa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_npa_areas`
--

LOCK TABLES `cache_npa_areas` WRITE;
/*!40000 ALTER TABLE `cache_npa_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_npa_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rating`
--

DROP TABLE IF EXISTS `cache_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rating` (
  `cache_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rating_date` datetime NOT NULL,
  PRIMARY KEY (`cache_id`,`user_id`),
  KEY `user_id` (`user_id`,`cache_id`),
  KEY `date` (`rating_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rating`
--

LOCK TABLES `cache_rating` WRITE;
/*!40000 ALTER TABLE `cache_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheRatingBeforeInsert` BEFORE INSERT ON `cache_rating`
     FOR EACH ROW BEGIN
        IF ISNULL(NEW.`rating_date`) OR NEW.`rating_date` < '2000' THEN
            SET NEW.`rating_date` = NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheRatingAfterInsert` AFTER INSERT ON `cache_rating`
     FOR EACH ROW BEGIN
        CALL sp_update_topratingstat(NEW.`cache_id`, FALSE);
        CALL sp_update_cachelog_rating(NEW.`cache_id`, NEW.`user_id`, NEW.`rating_date`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheRatingAfterUpdate` AFTER UPDATE ON `cache_rating`
     FOR EACH ROW BEGIN
        IF NEW.`cache_id`!=OLD.`cache_id` THEN
            CALL sp_update_topratingstat(OLD.`cache_id`, TRUE);
            CALL sp_update_topratingstat(NEW.`cache_id`, FALSE);
            CALL sp_update_cachelog_rating(OLD.`cache_id`, OLD.`user_id`, OLD.`rating_date`);
            CALL sp_update_cachelog_rating(NEW.`cache_id`, NEW.`user_id`, NEW.`rating_date`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheRatingAfterDelete` AFTER DELETE ON `cache_rating`
     FOR EACH ROW BEGIN
        CALL sp_update_topratingstat(OLD.`cache_id`, TRUE);
        CALL sp_update_cachelog_rating(OLD.`cache_id`, OLD.`user_id`, OLD.`rating_date`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_report_reasons`
--

DROP TABLE IF EXISTS `cache_report_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_report_reasons` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `order` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_report_reasons`
--

LOCK TABLES `cache_report_reasons` WRITE;
/*!40000 ALTER TABLE `cache_report_reasons` DISABLE KEYS */;
INSERT INTO `cache_report_reasons` (`id`, `name`, `trans_id`, `order`) VALUES (1,'Cache on private property',776,2),(2,'Copyright violation',777,3),(3,'Cache is gone',778,1),(4,'Other reason',779,5),(5,'Description is unusable',2609,4);
/*!40000 ALTER TABLE `cache_report_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_report_status`
--

DROP TABLE IF EXISTS `cache_report_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_report_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_report_status`
--

LOCK TABLES `cache_report_status` WRITE;
/*!40000 ALTER TABLE `cache_report_status` DISABLE KEYS */;
INSERT INTO `cache_report_status` (`id`, `name`, `trans_id`) VALUES (1,'New',773),(2,'In progress',774),(3,'Done',775);
/*!40000 ALTER TABLE `cache_report_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_reports`
--

DROP TABLE IF EXISTS `cache_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `cacheid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `reason` tinyint(3) unsigned NOT NULL,
  `note` longtext NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `adminid` int(11) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`adminid`),
  KEY `status_2` (`adminid`,`status`),
  KEY `userid` (`userid`),
  KEY `cacheid` (`cacheid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='submitted reports on caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_reports`
--

LOCK TABLES `cache_reports` WRITE;
/*!40000 ALTER TABLE `cache_reports` DISABLE KEYS */;
INSERT INTO `cache_reports` (`id`, `date_created`, `cacheid`, `userid`, `reason`, `note`, `status`, `adminid`, `lastmodified`, `comment`) VALUES (1,'2020-12-18 11:27:53',9,170299,3,'Der Webcamlink funktioniert ja überhaupt nicht!!!1!11!',1,NULL,'2020-12-18 11:27:53','');
/*!40000 ALTER TABLE `cache_reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheReportsBeforeInsert` BEFORE INSERT ON `cache_reports`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_size`
--

DROP TABLE IF EXISTS `cache_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_size` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `ordinal` tinyint(3) unsigned NOT NULL,
  `de` varchar(60) NOT NULL COMMENT 'obsolete',
  `en` varchar(60) NOT NULL COMMENT 'obsolete',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_size`
--

LOCK TABLES `cache_size` WRITE;
/*!40000 ALTER TABLE `cache_size` DISABLE KEYS */;
INSERT INTO `cache_size` (`id`, `name`, `trans_id`, `ordinal`, `de`, `en`) VALUES (1,'other size',524,7,'andere Größe','other size'),(2,'micro',525,2,'mikro','micro'),(3,'small',526,3,'klein','small'),(4,'normal',527,4,'normal','normal'),(5,'large',528,5,'groß','large'),(6,'very large',529,6,'extrem groß','very large'),(7,'no container',530,8,'kein Behälter','no container'),(8,'nano',1803,1,'nano','nano');
/*!40000 ALTER TABLE `cache_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_status`
--

DROP TABLE IF EXISTS `cache_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `de` varchar(60) NOT NULL COMMENT 'obsolete',
  `en` varchar(60) NOT NULL COMMENT 'obsolete',
  `allow_user_view` tinyint(1) NOT NULL,
  `allow_owner_edit_status` tinyint(1) NOT NULL,
  `allow_user_log` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_status`
--

LOCK TABLES `cache_status` WRITE;
/*!40000 ALTER TABLE `cache_status` DISABLE KEYS */;
INSERT INTO `cache_status` (`id`, `name`, `trans_id`, `de`, `en`, `allow_user_view`, `allow_owner_edit_status`, `allow_user_log`) VALUES (1,'Available',531,'Kann gesucht werden','Available',1,1,1),(2,'Temporarily not available',532,'Momentan nicht verfügbar','Temporarily not available',1,1,1),(3,'Archived',496,'Archiviert','Archived',1,1,1),(4,'Hidden by approvers to check',533,'Von den Approvern entfernt, um geürpft zu werden','Hidden by approvers to check',0,1,0),(5,'Not yet published',534,'Noch nicht veröffentlicht','Not yet published',0,1,0),(6,'Locked, visible',821,'','',1,1,0),(7,'Locked, invisible',822,'','',0,0,0);
/*!40000 ALTER TABLE `cache_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_status_modified`
--

DROP TABLE IF EXISTS `cache_status_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_status_modified` (
  `cache_id` int(10) unsigned NOT NULL,
  `date_modified` datetime NOT NULL,
  `old_state` tinyint(2) unsigned NOT NULL,
  `new_state` tinyint(2) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cache_id` (`cache_id`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_status_modified`
--

LOCK TABLES `cache_status_modified` WRITE;
/*!40000 ALTER TABLE `cache_status_modified` DISABLE KEYS */;
INSERT INTO `cache_status_modified` (`cache_id`, `date_modified`, `old_state`, `new_state`, `user_id`) VALUES (3,'2020-12-17 13:46:34',5,1,107469),(9,'2020-12-18 08:48:40',1,2,170290),(9,'2020-12-18 08:55:40',2,3,170290),(22,'2020-12-18 11:15:32',1,6,107469);
/*!40000 ALTER TABLE `cache_status_modified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_type`
--

DROP TABLE IF EXISTS `cache_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) NOT NULL,
  `ordinal` tinyint(3) unsigned NOT NULL,
  `short` varchar(10) NOT NULL COMMENT 'obsolete',
  `de` varchar(60) NOT NULL COMMENT 'obsolete',
  `en` varchar(60) NOT NULL COMMENT 'obsolete',
  `icon_large` varchar(60) NOT NULL COMMENT 'obsolete',
  `short2` varchar(15) NOT NULL,
  `short2_trans_id` int(10) NOT NULL,
  `kml_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_type`
--

LOCK TABLES `cache_type` WRITE;
/*!40000 ALTER TABLE `cache_type` DISABLE KEYS */;
INSERT INTO `cache_type` (`id`, `name`, `trans_id`, `ordinal`, `short`, `de`, `en`, `icon_large`, `short2`, `short2_trans_id`, `kml_name`) VALUES (1,'Unknown cache type',535,10,'Other','unbekannter Cachetyp','Unknown cache type','unknown.gif','Unknown',862,'unknown'),(2,'Traditional Cache',536,1,'Trad.','normaler Cache','Traditional Cache','traditional.gif','Traditional',1855,'tradi'),(3,'Multicache',514,3,'Multi','Multicache','Multicache','multi.gif','Multicache',514,'multi'),(4,'Virtual Cache',537,7,'Virt.','virtueller Cache','Virtual Cache','virtual.gif','Virtual',1857,'virtual'),(5,'Webcam Cache',538,8,'ICam.','Webcam-Cache','Webcam Cache','webcam.gif','Webcam',1572,'webcam'),(6,'Event Cache',539,9,'Event','Event-Cache','Event Cache','event.gif','Event',1859,'event'),(7,'Quiz Cache',518,4,'Quiz','Rätselcache','Quiz Cache','mystery.gif','Quiz',1860,'mystery'),(8,'Math/Physics Cache',540,5,'Math','Mathe-/Physikcache','Math/Physics Cache','mathe.gif','Math/Physics',1861,'mathe'),(9,'Moving Cache',541,6,'Moving','beweglicher Cache','Moving Cache','moving.gif','Moving',1862,'moving'),(10,'Drive-in Cache',542,2,'Driv.','Drive-In-Cache','Drive-in Cache','drivein.gif','Drive-in',1863,'drivein');
/*!40000 ALTER TABLE `cache_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_visits`
--

DROP TABLE IF EXISTS `cache_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_visits` (
  `cache_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_ip` varchar(15) NOT NULL DEFAULT '0',
  `count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'via trigger (cache_visits)',
  PRIMARY KEY (`cache_id`,`user_id_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_visits`
--

LOCK TABLES `cache_visits` WRITE;
/*!40000 ALTER TABLE `cache_visits` DISABLE KEYS */;
INSERT INTO `cache_visits` (`cache_id`, `user_id_ip`, `count`, `last_modified`) VALUES (1,'107469',2,'2020-12-18 13:26:38'),(3,'0',3,'2020-12-18 11:22:54'),(3,'107469',1,'2020-12-18 11:16:08'),(3,'170293',3,'2020-12-18 09:25:19'),(3,'170298',2,'2020-12-18 11:12:58'),(3,'170299',2,'2020-12-18 11:23:21'),(4,'0',1,'2020-12-18 13:27:21'),(4,'107469',1,'2020-12-18 13:27:21'),(4,'170289',3,'2020-12-18 13:29:22'),(5,'170289',3,'2020-12-17 14:31:25'),(6,'170289',3,'2020-12-17 14:44:14'),(8,'0',1,'2020-12-18 08:45:02'),(8,'170291',2,'2020-12-18 09:11:19'),(9,'0',2,'2020-12-18 11:27:29'),(9,'170290',7,'2020-12-18 08:55:42'),(9,'170291',6,'2020-12-18 08:47:02'),(9,'170299',1,'2020-12-18 11:27:29'),(10,'0',2,'2020-12-18 13:09:38'),(10,'107469',2,'2020-12-18 13:10:48'),(10,'170291',4,'2020-12-18 09:10:50'),(10,'170292',2,'2020-12-18 10:45:20'),(12,'0',1,'2020-12-18 11:26:29'),(12,'170293',2,'2020-12-18 09:23:41'),(12,'170299',1,'2020-12-18 11:26:29'),(14,'170294',1,'2020-12-18 09:45:28'),(15,'170294',8,'2020-12-18 10:04:20'),(17,'170295',6,'2020-12-18 10:20:09'),(18,'170296',2,'2020-12-18 10:24:47'),(19,'0',1,'2020-12-18 11:12:12'),(19,'170296',3,'2020-12-18 10:33:37'),(19,'170298',1,'2020-12-18 11:12:12'),(22,'0',1,'2020-12-18 11:15:54'),(22,'107469',1,'2020-12-18 11:15:54'),(22,'170298',1,'2020-12-18 11:11:17'),(23,'170299',1,'2020-12-18 11:22:28');
/*!40000 ALTER TABLE `cache_visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheVisitsBeforeInsert` BEFORE INSERT ON `cache_visits`
     FOR EACH ROW BEGIN
        SET NEW.`last_modified`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheVisitsBeforeUpdate` BEFORE UPDATE ON `cache_visits`
     FOR EACH ROW
     BEGIN
        SET NEW.`last_modified`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_watches`
--

DROP TABLE IF EXISTS `cache_watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_watches` (
  `cache_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cache_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_watches`
--

LOCK TABLES `cache_watches` WRITE;
/*!40000 ALTER TABLE `cache_watches` DISABLE KEYS */;
INSERT INTO `cache_watches` (`cache_id`, `user_id`) VALUES (3,170293),(9,170291);
/*!40000 ALTER TABLE `cache_watches` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheWatchesAfterInsert` AFTER INSERT ON `cache_watches`
     FOR EACH ROW BEGIN
        CALL sp_update_watchstat(NEW.`cache_id`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheWatchesAfterUpdate` AFTER UPDATE ON `cache_watches`
     FOR EACH ROW BEGIN
        IF NEW.`cache_id`!=OLD.`cache_id` THEN
            CALL sp_update_watchstat(OLD.`cache_id`);
            CALL sp_update_watchstat(NEW.`cache_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheWatchesAfterDelete` AFTER DELETE ON `cache_watches`
     FOR EACH ROW BEGIN
        CALL sp_update_watchstat(OLD.`cache_id`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache_waypoint_pool`
--

DROP TABLE IF EXISTS `cache_waypoint_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_waypoint_pool` (
  `wp_oc` char(7) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`wp_oc`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_waypoint_pool`
--

LOCK TABLES `cache_waypoint_pool` WRITE;
/*!40000 ALTER TABLE `cache_waypoint_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_waypoint_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caches`
--

DROP TABLE IF EXISTS `caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caches` (
  `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL COMMENT 'via Trigger (caches)',
  `is_publishdate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = date_created is publication date',
  `last_modified` datetime NOT NULL COMMENT 'via Trigger (caches)',
  `okapi_syncbase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `listing_last_modified` datetime NOT NULL COMMENT 'via Trigger (caches, cache_desc, coordinates, pictures)',
  `meta_last_modified` datetime NOT NULL COMMENT 'via Trigger (stat_caches, gk_item_waypoint)',
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `country` char(2) NOT NULL,
  `date_hidden` date NOT NULL,
  `size` tinyint(3) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL,
  `terrain` tinyint(3) unsigned NOT NULL,
  `logpw` varchar(20) DEFAULT NULL,
  `search_time` float unsigned NOT NULL DEFAULT '0',
  `way_length` float unsigned NOT NULL DEFAULT '0',
  `wp_gc` varchar(7) NOT NULL,
  `wp_gc_maintained` varchar(7) NOT NULL,
  `wp_nc` varchar(6) NOT NULL COMMENT 'obsolete',
  `wp_oc` varchar(6) DEFAULT NULL,
  `desc_languages` varchar(60) NOT NULL COMMENT 'via Trigger (cache_desc)',
  `default_desclang` char(2) NOT NULL,
  `date_activate` datetime DEFAULT NULL,
  `need_npa_recalc` tinyint(1) NOT NULL,
  `show_cachelists` tinyint(1) NOT NULL DEFAULT '1',
  `protect_old_coords` tinyint(1) NOT NULL DEFAULT '0',
  `needs_maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `listing_outdated` tinyint(1) NOT NULL DEFAULT '0',
  `flags_last_modified` datetime NOT NULL COMMENT 'via Trigger (caches)',
  PRIMARY KEY (`cache_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `wp_oc` (`wp_oc`),
  KEY `longitude` (`longitude`,`latitude`),
  KEY `date_created` (`date_created`),
  KEY `latitude` (`latitude`),
  KEY `country` (`country`),
  KEY `status` (`status`,`date_activate`),
  KEY `last_modified` (`last_modified`),
  KEY `wp_gc` (`wp_gc`),
  KEY `user_id` (`user_id`),
  KEY `date_activate` (`date_activate`),
  KEY `need_npa_recalc` (`need_npa_recalc`),
  KEY `type` (`type`),
  KEY `size` (`size`),
  KEY `difficulty` (`difficulty`),
  KEY `terrain` (`terrain`),
  KEY `wp_gc_maintained` (`wp_gc_maintained`),
  KEY `okapi_syncbase` (`okapi_syncbase`),
  KEY `date_hidden` (`date_hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caches`
--

LOCK TABLES `caches` WRITE;
/*!40000 ALTER TABLE `caches` DISABLE KEYS */;
INSERT INTO `caches` (`cache_id`, `uuid`, `node`, `date_created`, `is_publishdate`, `last_modified`, `okapi_syncbase`, `listing_last_modified`, `meta_last_modified`, `user_id`, `name`, `longitude`, `latitude`, `type`, `status`, `country`, `date_hidden`, `size`, `difficulty`, `terrain`, `logpw`, `search_time`, `way_length`, `wp_gc`, `wp_gc_maintained`, `wp_nc`, `wp_oc`, `desc_languages`, `default_desclang`, `date_activate`, `need_npa_recalc`, `show_cachelists`, `protect_old_coords`, `needs_maintenance`, `listing_outdated`, `flags_last_modified`) VALUES (1,'8d2d2b91-3fd8-11eb-96df-0242ac120002',4,'2020-12-17 13:38:05',1,'2020-12-18 13:26:31','2020-12-18 13:26:31','2020-12-18 13:26:31','0000-00-00 00:00:00',107469,'WANTED - Der Osterhase',6.9038833333333,51.965583333333,2,1,'DE','2015-03-30',8,2,10,'',0,0,'GC5QCNX','GC5QCNX','','OC1001','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(3,'a242b35c-3fd9-11eb-96df-0242ac120002',4,'2020-12-17 13:46:34',1,'2020-12-17 13:46:34','2020-12-18 11:23:18','2020-12-17 13:46:34','2020-12-18 11:23:18',107469,'Imkerei Taufkirchen (Projekt 12)',11.593333333333,48.046383333333,10,1,'DE','2015-02-14',2,3,9,'',0,0,'','','','OC1002','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(4,'30b28668-3fde-11eb-96df-0242ac120002',4,'2020-12-17 14:18:27',1,'2020-12-18 13:29:20','2020-12-18 13:29:20','2020-12-18 13:29:20','0000-00-00 00:00:00',170289,'Töpferstadt Stadtlohn (ö,ä,ü,ß,Ö,Ä,Ü)',6.9160833333333,51.99065,3,1,'DE','2014-08-08',3,4,8,'',24,25,'GC57KTC','GC57KTC','','OC1003','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(5,'e640f512-3fde-11eb-96df-0242ac120002',4,'2020-12-17 14:23:31',1,'2020-12-17 14:24:01','2020-12-17 14:32:49','2020-12-17 14:32:49','2020-12-17 14:32:49',170289,'\"Perspektivwechsel\"',6.9104,51.988283333333,7,1,'DE','2013-12-04',4,5,7,'',1.51667,0,'GC4V0YC','GC4V0YC','','OC1004','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(6,'81221e56-3fdf-11eb-96df-0242ac120002',4,'2020-12-17 14:27:51',1,'2020-12-17 14:27:51','2020-12-17 14:30:56','2020-12-17 14:30:56','2020-12-17 14:30:56',170289,'Der verschwundene Opencache',13.014133333333,47.648083333333,8,1,'DE','2018-10-02',5,6,6,'',0,0,'','','','OC1005','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(7,'f8cbd174-4039-11eb-96df-0242ac120002',4,'2020-12-18 08:23:47',1,'2020-12-18 08:23:47','2020-12-18 08:23:47','2020-12-18 08:23:47','0000-00-00 00:00:00',170290,'GaswerkAugsburg on Tour',10.865333333333,48.3865,9,1,'DE','2018-06-19',6,7,5,'',0,0,'','','','OC1006','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(8,'87986547-403a-11eb-96df-0242ac120002',4,'2020-12-18 08:27:46',1,'2020-12-18 08:27:46','2020-12-18 08:27:46','2020-12-18 08:27:46','0000-00-00 00:00:00',170290,'#Safari: Freizeitpark Junkies vs. Spass',12.906383333333,54.921533333333,4,1,'DE','2015-07-15',7,8,4,'',0,0,'','','','OC1007','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(9,'2b6ac7f2-403b-11eb-96df-0242ac120002',4,'2020-12-18 08:32:21',1,'2020-12-18 08:55:40','2020-12-18 08:55:40','2020-12-18 08:55:40','2020-12-18 08:47:00',170290,'Seukendorfer Waschstraßenwebcamcache',10.867633333333,49.480583333333,5,3,'DE','2017-04-08',7,9,3,'',0.333333,0,'','','','OC1008','DE,EN','DE',NULL,1,1,0,0,0,'2020-12-18 08:55:40'),(10,'121511b6-4040-11eb-96df-0242ac120002',4,'2020-12-18 09:07:26',1,'2020-12-18 13:10:43','2020-12-18 13:10:43','2020-12-18 13:10:43','2020-12-18 10:45:18',170291,'4. Weihnachtsmarktevent beim Kurhaus (GC&OC gemeinsam)',2.9120166666667,51.231766666667,6,1,'BE','2525-06-01',7,10,2,'Kurhaus',3.01667,0,'GC8CFY1','GC8CFY1','','OC1009','EN','EN',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(11,'57ee0b4c-4041-11eb-96df-0242ac120002',4,'2020-12-18 09:16:33',1,'2020-12-18 09:16:33','2020-12-18 09:16:33','2020-12-18 09:16:33','0000-00-00 00:00:00',170291,'WiG - unterm Zaun durch!',6.7019,51.622033333333,1,1,'DE','2012-03-06',3,2,2,'',0,3.45,'GC3MTAC','GC3MTAC','','OC100A','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(12,'3bc93fc3-4042-11eb-96df-0242ac120002',4,'2020-12-18 09:22:55',1,'2020-12-18 09:23:37','2020-12-18 09:23:37','2020-12-18 09:23:37','0000-00-00 00:00:00',170293,'Geocaching Award Kreis Borken 2013 (TB-Hotel)',6.8514166666667,51.930683333333,2,1,'DE','2014-02-08',8,10,10,'',0,10,'GC6AMMK','GC6AMMK','','OC100B','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(13,'1779a814-4043-11eb-96df-0242ac120002',4,'2020-12-18 09:29:03',1,'2020-12-18 09:29:04','2020-12-18 09:29:04','2020-12-18 09:29:04','0000-00-00 00:00:00',170293,'Shrike',28.071833333333,-26.536933333333,10,1,'ZA','2017-08-23',2,10,2,'',0,0,'','','','OC100C','EN','EN',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(14,'5f1fcb67-4045-11eb-96df-0242ac120002',4,'2020-12-18 09:45:23',1,'2020-12-18 09:45:25','2020-12-18 09:45:25','2020-12-18 09:45:25','0000-00-00 00:00:00',170294,'Trubel am Alaskaer Weihnachtshimmel (NC)',-168.08986666667,65.612866666667,3,1,'US','2016-12-14',4,9,3,'ALASKA',0,0,'','','','OC100D','EN','EN',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(15,'63a7590f-4047-11eb-96df-0242ac120002',4,'2020-12-18 09:59:49',1,'2020-12-18 10:05:24','2020-12-18 10:05:24','2020-12-18 10:05:24','2020-12-18 10:00:51',170294,'Voerde wo bin ich - 04 Sternzeichen/ Ð³Ð´Ðµ Ñ - Ð·Ð½Ð°Ðº Ð·Ð¾Ð´Ð¸Ð°ÐºÐ° 04',33.572216666667,59.35555,7,1,'RU','2012-10-24',5,8,4,'',0,0.2,'','','','OC100E','RU','RU',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(16,'3c7e5c12-4049-11eb-96df-0242ac120002',4,'2020-12-18 10:13:03',1,'2020-12-18 10:13:03','2020-12-18 10:13:03','2020-12-18 10:13:03','0000-00-00 00:00:00',170295,'Den Sternen so nah...',9.527,54.838733333333,8,1,'DE','2018-11-13',6,7,5,'',999.983,0,'GC71NED','GC71NED','','OC100F','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(17,'bf785581-4049-11eb-96df-0242ac120002',4,'2020-12-18 10:16:42',1,'2020-12-18 10:20:00','2020-12-18 10:20:00','2020-12-18 10:20:00','0000-00-00 00:00:00',170295,'Die Wanderdose',11.628583333333,48.213733333333,9,1,'JP','2016-05-03',3,6,6,'',0,0,'','','','OC1010','DE','DE',NULL,1,1,1,0,0,'0000-00-00 00:00:00'),(18,'ab3e4b6c-404a-11eb-96df-0242ac120002',4,'2020-12-18 10:23:18',1,'2020-12-18 10:24:35','2020-12-18 10:24:35','2020-12-18 10:24:35','0000-00-00 00:00:00',170296,'Aus Tradition - Gestern noch ein König!',6.7346166666667,51.476033333333,4,1,'DE','2013-08-04',7,5,7,'KÖNIG',0,0,'','','','OC1011','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(19,'ae8b629f-404b-11eb-96df-0242ac120002',4,'2020-12-18 10:30:33',1,'2020-12-18 10:32:46','2020-12-18 10:33:26','2020-12-18 10:33:26','2020-12-18 10:33:26',170296,'Vorsicht Kamera!',9.5247666666667,54.8373,5,1,'DE','2019-07-31',7,4,8,'',0,0,'','','','OC1012','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(20,'fcff3d23-404c-11eb-96df-0242ac120002',4,'2020-12-18 10:39:54',1,'2020-12-18 10:39:54','2020-12-18 10:39:54','2020-12-18 10:39:54','0000-00-00 00:00:00',170292,'1. Trierer OC-Stammtisch',6.63895,49.754683333333,6,1,'DE','2025-12-09',1,3,9,'',1.5,0,'','','','OC1013','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(21,'adf5497a-404d-11eb-96df-0242ac120002',4,'2020-12-18 10:44:51',1,'2020-12-18 10:44:51','2020-12-18 10:44:51','2020-12-18 10:44:51','0000-00-00 00:00:00',170292,'Der Laputische Gruß',-77,38.8976,1,1,'US','2005-12-02',8,2,10,'',0,0,'','','','OC1014','EN','EN',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(22,'5dd76437-4051-11eb-96df-0242ac120002',4,'2020-12-18 11:11:15',1,'2020-12-18 11:15:32','2020-12-18 11:15:32','2020-12-18 11:15:32','2020-12-18 11:15:32',170298,'A cache by Gesperrter Nutzer',11.185183333333,44.740733333333,2,6,'DE','2020-12-18',5,3,4,'',0,0,'','','','OC1015','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00'),(23,'ee616df5-4052-11eb-96df-0242ac120002',4,'2020-12-18 11:22:26',1,'2020-12-18 11:22:27','2020-12-18 11:22:27','2020-12-18 11:22:27','0000-00-00 00:00:00',170299,'\"Mein Cache\" by DSGVO gelöschter Nutzer',11.185183333333,55.925916666667,2,1,'DE','2020-12-18',3,5,7,'',0,0,'','','','OC1016','DE','DE',NULL,1,1,0,0,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `caches` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cachesBeforeInsert` BEFORE INSERT ON `caches`
     FOR EACH ROW BEGIN
        SET @dont_update_listingdate=1;

        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`last_modified`=NOW();
            SET NEW.`listing_last_modified`=NOW();
        END IF;
        IF NEW.`status` <> 5 THEN
            SET NEW.`is_publishdate`=1;
        END IF;
        IF SUBSTR(TRIM(NEW.`wp_gc`),1,2)='GC' THEN
            SET NEW.`wp_gc_maintained`=UCASE(TRIM(NEW.`wp_gc`));
        END IF;
        SET NEW.`need_npa_recalc`=1;

        IF ISNULL(NEW.`uuid`) OR NEW.`uuid`='' THEN
            SET NEW.`uuid`=CREATE_UUID();
        END IF;

        
        IF ISNULL(NEW.`wp_oc`) OR NEW.`wp_oc`='' THEN

            
            UPDATE `cache_waypoint_pool`
            SET `uuid`=NEW.`uuid`
            WHERE `uuid` IS NULL ORDER BY WPTODEC(`wp_oc`, 'OC') ASC LIMIT 1;
                    
            IF (SELECT COUNT(*) FROM `cache_waypoint_pool` WHERE `uuid`=NEW.`uuid`) = 0 THEN

                
                INSERT INTO `cache_waypoint_pool` (`wp_oc`, `uuid`)
                    SELECT DECTOWP(MAX(`dec_wp`)+1, 'OC'), NEW.`uuid` AS `uuid`
                    FROM
                        (SELECT MAX(WPTODEC(`wp_oc`, 'OC')) AS dec_wp FROM `caches` WHERE `wp_oc` REGEXP '^OC[0123456789ABCDEF]{1,}$'
                         UNION SELECT MAX(WPTODEC(`wp_oc`, 'OC')) AS dec_wp FROM `cache_waypoint_pool`
                        ) AS `tbl`;
            END IF;

            
            SET NEW.`wp_oc` =
                (SELECT `wp_oc` FROM `cache_waypoint_pool` WHERE `uuid`=`NEW`.`uuid`);
        END IF;

        SET @dont_update_listingdate=0;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cachesAfterInsert` AFTER INSERT ON `caches`
     FOR EACH ROW BEGIN
        SET @dont_update_listingdate=1;

        INSERT IGNORE INTO `cache_coordinates` (`cache_id`, `date_created`, `longitude`, `latitude`)
        VALUES (NEW.`cache_id`, NOW(), NEW.`longitude`, NEW.`latitude`);

        INSERT IGNORE INTO `cache_countries` (`cache_id`, `date_created`, `country`)
        VALUES (NEW.`cache_id`, NOW(), NEW.`country`);

        CALL sp_update_hiddenstat(NEW.`user_id`, NEW.`status`, FALSE);
        CALL sp_update_searchindex(2, NEW.`cache_id`);

        IF NEW.`status`=1 THEN
            CALL sp_notify_new_cache(NEW.`cache_id`, NEW.`longitude`, NEW.`latitude`, 1);
        END IF;

        
        DELETE FROM `cache_waypoint_pool` WHERE `uuid`=NEW.`uuid`;

        SET @dont_update_listingdate=0;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cachesBeforeUpdate` BEFORE UPDATE ON `caches`
     FOR EACH ROW BEGIN
        SET @dont_update_listingdate=1;

        
        IF NEW.`status` != OLD.`status` AND NEW.`status` IN (4,5,6,7) THEN
            SET NEW.`needs_maintenance`=0;
            SET NEW.`listing_outdated`=0;
        END IF;

        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            IF
                OLD.`cache_id`!=NEW.`cache_id`
                OR OLD.`uuid`!=BINARY NEW.`uuid`
                OR OLD.`node`!=NEW.`node`
                OR OLD.`date_created`!=NEW.`date_created`
                OR OLD.`is_publishdate`!=NEW.`is_publishdate`
                OR OLD.`user_id`!=NEW.`user_id`
                OR OLD.`name`!=BINARY NEW.`name`
                OR OLD.`longitude`!=NEW.`longitude`
                OR OLD.`latitude`!=NEW.`latitude`
                OR OLD.`type`!=NEW.`type`
                OR OLD.`status`!=NEW.`status`
                OR OLD.`country`!=BINARY NEW.`country`
                OR OLD.`date_hidden`!=NEW.`date_hidden`
                OR OLD.`size`!=NEW.`size`
                OR OLD.`difficulty`!=NEW.`difficulty`
                OR OLD.`terrain`!=NEW.`terrain`
                OR OLD.`logpw`!=BINARY NEW.`logpw`
                OR OLD.`search_time`!=NEW.`search_time`
                OR OLD.`way_length`!=NEW.`way_length`
                OR OLD.`wp_gc`!=BINARY NEW.`wp_gc`
                OR OLD.`wp_nc`!=BINARY NEW.`wp_nc`
                OR OLD.`wp_oc`!=BINARY NEW.`wp_oc`
                OR OLD.`default_desclang`!=BINARY NEW.`default_desclang`
                OR OLD.`date_activate`!=NEW.`date_activate`
                OR OLD.`show_cachelists`!=NEW.`show_cachelists`
            THEN
                SET NEW.`last_modified`=NOW();
            END IF;

            IF
                OLD.`needs_maintenance`!=NEW.`needs_maintenance`
                OR OLD.`listing_outdated`!=NEW.`listing_outdated`
                OR OLD.`wp_gc_maintained`!=NEW.`wp_gc_maintained`
            THEN
                SET NEW.`flags_last_modified`=NOW();
            END IF;

            IF NEW.`last_modified` != OLD.`last_modified` THEN
                SET NEW.`listing_last_modified`=NOW();
            END IF;

            IF OLD.`status`!=NEW.`status` THEN
                CALL sp_touch_cache(OLD.`cache_id`, FALSE);
            END IF;
        END IF;

        IF
            NEW.`wp_gc`<>OLD.`wp_gc` AND
            (SUBSTR(TRIM(NEW.`wp_gc`),1,2)='GC' OR TRIM(NEW.`wp_gc`)='')
        THEN
            SET NEW.`wp_gc_maintained`=UCASE(TRIM(NEW.`wp_gc`));
        END IF;

        IF OLD.`longitude`!=NEW.`longitude` OR OLD.`latitude`!=NEW.`latitude` THEN
            SET NEW.`need_npa_recalc`=1;
        END IF;

        IF OLD.`status`=5 AND NEW.`status`<>5 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`is_publishdate`=1;
        END IF;

        SET @dont_update_listingdate=0;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cachesAfterUpdate` AFTER UPDATE ON `caches`
     FOR EACH ROW BEGIN
        SET @dont_update_listingdate=1;

        IF
            ROUND(NEW.`longitude`,6) != ROUND(OLD.`longitude`,6)
            OR ROUND(NEW.`latitude`,6) != ROUND(OLD.`latitude`,6)
        THEN
            INSERT IGNORE INTO `cache_coordinates`
                (`cache_id`, `date_created`, `longitude`, `latitude`, `restored_by`)
            VALUES (NEW.`cache_id`, NOW(), NEW.`longitude`, NEW.`latitude`, IFNULL(@restoredby,0));
        END IF;

        IF NEW.`country` != OLD.`country` THEN
            INSERT IGNORE INTO `cache_countries`
                (`cache_id`, `date_created`, `country`, `restored_by`)
            VALUES (NEW.`cache_id`, NOW(), NEW.`country`, IFNULL(@restoredby,0));
        END IF;

        IF
            NEW.`cache_id` = OLD.`cache_id`
            AND OLD.`status` <> 5
            AND OLD.`date_created` < LEFT(NOW(),10)
            AND (
                NEW.`name` != OLD.`name`
                OR NEW.`type` != OLD.`type`
                OR NEW.`date_hidden` != OLD.`date_hidden`
                OR NEW.`size` != OLD.`size`
                OR NEW.`difficulty` != OLD.`difficulty`
                OR NEW.`terrain` != OLD.`terrain`
                OR NEW.`search_time` != OLD.`search_time`
                OR NEW.`way_length` != OLD.`way_length`
                OR NEW.`wp_gc` != OLD.`wp_gc`
                OR NEW.`wp_nc` != OLD.`wp_nc`
            )
        THEN
            INSERT IGNORE INTO `caches_modified` (
                `cache_id`, `date_modified`, `name`, `type`, `date_hidden`, `size`,
                `difficulty`, `terrain`, `search_time`, `way_length`, `wp_gc`,
                `wp_nc`, `restored_by`
            ) VALUES (
                OLD.`cache_id`, NOW(), OLD.`name`, OLD.`type`, OLD.`date_hidden`, OLD.`size`,
                OLD.`difficulty`, OLD.`terrain`, OLD.`search_time`, OLD.`way_length`, OLD.`wp_gc`,
                OLD.`wp_nc`, IFNULL(@restoredby,0)
            );
            
            
        END IF;

        IF NEW.`user_id`!=OLD.`user_id` THEN
            INSERT INTO `cache_adoptions` (`cache_id`,`date`,`from_user_id`,`to_user_id`)
            VALUES (NEW.`cache_id`, NEW.`last_modified`, OLD.`user_id`, NEW.`user_id`);
        END IF;
        IF NEW.`name`!=OLD.`name` THEN
            CALL sp_update_searchindex(2, NEW.`cache_id`);
        END IF;
        IF NEW.`user_id`!=OLD.`user_id` OR NEW.`status`!=OLD.`status` THEN
            CALL sp_update_hiddenstat(OLD.`user_id`, OLD.`status`, TRUE);
            CALL sp_update_hiddenstat(NEW.`user_id`, NEW.`status`, FALSE);
        END IF;
        IF OLD.`status`=5 AND NEW.`status`=1 THEN
            CALL sp_notify_new_cache(NEW.`cache_id`, NEW.`longitude`, NEW.`latitude`, 1);
        END IF;
        IF NEW.`status`<>OLD.`status` THEN
            INSERT INTO `cache_status_modified`
                (`cache_id`, `date_modified`, `old_state`, `new_state`, `user_id`)
            VALUES (NEW.`cache_id`, NOW(), OLD.`status`, NEW.`status`, IFNULL(@STATUS_CHANGE_USER_ID,0));
        END IF;
        
        SET @dont_update_listingdate=0;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cachesBeforeDelete` BEFORE DELETE ON `caches`
     FOR EACH ROW BEGIN
        IF IFNULL(@allowdelete,0) = 0 THEN
            CALL error_set_allowdelete_to_delete_caches();
            
        ELSEIF IFNULL(@fastdelete,0) = 0 THEN
            
            SET @dont_update_listingdate=1;
            SET @deleting_cache=1;
            
            DELETE FROM `cache_adoption` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_adoptions` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_coordinates` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_countries` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_desc` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_desc_modified` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_ignore` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_list_items` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_location` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_logs` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_logs_archived` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_maps` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_npa_areas` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_rating` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_reports` WHERE `cacheid`=OLD.`cache_id`;   
            DELETE FROM `cache_status_modified` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_visits` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `cache_watches` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `caches_attributes` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `caches_attributes_modified` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `caches_modified` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `coordinates` WHERE `cache_id`=OLD.`cache_id`;
            
            DELETE FROM `notify_waiting` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `pictures` WHERE `object_type`=2 AND `object_id`=OLD.`cache_id`;
            DELETE FROM `rating_tops` WHERE `cache_id`=OLD.`cache_id`;
            
            DELETE FROM `stat_cache_logs` WHERE `cache_id`=OLD.`cache_id`;
            DELETE FROM `stat_caches` WHERE `cache_id`=OLD.`cache_id`;
            
            SET @dont_update_listingdate=0;
            SET @deleting_cache=0;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cachesAfterDelete` AFTER DELETE ON `caches`
     FOR EACH ROW BEGIN
        INSERT IGNORE INTO `removed_objects` (`localId`, `uuid`, `type`, `node`)
        VALUES (OLD.`cache_id`, OLD.`uuid`, 2, OLD.`node`);
        
        CALL sp_update_hiddenstat(OLD.`user_id`, OLD.`status`, TRUE);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `caches_attributes`
--

DROP TABLE IF EXISTS `caches_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caches_attributes` (
  `cache_id` int(10) unsigned NOT NULL,
  `attrib_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`cache_id`,`attrib_id`),
  KEY `attrib_id` (`attrib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caches_attributes`
--

LOCK TABLES `caches_attributes` WRITE;
/*!40000 ALTER TABLE `caches_attributes` DISABLE KEYS */;
INSERT INTO `caches_attributes` (`cache_id`, `attrib_id`) VALUES (1,24),(1,40),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(10,9),(10,17),(12,18),(14,9),(14,10),(14,11),(14,12),(14,13),(14,14),(14,15),(14,16),(14,17),(22,9),(22,11),(22,13),(22,15),(22,17),(23,10),(23,12),(23,14),(23,16),(23,18);
/*!40000 ALTER TABLE `caches_attributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheAttributesAfterInsert` AFTER INSERT ON `caches_attributes`
     FOR EACH ROW BEGIN
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            UPDATE `caches` SET `last_modified`=NOW() WHERE `cache_id`=NEW.`cache_id`;
            CALL sp_update_cache_listingdate(NEW.`cache_id`);
        END IF;
        IF
            (SELECT `status` FROM `caches` WHERE `cache_id`=NEW.`cache_id`) != 5
            AND (SELECT `date_created` FROM `caches` WHERE `cache_id`=NEW.`cache_id`) < LEFT(NOW(),10)
        THEN
            INSERT IGNORE INTO `caches_attributes_modified`
                (`cache_id`, `attrib_id`, `date_modified`, `was_set`, `restored_by`)
                VALUES (NEW.`cache_id`, NEW.`attrib_id`, NOW(), 0, IFNULL(@restoredby,0));
        END IF;
        IF (
            NEW.`attrib_id`=6
            AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=NEW.`cache_id`) <= 2)
        THEN
            CALL sp_notify_new_cache(
                NEW.`cache_id`,
                (SELECT `longitude` FROM `caches` WHERE `caches`.`cache_id`=NEW.`cache_id`),
                (SELECT `latitude` FROM `caches` WHERE `caches`.`cache_id`=NEW.`cache_id`),
                2
            );
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheAttributesAfterUpdate` AFTER UPDATE ON `caches_attributes`
     FOR EACH ROW BEGIN
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            UPDATE `caches` SET `last_modified`=NOW() WHERE `cache_id`=NEW.`cache_id`;
            CALL sp_update_cache_listingdate(NEW.`cache_id`);
            IF OLD.`cache_id`!=NEW.`cache_id` THEN
                UPDATE `caches` SET `last_modified`=NOW() WHERE `cache_id`=OLD.`cache_id`;
                CALL sp_update_cache_listingdate(OLD.`cache_id`);
            END IF;
        END IF;
        IF
            NEW.`attrib_id`=6
            AND OLD.`attrib_id`<>6
            AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=NEW.`cache_id`) <= 2
        THEN
            CALL sp_notify_new_cache(
                NEW.`cache_id`,
                (SELECT `longitude` FROM `caches` WHERE `caches`.`cache_id`=NEW.`cache_id`),
                (SELECT `latitude` FROM `caches` WHERE `caches`.`cache_id`=NEW.`cache_id`),
                2
            );
        END IF;
        
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `cacheAttributesAfterDelete` AFTER DELETE ON `caches_attributes`
     FOR EACH ROW BEGIN
        IF IFNULL(@deleting_cache,0)=0 THEN
            IF (ISNULL(@XMLSYNC) OR @XMLSYNC!=1) THEN
                UPDATE `caches` SET `last_modified`=NOW() WHERE `cache_id`=OLD.`cache_id`;
                CALL sp_update_cache_listingdate(OLD.`cache_id`);
            END IF;
            IF
                (SELECT `status` FROM `caches` WHERE `cache_id`=OLD.`cache_id`) != 5
                AND (SELECT `date_created` FROM `caches` WHERE `cache_id`=OLD.`cache_id`) < LEFT(NOW(),10)
            THEN
                INSERT IGNORE INTO `caches_attributes_modified` (`cache_id`, `attrib_id`, `date_modified`, `was_set`, `restored_by`) VALUES (OLD.`cache_id`, OLD.`attrib_id`, NOW(), 1, IFNULL(@restoredby,0));
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `caches_attributes_modified`
--

DROP TABLE IF EXISTS `caches_attributes_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caches_attributes_modified` (
  `cache_id` int(10) unsigned NOT NULL,
  `attrib_id` tinyint(3) unsigned NOT NULL,
  `date_modified` date NOT NULL COMMENT 'no time! see restorecaches.php',
  `was_set` tinyint(1) unsigned NOT NULL,
  `restored_by` int(10) NOT NULL,
  UNIQUE KEY `cache_id` (`cache_id`,`date_modified`,`attrib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caches_attributes_modified`
--

LOCK TABLES `caches_attributes_modified` WRITE;
/*!40000 ALTER TABLE `caches_attributes_modified` DISABLE KEYS */;
INSERT INTO `caches_attributes_modified` (`cache_id`, `attrib_id`, `date_modified`, `was_set`, `restored_by`) VALUES (1,24,'2020-12-18',0,0),(1,40,'2020-12-18',0,0),(4,9,'2020-12-18',0,0),(4,10,'2020-12-18',0,0),(4,11,'2020-12-18',0,0),(4,12,'2020-12-18',0,0),(4,13,'2020-12-18',0,0),(4,14,'2020-12-18',0,0),(4,15,'2020-12-18',0,0),(4,16,'2020-12-18',0,0),(4,17,'2020-12-18',0,0);
/*!40000 ALTER TABLE `caches_attributes_modified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caches_modified`
--

DROP TABLE IF EXISTS `caches_modified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caches_modified` (
  `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_modified` date NOT NULL COMMENT 'no time! see restorecaches.php',
  `name` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `date_hidden` date NOT NULL,
  `size` tinyint(3) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL,
  `terrain` tinyint(3) unsigned NOT NULL,
  `search_time` float unsigned NOT NULL DEFAULT '0',
  `way_length` float unsigned NOT NULL DEFAULT '0',
  `wp_gc` varchar(7) NOT NULL,
  `wp_nc` varchar(6) NOT NULL,
  `restored_by` int(10) NOT NULL,
  UNIQUE KEY `cache_id` (`cache_id`,`date_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caches_modified`
--

LOCK TABLES `caches_modified` WRITE;
/*!40000 ALTER TABLE `caches_modified` DISABLE KEYS */;
INSERT INTO `caches_modified` (`cache_id`, `date_modified`, `name`, `type`, `date_hidden`, `size`, `difficulty`, `terrain`, `search_time`, `way_length`, `wp_gc`, `wp_nc`, `restored_by`) VALUES (4,'2020-12-18','Töpferstadt Stadtlohn - öäüß',3,'2014-08-08',3,4,8,24,25,'GC57KTC','',0);
/*!40000 ALTER TABLE `caches_modified` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinates`
--

DROP TABLE IF EXISTS `coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `subtype` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `cache_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `log_id` int(11) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`cache_id`),
  KEY `user_id` (`user_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinates`
--

LOCK TABLES `coordinates` WRITE;
/*!40000 ALTER TABLE `coordinates` DISABLE KEYS */;
INSERT INTO `coordinates` (`id`, `date_created`, `last_modified`, `type`, `subtype`, `latitude`, `longitude`, `cache_id`, `user_id`, `log_id`, `description`) VALUES (1,'2020-12-17 13:39:39','2020-12-17 13:39:39',1,1,51.96605,6.90405,1,NULL,NULL,'Vor dem Restaurant kann man optimal parken.'),(2,'2020-12-17 14:19:16','2020-12-17 14:19:16',1,1,51.98955,6.9158833333333,4,NULL,NULL,'Parkplatz 1: Hier kann man kostenlos parken.'),(3,'2020-12-17 14:19:38','2020-12-17 14:19:38',1,1,51.99055,6.91665,4,NULL,NULL,'Parkplatz 2: Hier gibt\'s noch einen kleinen Parkplatz.'),(4,'2020-12-17 14:19:54','2020-12-17 14:19:54',1,2,51.99065,6.9160833333333,4,NULL,NULL,'Station 1: Der \"Fegemeister\"'),(5,'2020-12-18 09:23:19','2020-12-18 09:23:19',1,1,51.9318,6.8514666666667,12,NULL,NULL,'Bitte NICHT auf dem Parkplatz des Maislabyrinth parken sonden in der \"Parkbucht\" vor dem Zaun.'),(6,'2020-12-18 09:23:37','2020-12-18 09:23:37',1,3,51.93075,6.8526,12,NULL,NULL,'Hier könnt ihr den Weg verlassen und durch den Wald Richtung Cache laufen.'),(7,'2020-12-18 10:32:03','2020-12-18 10:32:03',1,4,54.84165,9.5311333333333,19,NULL,NULL,'Schiffsanleger und Hauptveranstaltung des 6. OC-HQ-Events.\r\n\r\nShip\'s jetty and the very 6th OC-HQ-event.'),(8,'2020-12-18 10:32:26','2020-12-18 10:32:26',1,1,54.835883333333,9.5249833333333,19,NULL,NULL,'Unbegrenzt, kostenlos parken.\r\n\r\nUnlimited, free parking.'),(9,'2020-12-18 10:32:46','2020-12-18 10:32:46',1,5,54.832033333333,9.5435333333333,19,NULL,NULL,'Renaissance-Wasserschloß.\r\n\r\nRenaissance-water-castle.');
/*!40000 ALTER TABLE `coordinates` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `coordinatesBeforeInsert` BEFORE INSERT ON `coordinates`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`last_modified`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `coordinatesAfterInsert` AFTER INSERT ON `coordinates`
     FOR EACH ROW BEGIN
        IF NEW.`type`=1 THEN
            IF ((ISNULL(@XMLSYNC) OR @XMLSYNC!=1) AND IFNULL(@dont_update_listingdate,0)=0) THEN
                
                UPDATE `caches` SET `last_modified`=NEW.`last_modified` WHERE `cache_id`=NEW.`cache_id`;
            END IF;
            CALL sp_update_cache_listingdate(NEW.`cache_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `coordinatesBeforeUpdate` BEFORE UPDATE ON `coordinates`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`last_modified`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `coordinatesAfterUpdate` AFTER UPDATE ON `coordinates`
     FOR EACH ROW BEGIN
        IF NEW.`type`=1 THEN
            IF ((ISNULL(@XMLSYNC) OR @XMLSYNC!=1) AND IFNULL(@dont_update_listingdate,0)=0) THEN
                
                UPDATE `caches` SET `last_modified`=NEW.`last_modified` WHERE `cache_id`=NEW.`cache_id`;
            END IF;
            CALL sp_update_cache_listingdate(NEW.`cache_id`);
        END IF;
        IF OLD.`cache_id`!=NEW.`cache_id` AND OLD.`type`=1 THEN
            CALL sp_update_cache_listingdate(OLD.`cache_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `coordinatesAfterDelete` AFTER DELETE ON `coordinates`
     FOR EACH ROW BEGIN
        IF OLD.`type`=1 AND IFNULL(@deleting_cache,0)=0 THEN
            IF (ISNULL(@XMLSYNC) OR @XMLSYNC!=1) THEN
                
                UPDATE `caches` SET `last_modified`=NOW() WHERE `cache_id`=OLD.`cache_id`;
            END IF;
            CALL sp_update_cache_listingdate(OLD.`cache_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `coordinates_type`
--

DROP TABLE IF EXISTS `coordinates_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinates_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `image` varchar(60) NOT NULL,
  `preposition` varchar(20) NOT NULL,
  `pp_trans_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinates_type`
--

LOCK TABLES `coordinates_type` WRITE;
/*!40000 ALTER TABLE `coordinates_type` DISABLE KEYS */;
INSERT INTO `coordinates_type` (`id`, `name`, `trans_id`, `image`, `preposition`, `pp_trans_id`) VALUES (1,'Parking',1788,'resource2/ocstyle/images/misc/wp_parking.png','for',1923),(2,'Stage or reference point',1789,'resource2/ocstyle/images/misc/wp_reference.png','of',894),(3,'Path',1926,'resource2/ocstyle/images/misc/wp_path.png','to ',1961),(4,'Final',1927,'resource2/ocstyle/images/misc/wp_final.png','of',894),(5,'Point of interest',1570,'resource2/ocstyle/images/misc/wp_poi.png','at',1962);
/*!40000 ALTER TABLE `coordinates_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_hq_message`
--

DROP TABLE IF EXISTS `core_hq_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_hq_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_hq_message`
--

LOCK TABLES `core_hq_message` WRITE;
/*!40000 ALTER TABLE `core_hq_message` DISABLE KEYS */;
INSERT INTO `core_hq_message` (`id`, `start`, `end`, `type`, `message`) VALUES (1,'2019-02-15 00:00:00','2019-03-30 00:00:00','primary','<p class=\"lead\">Hinweis:</p>\n            <p style=\"text-justify: auto\">Am <b>15.02.2019</b> haben wir unsere <a href=\"/articles.php?page=terms\">Nutzungsbedingungen</a> aktualisiert.\n            Als Nutzer hat man das Recht, die neuen Nutzungsbedingungen abzulehnen. Dies hat dann zur Folge, das unsere\n            Dienste nicht mehr genutzt werden können und ggfls. der Account gesperrt oder gelöscht werden kann.<br>\n            Die Änderungen gelten als akzeptiert, wenn der Nutzer diese nicht innerhalb von 14 Tagen ablehnt und darüber\n            hinaus das Angebot weiter nutzt. Wenn der Nutzer die Dienste im Rahmen der neuen Fassung der Vereinbarungen\n            nicht weiter nutzen möchte, kann der Nutzer sein Konto jederzeit kündigen.\n            Für Fragen steht der Support (<a href=\"https://opencaching.atlassian.net/servicedesk/customer/portal/2/group/-1\" target=\"_blank\" rel=\"nofollow\">Kontakt</a>) und dieser\n            <a hre=\"https://blog.opencaching.de/2019/02/aktualisierung-der-nutzungsbedingungen/\" target=\"_blank\" rel=\"nofollow\">Blogbeitrag</a> als Erläuterung zur Verfügung.</p>');
/*!40000 ALTER TABLE `core_hq_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `short` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) NOT NULL,
  `de` varchar(128) NOT NULL COMMENT 'obsolete',
  `en` varchar(128) NOT NULL,
  `list_default_de` int(1) NOT NULL DEFAULT '0' COMMENT 'obsolete',
  `sort_de` varchar(128) NOT NULL COMMENT 'obsolete',
  `list_default_en` int(1) NOT NULL DEFAULT '0' COMMENT 'obsolete',
  `sort_en` varchar(128) NOT NULL COMMENT 'obsolete',
  `adm_display2` tinyint(1) NOT NULL,
  `adm_display3` tinyint(1) NOT NULL,
  PRIMARY KEY (`short`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`short`, `name`, `trans_id`, `de`, `en`, `list_default_de`, `sort_de`, `list_default_en`, `sort_en`, `adm_display2`, `adm_display3`) VALUES ('AD','Andorra',447,'Andorra','Andorra',0,'andorra',0,'andorra',0,0),('AE','United Arab Emirates',446,'Vereinigte Arabische Emirate','United Arab Emirates',0,'arabische emirate, vereinigte',0,'arab emirates, united',0,0),('AF','Afghanistan',445,'Afghanistan','Afghanistan',0,'afghanistan',0,'afghanistan',0,0),('AG','Antigua And Barbuda',444,'Antigua und Barbuda','Antigua And Barbuda',0,'antigua und barbuda',0,'antigua and barbuda',0,0),('AI','Anguilla',443,'Anguilla','Anguilla',0,'anguilla',0,'anguilla',0,0),('AL','Albania',442,'Albanien','Albania',0,'albanien',0,'albania',0,0),('AM','Armenia',441,'Armenien','Armenia',0,'armenien',0,'armenia',0,0),('AN','Netherlands Antilles',440,'Niederländische Antillen','Netherlands Antilles',0,'antillen, niederlaendische',0,'netherlands antilles',0,0),('AO','Angola',439,'Angola','Angola',0,'angola',0,'angola',0,0),('AR','Argentina',438,'Argentinien','Argentina',0,'argentinien',0,'argentina',0,0),('AS','American Samoa',437,'Amerikanisch-Samoa','American Samoa',0,'samoa-amerikanisch',1,'american samoa',0,0),('AT','Austria',436,'Österreich','Austria',1,'oesterreich',0,'austria',3,4),('AU','Australia',435,'Australien','Australia',0,'australien',1,'australia',0,0),('AW','Aruba',434,'Aruba','Aruba',0,'aruba',0,'aruba',0,0),('AZ','Azerbaijan',433,'Aserbaidschan','Azerbaijan',0,'aserbaidschan',0,'azerbaijan',0,0),('BA','Bosnia And Herzegowina',432,'Bosnien-Herzegowina','Bosnia And Herzegowina',0,'bosnien-herzegowina',0,'bosnia and herzegowina',0,0),('BB','Barbados',431,'Barbados','Barbados',0,'barbados',0,'barbados',0,0),('BD','Bangladesh',430,'Bangladesch','Bangladesh',0,'bangladesch',0,'bangladesh',0,0),('BE','Belgium',429,'Belgien','Belgium',1,'belgien',0,'belgium',3,4),('BF','Burkina Faso',428,'Burkina Faso','Burkina Faso',0,'burkina faso',0,'burkina faso',0,0),('BG','Bulgaria',427,'Bulgarien','Bulgaria',0,'bulgarien',0,'bulgaria',3,4),('BH','Bahrain',426,'Bahrain','Bahrain',0,'bahrain',0,'bahrain',0,0),('BI','Burundi',425,'Burundi','Burundi',0,'burundi',0,'burundi',0,0),('BJ','Benin',424,'Benin','Benin',0,'benin',0,'benin',0,0),('BM','Bermuda',423,'Bermuda','Bermuda',0,'bermuda',0,'bermuda',0,0),('BN','Brunei Darussalam',422,'Brunei','Brunei Darussalam',0,'brunei',0,'brunei darussalam',0,0),('BO','Bolivia',421,'Bolivien','Bolivia',0,'bolivien',0,'bolivia',0,0),('BR','Brazil',420,'Brasilien','Brazil',0,'brasilien',0,'brazil',0,0),('BS','Bahamas',419,'Bahamas','Bahamas',0,'bahamas',0,'bahamas',0,0),('BT','Bhutan',418,'Bhutan','Bhutan',0,'bhutan',0,'bhutan',0,0),('BV','Bouvet Island',417,'die Bouvetinseln','Bouvet Island',0,'bouvetinseln, die',0,'bouvet island',0,0),('BW','Botswana',416,'Botsuana','Botswana',0,'botsuana',0,'botswana',0,0),('BY','Belarus',415,'Belarus (Weißrußland)','Belarus',0,'belarus (weissrussland)',0,'belarus',0,0),('BZ','Belize',414,'Belize','Belize',0,'belize',0,'belize',0,0),('CA','Canada',413,'Kanada','Canada',0,'kanada',1,'canada',0,0),('CC','Cocos (Keeling) Islands',412,'Kokosinseln','Cocos (Keeling) Islands',0,'kokosinseln',0,'cocos (keeling) islands',0,0),('CF','Central African Republic',411,'Zentralafrikanische Republik','Central African Republic',0,'zentralafrikanische republik',0,'central african republic',0,0),('CG','Congo',410,'Kongo','Congo',0,'kongo',0,'congo',0,0),('CH','Switzerland',409,'Schweiz','Switzerland',1,'schweiz',0,'switzerland',3,4),('CI','Cote d\'Ivoire',408,'Elfenbeinküste','Cote d\'Ivoire',0,'elfenbeinkueste',0,'Zimbabwe',0,0),('CK','Cook Islands',407,'Cookinseln','Cook Islands',0,'cookinseln',0,'cook islands',0,0),('CL','Chile',406,'Chile','Chile',0,'chile',0,'chile',0,0),('CM','Cameroon',405,'Kamerun','Cameroon',0,'kamerun',0,'cameroon',0,0),('CN','China',404,'Volksrepublik China','China',0,'china, volksrepublik',0,'china',0,0),('CO','Colombia',403,'Kolumbien','Colombia',0,'kolumbien',0,'colombia',0,0),('CR','Costa Rica',402,'Costa Rica','Costa Rica',0,'costa rica',0,'costa rica',0,0),('CU','Cuba',400,'Kuba','Cuba',0,'kuba',0,'cuba',0,0),('CV','Cape Verde',399,'Kapverden','Cape Verde',0,'kapverden',0,'cape verde',0,0),('CX','Christmas Island',398,'Weihnachtsinseln','Christmas Island',0,'weihnachtsinseln',0,'christmas island',0,0),('CY','Cyprus',397,'Zypern','Cyprus',0,'zypern',0,'cyprus',0,0),('CZ','Czech Republic',396,'Tschechische Republik','Czech Republic',1,'tschechische republik',0,'czech republic',3,4),('DE','Germany',395,'Deutschland','Germany',1,'deutschland',0,'germany',2,4),('DJ','Djibouti',394,'Dschibuti','Djibouti',0,'dschibuti',0,'djibouti',0,0),('DK','Denmark',393,'Dänemark','Denmark',1,'daenemark',0,'denmark',3,4),('DO','Dominican Republic',392,'Dominikanische Republik','Dominican Republic',0,'dominikanische republik',0,'dominican republic',0,0),('DZ','Algeria',391,'Algerien','Algeria',0,'algerien',0,'algeria',0,0),('EC','Ecuador',390,'Ecuador','Ecuador',0,'ecuador',0,'ecuador',0,0),('EE','Estonia',389,'Estland','Estonia',0,'estland',0,'estonia',4,0),('EG','Egypt',388,'Ägypten','Egypt',0,'aegypten',0,'egypt',0,0),('EH','Western Sahara',387,'Westsahara','Western Sahara',0,'westsahara',0,'western sahara',0,0),('ER','Eritrea',386,'Eritrea','Eritrea',0,'eritrea',0,'eritrea',0,0),('ES','Spain',385,'Spanien','Spain',1,'spanien',0,'spain',3,4),('ET','Ethiopia',384,'Äthiopien','Ethiopia',0,'aethiopien',0,'ethiopia',0,0),('FI','Finland',383,'Finnland','Finland',0,'finnland',0,'finland',3,4),('FJ','Fiji',382,'Fidschi','Fiji',0,'fidschi',0,'fiji',0,0),('FK','Falkland Islands (Malvinas)',381,'Falklandinseln','Falkland Islands (Malvinas)',0,'falklandinseln',0,'falkland islands (malvinas)',0,0),('FM','Micronesia, Federated States Of',380,'Mikronesien','Micronesia, Federated States Of',0,'mikronesien',0,'micronesia, federated states of',0,0),('FO','Faroe Islands',379,'Färöer (zu Dänemark)','Faroe Islands',0,'faeroeer (zu daenemark)',0,'faroe islands',0,0),('FR','France',378,'Frankreich','France',1,'frankreich',0,'france',3,4),('GA','Gabon',377,'Gabun','Gabon',0,'gabun',0,'gabon',0,0),('GB','United Kingdom',376,'Großbritannien','United Kingdom',0,'grossbritannien',1,'united kingdom',2,4),('GD','Grenada',375,'Granada','Grenada',0,'granada',0,'grenada',0,0),('GE','Georgia',374,'Georgien','Georgia',0,'georgien',0,'georgia',0,0),('GF','French Guiana',373,'Guayana','French Guiana',0,'guayana',0,'french guiana',0,0),('GH','Ghana',372,'Ghana','Ghana',0,'ghana',0,'ghana',0,0),('GI','Gibraltar',371,'Gibraltar','Gibraltar',0,'gibraltar',0,'gibraltar',0,0),('GL','Greenland',370,'Grönland','Greenland',0,'groenland',0,'greenland',0,0),('GM','Gambia',369,'Gambia','Gambia',0,'gambia',0,'gambia',0,0),('GN','Guinea',368,'Guinea','Guinea',0,'guinea',0,'guinea',0,0),('GP','Guadeloupe',367,'Guadelope','Guadeloupe',0,'guadelope',0,'guadeloupe',0,0),('GR','Greece',366,'Griechenland','Greece',0,'griechenland',0,'greece',0,0),('GS','South Georgia And The South Sandwich Islands',365,'Südgeorgien und die Südlichen Sandwichinseln','South Georgia And The South Sandwich Islands',0,'suedgeorgien und die suedlichen sandwichinseln',0,'south georgia and the south sandwich islands',0,0),('GT','Guatemala',364,'Guatemala','Guatemala',0,'guatemala',0,'guatemala',0,0),('GU','Guam',363,'Guam','Guam',0,'guam',0,'guam',0,0),('GW','Guinea-Bissau',362,'Guinea-Bissau','Guinea-Bissau',0,'guinea-bissau',0,'guinea-bissau',0,0),('GY','Guyana',361,'Guyana','Guyana',0,'guyana',0,'guyana',0,0),('HK','Hong Kong',360,'Honkong','Hong Kong',0,'honkong',0,'hong kong',0,0),('HM','Heard And Mc Donald Islands',359,'Heard und McDonaldinseln','Heard And Mc Donald Islands',0,'heard und mcdonaldinseln',0,'heard and mc donald islands',0,0),('HN','Honduras',358,'Honduras','Honduras',0,'honduras',0,'honduras',0,0),('HR','Croatia',357,'Kroatien','Croatia',0,'kroatien',0,'croatia',3,4),('HT','Haiti',356,'Haiti','Haiti',0,'haiti',0,'haiti',0,0),('HU','Hungary',355,'Ungarn','Hungary',0,'ungarn',0,'hungary',3,4),('ID','Indonesia',354,'Indonesien','Indonesia',0,'indonesien',0,'indonesia',0,0),('IE','Ireland',353,'Irland','Ireland',0,'irland',0,'ireland',3,4),('IL','Israel',352,'Israel','Israel',0,'israel',0,'israel',0,0),('IN','India',351,'Indien','India',0,'indien',0,'india',0,0),('IO','British Indian Ocean Territory',350,'Britisches Territorium im Indischen Ozean','British Indian Ocean Territory',0,'britisches territorium im indischen ozean',0,'british indian ocean territory',0,0),('IQ','Iraq',349,'Irak','Iraq',0,'irak',0,'iraq',0,0),('IR','Iran (Islamic Republic Of)',348,'Iran','Iran (Islamic Republic Of)',0,'iran',0,'iran (islamic republic of)',0,0),('IS','Iceland',347,'Island','Iceland',0,'island',0,'iceland',0,0),('IT','Italy',346,'Italien','Italy',1,'italien',0,'italy',3,4),('JM','Jamaica',345,'Jamaika','Jamaica',0,'jamaika',0,'jamaica',0,0),('JO','Jordan',344,'Jordanien','Jordan',0,'jordanien',0,'jordan',0,0),('JP','Japan',343,'Japan','Japan',0,'japan',0,'japan',0,0),('KE','Kenya',342,'Kenia','Kenya',0,'kenia',0,'kenya',0,0),('KG','Kyrgyzstan',341,'Kirgistan','Kyrgyzstan',0,'kirgistan',0,'kyrgyzstan',0,0),('KH','Cambodia',340,'Kambodscha','Cambodia',0,'kambodscha',0,'cambodia',0,0),('KI','Kiribati',339,'Kiribati','Kiribati',0,'kiribati',0,'kiribati',0,0),('KM','Comoros',338,'Komoren','Comoros',0,'komoren',0,'comoros',0,0),('KN','Saint Kitts And Nevis',337,'St. Kitts und Nevis','Saint Kitts And Nevis',0,'st. kitts und nevis',0,'saint kitts and nevis',0,0),('KP','Korea, Democratic People\'s Republic Of',336,'Demokratische Volksrepublik Korea','Korea, Democratic People\'s Republic Of',0,'korea, demokratische volksrepublik',0,'Zimbabwe',0,0),('KR','Korea, Republic Of',335,'Republik Korea','Korea, Republic Of',0,'korea, republik',0,'korea, republic of',0,0),('KW','Kuwait',334,'Kuwait','Kuwait',0,'kuwait',0,'kuwait',0,0),('KY','Cayman Islands',333,'Kaimaninseln','Cayman Islands',0,'kaimaninseln',0,'cayman islands',0,0),('KZ','Kazakhstan',332,'Kasachstan','Kazakhstan',0,'kasachstan',0,'kazakhstan',0,0),('LA','Lao People\'s Democratic Republic',331,'Laos','Lao People\'s Democratic Republic',0,'laos',0,'Zimbabwe',0,0),('LB','Lebanon',330,'Libanon','Lebanon',0,'libanon',0,'lebanon',0,0),('LC','Saint Lucia',329,'St. Lucia','Saint Lucia',0,'st. lucia',0,'saint lucia',0,0),('LI','Liechtenstein',328,'Liechtenstein','Liechtenstein',1,'liechtenstein',0,'liechtenstein',0,0),('LK','Sri Lanka',327,'Sri Lanka','Sri Lanka',0,'sri lanka',0,'sri lanka',0,0),('LR','Liberia',326,'Liberia','Liberia',0,'liberia',0,'liberia',0,0),('LS','Lesotho',325,'Lesotho','Lesotho',0,'lesotho',0,'lesotho',0,0),('LT','Lithuania',324,'Litauen','Lithuania',0,'litauen',0,'lithuania',4,0),('LU','Luxembourg',323,'Luxemburg','Luxembourg',1,'luxemburg',0,'luxembourg',0,0),('LV','Latvia',322,'Lettland','Latvia',0,'lettland',0,'latvia',4,0),('LY','Libyan Arab Jamahiriya',321,'Libyen','Libyan Arab Jamahiriya',0,'libyen',0,'libyan arab jamahiriya',0,0),('MA','Morocco',320,'Marokko','Morocco',0,'marokko',0,'morocco',0,0),('MC','Monaco',319,'Monaco','Monaco',0,'monaco',0,'monaco',0,0),('MD','Moldova, Republic Of',318,'Moldau','Moldova, Republic Of',0,'moldau',0,'moldova, republic of',0,0),('ME','Montenegro',856,'Montenegro','Montenegro',0,'montenegro',0,'montenegro',0,0),('MG','Madagascar',317,'Madagaskar','Madagascar',0,'madagaskar',0,'madagascar',0,0),('MH','Marshall Islands',316,'Marshallinseln','Marshall Islands',0,'marshallinseln',0,'marshall islands',0,0),('MK','Macedonia, The Former Yugoslav Republic Of',315,'Mazedonien','Macedonia, The Former Yugoslav Republic Of',0,'mazedonien',0,'macedonia, the former yugoslav republic of',0,0),('ML','Mali',314,'Mali','Mali',0,'mali',0,'mali',0,0),('MM','Myanmar',313,'Myanmar','Myanmar',0,'myanmar',0,'myanmar',0,0),('MN','Mongolia',312,'Mongolei','Mongolia',0,'mongolei',0,'mongolia',0,0),('MO','Macau',311,'Macau','Macau',0,'macau',0,'macau',0,0),('MP','Northern Mariana Islands',310,'Marianen','Northern Mariana Islands',0,'marianen',0,'northern mariana islands',0,0),('MQ','Martinique',309,'Martinique','Martinique',0,'martinique',0,'martinique',0,0),('MR','Mauritania',308,'Mauretanien','Mauritania',0,'mauretanien',0,'mauritania',0,0),('MS','Montserrat',307,'Montserrat','Montserrat',0,'montserrat',0,'montserrat',0,0),('MT','Malta',306,'Malta','Malta',0,'malta',0,'malta',0,0),('MU','Mauritius',305,'Mauritius','Mauritius',0,'mauritius',0,'mauritius',0,0),('MV','Maldives',304,'Malediven','Maldives',0,'malediven',0,'maldives',0,0),('MW','Malawi',303,'Malwai','Malawi',0,'malwai',0,'malawi',0,0),('MX','Mexico',302,'Mexiko','Mexico',0,'mexiko',0,'mexico',0,0),('MY','Malaysia',301,'Malaysia','Malaysia',0,'malaysia',0,'malaysia',0,0),('MZ','Mozambique',300,'Mosambik','Mozambique',0,'mosambik',0,'mozambique',0,0),('NA','Namibia',299,'Namibia','Namibia',0,'namibia',0,'namibia',0,0),('NC','New Caledonia',298,'Neukaledonien','New Caledonia',0,'neukaledonien',0,'new caledonia',0,0),('NE','Niger',297,'Niger','Niger',0,'niger',0,'niger',0,0),('NF','Norfolk Island',296,'Norfolkinseln','Norfolk Island',0,'norfolkinseln',0,'norfolk island',0,0),('NG','Nigeria',295,'Nigeria','Nigeria',0,'nigeria',0,'nigeria',0,0),('NI','Nicaragua',294,'Nicaragua','Nicaragua',0,'nicaragua',0,'nicaragua',0,0),('NL','Netherlands',293,'Niederlande','Netherlands',1,'niederlande',0,'netherlands',3,4),('NO','Norway',292,'Norwegen','Norway',0,'norwegen',0,'norway',3,4),('NP','Nepal',291,'Nepal','Nepal',0,'nepal',0,'nepal',0,0),('NR','Nauru',290,'Nauru','Nauru',0,'nauru',0,'nauru',0,0),('NU','Niue',289,'Niue','Niue',0,'niue',0,'niue',0,0),('NZ','New Zealand',288,'Neuseeland','New Zealand',0,'neuseeland',0,'new zealand',0,0),('OM','Oman',287,'Oman','Oman',0,'oman',0,'oman',0,0),('PA','Panama',286,'Panama','Panama',0,'panama',0,'panama',0,0),('PE','Peru',285,'Peru','Peru',0,'peru',0,'peru',0,0),('PF','French Polynesia',284,'Französisch-Polynesien','French Polynesia',0,'franzoesisch-polynesien',0,'french polynesia',0,0),('PG','Papua New Guinea',283,'Papua-Neuguinea','Papua New Guinea',0,'papua-neuguinea',0,'papua new guinea',0,0),('PH','Philippines',282,'Philippinen','Philippines',0,'philippinen',0,'philippines',0,0),('PK','Pakistan',281,'Pakistan','Pakistan',0,'pakistan',0,'pakistan',0,0),('PL','Poland',280,'Polen','Poland',1,'polen',0,'poland',3,4),('PM','St. Pierre And Miquelon',279,'St. Pierre und Miquelon','St. Pierre And Miquelon',0,'st. pierre und miquelon',0,'st. pierre and miquelon',0,0),('PN','Pitcairn',278,'die Pitcairninseln','Pitcairn',0,'pitcairninseln, die',0,'pitcairn',0,0),('PR','Puerto Rico',277,'Puerto Rico','Puerto Rico',0,'puerto rico',0,'puerto rico',0,0),('PT','Portugal',276,'Portugal','Portugal',0,'portugal',0,'portugal',0,0),('PW','Palau',275,'Palau','Palau',0,'palau',0,'palau',0,0),('PY','Paraguay',274,'Paraguay','Paraguay',0,'paraguay',0,'paraguay',0,0),('QA','Qatar',273,'Katar','Qatar',0,'katar',0,'qatar',0,0),('RE','Reunion',272,'Réunion','Reunion',0,'reunion',0,'reunion',0,0),('RO','Romania',271,'Rumänien','Romania',0,'rumaenien',0,'romania',3,4),('RS','Serbia',857,'Serbien','Serbia',0,'serbia',0,'serbia',0,0),('RU','Russian Federation',270,'Russische Föderation','Russian Federation',0,'russische foederation',0,'russian federation',0,0),('RW','Rwanda',269,'Ruanda','Rwanda',0,'ruanda',0,'rwanda',0,0),('SA','Saudi Arabia',268,'Saudi-Arabien','Saudi Arabia',0,'saudi-arabien',0,'saudi arabia',0,0),('SB','Solomon Islands',267,'Salomonen','Solomon Islands',0,'salomonen',0,'solomon islands',0,0),('SC','Seychelles',266,'Seychellen','Seychelles',0,'seychellen',0,'seychelles',0,0),('SD','Sudan',265,'Sudan','Sudan',0,'sudan',0,'sudan',0,0),('SE','Sweden',264,'Schweden','Sweden',0,'schweden',0,'sweden',3,4),('SG','Singapore',263,'Singapur','Singapore',0,'singapur',0,'singapore',0,0),('SH','St. Helena',262,'St. Helena','St. Helena',0,'st. helena',0,'st. helena',0,0),('SI','Slovenia',261,'Slowenien','Slovenia',0,'slowenien',0,'slovenia',3,4),('SJ','Svalbard And Jan Mayen Islands',260,'Svalbard und Jan Mayen','Svalbard And Jan Mayen Islands',0,'svalbard und jan mayen',0,'svalbard and jan mayen islands',0,0),('SK','Slovakia',259,'Slowakai','Slovakia',0,'slowakai',0,'slovakia',3,4),('SL','Sierra Leone',258,'Sierra Leone','Sierra Leone',0,'sierra leone',0,'sierra leone',0,0),('SM','San Marino',257,'San Marino','San Marino',0,'san marino',0,'san marino',0,0),('SN','Senegal',256,'Senegal','Senegal',0,'senegal',0,'senegal',0,0),('SO','Somalia',252,'Somalia','Somalia',0,'somalia',0,'somalia',0,0),('SR','Suriname',251,'Suriname','Suriname',0,'suriname',0,'suriname',0,0),('ST','Sao Tome And Principe',250,'Sao Tomé und Principe','Sao Tome And Principe',0,'sao tomé und principe',0,'sao tome and principe',0,0),('SV','El Salvador',249,'El Salvador','El Salvador',0,'el salvador',0,'el salvador',0,0),('SY','Syrian Arab Republic',243,'Syrien','Syrian Arab Republic',0,'syrien',0,'syrian arab republic',0,0),('SZ','Swaziland',242,'Swasiland','Swaziland',0,'swasiland',0,'swaziland',0,0),('TC','Turks And Caicos Islands',240,'Turks- und Caicosinseln','Turks And Caicos Islands',0,'turks- und caicosinseln',0,'turks and caicos islands',0,0),('TD','Chad',239,'Tschad','Chad',0,'tschad',0,'chad',0,0),('TF','French Southern Territories',238,'Französische Süd- und Antarktisgebiete','French Southern Territories',0,'franzoesische sued- und antarktisgebiete',0,'french southern territories',0,0),('TG','Togo',237,'Togo','Togo',0,'togo',0,'togo',0,0),('TH','Thailand',236,'Thailand','Thailand',0,'thailand',0,'thailand',0,0),('TJ','Tajikistan',235,'Tadschikistan','Tajikistan',0,'tadschikistan',0,'tajikistan',0,0),('TK','Tokelau',234,'Tokelau','Tokelau',0,'tokelau',0,'tokelau',0,0),('TM','Turkmenistan',233,'Turkmenistan','Turkmenistan',0,'turkmenistan',0,'turkmenistan',0,0),('TN','Tunisia',231,'Tunesien','Tunisia',0,'tunesien',0,'tunisia',0,0),('TO','Tonga',223,'Tonga','Tonga',0,'tonga',0,'tonga',0,0),('TR','Turkey',215,'Türkei','Turkey',0,'tuerkei',0,'turkey',2,4),('TT','Trinidad And Tobago',214,'Trinidad und Tobago','Trinidad And Tobago',0,'trinidad und tobago',0,'trinidad and tobago',0,0),('TV','Tuvalu',213,'Tuvalu','Tuvalu',0,'tuvalu',0,'tuvalu',0,0),('TW','Taiwan, Province Of China',212,'Taiwan','Taiwan, Province Of China',0,'taiwan',0,'taiwan, province of china',0,0),('TZ','Tanzania, United Republic Of',211,'Tansania','Tanzania, United Republic Of',0,'tansania',0,'tanzania, united republic of',0,0),('UA','Ukraine',210,'Ukraine','Ukraine',0,'ukraine',0,'ukraine',0,0),('UG','Uganda',209,'Uganda','Uganda',0,'uganda',0,'uganda',0,0),('UM','United States Minor Outlying Islands',204,'Amerikanisch-Ozeanien','United States Minor Outlying Islands',0,'amerikanisch-ozeanien',0,'united states minor outlying islands',0,0),('US','United States',203,'Vereinigte Staaten','United States',0,'vereinigte staaten',1,'united states',0,0),('UY','Uruguay',201,'Uruguay','Uruguay',0,'uruguay',0,'uruguay',0,0),('UZ','Uzbekistan',194,'Usbekistan','Uzbekistan',0,'usbekistan',0,'uzbekistan',0,0),('VA','Vatican City State (Holy See)',193,'Vatikan (Heiliger Stuhl)','Vatican City State (Holy See)',0,'vatikan (heiliger stuhl)',0,'vatican city state (holy see)',0,0),('VC','Saint Vincent And The Grenadines',192,'St. Vincent und die Grenadinen','Saint Vincent And The Grenadines',0,'st. vincent und die grenadinen',0,'saint vincent and the grenadines',0,0),('VE','Venezuela',185,'Venezuela','Venezuela',0,'venezuela',0,'venezuela',0,0),('VG','Virgin Islands (British)',184,'die Britischen Jungferninseln','Virgin Islands (British)',0,'jungferninseln, die britischen',0,'virgin islands (british)',0,0),('VI','Virgin Islands (U.S.)',183,'die Amerikanischen Jungferninseln','Virgin Islands (U.S.)',0,'jungferninseln, die amerikanischen',0,'virgin islands (u.s.)',0,0),('VN','Viet Nam',182,'Vietnam','Viet Nam',0,'vietnam',0,'viet nam',0,0),('VU','Vanuatu',181,'Vanuatu','Vanuatu',0,'vanuatu',0,'vanuatu',0,0),('WF','Wallis And Futuna Islands',179,'Wallis und Futuna','Wallis And Futuna Islands',0,'wallis und futuna',0,'wallis and futuna islands',0,0),('WS','Samoa',173,'Samoa','Samoa',0,'samoa',0,'samoa',0,0),('YE','Yemen',172,'Jemen','Yemen',0,'jemen',0,'yemen',0,0),('YT','Mayotte',165,'Mayotte','Mayotte',0,'mayotte',0,'mayotte',0,0),('ZA','South Africa',164,'Südafrika','South Africa',0,'suedafrika',0,'south africa',0,0),('ZM','Zambia',163,'Sambia','Zambia',0,'sambia',0,'zambia',0,0),('ZW','Zimbabwe',162,'Simbabwe','Zimbabwe',0,'simbabwe',0,'zimbabwe',0,0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_list_default`
--

DROP TABLE IF EXISTS `countries_list_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries_list_default` (
  `lang` varchar(2) NOT NULL,
  `show` varchar(2) NOT NULL,
  PRIMARY KEY (`lang`,`show`),
  KEY `show` (`show`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_list_default`
--

LOCK TABLES `countries_list_default` WRITE;
/*!40000 ALTER TABLE `countries_list_default` DISABLE KEYS */;
INSERT INTO `countries_list_default` (`lang`, `show`) VALUES ('DE','AT'),('DE','BE'),('DE','CH'),('DE','CZ'),('DE','DE'),('DE','DK'),('DE','ES'),('DE','FR'),('DE','GB'),('DE','GR'),('DE','HR'),('DE','IT'),('DE','LI'),('DE','LU'),('DE','NL'),('DE','NO'),('DE','PL'),('DE','RO'),('DE','SA'),('DE','SE'),('DE','US');
/*!40000 ALTER TABLE `countries_list_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_options`
--

DROP TABLE IF EXISTS `countries_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries_options` (
  `country` char(2) NOT NULL,
  `display` tinyint(1) unsigned NOT NULL,
  `gmLat` double NOT NULL,
  `gmLon` double NOT NULL,
  `gmZoom` tinyint(3) unsigned NOT NULL,
  `nodeId` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`country`),
  KEY `ordinal` (`display`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_options`
--

LOCK TABLES `countries_options` WRITE;
/*!40000 ALTER TABLE `countries_options` DISABLE KEYS */;
INSERT INTO `countries_options` (`country`, `display`, `gmLat`, `gmLon`, `gmZoom`, `nodeId`) VALUES ('AT',1,47.0177163539792,13.1396484375,7,1),('BE',1,50.5483444906748,4.537353515625,8,14),('BG',1,42.0982224111897,25.86181640625,7,0),('CH',1,46.6381224623797,8.1353759765625,8,1),('CY',1,35.0120020431607,33.2968139648438,9,0),('CZ',1,49.4324125802485,15.238037109375,7,3),('DE',1,51.1380014880626,10.5908203125,6,1),('DK',1,56.0536350191344,10.118408203125,7,0),('EE',1,55.4539413294331,25.1806640625,6,0),('ES',1,40.3632883409158,-2.98828125,6,1),('FI',1,62.5731057844998,14.9853515625,5,0),('FR',1,46.9652594003493,2.87841796875,6,1),('GB',1,53.93021986394,-5.2294921875,6,7),('GR',1,39.0618491342915,22.74169921875,7,0),('HR',1,44.3631331138077,16.76513671875,7,0),('HU',1,47.0252060015854,19.324951171875,7,0),('IE',1,53.93021986394,-5.2294921875,6,0),('IS',1,65.2750935499542,-18.83056640625,6,0),('IT',1,42.1796881966596,12.12890625,6,1),('JP',1,36.3151251474805,136.73583984375,6,0),('LI',1,47.1346220607737,9.55467224121094,11,0),('LT',1,55.4539413294331,25.1806640625,6,0),('LU',1,49.7617517582823,6.053466796875,9,14),('LV',1,55.4539413294331,25.1806640625,6,0),('MD',1,47.3834738721015,28.6083984375,8,0),('ME',1,44.3631331138077,16.76513671875,7,0),('MT',1,35.9324286833512,14.3879699707031,11,0),('NL',1,51.4471603469801,5.44921875,7,14),('NO',1,62.5731057844998,14.9853515625,5,0),('PL',1,52.1199986576382,18.74267578125,6,2),('PT',1,40.3632883409158,-2.98828125,6,0),('RO',1,45.8747122489048,24.93896484375,7,16),('RU',1,59.1759282492714,92.109375,3,0),('SA',1,24.45,43.55,6,1),('SE',1,62.5731057844998,14.9853515625,5,0),('SI',1,46.0160387383342,14.798583984375,8,0),('SK',1,48.6220164284684,18.907470703125,8,0),('TR',1,38.0307856938229,33.90380859375,6,0),('US',1,30.1451271833761,-94.658203125,4,10);
/*!40000 ALTER TABLE `countries_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_user`
--

DROP TABLE IF EXISTS `email_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL COMMENT 'via Trigger (email_user)',
  `ipaddress` varchar(20) NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_email` varchar(60) NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_email` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `date` (`date_created`)
) ENGINE=InnoDB AUTO_INCREMENT=23766 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_user`
--

LOCK TABLES `email_user` WRITE;
/*!40000 ALTER TABLE `email_user` DISABLE KEYS */;
INSERT INTO `email_user` (`id`, `date_created`, `ipaddress`, `from_user_id`, `from_email`, `to_user_id`, `to_email`) VALUES (23763,'2012-07-01 00:59:57','192.168.178.28',107469,'root@localhost',107469,'root@localhost'),(23764,'2012-07-01 02:10:22','192.168.178.28',107469,'root@localhost',107469,'root@localhost'),(23765,'2020-12-17 22:06:47','172.18.0.1',170289,'Gustav_0815@example.com',170294,'PeterDerGrosse@example.com');
/*!40000 ALTER TABLE `email_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `emailUserBeforeInsert` BEFORE INSERT ON `email_user`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `field_note`
--

DROP TABLE IF EXISTS `field_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `geocache_id` int(11) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `date` datetime NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DC7193AEA76ED395` (`user_id`),
  KEY `IDX_DC7193AE67030974` (`geocache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_note`
--

LOCK TABLES `field_note` WRITE;
/*!40000 ALTER TABLE `field_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_areas`
--

DROP TABLE IF EXISTS `geodb_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_areas` (
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `area_id` int(11) NOT NULL DEFAULT '0',
  `polygon_id` int(11) DEFAULT NULL,
  `pol_seq_no` int(11) NOT NULL DEFAULT '0',
  `exclude_area` smallint(1) NOT NULL DEFAULT '0',
  `area_type` int(11) NOT NULL DEFAULT '0',
  `area_subtype` int(11) DEFAULT NULL,
  `coord_type` int(11) NOT NULL DEFAULT '0',
  `coord_subtype` int(11) DEFAULT NULL,
  `resolution` int(11) NOT NULL DEFAULT '0',
  `valid_since` date DEFAULT NULL,
  `date_type_since` int(11) DEFAULT NULL,
  `valid_until` date NOT NULL DEFAULT '0000-00-00',
  `date_type_until` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `loc_id` (`loc_id`,`area_id`),
  KEY `areas_loc_id_idx` (`loc_id`),
  KEY `areas_area_id_idx` (`area_id`),
  KEY `areas_pol_id_idx` (`polygon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='not in use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_areas`
--

LOCK TABLES `geodb_areas` WRITE;
/*!40000 ALTER TABLE `geodb_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_changelog`
--

DROP TABLE IF EXISTS `geodb_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_changelog` (
  `id` int(11) NOT NULL DEFAULT '0',
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `beschreibung` mediumtext NOT NULL,
  `autor` varchar(50) NOT NULL DEFAULT '',
  `version` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='not in use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_changelog`
--

LOCK TABLES `geodb_changelog` WRITE;
/*!40000 ALTER TABLE `geodb_changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_coordinates`
--

DROP TABLE IF EXISTS `geodb_coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_coordinates` (
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `lon` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `coord_type` int(11) NOT NULL DEFAULT '0',
  `coord_subtype` int(11) DEFAULT NULL,
  `valid_since` date DEFAULT NULL,
  `date_type_since` int(11) DEFAULT NULL,
  `valid_until` date NOT NULL DEFAULT '0000-00-00',
  `date_type_until` int(11) NOT NULL DEFAULT '0',
  KEY `coord_loc_id_idx` (`loc_id`),
  KEY `coord_lon_idx` (`lon`),
  KEY `coord_lat_idx` (`lat`),
  KEY `coord_type_idx` (`coord_type`),
  KEY `coord_stype_idx` (`coord_subtype`),
  KEY `coord_since_idx` (`valid_since`),
  KEY `coord_until_idx` (`valid_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_coordinates`
--

LOCK TABLES `geodb_coordinates` WRITE;
/*!40000 ALTER TABLE `geodb_coordinates` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_coordinates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_floatdata`
--

DROP TABLE IF EXISTS `geodb_floatdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_floatdata` (
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `float_val` double NOT NULL DEFAULT '0',
  `float_type` int(11) NOT NULL DEFAULT '0',
  `float_subtype` int(11) DEFAULT NULL,
  `valid_since` date DEFAULT NULL,
  `date_type_since` int(11) DEFAULT NULL,
  `valid_until` date NOT NULL DEFAULT '0000-00-00',
  `date_type_until` int(11) NOT NULL DEFAULT '0',
  KEY `float_lid_idx` (`loc_id`),
  KEY `float_val_idx` (`float_val`),
  KEY `float_type_idx` (`float_type`),
  KEY `float_stype_idx` (`float_subtype`),
  KEY `float_since_idx` (`valid_since`),
  KEY `float_until_idx` (`valid_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='not in use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_floatdata`
--

LOCK TABLES `geodb_floatdata` WRITE;
/*!40000 ALTER TABLE `geodb_floatdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_floatdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_hierarchies`
--

DROP TABLE IF EXISTS `geodb_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_hierarchies` (
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `id_lvl1` int(11) NOT NULL DEFAULT '0',
  `id_lvl2` int(11) DEFAULT NULL,
  `id_lvl3` int(11) DEFAULT NULL,
  `id_lvl4` int(11) DEFAULT NULL,
  `id_lvl5` int(11) DEFAULT NULL,
  `id_lvl6` int(11) DEFAULT NULL,
  `id_lvl7` int(11) DEFAULT NULL,
  `id_lvl8` int(11) DEFAULT NULL,
  `id_lvl9` int(11) DEFAULT NULL,
  `valid_since` date DEFAULT NULL,
  `date_type_since` int(11) DEFAULT NULL,
  `valid_until` date NOT NULL DEFAULT '0000-00-00',
  `date_type_until` int(11) NOT NULL DEFAULT '0',
  KEY `hierarchy_loc_id_idx` (`loc_id`),
  KEY `hierarchy_level_idx` (`level`),
  KEY `hierarchy_lvl1_idx` (`id_lvl1`),
  KEY `hierarchy_lvl2_idx` (`id_lvl2`),
  KEY `hierarchy_lvl3_idx` (`id_lvl3`),
  KEY `hierarchy_lvl4_idx` (`id_lvl4`),
  KEY `hierarchy_lvl5_idx` (`id_lvl5`),
  KEY `hierarchy_lvl6_idx` (`id_lvl6`),
  KEY `hierarchy_lvl7_idx` (`id_lvl7`),
  KEY `hierarchy_lvl8_idx` (`id_lvl8`),
  KEY `hierarchy_lvl9_idx` (`id_lvl9`),
  KEY `hierarchy_since_idx` (`valid_since`),
  KEY `hierarchy_until_idx` (`valid_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_hierarchies`
--

LOCK TABLES `geodb_hierarchies` WRITE;
/*!40000 ALTER TABLE `geodb_hierarchies` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_intdata`
--

DROP TABLE IF EXISTS `geodb_intdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_intdata` (
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `int_val` bigint(20) NOT NULL DEFAULT '0',
  `int_type` int(11) NOT NULL DEFAULT '0',
  `int_subtype` int(11) DEFAULT NULL,
  `valid_since` date DEFAULT NULL,
  `date_type_since` int(11) DEFAULT NULL,
  `valid_until` date NOT NULL DEFAULT '0000-00-00',
  `date_type_until` int(11) NOT NULL DEFAULT '0',
  KEY `int_lid_idx` (`loc_id`),
  KEY `int_val_idx` (`int_val`),
  KEY `int_type_idx` (`int_type`),
  KEY `int_stype_idx` (`int_subtype`),
  KEY `int_since_idx` (`valid_since`),
  KEY `int_until_idx` (`valid_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='not in use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_intdata`
--

LOCK TABLES `geodb_intdata` WRITE;
/*!40000 ALTER TABLE `geodb_intdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_intdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_locations`
--

DROP TABLE IF EXISTS `geodb_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_locations` (
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `loc_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_id`),
  KEY `loc_type_idx` (`loc_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_locations`
--

LOCK TABLES `geodb_locations` WRITE;
/*!40000 ALTER TABLE `geodb_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_polygons`
--

DROP TABLE IF EXISTS `geodb_polygons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_polygons` (
  `polygon_id` int(11) NOT NULL DEFAULT '0',
  `seq_no` int(11) NOT NULL DEFAULT '0',
  `lon` double NOT NULL DEFAULT '0',
  `lat` double NOT NULL DEFAULT '0',
  UNIQUE KEY `polygon_id` (`polygon_id`,`seq_no`),
  KEY `polygons_pid_idx` (`polygon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='not in use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_polygons`
--

LOCK TABLES `geodb_polygons` WRITE;
/*!40000 ALTER TABLE `geodb_polygons` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_polygons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_search`
--

DROP TABLE IF EXISTS `geodb_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `sort` varchar(255) NOT NULL,
  `simple` varchar(255) NOT NULL,
  `simplehash` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`(191)),
  KEY `simple` (`simple`(191)),
  KEY `simplehash` (`simplehash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content, not in use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_search`
--

LOCK TABLES `geodb_search` WRITE;
/*!40000 ALTER TABLE `geodb_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_textdata`
--

DROP TABLE IF EXISTS `geodb_textdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_textdata` (
  `loc_id` int(11) NOT NULL DEFAULT '0',
  `text_val` varchar(255) NOT NULL DEFAULT '',
  `text_type` int(11) NOT NULL DEFAULT '0',
  `text_locale` varchar(5) DEFAULT NULL,
  `is_native_lang` smallint(1) DEFAULT NULL,
  `is_default_name` smallint(1) DEFAULT NULL,
  `valid_since` date DEFAULT NULL,
  `date_type_since` int(11) DEFAULT NULL,
  `valid_until` date NOT NULL DEFAULT '0000-00-00',
  `date_type_until` int(11) NOT NULL DEFAULT '0',
  KEY `text_lid_idx` (`loc_id`),
  KEY `text_val_idx` (`text_val`(191)),
  KEY `text_type_idx` (`text_type`),
  KEY `text_locale_idx` (`text_locale`),
  KEY `text_native_idx` (`is_native_lang`),
  KEY `text_default_idx` (`is_default_name`),
  KEY `text_since_idx` (`valid_since`),
  KEY `text_until_idx` (`valid_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_textdata`
--

LOCK TABLES `geodb_textdata` WRITE;
/*!40000 ALTER TABLE `geodb_textdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_textdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geodb_type_names`
--

DROP TABLE IF EXISTS `geodb_type_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geodb_type_names` (
  `type_id` int(11) NOT NULL DEFAULT '0',
  `type_locale` varchar(5) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `type_id` (`type_id`,`type_locale`),
  KEY `tid_tnames_idx` (`type_id`),
  KEY `locale_tnames_idx` (`type_locale`),
  KEY `name_tnames_idx` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='not in use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geodb_type_names`
--

LOCK TABLES `geodb_type_names` WRITE;
/*!40000 ALTER TABLE `geodb_type_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `geodb_type_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gk_item`
--

DROP TABLE IF EXISTS `gk_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gk_item` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` longtext NOT NULL,
  `userid` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `distancetravelled` float NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `typeid` int(11) NOT NULL,
  `stateid` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gk_item`
--

LOCK TABLES `gk_item` WRITE;
/*!40000 ALTER TABLE `gk_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `gk_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gk_item_type`
--

DROP TABLE IF EXISTS `gk_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gk_item_type` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gk_item_type`
--

LOCK TABLES `gk_item_type` WRITE;
/*!40000 ALTER TABLE `gk_item_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `gk_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gk_item_waypoint`
--

DROP TABLE IF EXISTS `gk_item_waypoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gk_item_waypoint` (
  `id` int(11) NOT NULL,
  `wp` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`wp`),
  KEY `wp` (`wp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gk_item_waypoint`
--

LOCK TABLES `gk_item_waypoint` WRITE;
/*!40000 ALTER TABLE `gk_item_waypoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `gk_item_waypoint` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `gkItemWaypointAfterInsert` AFTER INSERT ON `gk_item_waypoint`
     FOR EACH ROW BEGIN
        
        UPDATE caches SET meta_last_modified=NOW() WHERE caches.wp_oc=NEW.wp;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `gkItemWaypointAfterUpdate` AFTER UPDATE ON `gk_item_waypoint`
     FOR EACH ROW BEGIN
        
        UPDATE caches SET meta_last_modified=NOW() WHERE caches.wp_oc=OLD.wp;
        UPDATE caches SET meta_last_modified=NOW() WHERE caches.wp_oc=NEW.wp;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `gkItemWaypointAfterDelete` AFTER DELETE ON `gk_item_waypoint`
     FOR EACH ROW BEGIN
        IF IFNULL(@deleting_cache,0)=0 THEN
            
            UPDATE caches SET meta_last_modified=NOW() WHERE caches.wp_oc=OLD.wp;
         END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gk_move`
--

DROP TABLE IF EXISTS `gk_move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gk_move` (
  `id` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `datemoved` datetime NOT NULL,
  `datelogged` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `logtypeid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `itemid` (`itemid`,`datemoved`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gk_move`
--

LOCK TABLES `gk_move` WRITE;
/*!40000 ALTER TABLE `gk_move` DISABLE KEYS */;
/*!40000 ALTER TABLE `gk_move` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gk_move_type`
--

DROP TABLE IF EXISTS `gk_move_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gk_move_type` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gk_move_type`
--

LOCK TABLES `gk_move_type` WRITE;
/*!40000 ALTER TABLE `gk_move_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `gk_move_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gk_move_waypoint`
--

DROP TABLE IF EXISTS `gk_move_waypoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gk_move_waypoint` (
  `id` int(11) NOT NULL,
  `wp` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`wp`),
  KEY `wp` (`wp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gk_move_waypoint`
--

LOCK TABLES `gk_move_waypoint` WRITE;
/*!40000 ALTER TABLE `gk_move_waypoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `gk_move_waypoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gk_user`
--

DROP TABLE IF EXISTS `gk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gk_user` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gk_user`
--

LOCK TABLES `gk_user` WRITE;
/*!40000 ALTER TABLE `gk_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `gk_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gns_locations`
--

DROP TABLE IF EXISTS `gns_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gns_locations` (
  `rc` tinyint(4) NOT NULL DEFAULT '0',
  `ufi` int(11) NOT NULL DEFAULT '0',
  `uni` int(11) NOT NULL DEFAULT '0',
  `lat` double NOT NULL DEFAULT '0',
  `lon` double NOT NULL DEFAULT '0',
  `dms_lat` int(11) NOT NULL DEFAULT '0',
  `dms_lon` int(11) NOT NULL DEFAULT '0',
  `utm` varchar(4) NOT NULL,
  `jog` varchar(7) NOT NULL,
  `fc` char(1) NOT NULL,
  `dsg` varchar(5) NOT NULL,
  `pc` tinyint(4) NOT NULL DEFAULT '0',
  `cc1` char(2) NOT NULL,
  `adm1` char(2) NOT NULL,
  `adm2` varchar(200) NOT NULL,
  `dim` int(11) NOT NULL DEFAULT '0',
  `cc2` char(2) NOT NULL,
  `nt` char(1) NOT NULL,
  `lc` char(2) NOT NULL,
  `SHORT_FORM` varchar(128) NOT NULL,
  `GENERIC` varchar(128) NOT NULL,
  `SORT_NAME` varchar(200) NOT NULL,
  `FULL_NAME` varchar(200) NOT NULL,
  `FULL_NAME_ND` varchar(200) NOT NULL,
  `MOD_DATE` date NOT NULL DEFAULT '0000-00-00',
  `admtxt1` varchar(120) NOT NULL,
  `admtxt3` varchar(120) NOT NULL,
  `admtxt4` varchar(120) NOT NULL,
  `admtxt2` varchar(120) NOT NULL,
  PRIMARY KEY (`uni`),
  KEY `rc` (`rc`,`fc`,`dsg`,`cc1`),
  KEY `ufi` (`ufi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gns_locations`
--

LOCK TABLES `gns_locations` WRITE;
/*!40000 ALTER TABLE `gns_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gns_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gns_search`
--

DROP TABLE IF EXISTS `gns_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gns_search` (
  `uni_id` int(11) NOT NULL DEFAULT '0',
  `sort` varchar(255) NOT NULL,
  `simple` varchar(255) NOT NULL,
  `simplehash` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `simplehash` (`simplehash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gns_search`
--

LOCK TABLES `gns_search` WRITE;
/*!40000 ALTER TABLE `gns_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `gns_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helppages`
--

DROP TABLE IF EXISTS `helppages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helppages` (
  `ocpage` varchar(60) NOT NULL,
  `language` char(2) NOT NULL,
  `helppage` varchar(120) NOT NULL,
  UNIQUE KEY `ocpage` (`ocpage`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helppages`
--

LOCK TABLES `helppages` WRITE;
/*!40000 ALTER TABLE `helppages` DISABLE KEYS */;
INSERT INTO `helppages` (`ocpage`, `language`, `helppage`) VALUES ('*map2','DE','Cachekarte'),('activation','DE','Aktivierung'),('additional_waypoints','DE','Zusätzliche Wegpunkte'),('addtolist','DE','Cachelisten'),('adoptcache','DE','Adoption'),('adoptcache','EN','Adoptions'),('cachelists','DE','Cachelisten'),('change_statpic','DE','Statistikbild'),('editcache','*','!articles.php?page=cacheinfo'),('editdesc','DE','Beschreibungstext'),('editlog','DE','Das Onlinelog'),('error','DE','Fehlermeldungen'),('helpindex','DE','Opencaching.de-Hilfe'),('helpindex','EN','Opencaching Website Help'),('login','DE','Login'),('login','EN','EN/Login'),('log_cache','DE','Das Onlinelog'),('mailto','DE','Benutzerprofil#Emailversand'),('mydetails','DE','Benutzerprofil#Einstellungen'),('myhome','DE','Benutzerprofil'),('myignores','DE','Caches ignorieren'),('mylists','DE','Cachelisten'),('myprofile','DE','Benutzerprofil#Einstellungen'),('mystatpic','DE','Statistikbild'),('mytop5','DE','Empfehlungen'),('mywatches','DE','Benachrichtigungen'),('newcache','*','!articles.php?page=cacheinfo'),('newdesc','DE','Beschreibungstext'),('newlogpics','DE','Logbild-Galerien'),('newpw','DE','Passwort'),('npa','DE','Schutzgebiete'),('npa','EN','Protected areas'),('oconly','DE','OConly'),('oconly81','DE','OConly-81'),('opencaching','DE','Opencaching.de'),('opencaching','EN','About Opencaching.de'),('picture','DE','Bilder'),('previewpics','DE','Vorschaubilder'),('query','DE','Gespeicherte Suchen'),('register','DE','Registrierung'),('register','EN','Registration'),('removelog_cacheowner','DE','Logeintrag löschen'),('removelog_logowner','DE','Logeintrag löschen'),('reportcache','DE','Cache melden'),('report_reasons','DE','Cache melden#Wann melden.3F'),('search','DE','Suchformular'),('tops','DE','Empfehlungen'),('tops','EN','Recommendations'),('usernote','DE','Persönliche Notiz'),('usertops','DE','Empfehlungen'),('viewcache','DE','Listing'),('viewlogs','DE','Das Onlinelog'),('viewprofile','DE','Benutzerprofil'),('viewprofile_pics','DE','Logbild-Galerien'),('wikinews','DE','Hauptseite/Neue Artikel'),('wikinews','EN','New articles');
/*!40000 ALTER TABLE `helppages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `short` char(2) NOT NULL,
  `name` varchar(60) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `native_name` varchar(60) NOT NULL,
  `de` varchar(60) NOT NULL COMMENT 'obsolete',
  `en` varchar(60) NOT NULL COMMENT 'obsolete',
  `list_default_de` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'obsolete',
  `list_default_en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'obsolete',
  `is_translated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`short`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`short`, `name`, `trans_id`, `native_name`, `de`, `en`, `list_default_de`, `list_default_en`, `is_translated`) VALUES ('BG','Bulgarian',146,'български език','Bulgarisch','Bulgarian',0,0,0),('CA','Catalan',2243,'Català','Katalanisch','Catalan',0,0,0),('CS','Czech',145,'Čeština','Tschechisch','Czech',0,0,0),('DA','Danish',104,'Dansk','Dänisch','Danish',1,1,0),('DE','German',160,'Deutsch','Deutsch','German',1,1,1),('EL','Greek',103,'Ελληνικά','Griechisch','Greek',0,0,0),('EN','English',159,'English','Englisch','English',1,1,1),('EO','Esperanto',102,'Esperanto','Esperanto','Esperanto',0,0,0),('ES','Spanish',157,'Español','Spanisch','Spanish',1,1,1),('ET','Estonian',101,'Eesti','Estnisch','Estonian',0,0,0),('EU','Basque',100,'Euskara','Baskisch','Basque',0,0,0),('FI','Finnish',93,'Suomi','Finnisch','Finnish',0,0,0),('FR','French',158,'Français','Französisch','French',1,1,1),('HR','Croatian',92,'Hrvatski','Kroatisch','Croatian',0,0,0),('HU','Hungarian',91,'Magyar','Ungarisch','Hungarian',0,0,0),('IS','Icelandic',79,'Íslenska','Isländisch','Icelandic',0,0,0),('IT','Italian',78,'Italiano','Italienisch','Italian',0,0,1),('JA','Japanese',156,'日本語','Japanisch','Japanese',0,0,0),('LB','Luxembourgish',2242,'Lëtzebuergesch','Luxemburgisch','Luxembourgish',0,0,0),('LT','Lithuanian',77,'Lietuvių','Litauisch','Lithuanian',0,0,0),('LV','Latvian',76,'Latviešu','Lettisch','Latvian',0,0,0),('NL','Dutch',155,'Nederlands','Niederländisch','Dutch',1,1,0),('NO','Norwegian',75,'Norsk','Norwegisch','Norwegian',0,0,0),('PL','Polish',74,'Polski','Polnisch','Polish',1,1,0),('PT','Portuguese',64,'Português','Portugiesisch','Portuguese',0,0,0),('RO','Romanian',59,'Română','Rumänisch','Romanian',0,0,0),('RU','Russian',49,'Русский','Russisch','Russian',0,0,0),('SK','Slovak',48,'Slovenčina','Slowakisch','Slovak',0,0,0),('SL','Slovenian',43,'Slovenščina','Slowenisch','Slovenian',0,0,0),('SV','Swedish',42,'Svenska','Schwedisch','Swedish',0,0,0),('TH','Thai',2241,'ไทย','Thai','Thai',0,0,0),('TR','Turkish',36,'Türkçe','Türkisch','Turkish',0,0,0),('VI','Vietnamese',21,'Việt Nam','Vietnamesisch','Vietnamese',0,0,0),('ZH','Chinese',2240,'中文','Chinesisch','Chinese',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages_list_default`
--

DROP TABLE IF EXISTS `languages_list_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages_list_default` (
  `lang` varchar(2) NOT NULL,
  `show` varchar(2) NOT NULL,
  PRIMARY KEY (`lang`,`show`),
  KEY `show` (`show`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages_list_default`
--

LOCK TABLES `languages_list_default` WRITE;
/*!40000 ALTER TABLE `languages_list_default` DISABLE KEYS */;
INSERT INTO `languages_list_default` (`lang`, `show`) VALUES ('DE','CS'),('DE','DA'),('DE','DE'),('DE','EN'),('DE','ES'),('DE','FR'),('DE','IT'),('DE','NL'),('DE','PL'),('EN','CS'),('EN','DA'),('EN','DE'),('EN','EN'),('EN','ES'),('EN','FR'),('EN','HR'),('EN','IT'),('EN','NL'),('EN','NO'),('EN','PL'),('EN','PT'),('EN','SV'),('ES','CA'),('ES','DE'),('ES','EN'),('ES','ES'),('ES','EU'),('ES','FR'),('ES','IT'),('ES','PT'),('FR','DA'),('FR','DE'),('FR','EN'),('FR','ES'),('FR','FR'),('FR','IT'),('FR','LB'),('FR','NL'),('FR','PL'),('FR','PT'),('IT','DE'),('IT','EL'),('IT','EN'),('IT','ES'),('IT','FR'),('IT','HR'),('IT','IT'),('IT','SK');
/*!40000 ALTER TABLE `languages_list_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_types`
--

DROP TABLE IF EXISTS `log_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `permission` char(1) NOT NULL COMMENT 'obsolete',
  `cache_status` tinyint(1) NOT NULL DEFAULT '0',
  `de` varchar(60) NOT NULL COMMENT 'obsolete',
  `en` varchar(60) NOT NULL,
  `icon_small` varchar(255) NOT NULL,
  `allow_rating` tinyint(1) NOT NULL,
  `require_password` tinyint(1) NOT NULL,
  `maintenance_logs` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_types`
--

LOCK TABLES `log_types` WRITE;
/*!40000 ALTER TABLE `log_types` DISABLE KEYS */;
INSERT INTO `log_types` (`id`, `name`, `trans_id`, `permission`, `cache_status`, `de`, `en`, `icon_small`, `allow_rating`, `require_password`, `maintenance_logs`) VALUES (1,'Found',56,'C',0,'gefunden','found','log/16x16-found.png',1,1,1),(2,'Not found',497,'C',0,'nicht gefunden','not found','log/16x16-dnf.png',0,0,1),(3,'Note',20,'A',0,'Bemerkung','note','log/16x16-note.png',0,0,1),(7,'Attended',498,'C',0,'teilgenommen','attended','log/16x16-attended.png',1,1,0),(8,'Will attend',499,'C',0,'möchte teilnehmen','will attend','log/16x16-will_attend.png',0,0,0),(9,'Archived',496,'C',3,'archiviert','Archived','log/16x16-archived.png',0,0,0),(10,'Available',531,'C',1,'kann gesucht werden','Available','log/16x16-active.png',0,0,1),(11,'Temporarily not available',532,'C',2,'momentan nicht verfügbar','Temporarily not available','log/16x16-disabled.png',0,0,1),(13,'Locked',2023,'C',6,'gesperrt','Locked','log/16x16-locked.png',0,0,0),(14,'Locked, invisible',822,'C',7,'gesperrt, versteckt','Locked, invisible','log/16x16-locked-invisible.png',0,0,0);
/*!40000 ALTER TABLE `log_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_types_text`
--

DROP TABLE IF EXISTS `log_types_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_types_text` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'obsolete',
  `log_types_id` int(10) NOT NULL DEFAULT '0' COMMENT 'obsolete',
  `lang` char(2) NOT NULL COMMENT 'obsolete',
  `text_combo` varchar(255) NOT NULL COMMENT 'obsolete',
  `text_listing` varchar(255) NOT NULL COMMENT 'obsolete',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang` (`lang`,`log_types_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='obsolete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_types_text`
--

LOCK TABLES `log_types_text` WRITE;
/*!40000 ALTER TABLE `log_types_text` DISABLE KEYS */;
INSERT INTO `log_types_text` (`id`, `log_types_id`, `lang`, `text_combo`, `text_listing`) VALUES (1,1,'DE','gefunden','hat den Cache gefunden'),(2,2,'DE','nicht gefunden','hat den Cache nicht gefunden'),(3,3,'DE','Bemerkung','hat eine Bemerkung geschrieben'),(4,4,'DE','gesperrt','hat den Cache gesperrt'),(5,5,'DE','fregegeben','hat den Cache wieder freigegeben'),(6,6,'DE','entfernt','hat den Cache entfernt'),(13,7,'EN','attended','attended the event'),(14,8,'EN','will attend','will attend the event'),(15,7,'DE','Teilgenommen','hat am Event teilgenommen'),(16,8,'DE','will dabei sein','beabsichtigt, am Event teilzunehmen');
/*!40000 ALTER TABLE `log_types_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logentries`
--

DROP TABLE IF EXISTS `logentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logentries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL COMMENT 'via Trigger (logentries)',
  `module` varchar(30) NOT NULL,
  `eventid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `objectid1` int(10) unsigned NOT NULL DEFAULT '0',
  `objectid2` int(10) unsigned NOT NULL DEFAULT '0',
  `logtext` longtext NOT NULL,
  `details` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date_created`),
  KEY `userid` (`userid`,`objectid1`,`module`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logentries`
--

LOCK TABLES `logentries` WRITE;
/*!40000 ALTER TABLE `logentries` DISABLE KEYS */;
INSERT INTO `logentries` (`id`, `date_created`, `module`, `eventid`, `userid`, `objectid1`, `objectid2`, `logtext`, `details`) VALUES (1,'2020-12-18 11:15:32','user',6,107469,170298,0,'User Gesperrter Nutzer disabled',_binary 'a:7:{s:8:\"username\";s:17:\"Gesperrter Nutzer\";s:5:\"email\";s:20:\"gesperrt@example.com\";s:9:\"last_name\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:7:\"country\";s:2:\"DE\";s:8:\"latitude\";i:0;s:9:\"longitude\";i:0;}');
/*!40000 ALTER TABLE `logentries` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `logentriesBeforeInsert` BEFORE INSERT ON `logentries`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logentries_types`
--

DROP TABLE IF EXISTS `logentries_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logentries_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `eventname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logentries_types`
--

LOCK TABLES `logentries_types` WRITE;
/*!40000 ALTER TABLE `logentries_types` DISABLE KEYS */;
INSERT INTO `logentries_types` (`id`, `module`, `eventname`) VALUES (1,'watchlist','owner_notify'),(2,'watchlist','sendmail'),(3,'remindemail','sendmail'),(4,'approving','deletecache'),(5,'cache','changeowner'),(6,'user','disable'),(7,'user','delete'),(8,'notification','sendmail');
/*!40000 ALTER TABLE `logentries_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `remote_addr` varchar(15) NOT NULL,
  `success` int(1) NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map2_data`
--

DROP TABLE IF EXISTS `map2_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map2_data` (
  `result_id` int(10) unsigned NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`result_id`,`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map2_data`
--

LOCK TABLES `map2_data` WRITE;
/*!40000 ALTER TABLE `map2_data` DISABLE KEYS */;
INSERT INTO `map2_data` (`result_id`, `cache_id`) VALUES (1,1),(1,3),(1,4),(1,5),(1,6),(2,1),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,10),(3,1),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,10),(4,1),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15);
/*!40000 ALTER TABLE `map2_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map2_result`
--

DROP TABLE IF EXISTS `map2_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map2_result` (
  `result_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slave_id` mediumint(9) NOT NULL,
  `sqlchecksum` int(10) unsigned NOT NULL,
  `sqlquery` mediumtext NOT NULL,
  `shared_counter` int(10) unsigned NOT NULL,
  `request_counter` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_lastqueried` datetime NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `sqlchecksum` (`sqlchecksum`),
  KEY `date_created` (`date_created`),
  KEY `date_lastqueried` (`date_lastqueried`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map2_result`
--

LOCK TABLES `map2_result` WRITE;
/*!40000 ALTER TABLE `map2_result` DISABLE KEYS */;
INSERT INTO `map2_result` (`result_id`, `slave_id`, `sqlchecksum`, `sqlquery`, `shared_counter`, `request_counter`, `date_created`, `date_lastqueried`) VALUES (1,-1,2437006912,'\nSELECT `caches`.`cache_id` `cache_id` FROM `caches` INNER JOIN `cache_status` ON `caches`.`status`=`cache_status`.`id` WHERE `caches`.`status` NOT IN (3,6,7) AND `caches`.`status`<>2 AND (`cache_status`.`allow_user_view`=1 OR `caches`.`user_id`=170289 OR (`caches`.`status`<>5 AND 0))',0,10,'2020-12-17 14:33:00','2020-12-17 14:33:31'),(2,-1,2713476729,'\nSELECT `caches`.`cache_id` `cache_id` FROM `caches` INNER JOIN `cache_status` ON `caches`.`status`=`cache_status`.`id` WHERE `caches`.`status` NOT IN (3,6,7) AND `caches`.`status`<>2 AND (`cache_status`.`allow_user_view`=1 OR `caches`.`user_id`=170291 OR (`caches`.`status`<>5 AND 0))',0,4,'2020-12-18 09:10:33','2020-12-18 09:10:46'),(3,-1,2713476729,'\nSELECT `caches`.`cache_id` `cache_id` FROM `caches` INNER JOIN `cache_status` ON `caches`.`status`=`cache_status`.`id` WHERE `caches`.`status` NOT IN (3,6,7) AND `caches`.`status`<>2 AND (`cache_status`.`allow_user_view`=1 OR `caches`.`user_id`=170291 OR (`caches`.`status`<>5 AND 0))',0,7,'2020-12-18 09:11:25','2020-12-18 09:11:32'),(4,-1,867506849,'\nSELECT `caches`.`cache_id` `cache_id` FROM `caches` INNER JOIN `cache_status` ON `caches`.`status`=`cache_status`.`id` WHERE `caches`.`status` NOT IN (3,6,7) AND `caches`.`status`<>2 AND (`cache_status`.`allow_user_view`=1 OR `caches`.`user_id`=170295 OR (`caches`.`status`<>5 AND 0))',0,3,'2020-12-18 10:08:52','2020-12-18 10:08:55');
/*!40000 ALTER TABLE `map2_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `map2resultAfterDelete` AFTER DELETE ON `map2_result`
     FOR EACH ROW BEGIN
        DELETE FROM `map2_data` WHERE `result_id`=OLD.`result_id`;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mapresult`
--

DROP TABLE IF EXISTS `mapresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapresult` (
  `query_id` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`query_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapresult`
--

LOCK TABLES `mapresult` WRITE;
/*!40000 ALTER TABLE `mapresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapresult_data`
--

DROP TABLE IF EXISTS `mapresult_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapresult_data` (
  `query_id` int(10) unsigned NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`query_id`,`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapresult_data`
--

LOCK TABLES `mapresult_data` WRITE;
/*!40000 ALTER TABLE `mapresult_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapresult_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` (`version`) VALUES ('20160607213541'),('20170221215409'),('20170510222222'),('20170516084212'),('20170526212910'),('20170830005500'),('20171007113730'),('20171007113841'),('20190211224434'),('20200616183000');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp3`
--

DROP TABLE IF EXISTS `mp3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mp3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL COMMENT 'via Trigger (mp3)',
  `last_modified` datetime NOT NULL COMMENT 'via Trigger (mp3)',
  `url` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `last_url_check` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `local` tinyint(1) NOT NULL DEFAULT '1',
  `unknown_format` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `last_modified` (`last_modified`),
  KEY `url` (`url`(191)),
  KEY `title` (`title`(191)),
  KEY `object_id` (`object_id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp3`
--

LOCK TABLES `mp3` WRITE;
/*!40000 ALTER TABLE `mp3` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp3` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `mp3BeforeInsert` BEFORE INSERT ON `mp3`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`last_modified`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `mp3BeforeUpdate` BEFORE UPDATE ON `mp3`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`last_modified`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `mp3AfterDelete` AFTER DELETE ON `mp3`
     FOR EACH ROW BEGIN
        INSERT IGNORE INTO `removed_objects` (`localId`, `uuid`, `type`, `node`)
        VALUES (OLD.`id`, OLD.`uuid`, 8, OLD.`node`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `url` varchar(260) NOT NULL,
  `waypoint_prefix` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waypoint_prefix` (`waypoint_prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` (`id`, `name`, `url`, `waypoint_prefix`) VALUES (1,'Opencaching Germany','www.opencaching.de','OC'),(2,'Opencaching Poland','opencaching.pl','OP'),(3,'Opencaching Czech','www.opencaching.cz','OZ'),(4,'Local Development','','AA'),(6,'Opencaching Sweden','www.opencaching.se','OS'),(7,'Opencaching Great Britan','opencache.uk','OK'),(8,'Opencaching Norway','www.opencaching.no','ON'),(9,'Opencaching Latvian','www.opencaching.lv','OV'),(10,'Opencaching United States','www.opencaching.us','OU'),(11,'Opencaching Japan','www.opencaching.jp','OJ'),(12,'Opencaching Russia','www.opencaching.su','O?'),(13,'Opencaching Garmin','www.opencaching.com','OX'),(14,'Opencaching Benelux','www.opencaching.nl','OB'),(16,'Opencaching Romania','www.opencaching.ro','OR');
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_waiting`
--

DROP TABLE IF EXISTS `notify_waiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_waiting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cache_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cache_user` (`cache_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2217703 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_waiting`
--

LOCK TABLES `notify_waiting` WRITE;
/*!40000 ALTER TABLE `notify_waiting` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_waiting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npa_areas`
--

DROP TABLE IF EXISTS `npa_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npa_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` char(3) NOT NULL,
  `exclude` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shape` linestring NOT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `shape` (`shape`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npa_areas`
--

LOCK TABLES `npa_areas` WRITE;
/*!40000 ALTER TABLE `npa_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `npa_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npa_types`
--

DROP TABLE IF EXISTS `npa_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npa_types` (
  `id` char(3) NOT NULL,
  `name` varchar(60) NOT NULL,
  `ordinal` tinyint(4) NOT NULL,
  `no_warning` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ordinal` (`ordinal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npa_types`
--

LOCK TABLES `npa_types` WRITE;
/*!40000 ALTER TABLE `npa_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `npa_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuts_codes`
--

DROP TABLE IF EXISTS `nuts_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuts_codes` (
  `code` varchar(10) NOT NULL,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `code` (`code`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuts_codes`
--

LOCK TABLES `nuts_codes` WRITE;
/*!40000 ALTER TABLE `nuts_codes` DISABLE KEYS */;
INSERT INTO `nuts_codes` (`code`, `name`) VALUES ('AT','Österreich'),('AT1','Ostösterreich'),('AT11','Burgenland'),('AT111','Mittelburgenland'),('AT112','Nordburgenland'),('AT113','Südburgenland'),('AT12','Niederösterreich'),('AT121','Mostviertel-Eisenwurzen'),('AT122','Niederösterreich-Süd'),('AT123','Sankt Pölten'),('AT124','Waldviertel'),('AT125','Weinviertel'),('AT126','Wiener Umland/Nordteil'),('AT127','Wiener Umland/Südteil'),('AT13','Wien'),('AT130','Wien'),('AT2','Südösterreich'),('AT21','Kärnten'),('AT211','Klagenfurt-Villach'),('AT212','Oberkärnten'),('AT213','Unterkärnten'),('AT22','Steiermark'),('AT221','Graz'),('AT222','Liezen'),('AT223','Östliche Obersteiermark'),('AT224','Oststeiermark'),('AT225','West- und Südsteiermark'),('AT226','Westliche Obersteiermark'),('AT3','Westösterreich'),('AT31','Oberösterreich'),('AT311','Innviertel'),('AT312','Linz-Wels'),('AT313','Mühlviertel'),('AT314','Steyr-Kirchdorf'),('AT315','Traunviertel'),('AT32','Salzburg'),('AT321','Lungau'),('AT322','Pinzgau-Pongau'),('AT323','Salzburg und Umgebung'),('AT33','Tirol'),('AT331','Außerfern'),('AT332','Innsbruck'),('AT333','Osttirol'),('AT334','Tiroler Oberland'),('AT335','Tiroler Unterland'),('AT34','Vorarlberg'),('AT341','Bludenz-Bregenzer Wald'),('AT342','Rheintal-Bodenseegebiet'),('ATZ','Extra-Regio'),('ATZZ','Extra-Regio'),('ATZZZ','Extra-Regio'),('BE','Belgien'),('BE1','Région de Bruxelles-Capitale/Brussels Hoofdstedelijk Gewest'),('BE10','Région de Bruxelles-Capitale/Brussels Hoofdstedelijk Gewest'),('BE100','Arr. [1] de Bruxelles-Capitale/Arr. van Brussel-Hoofdstad'),('BE2','Vlaams Gewest'),('BE21','Prov. [2] Antwerpen'),('BE211','Arr. Antwerpen'),('BE212','Arr. Mechelen'),('BE213','Arr. Turnhout'),('BE22','Prov. Limburg'),('BE221','Arr. Hasselt'),('BE222','Arr. Maaseik'),('BE223','Arr. Tongeren'),('BE23','Prov. Oost-Vlaanderen'),('BE231','Arr. Aalst'),('BE232','Arr. Dendermonde'),('BE233','Arr. Eeklo'),('BE234','Arr. Gent'),('BE235','Arr. Oudenaarde'),('BE236','Arr. Sint-Niklaas'),('BE24','Prov. Vlaams-Brabant'),('BE241','Arr. Halle-Vilvoorde'),('BE242','Arr. Leuven'),('BE25','Prov. West-Vlaanderen'),('BE251','Arr. Brugge'),('BE252','Arr. Diksmuide'),('BE253','Arr. Ieper'),('BE254','Arr. Kortrijk'),('BE255','Arr. Oostende'),('BE256','Arr. Roeselare'),('BE257','Arr. Tielt'),('BE258','Arr. Veurne'),('BE3','Région Wallonne'),('BE31','Prov. Brabant Wallon'),('BE310','Arr. Nivelles'),('BE32','Prov. Hainaut'),('BE321','Arr. Ath'),('BE322','Arr. Charleroi'),('BE323','Arr. Mons'),('BE324','Arr. Mouscron'),('BE325','Arr. Soignies'),('BE326','Arr. Thuin'),('BE327','Arr. Tournai'),('BE33','Prov. Liège'),('BE331','Arr. Huy'),('BE332','Arr. Liège'),('BE333','Arr. Verviers'),('BE334','Arr. Waremme'),('BE335','Arr. Verviers — communes francophones'),('BE336','Bezirk Verviers — Deutschsprachige Gemeinschaft'),('BE34','Prov. Luxembourg'),('BE341','Arr. Arlon'),('BE342','Arr. Bastogne'),('BE343','Arr. Marche-en-Famenne'),('BE344','Arr. Neufchâteau'),('BE345','Arr. Virton'),('BE35','Prov. Namur'),('BE351','Arr. Dinant'),('BE352','Arr. Namur'),('BE353','Arr. Philippeville'),('BEZ','Extra-Eegio'),('BEZZ','Extra-Regio'),('BEZZZ','Extra-Regio'),('BG','Bulgarien'),('BG3','Северна и Югоизточна България'),('BG31','Северозападен'),('BG311','Видин'),('BG312','Монтана'),('BG313','Враца'),('BG314','Плевен'),('BG315','Ловеч'),('BG32','Северен централен'),('BG321','Велико Търново'),('BG322','Габрово'),('BG323','Русе'),('BG324','Разград'),('BG325','Силистра'),('BG33','Североизточен'),('BG331','Варна'),('BG332','Добрич'),('BG333','Шумен'),('BG334','Търговище'),('BG34','Югоизточен'),('BG341','Бургас'),('BG342','Сливен'),('BG343','Ямбол'),('BG344','Стара Загора'),('BG4','Югозападна и Южна Централна България'),('BG41','Югозападен'),('BG411','София (столица)'),('BG412','София'),('BG413','Благоевград'),('BG414','Перник'),('BG415','Кюстендил'),('BG42','Южен централен'),('BG421','Пловдив'),('BG422','Хасково'),('BG423','Пазарджик'),('BG424','Смолян'),('BG425','Кърджали'),('BGZ','Extra-Regio'),('BGZZ','Extra-Regio'),('BGZZZ','Extra-Regio'),('CH','Schweiz'),('CH01','Région lémanique'),('CH011','Vaud'),('CH012','Valais'),('CH013','Genève'),('CH02','Espace Mittelland'),('CH021','Bern'),('CH022','Freiburg'),('CH023','Solothurn'),('CH024','Neuchâtel'),('CH025','Jura'),('CH03','Nordwestschweiz'),('CH031','Basel-Stadt'),('CH032','Basel-Landschaft'),('CH033','Aargau'),('CH04','Zürich'),('CH05','Ostschweiz'),('CH051','Glarus'),('CH052','Schaffhausen'),('CH053','Appenzell Ausserrhoden'),('CH054','Appenzell Innerrhoden'),('CH055','St. Gallen'),('CH056','Graubünden'),('CH057','Thurgau'),('CH06','Zentralschweiz'),('CH061','Luzern'),('CH062','Uri'),('CH063','Schwyz'),('CH064','Obwalden'),('CH065','Nidwalden'),('CH066','Zug'),('CH07','Ticino'),('CY','Zypern'),('CY0','Κύπρος/Kıbrıs'),('CY00','Κύπρος/Kıbrıs'),('CY000','Κύπρος/Kıbrıs'),('CYZ','Extra-Regio'),('CYZZ','Extra-Regio'),('CYZZZ','Extra-Regio'),('CZ','Tschechische Republik'),('CZ0','Česká republika'),('CZ01','Praha'),('CZ010','Hlavní město Praha'),('CZ02','Střední Čechy'),('CZ020','Středočeský kraj'),('CZ03','Jihozápad'),('CZ031','Jihočeský kraj'),('CZ032','Plzeňský kraj'),('CZ04','Severozápad'),('CZ041','Karlovarský kraj'),('CZ042','Ústecký kraj'),('CZ05','Severovýchod'),('CZ051','Liberecký kraj'),('CZ052','Královéhradecký kraj'),('CZ053','Pardubický kraj'),('CZ06','Jihovýchod'),('CZ061','Kraj Vysočina'),('CZ062','Jihomoravský kraj'),('CZ063','Vysočina'),('CZ064','Jihomoravský kraj'),('CZ07','Střední Morava'),('CZ071','Olomoucký kraj'),('CZ072','Zlínský kraj'),('CZ08','Moravskoslezsko'),('CZ080','Moravskoslezský kraj'),('CZZ','Extra-Regio'),('CZZZ','Extra-Regio'),('CZZZZ','Extra-Regio'),('DE','Deutschland'),('DE1','Baden-Württemberg'),('DE11','Stuttgart'),('DE111','Stuttgart, Stadtkreis'),('DE112','Böblingen'),('DE113','Esslingen'),('DE114','Göppingen'),('DE115','Ludwigsburg'),('DE116','Rems-Murr-Kreis'),('DE117','Heilbronn, Stadtkreis'),('DE118','Heilbronn, Landkreis'),('DE119','Hohenlohekreis'),('DE11A','Schwäbisch Hall'),('DE11B','Main-Tauber-Kreis'),('DE11C','Heidenheim'),('DE11D','Ostalbkreis'),('DE12','Karlsruhe'),('DE121','Baden-Baden, Stadtkreis'),('DE122','Karlsruhe, Stadtkreis'),('DE123','Karlsruhe, Landkreis'),('DE124','Rastatt'),('DE125','Heidelberg, Stadtkreis'),('DE126','Mannheim, Stadtkreis'),('DE127','Neckar-Odenwald-Kreis'),('DE128','Rhein-Neckar-Kreis'),('DE129','Pforzheim, Stadtkreis'),('DE12A','Calw'),('DE12B','Enzkreis'),('DE12C','Freudenstadt'),('DE13','Freiburg'),('DE131','Freiburg im Breisgau, Stadtkreis'),('DE132','Breisgau-Hochschwarzwald'),('DE133','Emmendingen'),('DE134','Ortenaukreis'),('DE135','Rottweil'),('DE136','Schwarzwald-Baar-Kreis'),('DE137','Tuttlingen'),('DE138','Konstanz'),('DE139','Lörrach'),('DE13A','Waldshut'),('DE14','Tübingen'),('DE141','Reutlingen'),('DE142','Tübingen, Landkreis'),('DE143','Zollernalbkreis'),('DE144','Ulm, Stadtkreis'),('DE145','Alb-Donau-Kreis'),('DE146','Biberach'),('DE147','Bodenseekreis'),('DE148','Ravensburg'),('DE149','Sigmaringen'),('DE2','Bayern'),('DE21','Oberbayern'),('DE211','Ingolstadt, Kreisfreie Stadt'),('DE212','München, Kreisfreie Stadt'),('DE213','Rosenheim, Kreisfreie Stadt'),('DE214','Altötting'),('DE215','Berchtesgadener Land'),('DE216','Bad Tölz-Wolfratshausen'),('DE217','Dachau'),('DE218','Ebersberg'),('DE219','Eichstätt'),('DE21A','Erding'),('DE21B','Freising'),('DE21C','Fürstenfeldbruck'),('DE21D','Garmisch-Partenkirchen'),('DE21E','Landsberg a. Lech'),('DE21F','Miesbach'),('DE21G','Mühldorf a. Inn'),('DE21H','München, Landkreis'),('DE21I','Neuburg-Schrobenhausen'),('DE21J','Pfaffenhofen a. d. Ilm'),('DE21K','Rosenheim, Landkreis'),('DE21L','Starnberg'),('DE21M','Traunstein'),('DE21N','Weilheim-Schongau'),('DE22','Niederbayern'),('DE221','Landshut, Kreisfreie Stadt'),('DE222','Passau, Kreisfreie Stadt'),('DE223','Straubing, Kreisfreie Stadt'),('DE224','Deggendorf'),('DE225','Freyung-Grafenau'),('DE226','Kelheim'),('DE227','Landshut, Landkreis'),('DE228','Passau, Landkreis'),('DE229','Regen'),('DE22A','Rottal-Inn'),('DE22B','Straubing-Bogen'),('DE22C','Dingolfing-Landau'),('DE23','Oberpfalz'),('DE231','Amberg, Kreisfreie Stadt'),('DE232','Regensburg, Kreisfreie Stadt'),('DE233','Weiden i. d. Opf, Kreisfreie Stadt'),('DE234','Amberg-Sulzbach'),('DE235','Cham'),('DE236','Neumarkt i. d. OPf.'),('DE237','Neustadt a. d. Waldnaab'),('DE238','Regensburg, Landkreis'),('DE239','Schwandorf'),('DE23A','Tirschenreuth'),('DE24','Oberfranken'),('DE241','Bamberg, Kreisfreie Stadt'),('DE242','Bayreuth, Kreisfreie Stadt'),('DE243','Coburg, Kreisfreie Stadt'),('DE244','Hof, Kreisfreie Stadt'),('DE245','Bamberg, Landkreis'),('DE246','Bayreuth, Landkreis'),('DE247','Coburg, Landkreis'),('DE248','Forchheim'),('DE249','Hof, Landkreis'),('DE24A','Kronach'),('DE24B','Kulmbach'),('DE24C','Lichtenfels'),('DE24D','Wunsiedel i. Fichtelgebirge'),('DE25','Mittelfranken'),('DE251','Ansbach, Kreisfreie Stadt'),('DE252','Erlangen, Kreisfreie Stadt'),('DE253','Fürth, Kreisfreie Stadt'),('DE254','Nürnberg, Kreisfreie Stadt'),('DE255','Schwabach, Kreisfreie Stadt'),('DE256','Ansbach, Landkreis'),('DE257','Erlangen-Höchstadt'),('DE258','Fürth, Landkreis'),('DE259','Nürnberger Land'),('DE25A','Neustadt a. d. Aisch-Bad Windsheim'),('DE25B','Roth'),('DE25C','Weißenburg-Gunzenhausen'),('DE26','Unterfranken'),('DE261','Aschaffenburg, Kreisfreie Stadt'),('DE262','Schweinfurt, Kreisfreie Stadt'),('DE263','Würzburg, Kreisfreie Stadt'),('DE264','Aschaffenburg, Landkreis'),('DE265','Bad Kissingen'),('DE266','Rhön-Grabfeld'),('DE267','Haßberge'),('DE268','Kitzingen'),('DE269','Miltenberg'),('DE26A','Main-Spessart'),('DE26B','Schweinfurt, Landkreis'),('DE26C','Würzburg, Landkreis'),('DE27','Schwaben'),('DE271','Augsburg, Kreisfreie Stadt'),('DE272','Kaufbeuren, Kreisfreie Stadt'),('DE273','Kempten (Allgäu), Kreisfreie Stadt'),('DE274','Memmingen, Kreisfreie Stadt'),('DE275','Aichach-Friedberg'),('DE276','Augsburg, Landkreis'),('DE277','Dillingen a.d. Donau'),('DE278','Günzburg'),('DE279','Neu-Ulm'),('DE27A','Lindau (Bodensee)'),('DE27B','Ostallgäu'),('DE27C','Unterallgäu'),('DE27D','Donau-Ries'),('DE27E','Oberallgäu'),('DE3','Berlin'),('DE30','Berlin'),('DE300','Berlin'),('DE4','Brandenburg'),('DE41','Brandenburg — Nordost'),('DE411','Frankfurt (Oder), Kreisfreie Stadt'),('DE412','Barnim'),('DE413','Märkisch-Oderland'),('DE414','Oberhavel'),('DE415','Oder-Spree'),('DE416','Ostprignitz-Ruppin'),('DE417','Prignitz'),('DE418','Uckermark'),('DE42','Brandenburg — Südwest'),('DE421','Brandenburg an der Havel, Kreisfreie Stadt'),('DE422','Cottbus, Kreisfreie Stadt'),('DE423','Potsdam, Kreisfreie Stadt'),('DE424','Dahme-Spreewald'),('DE425','Elbe-Elster'),('DE426','Havelland'),('DE427','Oberspreewald-Lausitz'),('DE428','Potsdam-Mittelmark'),('DE429','Spree-Neiße'),('DE42A','Teltow-Fläming'),('DE5','Bremen'),('DE50','Bremen'),('DE501','Bremen, Kreisfreie Stadt'),('DE502','Bremerhaven, Kreisfreie Stadt'),('DE6','Hamburg'),('DE60','Hamburg'),('DE600','Hamburg'),('DE7','Hessen'),('DE71','Darmstadt'),('DE711','Darmstadt, Kreisfreie Stadt'),('DE712','Frankfurt am Main, Kreisfreie Stadt'),('DE713','Offenbach am Main, Kreisfreie Stadt'),('DE714','Wiesbaden, Kreisfreie Stadt'),('DE715','Bergstraße'),('DE716','Darmstadt-Dieburg'),('DE717','Groß-Gerau'),('DE718','Hochtaunuskreis'),('DE719','Main-Kinzig-Kreis'),('DE71A','Main-Taunus-Kreis'),('DE71B','Odenwaldkreis'),('DE71C','Offenbach, Landkreis'),('DE71D','Rheingau-Taunus-Kreis'),('DE71E','Wetteraukreis'),('DE72','Gießen'),('DE721','Gießen, Landkreis'),('DE722','Lahn-Dill-Kreis'),('DE723','Limburg-Weilburg'),('DE724','Marburg-Biedenkopf'),('DE725','Vogelsbergkreis'),('DE73','Kassel'),('DE731','Kassel, Kreisfreie Stadt'),('DE732','Fulda'),('DE733','Hersfeld-Rotenburg'),('DE734','Kassel, Landkreis'),('DE735','Schwalm-Eder-Kreis'),('DE736','Waldeck-Frankenberg'),('DE737','Werra-Meißner-Kreis'),('DE8','Mecklenburg-Vorpommern'),('DE80','Mecklenburg-Vorpommern'),('DE801','Greifswald, Kreisfreie Stadt'),('DE802','Neubrandenburg, Kreisfreie Stadt'),('DE803','Rostock, Kreisfreie Stadt'),('DE804','Schwerin, Kreisfreie Stadt'),('DE805','Stralsund, Kreisfreie Stadt'),('DE806','Wismar, Kreisfreie Stadt'),('DE807','Bad Doberan'),('DE808','Demmin'),('DE809','Güstrow'),('DE80A','Ludwigslust'),('DE80B','Mecklenburg-Strelitz'),('DE80C','Müritz'),('DE80D','Nordvorpommern'),('DE80E','Nordwestmecklenburg'),('DE80F','Ostvorpommern'),('DE80G','Parchim'),('DE80H','Rügen'),('DE80I','Uecker-Randow'),('DE9','Niedersachsen'),('DE91','Braunschweig'),('DE911','Braunschweig, Kreisfreie Stadt'),('DE912','Salzgitter, Kreisfreie Stadt'),('DE913','Wolfsburg, Kreisfreie Stadt'),('DE914','Gifhorn'),('DE915','Göttingen'),('DE916','Goslar'),('DE917','Helmstedt'),('DE918','Northeim'),('DE919','Osterode am Harz'),('DE91A','Peine'),('DE91B','Wolfenbüttel'),('DE92','Hannover'),('DE922','Diepholz'),('DE923','Hameln-Pyrmont'),('DE925','Hildesheim'),('DE926','Holzminden'),('DE927','Nienburg (Weser)'),('DE928','Schaumburg'),('DE929','Region Hannover'),('DE93','Lüneburg'),('DE931','Celle'),('DE932','Cuxhaven'),('DE933','Harburg'),('DE934','Lüchow-Dannenberg'),('DE935','Lüneburg, Landkreis'),('DE936','Osterholz'),('DE937','Rotenburg (Wümme)'),('DE938','Soltau-Fallingbostel'),('DE939','Stade'),('DE93A','Uelzen'),('DE93B','Verden'),('DE94','Weser-Ems'),('DE941','Delmenhorst, Kreisfreie Stadt'),('DE942','Emden, Kreisfreie Stadt'),('DE943','Oldenburg (Oldenburg), Kreisfreie Stadt'),('DE944','Osnabrück, Kreisfreie Stadt'),('DE945','Wilhelmshaven, Kreisfreie Stadt'),('DE946','Ammerland'),('DE947','Aurich'),('DE948','Cloppenburg'),('DE949','Emsland'),('DE94A','Friesland (D)'),('DE94B','Grafschaft Bentheim'),('DE94C','Leer'),('DE94D','Oldenburg, Landkreis'),('DE94E','Osnabrück, Landkreis'),('DE94F','Vechta'),('DE94G','Wesermarsch'),('DE94H','Wittmund'),('DEA','Nordrhein-Westfalen'),('DEA1','Düsseldorf'),('DEA11','Düsseldorf, Kreisfreie Stadt'),('DEA12','Duisburg, Kreisfreie Stadt'),('DEA13','Essen, Kreisfreie Stadt'),('DEA14','Krefeld, Kreisfreie Stadt'),('DEA15','Mönchengladbach, Kreisfreie Stadt'),('DEA16','Mülheim an der Ruhr, Kreisfreie Stadt'),('DEA17','Oberhausen, Kreisfreie Stadt'),('DEA18','Remscheid, Kreisfreie Stadt'),('DEA19','Solingen, Kreisfreie Stadt'),('DEA1A','Wuppertal, Kreisfreie Stadt'),('DEA1B','Kleve'),('DEA1C','Mettmann'),('DEA1D','Rhein-Kreis Neuss'),('DEA1E','Viersen'),('DEA1F','Wesel'),('DEA2','Köln'),('DEA21','Aachen, Kreisfreie Stadt'),('DEA22','Bonn, Kreisfreie Stadt'),('DEA23','Köln, Kreisfreie Stadt'),('DEA24','Leverkusen, Kreisfreie Stadt'),('DEA25','Aachen, Kreis'),('DEA26','Düren'),('DEA27','Rhein-Erft-Kreis'),('DEA28','Euskirchen'),('DEA29','Heinsberg'),('DEA2A','Oberbergischer Kreis'),('DEA2B','Rheinisch-Bergischer Kreis'),('DEA2C','Rhein-Sieg-Kreis'),('DEA3','Münster'),('DEA31','Bottrop, Kreisfreie Stadt'),('DEA32','Gelsenkirchen, Kreisfreie Stadt'),('DEA33','Münster, Kreisfreie Stadt'),('DEA34','Borken'),('DEA35','Coesfeld'),('DEA36','Recklinghausen'),('DEA37','Steinfurt'),('DEA38','Warendorf'),('DEA4','Detmold'),('DEA41','Bielefeld, Kreisfreie Stadt'),('DEA42','Gütersloh'),('DEA43','Herford'),('DEA44','Höxter'),('DEA45','Lippe'),('DEA46','Minden-Lübbecke'),('DEA47','Paderborn'),('DEA5','Arnsberg'),('DEA51','Bochum, Kreisfreie Stadt'),('DEA52','Dortmund, Kreisfreie Stadt'),('DEA53','Hagen, Kreisfreie Stadt'),('DEA54','Hamm, Kreisfreie Stadt'),('DEA55','Herne, Kreisfreie Stadt'),('DEA56','Ennepe-Ruhr-Kreis'),('DEA57','Hochsauerlandkreis'),('DEA58','Märkischer Kreis'),('DEA59','Olpe'),('DEA5A','Siegen-Wittgenstein'),('DEA5B','Soest'),('DEA5C','Unna'),('DEB','Rheinland-Pfalz'),('DEB1','Koblenz'),('DEB11','Koblenz, Kreisfreie Stadt'),('DEB12','Ahrweiler'),('DEB13','Altenkirchen (Westerwald)'),('DEB14','Bad Kreuznach'),('DEB15','Birkenfeld'),('DEB16','Cochem-Zell'),('DEB17','Mayen-Koblenz'),('DEB18','Neuwied'),('DEB19','Rhein-Hunsrück-Kreis'),('DEB1A','Rhein-Lahn-Kreis'),('DEB1B','Westerwaldkreis'),('DEB2','Trier'),('DEB21','Trier, Kreisfreie Stadt'),('DEB22','Bernkastel-Wittlich'),('DEB23','Bitburg-Prüm'),('DEB24','Daun'),('DEB25','Trier-Saarburg'),('DEB3','Rheinhessen-Pfalz'),('DEB31','Frankenthal (Pfalz), Kreisfreie Stadt'),('DEB32','Kaiserslautern, Kreisfreie Stadt'),('DEB33','Landau in der Pfalz, Kreisfreie Stadt'),('DEB34','Ludwigshafen am Rhein, Kreisfreie Stadt'),('DEB35','Mainz, Kreisfreie Stadt'),('DEB36','Neustadt an der Weinstraße, Kreisfreie Stadt'),('DEB37','Pirmasens, Kreisfreie Stadt'),('DEB38','Speyer, Kreisfreie Stadt'),('DEB39','Worms, Kreisfreie Stadt'),('DEB3A','Zweibrücken, Kreisfreie Stadt'),('DEB3B','Alzey-Worms'),('DEB3C','Bad Dürkheim'),('DEB3D','Donnersbergkreis'),('DEB3E','Germersheim'),('DEB3F','Kaiserslautern, Landkreis'),('DEB3G','Kusel'),('DEB3H','Südliche Weinstraße'),('DEB3I','Rhein-Pfalz-Kreis'),('DEB3J','Mainz-Bingen'),('DEB3K','Südwestpfalz'),('DEC','Saarland'),('DEC0','Saarland'),('DEC01','Stadtverband Saarbrücken'),('DEC02','Merzig-Wadern'),('DEC03','Neunkirchen'),('DEC04','Saarlouis'),('DEC05','Saarpfalz-Kreis'),('DEC06','St. Wendel'),('DED','Sachsen'),('DED1','Chemnitz'),('DED11','Chemnitz, Kreisfreie Stadt'),('DED12','Plauen, Kreisfreie Stadt'),('DED13','Zwickau, Kreisfreie Stadt'),('DED14','Annaberg'),('DED15','Chemnitzer Land'),('DED16','Freiberg'),('DED17','Vogtlandkreis'),('DED18','Mittlerer Erzgebirgskreis'),('DED19','Mittweida'),('DED1A','Stollberg'),('DED1B','Aue-Schwarzenberg'),('DED1C','Zwickauer Land'),('DED2','Dresden'),('DED21','Dresden, Kreisfreie Stadt'),('DED22','Görlitz, Kreisfreie Stadt'),('DED23','Hoyerswerda, Kreisfreie Stadt'),('DED24','Bautzen'),('DED25','Meißen'),('DED26','Niederschlesischer Oberlausitzkreis'),('DED27','Riesa-Großenhain'),('DED28','Löbau-Zittau'),('DED29','Sächsische Schweiz'),('DED2A','Weißeritzkreis'),('DED2B','Kamenz'),('DED3','Leipzig'),('DED31','Leipzig, Kreisfreie Stadt'),('DED32','Delitzsch'),('DED33','Döbeln'),('DED34','Leipziger Land'),('DED35','Muldentalkreis'),('DED36','Torgau-Oschatz'),('DEE','Sachsen-Anhalt'),('DEE0','Sachsen-Anhalt'),('DEE01','Dessau-Roßlau, Kreisfreie Stadt'),('DEE02','Halle (Saale), Kreisfreie Stadt'),('DEE03','Magdeburg, Kreisfreie Stadt'),('DEE04','Altmarkkreis Salzwedel'),('DEE05','Anhalt-Bitterfeld'),('DEE06','Jerichower Land'),('DEE07','Börde'),('DEE08','Burgenland (D)'),('DEE09','Harz'),('DEE0A','Mansfeld-Südharz'),('DEE0B','Saalekreis'),('DEE0C','Salzland'),('DEE0D','Stendal'),('DEE0E','Wittenberg'),('DEE1','Dessau'),('DEE11','Dessau, Krfr. St.'),('DEE12','Anhalt-Zerbst'),('DEE13','Bernburg'),('DEE14','Bitterfeld'),('DEE15','Köthen'),('DEE16','Wittenberg'),('DEE2','Halle'),('DEE21','Halle/Saale, Stadtkr.'),('DEE22','Burgenlandkreis'),('DEE23','Mansfelder Land'),('DEE24','Merseburg-Querfurt'),('DEE25','Saalkreis'),('DEE26','Sangerhausen'),('DEE27','Weissenfels'),('DEE3','Magdeburg'),('DEE31','Magdeburg, Krfr. St.'),('DEE32','Aschersleben-Stassfurt'),('DEE33','Boerdekreis'),('DEE34','Halberstadt'),('DEE35','Jerichower Land'),('DEE36','Ohrekreis'),('DEE37','Stendal'),('DEE38','Quedlinburg'),('DEE39','Schoenebeck'),('DEE3A','Wernigerode'),('DEE3B','Altmarkkreis Salzwedel'),('DEF','Schleswig-Holstein'),('DEF0','Schleswig-Holstein'),('DEF01','Flensburg, Kreisfreie Stadt'),('DEF02','Kiel, Kreisfreie Stadt'),('DEF03','Lübeck, Kreisfreie Stadt'),('DEF04','Neumünster, Kreisfreie Stadt'),('DEF05','Dithmarschen'),('DEF06','Herzogtum Lauenburg'),('DEF07','Nordfriesland'),('DEF08','Ostholstein'),('DEF09','Pinneberg'),('DEF0A','Plön'),('DEF0B','Rendsburg-Eckernförde'),('DEF0C','Schleswig-Flensburg'),('DEF0D','Segeberg'),('DEF0E','Steinburg'),('DEF0F','Stormarn'),('DEG','Thüringen'),('DEG0','Thüringen'),('DEG01','Erfurt, Kreisfreie Stadt'),('DEG02','Gera, Kreisfreie Stadt'),('DEG03','Jena, Kreisfreie Stadt'),('DEG04','Suhl, Kreisfreie Stadt'),('DEG05','Weimar, Kreisfreie Stadt'),('DEG06','Eichsfeld'),('DEG07','Nordhausen'),('DEG09','Unstrut-Hainich-Kreis'),('DEG0A','Kyffhäuserkreis'),('DEG0B','Schmalkalden-Meiningen'),('DEG0C','Gotha'),('DEG0D','Sömmerda'),('DEG0E','Hildburghausen'),('DEG0F','Ilm-Kreis'),('DEG0G','Weimarer Land'),('DEG0H','Sonneberg'),('DEG0I','Saalfeld-Rudolstadt'),('DEG0J','Saale-Holzland-Kreis'),('DEG0K','Saale-Orla-Kreis'),('DEG0L','Greiz'),('DEG0M','Altenburger Land'),('DEG0N','Eisenach, Kreisfreie Stadt'),('DEG0P','Wartburgkreis'),('DEZ','Extra-Regio'),('DEZZ','Extra-Regio'),('DEZZZ','Extra-Regio'),('DK','Dänemark'),('DK01','Hovedstaden'),('DK011','Byen København'),('DK012','Københavns omegn'),('DK013','Nordsjælland'),('DK014','Bornholm'),('DK02','Sjælland'),('DK021','Østsjælland'),('DK022','Vest- og Sydsjælland'),('DK03','Syddanmark'),('DK031','Fyn'),('DK032','Sydjylland'),('DK04','Midtjylland'),('DK041','Vestjylland'),('DK042','Østjylland'),('DK05','Nordjylland'),('DK050','Nordjylland'),('DKZ','Extra-Regio'),('DKZZ','Extra-Regio'),('DKZZZ','Extra-Regio'),('EE','Estland'),('EE0','Eesti'),('EE00','Eesti'),('EE001','Põhja-Eesti'),('EE004','Lääne-Eesti'),('EE006','Kesk-Eesti'),('EE007','Kirde-Eesti'),('EE008','Lõuna-Eesti'),('EEZ','Extra-Regio'),('EEZZ','Extra-Regio'),('EEZZZ','Extra-Regio'),('ES','Spanien'),('ES1','Noroeste'),('ES11','Galicia'),('ES111','A Coruña'),('ES112','Lugo'),('ES113','Ourense'),('ES114','Pontevedra'),('ES12','Principado de Asturias'),('ES120','Asturias'),('ES13','Cantabria'),('ES130','Cantabria'),('ES2','Noreste'),('ES21','País Vasco'),('ES211','Álava'),('ES212','Guipúzcoa'),('ES213','Vizcaya'),('ES22','Comunidad Foral de Navarra'),('ES220','Navarra'),('ES23','La Rioja'),('ES230','La Rioja'),('ES24','Aragón'),('ES241','Huesca'),('ES242','Teruel'),('ES243','Zaragoza'),('ES3','Comunidad de Madrid'),('ES30','Comunidad de Madrid'),('ES300','Madrid'),('ES4','Centro (e)'),('ES41','Castilla y León'),('ES411','Ávila'),('ES412','Burgos'),('ES413','León'),('ES414','Palencia'),('ES415','Salamanca'),('ES416','Segovia'),('ES417','Soria'),('ES418','Valladolid'),('ES419','Zamora'),('ES42','Castilla-La Mancha'),('ES421','Albacete'),('ES422','Ciudad Real'),('ES423','Cuenca'),('ES424','Guadalajara'),('ES425','Toledo'),('ES43','Extremadura'),('ES431','Badajoz'),('ES432','Cáceres'),('ES5','Este'),('ES51','Cataluña'),('ES511','Barcelona'),('ES512','Girona'),('ES513','Lleida'),('ES514','Tarragona'),('ES52','Comunidad Valenciana'),('ES521','Alicante/Alacant'),('ES522','Castellón/Castelló'),('ES523','Valencia/València'),('ES53','Illes Balears'),('ES531','Eivissa y Formentera'),('ES532','Mallorca'),('ES533','Menorca'),('ES6','Sur'),('ES61','Andalucía'),('ES611','Almería'),('ES612','Cádiz'),('ES613','Córdoba'),('ES614','Granada'),('ES615','Huelva'),('ES616','Jaén'),('ES617','Málaga'),('ES618','Sevilla'),('ES62','Región de Murcia'),('ES620','Murcia'),('ES63','Ciudad Autónoma de Ceuta'),('ES630','Ceuta'),('ES64','Ciudad Autónoma de Melilla'),('ES640','Melilla'),('ES7','Canarias'),('ES70','Canarias'),('ES703','El Hierro'),('ES704','Fuerteventura'),('ES705','Gran Canaria'),('ES706','La Gomera'),('ES707','La Palma'),('ES708','Lanzarote'),('ES709','Tenerife'),('ESZ','Extra-Regio'),('ESZZ','Extra-Regio'),('ESZZZ','Extra-Regio'),('FI','Finnland'),('FI1','Manner-Suomi'),('FI13','Itä-Suomi'),('FI131','Etelä-Savo'),('FI132','Pohjois-Savo'),('FI133','Pohjois-Karjala'),('FI134','Kainuu'),('FI18','Etelä-Suomi'),('FI181','Uusimaa'),('FI182','Itä-Uusimaa'),('FI183','Varsinais-Suomi'),('FI184','Kanta-Häme'),('FI185','Päijät-Häme'),('FI186','Kymenlaakso'),('FI187','Etelä-Karjala'),('FI19','Länsi-Suomi'),('FI193','Keski-Suomi'),('FI194','Etelä-Pohjanmaa'),('FI195','Pohjanmaa'),('FI196','Satakunta'),('FI197','Pirkanmaa'),('FI1A','Pohjois-Suomi'),('FI1A1','Keski-Pohjanmaa'),('FI1A2','Pohjois-Pohjanmaa'),('FI1A3','Lappi'),('FI2','Åland'),('FI20','Åland'),('FI200','Åland'),('FIZ','Extra-Regio'),('FIZZ','Extra-Regio'),('FIZZZ','Extra-Regio'),('FR','Frankreich'),('FR1','Île de France'),('FR10','Île de France'),('FR101','Paris'),('FR102','Seine-et-Marne'),('FR103','Yvelines'),('FR104','Essonne'),('FR105','Hauts-de-Seine'),('FR106','Seine-Saint-Denis'),('FR107','Val-de-Marne'),('FR108','Val-d\'Oise'),('FR2','Bassin Parisien'),('FR21','Champagne-Ardenne'),('FR211','Ardennes'),('FR212','Aube'),('FR213','Marne'),('FR214','Haute-Marne'),('FR22','Picardie'),('FR221','Aisne'),('FR222','Oise'),('FR223','Somme'),('FR23','Haute-Normandie'),('FR231','Eure'),('FR232','Seine-Maritime'),('FR24','Centre'),('FR241','Cher'),('FR242','Eure-et-Loir'),('FR243','Indre'),('FR244','Indre-et-Loire'),('FR245','Loir-et-Cher'),('FR246','Loiret'),('FR25','Basse-Normandie'),('FR251','Calvados'),('FR252','Manche'),('FR253','Orne'),('FR26','Bourgogne'),('FR261','Côte-d\'Or'),('FR262','Nièvre'),('FR263','Saône-et-Loire'),('FR264','Yonne'),('FR3','Nord — Pas-de-Calais'),('FR30','Nord — Pas-de-Calais'),('FR301','Nord'),('FR302','Pas-de-Calais'),('FR4','Est'),('FR41','Lorraine'),('FR411','Meurthe-et-Moselle'),('FR412','Meuse'),('FR413','Moselle'),('FR414','Vosges'),('FR42','Alsace'),('FR421','Bas-Rhin'),('FR422','Haut-Rhin'),('FR43','Franche-Comté'),('FR431','Doubs'),('FR432','Jura'),('FR433','Haute-Saône'),('FR434','Territoire de Belfort'),('FR5','Ouest'),('FR51','Pays de la Loire'),('FR511','Loire-Atlantique'),('FR512','Maine-et-Loire'),('FR513','Mayenne'),('FR514','Sarthe'),('FR515','Vendée'),('FR52','Bretagne'),('FR521','Côtes-d\'Armor'),('FR522','Finistère'),('FR523','Ille-et-Vilaine'),('FR524','Morbihan'),('FR53','Poitou-Charentes'),('FR531','Charente'),('FR532','Charente-Maritime'),('FR533','Deux-Sèvres'),('FR534','Vienne'),('FR6','Sud-Ouest'),('FR61','Aquitaine'),('FR611','Dordogne'),('FR612','Gironde'),('FR613','Landes'),('FR614','Lot-et-Garonne'),('FR615','Pyrénées-Atlantiques'),('FR62','Midi-Pyrénées'),('FR621','Ariège'),('FR622','Aveyron'),('FR623','Haute-Garonne'),('FR624','Gers'),('FR625','Lot'),('FR626','Hautes-Pyrénées'),('FR627','Tarn'),('FR628','Tarn-et-Garonne'),('FR63','Limousin'),('FR631','Corrèze'),('FR632','Creuse'),('FR633','Haute-Vienne'),('FR7','Centre-Est'),('FR71','Rhône-Alpes'),('FR711','Ain'),('FR712','Ardèche'),('FR713','Drôme'),('FR714','Isère'),('FR715','Loire'),('FR716','Rhône'),('FR717','Savoie'),('FR718','Haute-Savoie'),('FR72','Auvergne'),('FR721','Allier'),('FR722','Cantal'),('FR723','Haute-Loire'),('FR724','Puy-de-Dôme'),('FR8','Méditerranée'),('FR81','Languedoc-Roussillon'),('FR811','Aude'),('FR812','Gard'),('FR813','Hérault'),('FR814','Lozère'),('FR815','Pyrénées-Orientales'),('FR82','Provence-Alpes-Côte d\'Azur'),('FR821','Alpes-de-Haute-Provence'),('FR822','Hautes-Alpes'),('FR823','Alpes-Maritimes'),('FR824','Bouches-du-Rhône'),('FR825','Var'),('FR826','Vaucluse'),('FR83','Corse'),('FR831','Corse-du-Sud'),('FR832','Haute-Corse'),('FR9','Départements d\'outre-mer'),('FR91','Guadeloupe'),('FR910','Guadeloupe'),('FR92','Martinique'),('FR920','Martinique'),('FR93','Guyane'),('FR930','Guyane'),('FR94','Réunion'),('FR940','Réunion'),('FRZ','Extra-Regio'),('FRZZ','Extra-Regio'),('FRZZZ','Extra-Regio'),('GB','Großbritannien'),('GBC','North East (England)'),('GBC1','Tees Valley and Durham'),('GBC11','Hartlepool and Stockton-on-Tees'),('GBC12','South Teesside'),('GBC13','Darlington'),('GBC14','Durham CC'),('GBC2','Northumberland and Tyne and Wear'),('GBC21','Northumberland'),('GBC22','Tyneside'),('GBC23','Sunderland'),('GBD','North West (England)'),('GBD1','Cumbria'),('GBD11','West Cumbria'),('GBD12','East Cumbria'),('GBD2','Cheshire'),('GBD21','Halton and Warrington'),('GBD22','Cheshire CC'),('GBD3','Greater Manchester'),('GBD31','Greater Manchester South'),('GBD32','Greater Manchester North'),('GBD4','Lancashire'),('GBD41','Blackburn with Darwen'),('GBD42','Blackpool'),('GBD43','Lancashire CC'),('GBD5','Merseyside'),('GBD51','East Merseyside'),('GBD52','Liverpool'),('GBD53','Sefton'),('GBD54','Wirral'),('GBE','Yorkshire and the Humber'),('GBE1','East Yorkshire and Northern Lincolnshire'),('GBE11','Kingston upon Hull, City of'),('GBE12','East Riding of Yorkshire'),('GBE13','North and North East Lincolnshire'),('GBE2','North Yorkshire'),('GBE21','York'),('GBE22','North Yorkshire CC'),('GBE3','South Yorkshire'),('GBE31','Barnsley, Doncaster and Rotherham'),('GBE32','Sheffield'),('GBE4','West Yorkshire'),('GBE41','Bradford'),('GBE42','Leeds'),('GBE43','Calderdale, Kirklees and Wakefield'),('GBF','East Midlands (England)'),('GBF1','Derbyshire and Nottinghamshire'),('GBF11','Derby'),('GBF12','East Derbyshire'),('GBF13','South and West Derbyshire'),('GBF14','Nottingham'),('GBF15','North Nottinghamshire'),('GBF16','South Nottinghamshire'),('GBF2','Leicestershire, Rutland and Northamptonshire'),('GBF21','Leicester'),('GBF22','Leicestershire CC and Rutland'),('GBF23','Northamptonshire'),('GBF3','Lincolnshire'),('GBF30','Lincolnshire'),('GBG','West Midlands (England)'),('GBG1','Herefordshire, Worcestershire and Warwickshire'),('GBG11','Herefordshire, County of'),('GBG12','Worcestershire'),('GBG13','Warwickshire'),('GBG2','Shropshire and Staffordshire'),('GBG21','Telford and Wrekin'),('GBG22','Shropshire CC'),('GBG23','Stoke-on-Trent'),('GBG24','Staffordshire CC'),('GBG3','West Midlands'),('GBG31','Birmingham'),('GBG32','Solihull'),('GBG33','Coventry'),('GBG34','Dudley and Sandwell'),('GBG35','Walsall and Wolverhampton'),('GBH','East of England'),('GBH1','East Anglia'),('GBH11','Peterborough'),('GBH12','Cambridgeshire CC'),('GBH13','Norfolk'),('GBH14','Suffolk'),('GBH2','Bedfordshire and Hertfordshire'),('GBH21','Luton'),('GBH22','Bedfordshire CC'),('GBH23','Hertfordshire'),('GBH3','Essex'),('GBH31','Southend-on-Sea'),('GBH32','Thurrock'),('GBH33','Essex CC'),('GBI','London'),('GBI1','Inner London'),('GBI11','Inner London — West'),('GBI12','Inner London — East'),('GBI2','Outer London'),('GBI21','Outer London — East and North East'),('GBI22','Outer London — South'),('GBI23','Outer London — West and North West'),('GBJ','South East (England)'),('GBJ1','Berkshire, Buckinghamshire and Oxfordshire'),('GBJ11','Berkshire'),('GBJ12','Milton Keynes'),('GBJ13','Buckinghamshire CC'),('GBJ14','Oxfordshire'),('GBJ2','Surrey, East and West Sussex'),('GBJ21','Brighton and Hove'),('GBJ22','East Sussex CC'),('GBJ23','Surrey'),('GBJ24','West Sussex'),('GBJ3','Hampshire and Isle of Wight'),('GBJ31','Portsmouth'),('GBJ32','Southampton'),('GBJ33','Hampshire CC'),('GBJ34','Isle of Wight'),('GBJ4','Kent'),('GBJ41','Medway'),('GBJ42','Kent CC'),('GBK','South West (England)'),('GBK1','Gloucestershire, Wiltshire and Bristol/Bath area'),('GBK11','Bristol, City of'),('GBK12','Bath and North East Somerset, North Somerset and South Gloucestershire'),('GBK13','Gloucestershire'),('GBK14','Swindon'),('GBK15','Wiltshire CC'),('GBK2','Dorset and Somerset'),('GBK21','Bournemouth and Poole'),('GBK22','Dorset CC'),('GBK23','Somerset'),('GBK3','Cornwall and Isles of Scilly'),('GBK30','Cornwall and Isles of Scilly'),('GBK4','Devon'),('GBK41','Plymouth'),('GBK42','Torbay'),('GBK43','Devon CC'),('GBL','Wales'),('GBL1','West Wales and The Valleys'),('GBL11','Isle of Anglesey'),('GBL12','Gwynedd'),('GBL13','Conwy and Denbighshire'),('GBL14','South West Wales'),('GBL15','Central Valleys'),('GBL16','Gwent Valleys'),('GBL17','Bridgend and Neath Port Talbot'),('GBL18','Swansea'),('GBL2','East Wales'),('GBL21','Monmouthshire and Newport'),('GBL22','Cardiff and Vale of Glamorgan'),('GBL23','Flintshire and Wrexham'),('GBL24','Powys'),('GBM','Scotland'),('GBM2','Eastern Scotland'),('GBM21','Angus and Dundee City'),('GBM22','Clackmannanshire and Fife'),('GBM23','East Lothian and Midlothian'),('GBM24','Scottish Borders'),('GBM25','Edinburgh, City of'),('GBM26','Falkirk'),('GBM27','Perth & Kinross and Stirling'),('GBM28','West Lothian'),('GBM3','South Western Scotland'),('GBM31','East Dunbartonshire, West Dunbartonshire and Helensburgh & Lomond'),('GBM32','Dumfries & Galloway'),('GBM33','East Ayrshire and North Ayrshire mainland'),('GBM34','Glasgow City'),('GBM35','Inverclyde, East Renfrewshire and Renfrewshire'),('GBM36','North Lanarkshire'),('GBM37','South Ayrshire'),('GBM38','South Lanarkshire'),('GBM5','North Eastern Scotland'),('GBM50','Aberdeen City and Aberdeenshire'),('GBM6','Highlands and Islands'),('GBM61','Caithness & Sutherland and Ross & Cromarty'),('GBM62','Inverness & Nairn and Moray, Badenoch & Strathspey'),('GBM63','Lochaber, Skye & Lochalsh, Arran & Cumbrae and Argyll & Bute'),('GBM64','Eilean Siar (Western Isles)'),('GBM65','Orkney Islands'),('GBM66','Shetland Islands'),('GBN','Northern Ireland'),('GBN0','Northern Ireland'),('GBN01','Belfast'),('GBN02','Outer Belfast'),('GBN03','East of Northern Ireland'),('GBN04','North of Northern Ireland'),('GBN05','West and South of Northern Ireland'),('GBZ','Extra-Regio'),('GBZZ','Extra-Regio'),('GBZZZ','Extra-Regio'),('GR','Griechenland'),('GR1','Βόρεια Ελλάδα'),('GR11','Aνατολική Μακεδονία, Θράκη'),('GR111','Έβρος'),('GR112','Ξάνθη'),('GR113','Ροδόπη'),('GR114','Δράμα'),('GR115','Καβάλα'),('GR12','Κεντρική Μακεδονία'),('GR121','Ημαθία'),('GR122','Θεσσαλονίκη'),('GR123','Κιλκίς'),('GR124','Πέλλα'),('GR125','Πιερία'),('GR126','Σέρρες'),('GR127','Χαλκιδική'),('GR13','Δυτική Μακεδονία'),('GR131','Γρεβενά'),('GR132','Καστοριά'),('GR133','Κοζάνη'),('GR134','Φλώρινα'),('GR14','Θεσσαλία'),('GR141','Καρδίτσα'),('GR142','Λάρισα'),('GR143','Μαγνησία'),('GR144','Τρίκαλα'),('GR2','Κεντρική Ελλάδα'),('GR21','Ήπειρος'),('GR211','Άρτα'),('GR212','Θεσπρωτία'),('GR213','Ιωάννινα'),('GR214','Πρέβεζα'),('GR22','Ιόνια Νησιά'),('GR221','Ζάκυνθος'),('GR222','Κέρκυρα'),('GR223','Κεφαλληνία'),('GR224','Λευκάδα'),('GR23','Δυτική Ελλάδα'),('GR231','Αιτωλοακαρνανία'),('GR232','Αχαΐα'),('GR233','Ηλεία'),('GR24','Στερεά Ελλάδα'),('GR241','Βοιωτία'),('GR242','Εύβοια'),('GR243','Ευρυτανία'),('GR244','Φθιώτιδα'),('GR245','Φωκίδα'),('GR25','Πελοπόννησος'),('GR251','Αργολίδα'),('GR252','Αρκαδία'),('GR253','Κορινθία'),('GR254','Λακωνία'),('GR255','Μεσσηνία'),('GR3','Aττική'),('GR30','Aττική'),('GR300','Aττική'),('GR4','Νησιά Αιγαίου, Κρήτη'),('GR41','Βόρειο Αιγαίο'),('GR411','Λέσβος'),('GR412','Σάμος'),('GR413','Χίος'),('GR42','Νότιο Αιγαίο'),('GR421','Δωδεκάνησος'),('GR422','Κυκλάδες'),('GR43','Κρήτη'),('GR431','Ηράκλειο'),('GR432','Λασίθι'),('GR433','Ρεθύμνη'),('GR434','Χανιά'),('GRZ','Extra-Regio'),('GRZZ','Extra-Regio'),('GRZZZ','Extra-Regio'),('HR','Kroatien'),('HR0','Hrvatska'),('HR03','Jadranska Hrvatska'),('HR031','Primorsko-goranska županija'),('HR032','Ličko-senjska županija'),('HR033','Zadarska županija'),('HR034','Šibensko-kninska županija'),('HR035','Splitsko-dalmatinska županija'),('HR036','Istarska županija'),('HR037','Dubrovačko-neretvanska županija'),('HR04','Kontinentalna Hrvatska'),('HR041','Grad Zagreb'),('HR042','Zagrebačka županija'),('HR043','Krapinsko-zagorska županija'),('HR044','Varaždinska županija'),('HR045','Koprivničko-križevačka županija'),('HR046','Međimurska županija'),('HR047','Bjelovarsko-bilogorska županija'),('HR048','Virovitičko-podravska županija'),('HR049','Požeško-slavonska županija'),('HR04A','Brodsko-posavska županija'),('HR04B','Osječko-baranjska županija'),('HR04C','Vukovarsko-srijemska županija'),('HR04D','Karlovačka županija'),('HR04E','Sisačko-moslavačka županija'),('HRZ','Extra-Regio'),('HRZZ','Extra-Regio NUTS 2'),('HRZZZ','Extra-Regio'),('HU','Ungarn'),('HU1','Közép-Magyarország'),('HU10','Közép-Magyarország'),('HU101','Budapest'),('HU102','Pest'),('HU2','Dunántúl'),('HU21','Közép-Dunántúl'),('HU211','Fejér'),('HU212','Komárom-Esztergom'),('HU213','Veszprém'),('HU22','Nyugat-Dunántúl'),('HU221','Győr-Moson-Sopron'),('HU222','Vas'),('HU223','Zala'),('HU23','Dél-Dunántúl'),('HU231','Baranya'),('HU232','Somogy'),('HU233','Tolna'),('HU3','Alföld és Észak'),('HU31','Észak-Magyarország'),('HU311','Borsod-Abaúj-Zemplén'),('HU312','Heves'),('HU313','Nógrád'),('HU32','Észak-Alföld'),('HU321','Hajdú-Bihar'),('HU322','Jász-Nagykun-Szolnok'),('HU323','Szabolcs-Szatmár-Bereg'),('HU33','Dél-Alföld'),('HU331','Bács-Kiskun'),('HU332','Békés'),('HU333','Csongrád'),('HUZ','Extra-Regio'),('HUZZ','Extra-Regio'),('HUZZZ','Extra-Regio'),('IE','Irland'),('IE0','Ireland'),('IE01','Border, Midland and Western'),('IE011','Border'),('IE012','Midland'),('IE013','West'),('IE02','Southern and Eastern'),('IE021','Dublin'),('IE022','Mid-East'),('IE023','Mid-West'),('IE024','South-East (IRL)'),('IE025','South-West (IRL)'),('IEZ','Extra-Rregio'),('IEZZ','Extra-Regio'),('IEZZZ','Extra-Regio'),('IS','Island'),('IT','Italien'),('ITC','Nord-Ovest'),('ITC1','Piemonte'),('ITC11','Torino'),('ITC12','Vercelli'),('ITC13','Biella'),('ITC14','Verbano-Cusio-Ossola'),('ITC15','Novara'),('ITC16','Cuneo'),('ITC17','Asti'),('ITC18','Alessandria'),('ITC2','Valle d\'Aosta/Vallée d\'Aoste'),('ITC20','Valle d\'Aosta/Vallée d\'Aoste'),('ITC3','Liguria'),('ITC31','Imperia'),('ITC32','Savona'),('ITC33','Genova'),('ITC34','La Spezia'),('ITC4','Lombardia'),('ITC41','Varese'),('ITC42','Como'),('ITC43','Lecco'),('ITC44','Sondrio'),('ITC45','Milano'),('ITC46','Bergamo'),('ITC47','Brescia'),('ITC48','Pavia'),('ITC49','Lodi'),('ITC4A','Cremona'),('ITC4B','Mantova'),('ITD','Nord-Est'),('ITD1','Provincia Autonoma Bolzano/Bozen [3]'),('ITD10','Bolzano-Bozen'),('ITD2','Provincia Autonoma Trento'),('ITD20','Trento'),('ITD3','Veneto'),('ITD31','Verona'),('ITD32','Vicenza'),('ITD33','Belluno'),('ITD34','Treviso'),('ITD35','Venezia'),('ITD36','Padova'),('ITD37','Rovigo'),('ITD4','Friuli-Venezia Giulia'),('ITD41','Pordenone'),('ITD42','Udine'),('ITD43','Gorizia'),('ITD44','Trieste'),('ITD5','Emilia-Romagna'),('ITD51','Piacenza'),('ITD52','Parma'),('ITD53','Reggio nell\'Emilia'),('ITD54','Modena'),('ITD55','Bologna'),('ITD56','Ferrara'),('ITD57','Ravenna'),('ITD58','Forlì-Cesena'),('ITD59','Rimini'),('ITE','Centro (i)'),('ITE1','Toscana'),('ITE11','Massa-Carrara'),('ITE12','Lucca'),('ITE13','Pistoia'),('ITE14','Firenze'),('ITE15','Prato'),('ITE16','Livorno'),('ITE17','Pisa'),('ITE18','Arezzo'),('ITE19','Siena'),('ITE1A','Grosseto'),('ITE2','Umbria'),('ITE21','Perugia'),('ITE22','Terni'),('ITE3','Marche'),('ITE31','Pesaro e Urbino'),('ITE32','Ancona'),('ITE33','Macerata'),('ITE34','Ascoli Piceno'),('ITE4','Lazio'),('ITE41','Viterbo'),('ITE42','Rieti'),('ITE43','Roma'),('ITE44','Latina'),('ITE45','Frosinone'),('ITF','Sud'),('ITF1','Abruzzo'),('ITF11','L\'Aquila'),('ITF12','Teramo'),('ITF13','Pescara'),('ITF14','Chieti'),('ITF2','Molise'),('ITF21','Isernia'),('ITF22','Campobasso'),('ITF3','Campania'),('ITF31','Caserta'),('ITF32','Benevento'),('ITF33','Napoli'),('ITF34','Avellino'),('ITF35','Salerno'),('ITF4','Puglia'),('ITF41','Foggia'),('ITF42','Bari'),('ITF43','Taranto'),('ITF44','Brindisi'),('ITF45','Lecce'),('ITF5','Basilicata'),('ITF51','Potenza'),('ITF52','Matera'),('ITF6','Calabria'),('ITF61','Cosenza'),('ITF62','Crotone'),('ITF63','Catanzaro'),('ITF64','Vibo Valentia'),('ITF65','Reggio di Calabria'),('ITG','Isole'),('ITG1','Sicilia'),('ITG11','Trapani'),('ITG12','Palermo'),('ITG13','Messina'),('ITG14','Agrigento'),('ITG15','Caltanissetta'),('ITG16','Enna'),('ITG17','Catania'),('ITG18','Ragusa'),('ITG19','Siracusa'),('ITG2','Sardegna'),('ITG25','Sassari'),('ITG26','Nuoro'),('ITG27','Cagliari'),('ITG28','Oristano'),('ITG29','Olbia-Tempio'),('ITG2A','Ogliastra'),('ITG2B','Medio Campidano'),('ITG2C','Carbonia-Iglesias'),('ITZ','Extra-Regio'),('ITZZ','Extra-Regio'),('ITZZZ','Extra-Regio'),('LI','Liechtenstein'),('LT','Litauen'),('LT0','lietuva'),('LT00','Lietuva'),('LT001','Alytaus apskritis'),('LT002','Kauno apskritis'),('LT003','Klaipėdos apskritis'),('LT004','Marijampolės apskritis'),('LT005','Panevėžio apskritis'),('LT006','Šiaulių apskritis'),('LT007','Tauragės apskritis'),('LT008','Telšių apskritis'),('LT009','Utenos apskritis'),('LT00A','Vilniaus apskritis'),('LTZ','Extra-Regio'),('LTZZ','Extra-Regio'),('LTZZZ','Extra-Regio'),('LU','Luxemburg'),('LU0','Luxembourg (Grand-Duché)'),('LU00','Luxembourg (Grand-Duché)'),('LU000','Luxembourg (Grand-Duché)'),('LUZ','Extra-Regio'),('LUZZ','Extra-Regio'),('LUZZZ','Extra-Regio'),('LV','Lettland'),('LV0','latvija'),('LV00','Latvija'),('LV003','Kurzeme'),('LV005','Latgale'),('LV006','Rīga'),('LV007','Pierīga'),('LV008','Vidzeme'),('LV009','Zemgale'),('LVZ','Extra-Regio'),('LVZZ','Extra-Regio'),('LVZZZ','Extra-Regio'),('MT','Malta'),('MT0','Malta'),('MT00','Malta'),('MT001','Malta'),('MT002','Gozo and Comino/Għawdex u Kemmuna'),('MTZ','Extra-Regio'),('MTZZ','Extra-Regio'),('MTZZZ','Extra-Regio'),('NL','Niederlande'),('NL1','Noord-Nederland'),('NL11','Groningen'),('NL111','Oost-Groningen'),('NL112','Delfzijl en omgeving'),('NL113','Overig Groningen'),('NL12','Friesland (NL)'),('NL121','Noord-Friesland'),('NL122','Zuidwest-Friesland'),('NL123','Zuidoost-Friesland'),('NL13','Drenthe'),('NL131','Noord-Drenthe'),('NL132','Zuidoost-Drenthe'),('NL133','Zuidwest-Drenthe'),('NL2','Oost-Nederland'),('NL21','Overijssel'),('NL211','Noord-Overijssel'),('NL212','Zuidwest-Overijssel'),('NL213','Twente'),('NL22','Gelderland'),('NL221','Veluwe'),('NL224','Zuidwest-Gelderland'),('NL225','Achterhoek'),('NL226','Arnhem/Nijmegen'),('NL23','Flevoland'),('NL230','Flevoland'),('NL3','West-Nederland'),('NL31','Utrecht'),('NL310','Utrecht'),('NL32','Noord-Holland'),('NL321','Kop van Noord-Holland'),('NL322','Alkmaar en omgeving'),('NL323','IJmond'),('NL324','Agglomeratie Haarlem'),('NL325','Zaanstreek'),('NL326','Groot-Amsterdam'),('NL327','Het Gooi en Vechtstreek'),('NL33','Zuid-Holland'),('NL331','Agglomeratie Leiden en Bollenstreek'),('NL332','Agglomeratie \'s-Gravenhage'),('NL333','Delft en Westland'),('NL334','Oost-Zuid-Holland'),('NL335','Groot-Rijnmond'),('NL336','Zuidoost-Zuid-Holland'),('NL34','Zeeland'),('NL341','Zeeuwsch-Vlaanderen'),('NL342','Overig Zeeland'),('NL4','Zuid-Nederland'),('NL41','Noord-Brabant'),('NL411','West-Noord-Brabant'),('NL412','Midden-Noord-Brabant'),('NL413','Noordoost-Noord-Brabant'),('NL414','Zuidoost-Noord-Brabant'),('NL42','Limburg (NL)'),('NL421','Noord-Limburg'),('NL422','Midden-Limburg'),('NL423','Zuid-Limburg'),('NLZ','Extra-Regio'),('NLZZ','Extra-Regio'),('NLZZZ','Extra-Regio'),('NO','Norwegen'),('NO0','Kongeriket Norge'),('NO01','Oslo og Akershus'),('NO011','Oslo'),('NO012','Akershus'),('NO02','Hedmark og Oppland'),('NO021','Hedmark'),('NO022','Oppland'),('NO03','Sør-Østlandet'),('NO031','Østfold'),('NO032','Buskerud'),('NO033','Vestfold'),('NO034','Telemark'),('NO04','Agder og Rogaland'),('NO041','Aust-Agder'),('NO042','Vest-Agder'),('NO043','Rogaland'),('NO05','Vestlandet'),('NO051','Hordaland'),('NO052','Sogn og Fjordane'),('NO053','Møre og Romsdal'),('NO06','Trøndelag'),('NO061','Sør-Trøndelag'),('NO062','Nord-Trøndelag'),('NO07','Nord-Norge'),('NO071','Nordland'),('NO072','Troms'),('NO073','Finnmark'),('PL','Polen'),('PL1','Region Centralny'),('PL11','Łódzkie'),('PL113','Miasto Łódź'),('PL114','Łódzki'),('PL115','Piotrkowski'),('PL116','Sieradzki'),('PL117','Skierniewicki'),('PL12','Mazowieckie'),('PL121','Ciechanowsko-płocki'),('PL122','Ostrołęcko-siedlecki'),('PL127','Miasto Warszawa'),('PL128','Radomski'),('PL129','Warszawski-wschodni'),('PL12A','Warszawski-zachodni'),('PL2','Region Południowy'),('PL21','Małopolskie'),('PL213','Miasto Kraków'),('PL214','Krakowski'),('PL215','Nowosądecki'),('PL216','Oświęcimski'),('PL217','Tarnowski'),('PL22','Śląskie'),('PL224','Częstochowski'),('PL225','Bielski'),('PL227','Rybnicki'),('PL228','Bytomski'),('PL229','Gliwicki'),('PL22A','Katowicki'),('PL22B','Sosnowiecki'),('PL22C','Tyski'),('PL3','Region Wschodni'),('PL31','Lubelskie'),('PL311','Bialski'),('PL312','Chełmsko-zamojski'),('PL314','Lubelski'),('PL315','Puławski'),('PL32','Podkarpackie'),('PL323','Krośnieński'),('PL324','Przemyski'),('PL325','Rzeszowski'),('PL326','Tarnobrzeski'),('PL33','Świętokrzyskie'),('PL331','Kielecki'),('PL332','Sandomiersko-jędrzejowski'),('PL34','Podlaskie'),('PL343','Białostocki'),('PL344','Łomżyński'),('PL345','Suwalski'),('PL4','Region Północno-zachodni'),('PL41','Wielkopolskie'),('PL411','Pilski'),('PL414','Koniński'),('PL415','Miasto Poznań'),('PL416','Kaliski'),('PL417','Leszczyński'),('PL418','Poznański'),('PL42','Zachodniopomorskie'),('PL422','Koszaliński'),('PL423','Stargardzki'),('PL424','Miasto Szczecin'),('PL425','Szczeciński'),('PL43','Lubuskie'),('PL431','Gorzowski'),('PL432','Zielonogórski'),('PL5','Region Południowo-zachodni'),('PL51','Dolnośląskie'),('PL514','Miasto Wrocław'),('PL515','Jeleniogórski'),('PL516','Legnicko-głogowski'),('PL517','Wałbrzyski'),('PL518','Wrocławski'),('PL52','Opolskie'),('PL521','Nyski'),('PL522','Opolski'),('PL6','Region Północny'),('PL61','Kujawsko-pomorskie'),('PL613','Bydgosko-toruński'),('PL614','Grudziądzki'),('PL615','Włocławski'),('PL62','Warmińsko-mazurskie'),('PL621','Elbląski'),('PL622','Olsztyński'),('PL623','Ełcki'),('PL63','Pomorskie'),('PL631','Słupski'),('PL633','Trójmiejski'),('PL634','Gdański'),('PL635','Starogardzki'),('PLZ','Extra-Regio'),('PLZZ','Extra-Regio'),('PLZZZ','Extra-Regio'),('PT','Portugal'),('PT1','Continente'),('PT11','Norte'),('PT111','Minho-Lima'),('PT112','Cávado'),('PT113','Ave'),('PT114','Grande Porto'),('PT115','Tâmega'),('PT116','Entre Douro e Vouga'),('PT117','Douro'),('PT118','Alto Trás-os-Montes'),('PT15','Algarve'),('PT150','Algarve'),('PT16','Centro (P)'),('PT161','Baixo Vouga'),('PT162','Baixo Mondego'),('PT163','Pinhal Litoral'),('PT164','Pinhal Interior Norte'),('PT165','Dâo-Lafôes'),('PT166','Pinhal Interior Sul'),('PT167','Serra da Estrela'),('PT168','Beira Interior Norte'),('PT169','Beira Interior Sul'),('PT16A','Cova da Beira'),('PT16B','Oeste'),('PT16C','Médio Tejo'),('PT17','Lisboa'),('PT171','Grande Lisboa'),('PT172','Península de Setúbal'),('PT18','Alentejo'),('PT181','Alentejo Litoral'),('PT182','Alto Alentejo'),('PT183','Alentejo Central'),('PT184','Baixo Alentejo'),('PT185','Lezíria do Tejo'),('PT2','Região AAutónoma dos Açores'),('PT20','Região Autónoma dos Açores'),('PT200','Região Autónoma dos Açores'),('PT3','Região Autónoma da Madeira'),('PT30','Região Autónoma da Madeira'),('PT300','Região Autónoma da Madeira'),('PTZ','Extra-Regio'),('PTZZ','Extra-Regio'),('PTZZZ','Extra-Regio'),('RO','Rumänien'),('RO1','Macroregiunea Unu'),('RO11','Nord-Vest'),('RO111','Bihor'),('RO112','Bistriţa-Năsăud'),('RO113','Cluj'),('RO114','Maramureş'),('RO115','Satu Mare'),('RO116','Sălaj'),('RO12','Centru'),('RO121','Alba'),('RO122','Braşov'),('RO123','Covasna'),('RO124','Harghita'),('RO125','Mureş'),('RO126','Sibiu'),('RO2','Macroregiunea Doi'),('RO21','Nord-Est'),('RO211','Bacău'),('RO212','Botoşani'),('RO213','Iaşi'),('RO214','Neamţ'),('RO215','Suceava'),('RO216','Vaslui'),('RO22','Sud-Est'),('RO221','Brăila'),('RO222','Buzău'),('RO223','Constanţa'),('RO224','Galaţi'),('RO225','Tulcea'),('RO226','Vrancea'),('RO3','Macroregiunea Trei'),('RO31','Sud - Muntenia'),('RO311','Argeş'),('RO312','Călăraşi'),('RO313','Dâmboviţa'),('RO314','Giurgiu'),('RO315','Ialomiţa'),('RO316','Prahova'),('RO317','Teleorman'),('RO32','Bucureşti - Ilfov'),('RO321','Bucureşti'),('RO322','Ilfov'),('RO4','Macroregiunea Patru'),('RO41','Sud-Vest Oltenia'),('RO411','Dolj'),('RO412','Gorj'),('RO413','Mehedinţi'),('RO414','Olt'),('RO415','Vâlcea'),('RO42','Vest'),('RO421','Arad'),('RO422','Caraş-Severin'),('RO423','Hunedoara'),('RO424','Timiş'),('ROZ','Extra-Regio'),('ROZZ','Extra-Regio NUTS 2'),('ROZZZ','Extra-Regio'),('SE','Schweden'),('SE1','Östra Sverige'),('SE11','Stockholm'),('SE110','Stockholms län'),('SE12','Östra Mellansverige'),('SE121','Uppsala län'),('SE122','Södermanlands län'),('SE123','Östergötlands län'),('SE124','Örebro län'),('SE125','Västmanlands län'),('SE2','Södra Sverige'),('SE21','Småland med öarna'),('SE211','Jönköpings län'),('SE212','Kronobergs län'),('SE213','Kalmar län'),('SE214','Gotlands län'),('SE22','Sydsverige'),('SE221','Blekinge län'),('SE224','Skåne län'),('SE23','Västsverige'),('SE231','Hallands län'),('SE232','Västra Götalands län'),('SE3','Norra Sverige'),('SE31','Norra Mellansverige'),('SE311','Värmlands län'),('SE312','Dalarnas län'),('SE313','Gävleborgs län'),('SE32','Mellersta Norrland'),('SE321','Västernorrlands län'),('SE322','Jämtlands län'),('SE33','Övre Norrland'),('SE331','Västerbottens län'),('SE332','Norrbottens län'),('SEZ','Extra-Regio'),('SEZZ','Extra-Regio'),('SEZZZ','Extra-Regio'),('SI','Slowenien'),('SI0','Slovenija'),('SI01','Vzhodna Slovenija'),('SI011','Pomurska'),('SI012','Podravska'),('SI013','Koroška'),('SI014','Savinjska'),('SI015','Zasavska'),('SI016','Spodnjeposavska'),('SI017','Jugovzhodna Slovenija'),('SI018','Notranjsko-kraška'),('SI02','Zahodna Slovenija'),('SI021','Osrednjeslovenska'),('SI022','Gorenjska'),('SI023','Goriška'),('SI024','Obalno-kraška'),('SIZ','Extra-Regio'),('SIZZ','Extra-Regio'),('SIZZZ','Extra-Regio'),('SK','Slowakai'),('SK0','Slovenská republika'),('SK01','Bratislavský kraj'),('SK010','Bratislavský kraj'),('SK02','Západné Slovensko'),('SK021','Trnavský kraj'),('SK022','Trenčiansky kraj'),('SK023','Nitriansky kraj'),('SK03','Stredné Slovensko'),('SK031','Žilinský kraj'),('SK032','Banskobystrický kraj'),('SK04','Východné Slovensko'),('SK041','Prešovský kraj'),('SK042','Košický kraj'),('SKZ','Extra-Regio'),('SKZZ','Extra-Regio'),('SKZZZ','Extra-Regio'),('TE3','Ege'),('TR','Türkei'),('TR1','İstanbul'),('TR10','İstanbul'),('TR100','İstanbul'),('TR2','Batı Marmara'),('TR21','Tekirdağ'),('TR211','Tekirdağ'),('TR212','Edirne'),('TR213','Kırklareli'),('TR22','Balıkesir'),('TR221','Balıkesir'),('TR222','Canakkale'),('TR31','İzmir'),('TR310','İzmir'),('TR32','Aydın'),('TR321','Aydın'),('TR322','Denizli'),('TR323','Muğla'),('TR33','Manisa'),('TR331','Manisa'),('TR332','Afyon '),('TR333','Kütahya'),('TR334','Uşak'),('TR4','Doğu Marmara'),('TR41','Bursa'),('TR411','Bursa'),('TR412','Eskişehir'),('TR413','Bilecik'),('TR42','Kocaeli'),('TR421','Kocaeli'),('TR422','Sakarya'),('TR423','Düzce'),('TR424','Bolu'),('TR425','Yalova'),('TR5','Batı Anadolu'),('TR51','Ankara'),('TR510','Ankara'),('TR52','Konya'),('TR521','Konya'),('TR522','Karaman'),('TR6','Akdeniz'),('TR61','Antalya'),('TR611','Antalya'),('TR612','Isparta'),('TR613','Burdur'),('TR62','Adana'),('TR621','Adana'),('TR622','İcel'),('TR63','Hatay'),('TR631','Hatay'),('TR632','Kahramanmaraş'),('TR633','Osmaniye'),('TR7','Orta Anadolu'),('TR71','Kırıkkale'),('TR711','Kırıkkale'),('TR712','Aksaray'),('TR713','Niğde'),('TR714','Nevşehir'),('TR715','Kırşehir'),('TR72','Kayseri'),('TR721','Kayseri'),('TR722','Sivas'),('TR723','Yozgat'),('TR8','Batı Karadeniz'),('TR81','Zonguldak'),('TR811','Zonguldak'),('TR812','Karabük'),('TR813','Bartın'),('TR82','Kastamonu'),('TR821','Kastamonu'),('TR822','Çankırı'),('TR823','Sinop'),('TR83','Samsun'),('TR831','Samsun'),('TR832','Tokat'),('TR833','Çorum'),('TR834','Amasya'),('TR9','Doğu Karadeniz'),('TR90','Trabzon'),('TR901','Trabzon'),('TR902','Ordu'),('TR903','Giresun'),('TR904','Rize'),('TR905','Artvin'),('TR906','Gümüşhane'),('TRA','Kuzeydoğu Anadolu'),('TRA1','Erzurum'),('TRA11','Erzurum'),('TRA12','Erzincan'),('TRA13','Bayburt'),('TRA2','Ağrı'),('TRA21','Ağrı'),('TRA22','Kars'),('TRA23','Iğdır'),('TRA24','Ardahan'),('TRB','Ortadoğu Anadolu'),('TRB1','Malatya'),('TRB11','Malatya'),('TRB12','Elazığ'),('TRB13','Bingöl'),('TRB14','Tunceli'),('TRB2','Van'),('TRB21','Van'),('TRB22','Muş'),('TRB23','Bitlis'),('TRB24','Hakkari'),('TRC','Güneydoğu Anadolu'),('TRC1','Gaziantep'),('TRC11','Gaziantep'),('TRC12','Adıyaman'),('TRC13','Kilis'),('TRC2','Şanlıurfa'),('TRC21','Şanlıurfa'),('TRC22','Diyarbakır'),('TRC3','Mardin'),('TRC31','Mardin'),('TRC32','Batman'),('TRC33','Şırnak'),('TRC34','Siirt'),('TRZ','Extra-Regio');
/*!40000 ALTER TABLE `nuts_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuts_layer`
--

DROP TABLE IF EXISTS `nuts_layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuts_layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) NOT NULL,
  `code` varchar(5) NOT NULL,
  `shape` linestring NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `level` (`level`),
  SPATIAL KEY `shape` (`shape`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuts_layer`
--

LOCK TABLES `nuts_layer` WRITE;
/*!40000 ALTER TABLE `nuts_layer` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuts_layer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_types`
--

DROP TABLE IF EXISTS `object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_types`
--

LOCK TABLES `object_types` WRITE;
/*!40000 ALTER TABLE `object_types` DISABLE KEYS */;
INSERT INTO `object_types` (`id`, `name`) VALUES (1,'cache log'),(2,'cache'),(3,'cache description'),(4,'user'),(5,'Traveler'),(6,'Picture'),(7,'Removed Object'),(8,'waypoint'),(9,'cache list');
/*!40000 ALTER TABLE `object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` (`version`, `executed_at`, `execution_time`) VALUES ('OcMigrations\\Version20201014195236','2020-12-16 17:41:07',163);
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_authorizations`
--

DROP TABLE IF EXISTS `okapi_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_authorizations` (
  `consumer_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_access_token` datetime DEFAULT NULL,
  PRIMARY KEY (`consumer_key`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_authorizations`
--

LOCK TABLES `okapi_authorizations` WRITE;
/*!40000 ALTER TABLE `okapi_authorizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_authorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_cache`
--

DROP TABLE IF EXISTS `okapi_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_cache` (
  `key` varchar(64) NOT NULL,
  `score` float DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `value` mediumblob,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_cache`
--

LOCK TABLES `okapi_cache` WRITE;
/*!40000 ALTER TABLE `okapi_cache` DISABLE KEYS */;
INSERT INTO `okapi_cache` (`key`, `score`, `expires`, `value`) VALUES ('crontab_check_counter',NULL,'2020-12-17 17:40:08',_binary '˴2�\0'),('cron_schedule',NULL,'2021-01-15 17:41:07',_binary '���j�@�w���j�)Z(�@���e\\]\\w�u��^MRz�l	9*|���\ny��S~��\Z��Z�ź����������Bг���le&A�A\Zd[/-@��^i��ҁ�ެth���q����4�Ϲ_�G1�4�-(�EQt����Awx��|%��3�<M{#]+{�=Kw�(�i�u���q$@�%�/z`��T;��	���_4fm%V�մஏ,��K\\~�fM�Hh�����@OW\ZP��;y�E�l/��49)�e��');
/*!40000 ALTER TABLE `okapi_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_cache_reads`
--

DROP TABLE IF EXISTS `okapi_cache_reads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_cache_reads` (
  `cache_key` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_cache_reads`
--

LOCK TABLES `okapi_cache_reads` WRITE;
/*!40000 ALTER TABLE `okapi_cache_reads` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_cache_reads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_clog`
--

DROP TABLE IF EXISTS `okapi_clog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_clog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_clog`
--

LOCK TABLES `okapi_clog` WRITE;
/*!40000 ALTER TABLE `okapi_clog` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_clog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_consumers`
--

DROP TABLE IF EXISTS `okapi_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_consumers` (
  `key` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(100) NOT NULL,
  `secret` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `bflags` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_consumers`
--

LOCK TABLES `okapi_consumers` WRITE;
/*!40000 ALTER TABLE `okapi_consumers` DISABLE KEYS */;
INSERT INTO `okapi_consumers` (`key`, `name`, `secret`, `url`, `email`, `date_created`, `bflags`) VALUES ('yT2eV9xhwTuHKWVKxdWZ','unit-test','K2j5UREjth6Q2XUNWhWh2fRB4CbrGYggRrcB8GLr','','test@test.de','2017-07-14 20:00:40',0);
/*!40000 ALTER TABLE `okapi_consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_diagnostics`
--

DROP TABLE IF EXISTS `okapi_diagnostics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_diagnostics` (
  `recorded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` char(1) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `consumer_key` varchar(20) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  KEY `by_action` (`action`,`recorded_at`),
  KEY `by_expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_diagnostics`
--

LOCK TABLES `okapi_diagnostics` WRITE;
/*!40000 ALTER TABLE `okapi_diagnostics` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_diagnostics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_nonces`
--

DROP TABLE IF EXISTS `okapi_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_nonces` (
  `consumer_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nonce_hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `timestamp` int(10) NOT NULL,
  PRIMARY KEY (`consumer_key`,`nonce_hash`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_nonces`
--

LOCK TABLES `okapi_nonces` WRITE;
/*!40000 ALTER TABLE `okapi_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_search_results`
--

DROP TABLE IF EXISTS `okapi_search_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_search_results` (
  `set_id` mediumint(6) unsigned NOT NULL,
  `cache_id` mediumint(6) unsigned NOT NULL,
  PRIMARY KEY (`set_id`,`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_search_results`
--

LOCK TABLES `okapi_search_results` WRITE;
/*!40000 ALTER TABLE `okapi_search_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_search_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_search_sets`
--

DROP TABLE IF EXISTS `okapi_search_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_search_sets` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `params_hash` varchar(64) NOT NULL,
  `date_created` datetime NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `by_hash` (`params_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_search_sets`
--

LOCK TABLES `okapi_search_sets` WRITE;
/*!40000 ALTER TABLE `okapi_search_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_search_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_signals`
--

DROP TABLE IF EXISTS `okapi_signals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_signals` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL,
  `payload` blob NOT NULL,
  `created_at` datetime NOT NULL,
  `fetched_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_signals`
--

LOCK TABLES `okapi_signals` WRITE;
/*!40000 ALTER TABLE `okapi_signals` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_signals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_stats_hourly`
--

DROP TABLE IF EXISTS `okapi_stats_hourly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_stats_hourly` (
  `consumer_key` varchar(32) NOT NULL,
  `user_id` int(10) NOT NULL,
  `period_start` datetime NOT NULL,
  `service_name` varchar(80) NOT NULL,
  `total_calls` int(10) NOT NULL,
  `http_calls` int(10) NOT NULL,
  `total_runtime` float NOT NULL DEFAULT '0',
  `http_runtime` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`consumer_key`,`user_id`,`period_start`,`service_name`),
  KEY `by_service` (`service_name`,`period_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_stats_hourly`
--

LOCK TABLES `okapi_stats_hourly` WRITE;
/*!40000 ALTER TABLE `okapi_stats_hourly` DISABLE KEYS */;
INSERT INTO `okapi_stats_hourly` (`consumer_key`, `user_id`, `period_start`, `service_name`, `total_calls`, `http_calls`, `total_runtime`, `http_runtime`) VALUES ('internal',-1,'2016-08-23 12:00:00','services/caches/geocaches',786,0,68.7704,0);
/*!40000 ALTER TABLE `okapi_stats_hourly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_stats_monthly`
--

DROP TABLE IF EXISTS `okapi_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_stats_monthly` (
  `consumer_key` varchar(32) NOT NULL,
  `user_id` int(10) NOT NULL,
  `period_start` datetime NOT NULL,
  `service_name` varchar(80) NOT NULL,
  `total_calls` int(10) NOT NULL,
  `http_calls` int(10) NOT NULL,
  `total_runtime` float NOT NULL DEFAULT '0',
  `http_runtime` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`consumer_key`,`user_id`,`period_start`,`service_name`),
  KEY `by_service` (`service_name`,`period_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_stats_monthly`
--

LOCK TABLES `okapi_stats_monthly` WRITE;
/*!40000 ALTER TABLE `okapi_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_stats_temp`
--

DROP TABLE IF EXISTS `okapi_stats_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_stats_temp` (
  `datetime` datetime NOT NULL,
  `consumer_key` varchar(32) NOT NULL DEFAULT 'internal',
  `user_id` int(10) NOT NULL DEFAULT '-1',
  `service_name` varchar(80) NOT NULL,
  `calltype` enum('internal','http') NOT NULL,
  `runtime` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_stats_temp`
--

LOCK TABLES `okapi_stats_temp` WRITE;
/*!40000 ALTER TABLE `okapi_stats_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_stats_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_submitted_objects`
--

DROP TABLE IF EXISTS `okapi_submitted_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_submitted_objects` (
  `object_type` tinyint(2) NOT NULL,
  `object_id` int(11) NOT NULL,
  `consumer_key` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`object_type`,`object_id`),
  KEY `by_consumer` (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_submitted_objects`
--

LOCK TABLES `okapi_submitted_objects` WRITE;
/*!40000 ALTER TABLE `okapi_submitted_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_submitted_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_tile_caches`
--

DROP TABLE IF EXISTS `okapi_tile_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_tile_caches` (
  `z` tinyint(2) NOT NULL,
  `x` mediumint(6) unsigned NOT NULL,
  `y` mediumint(6) unsigned NOT NULL,
  `cache_id` mediumint(6) unsigned NOT NULL,
  `z21x` int(10) unsigned NOT NULL,
  `z21y` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `rating` tinyint(1) unsigned DEFAULT NULL,
  `flags` tinyint(1) unsigned NOT NULL,
  `name_crc` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`z`,`x`,`y`,`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_tile_caches`
--

LOCK TABLES `okapi_tile_caches` WRITE;
/*!40000 ALTER TABLE `okapi_tile_caches` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_tile_caches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_tile_status`
--

DROP TABLE IF EXISTS `okapi_tile_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_tile_status` (
  `z` tinyint(2) NOT NULL,
  `x` mediumint(6) unsigned NOT NULL,
  `y` mediumint(6) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`z`,`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_tile_status`
--

LOCK TABLES `okapi_tile_status` WRITE;
/*!40000 ALTER TABLE `okapi_tile_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_tile_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_tokens`
--

DROP TABLE IF EXISTS `okapi_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_tokens` (
  `key` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `secret` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `token_type` enum('request','access') NOT NULL,
  `timestamp` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `consumer_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `verifier` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `callback` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`key`),
  KEY `by_consumer` (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_tokens`
--

LOCK TABLES `okapi_tokens` WRITE;
/*!40000 ALTER TABLE `okapi_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `okapi_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `okapi_vars`
--

DROP TABLE IF EXISTS `okapi_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `okapi_vars` (
  `var` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` text,
  PRIMARY KEY (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `okapi_vars`
--

LOCK TABLES `okapi_vars` WRITE;
/*!40000 ALTER TABLE `okapi_vars` DISABLE KEYS */;
INSERT INTO `okapi_vars` (`var`, `value`) VALUES ('clog_followup_revision','3171822'),('clog_revision','3171822'),('cron_nearest_event','1608140407'),('db_version','127'),('last_clog_update','2016-08-21 21:49:02');
/*!40000 ALTER TABLE `okapi_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_social` longtext COLLATE utf8_unicode_ci,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `slug`, `meta_keywords`, `meta_description`, `meta_social`, `updated_at`, `active`) VALUES (1,'impressum','','','','2020-12-16 17:41:06',1),(2,'tos','','','','2020-12-16 17:41:06',1);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_block`
--

DROP TABLE IF EXISTS `page_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `locale` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `page_block_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_block`
--

LOCK TABLES `page_block` WRITE;
/*!40000 ALTER TABLE `page_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL COMMENT 'via Trigger (pictures)',
  `last_modified` datetime NOT NULL COMMENT 'via Trigger (pictures)',
  `url` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `last_url_check` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `thumb_url` varchar(255) NOT NULL,
  `thumb_last_generated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spoiler` tinyint(1) NOT NULL DEFAULT '0',
  `local` tinyint(1) NOT NULL DEFAULT '1',
  `unknown_format` tinyint(1) NOT NULL DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  `mappreview` tinyint(1) NOT NULL DEFAULT '0',
  `seq` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `object_type` (`object_type`,`object_id`,`seq`),
  KEY `last_modified` (`last_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` (`id`, `uuid`, `node`, `date_created`, `last_modified`, `url`, `title`, `last_url_check`, `object_id`, `object_type`, `thumb_url`, `thumb_last_generated`, `spoiler`, `local`, `unknown_format`, `display`, `mappreview`, `seq`) VALUES (1,'EF2CFA7A-3FDF-11EB-96DF-0242AC120002',5,'2020-12-17 14:30:56','2020-12-17 14:30:56','http://docker.team-opencaching.de/images/uploads/EF2CFA7A-3FDF-11EB-96DF-0242AC120002.jpg','nicht angucken.. Spoilerbild!','1970-01-01 01:00:00',6,2,'','1970-01-01 01:00:00',1,1,0,1,0,1),(2,'32BE89C5-3FE0-11EB-96DF-0242AC120002',5,'2020-12-17 14:32:49','2020-12-17 14:32:49','http://docker.team-opencaching.de/images/uploads/32BE89C5-3FE0-11EB-96DF-0242AC120002.png','Perspektive','1970-01-01 01:00:00',5,2,'','1970-01-01 01:00:00',0,1,0,1,1,1),(3,'157995B3-404C-11EB-96DF-0242AC120002',5,'2020-12-18 10:33:26','2020-12-18 10:33:26','http://docker.team-opencaching.de/images/uploads/157995B3-404C-11EB-96DF-0242AC120002.jpg','Spoiler','1970-01-01 01:00:00',19,2,'','1970-01-01 01:00:00',1,1,0,1,0,1);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `picturesBeforeInsert` BEFORE INSERT ON `pictures`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`last_modified`=NOW();
            IF NEW.`seq` <= 0 THEN
                
                SET NEW.`seq` =
                    IFNULL(
                        (SELECT MAX(`seq`)+1
                         FROM `pictures`
                         WHERE `object_type`=NEW.`object_type` AND `object_id`=NEW.`object_id`
                        ),
                        1
                    );
            END IF;
        END IF;
        IF ISNULL(NEW.`uuid`) OR NEW.`uuid`='' THEN
            SET NEW.`uuid`=CREATE_UUID();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `picturesAfterInsert` AFTER INSERT ON `pictures`
     FOR EACH ROW BEGIN
        IF
            @archive_picop
            AND (
                NEW.`object_type`=1   
                OR (
                    NEW.`object_type`=2
                    AND (SELECT `date_created` FROM `caches` WHERE `cache_id`=NEW.`object_id`) < LEFT(NOW(),10)
                    AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=NEW.`object_id`) != 5
                )
            )
        THEN
           INSERT IGNORE INTO `pictures_modified`
               (`id`, `date_modified`, `operation`, `object_type`, `object_id`, `title`, `original_id`, `restored_by`)
           VALUES (
               NEW.`id`, NOW(), 'I', NEW.`object_type`, NEW.`object_id`, NEW.`title`,
               IFNULL(@original_picid, 0), IFNULL(@restoredby, 0)
           );
        END IF;
        IF NEW.`object_type`=1 THEN
           CALL sp_update_cachelog_picturestat(NEW.`object_id`, FALSE);
           CALL sp_update_searchindex(
              6,
              (SELECT `cache_id` FROM `cache_logs` WHERE `id`=NEW.`object_id`)
           );
        ELSEIF NEW.`object_type`=2 THEN
           CALL sp_update_cache_picturestat(NEW.`object_id`, FALSE);
           CALL sp_update_cache_listingdate(NEW.`object_id`);
           CALL sp_update_searchindex(6, NEW.`object_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `picturesBeforeUpdate` BEFORE UPDATE ON `pictures`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            IF
                NEW.`id`!=OLD.`id`
                OR NEW.`uuid`!=BINARY OLD.`uuid`
                OR NEW.`node`!=OLD.`node`
                OR NEW.`date_created`!=OLD.`date_created`
                OR NEW.`url`!=BINARY OLD.`url`
                OR NEW.`title`!=BINARY OLD.`title`
                OR NEW.`object_id`!=OLD.`object_id`
                OR NEW.`object_type`!=OLD.`object_type`
                OR NEW.`spoiler`!=OLD.`spoiler`
                OR NEW.`local`!=OLD.`local`
                OR NEW.`unknown_format`!=OLD.`unknown_format`
                OR NEW.`display`!=OLD.`display`
                OR NEW.`mappreview`!=OLD.`mappreview`
                OR NEW.`seq`!=OLD.`seq`
            THEN
                
                SET NEW.`last_modified`=NOW();
            END IF;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `picturesAfterUpdate` AFTER UPDATE ON `pictures`
     FOR EACH ROW BEGIN
        IF OLD.`object_type`!=NEW.`object_type` OR OLD.`object_id`!=NEW.`object_id` THEN
            IF OLD.`object_type`=1 THEN
                CALL sp_update_cachelog_picturestat(OLD.`object_id`, TRUE);
            ELSEIF OLD.`object_type`=2 THEN
                CALL sp_update_cache_picturestat(OLD.`object_id`, TRUE);
                CALL sp_update_cache_listingdate(OLD.`object_id`);
            END IF;
            IF NEW.`object_type`=1 THEN
                CALL sp_update_cachelog_picturestat(NEW.`object_id`, FALSE);
            ELSEIF NEW.`object_type`=2 THEN
                CALL sp_update_cache_picturestat(NEW.`object_id`, FALSE);
                CALL sp_update_cache_listingdate(NEW.`object_id`);
            END IF;
        ELSE
            IF NEW.`last_modified` != OLD.`last_modified` THEN
                IF NEW.`object_type`=1 THEN
                    IF NOT IFNULL(@dont_update_logdate,FALSE) THEN
                        UPDATE `cache_logs` SET `log_last_modified`=NEW.`last_modified` WHERE `id`=NEW.`object_id`;
                    END IF;
                ELSE
                    CALL sp_update_cache_listingdate(NEW.`object_id`);
                END IF;
            END IF;
            
            IF
                NEW.`object_type`=1
                AND NOT IFNULL(@dont_update_logdate,FALSE)
                AND (NEW.`title`!=BINARY OLD.`title` OR NEW.`spoiler`!=OLD.`spoiler`)
            THEN
                UPDATE `cache_logs` SET `entry_last_modified`=NEW.`last_modified` WHERE `id`=NEW.`object_id`;
            END IF;
            IF
                @archive_picop
                AND (
                        (
                            NEW.`object_type`=2
                            AND OLD.`date_created` < LEFT(NOW(),10)
                            AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=OLD.`object_id`) != 5
                        )
                        OR NEW.`object_type`=1
                )
                AND (
                    NEW.`title` != OLD.`title`
                    OR NEW.`spoiler` != OLD.`spoiler`
                    OR NEW.`display` != OLD.`display`
                )
            THEN
                INSERT IGNORE INTO `pictures_modified`
                    (`id`, `date_modified`, `operation`, `date_created`, `url`, `title`,
                     `object_id`, `object_type`, `spoiler`, `unknown_format`,
                     `display`, `restored_by`)
                VALUES (
                    OLD.`id`, NOW(), 'U', OLD.`date_created`, OLD.`url`, OLD.`title`,
                    OLD.`object_id`, OLD.`object_type`, OLD.`spoiler`, OLD.`unknown_format`,
                    OLD.`display`, IFNULL(@restoredby,0)
                );
                
            END IF;
        END IF;

        IF NEW.`title`!=OLD.`title` THEN
            IF NEW.`object_type`=2 THEN
                CALL sp_update_searchindex(6, NEW.`object_id`);
            ELSEIF NEW.`object_type`=1 THEN
                CALL sp_update_searchindex(
                    6,
                    (SELECT `cache_id` FROM `cache_logs` WHERE `id`=NEW.`object_id`)
                );
            END IF;
            
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `picturesAfterDelete` AFTER DELETE ON `pictures`
     FOR EACH ROW BEGIN
        INSERT IGNORE INTO `removed_objects` (`localId`, `uuid`, `type`, `node`)
        VALUES (OLD.`id`, OLD.`uuid`, 6, OLD.`node`);

        IF
            @archive_picop AND
            (
                OLD.`object_type`=1
                    
                OR (
                    OLD.`object_type`=2
                    AND (SELECT `date_created` FROM `caches` WHERE `cache_id`=OLD.`object_id`) < LEFT(NOW(),10)
                    AND (SELECT `status` FROM `caches` WHERE `caches`.`cache_id`=OLD.`object_id`) != 5
                )
            )
        THEN
            INSERT IGNORE INTO `pictures_modified`
                (`id`, `date_modified`, `operation`, `date_created`, `url`, `title`,
                 `object_id`, `object_type`, `spoiler`, `unknown_format`,
                 `display`, `restored_by`)
            VALUES (
                OLD.`id`, NOW(), 'D', OLD.`date_created`, OLD.`url`, OLD.`title`,
                OLD.`object_id`, OLD.`object_type`, OLD.`spoiler`, OLD.`unknown_format`,
                OLD.`display`, IFNULL(@restoredby,0)
            );
            
        END IF;

        IF OLD.`object_type`=1 THEN
            CALL sp_update_cachelog_picturestat(OLD.`object_id`, TRUE);
            CALL sp_update_searchindex(
                6,
                (SELECT `cache_id` FROM `cache_logs` WHERE `id`=OLD.`object_id`)
            );
        ELSEIF OLD.`object_type`=2 THEN
            CALL sp_update_cache_picturestat(OLD.`object_id`, TRUE);
            CALL sp_update_cache_listingdate(OLD.`object_id`);
            CALL sp_update_searchindex(6, OLD.`object_id`);
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profile_options`
--

DROP TABLE IF EXISTS `profile_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `internal_use` tinyint(1) NOT NULL DEFAULT '1',
  `default_value` text,
  `check_regex` varchar(255) DEFAULT NULL,
  `option_order` int(11) NOT NULL DEFAULT '100',
  `option_input` varchar(20) NOT NULL DEFAULT 'text',
  `optionset` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_options`
--

LOCK TABLES `profile_options` WRITE;
/*!40000 ALTER TABLE `profile_options` DISABLE KEYS */;
INSERT INTO `profile_options` (`id`, `name`, `trans_id`, `internal_use`, `default_value`, `check_regex`, `option_order`, `option_input`, `optionset`) VALUES (1,'MiniMap-Zoom',748,1,'11','^[1-9][0-9]{0,1}$',0,'text',1),(2,'Location',747,0,'','^.*$',10,'text',1),(3,'Description',114,0,'',NULL,100,'textarea',3),(4,'Age',745,0,'','^[[0-9]+$',80,'text',1),(5,'Show statistics',744,1,'1','^[0-1]$',50,'checkbox',1),(6,'Menu option \'Map\' shows:',1867,1,'1','^[0-1]$',110,'select:0=small map,1',2),(7,'Show overview map:',1870,1,'0','^[0-1]$',120,'checkbox',2),(8,'Maximum caches on map<br />(%1-%2, 0=automatic):',1871,1,'0','^[0-9]{1,4}$',130,'text',2),(9,'Cache icons:',1872,1,'1','^[1-9]$',140,'select:1=classic OC,',2),(10,'Show %1preview pictures</a><br />(% of map area, 0=off):',1928,1,'7','^[0-5]?[0-9]$',150,'text',2),(11,'Show picture stats and gallery',1944,1,'1','^[0-1]$',60,'checkbox',1),(13,'Show OConly-81 stats',2135,1,'0','^[0-1]$',65,'checkbox',1),(14,'Auto-load log entries',2153,1,'1','^[0-1]$',15,'checkbox',1);
/*!40000 ALTER TABLE `profile_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_dict`
--

DROP TABLE IF EXISTS `pw_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_dict` (
  `pw` varchar(40) NOT NULL,
  UNIQUE KEY `pw` (`pw`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_dict`
--

LOCK TABLES `pw_dict` WRITE;
/*!40000 ALTER TABLE `pw_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `pw_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL,
  `options` blob NOT NULL,
  `last_queried` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28798957 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` (`id`, `user_id`, `name`, `options`, `last_queried`) VALUES (28798942,0,'',_binary 'a:30:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:7:\"byowner\";s:7:\"ownerid\";s:6:\"170294\";s:5:\"owner\";s:9:\"Zar Peter\";s:4:\"sort\";s:10:\"bydistance\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-17 22:06:02'),(28798943,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:10:\"bydistance\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 08:33:45'),(28798944,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:10:\"bydistance\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 08:49:21'),(28798945,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:6:\"byname\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:12:23'),(28798946,0,'',_binary 'a:30:{s:11:\"f_userowner\";i:0;s:11:\"f_userfound\";i:0;s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";i:0;s:10:\"f_inactive\";s:1:\"0\";s:9:\"f_ignored\";i:1;s:16:\"f_otherPlatforms\";i:0;s:10:\"f_geokrets\";i:0;s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:0:{}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:7:\"byowner\";s:7:\"ownerid\";s:6:\"170298\";s:5:\"owner\";s:0:\"\";s:4:\"sort\";s:9:\"bycreated\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:15:50'),(28798947,0,'',_binary 'a:30:{s:11:\"f_userowner\";i:0;s:11:\"f_userfound\";i:0;s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";i:0;s:10:\"f_inactive\";s:1:\"0\";s:9:\"f_ignored\";i:1;s:16:\"f_otherPlatforms\";i:0;s:10:\"f_geokrets\";i:0;s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:0:{}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:7:\"byowner\";s:7:\"ownerid\";s:6:\"170298\";s:5:\"owner\";s:0:\"\";s:4:\"sort\";s:9:\"bycreated\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:15:59'),(28798948,0,'',_binary 'a:31:{s:11:\"f_userowner\";i:0;s:11:\"f_userfound\";i:0;s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";i:0;s:10:\"f_inactive\";s:1:\"0\";s:9:\"f_ignored\";i:1;s:16:\"f_otherPlatforms\";i:0;s:10:\"f_geokrets\";i:0;s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:0:{}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:8:\"byfinder\";s:8:\"finderid\";s:6:\"170298\";s:6:\"finder\";s:0:\"\";s:7:\"logtype\";s:3:\"1,7\";s:4:\"sort\";s:6:\"byname\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:16:04'),(28798949,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:6:\"byname\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:22:41'),(28798950,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:6:\"byname\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:26:19'),(28798951,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:6:\"byname\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:26:47'),(28798952,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"0\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:0:{}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:6:\"byname\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:20:\"1;2;3;4;5;6;7;8;9;10\";s:9:\"cachesize\";s:15:\"1;2;3;4;5;6;7;8\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 11:27:18'),(28798953,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:10:\"bydistance\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 12:55:30'),(28798954,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"0\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:0:{}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:10:\"bydistance\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:20:\"1;2;3;4;5;6;7;8;9;10\";s:9:\"cachesize\";s:15:\"1;2;3;4;5;6;7;8\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 13:20:17'),(28798955,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"0\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:0:{}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:10:\"bydistance\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:20:\"1;2;3;4;5;6;7;8;9;10\";s:9:\"cachesize\";s:15:\"1;2;3;4;5;6;7;8\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 13:20:20'),(28798956,0,'',_binary 'a:28:{s:11:\"f_userowner\";s:1:\"0\";s:11:\"f_userfound\";s:1:\"0\";s:13:\"f_unpublished\";i:0;s:10:\"f_disabled\";s:1:\"0\";s:10:\"f_inactive\";s:1:\"1\";s:9:\"f_ignored\";s:1:\"1\";s:16:\"f_otherPlatforms\";s:1:\"0\";s:10:\"f_geokrets\";s:1:\"0\";s:6:\"expert\";s:1:\"0\";s:10:\"showresult\";s:1:\"1\";s:6:\"output\";s:4:\"HTML\";s:4:\"bbox\";b:0;s:13:\"cache_attribs\";a:0:{}s:17:\"cache_attribs_not\";a:1:{i:7;i:7;}s:4:\"unit\";s:2:\"km\";s:10:\"searchtype\";s:3:\"all\";s:4:\"sort\";s:10:\"bydistance\";s:7:\"country\";s:0:\"\";s:8:\"language\";s:0:\"\";s:4:\"adm2\";s:0:\"\";s:9:\"cachetype\";s:0:\"\";s:9:\"cachesize\";s:0:\"\";s:13:\"difficultymin\";i:0;s:13:\"difficultymax\";i:0;s:10:\"terrainmin\";i:0;s:10:\"terrainmax\";i:0;s:17:\"recommendationmin\";i:0;s:7:\"queryid\";i:0;}','2020-12-18 13:27:19');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_tops`
--

DROP TABLE IF EXISTS `rating_tops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_tops` (
  `cache_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cache_id`),
  KEY `rating` (`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_tops`
--

LOCK TABLES `rating_tops` WRITE;
/*!40000 ALTER TABLE `rating_tops` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_tops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `removed_objects`
--

DROP TABLE IF EXISTS `removed_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `removed_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `localID` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(36) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `removed_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'via Trigger (removed_objects)',
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UUID` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=63656 DEFAULT CHARSET=utf8mb4 COMMENT='via Trigger (caches, cache_logs, cache_dec, pictures, user)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `removed_objects`
--

LOCK TABLES `removed_objects` WRITE;
/*!40000 ALTER TABLE `removed_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `removed_objects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `removedObjectsBeforeInsert` BEFORE INSERT ON `removed_objects`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`removed_date`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `replication`
--

DROP TABLE IF EXISTS `replication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `last_run` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use` int(1) NOT NULL DEFAULT '0',
  `prio` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='obsolete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication`
--

LOCK TABLES `replication` WRITE;
/*!40000 ALTER TABLE `replication` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_notimported`
--

DROP TABLE IF EXISTS `replication_notimported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replication_notimported` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_uuid` varchar(36) NOT NULL,
  `object_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='obsolete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_notimported`
--

LOCK TABLES `replication_notimported` WRITE;
/*!40000 ALTER TABLE `replication_notimported` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_notimported` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_overwrite`
--

DROP TABLE IF EXISTS `replication_overwrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replication_overwrite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='obsolete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_overwrite`
--

LOCK TABLES `replication_overwrite` WRITE;
/*!40000 ALTER TABLE `replication_overwrite` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_overwrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_overwritetypes`
--

DROP TABLE IF EXISTS `replication_overwritetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replication_overwritetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(60) NOT NULL,
  `field` varchar(60) NOT NULL,
  `uuid_fieldname` varchar(36) NOT NULL,
  `backupfirst` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='obsolete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_overwritetypes`
--

LOCK TABLES `replication_overwritetypes` WRITE;
/*!40000 ALTER TABLE `replication_overwritetypes` DISABLE KEYS */;
INSERT INTO `replication_overwritetypes` (`id`, `table`, `field`, `uuid_fieldname`, `backupfirst`) VALUES (1,'user','password','uuid',0),(2,'user','email','uuid',0),(3,'user','is_active_flag','uuid',0),(4,'user','permanent_login_flag','uuid',0),(5,'user','admin','uuid',0);
/*!40000 ALTER TABLE `replication_overwritetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_texts`
--

DROP TABLE IF EXISTS `saved_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_texts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `object_type` tinyint(3) NOT NULL,
  `object_id` int(10) NOT NULL,
  `subtype` tinyint(2) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `object_id` (`object_type`,`object_id`,`subtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_texts`
--

LOCK TABLES `saved_texts` WRITE;
/*!40000 ALTER TABLE `saved_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_texts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `savedTextsBeforeInsert` BEFORE INSERT ON `saved_texts`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `search_doubles`
--

DROP TABLE IF EXISTS `search_doubles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_doubles` (
  `hash` int(10) unsigned NOT NULL,
  `word` varchar(30) NOT NULL,
  `simple` varchar(30) NOT NULL,
  PRIMARY KEY (`hash`,`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via cronjob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_doubles`
--

LOCK TABLES `search_doubles` WRITE;
/*!40000 ALTER TABLE `search_doubles` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_doubles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_ignore`
--

DROP TABLE IF EXISTS `search_ignore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_ignore` (
  `word` varchar(30) NOT NULL,
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_ignore`
--

LOCK TABLES `search_ignore` WRITE;
/*!40000 ALTER TABLE `search_ignore` DISABLE KEYS */;
INSERT INTO `search_ignore` (`word`) VALUES ('aber'),('als'),('also'),('and'),('are'),('auch'),('auf'),('aus'),('bei'),('beim'),('bin'),('bis'),('dann'),('das'),('dem'),('den'),('denn'),('der'),('des'),('die'),('diese'),('diesem'),('diesen'),('dieser'),('dieses'),('doch'),('dort'),('durch'),('ein'),('eine'),('einem'),('einen'),('einer'),('euch'),('for'),('fuer'),('für'),('geht'),('gibt'),('habe'),('haben'),('hat'),('hatte'),('hatten'),('hier'),('ich'),('ihr'),('ist'),('kann'),('koennen'),('können'),('konnten'),('mal'),('man'),('mein'),('mich'),('mir'),('mit'),('muß'),('muss'),('nach'),('nicht'),('noch'),('not'),('nun'),('nur'),('oder'),('sein'),('sich'),('sie'),('sind'),('that'),('the'),('there'),('this'),('über'),('und'),('uns'),('vom'),('von'),('vor'),('war'),('waren'),('was'),('wenn'),('werden'),('wie'),('will'),('wir'),('wird'),('with'),('wurde'),('yes'),('you'),('zum'),('zur');
/*!40000 ALTER TABLE `search_ignore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index` (
  `object_type` tinyint(3) unsigned NOT NULL,
  `cache_id` int(10) unsigned NOT NULL,
  `hash` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_type`,`cache_id`,`hash`),
  KEY `object_type` (`object_type`,`hash`,`cache_id`,`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via cronjob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_index`
--

LOCK TABLES `search_index` WRITE;
/*!40000 ALTER TABLE `search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_index_times`
--

DROP TABLE IF EXISTS `search_index_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index_times` (
  `object_type` tinyint(3) unsigned NOT NULL,
  `object_id` int(10) unsigned NOT NULL COMMENT 'cache ID',
  `last_refresh` datetime NOT NULL,
  PRIMARY KEY (`object_type`,`object_id`),
  KEY `last_refresh` (`last_refresh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='search_index entries that need an update';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_index_times`
--

LOCK TABLES `search_index_times` WRITE;
/*!40000 ALTER TABLE `search_index_times` DISABLE KEYS */;
INSERT INTO `search_index_times` (`object_type`, `object_id`, `last_refresh`) VALUES (2,1,'2020-12-17 13:38:05'),(3,1,'2020-12-17 13:39:00'),(2,3,'2020-12-17 13:45:50'),(3,3,'2020-12-17 13:45:50'),(3,4,'2020-12-17 14:18:27'),(3,5,'2020-12-17 14:23:31'),(2,5,'2020-12-17 14:24:01'),(2,6,'2020-12-17 14:27:51'),(3,6,'2020-12-17 14:27:51'),(6,6,'2020-12-17 14:30:56'),(6,5,'2020-12-17 14:32:49'),(2,7,'2020-12-18 08:23:47'),(3,7,'2020-12-18 08:23:47'),(2,8,'2020-12-18 08:27:46'),(3,8,'2020-12-18 08:27:46'),(2,9,'2020-12-18 08:32:21'),(3,9,'2020-12-18 08:40:11'),(1,9,'2020-12-18 08:57:37'),(2,10,'2020-12-18 09:07:26'),(3,10,'2020-12-18 09:10:23'),(2,11,'2020-12-18 09:16:33'),(3,11,'2020-12-18 09:16:33'),(2,12,'2020-12-18 09:22:55'),(3,12,'2020-12-18 09:22:55'),(2,13,'2020-12-18 09:29:03'),(3,13,'2020-12-18 09:29:04'),(2,14,'2020-12-18 09:45:23'),(3,14,'2020-12-18 09:45:23'),(1,15,'2020-12-18 10:01:41'),(3,15,'2020-12-18 10:04:06'),(2,15,'2020-12-18 10:05:24'),(2,16,'2020-12-18 10:13:03'),(3,16,'2020-12-18 10:13:03'),(2,17,'2020-12-18 10:16:42'),(3,17,'2020-12-18 10:16:42'),(2,18,'2020-12-18 10:23:18'),(3,18,'2020-12-18 10:24:30'),(2,19,'2020-12-18 10:30:33'),(3,19,'2020-12-18 10:30:33'),(6,19,'2020-12-18 10:33:26'),(2,20,'2020-12-18 10:39:54'),(3,20,'2020-12-18 10:39:54'),(2,21,'2020-12-18 10:44:51'),(3,21,'2020-12-18 10:44:51'),(1,10,'2020-12-18 10:45:18'),(2,22,'2020-12-18 11:11:15'),(3,22,'2020-12-18 11:11:15'),(1,22,'2020-12-18 11:15:32'),(2,23,'2020-12-18 11:22:26'),(3,23,'2020-12-18 11:22:27'),(1,3,'2020-12-18 11:23:18'),(2,4,'2020-12-18 13:29:20');
/*!40000 ALTER TABLE `search_index_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_role_hierarchy`
--

DROP TABLE IF EXISTS `security_role_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_role_hierarchy` (
  `role_id` int(11) NOT NULL,
  `sub_role_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`sub_role_id`),
  UNIQUE KEY `security_role_hierarchy_pk_2` (`role_id`,`sub_role_id`),
  KEY `security_role_hierarchy_security_roles_id_fk_2` (`sub_role_id`),
  CONSTRAINT `security_role_hierarchy_security_roles_id_fk` FOREIGN KEY (`role_id`) REFERENCES `security_roles` (`id`),
  CONSTRAINT `security_role_hierarchy_security_roles_id_fk_2` FOREIGN KEY (`sub_role_id`) REFERENCES `security_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_role_hierarchy`
--

LOCK TABLES `security_role_hierarchy` WRITE;
/*!40000 ALTER TABLE `security_role_hierarchy` DISABLE KEYS */;
INSERT INTO `security_role_hierarchy` (`role_id`, `sub_role_id`) VALUES (2,1),(3,2),(4,2),(5,3),(5,4),(6,2),(8,2),(10,8),(10,9),(11,5),(11,7),(11,10),(12,11);
/*!40000 ALTER TABLE `security_role_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_roles`
--

DROP TABLE IF EXISTS `security_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `security_roles_role_uindex` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_roles`
--

LOCK TABLES `security_roles` WRITE;
/*!40000 ALTER TABLE `security_roles` DISABLE KEYS */;
INSERT INTO `security_roles` (`id`, `role`) VALUES (11,'ROLE_ADMIN'),(9,'ROLE_DEVELOPER_CONTRIBUTE'),(8,'ROLE_DEVELOPER_CORE'),(10,'ROLE_DEVELOPER_HEAD'),(6,'ROLE_SOCIAL'),(7,'ROLE_SOCIAL_HEAD'),(12,'ROLE_SUPER_ADMIN'),(3,'ROLE_SUPPORT_CLEAN'),(5,'ROLE_SUPPORT_HEAD'),(4,'ROLE_SUPPORT_MAINTAIN'),(2,'ROLE_TEAM'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `security_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_cache_lists`
--

DROP TABLE IF EXISTS `stat_cache_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_cache_lists` (
  `cache_list_id` int(10) NOT NULL,
  `entries` int(6) NOT NULL DEFAULT '0' COMMENT 'via trigger in cache_list_items',
  `watchers` int(6) NOT NULL DEFAULT '0' COMMENT 'via trigger in cache_list_watches',
  PRIMARY KEY (`cache_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_cache_lists`
--

LOCK TABLES `stat_cache_lists` WRITE;
/*!40000 ALTER TABLE `stat_cache_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_cache_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_cache_logs`
--

DROP TABLE IF EXISTS `stat_cache_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_cache_logs` (
  `cache_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `found` smallint(5) unsigned NOT NULL,
  `notfound` smallint(5) unsigned NOT NULL,
  `note` smallint(5) unsigned NOT NULL,
  `will_attend` smallint(5) unsigned NOT NULL,
  `maintenance` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`cache_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via trigger (cache_logs)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_cache_logs`
--

LOCK TABLES `stat_cache_logs` WRITE;
/*!40000 ALTER TABLE `stat_cache_logs` DISABLE KEYS */;
INSERT INTO `stat_cache_logs` (`cache_id`, `user_id`, `found`, `notfound`, `note`, `will_attend`, `maintenance`) VALUES (3,170293,1,0,0,0,0),(3,170298,1,0,0,0,0),(3,170299,1,0,0,0,0),(9,170290,0,0,0,0,2),(9,170291,0,0,1,0,0),(10,170292,0,0,0,1,0),(15,170294,1,0,0,0,0),(22,107469,0,0,0,0,1);
/*!40000 ALTER TABLE `stat_cache_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_caches`
--

DROP TABLE IF EXISTS `stat_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_caches` (
  `cache_id` int(10) unsigned NOT NULL,
  `found` smallint(5) unsigned NOT NULL,
  `notfound` smallint(5) unsigned NOT NULL,
  `note` smallint(5) unsigned NOT NULL,
  `will_attend` smallint(5) unsigned NOT NULL,
  `maintenance` smallint(5) unsigned NOT NULL,
  `last_found` date DEFAULT NULL,
  `watch` smallint(5) unsigned NOT NULL,
  `ignore` smallint(5) unsigned NOT NULL,
  `toprating` smallint(5) unsigned NOT NULL,
  `picture` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via trigger (caches)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_caches`
--

LOCK TABLES `stat_caches` WRITE;
/*!40000 ALTER TABLE `stat_caches` DISABLE KEYS */;
INSERT INTO `stat_caches` (`cache_id`, `found`, `notfound`, `note`, `will_attend`, `maintenance`, `last_found`, `watch`, `ignore`, `toprating`, `picture`) VALUES (3,3,0,0,0,0,'2020-12-18',1,0,0,0),(5,0,0,0,0,0,NULL,0,0,0,1),(6,0,0,0,0,0,NULL,0,0,0,1),(9,0,0,1,0,2,NULL,1,0,0,0),(10,0,0,0,1,0,NULL,0,0,0,0),(15,1,0,0,0,0,'2020-12-18',0,0,0,0),(19,0,0,0,0,0,NULL,0,0,0,1),(22,0,0,0,0,1,NULL,0,0,0,0);
/*!40000 ALTER TABLE `stat_caches` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `statCachesAfterInsert` AFTER INSERT ON `stat_caches`
     FOR EACH ROW BEGIN
        
        UPDATE caches SET meta_last_modified=NOW() WHERE caches.cache_id=NEW.cache_id;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `statCachesAfterUpdate` AFTER UPDATE ON `stat_caches`
     FOR EACH ROW BEGIN
        IF
            NEW.found<>OLD.found
            OR NEW.notfound<>OLD.notfound
            OR NEW.note<>OLD.note
            OR NEW.will_attend<>OLD.will_attend
            OR NEW.last_found<>OLD.last_found
            OR NEW.watch<>OLD.watch
            OR NEW.ignore<>OLD.ignore
            OR NEW.toprating<>OLD.toprating
        THEN
            
            UPDATE caches SET meta_last_modified=NOW() WHERE caches.cache_id=NEW.cache_id;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stat_user`
--

DROP TABLE IF EXISTS `stat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_user` (
  `user_id` int(10) unsigned NOT NULL,
  `found` smallint(5) unsigned NOT NULL,
  `notfound` smallint(5) unsigned NOT NULL,
  `note` smallint(5) unsigned NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL,
  `will_attend` smallint(5) unsigned NOT NULL,
  `maintenance` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via trigger (user)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_user`
--

LOCK TABLES `stat_user` WRITE;
/*!40000 ALTER TABLE `stat_user` DISABLE KEYS */;
INSERT INTO `stat_user` (`user_id`, `found`, `notfound`, `note`, `hidden`, `will_attend`, `maintenance`) VALUES (107469,11,0,4,8,0,4),(144875,0,0,0,0,0,0),(170289,0,0,0,3,0,0),(170290,0,0,0,3,0,2),(170291,0,0,1,2,0,0),(170292,0,0,0,2,1,0),(170293,1,0,0,2,0,0),(170294,1,0,0,2,0,0),(170295,0,0,0,2,0,0),(170296,0,0,0,2,0,0),(170298,1,0,0,1,0,0),(170299,1,0,0,1,0,0);
/*!40000 ALTER TABLE `stat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statpics`
--

DROP TABLE IF EXISTS `statpics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statpics` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tplpath` varchar(200) NOT NULL,
  `previewpath` varchar(200) NOT NULL,
  `description` varchar(80) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `maxtextwidth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statpics`
--

LOCK TABLES `statpics` WRITE;
/*!40000 ALTER TABLE `statpics` DISABLE KEYS */;
INSERT INTO `statpics` (`id`, `tplpath`, `previewpath`, `description`, `trans_id`, `maxtextwidth`) VALUES (1,'images/ocstats1.gif','images/ocstats1_prev.jpg','Default logo',1745,60),(2,'images/ocstats2.gif','images/ocstats2_prev.jpg','Alternative logo',1752,50),(3,'images/ocstats3.gif','images/ocstats3_prev.jpg','Alternative logo by nybbler',1747,50),(4,'images/ocstats4.gif','images/ocstats4_prev.jpg','Slimline',1753,50),(5,'images/ocstats5.gif','images/ocstats5_prev.jpg','Red logo, slimline',1754,50),(6,'images/ocstats4.gif','images/ocstats4a_prev.jpg','Slimline, without statistics',1755,50),(7,'images/ocstats5.gif','images/ocstats5a_prev.jpg','Slimline red, without statistics',1756,50),(8,'images/ocstats6.gif','images/ocstats6_prev.jpg','Round corners',1757,50),(9,'images/ocstats7.gif','images/ocstats7_prev.jpg','OC.de new',1821,60),(10,'images/ocstats8.gif','images/ocstats8_prev.jpg','OC.de new, slimline',1822,50),(11,'images/ocstats8.gif','images/ocstats8a_prev.jpg','OC.de new, without statistics',1823,50);
/*!40000 ALTER TABLE `statpics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_cron`
--

DROP TABLE IF EXISTS `sys_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_cron` (
  `name` varchar(60) NOT NULL,
  `last_run` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `last_run` (`last_run`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='via cronjob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_cron`
--

LOCK TABLES `sys_cron` WRITE;
/*!40000 ALTER TABLE `sys_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logins`
--

DROP TABLE IF EXISTS `sys_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL COMMENT 'via trigger (sys_logins)',
  `remote_addr` varchar(15) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`date_created`),
  KEY `remote_addr` (`remote_addr`)
) ENGINE=InnoDB AUTO_INCREMENT=1021959 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logins`
--

LOCK TABLES `sys_logins` WRITE;
/*!40000 ALTER TABLE `sys_logins` DISABLE KEYS */;
INSERT INTO `sys_logins` (`id`, `date_created`, `remote_addr`, `success`) VALUES (1021958,'2020-12-18 13:27:38','172.18.0.1',1);
/*!40000 ALTER TABLE `sys_logins` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sysLoginsBeforeInsert` BEFORE INSERT ON `sys_logins`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_string` varchar(80) NOT NULL,
  `title` varchar(80) NOT NULL,
  `title_trans_id` int(10) unsigned NOT NULL,
  `menustring` varchar(80) NOT NULL,
  `menustring_trans_id` int(10) unsigned NOT NULL,
  `access` tinyint(3) unsigned NOT NULL,
  `href` varchar(80) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `parent` smallint(6) NOT NULL,
  `position` tinyint(3) unsigned NOT NULL,
  `color` varchar(7) NOT NULL,
  `sitemap` tinyint(1) NOT NULL,
  `only_if_parent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_string` (`id_string`),
  KEY `parent` (`parent`,`position`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `id_string`, `title`, `title_trans_id`, `menustring`, `menustring_trans_id`, `access`, `href`, `visible`, `parent`, `position`, `color`, `sitemap`, `only_if_parent`) VALUES (1,'MNU_START','',0,'Start',80,0,'index.php',1,0,1,'#D5D9FF',1,NULL),(2,'MNU_START_ABOUTGC','About Geocaching',123,'About Geocaching',123,0,'articles.php?page=geocaching',1,1,10,'',1,NULL),(3,'MNU_START_REGISTER','Register',18,'Register',18,0,'register.php',2,1,12,'',1,NULL),(4,'MNU_START_NEWS','News',70,'News',70,0,'news.php',0,1,1,'',1,NULL),(5,'MNU_START_NEWCACHES','New caches',122,'New caches',122,0,'newcaches.php',1,1,2,'',1,NULL),(7,'MNU_START_NEWLOGS','New logs',120,'New logs',120,0,'newlogs.php',1,1,3,'',1,NULL),(8,'MNU_START_IMPRINT','Imprint',15,'Imprint',15,0,'articles.php?page=impressum',1,1,17,'',1,NULL),(9,'MNU_MYPROFILE','My profile',119,'My profile',119,0,'myhome.php',1,0,2,'#E8DDE4',1,NULL),(10,'MNU_CACHES','Caches',118,'Caches',118,0,'search.php',1,0,3,'#FFFFC5',1,NULL),(12,'MNU_ADMIN','Admin',116,'Admin',116,1,'translate.php',1,0,7,'#E8DDE4',0,NULL),(20,'MNU_CACHES_SEARCH','Search',125,'Search',125,0,'search.php',1,10,1,'',1,NULL),(21,'MNU_CACHES_HIDE','Create a cache',115,'Create a cache',115,0,'newcache.php',1,10,2,'',1,NULL),(22,'MNU_CACHES_HIDE_DESCRIPTION','Description',114,'Description',114,0,'articles.php?page=cacheinfo',1,21,1,'',1,NULL),(23,'MNU_CACHES_HIDE_HTMLTAGS','HTML Tags',113,'HTML Tags',113,0,'articles.php?page=htmltags',1,21,3,'',1,NULL),(24,'MNU_ADMIN_MENU_NEWITEM','New Item',124,'New Item',124,0,'newitem.php',0,13,1,'',0,NULL),(25,'MNU_CACHES_TOPS','Special caches',52,'Special caches',52,0,'tops.php',1,10,4,'',1,NULL),(27,'MNU_START_CONTACT','Contact',16,'Contact',16,0,'articles.php?page=contact',0,1,20,'',1,NULL),(28,'MNU_START_PRIVACY','Privacy statement',14,'Privacy statement',14,0,'articles.php?page=dsb',0,1,21,'',1,NULL),(29,'MNU_START_REGISTER_ACTIVATION','Activation',127,'Activation',127,0,'activation.php',0,3,1,'',1,NULL),(30,'MNU_CACHES_USERPROFILE','Userprofile',128,'Userprofile',128,0,'viewprofile.php',0,10,4,'',0,NULL),(32,'MNU_LOGIN','Login',207,'Login',207,0,'login.php',0,0,8,'#D5D9FF',1,NULL),(33,'MNU_CACHES_USERTOPS','Show recommendations',248,'Show recommendations',248,0,'usertops.php',0,10,5,'',0,NULL),(34,'MNU_ERROR','Error message',133,'Error message',133,0,'',0,0,9,'#D5D9FF',0,NULL),(35,'MNU_ADMIN_TRANSLATE','Translation',126,'Translation',126,1,'translate.php',1,12,1,'',0,NULL),(36,'MNU_MYPROFILE_OVERVIEW','My profile',119,'Overview',483,0,'myhome.php',1,9,1,'',1,NULL),(37,'MNU_MYPROFILE_DATA','Profile',484,'Profile',484,0,'myprofile.php',1,9,3,'',1,NULL),(38,'MNU_MYPROFILE_QUERIES','Stored queries',485,'Stored queries',485,0,'query.php',1,9,4,'',1,NULL),(39,'MNU_MYPROFILE_WATCHES','Watched caches',486,'Watched caches',486,0,'mywatches.php',1,9,5,'',1,NULL),(40,'MNU_MYPROFILE_IGNORES','Ignored caches',487,'Ignored caches',487,0,'myignores.php',1,9,6,'',1,NULL),(41,'MNU_MYPROFILE_RECOMMENDATIONS','Recommendations',55,'Recommendations',55,0,'mytop5.php',1,9,8,'',1,NULL),(42,'MNU_MYPROFILE_WATCHES_EDIT','Settings',488,'Settings',488,0,'mywatches.php?action=edit',1,39,1,'',1,NULL),(45,'MNU_MYPROFILE_DATA_PASSWORD','Change password',491,'Change password',491,0,'newpw.php',1,37,5,'',1,NULL),(46,'MNU_MYPROFILE_DATA_STATPIC','Statistic picture',556,'Statistic picture',556,0,'mystatpic.php',1,37,3,'',1,NULL),(47,'MNU_CACHES_VIEWLOGS','Show logentries',555,'Show logentries',555,0,'viewlogs.php',0,10,6,'',0,NULL),(48,'MNU_LOGIN_NEWPW','Change password',491,'Change password',491,0,'newpw.php',0,32,1,'',1,NULL),(49,'MNU_LOGIN_REMINDEMAIL','Remind E-Mail',659,'Remind E-Mail',659,0,'remindemail.php',0,32,3,'',1,NULL),(50,'MNU_CACHES_SEARCH_RECOMMENDATIONS','Recommendations',55,'Recommendations',55,0,'recommendations.php',0,20,1,'',0,NULL),(51,'MNU_SITEMAP','Sitemap',17,'Sitemap',17,0,'sitemap.php',0,0,11,'#D5D9FF',1,NULL),(52,'MNU_ADMIN_DBMAINTAIN','Database maintainance',672,'DB Maintainance',673,1,'dbmaintain.php',1,12,2,'',0,NULL),(53,'MNU_USER','User',4,'User',4,0,'',0,0,5,'#FFFFC5',0,NULL),(54,'MNU_USER_MAILTO','Send E-Mail',148,'Send E-Mail',148,0,'mailto.php',0,53,1,'',0,NULL),(55,'MNU_CACHES_SEARCH_VIEWCACHE','Show Geocache',698,'Show Geocache',698,0,'viewcache.php',0,20,1,'',0,NULL),(56,'MNU_CACHES_PICTURE','Edit picture',741,'Edit picture',741,0,'picture.php',0,10,7,'',0,NULL),(58,'MNU_ADMIN_REPORTS','Reported caches',750,'Reported caches',750,1,'adminreports.php',1,12,3,'',0,NULL),(59,'MNU_CACHES_REPORT','Report cache',772,'Report cache',772,0,'reportcache.php',0,10,8,'',0,NULL),(60,'MNU_MYPROFILE_DETAILS','Details',799,'Details',799,0,'mydetails.php',1,37,1,'',1,NULL),(62,'MNU_CACHES_USERDETAILS','User details',801,'User details',801,0,'viewuserdetails.php',0,10,4,'',0,NULL),(63,'MNU_MYPROFILE_ADOPT','Adoptions',827,'Adoptions',827,0,'adoptcache.php',1,9,9,'',1,NULL),(64,'MNU_CACHES_ADOPT','Adoptions',827,'Adoptions',827,0,'adoptcache.php',0,10,9,'',0,NULL),(65,'MNU_ADMIN_USER','Manage User',859,'Manage User',859,0,'adminuser.php',1,12,5,'',0,NULL),(67,'MNU_START_DONATE','Donations',900,'Donations',900,0,'articles.php?page=donations',1,1,13,'',1,NULL),(68,'MNU_START_TOS','Terms of use',906,'Terms of use',906,0,'articles.php?page=terms',1,1,16,'',1,NULL),(69,'MNU_START_TEAM','Our Team',907,'Our Team',907,0,'articles.php?page=team',1,1,14,'',1,NULL),(70,'MNU_MAP','Map',1269,'Map',1269,0,'map2.php',1,0,4,'#FFFFC5',1,NULL),(85,'MNU_CACHES_LOG','Create a logentry',1687,'Create a logentry',1687,0,'log.php',0,10,10,'',0,NULL),(86,'MNU_START_CHANGELOG','Changelog',1797,'Changelog',1797,0,'articles.php?page=changelog',0,1,5,'',1,NULL),(87,'MNU_START_OPERATOR','Operator Association',1798,'Operator Association',1798,0,'articles.php?page=verein',1,1,15,'',1,NULL),(88,'MNU_VERIFY_EMAIL','Verify e-mail address',1824,'Verify e-mail address',1824,0,'verifyemail.php',0,0,0,'',0,NULL),(89,'MNU_ADMIN_ADMINS','Admins',1831,'Admins',1831,1,'admins.php',1,12,8,'',0,NULL),(90,'MNU_START_NEWLOGPICS','Picture gallery',1940,'Picture gallery',1940,0,'newlogpics.php',1,7,2,'',1,NULL),(91,'MNU_START_OPENCACHING','About Opencaching',1963,'About Opencaching',1963,0,'articles.php?page=opencaching&wiki',1,1,11,'',1,NULL),(92,'MNU_MYPROFILE_PUBLIC','Public profile',1952,'Public profile',1952,0,'viewprofile.php',1,9,2,'',1,NULL),(93,'MNU_ADMIN_RESTORE','Vandalism',1880,'Vandalism',1880,0,'restorecaches.php',1,12,6,'',0,NULL),(95,'MNU_MYPROFILE_OKAPI','OKAPI Applications',2008,'OKAPI Apps',2009,0,'!okapi/apps/?langpref=%LANG',1,9,10,'',1,NULL),(96,'MNU_ADMIN_HISTORY','Cache history',2059,'Cache history',2059,1,'adminhistory.php',1,12,4,'',0,NULL),(97,'MNU_CACHES_SEARCH_SELECT_CITY','Select city',1694,'Select city',1694,0,'search.php',0,20,1,'',0,NULL),(98,'MNU_CACHES_SEARCH_RESULT','Show search result',1695,'Result',1696,0,'search.php',0,20,2,'',0,NULL),(99,'MNU_CACHES_MY','My caches',2111,'My caches',2111,0,'myhome.php#mycaches',1,10,3,'',1,NULL),(100,'MNU_START_OCMENU','Opencaching',2112,'Opencaching',2112,0,'',1,1,9,'',0,NULL),(101,'MNU_START_WIKINEWS','New Wiki articles',2113,'New Wiki articles',2113,0,'articles.php?page=wikinews&wiki',1,1,4,'',0,NULL),(102,'MNU_START_NEWFEATURES','New features',2115,'New features',2115,0,'articles.php?page=changelog',1,1,5,'',0,NULL),(103,'MNU_MYPROFILE_OWNERLOGS','Log history',2126,'Log history',2126,0,'ownerlogs.php',0,9,10,'',1,NULL),(104,'MNU_MYPROFILE_OWNLOGS','Log history',2126,'Log history',2126,0,'ownlogs.php',0,9,11,'',1,NULL),(105,'MNU_CACHES_OCONLY81','OConly-81',2139,'OConly-81',2139,0,'oconly81.php',1,10,7,'',1,NULL),(106,'MNU_CACHES_ADDTOLIST','Add geocache to list',2181,'Add geocache to list',2181,0,'addtolist.php',0,10,12,'',0,NULL),(107,'MNU_CACHES_LISTS','Cache lists',2189,'Cache lists',2189,0,'cachelists.php',1,10,6,'',1,NULL),(108,'MNU_MYPROFILE_LISTS','My cache lists',2193,'My cache lists',2193,0,'mylists.php',1,9,7,'',1,NULL),(109,'MNU_MYPROFILE_FIELD_NOTES','Field Notes',0,'Field Notes',0,0,'/field-notes/',1,9,11,'',1,NULL),(110,'MNU_CACHES_EDITLOG','Edit logentry',1688,'Edit logentry',1688,0,'editlog.php',0,10,11,'',0,NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_repl_exclude`
--

DROP TABLE IF EXISTS `sys_repl_exclude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_repl_exclude` (
  `user_id` int(10) unsigned NOT NULL,
  `datExclude` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `datExclude` (`datExclude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_repl_exclude`
--

LOCK TABLES `sys_repl_exclude` WRITE;
/*!40000 ALTER TABLE `sys_repl_exclude` DISABLE KEYS */;
INSERT INTO `sys_repl_exclude` (`user_id`, `datExclude`) VALUES (170295,'2020-12-16 20:24:38'),(170289,'2020-12-17 14:32:49'),(170291,'2020-12-18 08:47:00'),(170290,'2020-12-18 08:57:37'),(170293,'2020-12-18 09:25:11'),(170294,'2020-12-18 10:01:41'),(170296,'2020-12-18 10:33:26'),(170292,'2020-12-18 10:45:18'),(170298,'2020-12-18 11:12:56'),(107469,'2020-12-18 11:15:32'),(170299,'2020-12-18 11:23:18');
/*!40000 ALTER TABLE `sys_repl_exclude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_repl_slaves`
--

DROP TABLE IF EXISTS `sys_repl_slaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_repl_slaves` (
  `id` smallint(5) unsigned NOT NULL,
  `server` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `weight` tinyint(4) NOT NULL,
  `online` tinyint(1) NOT NULL,
  `last_check` datetime NOT NULL,
  `time_diff` int(10) unsigned NOT NULL,
  `current_log_name` varchar(60) NOT NULL,
  `current_log_pos` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_repl_slaves`
--

LOCK TABLES `sys_repl_slaves` WRITE;
/*!40000 ALTER TABLE `sys_repl_slaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_repl_slaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_repl_timestamp`
--

DROP TABLE IF EXISTS `sys_repl_timestamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_repl_timestamp` (
  `id` tinyint(1) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_repl_timestamp`
--

LOCK TABLES `sys_repl_timestamp` WRITE;
/*!40000 ALTER TABLE `sys_repl_timestamp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_repl_timestamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sessions`
--

DROP TABLE IF EXISTS `sys_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sessions` (
  `uuid` varchar(36) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `permanent` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sessions`
--

LOCK TABLES `sys_sessions` WRITE;
/*!40000 ALTER TABLE `sys_sessions` DISABLE KEYS */;
INSERT INTO `sys_sessions` (`uuid`, `user_id`, `permanent`, `last_login`) VALUES ('24568309-7437-1d26-0d68-f34c0bea00ef',170299,0,'2020-12-18 11:20:17'),('4dd84ec7-5e11-84b0-8c87-e6d3fd3a7cf5',170289,1,'2020-12-18 13:27:38'),('8a62b2cf-1c80-2371-f1c8-cf053600ebb8',170298,0,'2020-12-17 13:25:02'),('b3f67b70-76ea-7e30-3851-890dd9a9fcab',170298,0,'2020-12-17 13:25:11'),('dc3964f5-f751-f094-4a07-1f2b65935f4a',170288,0,'2020-12-16 19:01:47'),('eaba6376-1c1b-42d8-1834-eff3ab6fde1f',170289,0,'2020-12-16 19:56:41'),('fdd75531-8a08-97d5-6c93-de2ae6827d4e',170298,1,'2020-12-17 13:26:46');
/*!40000 ALTER TABLE `sys_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sysSessionsBeforeInsert` BEFORE INSERT ON `sys_sessions`
     FOR EACH ROW BEGIN
        SET NEW.`last_login`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sysSessionsAfterInsert` AFTER INSERT ON `sys_sessions`
     FOR EACH ROW BEGIN
        UPDATE `user` SET `user`.`last_login`=NEW.`last_login` WHERE `user`.`user_id`=NEW.`user_id`;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_temptables`
--

DROP TABLE IF EXISTS `sys_temptables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_temptables` (
  `threadid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`threadid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_temptables`
--

LOCK TABLES `sys_temptables` WRITE;
/*!40000 ALTER TABLE `sys_temptables` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_temptables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_trans`
--

DROP TABLE IF EXISTS `sys_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_trans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `last_modified` datetime NOT NULL COMMENT 'via trigger (sys_trans)',
  PRIMARY KEY (`id`),
  KEY `text` (`text`(8))
) ENGINE=InnoDB AUTO_INCREMENT=2671 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_trans`
--

LOCK TABLES `sys_trans` WRITE;
/*!40000 ALTER TABLE `sys_trans` DISABLE KEYS */;
INSERT INTO `sys_trans` (`id`, `text`, `last_modified`) VALUES (1,'Reorder ID\'s','2010-08-28 11:48:03'),(2,'The database could not be reconnected.','2010-08-28 11:48:03'),(3,'Testing - do not login, please','2010-08-28 11:48:03'),(4,'User','2010-08-28 11:48:03'),(5,'(empty)','2010-08-28 11:48:03'),(6,'Logged in as','2010-08-28 11:48:03'),(7,'Logout','2010-08-28 11:48:03'),(8,'Waypoint-Search:','2010-08-28 11:48:03'),(9,'Page timing:','2010-08-28 11:48:03'),(10,'sec','2010-08-28 11:48:03'),(11,'Page cached:','2010-08-28 11:48:03'),(12,'DB connected:','2010-08-28 11:48:03'),(13,'Created at:','2010-08-28 11:48:03'),(14,'Privacy statement','2010-08-28 11:48:03'),(15,'Imprint','2010-08-28 11:48:03'),(16,'Contact','2010-08-28 11:48:03'),(17,'Sitemap','2010-08-28 11:48:03'),(18,'Register','2010-08-28 11:48:03'),(19,'New user registered','2010-08-28 11:48:03'),(20,'Note','2010-08-28 11:48:03'),(21,'Vietnamese','2010-08-28 11:48:03'),(22,'Username','2010-08-28 11:48:03'),(23,'E-Mail','2010-08-28 11:48:03'),(24,'First name','2010-08-28 11:48:03'),(25,'Last name','2010-08-28 11:48:03'),(26,'Country','2010-08-28 11:48:03'),(27,'Register new user','2010-08-28 11:48:03'),(29,'The username contains invalid characters.','2010-08-28 11:48:03'),(31,'The last name is not valid.','2010-08-28 11:48:03'),(32,'The first name is not valid.','2010-08-28 11:48:03'),(33,'Not specified','2010-08-28 11:48:03'),(34,'Show all','2010-08-28 11:48:03'),(35,'The E-Mail is not valid.','2010-08-28 11:48:03'),(36,'Turkish','2010-08-28 11:48:03'),(37,'Your password:','2010-08-28 11:48:03'),(39,'The passwords do not match.','2010-08-28 11:48:03'),(41,'* mandatory field','2010-08-28 11:48:03'),(42,'Swedish','2010-08-28 11:48:03'),(43,'Slovenian','2010-08-28 11:48:03'),(45,'At least 4 different chars','2010-08-28 11:48:03'),(48,'Slovak','2010-08-28 11:48:03'),(49,'Russian','2010-08-28 11:48:03'),(51,'Reset','2010-08-28 11:48:03'),(52,'Special caches','2010-08-28 11:48:03'),(54,'Index','2010-08-28 11:48:03'),(55,'Recommendations','2010-08-28 11:48:03'),(56,'Found','2010-08-28 11:48:03'),(57,'by','2010-08-28 11:48:03'),(59,'Romanian','2010-08-28 11:48:03'),(60,'Step 1','2010-08-28 11:48:03'),(63,'Step 2','2010-08-28 11:48:03'),(64,'Portuguese','2010-08-28 11:48:03'),(65,'Back','2010-08-28 11:48:03'),(70,'News','2010-08-28 11:48:03'),(71,'Latest caches','2010-08-28 11:48:03'),(73,'Latest logs entries','2010-08-28 11:48:03'),(74,'Polish','2010-08-28 11:48:03'),(75,'Norwegian','2010-08-28 11:48:03'),(76,'Latvian','2010-08-28 11:48:03'),(77,'Lithuanian','2010-08-28 11:48:03'),(78,'Italian','2010-08-28 11:48:03'),(79,'Icelandic','2010-08-28 11:48:03'),(80,'Start','2010-08-28 11:48:03'),(82,'You can find everything you need to go Geocaching ...','2010-08-28 11:48:03'),(83,'The file was not uploaded correctly.','2010-08-28 11:48:03'),(84,'The file was too big. The maximum file size is %1 KB.','2010-08-28 11:48:03'),(85,'No picture file given.','2010-08-28 11:48:03'),(86,'same type','2010-08-28 11:48:03'),(90,'Total of %1 active Caches and %2 founds by %3 users','2010-08-28 11:48:03'),(91,'Hungarian','2010-08-28 11:48:03'),(92,'Croatian','2010-08-28 11:48:03'),(93,'Finnish','2010-08-28 11:48:03'),(94,'Yes','2010-08-28 11:48:03'),(95,'No','2010-08-28 11:48:03'),(96,'Hello','2010-08-28 11:48:03'),(99,'This E-Mail was generated by the %2 website, because an account with this E-Mail address was created. If you don\'t want to receive E-Mails in future, please contact us via E-Mail %1','2010-08-28 11:48:03'),(100,'Basque','2010-08-28 11:48:03'),(101,'Estonian','2010-08-28 11:48:03'),(102,'Esperanto','2010-08-28 11:48:03'),(103,'Greek','2010-08-28 11:48:03'),(104,'Danish','2010-08-28 11:48:03'),(105,'An unknown error occurred.','2010-08-28 11:48:03'),(106,'Template does not exist.','2010-08-28 11:48:03'),(107,'Sorry, you are not allowed to view this page.','2010-08-28 11:48:03'),(108,'Sorry, the requested cache does not exist.','2010-08-28 11:48:03'),(109,'Sorry, the requested operation cannot be performed.','2010-08-28 11:48:03'),(110,'Please login to continue:','2010-08-28 11:48:03'),(111,'Sorry, the requested user does not exist.','2010-08-28 11:48:03'),(112,'Mail template does not exist.','2010-08-28 11:48:03'),(113,'HTML Tags','2010-08-28 11:48:03'),(114,'Description','2010-08-28 11:48:03'),(115,'Create a cache','2010-08-28 11:48:03'),(116,'Admin','2010-08-28 11:48:03'),(117,'Informations','2010-08-28 11:48:03'),(118,'Caches','2010-08-28 11:48:03'),(119,'My profile','2010-08-28 11:48:03'),(120,'New logs','2010-08-28 11:48:03'),(122,'New caches','2010-08-28 11:48:03'),(123,'About Geocaching','2010-08-28 11:48:03'),(124,'New Item','2010-08-28 11:48:03'),(125,'Search','2010-08-28 11:48:03'),(126,'Translation','2010-08-28 11:48:03'),(127,'Activation','2010-08-28 11:48:03'),(128,'Userprofile','2010-08-28 11:48:03'),(129,'An error occurred while processing the page','2010-08-28 11:48:03'),(130,'An error occurred while processing the page. If you\'ve called this page from an hyperlink on our site and this error persists some time, please contact us via E-Mail.','2010-08-28 11:48:03'),(131,'The following error occurred:','2010-08-28 11:48:03'),(133,'Error message','2010-08-28 11:48:03'),(134,'%2 found %1','2010-08-28 11:48:03'),(135,'%2 didn\'t find %1','2010-08-28 11:48:03'),(136,'%2 wrote a note for %1','2010-08-28 11:48:03'),(137,'%2 visited %1','2010-08-28 11:48:03'),(138,'%2 want\'s to visit %1','2010-08-28 11:48:03'),(139,'Registration confirmation','2010-08-28 11:48:03'),(140,'welcome at %1!','2010-08-28 11:48:03'),(141,'The following data has been stored for your account:','2010-08-28 11:48:03'),(142,'Slave','2010-08-28 11:48:03'),(144,'If you don\'t login in the next 14 days, your account will be deleted.','2010-08-28 11:48:03'),(145,'Czech','2010-08-28 11:48:03'),(146,'Bulgarian','2010-08-28 11:48:03'),(147,'Userprofile of %1','2010-08-28 11:48:03'),(148,'Send E-Mail','2010-08-28 11:48:03'),(149,'Others','2010-08-28 11:48:03'),(150,'I\'m taking an PMR radio on channel 2 with me','2010-08-28 11:48:03'),(151,'Registered&nbsp;since:','2010-08-28 11:48:03'),(152,'Hidden caches:','2010-08-28 11:48:03'),(153,'Caches found:','2010-08-28 11:48:03'),(154,'%1 of %2 possibles','2010-08-28 11:48:03'),(155,'Dutch','2010-08-28 11:48:03'),(156,'Japanese','2010-08-28 11:48:03'),(157,'Spanish','2010-08-28 11:48:03'),(158,'French','2010-08-28 11:48:03'),(159,'English','2010-08-28 11:48:03'),(160,'German','2010-08-28 11:48:03'),(161,'Attention: If you are using this option, don\'t forget to log out before other persons can use your computer. Otherwise, they can use and modify your personal data.','2010-08-28 11:48:03'),(162,'Zimbabwe','2010-08-28 11:48:03'),(163,'Zambia','2010-08-28 11:48:03'),(164,'South Africa','2010-08-28 11:48:03'),(165,'Mayotte','2010-08-28 11:48:03'),(166,'The activation code was sent with an E-Mail to you.<br /> Please follow the instructions in the E-Mail.','2010-08-28 11:48:03'),(167,'To create an account on %1, you have to enter a vaild E-Mail address and an username. An E-Mail will be sent to the address you supplied with an activation code.','2010-08-28 11:48:03'),(168,'There already exists an account with that E-Mail address. It\'s not possible the register a scond account with the same E-Mail address.','2010-08-28 11:48:03'),(171,'The activation code or E-Mail was incorrect.<br /> The activation of your account was not successfull<br /> Please use the E-Mail where the registration mail was sent to.<br /> <br /> Please check if you have mistyped - if you cannot solve the problem yourself, contact us via <a href=\"mailto:%1\">%1</a>','2010-08-28 11:48:03'),(172,'Yemen','2010-08-28 11:48:03'),(173,'Samoa','2010-08-28 11:48:03'),(174,'Go','2010-08-28 11:48:03'),(175,'Developer system - only testing','2010-08-28 11:48:03'),(179,'Wallis And Futuna Islands','2010-08-28 11:48:03'),(180,'Post some news','2010-08-28 11:48:03'),(181,'Vanuatu','2010-08-28 11:48:03'),(182,'Viet Nam','2010-08-28 11:48:03'),(183,'Virgin Islands (U.S.)','2010-08-28 11:48:03'),(184,'Virgin Islands (British)','2010-08-28 11:48:03'),(185,'Venezuela','2010-08-28 11:48:03'),(186,'Select target language:','2010-08-28 11:48:03'),(187,'Show new translations','2010-08-28 11:48:03'),(188,'Clear smarty cache','2010-08-28 11:48:03'),(189,'Not defined','2010-08-28 11:48:03'),(190,'Show translations no longer referenced','2010-08-28 11:48:03'),(191,'Show all translations','2010-08-28 11:48:03'),(192,'Saint Vincent And The Grenadines','2010-08-28 11:48:03'),(193,'Vatican City State (Holy See)','2010-08-28 11:48:03'),(194,'Uzbekistan','2010-08-28 11:48:03'),(195,'Use existing translations:','2010-08-28 11:48:03'),(196,'All translations:','2010-08-28 11:48:03'),(197,'New translations:','2010-08-28 11:48:03'),(198,'Translations no longer referenced:','2010-08-28 11:48:03'),(199,'Languages:','2010-08-28 11:48:03'),(201,'Uruguay','2010-08-28 11:48:03'),(202,'Activation code:','2010-08-28 11:48:03'),(203,'United States','2010-08-28 11:48:03'),(204,'United States Minor Outlying Islands','2010-08-28 11:48:03'),(206,'total:','2010-08-28 11:48:03'),(207,'Login','2010-08-28 11:48:03'),(208,'Password','2010-08-28 11:48:03'),(209,'Uganda','2010-08-28 11:48:03'),(210,'Ukraine','2010-08-28 11:48:03'),(211,'Tanzania, United Republic Of','2010-08-28 11:48:03'),(212,'Taiwan, Province Of China','2010-08-28 11:48:03'),(213,'Tuvalu','2010-08-28 11:48:03'),(214,'Trinidad And Tobago','2010-08-28 11:48:03'),(215,'Turkey','2010-08-28 11:48:03'),(216,'Not registered?','2010-08-28 11:48:03'),(217,'Forgotten your password?','2010-08-28 11:48:03'),(218,'Forgotten your E-Mail-Address?','2010-08-28 11:48:03'),(219,'Here you can find more troubleshooting:','2010-08-28 11:48:03'),(221,'Create a new password','2010-08-28 11:48:03'),(222,'Remind me','2010-08-28 11:48:03'),(223,'Tonga','2010-08-28 11:48:03'),(224,'Please fill in username and password!','2010-08-28 11:48:03'),(225,'Logout was successful.','2010-08-28 11:48:03'),(226,'The login was not successfull.','2010-08-28 11:48:03'),(227,'The entered username or password did not match.','2010-08-28 11:48:03'),(228,'Your tried to login more than %1 times in the last hour. The next login will not be allowed before one hour since the first try has passed.','2010-08-28 11:48:03'),(229,'Your account is not acivated.','2010-08-28 11:48:03'),(230,'&gt;<a href=\"activation.php\">Here</a>&lt; you can activate your account.','2010-08-28 11:48:03'),(231,'Tunisia','2010-08-28 11:48:03'),(232,'To complete the registration, you have to enter your E-Mail and activation code.','2010-08-28 11:48:03'),(233,'Turkmenistan','2010-08-28 11:48:03'),(234,'Tokelau','2010-08-28 11:48:03'),(235,'Tajikistan','2010-08-28 11:48:03'),(236,'Thailand','2010-08-28 11:48:03'),(237,'Togo','2010-08-28 11:48:03'),(238,'French Southern Territories','2010-08-28 11:48:03'),(239,'Chad','2010-08-28 11:48:03'),(240,'Turks And Caicos Islands','2010-08-28 11:48:03'),(241,'Name','2010-08-28 11:48:03'),(242,'Swaziland','2010-08-28 11:48:03'),(243,'Syrian Arab Republic','2010-08-28 11:48:03'),(244,'Recommendations of <a href=\"viewprofile.php?userid=%1\">%2</a>','2010-08-28 11:48:03'),(245,'by %1','2010-08-28 11:48:03'),(246,'%1 has not recommended any geocache.','2010-08-28 11:48:03'),(248,'Show recommendations','2010-08-28 11:48:03'),(249,'El Salvador','2010-08-28 11:48:03'),(250,'Sao Tome And Principe','2010-08-28 11:48:03'),(251,'Suriname','2010-08-28 11:48:03'),(252,'Somalia','2010-08-28 11:48:03'),(253,'Unkown format of the given waypoint. The known formats are OCxxxxx and GCxxxxx, whereas x can be any number or char.','2010-08-28 11:48:03'),(254,'There exists more than one cache with the waypoint &quot;%1&quot;.','2010-08-28 11:48:03'),(255,'The waypoint &quot;%1&quot; was not found.','2010-08-28 11:48:03'),(256,'Senegal','2010-08-28 11:48:03'),(257,'San Marino','2010-08-28 11:48:03'),(258,'Sierra Leone','2010-08-28 11:48:03'),(259,'Slovakia','2010-08-28 11:48:03'),(260,'Svalbard And Jan Mayen Islands','2010-08-28 11:48:03'),(261,'Slovenia','2010-08-28 11:48:03'),(262,'St. Helena','2010-08-28 11:48:03'),(263,'Singapore','2010-08-28 11:48:03'),(264,'Sweden','2010-08-28 11:48:03'),(265,'Sudan','2010-08-28 11:48:03'),(266,'Seychelles','2010-08-28 11:48:03'),(267,'Solomon Islands','2010-08-28 11:48:03'),(268,'Saudi Arabia','2010-08-28 11:48:03'),(269,'Rwanda','2010-08-28 11:48:03'),(270,'Russian Federation','2010-08-28 11:48:03'),(271,'Romania','2010-08-28 11:48:03'),(272,'Reunion','2010-08-28 11:48:03'),(273,'Qatar','2010-08-28 11:48:03'),(274,'Paraguay','2010-08-28 11:48:03'),(275,'Palau','2010-08-28 11:48:03'),(276,'Portugal','2010-08-28 11:48:03'),(277,'Puerto Rico','2010-08-28 11:48:03'),(278,'Pitcairn','2010-08-28 11:48:03'),(279,'St. Pierre And Miquelon','2010-08-28 11:48:03'),(280,'Poland','2010-08-28 11:48:03'),(281,'Pakistan','2010-08-28 11:48:03'),(282,'Philippines','2010-08-28 11:48:03'),(283,'Papua New Guinea','2010-08-28 11:48:03'),(284,'French Polynesia','2010-08-28 11:48:03'),(285,'Peru','2010-08-28 11:48:03'),(286,'Panama','2010-08-28 11:48:03'),(287,'Oman','2010-08-28 11:48:03'),(288,'New Zealand','2010-08-28 11:48:03'),(289,'Niue','2010-08-28 11:48:03'),(290,'Nauru','2010-08-28 11:48:03'),(291,'Nepal','2010-08-28 11:48:03'),(292,'Norway','2010-08-28 11:48:03'),(293,'Netherlands','2010-08-28 11:48:03'),(294,'Nicaragua','2010-08-28 11:48:03'),(295,'Nigeria','2010-08-28 11:48:03'),(296,'Norfolk Island','2010-08-28 11:48:03'),(297,'Niger','2010-08-28 11:48:03'),(298,'New Caledonia','2010-08-28 11:48:03'),(299,'Namibia','2010-08-28 11:48:03'),(300,'Mozambique','2010-08-28 11:48:03'),(301,'Malaysia','2010-08-28 11:48:03'),(302,'Mexico','2010-08-28 11:48:03'),(303,'Malawi','2010-08-28 11:48:03'),(304,'Maldives','2010-08-28 11:48:03'),(305,'Mauritius','2010-08-28 11:48:03'),(306,'Malta','2010-08-28 11:48:03'),(307,'Montserrat','2010-08-28 11:48:03'),(308,'Mauritania','2010-08-28 11:48:03'),(309,'Martinique','2010-08-28 11:48:03'),(310,'Northern Mariana Islands','2010-08-28 11:48:03'),(311,'Macau','2010-08-28 11:48:03'),(312,'Mongolia','2010-08-28 11:48:03'),(313,'Myanmar','2010-08-28 11:48:03'),(314,'Mali','2010-08-28 11:48:03'),(315,'Macedonia, The Former Yugoslav Republic Of','2010-08-28 11:48:03'),(316,'Marshall Islands','2010-08-28 11:48:03'),(317,'Madagascar','2010-08-28 11:48:03'),(318,'Moldova, Republic Of','2010-08-28 11:48:03'),(319,'Monaco','2010-08-28 11:48:03'),(320,'Morocco','2010-08-28 11:48:03'),(321,'Libyan Arab Jamahiriya','2010-08-28 11:48:03'),(322,'Latvia','2010-08-28 11:48:03'),(323,'Luxembourg','2010-08-28 11:48:03'),(324,'Lithuania','2010-08-28 11:48:03'),(325,'Lesotho','2010-08-28 11:48:03'),(326,'Liberia','2010-08-28 11:48:03'),(327,'Sri Lanka','2010-08-28 11:48:03'),(328,'Liechtenstein','2010-08-28 11:48:03'),(329,'Saint Lucia','2010-08-28 11:48:03'),(330,'Lebanon','2010-08-28 11:48:03'),(331,'Lao People\'s Democratic Republic','2010-08-28 11:48:03'),(332,'Kazakhstan','2010-08-28 11:48:03'),(333,'Cayman Islands','2010-08-28 11:48:03'),(334,'Kuwait','2010-08-28 11:48:03'),(335,'Korea, Republic Of','2010-08-28 11:48:03'),(336,'Korea, Democratic People\'s Republic Of','2010-08-28 11:48:03'),(337,'Saint Kitts And Nevis','2010-08-28 11:48:03'),(338,'Comoros','2010-08-28 11:48:03'),(339,'Kiribati','2010-08-28 11:48:03'),(340,'Cambodia','2010-08-28 11:48:03'),(341,'Kyrgyzstan','2010-08-28 11:48:03'),(342,'Kenya','2010-08-28 11:48:03'),(343,'Japan','2010-08-28 11:48:03'),(344,'Jordan','2010-08-28 11:48:03'),(345,'Jamaica','2010-08-28 11:48:03'),(346,'Italy','2010-08-28 11:48:03'),(347,'Iceland','2010-08-28 11:48:03'),(348,'Iran (Islamic Republic Of)','2010-08-28 11:48:03'),(349,'Iraq','2010-08-28 11:48:03'),(350,'British Indian Ocean Territory','2010-08-28 11:48:03'),(351,'India','2010-08-28 11:48:03'),(352,'Israel','2010-08-28 11:48:03'),(353,'Ireland','2010-08-28 11:48:03'),(354,'Indonesia','2010-08-28 11:48:03'),(355,'Hungary','2010-08-28 11:48:03'),(356,'Haiti','2010-08-28 11:48:03'),(357,'Croatia','2010-08-28 11:48:03'),(358,'Honduras','2010-08-28 11:48:03'),(359,'Heard And Mc Donald Islands','2010-08-28 11:48:03'),(360,'Hong Kong','2010-08-28 11:48:03'),(361,'Guyana','2010-08-28 11:48:03'),(362,'Guinea-Bissau','2010-08-28 11:48:03'),(363,'Guam','2010-08-28 11:48:03'),(364,'Guatemala','2010-08-28 11:48:03'),(365,'South Georgia And The South Sandwich Islands','2010-08-28 11:48:03'),(366,'Greece','2010-08-28 11:48:03'),(367,'Guadeloupe','2010-08-28 11:48:03'),(368,'Guinea','2010-08-28 11:48:03'),(369,'Gambia','2010-08-28 11:48:03'),(370,'Greenland','2010-08-28 11:48:03'),(371,'Gibraltar','2010-08-28 11:48:03'),(372,'Ghana','2010-08-28 11:48:03'),(373,'French Guiana','2010-08-28 11:48:03'),(374,'Georgia','2010-08-28 11:48:03'),(375,'Grenada','2010-08-28 11:48:03'),(376,'United Kingdom','2010-08-28 11:48:03'),(377,'Gabon','2010-08-28 11:48:03'),(378,'France','2010-08-28 11:48:03'),(379,'Faroe Islands','2010-08-28 11:48:03'),(380,'Micronesia, Federated States Of','2010-08-28 11:48:03'),(381,'Falkland Islands (Malvinas)','2010-08-28 11:48:03'),(382,'Fiji','2010-08-28 11:48:03'),(383,'Finland','2010-08-28 11:48:03'),(384,'Ethiopia','2010-08-28 11:48:03'),(385,'Spain','2010-08-28 11:48:03'),(386,'Eritrea','2010-08-28 11:48:03'),(387,'Western Sahara','2010-08-28 11:48:03'),(388,'Egypt','2010-08-28 11:48:03'),(389,'Estonia','2010-08-28 11:48:03'),(390,'Ecuador','2010-08-28 11:48:03'),(391,'Algeria','2010-08-28 11:48:03'),(392,'Dominican Republic','2010-08-28 11:48:03'),(393,'Denmark','2010-08-28 11:48:03'),(394,'Djibouti','2010-08-28 11:48:03'),(395,'Germany','2010-08-28 11:48:03'),(396,'Czech Republic','2010-08-28 11:48:03'),(397,'Cyprus','2010-08-28 11:48:03'),(398,'Christmas Island','2010-08-28 11:48:03'),(399,'Cape Verde','2010-08-28 11:48:03'),(400,'Cuba','2010-08-28 11:48:03'),(402,'Costa Rica','2010-08-28 11:48:03'),(403,'Colombia','2010-08-28 11:48:03'),(404,'China','2010-08-28 11:48:03'),(405,'Cameroon','2010-08-28 11:48:03'),(406,'Chile','2010-08-28 11:48:03'),(407,'Cook Islands','2010-08-28 11:48:03'),(408,'Cote d\'Ivoire','2010-08-28 11:48:03'),(409,'Switzerland','2010-08-28 11:48:03'),(410,'Congo','2010-08-28 11:48:03'),(411,'Central African Republic','2010-08-28 11:48:03'),(412,'Cocos (Keeling) Islands','2010-08-28 11:48:03'),(413,'Canada','2010-08-28 11:48:03'),(414,'Belize','2010-08-28 11:48:03'),(415,'Belarus','2010-08-28 11:48:03'),(416,'Botswana','2010-08-28 11:48:03'),(417,'Bouvet Island','2010-08-28 11:48:03'),(418,'Bhutan','2010-08-28 11:48:03'),(419,'Bahamas','2010-08-28 11:48:03'),(420,'Brazil','2010-08-28 11:48:03'),(421,'Bolivia','2010-08-28 11:48:03'),(422,'Brunei Darussalam','2010-08-28 11:48:03'),(423,'Bermuda','2010-08-28 11:48:03'),(424,'Benin','2010-08-28 11:48:03'),(425,'Burundi','2010-08-28 11:48:03'),(426,'Bahrain','2010-08-28 11:48:03'),(427,'Bulgaria','2010-08-28 11:48:03'),(428,'Burkina Faso','2010-08-28 11:48:03'),(429,'Belgium','2010-08-28 11:48:04'),(430,'Bangladesh','2010-08-28 11:48:04'),(431,'Barbados','2010-08-28 11:48:04'),(432,'Bosnia And Herzegowina','2010-08-28 11:48:04'),(433,'Azerbaijan','2010-08-28 11:48:04'),(434,'Aruba','2010-08-28 11:48:04'),(435,'Australia','2010-08-28 11:48:04'),(436,'Austria','2010-08-28 11:48:04'),(437,'American Samoa','2010-08-28 11:48:04'),(438,'Argentina','2010-08-28 11:48:04'),(439,'Angola','2010-08-28 11:48:04'),(440,'Netherlands Antilles','2010-08-28 11:48:04'),(441,'Armenia','2010-08-28 11:48:04'),(442,'Albania','2010-08-28 11:48:04'),(443,'Anguilla','2010-08-28 11:48:04'),(444,'Antigua And Barbuda','2010-08-28 11:48:04'),(445,'Afghanistan','2010-08-28 11:48:04'),(446,'United Arab Emirates','2010-08-28 11:48:04'),(447,'Andorra','2010-08-28 11:48:04'),(448,'Switching to db-root failed.','2010-08-28 11:48:04'),(449,'(before an export)','2010-08-28 11:48:04'),(450,'We are updating %1 and to protect against faults it processing, we set to entire page offline.','2010-08-28 11:48:04'),(452,'Newsentry saved','2010-08-28 11:48:04'),(453,'Thank you very much for your newsentry. We\'ll try to validate your entry as soon as possible.<br /> <br /> Back to <a href=\"index.php\">Start</a>','2010-08-28 11:48:04'),(454,'Submit a newsentry','2010-08-28 11:48:04'),(455,'Submit','2010-08-28 11:48:04'),(456,'The code did not match.','2010-08-28 11:48:04'),(457,'And now fill in the code to protect against spammers:','2010-08-28 11:48:04'),(458,'What does this picture show?','2010-08-28 11:48:04'),(459,'E-Mail-Adress is not valid.','2010-08-28 11:48:04'),(460,'Your E-Mail for further questions:','2010-08-28 11:48:04'),(461,'Please only use HTML tags to format the text - eg. bold, color or hyperlinks. We do not want tables, divs etc.','2010-08-28 11:48:04'),(462,'The newsentry is written with HTML tags','2010-08-28 11:48:04'),(463,'Newsentry:','2010-08-28 11:48:04'),(464,'Topic:','2010-08-28 11:48:04'),(465,'Are there any news about Geocaching?<br /> Here you can create a newsentry, that will be shown on the start page.','2010-08-28 11:48:04'),(466,'The activation of your account was successfull. You can now login on the login page.<br /><br /> <a href=\"login.php\">Go to the login page</a>','2010-08-28 11:48:04'),(467,'Hint','2010-08-28 11:48:04'),(468,'Activate account','2010-08-28 11:48:04'),(469,'Best regards,<br/>the Opencaching team','2010-08-28 11:48:04'),(470,'Please be patient, we will do our best to get the site back online as soon as possible.','2010-08-28 11:48:04'),(471,'The account could not be created, the reason is not known. If you cannot solve this problem yourself, pleas contact us via <a href=\"mailto:%1\">E-Mail</a>','2010-08-28 11:48:04'),(472,'We respect your privacy. Your personal data will be stored in our database, but not shared to third parties. Please note our exact <a href=\"articles.php?page=dsb\">privacy statement</a>. If you have further questions, please <a href=\"mailto:%1\">contact us</a> <b>before</b> you create your account.','2010-08-28 11:48:04'),(473,'We have to approve your newsentry before we can display it. We try to do this within 24h to 48h. The newsentry cannot be modified after you have submitted it. If you want to take changes in the newsentry, please resubmit the correct newsentry. It is allowed to submit news about everything around Geocaching - but it is not allowed to submit advertisement for products or geocaches. The decission to approve or not approve a newsentry lies exclusively in the discretion of the operator of the web page - there is not a requirement on publication. In the case of doubts, please submit your newsentry and wait if it will be shown - or ask via E-Mail before submitting <a href=\"mailto:%1\">%1</a>.','2010-08-28 11:48:04'),(474,'If this problem persists over a longer time, please contact us at <a href=\"mailto:%1\">%1</a>.','2010-08-28 11:48:04'),(475,'%1 is out of service','2010-08-28 11:48:04'),(477,'Total runtime:','2010-08-28 11:48:04'),(478,'Business layer runtime:','2010-08-28 11:48:04'),(479,'Framework runtime:','2010-08-28 11:48:04'),(480,'User runtime:','2010-08-28 11:48:04'),(481,'SQL Debugger','2010-08-28 11:48:04'),(482,'%1 commands','2010-08-28 11:48:04'),(483,'Overview','2010-08-28 11:48:04'),(484,'Profile','2010-08-28 11:48:04'),(485,'Stored queries','2010-08-28 11:48:04'),(486,'Watched caches','2010-08-28 11:48:04'),(487,'Ignored caches','2010-08-28 11:48:04'),(488,'Settings','2010-08-28 11:48:04'),(490,'The notification radius must be not more than 150 km. To deaktivate notifications, set the radius to 0.','2010-08-28 11:48:04'),(491,'Change password','2010-08-28 11:48:04'),(493,'E-Mail address','2010-08-28 11:48:04'),(496,'Archived','2010-08-28 11:48:04'),(497,'Not found','2010-08-28 11:48:04'),(498,'Attended','2010-08-28 11:48:04'),(499,'Will attend','2010-08-28 11:48:04'),(500,'Hello %1','2010-08-28 11:48:04'),(501,'Logs','2010-08-28 11:48:04'),(502,'Finds: %1','2010-08-28 11:48:04'),(503,'Your latest log entries','2010-08-28 11:48:04'),(504,'No entries found','2010-08-28 11:48:04'),(505,'Geocaches hidden: %1','2010-08-28 11:48:04'),(506,'Your geocaches hidden','2010-08-28 11:48:04'),(507,'No Geocaches hidden','2010-08-28 11:48:04'),(508,'Unpublished Geocaches','2010-08-28 11:48:04'),(512,'Unknown Geocache','2010-08-28 11:48:04'),(513,'Traditional Geocache','2010-08-28 11:48:04'),(514,'Multicache','2010-08-28 11:48:04'),(515,'Virtual Geocache','2010-08-28 11:48:04'),(516,'Webcam Geocache','2010-08-28 11:48:04'),(517,'Event Geocache','2010-08-28 11:48:04'),(518,'Quiz Cache','2010-08-28 11:48:04'),(519,'Math/Physics Geocache','2010-08-28 11:48:04'),(520,'Moving Geocache','2010-08-28 11:48:04'),(521,'Drive-In Geocache','2010-08-28 11:48:04'),(524,'other size','2010-08-28 11:48:04'),(525,'micro','2010-08-28 11:48:04'),(526,'small','2010-08-28 11:48:04'),(527,'normal','2010-08-28 11:48:04'),(528,'large','2010-08-28 11:48:04'),(529,'very large','2010-08-28 11:48:04'),(530,'no container','2010-08-28 11:48:04'),(531,'Available','2010-08-28 11:48:04'),(532,'Temporarily not available','2010-08-28 11:48:04'),(533,'Hidden by approvers to check','2010-08-28 11:48:04'),(534,'Not yet published','2010-08-28 11:48:04'),(535,'Unknown cache type','2010-08-28 11:48:04'),(536,'Traditional Cache','2010-08-28 11:48:04'),(537,'Virtual Cache','2010-08-28 11:48:04'),(538,'Webcam Cache','2010-08-28 11:48:04'),(539,'Event Cache','2010-08-28 11:48:04'),(540,'Math/Physics Cache','2010-08-28 11:48:04'),(541,'Moving Cache','2010-08-28 11:48:04'),(542,'Drive-in Cache','2010-08-28 11:48:04'),(544,'I want to be notified about new Geocaches within an radius of %1 km.','2010-08-28 11:48:04'),(545,'BBCode for webforums:','2010-08-28 11:48:04'),(546,'%1 statstics of %2','2010-08-28 11:48:04'),(547,'Choose logo','2010-08-28 11:48:04'),(548,'HTML-Code:','2010-08-28 11:48:04'),(549,'Text displayed:','2010-08-28 11:48:04'),(550,'Text contains invalid charecters!','2010-08-28 11:48:04'),(551,'Available logos:','2015-11-24 22:36:00'),(552,'Cancel','2010-08-28 11:48:04'),(553,'Save','2010-08-28 11:48:04'),(554,'The following settings are stored for your logo:','2010-08-28 11:48:04'),(555,'Show logentries','2010-08-28 11:48:04'),(556,'Statistic picture','2010-08-28 11:48:04'),(558,'Don\'t use an HTML editor by default.','2010-08-28 11:48:04'),(559,'Don\'t log me out after 60 minutes inactivity.','2010-08-28 11:48:04'),(560,'I\'m taking an PMR walkie talkie on channel 2 with me.','2010-08-28 11:48:04'),(561,'Others:','2010-08-28 11:48:04'),(562,'Do not notify about new Geocaches.','2010-08-28 11:48:04'),(563,'Notify about new Geocaches in a radius of %1 km.','2010-08-28 11:48:04'),(564,'Notifications:','2010-08-28 11:48:04'),(565,'Home coordinates:','2010-08-28 11:48:04'),(566,'Country:','2010-08-28 11:48:04'),(567,'Last name:','2010-08-28 11:48:04'),(568,'First name:','2010-08-28 11:48:04'),(569,'Recommended','2010-08-28 11:48:04'),(570,'%1 found the geocache','2010-08-28 11:48:04'),(571,'%1 didn\'t find the geoacache','2010-08-28 11:48:04'),(572,'%1 wrote a note','2010-08-28 11:48:04'),(573,'%1 has visited the event','2010-08-28 11:48:04'),(574,'%1 wants to visit the event','2010-08-28 11:48:04'),(575,'%1','2010-08-28 11:48:04'),(576,'Edit','2010-08-28 11:48:04'),(577,'Delete','2010-08-28 11:48:04'),(578,'Upload picture','2010-08-28 11:48:04'),(579,'Pictures for this logentry:','2010-08-28 11:48:04'),(580,'Back to the Geocache','2010-08-28 11:48:04'),(581,'E-Mail-Address:','2010-08-28 11:48:04'),(582,'Logentries for %1','2010-08-28 11:48:04'),(584,'Picture selection for %1','2010-08-28 11:48:04'),(585,'There are no pictures for the Geocache.','2010-08-28 11:48:04'),(586,'As preview picture','2010-08-28 11:48:04'),(587,'My profile data','2010-08-28 11:48:04'),(588,'The following informations are stored in your userprofile:','2010-08-28 11:48:04'),(590,'Username:','2010-08-28 11:48:04'),(591,'The country is not valid.','2010-08-28 11:48:04'),(592,'The entered radius is not valid.','2010-08-28 11:48:04'),(595,'New password:','2010-08-28 11:48:04'),(596,'Request','2010-08-28 11:48:04'),(597,'Change','2010-08-28 11:48:04'),(598,'Request code','2010-08-28 11:48:04'),(599,'New password code','2010-08-28 11:48:04'),(600,'you requested at %1 a security code to change your password.','2010-08-28 11:48:04'),(601,'The following code was generated: %1','2010-08-28 11:48:04'),(602,'This code is 3 days valid.','2010-08-28 11:48:04'),(603,'You can enter your new password at %1newpw.php','2010-08-28 11:48:04'),(604,'To change your password, you have to request a security code which will be sent to you via E-Mail.','2010-08-28 11:48:04'),(605,'This E-Mail-Address is not registered with a valid username.','2010-08-28 11:48:04'),(606,'An E-Mail was sent to you with the security code.','2010-08-28 11:48:04'),(607,'An unknown error occurred. The security code could not be sent to you.','2010-08-28 11:48:04'),(608,'Please enter your E-Mail-Address, the security code you received and your new password. The security code is only 3 days valid. You have to request a new one after that time.','2010-08-28 11:48:04'),(609,'The user account is not activated.','2010-08-28 11:48:04'),(610,'Security code:','2010-08-28 11:48:04'),(611,'The security code is expired. Request a new one.','2010-08-28 11:48:04'),(612,'The security code does not match.','2010-08-28 11:48:04'),(613,'Please repeat:','2010-08-28 11:48:04'),(614,'The password has been changed.','2013-02-14 00:48:04'),(615,'New email code','2010-08-28 11:48:04'),(616,'you requested at %1 a security code to change your E-Mail-Address.','2010-08-28 11:48:04'),(617,'You can verify your new E-Mail-Address at %1newemail.php','2010-08-28 11:48:04'),(618,'Change E-Mail address','2010-08-28 11:48:04'),(619,'To change your E-Mail address, you have to request a security code. It will be sent to your new E-Mail-Address.','2010-08-28 11:48:04'),(620,'New E-Mail address:','2010-08-28 11:48:04'),(621,'This E-Mail is already assigned to your account.','2010-08-28 11:48:04'),(622,'Please enter the security code you received. The security code is only 3 days valid. You have to request a new one after that time.','2010-08-28 11:48:04'),(623,'Request security code first.','2010-08-28 11:48:04'),(624,'There was no new E-Mail-Address entered, please request a security code first.','2010-08-28 11:48:04'),(625,'The E-Mail-Address was changed.','2010-08-28 11:48:04'),(626,'Download','2010-08-28 11:48:04'),(627,'No stored queries found','2010-08-28 11:48:04'),(628,'With the download you accept the <a href=\"articles.php?page=impressum#tos\">term of use</a> from opencaching.de','2010-08-28 11:48:04'),(629,'Store query','2010-08-28 11:48:04'),(630,'Store options as new search','2010-08-28 11:48:04'),(631,'Name of the search:','2010-08-28 11:48:04'),(632,'You have to enter a name for this search.','2010-08-28 11:48:04'),(633,'There already exists a search with this name.','2010-08-28 11:48:04'),(634,'Store','2010-08-28 11:48:04'),(635,'Overwrite old search options','2010-08-28 11:48:04'),(636,'-- Select search to overwrite --','2010-08-28 11:48:04'),(637,'-- no stored search found --','2010-08-28 11:48:04'),(638,'My recommendations','2010-08-28 11:48:04'),(639,'Your recommendation for \"<a href=\"viewcache.php?wp=%1\">%2</a>\" has been removed!','2010-08-28 11:48:04'),(640,'Remove recommendation','2010-08-28 11:48:04'),(641,'You haven\'t recommended a Geocache.','2010-08-28 11:48:04'),(642,'Ignored Geocaches','2010-08-28 11:48:04'),(643,'remove','2010-08-28 11:48:04'),(644,'You do not ignore any geocaches now.','2010-08-28 11:48:04'),(645,'Watched Geocaches - Settings','2010-08-28 11:48:04'),(646,'Delivery:','2010-08-28 11:48:04'),(647,'Immediate','2010-08-28 11:48:04'),(648,'Daily','2010-08-28 11:48:04'),(649,'Weekly','2010-08-28 11:48:04'),(650,'Send at:','2010-08-28 11:48:04'),(651,'#timetitle','2010-08-28 11:48:04'),(652,'Sent day:','2010-08-28 11:48:04'),(653,'Sent time and day is only used with daily or weekly delivery.','2010-08-28 11:48:04'),(654,'Error while trying to save!','2010-08-28 11:48:04'),(655,'Settings have been stored.','2010-08-28 11:48:04'),(656,'Watched Geocaches','2010-08-28 11:48:04'),(657,'Last found','2010-08-28 11:48:04'),(658,'No Geocaches watched.','2010-08-28 11:48:04'),(659,'Remind E-Mail','2010-08-28 11:48:04'),(660,'Remind my account E-Mail','2010-08-28 11:48:04'),(661,'Enter your username and we will send an E-Mail to your E-Mail-Address.','2010-08-28 11:48:04'),(662,'Enter an username.','2010-08-28 11:48:04'),(663,'Username does not exist.','2010-08-28 11:48:04'),(664,'The remind E-Mail was sent.','2010-08-28 11:48:04'),(665,'Reminder to your E-Mail-Address','2010-08-28 11:48:04'),(666,'Your E-Mail-Address to login:','2010-08-28 11:48:04'),(667,'you requested an reminder E-Mail at %1 .','2010-08-28 11:48:04'),(668,'Cache-Recommendations','2010-08-28 11:48:04'),(669,'User that recommended %1 by %2 also recommended the following geocaches:','2010-08-28 11:48:04'),(670,'Quota','2010-08-28 11:48:04'),(671,'No recommendations found.','2010-08-28 11:48:04'),(672,'Database maintainance','2010-08-28 11:48:04'),(673,'DB Maintainance','2010-08-28 11:48:04'),(674,'%1 corrected: %2 entries','2010-08-28 11:48:04'),(675,'Execute','2010-08-28 11:48:04'),(676,'Send','2010-08-28 11:48:04'),(677,'E-Mail from','2010-08-28 11:48:04'),(678,'Sorry, the requested user account is deactivated.','2010-08-28 11:48:04'),(679,'Sorry, there is no E-Mail address for the user requested.','2010-08-28 11:48:04'),(680,'An unknown error occurred and the E-Mail was not sent.','2010-08-28 11:48:04'),(681,'\'%1\' contacted you via %2 The user profile: %2viewprofile.php?userid=%3 To reply this E-Mail use the E-Mail link on the users profile.','2010-08-28 11:48:04'),(682,'Subject:','2010-08-28 11:48:04'),(683,'All informations will be handled confidential and not published to third parties!','2010-08-28 11:48:04'),(684,'\'%1\' with the E-Mail address %2 contacted you via %3 The user profile: %3viewprofile.php?userid=%4 Use the reply button of your E-Mail agent to answer this E-Mail.','2010-08-28 11:48:04'),(685,'E-Mail to %1 was sent','2010-08-28 11:48:04'),(686,'Content:','2010-08-28 11:48:04'),(687,'Send E-Mail to %1','2010-08-28 11:48:04'),(688,'You have to enter a subject!','2010-08-28 11:48:04'),(689,'You have to enter a content!','2010-08-28 11:48:04'),(690,'Send my E-Mail address with this message','2010-08-28 11:48:04'),(691,'This enables the receiver to answer your E-Mail directly with his E-Mail agent. You may enable this option by default in your <a href=\"myprofile.php\">user profile</a>.','2010-08-28 11:48:04'),(692,'To protect you and us from abuse:','2010-08-28 11:48:04'),(693,'Only E-Mail that regards Geocaching are allowed. Spaming is not allowed!','2010-08-28 11:48:04'),(694,'All relevant informations will be logged (date/time, sender/receiver and IP address)','2010-08-28 11:48:04'),(696,'Sorry, the Geocache is not published.','2010-08-28 11:48:04'),(697,'Show all logentries','2010-08-28 11:48:04'),(698,'Show Geocache','2010-08-28 11:48:04'),(699,'You are already logged in.<br /> Please <a href=\"login.php?action=logout\">logout</a> to login again.','2010-08-28 11:48:04'),(701,'Difficulty:&nbsp;%1&nbsp;of&nbsp;5','2010-08-28 11:48:04'),(702,'Terrain:&nbsp;%1&nbsp;of&nbsp;5','2010-08-28 11:48:04'),(703,'List of participants','2010-08-28 11:48:04'),(704,'Log this cache','2010-08-28 11:48:04'),(705,'Don\'t watch','2010-08-28 11:48:04'),(706,'Watch','2010-08-28 11:48:04'),(707,'Don\'t ignore','2010-08-28 11:48:04'),(708,'Ignore','2010-08-28 11:48:04'),(709,'Print','2010-08-28 11:48:04'),(710,'Convert coordinates','2010-08-28 11:48:04'),(711,'Size','2010-08-28 11:48:04'),(712,'Time required:','2010-08-28 11:48:04'),(713,'Distance','2010-08-28 11:48:04'),(715,'Hidden on:','2010-08-28 11:48:04'),(716,'Listed since','2010-08-28 11:48:04'),(717,'Last update:','2010-08-28 11:48:04'),(718,'Waypoint','2010-08-28 11:48:04'),(719,'Also listed at:','2010-08-28 11:48:04'),(720,'Notes','2010-08-28 11:48:04'),(721,'Watchers','2010-08-28 11:48:04'),(722,'Ignorers','2010-08-28 11:48:04'),(723,'Page visits','2010-08-28 11:48:04'),(724,'Cache attributes','2010-08-28 11:48:04'),(725,'Additional hint','2010-08-28 11:48:04'),(726,'Decrypt','2010-08-28 11:48:04'),(727,'Pictures','2010-08-28 11:48:04'),(728,'Utilities','2010-08-28 11:48:04'),(729,'Show cache recommendations from users that recommended this geocache: <a href=\"recommendations.php?cacheid=%1\">alle</a>','2010-08-28 11:48:04'),(730,'Search geocaches nearby:','2010-08-28 11:48:04'),(731,'all','2010-08-28 11:48:04'),(732,'searchable','2010-08-28 11:48:04'),(733,'Download as file:','2010-08-28 11:48:04'),(734,'GPS Exchange Format .gpx','2010-08-28 11:48:04'),(735,'Waypointfile .loc','2010-08-28 11:48:04'),(736,'Google Earth .kml','2010-08-28 11:48:04'),(737,'TomTom POI .ov2','2010-08-28 11:48:04'),(738,'TOP50-Overlay .ovl','2010-08-28 11:48:04'),(739,'Textfile .txt','2010-08-28 11:48:04'),(740,'C O P Y','2010-08-28 11:48:04'),(741,'Edit picture','2010-08-28 11:48:04'),(742,'Sorry, the requested picture does not exist.','2010-08-28 11:48:04'),(743,'Sorry, the requested cachelog does not exist.','2010-08-28 11:48:04'),(744,'Show statistics','2010-08-28 11:48:04'),(745,'Age','2010-08-28 11:48:04'),(747,'Location','2010-08-28 11:48:04'),(748,'MiniMap-Zoom','2010-08-28 11:48:04'),(749,'Report this cache','2010-08-28 11:48:04'),(750,'Reported caches','2010-08-28 11:48:04'),(751,'File:','2010-08-28 11:48:04'),(752,'Please give the picture a name!','2010-08-28 11:48:04'),(753,'Add picture for Geocaches %1','2010-08-28 11:48:04'),(754,'Add picture for Logentry %1','2010-08-28 11:48:04'),(755,'Edit picture for Geocaches %1','2010-08-28 11:48:04'),(756,'Edit picture for Logentry %1','2010-08-28 11:48:04'),(757,'Name:','2010-08-28 11:48:04'),(758,'Give the picture a name!','2010-08-28 11:48:04'),(759,'After click to upload, it can take a while, until the next page is been shown.','2010-08-28 11:48:04'),(760,'This picture is a spoiler - dont show a thumbnail.','2010-08-28 11:48:04'),(761,'Upload','2010-08-28 11:48:04'),(762,'Only the following picture formats are allowed: %1. We recommend JPEG for photos.','2010-08-28 11:48:04'),(763,'The file size of the pictures must not exeed %1 KB. We recommend 640x480 pixel of picture size.','2010-08-28 11:48:04'),(764,'Report for %1 submitted','2010-08-28 11:48:04'),(765,'Reason:','2010-08-28 11:48:04'),(766,'Comment:','2010-08-28 11:48:04'),(767,'Report %1','2010-08-28 11:48:04'),(768,'You have to select a reason for your report!','2010-08-28 11:48:04'),(769,'Comment: (required)','2010-08-28 11:48:04'),(770,'It is required to enter a comment for reporting a cache!','2010-08-28 11:48:04'),(771,'An unknown error occurred. Reporting failed.','2010-08-28 11:48:04'),(772,'Report cache','2010-08-28 11:48:04'),(773,'New','2010-08-28 11:48:04'),(774,'In progress','2010-08-28 11:48:04'),(775,'Done','2010-08-28 11:48:04'),(776,'Cache on private property','2010-08-28 11:48:04'),(777,'Copyright violation','2010-08-28 11:48:04'),(778,'Cache is gone','2010-08-28 11:48:04'),(779,'Other reason','2010-08-28 11:48:04'),(780,'The report is already assigned to another admin!','2010-08-28 11:48:04'),(781,'The report is already assigned to you!','2010-08-28 11:48:04'),(782,'You can not work on this report! Another admin is already pursuing it.','2010-08-28 11:48:04'),(783,'To work on a report you have to assign it to you!','2010-08-28 11:48:04'),(784,'No reported caches','2010-08-28 11:48:04'),(785,'Details for report of ','2010-08-28 11:48:04'),(786,' by ','2010-08-28 11:48:04'),(787,'not assigned','2010-08-28 11:48:04'),(788,'Assign to me','2010-08-28 11:48:04'),(789,'Contact owner','2010-08-28 11:48:04'),(792,'Mark as finished','2010-08-28 11:48:04'),(793,'Action','2010-08-28 11:48:04'),(794,'Prior to reporting a cache to your Opencaching team you should try to contact the owner, to solve possible problems immediate user to user. This does not apply for caches violating the Opencaching terms of use in a way, that requires immediate action of an Opencaching administrator.','2010-08-28 11:48:04'),(795,'Do not separately display this picture (used in HTML description etc.)','2010-08-28 11:48:04'),(796,'No information on user details found.','2010-08-28 11:48:04'),(797,'Coordinates','2010-08-28 11:48:04'),(798,'Geokrets','2010-08-28 11:48:04'),(799,'Details','2010-08-28 11:48:04'),(801,'User details','2010-08-28 11:48:04'),(802,'My profile details','2010-08-28 11:48:04'),(803,'The following additional information is stored in your userprofile:','2010-08-28 11:48:04'),(805,'Error while saving.','2010-08-28 11:48:04'),(806,'Illegal characters found in','2010-08-28 11:48:04'),(807,'Field values too long in','2010-08-28 11:48:04'),(808,'Original values were restored.','2010-08-28 11:48:04'),(809,'visible','2010-08-28 11:48:04'),(810,'invisible','2010-08-28 11:48:04'),(811,'internal','2010-08-28 11:48:04'),(812,'(*) New reports','2010-08-28 11:48:04'),(814,'User statistics','2010-08-28 11:48:04'),(815,'show','2010-08-28 11:48:04'),(817,'The geocache was locked by an administrator because it did not follow the Opencaching terms of use. If you wish to unlock it, contact us using the \"report cache\"-link. Please choose \"other\" as reason and explain shortly what you have changed to make the listing compliant to our terms of use. Thank you!','2010-08-28 11:48:04'),(818,'/sql/static-data/data.sql has been changed with last CVS checkout.<br /> Before you change translastions, update database with data.sql!<br /> &nbsp;','2010-08-28 11:48:04'),(819,'Sorry, the Geocache is locked and can not be viewed.','2010-08-28 11:48:04'),(821,'Locked, visible','2010-08-28 11:48:04'),(822,'Locked, invisible','2010-08-28 11:48:04'),(823,'Last modified','2010-08-28 11:48:04'),(826,'-- Please select --','2010-08-28 11:48:04'),(827,'Adoptions','2010-08-28 11:48:04'),(828,'Date','2010-08-28 11:48:04'),(829,'Yes, i\'ve read and understand the <a href=\"articles.php?page=impressum#tos\">terms of use</a> of Opencaching.de','2010-08-28 11:48:04'),(830,'To complete the adoption, you have to submit this form.<br /> With submitting this form you are the responsible owner of this Geocache.','2010-08-28 11:48:04'),(831,'<strong>%1</strong> offered you this Geocache for adoption at %2.','2010-08-28 11:48:04'),(832,'Thank you for adopting <strong>%1</strong>.','2010-08-28 11:48:04'),(833,'Commit the adoption of %1','2010-08-28 11:48:04'),(834,'There are no caches that can be adopted by you at the moment.','2010-08-28 11:48:04'),(835,'Adopt now','2010-08-28 11:48:04'),(836,'Geocaches the owner offers you for adoption','2010-08-28 11:48:04'),(837,'Yes, i\'ve read and understand the above and agree with it.','2010-08-28 11:48:04'),(839,'Offer <b>%1</b> for adoption','2010-08-28 11:48:04'),(840,'You have no users invited to adopt your cache.','2010-08-28 11:48:04'),(841,'Reject adoption','2010-08-28 11:48:04'),(842,'List of users you offered %1 for adoption','2010-08-28 11:48:04'),(843,'Username unknown','2010-08-28 11:48:04'),(844,'You cannot adopt your own cache!','2010-08-28 11:48:04'),(845,'Sorry, you have to read and accept the above to proceed!','2010-08-28 11:48:04'),(846,'Sorry, you have to read and accept the terms of use to proceed!','2010-08-28 11:48:04'),(847,'This rules ensures that your password cannot be guessed by an automated script.','2010-08-28 11:48:04'),(849,'Not all characters are allowed. You may only use latin-European letters, 0-9 and .-_ @=)(/\\&amp;*+~#.','2010-08-28 11:48:04'),(850,'Do not use dictionary words like \'master\'','2010-08-28 11:48:04'),(851,'Do not use common geocaching words','2010-08-28 11:48:04'),(852,'Do not use parts of your username, name or email','2010-08-28 11:48:04'),(853,'Between 6 and 60 chars of length','2010-08-28 11:48:04'),(854,'Verify that your password matches the following criteria:','2010-08-28 11:48:04'),(855,'Your password did not pass our security check.','2010-08-28 11:48:04'),(856,'Montenegro','2010-08-28 11:48:04'),(857,'Serbia','2010-08-28 11:48:04'),(858,'* If the user explicitly logged out after page visit or last login <br /> is older than 90 days, the last login cannot be determined.','2010-08-28 11:48:04'),(859,'Manage User','2010-08-28 11:48:04'),(860,'Sure?','2010-08-28 11:48:04'),(861,'Disable (and lock all geocaches owned)','2010-08-28 11:48:04'),(862,'Unknown','2010-08-28 11:48:04'),(863,'Last known login:','2010-08-28 11:48:04'),(864,'Active geocaches:','2010-08-28 11:48:04'),(865,'Total hidden:','2010-08-28 11:48:04'),(866,'Log entries:','2010-08-28 11:48:04'),(867,'User active:','2010-08-28 11:48:04'),(868,'Date created:','2010-08-28 11:48:04'),(869,'View useraccount details','2010-08-28 11:48:04'),(870,'Useraccount details','2010-08-28 11:48:04'),(871,'E-Mail:','2010-08-28 11:48:04'),(872,'Waypoint download','2010-08-28 11:48:04'),(873,'News approve','2010-08-28 11:48:04'),(874,'Do not show','2010-08-28 11:48:04'),(875,'Terrain','2010-08-28 11:48:04'),(876,'Difficulty','2010-08-28 11:48:04'),(877,'Send this waypoint to GPS device:','2010-08-28 11:48:04'),(882,'Current top ratings','2010-08-28 11:48:04'),(884,'%1 Recommendations in the last 30 days','2010-08-28 11:48:04'),(885,'You can find more recommendations &gt;<a href=\"tops.php\">here</a>&lt;.','2010-08-28 11:48:04'),(887,'Last&nbsp;login:','2010-08-28 11:48:04'),(888,'Within the last month','2010-08-28 11:48:04'),(889,'1 to 6 months ago','2010-08-28 11:48:04'),(890,'6 to 12 months ago','2010-08-28 11:48:04'),(891,'1 to 2 years ago','2010-08-28 11:48:04'),(892,'The user account has been disabled.','2010-08-28 11:48:04'),(893,'A new activation mail has been sent.','2010-08-28 11:48:04'),(894,'of','2010-08-28 11:48:04'),(900,'Donations','2010-08-28 11:48:04'),(902,'Text','2010-08-28 11:48:04'),(905,'OC-Waypoint','2010-08-28 11:48:04'),(906,'Terms of use','2010-08-28 11:48:04'),(907,'Our Team','2010-08-28 11:48:04'),(914,'Nature protection area','2010-08-28 11:48:04'),(915,'Scan complete','2010-08-28 11:48:04'),(916,'Current file:','2010-08-28 11:48:04'),(921,'Info','2010-08-28 11:48:04'),(922,'INTERNAL_LANG','2010-08-28 11:48:04'),(923,'The compilation of the template faild. This should be a temporary failure. Please try again in some minutes.','2010-08-28 11:48:04'),(933,'Scan source codes','2010-08-28 11:48:04'),(954,'Default','2010-08-28 11:48:04'),(1059,'There already exists an account with that username.','2010-08-28 11:48:04'),(1060,'Problems with login','2010-08-28 11:48:04'),(1061,'Terms of use and legal information','2010-08-28 11:48:04'),(1062,'Page performance:','2010-08-28 11:48:04'),(1063,'Page creation:','2010-08-28 11:48:04'),(1097,'D/T','2010-08-28 11:48:04'),(1123,'Cachename','2010-08-28 11:48:04'),(1141,'N','2010-08-28 11:48:04'),(1142,'S','2010-08-28 11:48:04'),(1143,'E','2010-08-28 11:48:04'),(1144,'W','2010-08-28 11:48:04'),(1146,'Kilometer','2010-08-28 11:48:04'),(1164,'Some more items found...','2010-08-28 11:48:04'),(1165,'city, cachename or waypoint','2010-08-28 11:48:04'),(1166,'Show link to this map','2010-08-28 11:48:04'),(1206,'km','2010-08-28 11:48:04'),(1208,'h','2010-08-28 11:48:04'),(1269,'Map','2010-08-28 11:48:04'),(1272,'Switch to full screen','2010-08-28 11:48:04'),(1275,'Main menu','2010-08-28 11:48:04'),(1278,'Editor','2010-08-28 11:48:04'),(1279,'&lt;html&gt;','2010-08-28 11:48:04'),(1292,'Setting smilies is not supported','2010-08-28 11:48:04'),(1296,'Only the following picture formats are allowed: %1.','2010-08-28 11:48:04'),(1297,'at (time)','2010-08-28 11:48:04'),(1298,'The following list is generated automatically by the given recommendations of the users. You can find more informations on regional classification in the %1Wiki</a>.<br /> <br /> The numbers in the list below means:<br /> <img src=\"images/rating-star.gif\" border=\"0\" alt=\"Recommendations\" /> Number of users that recommend this cache<br /> <img src=\"resource2/%2/images/log/16x16-found.png\" width=\"16\" height=\"16\" border=\"0\" alt=\"Found\" /> Checks = Number of time the cache was found<br /> Index tries to take the number of recommendations and founds in an order to show \'the best\' geocache first.<br /> <img src=\"images/tops-formula.png\" border=\"0\" alt=\"Formula\" />','2010-08-28 12:03:52'),(1299,'File upload failed!','2010-08-29 17:44:48'),(1300,'XML file could not be loaded!','2010-08-29 17:44:53'),(1301,'SQL Export','2010-08-29 17:45:41'),(1302,'XML Download','2010-08-29 17:45:41'),(1303,'XML Import','2010-08-29 17:45:41'),(1304,'XML file containing the translations:','2010-08-29 17:45:41'),(1305,'Check the following languages in the XML file:','2010-08-29 17:45:41'),(1306,'Scan file','2010-08-29 17:45:41'),(1307,'Source code changed, text no longer used','2010-08-29 17:45:41'),(1308,'New translation','2010-08-29 17:45:41'),(1309,'Modified translation','2010-08-29 17:45:41'),(1310,'old','2010-08-29 17:45:41'),(1311,'Toggle all','2010-08-29 17:45:41'),(1312,'Commit','2010-08-29 17:45:41'),(1315,'Date:','2010-09-06 22:30:43'),(1316,'Log-entry:','2010-09-06 22:30:43'),(1317,'passwort to log:','2010-09-06 22:30:44'),(1319,'Invalid password!','2010-09-06 22:30:49'),(1322,'New log-entry','2010-09-06 22:30:56'),(1323,'Type of log-entry:','2010-09-06 22:30:56'),(1326,'Recommendations:','2010-09-06 22:31:00'),(1327,'A recommendation can only be made with a \"found\" or \"attended\" log!','2010-09-06 22:31:00'),(1328,'This cache is one of my recommendations.','2010-09-06 22:31:00'),(1329,'Alternatively, you can withdraw a <a href=\"mytop5.php\">existing recommendation</a>.','2010-09-06 22:31:00'),(1330,'You have given %1 of %2 possible recommendations.','2010-09-06 22:31:00'),(1331,'Dangers','2010-09-07 19:19:30'),(1332,'Infrastructure','2010-09-07 19:19:30'),(1333,'Waypoints','2010-09-07 19:19:30'),(1334,'General','2010-09-07 19:19:30'),(1335,'Time','2010-09-07 19:19:30'),(1336,'Seasonal','2010-09-07 19:19:30'),(1337,'Listing','2010-09-07 19:19:30'),(1338,'Tools needed','2010-09-07 19:19:30'),(1339,'Preparation needed','2010-09-07 19:19:31'),(1340,'Persons','2010-09-07 19:19:31'),(1341,'Transportation','2010-09-07 19:19:31'),(1342,'Properties','2010-09-07 19:19:31'),(1343,'Restrictions / Preconditions','2010-09-07 19:19:31'),(1344,'Recommendations / Prohibitions','2010-09-07 19:19:31'),(1345,'Only loggable at Opencaching','2010-09-07 19:19:31'),(1346,'Time and effort (optional):','2010-09-07 19:19:44'),(1347,'Of course, this effort can only be estimated and can vary depending on enviromental influences. If you cannot make sufficiently detailed information, fill both fields up with a O (zero).','2010-09-07 19:19:44'),(1348,'Waypoints (optional):','2010-09-07 19:19:44'),(1349,'If the cache was published at another geocaching website, enter the corresponding waypoint here.','2010-09-07 19:19:44'),(1350,'No data will be imported automatically from these listing services.','2010-09-07 19:19:44'),(1351,'Descriptions','2010-09-07 19:19:44'),(1352,'Add description in another language','2010-09-07 19:19:44'),(1353,'Your description contains at least one link to a picture hosted on geocaching.com!','2010-09-07 19:19:44'),(1354,'To prevent any problems with geocaching.com we want to please you to upload all linked pictures to %1 as well and link the pictures in the HTML code to these on %1','2010-09-07 19:19:44'),(1355,'Upload a picture','2010-09-07 19:19:44'),(1356,'Listed since:','2010-09-07 19:20:29'),(1357,'This cache is yours','2010-09-07 19:20:29'),(1358,'You found this cache','2010-09-07 19:20:29'),(1359,'You havn\'t found this cache, yet','2010-09-07 19:20:29'),(1360,'This cache stores a GeoKrety','2010-09-07 19:20:29'),(1361,'This cache has %1 recommandations','2010-09-07 19:20:29'),(1362,'Edit log entry for the cache %1','2010-09-07 20:18:59'),(1363,'Type of log-enrty','2010-09-07 20:18:59'),(1364,'JavaScript is disabled in your browser, you can enter text only. To use HTML, or the editor, please enable JavaScript.','2010-09-07 20:18:59'),(1365,'New cache','2010-09-07 20:19:00'),(1366,'Owner:','2010-09-07 20:19:00'),(1367,'Cachetype:','2010-09-07 20:19:00'),(1368,'Size:','2010-09-07 20:19:00'),(1369,'Coordinates:','2010-09-07 20:19:00'),(1370,'Rating:','2010-09-07 20:19:00'),(1371,'Difficulty:','2010-09-07 20:19:00'),(1372,'Terrain:','2010-09-07 20:19:00'),(1373,'Time effort:','2010-09-07 20:19:00'),(1374,'Notice','2010-09-07 20:19:00'),(1376,'Hidden since:','2010-09-07 20:19:00'),(1377,'(leave blank for no password)','2010-09-07 20:19:00'),(1378,'Please note the <a href=\"articles.php?page=cacheinfo#logpw\" target=\"_blank\">description</a>','2010-09-07 20:19:00'),(1379,'Less','2010-09-07 20:19:02'),(1380,'Search for caches','2010-09-07 20:19:02'),(1381,'JavaScript is not activated, you cannot use the above options (hide caches .. sort results) - basic search works nevertheless.','2010-09-07 20:19:02'),(1382,'Sorting of result:','2010-09-07 20:19:02'),(1383,'Last log','2010-09-07 20:19:02'),(1384,'Show recommendation from other users first','2010-09-07 20:19:02'),(1386,'Hide following caches:','2010-09-07 20:19:02'),(1387,'My owned','2010-09-07 20:19:02'),(1388,'My finds','2010-09-07 20:19:02'),(1389,'My ignored','2010-09-07 20:19:02'),(1391,'Inactive','2010-09-07 20:19:02'),(1392,'Cache attributes:','2010-09-07 20:19:02'),(1396,'Miles','2010-09-07 20:19:02'),(1397,'Seamiles','2010-09-07 20:19:02'),(1399,'Postal code:','2010-09-07 20:19:02'),(1400,'City:','2010-09-07 20:19:02'),(1404,'Logtype:','2010-09-07 20:19:02'),(1405,'error while loading the page','2010-09-07 20:19:03'),(1406,'In an attempt to create the page, an error has occurred. If you pass through a hyperlink on our side and the problem persists do not hesitate to contact us by email.','2010-09-07 20:19:03'),(1408,'Page:','2010-09-07 20:19:03'),(1411,'are you sure that this log entry shall be removed?','2010-09-07 20:19:03'),(1412,'do you want to send {log_user_name} a note?','2010-09-07 20:19:03'),(1413,'Remove log entry','2010-09-07 20:19:03'),(1414,'date is invalid','2012-08-26 09:10:00'),(1415,'only for found logs','2010-09-07 20:19:03'),(1416,'Submit a new cache','2010-09-07 20:19:04'),(1417,'If this is your first cache on %1, be sure to check out the <a href=\"articles.php?page=cacheinfo\">description</a> of the individual fields.','2010-09-07 20:19:04'),(1418,'Distance:','2010-09-07 20:19:04'),(1419,'The effort is of course only be estimated and can vary depending on environmental influences. If you can not make sufficiently detailed information, write 0 (zero) in both fields. (See also: <a href=\"articles.php?page=cacheinfo#time\" target=\"_blank\">description</a>)','2010-09-07 20:19:04'),(1420,'Language:','2010-09-07 20:19:04'),(1421,'You can add more descriptions in other languages publishing the cache.','2010-09-07 20:19:04'),(1422,'Short description:','2010-09-07 20:19:04'),(1423,'Description:','2010-09-07 20:19:04'),(1425,'Additional note, will be shown encrypted:','2010-09-07 20:19:05'),(1426,'You can add additional pictures after creating the cache.','2010-09-07 20:19:05'),(1427,'Publication:','2010-09-07 20:19:05'),(1428,'Publish now','2010-09-07 20:19:05'),(1429,'Publish on','2010-09-07 20:19:05'),(1430,'Do not publish now.','2010-09-07 20:19:05'),(1431,'I have read and agree to the <a href=\"articles.php?page=impressum#tos\" target=\"_blank\">Opencaching.de Terms of Service</a> and the <a href=\"articles.php?page=impressum#datalicense\" target=\"_blank\">Opencaching.de Datalicense</a>','2010-09-07 20:19:05'),(1432,'Info: Your log entry has been removed by the cache owner.','2010-09-07 20:19:05'),(1433,'Selection of city','2010-09-07 20:19:05'),(1434,'Total of %1 cities matched','2010-09-07 20:19:05'),(1435,'For the search criterion no clear result was found. Please choose the desired location:','2010-09-07 20:19:05'),(1436,'Add log-entry for the cache %1','2010-09-07 20:19:06'),(1437,'Cachename is invalid','2010-09-07 20:19:06'),(1438,'The used coordinates are invalid.','2010-09-07 20:19:06'),(1439,'The entered time is invalid.','2010-09-07 20:19:06'),(1440,'The distance you have entered is invalid. Format aa.aaa','2010-09-07 20:19:06'),(1441,'The cache-status does not fit to your publishing options','2010-09-07 20:19:06'),(1442,'Choose both valuations!','2010-09-07 20:19:06'),(1443,'No pictures available','2010-09-07 20:19:06'),(1444,'%1 caches<span style=\"%2\"> matched</span>','2010-09-07 20:19:07'),(1445,'Result %1 to %2 (as zip)','2010-09-07 20:19:07'),(1446,'this description was created on another Opencaching-webserver and can only be deleted there.','2010-09-07 20:19:07'),(1447,'the cache description has been deleted','2010-09-07 20:19:07'),(1448,'delete this cache-description','2010-09-07 20:19:07'),(1451,'Please do not use any images that are hosted on geocaching.com. Upload your fotos instead on our server as well.','2010-09-07 20:19:08'),(1452,'Encrypted note:','2010-09-07 20:19:08'),(1453,'Do you really want to delete this description of your cache &quot;{cachename}&quot;','2010-09-07 20:19:08'),(1454,'Yes, delete cache description','2010-09-07 20:19:08'),(1455,'Submit cache','2010-09-07 20:19:09'),(1456,'Format:&nbsp;DD-MM-YYYY','2010-09-07 20:19:09'),(1457,'Some errors occurred, please check the marked fields.','2010-09-07 20:19:09'),(1458,'Your chosen coordinated are invalid','2010-09-07 20:19:09'),(1459,'The entered distance is invalid, Format: aa.aaa','2010-09-07 20:19:09'),(1460,'Invalid date, format:DD-MM-JJJJ','2010-09-07 20:19:09'),(1461,'The cache can only be adopted if you agree our terms of use.','2010-09-07 20:19:09'),(1463,'No cache-type is chosen.','2010-09-07 20:19:09'),(1464,'No cache-size is chosen.','2010-09-07 20:19:09'),(1466,'Your cache is successfully added to the database. You will be redirected to the cache page, now.','2010-09-07 20:19:09'),(1467,'Select','2010-09-07 20:19:09'),(1468,'(internal error) the description is not available.','2010-09-07 20:19:09'),(1469,'(internal error) it already exists a description for this language.','2010-09-07 20:19:09'),(1471,'There already exists a description in this language','2010-09-07 20:19:09'),(1473,'Are you sure to remove your log entry?','2010-09-10 23:08:21'),(1475,'A database command could not be performed.','2010-09-11 01:38:44'),(1476,'Edit cache <a href=\"viewcache.php?cacheid={cacheid}\">{name}</a>','2010-09-11 01:38:44'),(1477,'offer for adoption','2010-09-11 01:38:44'),(1478,'State:','2010-09-11 01:38:44'),(1479,'Waypoint search:','2010-09-11 01:38:47'),(1480,'Country sites','2010-09-11 01:38:47'),(1482,'Waypoints:','2010-09-11 01:38:49'),(1483,'#time_suffix_label#','2010-09-11 01:38:49'),(1486,'If your browser does not support automatic forwarding please click here.','2010-09-11 01:38:50'),(1489,'EN','2010-09-11 01:38:51'),(1490,'Password:','2010-09-11 01:38:53'),(1491,'Edit cache description for <a href=\"viewcache.php?cacheid={cacheid}\">{cachename}</a>','2010-09-11 01:38:53'),(1494,'Add','2010-09-11 01:38:55'),(1495,'Enter a name, please!','2010-09-11 02:13:32'),(1496,'Fill out the text field, please!','2010-09-11 02:13:32'),(1497,'You have to check at least one field!','2010-09-11 02:13:32'),(1498,'Longitude must be a number!\\nFormat: hh° mm.mmm','2010-09-11 02:13:32'),(1499,'Latitude must be a number!\\nFormat: hh° mm.mmm','2010-09-11 02:13:32'),(1500,'The maximum distance must be a number!','2010-09-11 02:13:32'),(1501,'The distance must range between 0 and 9999.','2010-09-11 02:13:32'),(1502,'Enter the postal code, please!','2010-09-11 02:13:32'),(1503,'Enter the city, please!','2010-09-11 02:13:32'),(1504,'Enter the owner, please!','2010-09-11 02:13:32'),(1505,'Enter the username, please!','2010-09-11 02:13:32'),(1506,'also listed at GC.com','2010-09-11 02:13:32'),(1507,'The selected output format is unknown!','2010-09-11 02:13:33'),(1508,'The search operation could not be executed, please reenter the search data.','2010-09-11 02:13:33'),(1509,'Find','2010-09-11 02:13:33'),(1512,'The postal code could not be found.','2010-09-11 02:13:33'),(1513,'The city could not be found.','2010-09-11 02:13:33'),(1514,'There are no coordinates available for the selected city','2010-09-11 02:13:33'),(1516,'The entered text is invalid.','2010-09-11 02:13:33'),(1517,'The entered text contains more than 50 words.','2010-09-11 02:13:33'),(1518,'All countries','2010-09-11 02:13:33'),(1521,'This cache has been created on another Opencaching website. The cache can only be edited there.','2010-09-11 02:13:37'),(1522,'Save options','2010-09-11 02:13:38'),(1523,'Edit options','2010-09-11 02:13:38'),(1524,'Type','2010-09-11 02:13:38'),(1525,'Last logs','2010-09-11 02:13:38'),(1526,'Downloads','2010-09-11 02:13:38'),(1527,'Results on this page:','2010-09-11 02:13:38'),(1529,'With the download you accept the <a href=\"articles.php?page=impressum#tos\">terms of use</a> from opencaching.de.&nbsp;&nbsp;','2010-09-11 02:13:38'),(1530,'This log entry has been created on another Opencaching website. The cache can only be edited there.','2010-09-11 02:17:13'),(1531,'This description has been created on another Opencaching website. The cache can only be edited there.','2010-09-11 02:17:19'),(1532,'The owner of the cache has written the following comment to you:','2010-09-11 02:21:06'),(1533,'For virtual and webcam caches, the cache size has to be -no container-!','2010-09-11 02:26:04'),(1537,'Your HTML code will be changed again by a special filter. This is necessary to avoid dangerous HTML-tags, such as &lt;script&gt;. A list of allowed HTML tags, you can find <a href=\"articles.php?page=htmltags\">here</a>','2010-09-11 02:55:48'),(1538,'Language','2010-09-11 02:56:20'),(1539,'Didn\\\'t find','2010-09-12 22:26:15'),(1541,'Only at night','2010-09-12 22:52:28'),(1542,'Hyperlink to another caching portal only','2010-09-12 22:52:28'),(1543,'Letterbox (needs stamp)','2010-09-12 22:52:28'),(1544,'Dangerous area','2010-09-12 22:52:28'),(1545,'This geocache can be found at night only - it is a so-called <i>night cache</i>. There may be reflectors which have to be flashlighted and will point to the hiding place, or other special night-caching mechanisms.','2010-09-12 22:52:28'),(1546,'This geocache is listed at Opencaching only. This attribute will enable users of other geocaching platforms to find interesting OC caches quickly.','2010-09-12 22:52:28'),(1548,'There is a stamp in the cache for stamping your personal logbook, and the cache’s logbook will be stamped with your personal stamp. Take care not to mix up stamps and to leave the cache’s stamp in the cache! Frequently letterboxes can be found without GPS, maybe with a compass and paces from a location - add the \"without GPS\" attribute for those.','2010-09-12 22:52:28'),(1549,'The cache is located within a dangerous area. Use this attribute to mark non-obvious dangers, like high-traffic roads, steep ground or falling rocks. Security measures should be taken or the cache be omitted, especially when geocaching with children, large groups or at unfavourable weather conditions.','2010-09-12 22:52:28'),(1550,'Active railway nearby','2010-09-12 23:11:48'),(1551,'Cliff / Rocks','2010-09-12 23:11:48'),(1552,'Hunting','2010-09-12 23:11:48'),(1553,'Thorns','2010-09-12 23:11:48'),(1554,'Ticks','2010-09-12 23:11:48'),(1555,'Abandoned mines','2010-09-12 23:11:48'),(1556,'Poisonous plants','2010-09-12 23:11:48'),(1557,'Dangerous animals','2010-09-12 23:11:48'),(1558,'Parking area nearby','2010-09-12 23:11:48'),(1559,'Public transportation','2010-09-12 23:11:48'),(1560,'Drinking water nearby','2010-09-12 23:11:48'),(1561,'Public restrooms nearby','2010-09-12 23:11:48'),(1562,'Public phone nearby','2010-09-12 23:11:48'),(1563,'First aid available','2010-09-12 23:11:48'),(1564,'Near the parking area','2010-09-12 23:11:48'),(1565,'Long walk','2010-09-12 23:11:48'),(1566,'Swamp, marsh or wading','2010-09-12 23:11:48'),(1567,'Hilly area','2010-09-12 23:11:48'),(1568,'Some climbing (no gear needed)','2010-09-12 23:11:48'),(1569,'Swimming required','2010-09-12 23:11:48'),(1570,'Point of interest','2010-09-12 23:11:48'),(1571,'Moving target','2010-09-12 23:11:48'),(1572,'Webcam','2010-09-12 23:11:48'),(1573,'Wihin enclosed rooms (caves, buildings etc.)','2010-09-12 23:11:48'),(1575,'Without GPS (letterboxes, cistes, compass juggling ...)','2010-09-12 23:11:48'),(1576,'Access or parking fee','2010-09-12 23:11:48'),(1577,'Overnight stay necessary','2010-09-12 23:11:48'),(1578,'Available 24 hours','2010-09-12 23:11:48'),(1579,'Only available at specified times','2010-09-12 23:11:48'),(1580,'By day only','2010-09-12 23:11:48'),(1581,'Not at high water level','2010-09-12 23:11:48'),(1582,'All seasons','2010-09-12 23:11:48'),(1583,'Breeding season / protected nature','2010-09-12 23:11:48'),(1584,'Snow-proof hiding place','2010-09-12 23:11:48'),(1585,'Special equipment','2010-09-12 23:11:48'),(1586,'Compass','2010-09-12 23:11:48'),(1587,'Flashlight','2010-09-12 23:11:48'),(1588,'Climbing gear','2010-09-12 23:11:48'),(1589,'Cave equipment','2010-09-12 23:11:48'),(1590,'Diving equipment','2010-09-12 23:11:48'),(1591,'Watercraft','2010-09-12 23:11:48'),(1592,'Aircraft','2010-09-12 23:11:48'),(1593,'Investigation','2010-09-12 23:11:48'),(1594,'Puzzle / Mystery','2010-09-12 23:11:48'),(1595,'Arithmetical problem','2010-09-12 23:11:48'),(1596,'Other cache type','2010-09-12 23:11:48'),(1597,'Ask owner for start conditions','2010-09-12 23:11:48'),(1598,'Suited for children','2010-09-12 23:11:48'),(1599,'There are active railroads nearby. Please be careful, keep a safe distance and cross the rails only at level crossings etc.!','2010-09-12 23:11:48'),(1600,'There are cliffs or dangerous rocks nearby. Beware of falling rocks at the lower side, and be careful at the upper side of cliffs - especially with children and while mountain biking. It can be very dangerous to take a steep slope towards a cliff, because you may not notice in time where the former ends and the latter starts.','2010-09-12 23:11:48'),(1601,'The geocache is placed within a hunting ground. At twilight and in the dark, a flashlight or headlight should always be used for security reasons. Be considerate when meeting hunters.','2010-09-12 23:11:48'),(1602,'There are thorns near the cache. Wear appropriate clothes.','2010-09-12 23:11:48'),(1603,'There are seasonably many ticks in this area. It is recommended to wear long trousers and to check yourself for ticks after geocaching. There are risk maps for <i>tick-borne encephalitis</i> in the internet, e.g. for Germany at sites like www.meningitis.de (look for FSME there).','2010-09-12 23:11:48'),(1604,'In the water','2010-09-12 23:18:21'),(1605,'This cache can be done both at daylight and at night, and on all weekdays.','2010-09-12 23:27:38'),(1606,'This cache can only be done at certain times of day - see the cache description for more details. For example, the cache may be placed in an area with restricted opening hours.','2010-09-12 23:27:38'),(1607,'This cache shoud be attempted during daylight only. For example, the area may be dangerous and contain cliffs or abysses. Or using flashlights may be inadvisable because it would look suspicious within a residential area.','2010-09-12 23:27:38'),(1608,'This cache can be done only at low or normal water level. At flood or high-tide it is not accessible.','2010-09-12 23:27:38'),(1609,'This cache can be found the whole year round, while difficulty may depend on seasons. Specify difficulty for <i>good</i> conditions.','2010-09-12 23:27:38'),(1610,'Don’t seek this cache during animal breeding season! Please indicate in the cache description which time of year must be avoided. Also, pay attention to the local terms and signs regarding nature protection.','2010-09-12 23:27:38'),(1611,'This cache can be found even after heavy snowing. All stages and the geocache are hidden in a snow-safe way: they will not be covered by fallen snow an not by snow-piles created by snow-clearing vehicles.','2010-09-12 23:27:38'),(1612,'You will need special equipment which is not specified by other attributes, e.g. a laser pointer, walkie-talkies or a car jack.','2010-09-12 23:27:38'),(1613,'A compass is required.','2010-09-12 23:27:38'),(1614,'A flashlight is required for finding this cache. Don’t forget spare batteries!','2010-09-12 23:27:38'),(1615,'For this cache, you will need climbing equipment and the knowledge how to use it properly. If you are a beginner, don’t do it alone but use the support of an experienced climber or mountaineer.','2010-09-12 23:27:38'),(1616,'This geocache is hidden in a cave, and you should use appropriate equipment to access it. Beware: Even small caves may confront you with unforeseen problems and dangers, like thunder storms (water!) or a sprained ankle. Have advice first from cave-experienced people! Also take care of protected nature; e.g. bat places must not be disturbed.','2010-09-12 23:27:38'),(1617,'You will need diving equipment to find this geocache. The water depth of the cache location is specified in the description. Please note that secure diving requires special training. Without diving experience, you may search this cache in company of a diving teacher.','2010-09-12 23:27:38'),(1618,'This cache usually can be found only using a watercraft. Swimming is impossible because of the distance or currents. See the cache description for more details.','2010-09-12 23:27:38'),(1619,'You must investigate additional information before you can seek this cache. This commonly applies to puzzle/mystery caches.','2010-09-12 23:27:38'),(1620,'Puzzles or mysteries have to be solved before or while seeking this cache.','2010-09-12 23:27:38'),(1621,'Before or while seeking this cache, arithmetical problems must be solved which go beyond very basic calculations.','2010-09-12 23:27:38'),(1622,'This is none of the standard, pre-defined types of cache. Use this attribute for special, unusual caches.','2010-09-12 23:27:38'),(1623,'Before doing this cache, you must ask the owner for the starting conditions. E.g. the cache may be linked to certain events at varying dates.','2010-09-12 23:27:38'),(1624,'This geocache is suitable for children. All challenges can be solved by child in the age of 10 to 12 years and the terrain has no risks (like highways, abysms). There should be a large geocache container with trading items inside and the challanges are interesting.','2010-09-12 23:27:38'),(1625,'This cache leads into a (former) mining area. There may be dangers by collapsing adits, or you may need to enter adits. Be careful and use appropriate equipment, especially in the dark. Old mines may be covered by historic preservation.','2010-09-12 23:39:51'),(1626,'There are poisonous plants near the cache. Take care and prevent children and dogs from touching or eating them.','2010-09-12 23:39:51'),(1627,'The area is inhabited by possibly dangerous animals, e.g. rabies areas, venomous snakes, scorpions or bears.','2010-09-12 23:39:51'),(1628,'A nearby parking area is situated as starting point for doing this cache. If no free parking is available, add the \"access or parking fee\" attribute.','2010-09-12 23:39:51'),(1629,'This cache is located outside of urban areas and has a public transport station nearby. Don’t set this attribute for geocaches in urban areas that are commonly equipped with public transportation.','2010-09-12 23:39:51'),(1630,'There is drinking water along the trail or near the cache. This attribute is useful especially for planning event caches, longer hikes or caches at probably dirty locations like caves.','2010-09-12 23:39:51'),(1631,'There are public restrooms along the way or near the cache. This attribute is useful especially for planning event caches or extensive multicaches.','2010-09-12 23:39:51'),(1632,'There is a public phone along the way or near the cache. Especially for event caches you should enquire for nearby phones and set this attribute if applicable.','2010-09-12 23:39:51'),(1633,'There is a first aid station, call box, mountain rescue or similar arrangement near the cache. This attribute is useful especially in demanding areas, like climbing caches, cave caches, high mountains or at the water. Check if you can add emergency phone numbers (like a mountain rescue) to your cache listing.','2010-09-12 23:39:51'),(1634,'The geocache is located close to a parking area, only a few steps away - it’s a \"cache and dash\".','2010-09-12 23:39:51'),(1635,'This cache requires a long walk - more than 5 km round trip. In the mountains and other steep areas, the distance for a \"long walk\" may be shorter. Walking shoes and appropriate equipment are recommended.','2010-09-12 23:39:51'),(1636,'This cache requires passing swampy or marshy ground or wading through shallow water. Wear appropriate clothes. After rainfall, the terrain may be very demanding or not passable at all.','2010-09-12 23:39:51'),(1637,'One or more ascents lie between you and the cache.','2010-09-12 23:39:51'),(1638,'This cache requires some climbing and you may have to use your hands, but you won’t need climbing gear. Be very careful during rainy weather or before thunderstorms!','2010-09-12 23:39:51'),(1639,'This cache requires crossing a river or a lake. The water is steep.','2010-09-12 23:39:51'),(1640,'There is a point of interest at the cache, like a nice scenic overlook or a larger castle ruin. This place is worth visiting it even without a geocache nearby.','2010-09-12 23:39:51'),(1641,'This geocache is moving around. For example, the owner might regularly move the cache from one place to another, or the finders will do this task and post new coordinates in their log entries. The owner must update coordinates in the cache description after each move.','2010-09-12 23:39:51'),(1642,'There is a webcam at the target location. You must record a webcam picture of your visit and include it in your \"found\" log entry. There may be additional requirements like a geocaching banner on the photo. The webcam’s address is included in the cache description, and it must be publicly accessible, i.e. no user account or similar is required.','2010-09-12 23:39:51'),(1643,'This geocache is not hidden in the open air, but within a building, a cave or similar.','2010-09-12 23:39:51'),(1644,'This cache or one of the stages is placed underwater. You may have to enter the water, swim or dive.','2010-09-12 23:39:51'),(1645,'This cache can be found without a GPS device. No additional coordinates are used besides of the starting coordinates.','2010-09-12 23:39:51'),(1646,'You must pay an access or parking fee to access this cache, e.g. if the cache is located within a theme park. If there are alternative free parking areas nearby, please include them in the cache description. Please note our current terms of use regarding \"commercial geocaches\".','2010-09-12 23:39:51'),(1647,'This cache cannot be done within a single day or a single night. You will have to visit the location for more than one time, or you must stay overnight. Preparation time is not included in this calculation, but only the time on site.','2010-09-12 23:39:51'),(1648,'A newsentry was created on opencaching','2010-09-13 00:14:41'),(1650,'The called page does not exist!','2010-09-13 00:14:45'),(1652,'Redirect - opencaching','2010-09-13 00:14:51'),(1653,'Do you really want to delete the saved search?','2010-09-13 00:15:15'),(1654,'State','2010-09-13 00:15:18'),(1655,'Set state','2010-09-13 00:15:22'),(1657,'to','2010-09-14 01:25:28'),(1658,'Route','2010-09-15 15:04:49'),(1659,'Cachesize:','2010-09-15 15:05:09'),(1660,'Link','2010-09-19 00:23:51'),(1661,'Open','2010-09-19 00:23:51'),(1662,'Add to favorites...','2010-09-19 00:23:51'),(1663,'Caches displayed:','2010-09-19 00:23:51'),(1664,'Time to load:','2010-09-19 00:23:51'),(1665,'Sec.','2010-09-19 00:23:51'),(1666,'Only show Geocaches with the following properties:','2010-09-19 00:23:51'),(1667,'Cachetype','2010-09-19 00:23:51'),(1668,'Container','2010-09-19 00:23:51'),(1669,'Hide','2010-09-19 00:23:51'),(1670,'My owns','2010-09-19 00:23:51'),(1672,'GC listings','2010-09-19 00:23:51'),(1673,'Rating','2010-09-19 00:23:51'),(1674,'Min. recommendations:','2010-09-19 00:23:51'),(1678,'Enter a search text, please!','2010-09-19 00:23:51'),(1680,'Waypoint %1 not found!','2010-09-27 00:19:52'),(1681,'D/T:','2010-09-27 00:19:52'),(1683,'Error: Unable to download the search result (HTTP error code %1)','2010-09-27 00:19:52'),(1684,'Error: Unable to download the search result. The data was not available on the server.','2010-09-27 00:19:52'),(1685,'There are %1 Geocaches in the selected area, matching the filter options. Please zoom in to display the caches.','2010-09-27 00:19:52'),(1687,'Create a logentry','2010-10-03 19:23:36'),(1688,'Edit logentry','2010-10-03 19:23:36'),(1689,'Remove logentry','2010-10-03 19:23:36'),(1690,'Edit cache','2010-10-03 19:23:36'),(1691,'Add description','2010-10-03 19:23:36'),(1692,'Edit description','2010-10-03 19:23:36'),(1693,'Remove description','2010-10-03 19:23:36'),(1694,'Select city','2010-10-03 19:23:36'),(1695,'Show search result','2010-10-03 19:23:36'),(1696,'Result','2010-10-03 19:23:36'),(1697,'Description - Create a cache','2010-10-03 19:23:36'),(1698,'Add picture','2010-10-03 19:23:36'),(1699,'Message','2010-10-03 19:23:36'),(1700,'There is no google maps key registered for this domain.','2010-10-03 22:21:58'),(1701,'Attention! This Geocache is &quot;<span class=\"errormsg\">%1</span>&quot;!</strong> There is no physical container at the specified (or to be determined) coordinates. In the interest of the place it should not be necessarily to search!','2010-10-06 22:27:56'),(1702,'Attention! This Geocache is &quot;<span class=\"errormsg\">%1</span>&quot;!</strong> The geocache itself or parts of it are missing or there are other issues that make a successful search impossible. In the interest of the place it should not be necessarily to search!','2010-10-06 22:27:56'),(1703,'You have attended this event!','2010-10-06 22:28:13'),(1704,'You have already found this cache!','2010-10-06 22:28:13'),(1705,'<i>Obsolete: This attribute cannot be assigned to new caches, because it does not fit our current terms of use.</i><br />This cache is listed at multiple geocaching sites, and the cache description at Opencaching may be incomplete. Links to the description at the external site(s) should be included in the listing. Please note that descriptions and status of multiple-listed caches have to be equally maintained at all sites including Opencaching, according to our current terms of use.','2010-10-18 21:30:14'),(1706,'This OC node','2010-10-18 21:30:30'),(1707,'Other OC nodes','2010-10-18 21:30:30'),(1708,'The next events in %1','2010-10-21 22:54:23'),(1709,'Geocaches with most ratings in the last %2 days in %1.','2010-10-21 22:54:23'),(1710,'Newest caches in %1','2010-10-21 22:54:23'),(1711,'You need additional %1 finds, to make another recommendation.','2010-11-29 21:04:17'),(1713,'You have recommended this cache.','2010-11-29 21:04:55'),(1714,'Revoke the recommendation','2010-11-29 21:04:55'),(1717,'Please select!','2010-12-05 00:00:40'),(1718,'Results on this page','2010-12-05 00:00:57'),(1722,'Do you really want to delete this entry?','2010-12-05 00:01:46'),(1723,'Do you really want to remove this recommendation?','2010-12-05 00:01:49'),(1724,'Waylength:','2010-12-05 00:02:00'),(1725,'Download as...','2010-12-05 00:02:00'),(1726,'remove log entry for <a href=\"viewcache.php?cacheid={cacheid}\">{cachename}</a>','2010-12-06 20:02:27'),(1727,'Add new cache description to <a href=\"viewcache.php?cacheid={cacheid}\">{name}</a>','2010-12-18 23:12:16'),(1728,'Send to GPS device','2010-12-19 22:25:21'),(1729,'Geokrety history','2010-12-19 22:25:36'),(1730,'New forum topcis (%1)','2010-12-19 22:25:46'),(1731,'Teamblog','2011-02-04 19:51:15'),(1732,'Forum','2011-02-04 19:51:16'),(1733,'Geokrety','2011-02-04 19:51:16'),(1735,'For Events: The date of event!','2011-02-12 20:06:37'),(1736,'User-ID:','2011-02-12 20:08:11'),(1737,'List','2011-02-12 20:08:14'),(1738,'Event date:','2011-02-12 20:08:14'),(1739,'Finds: %1 Hidden: %2','2011-04-04 20:44:22'),(1740,'<User not known>','2011-04-04 20:44:22'),(1745,'Default logo','2011-04-24 22:18:08'),(1747,'Alternative logo by nybbler','2011-04-24 22:18:08'),(1752,'Alternative logo','2011-04-24 22:23:38'),(1753,'Slimline','2011-04-24 22:23:38'),(1754,'Red logo, slimline','2011-04-24 22:23:38'),(1755,'Slimline, without statistics','2011-04-24 22:23:38'),(1756,'Slimline red, without statistics','2011-04-24 22:23:38'),(1757,'Round corners','2011-05-20 23:46:04'),(1758,'The account is already activated. Please try to <a href=\"login.php\">login</a>.<br /> If you cannot login, please read the following page: <a href=\"%1\">problems with login</a>','2011-05-20 23:48:09'),(1759,'Note:','2011-05-20 23:48:12'),(1760,'Include a coordinate in the note','2011-05-20 23:48:12'),(1761,'The note is not visible to other users. The note and the optional coordinate will be included in GPX-file downloads and sent to the GPS device.','2011-05-20 23:48:12'),(1763,'Your browser has rejected our cookie.<br /> You can find more informations about this topic in the <a href=\"%1\">Opencaching help</a>.','2011-05-20 23:48:15'),(1764,'Personal cache note','2011-05-20 23:48:29'),(1765,'This geocache is probably placed within a nature protection area! See %1here</a> for further informations, please.','2011-05-20 23:48:29'),(1766,'This geocache is probably placed within the following protected areas (%1Info</a>):','2011-05-20 23:48:29'),(1767,'Quick translation','2011-07-10 18:02:33'),(1768,'Disable','2011-07-10 18:02:33'),(1769,'Enable - new','2011-07-10 18:02:33'),(1770,'Enable - all','2011-07-10 18:02:33'),(1771,'Text Download (new)','2011-07-10 18:02:33'),(1772,'Text Download (all)','2011-07-10 18:02:33'),(1773,'Text Import','2011-07-10 18:02:33'),(1774,'Text file containing the translations:','2011-07-10 18:02:33'),(1775,'Child waypoints','2011-07-10 18:02:37'),(1776,'Waypoint type:','2011-07-10 18:02:37'),(1777,'Please select type','2011-07-10 18:02:37'),(1778,'Coordinate:','2011-07-10 18:02:37'),(1779,'Download GPX file (max. 500 caches)','2011-07-10 18:02:57'),(1780,'Add waypoint','2011-07-10 18:55:32'),(1781,'Add new','2011-07-10 18:55:32'),(1782,'Delete waypoint','2011-07-10 18:55:33'),(1783,'Edit waypoint','2011-07-10 18:55:33'),(1788,'Parking','2011-07-15 20:08:12'),(1789,'Stage or reference point','2011-07-15 20:08:12'),(1790,'Additional waypoints','2011-07-15 22:33:19'),(1791,'Add a waypoint','2011-07-15 22:33:19'),(1792,'Additional waypoints can be entered to make searching easier, for example by pointing to a suitable parking location or start of a path (the waypoint\'s description may contain more information). They may also specify the stages of a multicache. The waypoints are shown on the map when the cache is selected, are included in GPX file downloads and will be sent to the GPS device.','2011-07-15 22:33:19'),(1793,'No waypoints available','2011-07-15 22:33:33'),(1794,'The additional waypoints are shown on the map when the cache is selected, are included in GPX file downloads and will be sent to the GPS device.','2011-07-15 22:34:44'),(1796,'Published on:','2012-07-24 19:16:00'),(1797,'Changelog','2012-08-08 14:16:00'),(1798,'Operator Association','2012-08-08 14:16:00'),(1799,'Only available during specified seasons','2012-10-29 14:28:00'),(1800,'This cache can be done at certain seasons only - see the cache description for more details. For example, the cache may be placed in a corn labyrinth, which only exists from bloom to harvest season.','2012-10-29 14:28:00'),(1801,'Help','2012-11-09 19:28:00'),(1802,'Warning: This report is already assigned to another admin. Consult him first before you assume the report!','2013-01-30 16:26:00'),(1803,'nano','2012-11-10 15:51:00'),(1804,'Datalicense','2013-02-09 18:28:52'),(1806,'Please select only one of the delete/disable options!','2013-02-09 17:34:01'),(1807,'By submitting I accept the <a href=\"articles.php?page=impressum#tos\" target=\"_blank\">Opencaching.de Terms of Service</a> and the <a href=\"articles.php?page=impressum#datalicense\" target=\"_blank\">Opencaching.de Datalicense</a>','2013-02-09 19:12:41'),(1808,'I\'ve read and understand the <a target=\"_blank\" href=\"articles.php?page=dsb\">privacy statement</a>, the <a target=\"_blank\" href=\"articles.php?page=impressum#tos\">terms of service</a> and the <a href=\"articles.php?page=impressum#datalicense\" target=\"_blank\">Datalicense</a> and accept them.','2013-02-09 19:06:41'),(1809,'You have to accept the privacy statement, terms of service and the datalicense to register at %1.','2013-02-09 19:06:41'),(1810,'When downloading this file, you accept our <a href=\"articles.php?page=impressum#tos\">terms of use</a> and <a href=\"articles.php?page=impressum#datalicense\" target=\"_blank\">Datalicense</a>.','2013-02-09 19:12:30'),(1811,'Disable (and lock all geocaches owned) and remove all foreign licensed content','2013-02-09 19:28:12'),(1812,'ID','2013-02-09 19:28:46'),(1813,'Owner','2013-02-09 19:28:46'),(1814,'Reporter','2013-02-09 19:28:46'),(1815,'You have to check that you are sure!','2013-02-09 17:34:01'),(1816,'cache description was removed because owner declined content license','2013-02-09 17:34:01'),(1817,'User status was successfully changed.','2013-02-09 17:34:01'),(1818,'Spoiler','2013-02-11 11:40:00'),(1819,'After saving, you may need to press the reload button in your browser to see the selected picture in your profile.','2013-02-15 00:48:04'),(1820,'You can now <a href=\"login.php\">login</a> with the new password.','2013-02-14 00:48:04'),(1821,'OC.de new','2013-02-15 00:48:04'),(1822,'OC.de new, slimline','2013-02-15 00:48:04'),(1823,'OC.de new, without statistics','2013-02-15 00:48:04'),(1824,'Verify e-mail address','2013-02-17 18:48:04'),(1825,'One or more e-mails could not be delivered to the address you specified in your user profile:','2013-02-17 18:48:04'),(1826,'Please confirm that this email address is correct, or enter a new one.','2013-02-17 18:48:04'),(1827,'Enter new email address','2013-02-17 18:48:04'),(1828,'Confirm this email address','2013-02-17 18:48:04'),(1829,'Mark e-mail address as invalid','2013-02-17 18:48:04'),(1830,'data license mail was not delivered','2013-02-17 18:48:04'),(1831,'Admins','2013-02-19 05:40:04'),(1832,'Rights','2013-02-19 05:40:04'),(1833,'Admin rights can be granted and revoked by a system administrator with database access.','2013-02-19 05:40:04'),(1834,'declined data license','2013-02-19 05:40:04'),(1835,'The user account has been disabled, because the user declined the <a href=\"articles.php?page=impressum#datalicense\">data license</a>. Cache descriptions, log texts and pictures have been deleted.','2013-02-19 05:40:04'),(1838,'Username or email address:','2013-02-19 05:40:04'),(1839,'You must select a search to overwrite.','2013-02-23 19:00:04'),(1840,'Link to this map view:','2013-02-24 00:00:00'),(1841,'Your Internet Explorer is too old to display the map. Please upgrade at least to version 7, better 8.','2012-10-11 00:00:00'),(1842,'Go to home coordinates','2013-02-24 00:00:00'),(1843,'Switch to small map','2013-02-24 00:00:00'),(1844,'Between 1 and 500 caches must be displayed for download.','2013-02-24 00:00:00'),(1846,'Select waypoint type','2013-02-25 19:00:04'),(1847,'Invalid coordinate','2013-02-25 19:00:04'),(1848,'Registered since:','2013-02-25 19:00:04'),(1849,'Map is being updated','2013-02-28 00:00:00'),(1850,'was not found (with the selected settings)','2013-02-28 00:00:00'),(1851,'Map display with Microsoft Internet Explorer is slow and restricted to %1 geocaches. Use another browser for better performance.','2013-02-28 00:00:00'),(1852,'Geocaches found, nearest first:','2013-02-28 00:00:00'),(1853,'Places found via Google:','2013-02-28 00:00:00'),(1855,'Traditional','2013-02-28 00:00:00'),(1857,'Virtual','2013-02-28 00:00:00'),(1859,'Event','2013-02-28 00:00:00'),(1860,'Quiz','2013-02-28 00:00:00'),(1861,'Math/Physics','2013-02-28 00:00:00'),(1862,'Moving','2013-02-28 00:00:00'),(1863,'Drive-in','2013-02-28 00:00:00'),(1865,'Loading map','2013-02-28 00:00:00'),(1866,'Instructions','2013-02-28 00:00:00'),(1867,'Menu option \'Map\' shows:','2013-03-03 00:00:00'),(1868,'small map','2013-03-03 00:00:00'),(1869,'fullscreen map','2013-03-03 00:00:00'),(1870,'Show overview map:','2013-03-03 00:00:00'),(1871,'Maximum caches on map<br />(%1-%2, 0=automatic):','2013-03-03 00:00:00'),(1872,'Cache icons:','2013-03-03 00:00:00'),(1873,'classic OC','2013-03-03 00:00:00'),(1874,'OKAPI style','2013-03-03 00:00:00'),(1875,'You must be logged in to change map settings.','2013-03-03 00:00:00'),(1876,'Map data &copy; <a href=\"http://www.openstreetmap.org/copyright\" target=\"_blank\">OpenStreetMap</a> contributors','2013-03-03 00:00:00'),(1877,'tiles provided by <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a>','2013-03-03 00:00:00'),(1878,'Map data &copy; <a href=\"http://www.openstreetmap.org/copyright\" target=\"_blank\">OpenStreetMap</a> and <a href=\"http://www.thunderforest.com/opencyclemap/\" target=\"_blank\">OpenCycleMap</a> contributors','2013-03-03 00:00:00'),(1879,'Cache reports','2013-03-03 00:00:00'),(1880,'Vandalism','2013-03-03 00:00:00'),(1881,'Revert Vandalism','2013-03-03 00:00:00'),(1882,'User \'%1\' is unknown','2013-03-08 00:00:00'),(1883,'%1 has not listed any caches','2013-03-08 00:00:00'),(1884,'Restore cache listings of %1','2013-03-08 00:00:00'),(1885,'User \'%1\' is not disabled. You can view recorded changes, but not revert them.','2013-03-08 00:00:00'),(1886,'You did not select any caches.','2013-03-08 00:00:00'),(1887,'No saved data is available for these caches.','2013-03-08 00:00:00'),(1888,'You must select a date.','2013-03-08 00:00:00'),(1889,'Use your browser\'s \'back\' button to try again.','2013-03-08 00:00:00'),(1890,'You must choose the listing elements to be restored.','2013-03-08 00:00:00'),(1891,'You did not say that you are sure.','2013-03-08 00:00:00'),(1892,'Please select the listings to restore','2013-03-08 00:00:00'),(1893,'modified','2013-03-08 00:00:00'),(1894,'The user changed one or more of these caches today, therefore you cannot revert changes. This can be done not before tomorrow.','2013-03-08 00:00:00'),(1895,'none','2013-03-08 00:00:00'),(1896,'Go on','2013-03-08 00:00:00'),(1897,'to the date selection','2013-03-08 00:00:00'),(1898,'Please select the date from which on all changes are to be reverted.<br />The listing will be reset to the contents it had on that day at 00:00:00.','2013-03-08 00:00:00'),(1900,'Changes','2013-03-08 00:00:00'),(1901,'Warning: If you revert any owner-made listing changes of <em>today</em>, your revert will be final. It cannot be corrected / undone afterwards. Only reverts of coords &amp; country, logs and pictures will be logged in this case, so all other changes will not be comprehensible. Therefore <span style=\"text-decoration:underline\">it is strongly recommended to revert vandalism not before the next day!</span>','2013-03-08 00:00:00'),(1902,'coordinates and country','2013-03-08 00:00:00'),(1903,'name, settings, attributes and hide-date','2013-03-08 00:00:00'),(1904,'GC/NC waypoints','2013-03-08 00:00:00'),(1905,'description(s) incl. pictures','2013-03-08 00:00:00'),(1906,'logs incl. pictures','2013-03-08 00:00:00'),(1907,'nothing','2013-03-08 00:00:00'),(1908,'Excluded from restore: cache status, OConly attribute, additional waypoints, log password, preview picture status','2013-03-08 00:00:00'),(1909,'simulate','2013-03-08 00:00:00'),(1910,'You are root admin and can override the warnings. Take care!','2013-03-08 00:00:00'),(1911,'The following cache listings would have been reset to the state before %1','2013-03-08 00:00:00'),(1912,'The following cache listings have been reset to the state before %1','2013-03-08 00:00:00'),(1913,'Restore','2013-03-08 00:00:00'),(1914,'_all','2013-03-08 00:00:00'),(1915,'deleted','2013-03-08 00:00:00'),(1916,'archived','2013-03-08 00:00:00'),(1919,'New log pictures','2013-02-23 19:00:04'),(1920,'D','2013-03-03 00:00:00'),(1921,'T','2013-03-03 00:00:00'),(1922,'click on spoiler to display','2013-03-03 00:00:00'),(1923,'for','2013-03-03 00:00:00'),(1924,'The cache has %1 %2additional waypoints%3.','2013-03-03 00:00:00'),(1925,'The cache has an %2additional waypoint%3.','2013-03-03 00:00:00'),(1926,'Path','2013-03-03 00:00:00'),(1927,'Final','2013-03-03 00:00:00'),(1928,'Show %1preview pictures</a><br />(% of map area, 0=off):','2013-03-03 00:00:00'),(1929,'Preview picture for map &ndash; is shown when this cache is selected on the map.<br />You can have only <em>one</em> preview picture per cache.','2013-03-03 00:00:00'),(1930,'Max. %1 caches can be displayed with Microsoft Internet Explorer.','2013-03-03 00:00:00'),(1940,'Picture gallery','2013-02-23 19:00:04'),(1941,'Dates show the date of picture upload, wich can differ from the log date.','2013-02-23 19:00:04'),(1942,'Maximum one picture per day and user is displayed here. The small gallery on the start page is additionally limited to one picture per cache and day.','2013-02-23 19:00:04'),(1943,'All pictures are copyrighted and subject to the <a href=\"articles.php?page=impressum#datalicense\">Opencaching.de data license</a>.','2013-02-23 19:00:04'),(1944,'Show picture stats and gallery','2013-02-23 19:00:04'),(1945,'Log pictures','2013-02-23 19:00:04'),(1946,'Log pictures: %1','2013-02-23 19:00:04'),(1947,'Log pictures of %1','2013-02-23 19:00:04'),(1948,'Your log pictures:','2013-02-23 19:00:04'),(1949,'Your latest log pictures:','2013-02-23 19:00:04'),(1950,'In your <a href=\"mydetails.php\">profile settings</a> you can choose if your log pictures stat and gallery is visible for other users.','2013-02-23 19:00:04'),(1952,'Public profile','2013-02-23 19:00:04'),(1953,'You did not upload any log pictures yet.','2013-02-23 19:00:04'),(1954,'Pictures marked as spoiler are not shown; therefore the number of pictures on this page can be smaller than in the profile statistics.','2013-02-23 19:00:04'),(1955,'Other information','2013-02-23 19:00:04'),(1956,'Log picture','2013-02-23 19:00:04'),(1957,'\"Spoiler\" pictures which show details of the stash should not be visible here. If you encounter an open visible spoiler, you may contact the logger by the e-mail button in his profile and ask him to mark it as spoiler.','2013-02-23 19:00:04'),(1958,'Back to the cache description','2013-02-23 19:00:04'),(1960,'Page','2013-02-23 19:00:04'),(1962,'at','2013-02-23 19:00:04'),(1963,'About Opencaching','2013-02-23 19:00:04'),(1964,'Cache descriptions, log texts and pictures have been deleted, because the account was disabled before transition to the <a href=\"articles.php?page=impressum#datalicense\">new data license</a>.','2013-02-23 19:00:04'),(1965,'cache description was removed because the owner\'s account was inactive when the <a href=\'articles.php?page=impressum#datalicense\'>new content license</a> was launched','2013-02-23 19:00:04'),(1966,'as of','2013-02-23 19:00:04'),(1967,'all log entries &copy; their authors','2013-02-23 19:00:04'),(1968,'more','2013-02-23 19:00:04'),(1969,'Only the <span class=\"public-setting\">green entries</span> are visible in your <a href=\"viewprofile.php\">public profile</a>.','2013-02-23 19:00:04'),(1970,'Date / time:','2013-02-23 19:00:04'),(1971,'date or time is invalid','2013-02-23 19:00:04'),(1973,'Generally, spoiler pictures should not be logged. In the case that en exception from this rule makes sense, e.g. to document your finding or problems with the stash, please mark the picture als spoiler so that it won\'t appear in galleries.','2013-02-23 19:00:04'),(1974,'If you do not see any E-Mail, please check the spam folder of your mailbox.','2013-02-23 19:00:04'),(1975,'Do not use easy-to-guess number and letter sequences like \'123456\' or \'qwerty\'','2013-02-23 19:00:04'),(1976,'currently not available','2013-02-23 19:00:04'),(1977,'Password for \'found\' logs:','2013-02-23 19:00:04'),(1978,'only for attended-logs','2013-02-23 19:00:04'),(1979,'Contact reporter','2013-02-23 19:00:04'),(1980,'For \'Found\' and \'Not found\' logs: Date and (optional) time of the cache search.','2013-02-23 19:00:04'),(1982,'Page not found','2013-04-25 23:00:00'),(1983,'Cache database','2013-04-25 23:00:00'),(1984,'Here you can find a lot of individual caches.','2013-04-25 23:00:00'),(1985,'The newest caches:','2013-04-25 23:00:00'),(1986,'Here you can discuss, improve or ask questions.','2013-04-25 23:00:00'),(1987,'The newest forumposts:','2013-04-25 23:00:00'),(1988,'Any time there are news to post, you\'ll find them here.','2013-04-25 23:00:00'),(1989,'The newest blogposts:','2013-04-25 23:00:00'),(1990,'Here you get tutorials, howtos and any information about Geocaching and Opencaching.','2013-04-25 23:00:00'),(1991,'The newest wiki articles:','2013-04-25 23:00:00'),(1992,'Not found? Contact us using','2013-04-25 23:00:00'),(1993,'Opencaching at Facebook','2013-04-25 23:00:00'),(1994,'Opencaching at Google+','2013-04-25 23:00:00'),(1995,'Opencaching at Twitter','2013-04-25 23:00:00'),(1996,'The visited website <b>%1</b> does not exists, we found the following suitable pages:','2013-04-25 23:00:00'),(1998,'OK','2013-04-25 23:00:00'),(1999,'Show','2013-04-25 23:00:00'),(2000,'My last log','2013-04-25 23:00:00'),(2001,'Own logs','2013-04-25 23:00:00'),(2002,'Geocaches found','2013-04-25 23:00:00'),(2003,'Geocaches logged','2013-04-25 23:00:00'),(2004,'%1 of these are active','2013-04-25 23:00:00'),(2006,'Deleted by','2013-04-25 23:00:00'),(2007,'User data','2013-04-25 23:00:00'),(2008,'OKAPI Applications','2013-04-25 23:00:00'),(2009,'OKAPI Apps','2013-04-25 23:00:00'),(2010,'Large map','2013-04-25 23:00:00'),(2011,'without logs','2013-04-25 23:00:00'),(2012,'with 5 logs','2013-04-25 23:00:00'),(2013,'with 10 logs','2013-04-25 23:00:00'),(2014,'with all logs','2013-04-25 23:00:00'),(2015,'Safari Cache','2013-04-25 23:00:00'),(2016,'This geocache can be found at different places. The places to look for are explained in the cache description. They must be located \"away from home\" and exist for a considerable period of time, so that they can be re-visited later. There is no container and no logbook; instead the find must be documented by a photo and noting the coordinates.','2013-04-25 23:00:00'),(2017,'Only virtual caches can be safari caches.','2013-04-25 23:00:00'),(2023,'Locked','2013-04-25 23:00:00'),(2025,'%2 has archived %1','2013-04-25 23:00:00'),(2026,'%2 has maintainted %1','2013-04-25 23:00:00'),(2027,'%2 has disabled %1','2013-04-25 23:00:00'),(2028,'%2 has locked %1','2013-04-25 23:00:00'),(2029,'OC team comment','2013-04-25 23:00:00'),(2030,'Maintenance logs','2013-04-25 23:00:00'),(2031,'To change the state, you need to {a}log</a> the new state.','2013-05-12 22:00:00'),(2035,'%1 has archived the geocache','2013-04-25 23:00:00'),(2036,'%1 has maintained the geocache','2013-04-25 23:00:00'),(2037,'%1 has disabled the geocache','2013-04-25 23:00:00'),(2038,'%1 has locked the geocache','2013-04-25 23:00:00'),(2039,'%1 has locked and hidden the geocache','2013-04-25 23:00:00'),(2040,'Deleted text:','2013-04-25 23:00:00'),(2041,'total','2013-04-25 23:00:00'),(2042,'The following text is displayed in your <a href=\"viewprofile.php\">public profile</a>:','2013-04-25 23:00:00'),(2043,'no text entered yet','2013-04-25 23:00:00'),(2045,'The current filter settings have been permamently saved.','2013-05-14 19:00:00'),(2046,'Watcher','2013-05-14 13:48:04'),(2047,'Ignorer','2013-05-14 13:48:04'),(2048,'Maintenance log','2013-05-14 13:48:04'),(2049,'Page visit','2013-05-14 13:48:04'),(2050,'JavaScript is disabled in your browser, you can enter (HTML) text only. To use the editor, please enable JavaScript.','2013-05-14 13:48:04'),(2051,'Recommended on','2013-05-14 13:48:04'),(2052,'Nature protection','2013-04-25 23:00:00'),(2053,'Withdraw adoption offer','2013-04-25 23:00:00'),(2055,'Other reports for this cache','2013-05-27 22:00:00'),(2056,'Report date','2013-05-27 22:00:00'),(2057,'Reason','2013-05-27 22:00:00'),(2058,'Deleted logs','2013-05-27 22:00:00'),(2059,'Cache history','2013-05-27 22:00:00'),(2060,'Cache code:','2013-05-27 22:00:00'),(2061,'Cache not found','2013-05-27 22:00:00'),(2062,'Status changes','2013-05-27 22:00:00'),(2063,'Changed by','2013-05-27 22:00:00'),(2065,'Guest','2013-04-25 23:00:00'),(2067,'Status','2013-05-28 16:51:40'),(2068,'since June 2013','2013-05-28 16:51:40'),(2069,'since deletion date February 2012','2013-05-28 16:51:40'),(2070,'One ore more emails to this user could not be delivered. It might be a good idea to additionally log comments on the user\'s geocaches, and/or use alternative contact addresses like a message board account or another geocaching platform.','2013-05-28 16:51:40'),(2071,'This cache has been \"temporarily unavailable\" for more than %1 months now; therefore it is being archived automatically. The owner may decide to maintain the cache and re-enable the listing.','2013-05-28 16:51:40'),(2072,'This event took place more than five weeks ago; therefore it is being archived automatically. The owner may re-enable the listing if it should stay active for some exceptional reason.','2013-05-28 16:51:40'),(2073,'This user account is disabled.','2013-05-28 16:51:40'),(2074,'Adoptions_','2013-05-28 16:51:40'),(2075,'since September 2012','2013-05-28 16:51:40'),(2076,'From Owner','2013-05-28 16:51:40'),(2077,'To Owner','2013-05-28 16:51:40'),(2078,'Maintenance','2013-05-28 16:51:40'),(2079,'Show details','2013-05-28 16:51:40'),(2080,'only active caches','2013-05-28 16:51:40'),(2081,'Finds','2013-05-28 16:51:40'),(2083,'NEW','2013-04-25 23:00:00'),(2084,'show archived','2013-04-25 23:00:00'),(2085,'hide archived','2013-04-25 23:00:00'),(2086,'unknown search type','2013-04-25 23:00:00'),(2087,'Show on map','2013-04-25 23:00:00'),(2088,'Search options','2013-04-25 23:00:00'),(2089,'disabled[pl]','2013-04-25 23:00:00'),(2090,'archived[pl]','2013-04-25 23:00:00'),(2091,'Test for and fix inconsistencies in database tables','2013-04-25 23:00:00'),(2092,'You submitted more than %1 identical logs. Please make sure that you are entering the date of your cache visit, not the current date - also when \"late logging\" old finds.','2013-04-25 23:00:00'),(2093,'Wrong log dates can impair several OC functions like searching by last log date. Also, the owner and other caches may think that the cache has been currently found (date and type of the last log are shown in the owner\'s caches list!), which can adversely affect cache maintenance and lead to more DNFs.','2013-04-25 23:00:00'),(2094,'You found %1 caches until now.','2013-04-25 23:00:00'),(2095,'This log already exists - you tried to submit it twice!','2013-04-25 23:00:00'),(2096,'%2 has activated %1','2013-04-25 23:00:00'),(2097,'%1 has activated the geocache','2013-04-25 23:00:00'),(2098,'converted from HTML','2013-04-25 23:00:00'),(2099,'unknown search option','2013-04-25 23:00:00'),(2100,'no coordinates available','2013-04-25 23:00:00'),(2101,'Alternatively, you can visit %1 and enter the following code manually:','2013-04-25 23:00:00'),(2102,'Before you can login for the first time, you have to activate your account by clicking on the following link:','2013-07-14 22:47:12'),(2103,'Perimeter:','2013-04-25 23:00:00'),(2104,'from coordinates:','2013-04-25 23:00:00'),(2105,'Log entries','2013-04-25 23:00:00'),(2106,'by user:','2013-04-25 23:00:00'),(2107,'in','2013-04-25 23:00:00'),(2108,'All caches','2013-04-25 23:00:00'),(2111,'My caches','2010-09-07 20:19:07'),(2112,'Opencaching','2010-09-07 20:19:07'),(2113,'New Wiki articles','2010-09-07 20:19:07'),(2114,'Cardinal direction:','2010-09-07 20:19:07'),(2115,'New features','2010-09-07 20:19:07'),(2116,'Also notify about newly marked %1OConly%2 caches.','2010-09-07 20:19:07'),(2117,'Do not notify about newly marked %1OConly%2 caches.','2010-09-07 20:19:07'),(2118,'Notify about newly marked %1OConly%2 caches.','2010-09-07 20:19:07'),(2119,'with recommendation','2010-09-07 20:19:07'),(2121,'You have given {curr} of {max} possible recommendations.','2010-09-07 20:19:07'),(2122,'You need additional {anzahl} finds, to make another recommandation.','2010-09-07 20:19:07'),(2123,'A recommendation can only be made within a \"found\"-log!','2010-09-07 20:19:07'),(2125,'Log pictures gallery','2010-09-07 20:19:07'),(2126,'Log history','2010-09-07 20:19:07'),(2127,'Log entries for caches of %1','2010-09-07 20:19:07'),(2128,'Hide own logs','2010-09-07 20:19:07'),(2129,'Show own logs','2010-09-07 20:19:07'),(2130,'Log entries for your geocaches','2010-09-07 20:19:07'),(2131,'If you find a user that wants to adopt your Geocache, fill in the username here and submit. The user will then see this Geocache under My Profile &gt; Adoptions. To complete, the user has to accept our terms of use and commit the adoption.','2010-08-28 11:48:04'),(2132,'You can offer this Geocache to more than one user. The first user committing the adoption will get the new owner of this Geocache. With the adoption, you will give the committing user an unlimited right to use, modifiy, publish and sublicense content of this Geocache.','2010-08-28 11:48:04'),(2133,'Copy EN','2010-08-28 11:48:04'),(2134,'I know what I am doing, do not show this advice again today.','2010-09-07 20:19:07'),(2135,'Show OConly-81 stats','2010-09-07 20:19:07'),(2136,'OConly statistics','2010-09-07 20:19:07'),(2137,'The user has found <b>%1</b> of <b>81</b> theoretically possible terrain/difficulty combinations.','2010-09-07 20:19:07'),(2139,'OConly-81','2010-09-07 20:19:07'),(2140,'Users with OConly-81 statistics:','2010-09-07 20:19:07'),(2141,'OConly-81 statistics:','2010-09-07 20:19:07'),(2142,'inactive','2010-09-07 20:19:07'),(2143,'<b>OConly-81</b> is a new challenge about finding OConly caches under varying conditions, i.e. with different difficulty and terrain ratings. To participate, you can enable the OConly-81 statistics in your <a href=\"mydetails.php\">user profile settings</a>.','2010-09-07 20:19:07'),(2144,'Participants','2010-09-07 20:19:07'),(2146,'Statistics','2010-09-07 20:19:07'),(2147,'Overall terrain and difficulty distribution of active OConly caches:','2010-09-07 20:19:07'),(2148,'... by cache type:','2010-09-07 20:19:07'),(2149,'... by region:','2010-09-07 20:19:07'),(2150,'This geocache is probably placed within the following protection areas:','2011-05-20 23:48:29'),(2151,'Also listed as:','2011-05-20 23:48:29'),(2152,'Loading more log entries ...','2011-05-20 23:48:29'),(2153,'Auto-load log entries','2011-05-20 23:48:29'),(2155,'Social media','2013-08-07 18:30:00'),(2156,'Follow us:','2013-08-07 18:30:00'),(2157,'Join discussions:','2013-08-07 18:30:00'),(2158,'Opencaching Forum','2013-08-07 18:30:00'),(2159,'Google+ Community','2013-08-07 18:30:00'),(2160,'Facebook Group','2013-08-07 18:30:00'),(2161,'Only one account can be created per E-Mail address. First name, last name and country are optional.','2013-08-07 18:30:00'),(2162,'Your log entries','2010-08-28 11:48:04'),(2163,'There are no log entries yet for your geocaches.','2010-08-28 11:48:04'),(2164,'Cache listing {occode} has been modified by {username}','2010-08-28 11:48:04'),(2165,'The cache description of {occode} has been modified by {username}','2010-08-28 11:48:04'),(2166,'The modifications can be checked via vandalism restore function.','2010-08-28 11:48:04'),(2167,'OC Admins','2013-08-24 12:56:09'),(2168,'Newest log entries for caches of %1','2013-08-24 12:56:14'),(2169,'Do you really want to delete this picture?','2013-10-01 18:10:14'),(2170,'Nearby search at geocaching.com','2013-10-02 18:40:04'),(2171,'Please send me mailings about news and campaigns on %1. (max. 2-5 per year)','2013-11-03 10:09:14'),(2172,'Yes, I want to recieve mailings about news and campaigns on %1. (max. 2-5 per year)','2013-11-03 10:09:14'),(2173,'No, I dont\'t want any mailings about news and campaigns on %1.','2013-11-03 10:09:14'),(2174,'Newsletter:','2013-11-03 10:09:14'),(2175,'Disclose my e-mail address by default when sending e-mails to other users.','2015-05-25 19:50:00'),(2176,'Planned events','2013-11-03 10:09:14'),(2177,'Another cache (<a href=\"viewcache.php?wp=%1\">%1</a>) exists at these coords. Maybe you pressed \"submit cache\" twice. To publish a cache with identical coords, enter other coords first, then edit the listing and change coords.','2013-11-03 10:09:14'),(2178,'GC waypoint is invalid, must be GCxxxxx','2013-11-03 10:09:14'),(2179,'Safari caches list','2013-11-03 10:09:14'),(2180,'Add to list','2015-06-17 10:09:14'),(2181,'Add geocache to list','2015-06-17 10:09:14'),(2182,'Add the geocache <b>%1</b> to the following list:','2015-06-17 10:09:14'),(2183,'New cache list','2015-06-17 10:09:14'),(2184,'Invalid name','2015-06-17 10:09:14'),(2185,'public list','2015-06-17 10:09:14'),(2186,'You can maintain your personal cache lists in your <a href=\"mylists.php\">user profile</a>.','2015-06-17 10:09:14'),(2187,'public','2015-06-17 10:09:14'),(2188,'private','2015-06-17 10:09:14'),(2189,'Cache lists','2015-06-17 10:09:14'),(2190,'Since July 2015, all registered Opencaching users can create and publish own geocache lists via their <a href=\"mylists.php\">user profile</a>. The following lists have been published so far:','2015-06-17 10:09:14'),(2191,'Cache list','2015-06-17 10:09:14'),(2192,'There are no lists yet.','2015-06-17 10:09:14'),(2193,'My cache lists','2015-06-17 10:09:14'),(2194,'Do you really want to delete the list \\\'%1\\\'?','2015-06-17 10:09:14'),(2195,'Create new list','2015-06-17 10:09:14'),(2196,'Public lists are displayed in your <a href=\"viewprofile.php?userid=%1\">public user profile</a>, on the <a href=\"cachelists.php\">lists overwiew page</a> and (if enabled) in the cache listings.','2015-06-17 10:09:14'),(2197,'Space-separated list of OC waypoints.','2015-06-17 10:09:14'),(2198,'You may also add caches via \"Add to list\" button in cache listings.','2015-06-17 10:09:14'),(2199,'This is optional, caches may be added to the list later.','2015-06-17 10:09:14'),(2200,'Create list','2015-06-17 10:09:14'),(2201,'Edit cache list','2015-06-17 10:09:14'),(2202,'Add caches:','2015-06-17 10:09:14'),(2203,'Remove caches:','2015-06-17 10:09:14'),(2204,'The following waypoints are invalid and could not be added to the list:','2015-06-17 10:09:14'),(2205,'Show all cache lists','2015-06-17 10:09:14'),(2206,'I want to receive notifications about any logs for caches in this list.','2015-06-17 10:09:14'),(2207,'I am watching this list.','2015-06-17 10:09:14'),(2208,'watch','2015-06-17 10:09:14'),(2209,'do not watch','2015-06-17 10:09:14'),(2210,'Single caches:','2015-06-17 10:09:14'),(2211,'Lists:','2015-06-17 10:09:14'),(2212,'edit','2015-06-17 10:09:14'),(2213,'delete','2015-06-17 10:09:14'),(2214,'do not ignore','2015-06-17 10:09:14'),(2215,'List name:','2015-06-17 10:09:14'),(2216,'By:','2015-06-17 10:09:14'),(2217,'don\'t watch','2015-06-17 10:09:14'),(2218,'Another of your cache lists already has this name.','2015-06-17 10:09:14'),(2219,'minimum length for public lists is 10 characters','2015-06-17 10:09:14'),(2220,'You are still watching this geocache via one or more cache lists.','2015-06-17 10:09:14'),(2221,'Create new cachelist','2015-06-17 10:09:14'),(2222,'visible for all users in cache listings','2013-11-03 10:09:14'),(2223,'semi-public','2013-11-03 10:09:14'),(2224,'listing display','2013-11-03 10:09:14'),(2225,'without Geokrets','2013-11-03 10:09:14'),(2226,'hidden[cachelist]','2013-11-03 10:09:14'),(2227,'Coordinate changes','2013-11-03 10:09:14'),(2228,'Password for sharing:','2013-11-03 10:09:14'),(2229,'List has password; click here to share it','2013-11-03 10:09:14'),(2230,'Own lists','2013-11-03 10:09:14'),(2231,'Bookmarked lists','2013-11-03 10:09:14'),(2232,'Do you really want to unbookmark the list \\\'%1\\\'?','2013-11-03 10:09:14'),(2233,'bookmark','2013-11-03 10:09:14'),(2234,'I have bookmarked this list.','2013-11-03 10:09:14'),(2235,'locked/hidden cache','2013-11-03 10:09:14'),(2236,'Watch:','2010-08-28 11:48:04'),(2237,'Caches:','2010-08-28 11:48:03'),(2238,'Link to share this cache list:','2013-11-03 10:09:14'),(2240,'Chinese','2015-08-18 15:00:00'),(2241,'Thai','2015-08-18 15:00:00'),(2242,'Luxembourgish','2015-08-18 15:00:00'),(2243,'Catalan','2015-08-18 15:00:00'),(2244,'Waypoint:','2010-08-28 11:48:04'),(2245,'without regional reference','2010-08-28 11:48:04'),(2246,'#colonspace#','2010-08-28 11:48:04'),(2247,'User:','2010-08-28 11:48:03'),(2248,'All languages','2010-08-28 11:48:03'),(2249,'Caches in %1','2010-08-28 11:48:03'),(2250,'New caches without %1','2010-08-28 11:48:03'),(2251,'All new logs','2010-08-28 11:48:03'),(2252,'New logs in %1','2010-08-28 11:48:03'),(2253,'New logs without %1','2010-08-28 11:48:03'),(2254,'Please select a language.','2010-08-28 11:48:03'),(2255,'OConly-','2010-08-28 11:48:03'),(2256,'New cache:','2010-08-28 11:48:03'),(2257,'New OConly cache:','2010-08-28 11:48:03'),(2258,'No new log entries.','2010-08-28 11:48:03'),(2259,'{user} has logged your cache \"{cachename}\":','2010-08-28 11:48:03'),(2260,'{user} has logged the cache \"{cachename}\":','2010-08-28 11:48:03'),(2261,'Your watchlist of','2010-08-28 11:48:03'),(2262,'Cache was marked as OConly:','2010-08-28 11:48:03'),(2263,'View description','2010-08-28 11:48:03'),(2264,'Type:','2015-06-17 10:09:14'),(2265,'Name: {cachename} by {owner} Coordinates: {lon} {lat} Status: {status} Condition: {condition} Hidden on: {time} Waypoint: {waypoint} Country: {country} Cache type: {type} Container: {container} D/T: {difficulty}/{terrain} Online: {siteurl}viewcache.php?wp={waypoint} Short description: {shortdesc} Description{htmlwarn}: <===================> {desc} <===================> Additional hint: <===================> {hints} <===================> A|B|C|D|E|F|G|H|I|J|K|L|M N|O|P|Q|R|S|T|U|V|W|X|Y|Z Log entries: {logs} ','2015-06-17 10:09:14'),(2270,'Berlin','2013-11-03 10:09:14'),(2271,'Bremen','2013-11-03 10:09:14'),(2272,'Dresden','2013-11-03 10:09:14'),(2273,'Düsseldorf','2013-11-03 10:09:14'),(2274,'Erfurt','2013-11-03 10:09:14'),(2275,'Hamburg','2013-11-03 10:09:14'),(2276,'Hannover','2013-11-03 10:09:14'),(2277,'Kiel','2013-11-03 10:09:14'),(2278,'Mainz','2013-11-03 10:09:14'),(2279,'Magdeburg','2013-11-03 10:09:14'),(2280,'München','2013-11-03 10:09:14'),(2281,'Potsdam','2013-11-03 10:09:14'),(2282,'Saarbrücken','2013-11-03 10:09:14'),(2283,'Schwerin','2013-11-03 10:09:14'),(2284,'Stuttgart','2013-11-03 10:09:14'),(2285,'Wiesbaden','2013-11-03 10:09:14'),(2286,'Frankfurt am Main','2013-11-03 10:09:14'),(2287,'Dortmund','2013-11-03 10:09:14'),(2288,'Essen','2013-11-03 10:09:14'),(2289,'Leipzig','2013-11-03 10:09:14'),(2290,'Nürnberg','2013-11-03 10:09:14'),(2291,'Bologna','2013-11-03 10:09:14'),(2292,'Bolzano','2013-11-03 10:09:14'),(2293,'Corsica','2013-11-03 10:09:14'),(2294,'Cosenza','2013-11-03 10:09:14'),(2295,'Genova','2013-11-03 10:09:14'),(2296,'Milano','2013-11-03 10:09:14'),(2297,'Napoli','2013-11-03 10:09:14'),(2298,'Palermo','2013-11-03 10:09:14'),(2299,'Roma','2013-11-03 10:09:14'),(2300,'Sardegna','2013-11-03 10:09:14'),(2301,'Udine','2013-11-03 10:09:14'),(2302,'A Coruña','2013-11-03 10:09:14'),(2303,'Albacete','2013-11-03 10:09:14'),(2304,'Alicante','2013-11-03 10:09:14'),(2305,'Almería','2013-11-03 10:09:14'),(2306,'Ávila','2013-11-03 10:09:14'),(2307,'Badajoz','2013-11-03 10:09:14'),(2308,'Barcelona','2013-11-03 10:09:14'),(2309,'Bilbao','2013-11-03 10:09:14'),(2310,'Burgos','2013-11-03 10:09:14'),(2311,'Cáceres','2013-11-03 10:09:14'),(2312,'Cádiz','2013-11-03 10:09:14'),(2313,'Castellón','2013-11-03 10:09:14'),(2314,'Ceuta','2013-11-03 10:09:14'),(2315,'Ciudad Real','2013-11-03 10:09:14'),(2316,'Córdoba','2013-11-03 10:09:14'),(2317,'Cuenca','2013-11-03 10:09:14'),(2318,'Gerona','2013-11-03 10:09:14'),(2319,'Granada','2013-11-03 10:09:14'),(2320,'Guadalajara','2013-11-03 10:09:14'),(2321,'Huesca','2013-11-03 10:09:14'),(2322,'Huelva','2013-11-03 10:09:14'),(2323,'Jaén','2013-11-03 10:09:14'),(2324,'Las Palmas de Gran Canaria','2013-11-03 10:09:14'),(2325,'León','2013-11-03 10:09:14'),(2326,'Lérida','2013-11-03 10:09:14'),(2327,'Logroño','2013-11-03 10:09:14'),(2328,'Lugo','2013-11-03 10:09:14'),(2329,'Madrid','2013-11-03 10:09:14'),(2330,'Málaga','2013-11-03 10:09:14'),(2331,'Melilla','2013-11-03 10:09:14'),(2332,'Murcia','2013-11-03 10:09:14'),(2333,'Ourense','2013-11-03 10:09:14'),(2334,'Oviedo','2013-11-03 10:09:14'),(2335,'Palencia','2013-11-03 10:09:14'),(2336,'Palma de Mallorca','2013-11-03 10:09:14'),(2337,'Pamplona','2013-11-03 10:09:14'),(2338,'Pontevedra','2013-11-03 10:09:14'),(2339,'Salamanca','2013-11-03 10:09:14'),(2340,'San Sebastián','2013-11-03 10:09:14'),(2341,'Santa Cruz de Tenerife','2013-11-03 10:09:14'),(2342,'Santander','2013-11-03 10:09:14'),(2343,'Segovia','2013-11-03 10:09:14'),(2344,'Sevilla','2013-11-03 10:09:14'),(2345,'Soria','2013-11-03 10:09:14'),(2346,'Tarragona','2013-11-03 10:09:14'),(2347,'Teruel','2013-11-03 10:09:14'),(2348,'Toledo','2013-11-03 10:09:14'),(2349,'Valencia','2013-11-03 10:09:14'),(2350,'Valladolid','2013-11-03 10:09:14'),(2351,'Vitoria-Gasteiz','2013-11-03 10:09:14'),(2352,'Zamora','2013-11-03 10:09:14'),(2353,'Zaragoza','2013-11-03 10:09:14'),(2354,'Paris','2013-11-03 10:09:14'),(2355,'Marseille','2013-11-03 10:09:14'),(2356,'Lyon','2013-11-03 10:09:14'),(2357,'Toulouse','2013-11-03 10:09:14'),(2358,'Nice','2013-11-03 10:09:14'),(2359,'Nantes','2013-11-03 10:09:14'),(2360,'Strasbourg','2013-11-03 10:09:14'),(2361,'Montpellier','2013-11-03 10:09:14'),(2362,'Bordeaux','2013-11-03 10:09:14'),(2363,'Lille','2013-11-03 10:09:14'),(2364,'Rennes','2013-11-03 10:09:14'),(2365,'Reims','2013-11-03 10:09:14'),(2366,'Le Havre','2013-11-03 10:09:14'),(2367,'Saint-Étienne','2013-11-03 10:09:14'),(2368,'Toulon','2013-11-03 10:09:14'),(2369,'Bregenz','2013-11-03 10:09:14'),(2370,'Eisenstadt','2013-11-03 10:09:14'),(2371,'Graz','2013-11-03 10:09:14'),(2372,'Innsbruck','2013-11-03 10:09:14'),(2373,'Klagenfurt','2013-11-03 10:09:14'),(2374,'Linz','2013-11-03 10:09:14'),(2375,'Salzburg','2013-11-03 10:09:14'),(2376,'Sankt Pölten','2013-11-03 10:09:14'),(2377,'Wien','2013-11-03 10:09:14'),(2378,'Aarau','2013-11-03 10:09:14'),(2379,'Appenzell','2013-11-03 10:09:14'),(2380,'Herisau','2013-11-03 10:09:14'),(2381,'Liestal','2013-11-03 10:09:14'),(2382,'Basel','2013-11-03 10:09:14'),(2383,'Bern','2013-11-03 10:09:14'),(2384,'Fribourg','2013-11-03 10:09:14'),(2385,'Genève','2013-11-03 10:09:14'),(2386,'Glarus','2013-11-03 10:09:14'),(2387,'Chur','2013-11-03 10:09:14'),(2388,'Delémont','2013-11-03 10:09:14'),(2389,'Luzern','2013-11-03 10:09:14'),(2390,'Neuchâtel','2013-11-03 10:09:14'),(2391,'Lausanne','2013-11-03 10:09:14'),(2392,'Zürich','2013-11-03 10:09:14'),(2500,'north','2013-11-03 10:09:14'),(2501,'north-northeast','2013-11-03 10:09:14'),(2502,'northeast','2013-11-03 10:09:14'),(2503,'east-northeast','2013-11-03 10:09:14'),(2504,'east','2013-11-03 10:09:14'),(2505,'east-southeast','2013-11-03 10:09:14'),(2506,'southeast','2013-11-03 10:09:14'),(2507,'south-southeast','2013-11-03 10:09:14'),(2508,'south','2013-11-03 10:09:14'),(2509,'south-southwest','2013-11-03 10:09:14'),(2510,'southwest','2013-11-03 10:09:14'),(2511,'west-southwest','2013-11-03 10:09:14'),(2512,'west','2013-11-03 10:09:14'),(2513,'west-northwest','2013-11-03 10:09:14'),(2514,'northwest','2013-11-03 10:09:14'),(2515,'north-northwest','2013-11-03 10:09:14'),(2516,'unbookmark','2013-11-03 10:09:14'),(2517,'share public list','2013-11-03 10:09:14'),(2518,'total recommendations','2013-11-03 10:09:14'),(2519,'Gauss-Krüger','2013-11-03 10:09:14'),(2520,'Show inconsistencies','2013-11-03 10:09:14'),(2521,'This table contains some false positives. References from the \"libse\" code (personal cache notes, additional waypoints) are not detected, as well as textes which are passed by variable to translation functions and multiline texts. \"Help\", \"Forum\", \"Teamblog\" and \"Informations\" are referenced in local configuration files. So be very careful before deleting anything.','2013-11-03 10:09:14'),(2522,'OConly','2013-11-03 10:09:14'),(2523,'Official OC logos (up-to-date):','2015-11-24 23:30:00'),(2524,'Stored query','2015-01-20 20:37:00'),(2525,'Alternavite logos (partly outdated):','2015-11-24 22:36:00'),(2526,'found','2013-11-03 10:09:14'),(2527,'not&nbsp;found','2013-11-03 10:09:14'),(2528,'attended','2013-11-03 10:09:14'),(2529,'recommended','2013-11-03 10:09:14'),(2530,'Current new entries','2015-01-20 20:37:00'),(2531,'All new entries','2015-01-20 20:37:00'),(2532,'... by log date','2015-01-20 20:37:00'),(2533,'Good and inappropriate reasons to report a cache','2015-01-20 20:37:00'),(2534,'%1 reports are being processed, %2 reports are pending','2015-01-20 20:37:00'),(2535,'queuing time for new reports: about %1 to %2 days','2015-01-20 20:37:00'),(2536,'Cache list:','2015-06-17 10:09:14'),(2537,'Cache lists:','2015-06-17 10:09:14'),(2538,'Geocache condition:','2015-06-17 10:09:14'),(2539,'not specified','2015-06-17 10:09:14'),(2540,'ok','2015-06-17 10:09:14'),(2541,'needs maintenance','2015-06-17 10:09:14'),(2542,'The geocache needs maintenance.','2015-06-17 10:09:14'),(2543,'The geocache is in good or acceptable condition.','2015-06-17 10:09:14'),(2544,'Select <i>needs maintenance</i> if the geocache was in poor condition at the<br />specified date and in urgent need of maintenance. Please explain why.','2015-06-17 10:09:14'),(2545,'up to date','2015-06-17 10:09:14'),(2546,'outdated','2015-06-17 10:09:14'),(2547,'The geocache description is outdated.','2015-06-17 10:09:14'),(2548,'The geocache description is ok.','2015-06-17 10:09:14'),(2549,'Select <i>is outdated</i> if the geocache search is hampered by outdated information<br />in the description, e.g. the location has severely changed or the description lacks<br />important information which has been added at another geocaching website.<br />Please give details in your log.','2015-06-17 10:09:14'),(2550,'Select <i>is outdated</i> if the geocache search is hampered by outdated information<br />in the description, e.g. because the location has severely changed. Please give<br />details in your log.','2015-06-17 10:09:14'),(2551,'When did you find the geocache?','2015-06-17 10:09:14'),(2552,'When did you abort the cache search?','2015-06-17 10:09:14'),(2553,'This geocache description may be outdated.','2015-06-17 10:09:14'),(2554,'See the log entries for more information.','2015-06-17 10:09:14'),(2555,'See the <span style=\"white-space:nowrap\"><img src=\"resource2/ocstyle/images/log/16x16-listing-outdated.png\"> <a href=\"%1%2%3#logentries\" class=\"systemlink\">log entries</a></span> for more information.','2015-06-17 10:09:14'),(2556,'geocache needs maintenance','2015-06-17 10:09:14'),(2557,'geocache is ok','2015-06-17 10:09:14'),(2558,'description is outdated','2015-06-17 10:09:14'),(2559,'description is ok','2015-06-17 10:09:14'),(2560,'By logging \"Available\", you also confirm that the geocache is in good condition.','2015-06-17 10:09:14'),(2561,'By logging \"Available\", you also confirm that the geocache description is up-to-date.','2015-06-17 10:09:14'),(2562,'You may indicate here what is the current maintenance state of the geocache.','2015-06-17 10:09:14'),(2563,'You may indicate here if the cache description is up-to-date.','2015-06-17 10:09:14'),(2564,'Important:','2015-06-17 10:09:14'),(2565,'The geocache description at Opencaching must be kept up to date! Description changes on other websites must be applied to the Opencaching listing timely.','2015-06-17 10:09:14'),(2566,'last modified on','2015-06-17 10:09:14'),(2567,'Original coordinates:','2015-06-17 10:09:14'),(2568,'New coordinates:','2015-06-17 10:09:14'),(2569,'moved by %1 meters','2015-06-17 10:09:14'),(2570,'moved by %1 km','2015-06-17 10:09:14'),(2571,'Protect old coordinates','2015-06-17 10:09:14'),(2596,'Please confirm:','2015-06-17 10:09:14'),(2597,'Encrypt','2015-06-17 10:09:14'),(2598,'Select <i>ok</i> if you have found or checked the cache and everything is ok.','2015-06-17 10:09:14'),(2599,'Select <i>up to date</i> if you have checked the complete description &ndash; from the<br />container size to encoded hints and additoional wayoints &ndash; and can confirm<br />that everything is up-to-date.','2015-06-17 10:09:14'),(2600,'Select <i>up to date</i> if you have checked the complete description &ndash; from the<br />container size to encoded hints and additoional wayoints &ndash;, have compared<br />it to the geocaching.com listing (%1) and can confirm that everything is<br />up-to-date.','2015-06-17 10:09:14'),(2601,'The problems of the cache description as mentioned in the <a href=\"%1\" target=\"_blank\"><img src=\"resource2/ocstyle/images/log/16x16-listing-outdated.png\" /> log entries</a> do no longer exist.','2015-06-17 10:09:14'),(2602,'All information (coordinates, container size, difficulty, terrain, description text, encoded hints, additional waypoints) is at least up-to-date with','2015-06-17 10:09:14'),(2603,'More than 2 years ago','2015-06-17 10:09:14'),(2604,'Admin<br />comment:','2015-06-17 10:09:14'),(2605,'If you are sure that the geocache is gone, and the owner does not<br />react to your log entry, you may report it to the Opencaching team.<br />Use the \'Report this cache\' button above the cache description.','2015-06-17 10:09:14'),(2606,'Picture','2015-06-17 10:09:14'),(2607,'Title:','2015-06-17 10:09:14'),(2608,'move up','2015-06-17 10:09:14'),(2609,'Description is unusable','2015-06-17 10:09:14'),(2610,'Your geocache','2015-06-17 10:09:14'),(2611,'Your geocache report for','2015-06-17 10:09:14'),(2612,'convert','2015-06-17 10:09:14'),(2613,'waypoint','2015-06-17 10:09:14'),(2616,'from city or postal code:','2016-03-14 04:00:00'),(2617,'from geocache:','2016-03-14 04:00:00'),(2618,'There is no cache with this waypoint.','2016-03-14 04:00:00'),(2619,'Enter a valid waypoint, please!\\nFormat: OCxxxx(x) / GCx(xxxx)','2016-03-14 04:00:00'),(2620,'The entered coordinates are no valid.','2016-03-14 04:00:00'),(2621,'Enter a postal code or city, please!','2016-03-14 04:00:00'),(2622,'Last search','2016-08-02 15:00:00'),(2623,'Reset search','2016-08-02 15:00:00'),(2624,'show all search options','2016-08-02 15:00:00'),(2625,'hide all additional search options','2016-08-02 15:00:00'),(2626,'Select at least one cachetype!','2016-08-02 15:00:00'),(2627,'Select at least one cachesize!','2016-08-02 15:00:00'),(2628,'The user <b><a href=\"viewprofile.php?userid=%1\">%2</a></b> does not own any caches that fit to your search options.','2016-10-17 03:00:00'),(2629,'The user <b><a href=\"viewprofile.php?userid=%1\">%2</a></b> does not own any logs that fit to your search options.','2016-10-17 03:00:00'),(2630,'The user <b>%1%2</b> doesn\'t exist.','2016-10-17 03:00:00'),(2631,'Please save the changed geocache properties first.','2016-08-02 15:00:00'),(2632,'Handicap: Blind','2016-08-02 15:00:00'),(2633,'This Cache can be found by blind people.','2016-08-02 15:00:00'),(2634,'More information','2017-05-14 21:00:00'),(2635,'Close','2017-05-14 21:00:00'),(2636,'This website uses cookies. If you stay on this site you accept the usage of cookies.','2017-05-14 21:00:00'),(2637,'This Geocache has not been published yet.','2017-08-20 19:30:00'),(2638,'Please verify that the geocache description is complete and all properties and attributes are set properly, according to the <a %1>instructions</a>. Then click <strong><a href=\"editcache.php?cacheid=%2&publish=now#others\">here</a></strong> and \"Save\" to publish your geocache.','2017-08-20 19:30:00'),(2640,'Do you really want to delete the picture \\\'{title}\\\'?','2017-08-22 18:45:00'),(2641,'There is already a report in progress for this cache, see below.','2017-08-23 13:20:00'),(2642,'Log pictures for your caches:','2017-08-24 13:50:00'),(2643,'There are no log pictures yet for your caches.','2017-08-24 13:50:00'),(2644,'User \'%1\' is not disabled. To reset one or more caches to a previous version, you need the user\'s permission.','2017-08-23 13:20:00'),(2645,'You did not confirm that the user has allowed to restore his caches.','2017-08-23 13:20:00'),(2646,'The user has allowed to reset the selected caches to a previous version.','2017-08-23 13:20:00'),(2647,'Admin info:','2017-08-23 13:20:00'),(2648,'There already are %1 pending reports for this geocache.','2017-08-23 13:20:00'),(2649,'There already is a pending report for this geocache.','2017-08-23 13:20:00'),(2650,'This geocache will be published today at <b>%1</b>.','2017-08-20 19:30:00'),(2651,'This geocache will be published <b>tomorrow</b> at <b>%1</b>.','2017-08-20 19:30:00'),(2652,'This geocache will be published <b>in %1 days</b> (%2) at <b>%3</b>.','2017-08-20 19:30:00'),(2655,'Insert:','2017-08-20 19:30:00'),(2656,'as first picture','2017-08-20 19:30:00'),(2657,'after \"%1\"','2017-08-20 19:30:00'),(2658,'as last picture','2017-08-20 19:30:00'),(2659,'Recommendation','2017-08-20 19:30:00'),(2660,'The cache must be hidden before publish.','2017-08-20 19:30:00'),(2661,'The event must happen after publish.','2017-08-20 19:30:00'),(2662,'Handicap: Wheelchair','2020-01-04 19:30:00'),(2663,'This cache is findable for persons with a wheelchair!','2020-01-04 19:30:00'),(2664,'Cookie settings','2020-06-16 18:30:00'),(2665,'The current filter could not be saved as the cookie consent for map configuration is not given!','2020-06-16 18:30:00'),(2666,'Please choose at least one cache to add it to this cacheliste.','2020-06-13 12:30:00'),(2667,'Add selected caches to:','2020-06-13 12:30:00'),(2668,'Add to List','2020-06-13 12:30:00'),(2669,'You added %1 cache to your list','2020-07-04 12:30:00'),(2670,'You added %1 caches to your list','2020-07-04 12:30:00');
/*!40000 ALTER TABLE `sys_trans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sysTransBeforeInsert` BEFORE INSERT ON `sys_trans`
     FOR EACH ROW BEGIN
        IF NEW.`last_modified` < '2000-01-01 00:00:00' THEN
            SET NEW.`last_modified`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sysTransBeforeUpdate` BEFORE UPDATE ON `sys_trans`
     FOR EACH ROW BEGIN
         SET NEW.`last_modified`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sys_trans_ref`
--

DROP TABLE IF EXISTS `sys_trans_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_trans_ref` (
  `trans_id` int(10) unsigned NOT NULL,
  `resource_name` varchar(80) NOT NULL,
  `line` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`trans_id`,`resource_name`,`line`),
  KEY `style` (`resource_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_trans_ref`
--

LOCK TABLES `sys_trans_ref` WRITE;
/*!40000 ALTER TABLE `sys_trans_ref` DISABLE KEYS */;
INSERT INTO `sys_trans_ref` (`trans_id`, `resource_name`, `line`) VALUES (1,'./templates2/ocstyle/translate.tpl',46),(2,'./templates2/ocstyle/error.tpl',60),(3,'./templates2/ocstyle/sys_main.tpl',188),(4,'./templates2/ocstyle/adoptcache.tpl',21),(4,'table:sys_menu;field=menustring',0),(4,'table:sys_menu;field=title',0),(6,'./templates2/ocstyle/map2.tpl',2245),(6,'./templates2/ocstyle/sys_main.tpl',142),(7,'./templates2/ocstyle/map2.tpl',2245),(7,'./templates2/ocstyle/sys_main.tpl',142),(8,'./templates2/ocstyle/sys_main.tpl',217),(9,'./templates2/ocstyle/sys_main.tpl',300),(10,'./lang/de/ocstyle/main.tpl.php',310),(10,'./lang/de/ocstyle/main.tpl.php',311),(10,'./templates2/ocstyle/sys_main.tpl',300),(10,'./templates2/ocstyle/sys_sqldebugger.tpl',334),(10,'./templates2/ocstyle/sys_sqldebugger.tpl',338),(10,'./templates2/ocstyle/sys_sqldebugger.tpl',342),(10,'./templates2/ocstyle/sys_sqldebugger.tpl',346),(11,'./templates2/ocstyle/sys_main.tpl',302),(12,'./templates2/ocstyle/sys_main.tpl',305),(13,'./templates2/ocstyle/adminreports.tpl',116),(13,'./templates2/ocstyle/sys_main.tpl',311),(13,'./templates2/ocstyle/sys_sqldebugger.tpl',349),(14,'./lang/de/ocstyle/main.tpl.php',332),(14,'./templates2/ocstyle/sys_main.tpl',338),(14,'table:sys_menu;field=menustring',0),(14,'table:sys_menu;field=title',0),(15,'./templates2/ocstyle/sys_oc404.tpl',99),(15,'table:sys_menu;field=menustring',0),(15,'table:sys_menu;field=title',0),(16,'./lang/de/ocstyle/main.tpl.php',332),(16,'./templates2/ocstyle/sys_main.tpl',338),(16,'./templates2/ocstyle/sys_oc404.tpl',97),(16,'./templates2/ocstyle/sys_oc404.tpl',99),(16,'table:sys_menu;field=menustring',0),(16,'table:sys_menu;field=title',0),(17,'./lang/de/ocstyle/lib/menu.php',262),(17,'./lang/de/ocstyle/lib/menu.php',265),(17,'./lang/de/ocstyle/main.tpl.php',332),(17,'./lang/de/ocstyle/varset.inc.php',25),(17,'./templates2/ocstyle/sitemap.tpl',7),(17,'./templates2/ocstyle/sys_main.tpl',338),(17,'table:sys_menu;field=menustring',0),(17,'table:sys_menu;field=title',0),(18,'./lang/de/ocstyle/login.tpl.php',60),(18,'./templates2/ocstyle/login.tpl',69),(18,'./templates2/ocstyle/register.tpl',197),(18,'table:sys_menu;field=menustring',0),(18,'table:sys_menu;field=title',0),(19,'./templates2/ocstyle/register.tpl',10),(20,'./templates2/ocstyle/picture.tpl',107),(20,'./templates2/ocstyle/picture.tpl',129),(20,'./templates2/ocstyle/register.tpl',14),(20,'./templates2/ocstyle/register.tpl',62),(20,'./templates2/ocstyle/register.tpl',174),(20,'./templates2/ocstyle/res_logentry.tpl',20),(20,'./templates2/ocstyle/res_logtype.tpl',13),(20,'./templates2/ocstyle/viewcache.tpl',253),(20,'./templates2/ocstyle/viewcache_print.tpl',115),(20,'table:log_types;field=name',0),(21,'table:languages;field=name',0),(22,'./templates2/mail/register.tpl',10),(22,'./templates2/ocstyle/restorecaches.tpl',19),(24,'./templates2/mail/register.tpl',12),(25,'./templates2/mail/register.tpl',14),(26,'./templates2/mail/register.tpl',16),(27,'./templates2/ocstyle/register.tpl',54),(29,'./templates2/ocstyle/myprofile.tpl',32),(29,'./templates2/ocstyle/register.tpl',78),(31,'./templates2/ocstyle/myprofile.tpl',62),(31,'./templates2/ocstyle/register.tpl',100),(32,'./templates2/ocstyle/myprofile.tpl',48),(32,'./templates2/ocstyle/register.tpl',91),(33,'./templates2/ocstyle/log_cache.tpl',254),(33,'./templates2/ocstyle/log_cache.tpl',263),(33,'./templates2/ocstyle/register.tpl',108),(34,'./lang/de/ocstyle/editcache.inc.php',23),(34,'./lang/de/ocstyle/editdesc.inc.php',19),(34,'./lang/de/ocstyle/newcache.inc.php',22),(34,'./lang/de/ocstyle/newdesc.inc.php',23),(34,'./templates2/ocstyle/map2.tpl',2192),(34,'./templates2/ocstyle/myhome.tpl',103),(34,'./templates2/ocstyle/myprofile.tpl',81),(34,'./templates2/ocstyle/oconly81.tpl',24),(34,'./templates2/ocstyle/register.tpl',114),(34,'./templates2/ocstyle/search.tpl',334),(34,'./templates2/ocstyle/search.tpl',469),(35,'./templates2/ocstyle/newemail.tpl',46),(35,'./templates2/ocstyle/register.tpl',125),(36,'table:languages;field=name',0),(37,'./templates2/ocstyle/register.tpl',133),(39,'./templates2/ocstyle/newpw.tpl',109),(39,'./templates2/ocstyle/register.tpl',151),(41,'./templates2/ocstyle/register.tpl',159),(42,'table:languages;field=name',0),(43,'table:languages;field=name',0),(45,'./templates2/ocstyle/res_passworderror.tpl',11),(48,'table:languages;field=name',0),(49,'table:languages;field=name',0),(51,'./lang/de/expressions.inc.php',24),(51,'./templates2/ocstyle/activation.tpl',69),(51,'./templates2/ocstyle/cachelists.tpl',43),(51,'./templates2/ocstyle/login.tpl',58),(51,'./templates2/ocstyle/mailto.tpl',99),(51,'./templates2/ocstyle/map2.tpl',2440),(51,'./templates2/ocstyle/mywatches.tpl',100),(51,'./templates2/ocstyle/newemail.tpl',108),(51,'./templates2/ocstyle/newpw.tpl',118),(51,'./templates2/ocstyle/picture.tpl',149),(51,'./templates2/ocstyle/register.tpl',196),(51,'./templates2/ocstyle/reportcache.tpl',107),(52,'./lang/de/ocstyle/lib/menu.php',190),(52,'./lang/de/ocstyle/lib/menu.php',191),(52,'./templates2/ocstyle/tops.tpl',9),(52,'table:sys_menu;field=menustring',0),(52,'table:sys_menu;field=title',0),(54,'./templates2/ocstyle/tops.tpl',84),(55,'./lang/de/ocstyle/lib/menu.php',151),(55,'./lang/de/ocstyle/lib/menu.php',152),(55,'./templates2/ocstyle/res_userstats.tpl',108),(55,'./templates2/ocstyle/search.result.caches.row.tpl',41),(55,'./templates2/ocstyle/search.result.caches.row.tpl',42),(55,'./templates2/ocstyle/search.result.caches.row.tpl',43),(55,'./templates2/ocstyle/search.result.caches.row.tpl',47),(55,'./templates2/ocstyle/tops.tpl',85),(55,'./templates2/ocstyle/viewcache.tpl',261),(55,'./templates2/ocstyle/viewcache_print.tpl',121),(55,'table:sys_menu;field=menustring',0),(55,'table:sys_menu;field=title',0),(56,'./templates2/ocstyle/myhome.tpl',152),(56,'./templates2/ocstyle/newlogs.tpl',77),(56,'./templates2/ocstyle/res_logentry.tpl',18),(56,'./templates2/ocstyle/res_logtype.tpl',9),(56,'./templates2/ocstyle/tops.tpl',86),(56,'./templates2/ocstyle/viewcache.tpl',251),(56,'./templates2/ocstyle/viewcache_print.tpl',113),(56,'table:log_types;field=name',0),(57,'./templates2/ocstyle/adminhistory.tpl',26),(57,'./templates2/ocstyle/coordinates.tpl',11),(57,'./templates2/ocstyle/event_attendance.tpl',11),(57,'./templates2/ocstyle/garmin.tpl',32),(57,'./templates2/ocstyle/map2.tpl',1190),(57,'./templates2/ocstyle/myhome.tpl',88),(57,'./templates2/ocstyle/newcaches.tpl',34),(57,'./templates2/ocstyle/newcachesrest.tpl',35),(57,'./templates2/ocstyle/recommendations.tpl',39),(57,'./templates2/ocstyle/res_cachelists.tpl',16),(57,'./templates2/ocstyle/res_newcaches.tpl',17),(57,'./templates2/ocstyle/res_newevents.tpl',13),(57,'./templates2/ocstyle/res_newratings.tpl',21),(57,'./templates2/ocstyle/search.result.caches.row.tpl',16),(57,'./templates2/ocstyle/search.result.caches.tpl',26),(57,'./templates2/ocstyle/search.tpl.inc.php',55),(57,'./templates2/ocstyle/tops.tpl',104),(57,'./templates2/ocstyle/viewcache.tpl',169),(57,'./templates2/ocstyle/viewcache.tpl',336),(57,'./templates2/ocstyle/viewcache.tpl',562),(57,'./templates2/ocstyle/viewcache_print.tpl',34),(59,'table:languages;field=name',0),(60,'./templates2/ocstyle/newemail.tpl',21),(60,'./templates2/ocstyle/newpw.tpl',20),(63,'./templates2/ocstyle/newemail.tpl',64),(63,'./templates2/ocstyle/newpw.tpl',60),(64,'table:languages;field=name',0),(65,'./templates2/ocstyle/restorecaches.tpl',64),(70,'./templates2/ocstyle/news.tpl',9),(70,'./templates2/ocstyle/start.tpl',25),(70,'./templates2/ocstyle/sys_main.tpl',231),(70,'table:sys_menu;field=menustring',0),(70,'table:sys_menu;field=title',0),(74,'table:languages;field=name',0),(75,'table:languages;field=name',0),(76,'table:languages;field=name',0),(77,'table:languages;field=name',0),(78,'table:languages;field=name',0),(79,'table:languages;field=name',0),(80,'./lang/de/ocstyle/lib/menu.php',43),(80,'table:sys_menu;field=menustring',0),(82,'./index.php',28),(83,'./templates2/ocstyle/picture.tpl',89),(84,'./templates2/ocstyle/picture.tpl',22),(84,'./templates2/ocstyle/picture.tpl',87),(85,'./templates2/ocstyle/picture.tpl',85),(86,'./templates2/ocstyle/viewcache.tpl',527),(90,'./templates2/ocstyle/start.tpl',147),(91,'table:languages;field=name',0),(92,'table:languages;field=name',0),(93,'table:languages;field=name',0),(94,'./lang/de/expressions.inc.php',25),(94,'./templates2/ocstyle/adminuser.tpl',60),(94,'./templates2/ocstyle/mydetails.tpl',52),(94,'./templates2/ocstyle/sys_main.tpl',302),(94,'./templates2/ocstyle/sys_main.tpl',306),(95,'./lang/de/expressions.inc.php',26),(95,'./templates2/ocstyle/adminuser.tpl',60),(95,'./templates2/ocstyle/mydetails.tpl',54),(95,'./templates2/ocstyle/sys_main.tpl',302),(95,'./templates2/ocstyle/sys_main.tpl',306),(96,'./templates2/mail/sys_main.tpl',6),(99,'./templates2/mail/sys_main.tpl',13),(100,'table:languages;field=name',0),(101,'table:languages;field=name',0),(102,'table:languages;field=name',0),(103,'table:languages;field=name',0),(104,'table:languages;field=name',0),(105,'./templates2/ocstyle/error.tpl',20),(105,'./templates2/ocstyle/myprofile.tpl',215),(105,'./templates2/ocstyle/newemail.tpl',51),(105,'./templates2/ocstyle/newemail.tpl',101),(105,'./templates2/ocstyle/newpw.tpl',71),(105,'./templates2/ocstyle/remindemail.tpl',34),(106,'./templates2/ocstyle/error.tpl',22),(107,'./templates2/ocstyle/error.tpl',26),(108,'./templates2/ocstyle/error.tpl',28),(109,'./templates2/ocstyle/error.tpl',32),(110,'./lang/de/ocstyle/varset.inc.php',66),(110,'./templates2/ocstyle/error.tpl',34),(110,'./templates2/ocstyle/login.tpl',38),(111,'./templates2/ocstyle/error.tpl',36),(112,'./templates2/ocstyle/error.tpl',46),(113,'./lang/de/ocstyle/lib/menu.php',174),(113,'./lang/de/ocstyle/lib/menu.php',175),(113,'table:sys_menu;field=menustring',0),(113,'table:sys_menu;field=title',0),(114,'./lang/de/ocstyle/lib/menu.php',168),(114,'./lang/de/ocstyle/newcache.tpl.php',256),(114,'./templates2/ocstyle/search.tpl',675),(114,'./templates2/ocstyle/viewcache.tpl',358),(114,'./templates2/ocstyle/viewcache_print.tpl',169),(114,'table:profile_options;field=name',0),(114,'table:sys_menu;field=menustring',0),(114,'table:sys_menu;field=title',0),(115,'./lang/de/ocstyle/lib/menu.php',160),(115,'./lang/de/ocstyle/lib/menu.php',161),(115,'table:sys_menu;field=menustring',0),(115,'table:sys_menu;field=title',0),(116,'./lang/de/ocstyle/lib/menu.php',220),(116,'./lang/de/ocstyle/lib/menu.php',221),(116,'./templates2/ocstyle/adminhistory.tpl',47),(116,'./templates2/ocstyle/adminreports.tpl',82),(116,'table:sys_menu;field=menustring',0),(116,'table:sys_menu;field=title',0),(118,'./lang/de/ocstyle/lib/menu.php',57),(118,'./lang/de/ocstyle/lib/menu.php',58),(118,'./templates2/ocstyle/res_cachelists.tpl',18),(118,'table:sys_menu;field=menustring',0),(118,'table:sys_menu;field=title',0),(119,'./lang/de/ocstyle/lib/menu.php',49),(119,'./lang/de/ocstyle/lib/menu.php',50),(119,'table:sys_menu;field=menustring',0),(119,'table:sys_menu;field=title',0),(120,'table:sys_menu;field=menustring',0),(120,'table:sys_menu;field=title',0),(122,'table:sys_menu;field=menustring',0),(122,'table:sys_menu;field=title',0),(123,'table:sys_menu;field=menustring',0),(123,'table:sys_menu;field=title',0),(124,'table:sys_menu;field=menustring',0),(124,'table:sys_menu;field=title',0),(125,'./lang/de/ocstyle/lib/menu.php',65),(125,'./lang/de/ocstyle/lib/menu.php',66),(125,'./lang/de/ocstyle/varset.inc.php',25),(125,'./templates2/ocstyle/cachelists.tpl',42),(125,'./templates2/ocstyle/map2.tpl',2253),(125,'./templates2/ocstyle/search.tpl',571),(125,'./templates2/ocstyle/search.tpl',634),(125,'./templates2/ocstyle/search.tpl',670),(125,'./templates2/ocstyle/search.tpl',716),(125,'./templates2/ocstyle/search.tpl',762),(125,'./templates2/ocstyle/search.tpl',799),(125,'table:sys_menu;field=menustring',0),(125,'table:sys_menu;field=title',0),(126,'table:sys_menu;field=menustring',0),(126,'table:sys_menu;field=title',0),(127,'table:sys_menu;field=menustring',0),(127,'table:sys_menu;field=title',0),(128,'table:sys_menu;field=menustring',0),(128,'table:sys_menu;field=title',0),(129,'./templates2/ocstyle/error.tpl',9),(130,'./templates2/ocstyle/error.tpl',13),(131,'./lang/de/ocstyle/error.tpl.php',24),(131,'./templates2/ocstyle/error.tpl',14),(133,'./lang/de/ocstyle/error.tpl.php',27),(133,'./lang/de/ocstyle/lib/menu.php',241),(133,'./lang/de/ocstyle/lib/menu.php',242),(133,'./templates2/ocstyle/error.tpl',17),(133,'table:sys_menu;field=menustring',0),(133,'table:sys_menu;field=title',0),(134,'./templates2/ocstyle/newlogs.tpl',156),(135,'./templates2/ocstyle/newlogs.tpl',158),(136,'./templates2/ocstyle/newlogs.tpl',160),(137,'./templates2/ocstyle/newlogs.tpl',162),(138,'./templates2/ocstyle/newlogs.tpl',164),(139,'./lib2/logic/user.class.php',748),(140,'./templates2/mail/register.tpl',6),(141,'./templates2/mail/register.tpl',8),(142,'./templates2/ocstyle/sys_main.tpl',307),(144,'./templates2/mail/register.tpl',27),(145,'table:languages;field=name',0),(146,'table:languages;field=name',0),(147,'./templates2/ocstyle/viewprofile.tpl',12),(148,'./templates2/ocstyle/viewprofile.tpl',17),(148,'./templates2/ocstyle/viewprofile.tpl',18),(148,'table:sys_menu;field=menustring',0),(148,'table:sys_menu;field=title',0),(149,'./lang/de/ocstyle/editcache.tpl.php',318),(149,'./lang/de/ocstyle/main.tpl.php',170),(149,'./lang/de/ocstyle/newcache.tpl.php',325),(149,'./templates2/ocstyle/sys_main.tpl',165),(150,'./templates2/ocstyle/viewprofile.tpl',83),(151,'./templates2/ocstyle/viewprofile.tpl',42),(152,'./templates2/ocstyle/res_userstats.tpl',10),(153,'./templates2/ocstyle/res_userstats.tpl',36),(154,'./templates2/ocstyle/res_userstats.tpl',109),(155,'table:languages;field=name',0),(156,'table:languages;field=name',0),(157,'table:languages;field=name',0),(158,'table:languages;field=name',0),(159,'table:languages;field=name',0),(160,'table:languages;field=name',0),(161,'./templates2/ocstyle/myprofile.tpl',176),(162,'table:countries;field=name',0),(163,'table:countries;field=name',0),(164,'table:countries;field=name',0),(165,'table:countries;field=name',0),(166,'./templates2/ocstyle/register.tpl',15),(167,'./templates2/ocstyle/register.tpl',63),(168,'./templates2/ocstyle/newemail.tpl',53),(168,'./templates2/ocstyle/newemail.tpl',99),(168,'./templates2/ocstyle/register.tpl',127),(171,'./templates2/ocstyle/activation.tpl',51),(172,'table:countries;field=name',0),(173,'table:countries;field=name',0),(174,'./lang/de/ocstyle/main.tpl.php',222),(174,'./templates2/ocstyle/sys_main.tpl',217),(175,'./templates2/ocstyle/sys_main.tpl',186),(179,'table:countries;field=name',0),(181,'table:countries;field=name',0),(182,'table:countries;field=name',0),(183,'table:countries;field=name',0),(184,'table:countries;field=name',0),(185,'table:countries;field=name',0),(186,'./templates2/ocstyle/translate.tpl',8),(187,'./templates2/ocstyle/translate.tpl',40),(188,'./templates2/ocstyle/translate.tpl',45),(189,'./templates2/ocstyle/myprofile.tpl',75),(190,'./templates2/ocstyle/translate.tpl',42),(191,'./templates2/ocstyle/translate.tpl',41),(192,'table:countries;field=name',0),(193,'table:countries;field=name',0),(194,'table:countries;field=name',0),(195,'./templates2/ocstyle/translate.tpl',123),(196,'./templates2/ocstyle/translate.tpl',73),(197,'./templates2/ocstyle/translate.tpl',63),(198,'./templates2/ocstyle/translate.tpl',65),(199,'./templates2/ocstyle/translate.tpl',14),(201,'table:countries;field=name',0),(202,'./templates2/ocstyle/activation.tpl',42),(202,'./templates2/ocstyle/adminuser.tpl',64),(203,'table:countries;field=name',0),(204,'table:countries;field=name',0),(206,'./templates2/ocstyle/event_attendance.tpl',15),(206,'./templates2/ocstyle/event_attendance.tpl',21),(207,'./lang/de/ocstyle/lib/menu.php',35),(207,'./lang/de/ocstyle/lib/menu.php',36),(207,'./lang/de/ocstyle/login.tpl.php',26),(207,'./lang/de/ocstyle/login.tpl.php',49),(207,'./templates2/ocstyle/error.tpl',34),(207,'./templates2/ocstyle/login.tpl',9),(207,'./templates2/ocstyle/login.tpl',59),(207,'./templates2/ocstyle/map2.tpl',2245),(207,'./templates2/ocstyle/sys_main.tpl',139),(207,'table:sys_menu;field=menustring',0),(207,'table:sys_menu;field=title',0),(209,'table:countries;field=name',0),(210,'table:countries;field=name',0),(211,'table:countries;field=name',0),(212,'table:countries;field=name',0),(213,'table:countries;field=name',0),(214,'table:countries;field=name',0),(215,'table:countries;field=name',0),(216,'./lang/de/ocstyle/login.tpl.php',60),(216,'./templates2/ocstyle/login.tpl',69),(217,'./lang/de/ocstyle/login.tpl.php',61),(217,'./templates2/ocstyle/login.tpl',70),(218,'./lang/de/ocstyle/login.tpl.php',62),(218,'./templates2/ocstyle/login.tpl',71),(219,'./lang/de/ocstyle/login.tpl.php',65),(219,'./templates2/ocstyle/login.tpl',74),(221,'./lang/de/ocstyle/login.tpl.php',61),(221,'./templates2/ocstyle/login.tpl',70),(222,'./lang/de/ocstyle/login.tpl.php',62),(222,'./templates2/ocstyle/login.tpl',71),(223,'table:countries;field=name',0),(224,'./templates2/ocstyle/login.tpl',30),(225,'./templates2/ocstyle/login.tpl',32),(226,'./templates2/ocstyle/login.tpl',21),(226,'./templates2/ocstyle/login.tpl',24),(226,'./templates2/ocstyle/login.tpl',34),(227,'./templates2/ocstyle/login.tpl',22),(228,'./templates2/ocstyle/login.tpl',25),(229,'./templates2/ocstyle/login.tpl',27),(230,'./templates2/ocstyle/login.tpl',28),(231,'table:countries;field=name',0),(232,'./templates2/ocstyle/activation.tpl',33),(233,'table:countries;field=name',0),(234,'table:countries;field=name',0),(235,'table:countries;field=name',0),(236,'table:countries;field=name',0),(237,'table:countries;field=name',0),(238,'table:countries;field=name',0),(239,'table:countries;field=name',0),(240,'table:countries;field=name',0),(241,'./templates2/ocstyle/adminreports.tpl',75),(241,'./templates2/ocstyle/adminreports.tpl',82),(241,'./templates2/ocstyle/admins.tpl',16),(241,'./templates2/ocstyle/adoptcache.tpl',111),(241,'./templates2/ocstyle/myignores.tpl',20),(241,'./templates2/ocstyle/mytop5.tpl',27),(241,'./templates2/ocstyle/mywatches.tpl',133),(241,'./templates2/ocstyle/query.tpl',18),(241,'./templates2/ocstyle/recommendations.tpl',31),(241,'./templates2/ocstyle/search.result.caches.tpl',135),(241,'./templates2/ocstyle/usertops.tpl',18),(242,'table:countries;field=name',0),(243,'table:countries;field=name',0),(244,'./templates2/ocstyle/usertops.tpl',9),(245,'./templates2/ocstyle/usertops.tpl',26),(246,'./templates2/ocstyle/usertops.tpl',31),(248,'table:sys_menu;field=menustring',0),(248,'table:sys_menu;field=title',0),(249,'table:countries;field=name',0),(250,'table:countries;field=name',0),(251,'table:countries;field=name',0),(252,'table:countries;field=name',0),(253,'./templates2/ocstyle/error.tpl',54),(254,'./templates2/ocstyle/error.tpl',56),(255,'./templates2/ocstyle/error.tpl',58),(256,'table:countries;field=name',0),(257,'table:countries;field=name',0),(258,'table:countries;field=name',0),(259,'table:countries;field=name',0),(260,'table:countries;field=name',0),(261,'table:countries;field=name',0),(262,'table:countries;field=name',0),(263,'table:countries;field=name',0),(264,'table:countries;field=name',0),(265,'table:countries;field=name',0),(266,'table:countries;field=name',0),(267,'table:countries;field=name',0),(268,'table:countries;field=name',0),(269,'table:countries;field=name',0),(270,'table:countries;field=name',0),(271,'table:countries;field=name',0),(272,'table:countries;field=name',0),(273,'table:countries;field=name',0),(274,'table:countries;field=name',0),(275,'table:countries;field=name',0),(276,'table:countries;field=name',0),(277,'table:countries;field=name',0),(278,'table:countries;field=name',0),(279,'table:countries;field=name',0),(280,'table:countries;field=name',0),(281,'table:countries;field=name',0),(282,'table:countries;field=name',0),(283,'table:countries;field=name',0),(284,'table:countries;field=name',0),(285,'table:countries;field=name',0),(286,'table:countries;field=name',0),(287,'table:countries;field=name',0),(288,'table:countries;field=name',0),(289,'table:countries;field=name',0),(290,'table:countries;field=name',0),(291,'table:countries;field=name',0),(292,'table:countries;field=name',0),(293,'table:countries;field=name',0),(294,'table:countries;field=name',0),(295,'table:countries;field=name',0),(296,'table:countries;field=name',0),(297,'table:countries;field=name',0),(298,'table:countries;field=name',0),(299,'table:countries;field=name',0),(300,'table:countries;field=name',0),(301,'table:countries;field=name',0),(302,'table:countries;field=name',0),(303,'table:countries;field=name',0),(304,'table:countries;field=name',0),(305,'table:countries;field=name',0),(306,'table:countries;field=name',0),(307,'table:countries;field=name',0),(308,'table:countries;field=name',0),(309,'table:countries;field=name',0),(310,'table:countries;field=name',0),(311,'table:countries;field=name',0),(312,'table:countries;field=name',0),(313,'table:countries;field=name',0),(314,'table:countries;field=name',0),(315,'table:countries;field=name',0),(316,'table:countries;field=name',0),(317,'table:countries;field=name',0),(318,'table:countries;field=name',0),(319,'table:countries;field=name',0),(320,'table:countries;field=name',0),(321,'table:countries;field=name',0),(322,'table:countries;field=name',0),(323,'table:countries;field=name',0),(324,'table:countries;field=name',0),(325,'table:countries;field=name',0),(326,'table:countries;field=name',0),(327,'table:countries;field=name',0),(328,'table:countries;field=name',0),(329,'table:countries;field=name',0),(330,'table:countries;field=name',0),(331,'table:countries;field=name',0),(332,'table:countries;field=name',0),(333,'table:countries;field=name',0),(334,'table:countries;field=name',0),(335,'table:countries;field=name',0),(336,'table:countries;field=name',0),(337,'table:countries;field=name',0),(338,'table:countries;field=name',0),(339,'table:countries;field=name',0),(340,'table:countries;field=name',0),(341,'table:countries;field=name',0),(342,'table:countries;field=name',0),(343,'table:countries;field=name',0),(344,'table:countries;field=name',0),(345,'table:countries;field=name',0),(346,'table:countries;field=name',0),(347,'table:countries;field=name',0),(348,'table:countries;field=name',0),(349,'table:countries;field=name',0),(350,'table:countries;field=name',0),(351,'table:countries;field=name',0),(352,'table:countries;field=name',0),(353,'table:countries;field=name',0),(354,'table:countries;field=name',0),(355,'table:countries;field=name',0),(356,'table:countries;field=name',0),(357,'table:countries;field=name',0),(358,'table:countries;field=name',0),(359,'table:countries;field=name',0),(360,'table:countries;field=name',0),(361,'table:countries;field=name',0),(362,'table:countries;field=name',0),(363,'table:countries;field=name',0),(364,'table:countries;field=name',0),(365,'table:countries;field=name',0),(366,'table:countries;field=name',0),(367,'table:countries;field=name',0),(368,'table:countries;field=name',0),(369,'table:countries;field=name',0),(370,'table:countries;field=name',0),(371,'table:countries;field=name',0),(372,'table:countries;field=name',0),(373,'table:countries;field=name',0),(374,'table:countries;field=name',0),(375,'table:countries;field=name',0),(376,'table:countries;field=name',0),(377,'table:countries;field=name',0),(378,'table:countries;field=name',0),(379,'table:countries;field=name',0),(380,'table:countries;field=name',0),(381,'table:countries;field=name',0),(382,'table:countries;field=name',0),(383,'table:countries;field=name',0),(384,'table:countries;field=name',0),(385,'table:countries;field=name',0),(386,'table:countries;field=name',0),(387,'table:countries;field=name',0),(388,'table:countries;field=name',0),(389,'table:countries;field=name',0),(390,'table:countries;field=name',0),(391,'table:countries;field=name',0),(392,'table:countries;field=name',0),(393,'table:countries;field=name',0),(394,'table:countries;field=name',0),(395,'table:countries;field=name',0),(396,'table:countries;field=name',0),(397,'table:countries;field=name',0),(398,'table:countries;field=name',0),(399,'table:countries;field=name',0),(400,'table:countries;field=name',0),(402,'table:countries;field=name',0),(403,'table:countries;field=name',0),(404,'table:countries;field=name',0),(405,'table:countries;field=name',0),(406,'table:countries;field=name',0),(407,'table:countries;field=name',0),(408,'table:countries;field=name',0),(409,'table:countries;field=name',0),(410,'table:countries;field=name',0),(411,'table:countries;field=name',0),(412,'table:countries;field=name',0),(413,'table:countries;field=name',0),(414,'table:countries;field=name',0),(415,'table:countries;field=name',0),(416,'table:countries;field=name',0),(417,'table:countries;field=name',0),(418,'table:countries;field=name',0),(419,'table:countries;field=name',0),(420,'table:countries;field=name',0),(421,'table:countries;field=name',0),(422,'table:countries;field=name',0),(423,'table:countries;field=name',0),(424,'table:countries;field=name',0),(425,'table:countries;field=name',0),(426,'table:countries;field=name',0),(427,'table:countries;field=name',0),(428,'table:countries;field=name',0),(429,'table:countries;field=name',0),(430,'table:countries;field=name',0),(431,'table:countries;field=name',0),(432,'table:countries;field=name',0),(433,'table:countries;field=name',0),(434,'table:countries;field=name',0),(435,'table:countries;field=name',0),(436,'table:countries;field=name',0),(437,'table:countries;field=name',0),(438,'table:countries;field=name',0),(439,'table:countries;field=name',0),(440,'table:countries;field=name',0),(441,'table:countries;field=name',0),(442,'table:countries;field=name',0),(443,'table:countries;field=name',0),(444,'table:countries;field=name',0),(445,'table:countries;field=name',0),(446,'table:countries;field=name',0),(447,'table:countries;field=name',0),(448,'./templates2/ocstyle/error.tpl',62),(449,'./templates2/ocstyle/translate.tpl',46),(450,'./templates2/ocstyle/sys_outofservice.tpl',8),(455,'./templates2/ocstyle/activation.tpl',70),(455,'./templates2/ocstyle/adminuser.tpl',23),(455,'./templates2/ocstyle/adminuser.tpl',149),(455,'./templates2/ocstyle/adoptcache.tpl',95),(455,'./templates2/ocstyle/adoptcache.tpl',167),(455,'./templates2/ocstyle/mydescription.tpl',52),(455,'./templates2/ocstyle/mydetails.tpl',91),(455,'./templates2/ocstyle/myprofile.tpl',227),(455,'./templates2/ocstyle/picture.tpl',150),(455,'./templates2/ocstyle/remindemail.tpl',45),(455,'./templates2/ocstyle/restorecaches.tpl',22),(459,'./templates2/ocstyle/activation.tpl',39),(466,'./templates2/ocstyle/activation.tpl',16),(467,'./templates2/ocstyle/activation.tpl',32),(467,'./templates2/ocstyle/mylists.tpl',119),(468,'./templates2/ocstyle/activation.tpl',12),(468,'./templates2/ocstyle/activation.tpl',28),(469,'./templates2/ocstyle/sys_outofservice.tpl',11),(470,'./templates2/ocstyle/sys_outofservice.tpl',10),(471,'./templates2/ocstyle/register.tpl',163),(472,'./templates2/ocstyle/register.tpl',175),(474,'./templates2/ocstyle/login.tpl',35),(475,'./templates2/ocstyle/sys_outofservice.tpl',7),(477,'./templates2/ocstyle/sys_sqldebugger.tpl',345),(478,'./templates2/ocstyle/sys_sqldebugger.tpl',341),(479,'./templates2/ocstyle/sys_sqldebugger.tpl',337),(480,'./templates2/ocstyle/sys_sqldebugger.tpl',333),(481,'./templates2/ocstyle/sys_sqldebugger.tpl',11),(482,'./templates2/ocstyle/sys_sqldebugger.tpl',334),(482,'./templates2/ocstyle/sys_sqldebugger.tpl',338),(482,'./templates2/ocstyle/sys_sqldebugger.tpl',342),(482,'./templates2/ocstyle/sys_sqldebugger.tpl',346),(483,'table:sys_menu;field=menustring',0),(484,'table:sys_menu;field=menustring',0),(484,'table:sys_menu;field=title',0),(485,'./templates2/ocstyle/query.tpl',10),(485,'table:sys_menu;field=menustring',0),(485,'table:sys_menu;field=title',0),(486,'table:sys_menu;field=menustring',0),(486,'table:sys_menu;field=title',0),(487,'table:sys_menu;field=menustring',0),(487,'table:sys_menu;field=title',0),(488,'./templates2/ocstyle/map2.tpl',2268),(488,'./templates2/ocstyle/map2.tpl',2331),(488,'table:sys_menu;field=menustring',0),(488,'table:sys_menu;field=title',0),(490,'./templates2/ocstyle/myprofile.tpl',115),(491,'./templates2/ocstyle/newpw.tpl',9),(491,'table:sys_menu;field=menustring',0),(491,'table:sys_menu;field=title',0),(493,'./templates2/mail/register.tpl',11),(496,'./templates2/ocstyle/adminreports.tpl',180),(496,'./templates2/ocstyle/adminuser.tpl',89),(496,'./templates2/ocstyle/res_cachestatus.tpl',12),(496,'./templates2/ocstyle/res_logtype.tpl',19),(496,'./templates2/ocstyle/search.tpl.inc.php',50),(496,'./templates2/ocstyle/viewcache.tpl',100),(496,'table:cache_status;field=name',0),(496,'table:log_types;field=name',0),(497,'./templates2/ocstyle/res_logentry.tpl',19),(497,'./templates2/ocstyle/res_logtype.tpl',11),(497,'./templates2/ocstyle/res_userstats.tpl',83),(497,'./templates2/ocstyle/viewcache.tpl',252),(497,'./templates2/ocstyle/viewcache_print.tpl',114),(497,'table:log_types;field=name',0),(498,'./templates2/ocstyle/event_attendance.tpl',20),(498,'./templates2/ocstyle/newlogs.tpl',83),(498,'./templates2/ocstyle/res_logentry.tpl',18),(498,'./templates2/ocstyle/res_logtype.tpl',15),(498,'./templates2/ocstyle/viewcache.tpl',251),(498,'./templates2/ocstyle/viewcache_print.tpl',113),(498,'table:log_types;field=name',0),(499,'./templates2/ocstyle/event_attendance.tpl',14),(499,'./templates2/ocstyle/res_logentry.tpl',19),(499,'./templates2/ocstyle/res_logtype.tpl',17),(499,'./templates2/ocstyle/viewcache.tpl',252),(499,'./templates2/ocstyle/viewcache_print.tpl',114),(499,'table:log_types;field=name',0),(500,'./templates2/ocstyle/myhome.tpl',62),(501,'./templates2/ocstyle/restorecaches.tpl',82),(501,'./templates2/ocstyle/search.tpl',678),(502,'./templates2/ocstyle/myhome.tpl',70),(503,'./templates2/ocstyle/myhome.tpl',76),(504,'./templates2/ocstyle/myhome.tpl',93),(505,'./templates2/ocstyle/myhome.tpl',133),(506,'./templates2/ocstyle/myhome.tpl',150),(507,'./templates2/ocstyle/myhome.tpl',141),(508,'./templates2/ocstyle/myhome.tpl',179),(512,'./templates2/ocstyle/res_cacheicon.tpl',10),(512,'./templates2/ocstyle/res_cacheicon_15.tpl',10),(512,'./templates2/ocstyle/res_cacheicon_22.tpl',11),(513,'./templates2/ocstyle/res_cacheicon.tpl',12),(513,'./templates2/ocstyle/res_cacheicon_15.tpl',12),(513,'./templates2/ocstyle/res_cacheicon_22.tpl',13),(514,'./templates2/ocstyle/res_cacheicon.tpl',14),(514,'./templates2/ocstyle/res_cacheicon_15.tpl',14),(514,'./templates2/ocstyle/res_cacheicon_22.tpl',15),(514,'table:cache_type;field=name',0),(514,'table:cache_type;field=short2',0),(515,'./templates2/ocstyle/res_cacheicon.tpl',16),(515,'./templates2/ocstyle/res_cacheicon_15.tpl',16),(515,'./templates2/ocstyle/res_cacheicon_22.tpl',17),(516,'./templates2/ocstyle/res_cacheicon.tpl',18),(516,'./templates2/ocstyle/res_cacheicon_15.tpl',18),(516,'./templates2/ocstyle/res_cacheicon_22.tpl',19),(517,'./templates2/ocstyle/newcaches.tpl',34),(517,'./templates2/ocstyle/res_cacheicon.tpl',20),(517,'./templates2/ocstyle/res_cacheicon_15.tpl',20),(517,'./templates2/ocstyle/res_cacheicon_22.tpl',21),(517,'./templates2/ocstyle/res_newevents.tpl',10),(518,'./templates2/ocstyle/res_cacheicon.tpl',22),(518,'./templates2/ocstyle/res_cacheicon_15.tpl',22),(518,'./templates2/ocstyle/res_cacheicon_22.tpl',23),(518,'table:cache_type;field=name',0),(519,'./templates2/ocstyle/res_cacheicon.tpl',24),(519,'./templates2/ocstyle/res_cacheicon_15.tpl',24),(519,'./templates2/ocstyle/res_cacheicon_22.tpl',25),(520,'./templates2/ocstyle/res_cacheicon.tpl',26),(520,'./templates2/ocstyle/res_cacheicon_15.tpl',26),(520,'./templates2/ocstyle/res_cacheicon_22.tpl',27),(521,'./templates2/ocstyle/res_cacheicon.tpl',28),(521,'./templates2/ocstyle/res_cacheicon_15.tpl',28),(521,'./templates2/ocstyle/res_cacheicon_22.tpl',29),(524,'./templates2/ocstyle/search.tpl',403),(524,'table:cache_size;field=name',0),(525,'./templates2/ocstyle/search.tpl',397),(525,'table:cache_size;field=name',0),(526,'./templates2/ocstyle/search.tpl',398),(526,'table:cache_size;field=name',0),(527,'./templates2/ocstyle/search.tpl',399),(527,'table:cache_size;field=name',0),(528,'./templates2/ocstyle/search.tpl',400),(528,'table:cache_size;field=name',0),(529,'./templates2/ocstyle/search.tpl',401),(529,'table:cache_size;field=name',0),(530,'./templates2/ocstyle/search.tpl',403),(530,'table:cache_size;field=name',0),(531,'./templates2/ocstyle/adminreports.tpl',176),(531,'./templates2/ocstyle/res_cachestatus.tpl',8),(531,'./templates2/ocstyle/res_logtype.tpl',21),(531,'table:cache_status;field=name',0),(531,'table:log_types;field=name',0),(532,'./templates2/ocstyle/adminreports.tpl',178),(532,'./templates2/ocstyle/res_cachestatus.tpl',10),(532,'./templates2/ocstyle/res_logtype.tpl',23),(532,'./templates2/ocstyle/search.tpl.inc.php',49),(532,'./templates2/ocstyle/viewcache.tpl',98),(532,'table:cache_status;field=name',0),(532,'table:log_types;field=name',0),(533,'./templates2/ocstyle/res_cachestatus.tpl',14),(533,'table:cache_status;field=name',0),(534,'./templates2/ocstyle/res_cachestatus.tpl',16),(534,'table:cache_status;field=name',0),(535,'table:cache_type;field=name',0),(536,'table:cache_type;field=name',0),(537,'table:cache_type;field=name',0),(538,'table:cache_type;field=name',0),(539,'table:cache_type;field=name',0),(540,'table:cache_type;field=name',0),(541,'table:cache_type;field=name',0),(542,'table:cache_type;field=name',0),(544,'./templates2/ocstyle/myprofile.tpl',112),(545,'./templates2/ocstyle/mystatpic.tpl',29),(546,'./templates2/ocstyle/mystatpic.tpl',24),(547,'./templates2/ocstyle/change_statpic.tpl',9),(548,'./templates2/ocstyle/mystatpic.tpl',23),(549,'./templates2/ocstyle/change_statpic.tpl',23),(550,'./templates2/ocstyle/change_statpic.tpl',28),(552,'./templates2/ocstyle/addtolist.tpl',50),(552,'./templates2/ocstyle/adminreports.tpl',145),(552,'./templates2/ocstyle/change_statpic.tpl',89),(552,'./templates2/ocstyle/childwp.tpl',65),(552,'./templates2/ocstyle/imagebrowser.tpl',49),(552,'./templates2/ocstyle/map2.tpl',2343),(552,'./templates2/ocstyle/mydescription.tpl',51),(552,'./templates2/ocstyle/mydetails.tpl',90),(552,'./templates2/ocstyle/mylists.tpl',140),(552,'./templates2/ocstyle/myprofile.tpl',226),(553,'./lang/de/ocstyle/editcache.inc.php',17),(553,'./lang/de/ocstyle/editdesc.inc.php',28),(553,'./lang/de/ocstyle/editlog.inc.php',17),(553,'./templates2/ocstyle/adminreports.tpl',147),(553,'./templates2/ocstyle/cache_note.tpl',22),(553,'./templates2/ocstyle/change_statpic.tpl',90),(553,'./templates2/ocstyle/map2.tpl',2441),(553,'./templates2/ocstyle/mylists.tpl',144),(553,'./templates2/ocstyle/mywatches.tpl',101),(553,'src/Oc/Libse/ChildWp/EditPresenterChildWp.php',28),(554,'./templates2/ocstyle/change_statpic.tpl',17),(555,'table:sys_menu;field=menustring',0),(555,'table:sys_menu;field=title',0),(556,'./templates2/ocstyle/mystatpic.tpl',9),(556,'./templates2/ocstyle/mystatpic.tpl',17),(556,'table:sys_menu;field=menustring',0),(556,'table:sys_menu;field=title',0),(558,'./templates2/ocstyle/myprofile.tpl',186),(558,'./templates2/ocstyle/myprofile.tpl',190),(559,'./templates2/ocstyle/myprofile.tpl',173),(559,'./templates2/ocstyle/myprofile.tpl',181),(560,'./templates2/ocstyle/myprofile.tpl',164),(560,'./templates2/ocstyle/myprofile.tpl',168),(561,'./templates2/ocstyle/myprofile.tpl',160),(561,'./templates2/ocstyle/viewprofile.tpl',81),(562,'./templates2/ocstyle/myprofile.tpl',133),(563,'./templates2/ocstyle/myprofile.tpl',125),(564,'./templates2/ocstyle/myprofile.tpl',106),(565,'./templates2/ocstyle/myprofile.tpl',94),(566,'./lang/de/ocstyle/editcache.tpl.php',185),(566,'./lang/de/ocstyle/main.tpl.php',153),(566,'./lang/de/ocstyle/newcache.tpl.php',184),(566,'./templates2/ocstyle/myprofile.tpl',71),(566,'./templates2/ocstyle/register.tpl',42),(566,'./templates2/ocstyle/register.tpl',105),(566,'./templates2/ocstyle/search.tpl',445),(566,'./templates2/ocstyle/sys_main.tpl',154),(566,'./templates2/ocstyle/viewprofile.tpl',36),(567,'./templates2/ocstyle/adminuser.tpl',83),(567,'./templates2/ocstyle/myprofile.tpl',57),(567,'./templates2/ocstyle/register.tpl',37),(567,'./templates2/ocstyle/register.tpl',96),(568,'./templates2/ocstyle/adminuser.tpl',79),(568,'./templates2/ocstyle/myprofile.tpl',43),(568,'./templates2/ocstyle/register.tpl',32),(568,'./templates2/ocstyle/register.tpl',87),(569,'./templates2/ocstyle/newlogs.tpl',74),(569,'./templates2/ocstyle/res_logflags.tpl',5),(570,'./templates2/ocstyle/res_logentry_logitem.tpl',30),(571,'./templates2/ocstyle/res_logentry_logitem.tpl',32),(572,'./templates2/ocstyle/res_logentry_logitem.tpl',34),(573,'./templates2/ocstyle/res_logentry_logitem.tpl',36),(574,'./templates2/ocstyle/res_logentry_logitem.tpl',38),(575,'./templates2/ocstyle/res_logentry_logitem.tpl',54),(576,'./lang/de/ocstyle/editcache.inc.php',19),(576,'./lang/de/ocstyle/editcache.inc.php',37),(576,'./lang/de/ocstyle/editcache.inc.php',38),(576,'./lang/de/ocstyle/editcache.inc.php',44),(576,'./templates2/ocstyle/adminreports.tpl',142),(576,'./templates2/ocstyle/query.tpl',33),(576,'./templates2/ocstyle/res_cachelists.tpl',41),(576,'./templates2/ocstyle/res_logentry_logitem.tpl',63),(576,'./templates2/ocstyle/res_logentry_logitem.tpl',97),(576,'./templates2/ocstyle/search.result.caches.tpl',29),(576,'./templates2/ocstyle/viewcache.tpl',139),(577,'./lang/de/ocstyle/editcache.inc.php',18),(577,'./lang/de/ocstyle/editcache.inc.php',37),(577,'./lang/de/ocstyle/editcache.inc.php',38),(577,'./lang/de/ocstyle/editcache.inc.php',44),(577,'./templates2/ocstyle/adminuser.tpl',130),(577,'./templates2/ocstyle/query.tpl',33),(577,'./templates2/ocstyle/res_cachelists.tpl',41),(577,'./templates2/ocstyle/res_logentry_logitem.tpl',68),(577,'./templates2/ocstyle/res_logentry_logitem.tpl',98),(577,'src/Oc/Libse/ChildWp/DeletePresenterChildWp.php',28),(578,'./templates2/ocstyle/res_logentry_logitem.tpl',73),(579,'./templates2/ocstyle/res_logentry_logitem.tpl',87),(580,'./templates2/ocstyle/res_logentry.tpl',36),(581,'./templates2/ocstyle/myprofile.tpl',240),(581,'./templates2/ocstyle/newpw.tpl',31),(581,'./templates2/ocstyle/newpw.tpl',74),(582,'./templates2/ocstyle/res_logentry.tpl',16),(584,'./templates2/ocstyle/imagebrowser.tpl',31),(585,'./templates2/ocstyle/imagebrowser.tpl',45),(586,'./templates2/ocstyle/imagebrowser.tpl',48),(587,'./templates2/ocstyle/myprofile.tpl',9),(588,'./templates2/ocstyle/myprofile.tpl',19),(590,'./lang/de/ocstyle/login.tpl.php',37),(590,'./templates2/ocstyle/adminuser.tpl',39),(590,'./templates2/ocstyle/adoptcache.tpl',69),(590,'./templates2/ocstyle/login.tpl',46),(590,'./templates2/ocstyle/myprofile.tpl',27),(590,'./templates2/ocstyle/register.tpl',22),(590,'./templates2/ocstyle/register.tpl',74),(590,'./templates2/ocstyle/remindemail.tpl',23),(591,'./templates2/ocstyle/myprofile.tpl',84),(592,'./templates2/ocstyle/myprofile.tpl',118),(595,'./templates2/ocstyle/newpw.tpl',96),(596,'./templates2/ocstyle/newemail.tpl',40),(597,'./templates2/ocstyle/mydetails.tpl',93),(597,'./templates2/ocstyle/mydetails.tpl',120),(597,'./templates2/ocstyle/myprofile.tpl',224),(597,'./templates2/ocstyle/myprofile.tpl',247),(597,'./templates2/ocstyle/mystatpic.tpl',36),(597,'./templates2/ocstyle/newemail.tpl',109),(597,'./templates2/ocstyle/newpw.tpl',119),(598,'./templates2/ocstyle/newpw.tpl',39),(599,'./lib2/logic/user.class.php',622),(600,'./templates2/mail/newpw.tpl',6),(601,'./templates2/mail/newemail.tpl',8),(601,'./templates2/mail/newpw.tpl',8),(602,'./templates2/mail/newemail.tpl',9),(602,'./templates2/mail/newpw.tpl',9),(603,'./templates2/mail/newpw.tpl',11),(604,'./templates2/ocstyle/newpw.tpl',25),(605,'./templates2/ocstyle/newpw.tpl',43),(605,'./templates2/ocstyle/newpw.tpl',80),(606,'./templates2/ocstyle/newemail.tpl',48),(606,'./templates2/ocstyle/newpw.tpl',45),(607,'./templates2/ocstyle/newpw.tpl',47),(608,'./templates2/ocstyle/newpw.tpl',65),(609,'./templates2/ocstyle/newpw.tpl',82),(610,'./templates2/ocstyle/newemail.tpl',87),(610,'./templates2/ocstyle/newpw.tpl',85),(611,'./templates2/ocstyle/newemail.tpl',93),(611,'./templates2/ocstyle/newpw.tpl',91),(612,'./templates2/ocstyle/newemail.tpl',97),(612,'./templates2/ocstyle/newpw.tpl',93),(613,'./templates2/ocstyle/newpw.tpl',105),(613,'./templates2/ocstyle/register.tpl',139),(614,'./templates2/ocstyle/newpw.tpl',13),(615,'./lib2/logic/user.class.php',683),(616,'./templates2/mail/newemail.tpl',6),(617,'./templates2/mail/newemail.tpl',11),(618,'./templates2/ocstyle/newemail.tpl',9),(619,'./templates2/ocstyle/newemail.tpl',26),(620,'./templates2/ocstyle/newemail.tpl',32),(620,'./templates2/ocstyle/newemail.tpl',75),(621,'./templates2/ocstyle/newemail.tpl',44),(622,'./templates2/ocstyle/newemail.tpl',69),(623,'./templates2/ocstyle/newemail.tpl',78),(624,'./templates2/ocstyle/newemail.tpl',95),(625,'./templates2/ocstyle/newemail.tpl',13),(626,'./templates2/ocstyle/query.tpl',19),(626,'./templates2/ocstyle/search.result.caches.tpl',86),(626,'./templates2/ocstyle/search.result.caches.tpl',198),(627,'./templates2/ocstyle/query.tpl',36),(628,'./templates2/ocstyle/query.tpl',41),(629,'./templates2/ocstyle/query.tpl',61),(630,'./templates2/ocstyle/query.tpl',66),(631,'./templates2/ocstyle/query.tpl',69),(631,'./templates2/ocstyle/query.tpl',102),(632,'./templates2/ocstyle/query.tpl',75),(633,'./templates2/ocstyle/query.tpl',77),(634,'./templates2/ocstyle/query.tpl',82),(634,'./templates2/ocstyle/query.tpl',122),(635,'./templates2/ocstyle/query.tpl',99),(636,'./templates2/ocstyle/query.tpl',107),(637,'./templates2/ocstyle/query.tpl',111),(638,'./templates2/ocstyle/mytop5.tpl',10),(639,'./templates2/ocstyle/mytop5.tpl',15),(640,'./templates2/ocstyle/mytop5.tpl',41),(641,'./templates2/ocstyle/mytop5.tpl',44),(642,'./templates2/ocstyle/myignores.tpl',10),(643,'./templates2/ocstyle/res_cachelists.tpl',42),(644,'./templates2/ocstyle/myignores.tpl',32),(645,'./templates2/ocstyle/mywatches.tpl',47),(646,'./templates2/ocstyle/mywatches.tpl',53),(647,'./templates2/ocstyle/mywatches.tpl',56),(648,'./templates2/ocstyle/mywatches.tpl',57),(649,'./templates2/ocstyle/mywatches.tpl',58),(650,'./templates2/ocstyle/mywatches.tpl',65),(651,'./templates2/ocstyle/mywatches.tpl',71),(652,'./templates2/ocstyle/mywatches.tpl',77),(653,'./templates2/ocstyle/mywatches.tpl',88),(654,'./templates2/ocstyle/mywatches.tpl',92),(655,'./templates2/ocstyle/mywatches.tpl',94),(656,'./templates2/ocstyle/mywatches.tpl',119),(657,'./templates2/ocstyle/mywatches.tpl',134),(658,'./templates2/ocstyle/mywatches.tpl',153),(659,'table:sys_menu;field=menustring',0),(659,'table:sys_menu;field=title',0),(660,'./templates2/ocstyle/remindemail.tpl',10),(661,'./templates2/ocstyle/remindemail.tpl',17),(662,'./templates2/ocstyle/remindemail.tpl',30),(663,'./templates2/ocstyle/remindemail.tpl',32),(664,'./templates2/ocstyle/remindemail.tpl',36),(665,'./lib2/logic/user.class.php',731),(666,'./templates2/mail/remindemail.tpl',8),(667,'./templates2/mail/remindemail.tpl',6),(668,'./templates2/ocstyle/recommendations.tpl',9),(669,'./templates2/ocstyle/recommendations.tpl',21),(670,'./templates2/ocstyle/recommendations.tpl',29),(671,'./templates2/ocstyle/recommendations.tpl',44),(672,'./templates2/ocstyle/dbmaintain.tpl',9),(672,'table:sys_menu;field=title',0),(673,'table:sys_menu;field=menustring',0),(674,'./templates2/ocstyle/dbmaintain.tpl',27),(675,'./templates2/ocstyle/dbmaintain.tpl',34),(676,'./templates2/ocstyle/mailto.tpl',100),(676,'./templates2/ocstyle/reportcache.tpl',108),(676,'./templates2/ocstyle/viewcache.tpl',305),(676,'./templates2/ocstyle/viewcache.tpl',530),(677,'./lib2/logic/user.class.php',824),(678,'./templates2/ocstyle/error.tpl',38),(679,'./templates2/ocstyle/error.tpl',40),(680,'./templates2/ocstyle/mailto.tpl',94),(681,'./templates2/mail/usercontactmail.tpl',14),(682,'./templates2/mail/usercontactmail.tpl',19),(682,'./templates2/ocstyle/mailto.tpl',19),(682,'./templates2/ocstyle/mailto.tpl',49),(683,'./templates2/ocstyle/mailto.tpl',86),(684,'./templates2/mail/usercontactmail.tpl',10),(685,'./templates2/ocstyle/mailto.tpl',13),(686,'./templates2/ocstyle/mailto.tpl',24),(686,'./templates2/ocstyle/mailto.tpl',58),(687,'./templates2/ocstyle/mailto.tpl',36),(688,'./templates2/ocstyle/mailto.tpl',54),(689,'./templates2/ocstyle/mailto.tpl',67),(690,'./templates2/ocstyle/mailto.tpl',73),(691,'./templates2/ocstyle/mailto.tpl',79),(692,'./templates2/ocstyle/mailto.tpl',82),(693,'./templates2/ocstyle/mailto.tpl',84),(694,'./templates2/ocstyle/mailto.tpl',85),(696,'./templates2/ocstyle/error.tpl',42),(697,'./templates2/ocstyle/viewcache.tpl',580),(698,'./lang/de/ocstyle/lib/menu.php',72),(698,'./lang/de/ocstyle/lib/menu.php',73),(698,'table:sys_menu;field=menustring',0),(698,'table:sys_menu;field=title',0),(699,'./templates2/ocstyle/error.tpl',51),(701,'./templates2/ocstyle/garmin.tpl',40),(701,'./templates2/ocstyle/res_difficon.tpl',7),(701,'./templates2/ocstyle/search.tpl.inc.php',58),(702,'./templates2/ocstyle/garmin.tpl',42),(702,'./templates2/ocstyle/res_terricon.tpl',7),(702,'./templates2/ocstyle/search.tpl.inc.php',59),(703,'./templates2/ocstyle/viewcache.tpl',182),(704,'./templates2/ocstyle/log_cache.tpl',349),(704,'./templates2/ocstyle/viewcache.tpl',120),(705,'./templates2/ocstyle/search.result.caches.tpl',30),(705,'./templates2/ocstyle/viewcache.tpl',124),(706,'./templates2/ocstyle/addtolist.tpl',29),(706,'./templates2/ocstyle/res_cachelists.tpl',43),(706,'./templates2/ocstyle/search.result.caches.tpl',30),(706,'./templates2/ocstyle/viewcache.tpl',126),(706,'./templates2/ocstyle/viewprofile.tpl',197),(707,'./templates2/ocstyle/viewcache.tpl',131),(708,'./templates2/ocstyle/viewcache.tpl',133),(709,'./templates2/ocstyle/viewcache.tpl',288),(710,'./templates2/ocstyle/viewcache.tpl',220),(710,'./templates2/ocstyle/viewcache.tpl',408),(712,'./templates2/ocstyle/viewcache.tpl',230),(712,'./templates2/ocstyle/viewcache_print.tpl',73),(713,'./templates2/ocstyle/search.tpl',485),(715,'./templates2/ocstyle/viewcache.tpl',236),(715,'./templates2/ocstyle/viewcache_print.tpl',84),(716,'./templates2/ocstyle/search.result.caches.tpl',145),(716,'./templates2/ocstyle/search.tpl',486),(717,'./templates2/ocstyle/viewcache.tpl',238),(717,'./templates2/ocstyle/viewcache_print.tpl',86),(718,'./templates2/ocstyle/coordinates.tpl',10),(718,'./templates2/ocstyle/restorecaches.tpl',80),(718,'./templates2/ocstyle/restorecaches.tpl',133),(719,'./templates2/ocstyle/viewcache.tpl',242),(720,'./templates2/ocstyle/res_userstats.tpl',90),(720,'./templates2/ocstyle/viewcache.tpl',253),(720,'./templates2/ocstyle/viewcache_print.tpl',115),(721,'./templates2/ocstyle/res_cachelists.tpl',19),(721,'./templates2/ocstyle/viewcache.tpl',255),(721,'./templates2/ocstyle/viewcache_print.tpl',117),(722,'./templates2/ocstyle/viewcache.tpl',256),(722,'./templates2/ocstyle/viewcache_print.tpl',118),(723,'./templates2/ocstyle/viewcache.tpl',257),(723,'./templates2/ocstyle/viewcache_print.tpl',119),(724,'./lang/de/ocstyle/editcache.tpl.php',245),(724,'./lang/de/ocstyle/newcache.tpl.php',242),(725,'./templates2/ocstyle/viewcache.tpl',434),(725,'./templates2/ocstyle/viewcache_print.tpl',246),(726,'./templates2/ocstyle/viewcache.tpl',437),(726,'./templates2/ocstyle/viewcache.tpl',439),(726,'./templates2/ocstyle/viewcache_print.tpl',250),(726,'./templates2/ocstyle/viewcache_print.tpl',254),(726,'./templates2/ocstyle/viewcache_print.tpl',258),(727,'./lang/de/ocstyle/editcache.tpl.php',282),(727,'./templates2/ocstyle/search.tpl',677),(727,'./templates2/ocstyle/viewcache.tpl',464),(727,'./templates2/ocstyle/viewcache_print.tpl',303),(728,'./templates2/ocstyle/viewcache.tpl',487),(729,'./templates2/ocstyle/viewcache.tpl',519),(730,'./templates2/ocstyle/viewcache.tpl',524),(731,'./templates2/ocstyle/search.tpl',386),(731,'./templates2/ocstyle/search.tpl',405),(731,'./templates2/ocstyle/viewcache.tpl',525),(732,'./templates2/ocstyle/viewcache.tpl',526),(733,'./templates2/ocstyle/viewcache.tpl',531),(734,'./templates2/ocstyle/search.result.caches.tpl',201),(734,'./templates2/ocstyle/search.result.caches.tpl',209),(734,'./templates2/ocstyle/viewcache.tpl',532),(735,'./templates2/ocstyle/search.result.caches.tpl',202),(735,'./templates2/ocstyle/search.result.caches.tpl',210),(735,'./templates2/ocstyle/viewcache.tpl',533),(736,'./templates2/ocstyle/search.result.caches.tpl',203),(736,'./templates2/ocstyle/search.result.caches.tpl',211),(736,'./templates2/ocstyle/viewcache.tpl',534),(737,'./templates2/ocstyle/search.result.caches.tpl',204),(737,'./templates2/ocstyle/search.result.caches.tpl',212),(737,'./templates2/ocstyle/viewcache.tpl',535),(738,'./templates2/ocstyle/search.result.caches.tpl',205),(738,'./templates2/ocstyle/search.result.caches.tpl',213),(738,'./templates2/ocstyle/viewcache.tpl',536),(739,'./templates2/ocstyle/search.result.caches.tpl',206),(739,'./templates2/ocstyle/search.result.caches.tpl',214),(739,'./templates2/ocstyle/viewcache.tpl',537),(740,'./templates2/mail/usercontactmail.tpl',6),(741,'./lang/de/ocstyle/lib/menu.php',234),(741,'./lang/de/ocstyle/lib/menu.php',237),(741,'./templates2/ocstyle/picture.tpl',45),(741,'table:sys_menu;field=menustring',0),(741,'table:sys_menu;field=title',0),(742,'./templates2/ocstyle/error.tpl',64),(743,'./templates2/ocstyle/error.tpl',30),(744,'table:profile_options;field=name',0),(745,'table:profile_options;field=name',0),(747,'table:profile_options;field=name',0),(748,'table:profile_options;field=name',0),(749,'./templates2/ocstyle/viewcache.tpl',143),(750,'./templates2/ocstyle/adminreports.tpl',59),(750,'table:sys_menu;field=menustring',0),(750,'table:sys_menu;field=title',0),(751,'./templates2/ocstyle/picture.tpl',78),(752,'./templates2/ocstyle/picture.tpl',14),(753,'./templates2/ocstyle/picture.tpl',52),(754,'./templates2/ocstyle/picture.tpl',54),(755,'./templates2/ocstyle/picture.tpl',58),(756,'./templates2/ocstyle/picture.tpl',60),(757,'./lang/de/ocstyle/editcache.tpl.php',120),(757,'./lang/de/ocstyle/newcache.tpl.php',142),(757,'./templates2/ocstyle/map2.tpl',2437),(757,'./templates2/ocstyle/mylists.tpl',64),(758,'./templates2/ocstyle/picture.tpl',72),(759,'./templates2/ocstyle/picture.tpl',132),(760,'./templates2/ocstyle/picture.tpl',100),(761,'./templates2/ocstyle/picture.tpl',150),(762,'./templates2/ocstyle/picture.tpl',130),(763,'./templates2/ocstyle/picture.tpl',131),(764,'./templates2/ocstyle/reportcache.tpl',14),(765,'./templates2/ocstyle/adminreports.tpl',127),(765,'./templates2/ocstyle/reportcache.tpl',20),(765,'./templates2/ocstyle/reportcache.tpl',69),(766,'./templates2/ocstyle/adminreports.tpl',134),(766,'./templates2/ocstyle/reportcache.tpl',25),(767,'./templates2/ocstyle/reportcache.tpl',38),(768,'./templates2/ocstyle/reportcache.tpl',83),(769,'./templates2/ocstyle/reportcache.tpl',87),(770,'./templates2/ocstyle/reportcache.tpl',96),(771,'./templates2/ocstyle/reportcache.tpl',102),(772,'table:sys_menu;field=menustring',0),(772,'table:sys_menu;field=title',0),(773,'./templates2/ocstyle/search.result.caches.row.tpl',16),(773,'./templates2/ocstyle/search.tpl.inc.php',35),(773,'./templates2/ocstyle/translate.tpl',222),(773,'table:cache_report_status;field=name',0),(774,'table:cache_report_status;field=name',0),(775,'table:cache_report_status;field=name',0),(776,'table:cache_report_reasons;field=name',0),(777,'table:cache_report_reasons;field=name',0),(778,'table:cache_report_reasons;field=name',0),(779,'table:cache_report_reasons;field=name',0),(780,'./templates2/ocstyle/adminreports.tpl',64),(781,'./templates2/ocstyle/adminreports.tpl',66),(782,'./templates2/ocstyle/adminreports.tpl',68),(783,'./templates2/ocstyle/adminreports.tpl',70),(784,'./templates2/ocstyle/adminreports.tpl',94),(785,'./templates2/ocstyle/adminreports.tpl',104),(786,'./templates2/ocstyle/adminreports.tpl',104),(788,'./templates2/ocstyle/adminreports.tpl',163),(789,'./templates2/ocstyle/adminreports.tpl',165),(792,'./templates2/ocstyle/adminreports.tpl',165),(793,'./templates2/ocstyle/adminreports.tpl',157),(794,'./templates2/ocstyle/reportcache.tpl',44),(795,'./templates2/ocstyle/picture.tpl',117),(796,'./templates2/ocstyle/mydetails.tpl',81),(797,'./templates2/ocstyle/adminhistory.tpl',124),(797,'./templates2/ocstyle/restorecaches.tpl',81),(797,'./templates2/ocstyle/viewcache.tpl',220),(797,'./templates2/ocstyle/viewcache.tpl',417),(798,'./templates2/ocstyle/viewcache.tpl',554),(798,'./templates2/ocstyle/viewcache_print.tpl',370),(799,'table:sys_menu;field=menustring',0),(799,'table:sys_menu;field=title',0),(801,'table:sys_menu;field=menustring',0),(801,'table:sys_menu;field=title',0),(802,'./templates2/ocstyle/mydescription.tpl',10),(802,'./templates2/ocstyle/mydetails.tpl',9),(803,'./templates2/ocstyle/mydetails.tpl',18),(805,'./templates2/ocstyle/mydetails.tpl',25),(806,'./templates2/ocstyle/mydetails.tpl',26),(807,'./templates2/ocstyle/mydetails.tpl',27),(808,'./templates2/ocstyle/mydetails.tpl',28),(809,'./templates2/ocstyle/mydetails.tpl',69),(810,'./templates2/ocstyle/mydetails.tpl',71),(811,'./templates2/ocstyle/mydetails.tpl',74),(812,'./templates2/ocstyle/adminreports.tpl',80),(812,'./templates2/ocstyle/adminreports.tpl',98),(814,'./templates2/ocstyle/viewprofile.tpl',106),(815,'./templates2/ocstyle/adminhistory.tpl',17),(815,'./templates2/ocstyle/mydetails.tpl',64),(815,'./templates2/ocstyle/res_userstats.tpl',12),(815,'./templates2/ocstyle/res_userstats.tpl',40),(815,'./templates2/ocstyle/res_userstats.tpl',85),(815,'./templates2/ocstyle/res_userstats.tpl',92),(815,'./templates2/ocstyle/res_userstats.tpl',100),(815,'./templates2/ocstyle/res_userstats.tpl',109),(815,'./templates2/ocstyle/res_userstats.tpl',117),(817,'./templates2/ocstyle/viewcache.tpl',84),(817,'./templates2/ocstyle/viewcache_print.tpl',54),(818,'./templates2/ocstyle/translate.tpl',26),(819,'./templates2/ocstyle/error.tpl',44),(821,'./templates2/ocstyle/adminreports.tpl',182),(821,'./templates2/ocstyle/res_cachestatus.tpl',18),(821,'table:cache_status;field=name',0),(822,'./templates2/ocstyle/adminreports.tpl',184),(822,'./templates2/ocstyle/res_cachestatus.tpl',20),(822,'./templates2/ocstyle/res_logtype.tpl',27),(822,'table:cache_status;field=name',0),(822,'table:log_types;field=name',0),(823,'./templates2/ocstyle/adminhistory.tpl',48),(823,'./templates2/ocstyle/adminreports.tpl',119),(823,'./templates2/ocstyle/adminuser.tpl',55),(826,'./lang/de/ocstyle/newdesc.tpl.php',48),(826,'./templates2/ocstyle/reportcache.tpl',71),(827,'table:sys_menu;field=menustring',0),(827,'table:sys_menu;field=title',0),(828,'./templates2/ocstyle/adminhistory.tpl',94),(828,'./templates2/ocstyle/adminhistory.tpl',123),(828,'./templates2/ocstyle/adminhistory.tpl',156),(828,'./templates2/ocstyle/adminreports.tpl',75),(828,'./templates2/ocstyle/adminreports.tpl',82),(828,'./templates2/ocstyle/adoptcache.tpl',22),(828,'./templates2/ocstyle/restorecaches.tpl',132),(829,'./templates2/ocstyle/adoptcache.tpl',159),(830,'./templates2/ocstyle/adoptcache.tpl',152),(831,'./templates2/ocstyle/adoptcache.tpl',148),(832,'./templates2/ocstyle/adoptcache.tpl',147),(833,'./templates2/ocstyle/adoptcache.tpl',144),(834,'./templates2/ocstyle/adoptcache.tpl',132),(835,'./templates2/ocstyle/adoptcache.tpl',123),(836,'./templates2/ocstyle/adoptcache.tpl',105),(837,'./templates2/ocstyle/adoptcache.tpl',84),(839,'./templates2/ocstyle/adoptcache.tpl',52),(840,'./templates2/ocstyle/adoptcache.tpl',44),(841,'./templates2/ocstyle/adoptcache.tpl',125),(842,'./templates2/ocstyle/adoptcache.tpl',15),(843,'./templates2/ocstyle/adminuser.tpl',17),(843,'./templates2/ocstyle/adoptcache.tpl',73),(844,'./templates2/ocstyle/adoptcache.tpl',77),(845,'./templates2/ocstyle/adoptcache.tpl',89),(846,'./templates2/ocstyle/adoptcache.tpl',164),(847,'./templates2/ocstyle/res_passworderror.tpl',18),(849,'./templates2/ocstyle/res_passworderror.tpl',16),(850,'./templates2/ocstyle/res_passworderror.tpl',14),(851,'./templates2/ocstyle/res_passworderror.tpl',13),(852,'./templates2/ocstyle/res_passworderror.tpl',12),(853,'./templates2/ocstyle/res_passworderror.tpl',10),(854,'./templates2/ocstyle/res_passworderror.tpl',8),(855,'./templates2/ocstyle/res_passworderror.tpl',7),(856,'table:countries;field=name',0),(857,'table:countries;field=name',0),(859,'table:sys_menu;field=menustring',0),(859,'table:sys_menu;field=title',0),(860,'./templates2/ocstyle/adminuser.tpl',143),(860,'./templates2/ocstyle/restorecaches.tpl',174),(861,'./templates2/ocstyle/adminuser.tpl',124),(862,'./templates2/ocstyle/adminuser.tpl',106),(862,'./templates2/ocstyle/viewprofile.tpl',66),(862,'table:cache_type;field=short2',0),(863,'./templates2/ocstyle/adminuser.tpl',105),(864,'./templates2/ocstyle/adminuser.tpl',97),(865,'./templates2/ocstyle/adminuser.tpl',93),(866,'./templates2/ocstyle/adminuser.tpl',87),(866,'./templates2/ocstyle/search.tpl',750),(867,'./templates2/ocstyle/adminuser.tpl',59),(868,'./templates2/ocstyle/adminuser.tpl',51),(869,'./templates2/ocstyle/adminuser.tpl',9),(870,'./templates2/ocstyle/adminuser.tpl',34),(871,'./templates2/ocstyle/activation.tpl',38),(871,'./templates2/ocstyle/adminuser.tpl',47),(871,'./templates2/ocstyle/register.tpl',27),(871,'./templates2/ocstyle/register.tpl',121),(872,'./templates2/ocstyle/garmin.tpl',45),(875,'./templates2/ocstyle/res_oconly81.tpl',10),(876,'./templates2/ocstyle/res_oconly81.tpl',27),(877,'./templates2/ocstyle/viewcache.tpl',530),(882,'./templates2/ocstyle/start.tpl',97),(884,'./templates2/ocstyle/res_newratings.tpl',14),(884,'./templates2/ocstyle/res_newratings.tpl',15),(884,'./templates2/ocstyle/res_newratings.tpl',16),(884,'./templates2/ocstyle/res_newratings.tpl',18),(885,'./templates2/ocstyle/res_newratings.tpl',39),(887,'./templates2/ocstyle/viewprofile.tpl',46),(888,'./templates2/ocstyle/viewprofile.tpl',48),(889,'./templates2/ocstyle/viewprofile.tpl',50),(890,'./templates2/ocstyle/viewprofile.tpl',52),(891,'./templates2/ocstyle/viewprofile.tpl',54),(892,'./templates2/ocstyle/viewprofile.tpl',61),(892,'./templates2/ocstyle/viewprofile.tpl',63),(893,'./templates2/ocstyle/adminuser.tpl',75),(894,'./templates2/ocstyle/map2.tpl',1190),(894,'./templates2/ocstyle/translate.tpl',297),(900,'./lang/de/ocstyle/main.tpl.php',263),(900,'./lang/de/ocstyle/main.tpl.php',266),(900,'./templates2/ocstyle/sys_main.tpl',254),(900,'./templates2/ocstyle/sys_main.tpl',257),(900,'table:sys_menu;field=menustring',0),(900,'table:sys_menu;field=title',0),(902,'./lang/de/ocstyle/editdesc.tpl.php',71),(902,'./lang/de/ocstyle/editlog.tpl.php',132),(902,'./lang/de/ocstyle/newcache.tpl.php',294),(902,'./lang/de/ocstyle/newdesc.tpl.php',71),(902,'./templates2/ocstyle/log_cache.tpl',304),(902,'./templates2/ocstyle/search.tpl',668),(906,'table:sys_menu;field=menustring',0),(906,'table:sys_menu;field=title',0),(907,'table:sys_menu;field=menustring',0),(907,'table:sys_menu;field=title',0),(915,'./templates2/ocstyle/translate.tpl',292),(916,'./templates2/ocstyle/translate.tpl',257),(921,'./templates2/ocstyle/viewcache.tpl',499),(921,'./templates2/ocstyle/viewcache.tpl',510),(921,'./templates2/ocstyle/viewprofile.tpl',172),(922,'./lib2/OcSmarty.class.php',333),(923,'./templates2/ocstyle/error.tpl',24),(933,'./templates2/ocstyle/translate.tpl',38),(954,'./templates2/ocstyle/reportcache.tpl',75),(1059,'./templates2/ocstyle/myprofile.tpl',34),(1059,'./templates2/ocstyle/register.tpl',80),(1060,'./lang/de/ocstyle/login.tpl.php',65),(1060,'./templates2/ocstyle/login.tpl',74),(1061,'./lang/de/ocstyle/main.tpl.php',332),(1061,'./templates2/ocstyle/sys_main.tpl',338),(1062,'./lang/de/ocstyle/main.tpl.php',310),(1063,'./lang/de/ocstyle/main.tpl.php',311),(1123,'./templates2/ocstyle/restorecaches.tpl',84),(1123,'./templates2/ocstyle/search.tpl',484),(1123,'./templates2/ocstyle/search.tpl',632),(1123,'./templates2/ocstyle/search.tpl',676),(1141,'./lang/de/ocstyle/editcache.tpl.php',166),(1141,'./lang/de/ocstyle/newcache.tpl.php',167),(1141,'./templates2/ocstyle/coordinate_input.tpl',10),(1141,'./templates2/ocstyle/search.tpl',586),(1142,'./lang/de/ocstyle/editcache.tpl.php',167),(1142,'./lang/de/ocstyle/newcache.tpl.php',168),(1142,'./templates2/ocstyle/coordinate_input.tpl',11),(1142,'./templates2/ocstyle/search.tpl',587),(1143,'./lang/de/ocstyle/editcache.tpl.php',174),(1143,'./lang/de/ocstyle/newcache.tpl.php',174),(1143,'./templates2/ocstyle/coordinate_input.tpl',24),(1143,'./templates2/ocstyle/search.tpl',593),(1144,'./lang/de/ocstyle/editcache.tpl.php',175),(1144,'./lang/de/ocstyle/newcache.tpl.php',175),(1144,'./templates2/ocstyle/coordinate_input.tpl',25),(1144,'./templates2/ocstyle/search.tpl',594),(1146,'./templates2/ocstyle/search.tpl',566),(1164,'./templates2/ocstyle/map2.tpl',1822),(1165,'./templates2/ocstyle/map2.tpl',85),(1166,'./templates2/ocstyle/map2.tpl',2265),(1206,'./lang/de/ocstyle/newcache.tpl.php',211),(1208,'./lang/de/ocstyle/newcache.tpl.php',208),(1269,'./lang/de/ocstyle/lib/menu.php',213),(1269,'./lang/de/ocstyle/lib/menu.php',214),(1269,'./templates2/ocstyle/map2.tpl',1540),(1269,'table:sys_menu;field=menustring',0),(1269,'table:sys_menu;field=title',0),(1272,'./templates2/ocstyle/map2.tpl',2280),(1275,'./lang/de/ocstyle/main.tpl.php',235),(1275,'./templates2/ocstyle/sys_main.tpl',231),(1278,'./lang/de/ocstyle/editdesc.tpl.php',67),(1278,'./lang/de/ocstyle/editlog.tpl.php',128),(1278,'./lang/de/ocstyle/newcache.tpl.php',290),(1278,'./lang/de/ocstyle/newdesc.tpl.php',67),(1278,'./templates2/ocstyle/log_cache.tpl',300),(1278,'./templates2/ocstyle/mydescription.tpl',26),(1278,'./templates2/ocstyle/mylists.tpl',96),(1279,'./lang/de/ocstyle/editdesc.tpl.php',69),(1279,'./lang/de/ocstyle/editlog.tpl.php',130),(1279,'./lang/de/ocstyle/newcache.tpl.php',292),(1279,'./lang/de/ocstyle/newdesc.tpl.php',69),(1279,'./templates2/ocstyle/log_cache.tpl',302),(1279,'./templates2/ocstyle/mydescription.tpl',28),(1279,'./templates2/ocstyle/mylists.tpl',98),(1292,'./lang/de/ocstyle/editlog.tpl.php',59),(1292,'./templates2/ocstyle/log_cache.tpl',55),(1296,'./templates2/ocstyle/picture.tpl',91),(1297,'./templates2/ocstyle/event_attendance.tpl',10),(1298,'./templates2/ocstyle/tops.tpl',15),(1299,'./translate.php',739),(1299,'./translate.php',895),(1300,'./translate.php',751),(1301,'./templates2/ocstyle/translate.tpl',47),(1302,'./templates2/ocstyle/translate.tpl',49),(1303,'./templates2/ocstyle/translate.tpl',50),(1304,'./templates2/ocstyle/translate.tpl',143),(1305,'./templates2/ocstyle/translate.tpl',146),(1306,'./templates2/ocstyle/translate.tpl',154),(1306,'./templates2/ocstyle/translate.tpl',164),(1307,'./templates2/ocstyle/translate.tpl',182),(1308,'./templates2/ocstyle/translate.tpl',184),(1309,'./templates2/ocstyle/translate.tpl',186),(1310,'./templates2/ocstyle/translate.tpl',214),(1311,'./templates2/ocstyle/translate.tpl',232),(1312,'./templates2/ocstyle/translate.tpl',234),(1317,'./lang/de/ocstyle/editlog.inc.php',24),(1317,'./lang/de/ocstyle/editlog.inc.php',26),(1317,'./templates2/ocstyle/log_cache.tpl',334),(1319,'./lang/de/ocstyle/editlog.inc.php',26),(1319,'./templates2/ocstyle/log_cache.tpl',335),(1323,'./templates2/ocstyle/log_cache.tpl',222),(1326,'./lang/de/ocstyle/rating.inc.php',21),(1326,'./templates2/ocstyle/log_cache.tpl',282),(1327,'./templates2/ocstyle/log_cache.tpl',290),(1328,'./lang/de/ocstyle/rating.inc.php',29),(1328,'./templates2/ocstyle/log_cache.tpl',284),(1329,'./lang/de/ocstyle/rating.inc.php',31),(1329,'./templates2/ocstyle/log_cache.tpl',288),(1330,'./templates2/ocstyle/log_cache.tpl',285),(1331,'table:attribute_groups;field=name',0),(1332,'table:attribute_groups;field=name',0),(1333,'table:attribute_groups;field=name',0),(1334,'table:attribute_groups;field=name',0),(1335,'table:attribute_groups;field=name',0),(1336,'table:attribute_groups;field=name',0),(1337,'./templates2/ocstyle/viewcache.tpl',240),(1337,'table:attribute_groups;field=name',0),(1338,'table:attribute_groups;field=name',0),(1339,'table:attribute_groups;field=name',0),(1340,'table:attribute_groups;field=name',0),(1341,'table:attribute_groups;field=name',0),(1342,'table:attribute_categories;field=name',0),(1343,'table:attribute_categories;field=name',0),(1344,'table:attribute_categories;field=name',0),(1345,'table:cache_attrib;field=name',0),(1346,'./lang/de/ocstyle/editcache.tpl.php',207),(1346,'./lang/de/ocstyle/newcache.tpl.php',205),(1347,'./lang/de/ocstyle/editcache.tpl.php',219),(1348,'./lang/de/ocstyle/editcache.tpl.php',225),(1349,'./lang/de/ocstyle/editcache.tpl.php',235),(1349,'./lang/de/ocstyle/newcache.tpl.php',233),(1351,'./lang/de/ocstyle/editcache.tpl.php',261),(1352,'./lang/de/ocstyle/editcache.tpl.php',263),(1353,'./lang/de/ocstyle/editcache.tpl.php',271),(1354,'./lang/de/ocstyle/editcache.inc.php',41),(1355,'./lang/de/ocstyle/editcache.tpl.php',284),(1356,'./templates2/ocstyle/map2.tpl',1194),(1356,'./templates2/ocstyle/viewcache.tpl',237),(1356,'./templates2/ocstyle/viewcache_print.tpl',85),(1357,'./templates2/ocstyle/map2.tpl',1198),(1358,'./templates2/ocstyle/map2.tpl',1201),(1359,'./templates2/ocstyle/map2.tpl',1204),(1360,'./templates2/ocstyle/map2.tpl',1210),(1361,'./templates2/ocstyle/map2.tpl',1213),(1362,'./lang/de/ocstyle/editlog.tpl.php',79),(1363,'./lang/de/ocstyle/editlog.tpl.php',92),(1364,'./lang/de/ocstyle/editdesc.tpl.php',77),(1364,'./lang/de/ocstyle/editlog.tpl.php',138),(1364,'./lang/de/ocstyle/newcache.tpl.php',300),(1364,'./lang/de/ocstyle/newdesc.tpl.php',77),(1364,'./templates2/ocstyle/log_cache.tpl',310),(1366,'./lang/de/ocstyle/editcache.tpl.php',126),(1366,'./templates2/ocstyle/search.tpl',714),(1367,'./lang/de/ocstyle/editcache.tpl.php',146),(1367,'./lang/de/ocstyle/newcache.tpl.php',147),(1367,'./templates2/ocstyle/search.tpl',379),(1368,'./lang/de/ocstyle/editcache.tpl.php',154),(1368,'./lang/de/ocstyle/newcache.tpl.php',155),(1368,'./templates2/ocstyle/search.tpl.inc.php',57),(1368,'./templates2/ocstyle/viewcache.tpl',222),(1368,'./templates2/ocstyle/viewcache_print.tpl',71),(1369,'./lang/de/ocstyle/editcache.tpl.php',163),(1369,'./lang/de/ocstyle/newcache.tpl.php',164),(1370,'./lang/de/ocstyle/editcache.tpl.php',195),(1370,'./lang/de/ocstyle/newcache.tpl.php',193),(1371,'./lang/de/ocstyle/editcache.tpl.php',197),(1371,'./lang/de/ocstyle/newcache.tpl.php',195),(1371,'./templates2/ocstyle/garmin.tpl',39),(1371,'./templates2/ocstyle/map2.tpl',1190),(1371,'./templates2/ocstyle/map2.tpl',2542),(1371,'./templates2/ocstyle/search.tpl',413),(1371,'./templates2/ocstyle/viewcache_print.tpl',40),(1372,'./lang/de/ocstyle/editcache.tpl.php',201),(1372,'./lang/de/ocstyle/newcache.tpl.php',199),(1372,'./templates2/ocstyle/garmin.tpl',41),(1372,'./templates2/ocstyle/map2.tpl',1190),(1372,'./templates2/ocstyle/map2.tpl',2573),(1372,'./templates2/ocstyle/search.tpl',427),(1372,'./templates2/ocstyle/viewcache_print.tpl',42),(1373,'./lang/de/ocstyle/editcache.tpl.php',209),(1373,'./lang/de/ocstyle/newcache.tpl.php',207),(1374,'./lang/de/ocstyle/editcache.tpl.php',218),(1374,'./lang/de/ocstyle/editcache.tpl.php',234),(1374,'./lang/de/ocstyle/editcache.tpl.php',271),(1374,'./lang/de/ocstyle/editcache.tpl.php',308),(1374,'./lang/de/ocstyle/editcache.tpl.php',332),(1374,'./lang/de/ocstyle/editcache.tpl.php',346),(1374,'./lang/de/ocstyle/newcache.tpl.php',136),(1374,'./lang/de/ocstyle/newcache.tpl.php',216),(1374,'./lang/de/ocstyle/newcache.tpl.php',232),(1374,'./lang/de/ocstyle/newcache.tpl.php',273),(1374,'./lang/de/ocstyle/newcache.tpl.php',332),(1374,'./lang/de/ocstyle/newcache.tpl.php',348),(1374,'./lang/de/ocstyle/newcache.tpl.php',376),(1374,'./lang/de/ocstyle/varset.inc.php',77),(1376,'./lang/de/ocstyle/editcache.tpl.php',325),(1376,'./lang/de/ocstyle/newcache.tpl.php',338),(1377,'./lang/de/ocstyle/editcache.tpl.php',342),(1377,'./lang/de/ocstyle/newcache.tpl.php',372),(1378,'./lang/de/ocstyle/editcache.tpl.php',347),(1378,'./lang/de/ocstyle/newcache.tpl.php',377),(1379,'./templates2/ocstyle/map2.tpl',2192),(1379,'./templates2/ocstyle/map2.tpl',2641),(1379,'./templates2/ocstyle/search.tpl',342),(1380,'./templates2/ocstyle/search.tpl',356),(1381,'./templates2/ocstyle/search.tpl',503),(1382,'./templates2/ocstyle/search.tpl',482),(1383,'./templates2/ocstyle/myhome.tpl',153),(1383,'./templates2/ocstyle/search.tpl',487),(1384,'./templates2/ocstyle/search.tpl',494),(1386,'./templates2/ocstyle/search.tpl',363),(1387,'./templates2/ocstyle/search.tpl',365),(1388,'./templates2/ocstyle/map2.tpl',2496),(1388,'./templates2/ocstyle/search.tpl',366),(1389,'./templates2/ocstyle/map2.tpl',2502),(1389,'./templates2/ocstyle/search.tpl',367),(1391,'./templates2/ocstyle/viewprofile.tpl',172),(1392,'./templates2/ocstyle/search.tpl',468),(1396,'./templates2/ocstyle/search.tpl',567),(1397,'./templates2/ocstyle/search.tpl',568),(1405,'./lang/de/ocstyle/error.tpl.php',22),(1406,'./lang/de/ocstyle/error.tpl.php',23),(1408,'./lang/de/ocstyle/error.tpl.php',26),(1408,'./templates2/ocstyle/error.tpl',16),(1411,'./lang/de/ocstyle/removelog_cacheowner.tpl.php',23),(1412,'./lang/de/ocstyle/removelog_cacheowner.tpl.php',37),(1413,'./lang/de/ocstyle/removelog_cacheowner.tpl.php',48),(1413,'./lang/de/ocstyle/removelog_logowner.tpl.php',44),(1414,'./lang/de/ocstyle/editcache.inc.php',26),(1415,'./lang/de/ocstyle/editlog.inc.php',24),(1415,'./templates2/ocstyle/log_cache.tpl',335),(1416,'./lang/de/ocstyle/newcache.tpl.php',119),(1417,'./lang/de/ocstyle/newcache.inc.php',17),(1418,'./lang/de/ocstyle/editcache.tpl.php',212),(1418,'./lang/de/ocstyle/newcache.tpl.php',210),(1418,'./templates2/ocstyle/viewcache_print.tpl',74),(1419,'./lang/de/ocstyle/newcache.tpl.php',217),(1420,'./lang/de/ocstyle/editdesc.tpl.php',45),(1420,'./lang/de/ocstyle/main.tpl.php',145),(1420,'./lang/de/ocstyle/newcache.tpl.php',263),(1420,'./lang/de/ocstyle/newdesc.tpl.php',45),(1420,'./templates2/ocstyle/search.tpl',454),(1420,'./templates2/ocstyle/sys_main.tpl',146),(1421,'./lang/de/ocstyle/newcache.tpl.php',274),(1422,'./lang/de/ocstyle/editdesc.tpl.php',56),(1422,'./lang/de/ocstyle/newcache.tpl.php',279),(1422,'./lang/de/ocstyle/newdesc.tpl.php',57),(1423,'./lang/de/ocstyle/editdesc.tpl.php',62),(1423,'./lang/de/ocstyle/newcache.tpl.php',285),(1423,'./lang/de/ocstyle/newdesc.tpl.php',62),(1423,'./templates2/ocstyle/childwp.tpl',52),(1423,'./templates2/ocstyle/log_cache.tpl',260),(1423,'./templates2/ocstyle/mylists.tpl',93),(1425,'./lang/de/ocstyle/newcache.tpl.php',311),(1425,'./lang/de/ocstyle/newdesc.tpl.php',89),(1426,'./lang/de/ocstyle/newcache.tpl.php',333),(1427,'./lang/de/ocstyle/editcache.inc.php',61),(1427,'./lang/de/ocstyle/newcache.tpl.php',355),(1428,'./lang/de/ocstyle/editcache.inc.php',63),(1428,'./lang/de/ocstyle/newcache.tpl.php',357),(1429,'./lang/de/ocstyle/editcache.inc.php',64),(1429,'./lang/de/ocstyle/newcache.tpl.php',358),(1430,'./lang/de/ocstyle/editcache.inc.php',71),(1430,'./lang/de/ocstyle/newcache.tpl.php',365),(1431,'./lang/de/ocstyle/newcache.tpl.php',385),(1432,'./lang/de/ocstyle/removelog.inc.php',25),(1433,'./templates2/ocstyle/search_selectlocid.tpl',9),(1434,'./templates2/ocstyle/search_selectlocid.tpl',9),(1435,'./templates2/ocstyle/search_selectlocid.tpl',12),(1436,'./templates2/ocstyle/log_cache.tpl',191),(1437,'./lang/de/ocstyle/editcache.inc.php',25),(1437,'./lang/de/ocstyle/newcache.inc.php',34),(1438,'./lang/de/ocstyle/editcache.inc.php',27),(1439,'./lang/de/ocstyle/editcache.inc.php',28),(1439,'./lang/de/ocstyle/newcache.inc.php',31),(1440,'./lang/de/ocstyle/editcache.inc.php',29),(1441,'./lang/de/ocstyle/editcache.inc.php',31),(1442,'./lang/de/ocstyle/editcache.inc.php',33),(1442,'./lang/de/ocstyle/newcache.inc.php',38),(1443,'./lang/de/ocstyle/editcache.inc.php',36),(1443,'./lang/de/ocstyle/editdesc.inc.php',24),(1444,'./templates2/ocstyle/search.result.caches.tpl',59),(1445,'./templates2/ocstyle/search.result.caches.tpl',98),(1445,'./templates2/ocstyle/search.result.caches.tpl',208),(1446,'./lang/de/ocstyle/removedesc.inc.php',18),(1447,'./lang/de/ocstyle/removedesc.inc.php',20),(1448,'./lang/de/ocstyle/removedesc.inc.php',21),(1448,'./lang/de/ocstyle/removedesc.tpl.php',23),(1452,'./lang/de/ocstyle/editdesc.tpl.php',88),(1453,'./lang/de/ocstyle/removedesc.tpl.php',25),(1454,'./lang/de/ocstyle/removedesc.tpl.php',26),(1455,'./lang/de/ocstyle/newcache.inc.php',19),(1456,'./lang/de/ocstyle/newcache.inc.php',25),(1457,'./lang/de/ocstyle/editcache.inc.php',24),(1457,'./lang/de/ocstyle/newcache.inc.php',27),(1458,'./lang/de/ocstyle/newcache.inc.php',28),(1459,'./lang/de/ocstyle/newcache.inc.php',32),(1460,'./lang/de/ocstyle/newcache.inc.php',33),(1461,'./lang/de/ocstyle/newcache.inc.php',35),(1463,'./lang/de/ocstyle/newcache.inc.php',36),(1464,'./lang/de/ocstyle/newcache.inc.php',37),(1466,'./lang/de/ocstyle/newcache.inc.php',43),(1467,'./lang/de/ocstyle/newcache.inc.php',45),(1468,'./lang/de/ocstyle/editdesc.inc.php',21),(1469,'./lang/de/ocstyle/editdesc.inc.php',22),(1471,'./lang/de/ocstyle/newdesc.inc.php',21),(1473,'./lang/de/ocstyle/removelog_logowner.tpl.php',28),(1475,'./lang/de/ocstyle/varset.inc.php',68),(1476,'./lang/de/ocstyle/editcache.tpl.php',111),(1477,'./lang/de/ocstyle/editcache.tpl.php',128),(1478,'./lang/de/ocstyle/editcache.tpl.php',136),(1478,'./templates2/ocstyle/adminreports.tpl',122),(1478,'./templates2/ocstyle/adminreports.tpl',129),(1478,'./templates2/ocstyle/mylists.tpl',74),(1478,'./templates2/ocstyle/viewcache.tpl',225),(1478,'./templates2/ocstyle/viewcache.tpl',227),(1478,'./templates2/ocstyle/viewcache_print.tpl',80),(1478,'./templates2/ocstyle/viewcache_print.tpl',82),(1479,'./lang/de/ocstyle/main.tpl.php',222),(1480,'./lang/de/ocstyle/main.tpl.php',244),(1480,'./templates2/ocstyle/sys_main.tpl',238),(1482,'./lang/de/ocstyle/newcache.tpl.php',224),(1483,'./lang/de/ocstyle/editcache.inc.php',70),(1483,'./lang/de/ocstyle/newcache.tpl.php',364),(1486,'./lang/de/ocstyle/redirect.tpl.php',59),(1489,'./lang/de/ocstyle/editcache.inc.php',56),(1489,'./lang/de/ocstyle/newcache.inc.php',20),(1489,'./lang/de/ocstyle/newcache.inc.php',21),(1489,'./lang/de/ocstyle/newdesc.inc.php',19),(1490,'./lang/de/ocstyle/login.tpl.php',41),(1490,'./templates2/ocstyle/login.tpl',50),(1490,'./templates2/ocstyle/sys_main.tpl',139),(1491,'./lang/de/ocstyle/editdesc.tpl.php',32),(1494,'./lang/de/ocstyle/newdesc.inc.php',18),(1494,'./templates2/ocstyle/addtolist.tpl',51),(1494,'./templates2/ocstyle/adminreports.tpl',142),(1494,'./templates2/ocstyle/mylists.tpl',103),(1495,'./templates2/ocstyle/search.tpl',76),(1496,'./templates2/ocstyle/search.tpl',87),(1497,'./templates2/ocstyle/search.tpl',97),(1498,'./templates2/ocstyle/search.tpl',109),(1499,'./templates2/ocstyle/search.tpl',115),(1500,'./templates2/ocstyle/search.tpl',27),(1501,'./templates2/ocstyle/search.tpl',33),(1504,'./templates2/ocstyle/search.tpl',154),(1505,'./templates2/ocstyle/search.tpl',165),(1506,'./templates2/ocstyle/search.tpl',371),(1507,'./templates2/ocstyle/search.tpl.inc.php',11),(1508,'./templates2/ocstyle/search.tpl.inc.php',12),(1512,'./templates2/ocstyle/search.tpl.inc.php',17),(1513,'./templates2/ocstyle/search.tpl.inc.php',18),(1514,'./templates2/ocstyle/search.tpl.inc.php',19),(1516,'./templates2/ocstyle/search.tpl.inc.php',23),(1517,'./templates2/ocstyle/search.tpl.inc.php',24),(1518,'./templates2/ocstyle/search.tpl',448),(1521,'./lang/de/ocstyle/editcache.inc.php',21),(1522,'./templates2/ocstyle/search.result.caches.tpl',70),(1523,'./templates2/ocstyle/search.result.caches.tpl',71),(1524,'./templates2/ocstyle/myignores.tpl',18),(1524,'./templates2/ocstyle/mytop5.tpl',25),(1524,'./templates2/ocstyle/mywatches.tpl',131),(1524,'./templates2/ocstyle/search.result.caches.tpl',130),(1524,'./templates2/ocstyle/usertops.tpl',17),(1525,'./templates2/ocstyle/search.result.caches.tpl',168),(1527,'./templates2/ocstyle/search.result.caches.tpl',200),(1529,'./templates2/ocstyle/search.result.caches.tpl',219),(1530,'./lang/de/ocstyle/editlog.inc.php',19),(1530,'./lang/de/ocstyle/removelog.inc.php',18),(1531,'./lang/de/ocstyle/editdesc.inc.php',17),(1532,'./lang/de/ocstyle/removelog.inc.php',31),(1533,'./lang/de/ocstyle/editcache.inc.php',30),(1533,'./lang/de/ocstyle/newcache.inc.php',39),(1537,'./lang/de/ocstyle/varset.inc.php',78),(1541,'table:cache_attrib;field=name',0),(1542,'table:cache_attrib;field=name',0),(1543,'table:cache_attrib;field=name',0),(1544,'table:cache_attrib;field=name',0),(1545,'table:cache_attrib;field=html_desc',0),(1546,'table:cache_attrib;field=html_desc',0),(1548,'table:cache_attrib;field=html_desc',0),(1549,'table:cache_attrib;field=html_desc',0),(1550,'table:cache_attrib;field=name',0),(1551,'table:cache_attrib;field=name',0),(1552,'table:cache_attrib;field=name',0),(1553,'table:cache_attrib;field=name',0),(1554,'table:cache_attrib;field=name',0),(1555,'table:cache_attrib;field=name',0),(1556,'table:cache_attrib;field=name',0),(1557,'table:cache_attrib;field=name',0),(1558,'table:cache_attrib;field=name',0),(1559,'table:cache_attrib;field=name',0),(1560,'table:cache_attrib;field=name',0),(1561,'table:cache_attrib;field=name',0),(1562,'table:cache_attrib;field=name',0),(1563,'table:cache_attrib;field=name',0),(1564,'table:cache_attrib;field=name',0),(1565,'table:cache_attrib;field=name',0),(1566,'table:cache_attrib;field=name',0),(1567,'table:cache_attrib;field=name',0),(1568,'table:cache_attrib;field=name',0),(1569,'table:cache_attrib;field=name',0),(1570,'table:cache_attrib;field=name',0),(1570,'table:coordinates_type;field=name',0),(1571,'table:cache_attrib;field=name',0),(1572,'table:cache_attrib;field=name',0),(1572,'table:cache_type;field=short2',0),(1573,'table:cache_attrib;field=name',0),(1575,'table:cache_attrib;field=name',0),(1576,'table:cache_attrib;field=name',0),(1577,'table:cache_attrib;field=name',0),(1578,'table:cache_attrib;field=name',0),(1579,'table:cache_attrib;field=name',0),(1580,'table:cache_attrib;field=name',0),(1581,'table:cache_attrib;field=name',0),(1582,'table:cache_attrib;field=name',0),(1583,'table:cache_attrib;field=name',0),(1584,'table:cache_attrib;field=name',0),(1585,'table:cache_attrib;field=name',0),(1586,'table:cache_attrib;field=name',0),(1587,'table:cache_attrib;field=name',0),(1588,'table:cache_attrib;field=name',0),(1589,'table:cache_attrib;field=name',0),(1590,'table:cache_attrib;field=name',0),(1591,'table:cache_attrib;field=name',0),(1592,'table:cache_attrib;field=name',0),(1593,'table:cache_attrib;field=name',0),(1594,'table:cache_attrib;field=name',0),(1595,'table:cache_attrib;field=name',0),(1596,'table:cache_attrib;field=name',0),(1597,'table:cache_attrib;field=name',0),(1598,'table:cache_attrib;field=name',0),(1599,'table:cache_attrib;field=html_desc',0),(1600,'table:cache_attrib;field=html_desc',0),(1601,'table:cache_attrib;field=html_desc',0),(1602,'table:cache_attrib;field=html_desc',0),(1603,'table:cache_attrib;field=html_desc',0),(1604,'table:cache_attrib;field=name',0),(1605,'table:cache_attrib;field=html_desc',0),(1606,'table:cache_attrib;field=html_desc',0),(1607,'table:cache_attrib;field=html_desc',0),(1608,'table:cache_attrib;field=html_desc',0),(1609,'table:cache_attrib;field=html_desc',0),(1610,'table:cache_attrib;field=html_desc',0),(1611,'table:cache_attrib;field=html_desc',0),(1612,'table:cache_attrib;field=html_desc',0),(1613,'table:cache_attrib;field=html_desc',0),(1614,'table:cache_attrib;field=html_desc',0),(1615,'table:cache_attrib;field=html_desc',0),(1616,'table:cache_attrib;field=html_desc',0),(1617,'table:cache_attrib;field=html_desc',0),(1618,'table:cache_attrib;field=html_desc',0),(1619,'table:cache_attrib;field=html_desc',0),(1620,'table:cache_attrib;field=html_desc',0),(1621,'table:cache_attrib;field=html_desc',0),(1622,'table:cache_attrib;field=html_desc',0),(1623,'table:cache_attrib;field=html_desc',0),(1624,'table:cache_attrib;field=html_desc',0),(1625,'table:cache_attrib;field=html_desc',0),(1626,'table:cache_attrib;field=html_desc',0),(1627,'table:cache_attrib;field=html_desc',0),(1628,'table:cache_attrib;field=html_desc',0),(1629,'table:cache_attrib;field=html_desc',0),(1630,'table:cache_attrib;field=html_desc',0),(1631,'table:cache_attrib;field=html_desc',0),(1632,'table:cache_attrib;field=html_desc',0),(1633,'table:cache_attrib;field=html_desc',0),(1634,'table:cache_attrib;field=html_desc',0),(1635,'table:cache_attrib;field=html_desc',0),(1636,'table:cache_attrib;field=html_desc',0),(1637,'table:cache_attrib;field=html_desc',0),(1638,'table:cache_attrib;field=html_desc',0),(1639,'table:cache_attrib;field=html_desc',0),(1640,'table:cache_attrib;field=html_desc',0),(1641,'table:cache_attrib;field=html_desc',0),(1642,'table:cache_attrib;field=html_desc',0),(1643,'table:cache_attrib;field=html_desc',0),(1644,'table:cache_attrib;field=html_desc',0),(1645,'table:cache_attrib;field=html_desc',0),(1646,'table:cache_attrib;field=html_desc',0),(1647,'table:cache_attrib;field=html_desc',0),(1650,'./lang/de/expressions.inc.php',29),(1652,'./lang/de/ocstyle/redirect.tpl.php',12),(1653,'./templates2/ocstyle/query.tpl',33),(1654,'./templates2/ocstyle/myignores.tpl',19),(1654,'./templates2/ocstyle/mytop5.tpl',26),(1654,'./templates2/ocstyle/mywatches.tpl',132),(1654,'./templates2/ocstyle/usertops.tpl',20),(1655,'./templates2/ocstyle/adminreports.tpl',171),(1657,'./templates2/ocstyle/map2.tpl',2556),(1657,'./templates2/ocstyle/map2.tpl',2587),(1657,'./templates2/ocstyle/search.tpl',420),(1657,'./templates2/ocstyle/search.tpl',433),(1658,'table:attribute_groups;field=name',0),(1659,'./templates2/ocstyle/search.tpl',394),(1662,'./templates2/ocstyle/map2.tpl',2303),(1663,'./templates2/ocstyle/map2.tpl',2222),(1663,'./templates2/ocstyle/map2.tpl',2422),(1664,'./templates2/ocstyle/map2.tpl',2422),(1665,'./templates2/ocstyle/map2.tpl',2422),(1666,'./templates2/ocstyle/map2.tpl',2416),(1666,'./templates2/ocstyle/map2.tpl',2424),(1667,'./templates2/ocstyle/map2.tpl',2454),(1668,'./templates2/ocstyle/map2.tpl',2469),(1669,'./templates2/ocstyle/map2.tpl',2485),(1670,'./templates2/ocstyle/map2.tpl',2490),(1672,'./templates2/ocstyle/map2.tpl',2520),(1673,'./templates2/ocstyle/map2.tpl',2538),(1674,'./templates2/ocstyle/map2.tpl',2604),(1678,'./templates2/ocstyle/map2.tpl',1681),(1680,'./templates2/ocstyle/map2.tpl',1113),(1683,'./templates2/ocstyle/map2.tpl',684),(1684,'./templates2/ocstyle/map2.tpl',700),(1685,'./templates2/ocstyle/map2.tpl',1445),(1687,'./lang/de/ocstyle/lib/menu.php',79),(1687,'./lang/de/ocstyle/lib/menu.php',80),(1687,'table:sys_menu;field=menustring',0),(1687,'table:sys_menu;field=title',0),(1688,'./lang/de/ocstyle/lib/menu.php',86),(1688,'./lang/de/ocstyle/lib/menu.php',87),(1689,'./lang/de/ocstyle/lib/menu.php',93),(1689,'./lang/de/ocstyle/lib/menu.php',94),(1689,'./lang/de/ocstyle/lib/menu.php',100),(1689,'./lang/de/ocstyle/lib/menu.php',101),(1690,'./lang/de/ocstyle/lib/menu.php',107),(1690,'./lang/de/ocstyle/lib/menu.php',108),(1691,'./lang/de/ocstyle/lib/menu.php',114),(1691,'./lang/de/ocstyle/lib/menu.php',115),(1692,'./lang/de/ocstyle/lib/menu.php',121),(1692,'./lang/de/ocstyle/lib/menu.php',122),(1693,'./lang/de/ocstyle/lib/menu.php',128),(1693,'./lang/de/ocstyle/lib/menu.php',129),(1694,'./lang/de/ocstyle/lib/menu.php',137),(1694,'./lang/de/ocstyle/lib/menu.php',138),(1694,'table:sys_menu;field=menustring',0),(1694,'table:sys_menu;field=title',0),(1695,'./lang/de/ocstyle/lib/menu.php',144),(1695,'table:sys_menu;field=title',0),(1696,'./lang/de/ocstyle/lib/menu.php',145),(1696,'table:sys_menu;field=menustring',0),(1697,'./lang/de/ocstyle/lib/menu.php',167),(1698,'./lang/de/ocstyle/lib/menu.php',227),(1698,'./lang/de/ocstyle/lib/menu.php',230),(1699,'./lang/de/ocstyle/lib/menu.php',248),(1699,'./lang/de/ocstyle/lib/menu.php',251),(1700,'./map2.php',137),(1701,'./templates2/ocstyle/res_state_warning.tpl',9),(1702,'./templates2/ocstyle/res_state_warning.tpl',13),(1703,'./templates2/ocstyle/map2.tpl',1207),(1703,'./templates2/ocstyle/viewcache.tpl',106),(1704,'./templates2/ocstyle/viewcache.tpl',106),(1705,'table:cache_attrib;field=html_desc',0),(1706,'./lang/de/ocstyle/main.tpl.php',166),(1706,'./templates2/ocstyle/sys_main.tpl',161),(1707,'./lang/de/ocstyle/main.tpl.php',168),(1707,'./templates2/ocstyle/sys_main.tpl',163),(1708,'./templates2/ocstyle/start.tpl',70),(1709,'./templates2/ocstyle/start.tpl',100),(1710,'./templates2/ocstyle/start.tpl',143),(1711,'./templates2/ocstyle/log_cache.tpl',287),(1717,'./newcache.php',295),(1717,'./newcache.php',313),(1718,'./templates2/ocstyle/search.result.caches.tpl',89),(1722,'./templates2/ocstyle/myignores.tpl',29),(1722,'./templates2/ocstyle/mywatches.tpl',150),(1722,'./templates2/ocstyle/res_cachelists.tpl',43),(1723,'./templates2/ocstyle/mytop5.tpl',41),(1724,'./templates2/ocstyle/viewcache.tpl',233),(1724,'./templates2/ocstyle/viewcache_print.tpl',77),(1725,'./templates2/ocstyle/viewcache.tpl',296),(1726,'./lang/de/ocstyle/removelog_cacheowner.tpl.php',17),(1726,'./lang/de/ocstyle/removelog_logowner.tpl.php',21),(1727,'./lang/de/ocstyle/newdesc.tpl.php',31),(1728,'./templates2/ocstyle/viewcache.tpl',305),(1729,'./templates2/ocstyle/viewcache.tpl',259),(1730,'./templates2/ocstyle/start.tpl',113),(1733,'./lib/settings-dist.inc.php',197),(1733,'./lib/settings-dist.inc.php',198),(1735,'./lang/de/ocstyle/editcache.tpl.php',333),(1735,'./lang/de/ocstyle/newcache.tpl.php',349),(1736,'./templates2/ocstyle/adminuser.tpl',43),(1737,'./templates2/ocstyle/viewcache.tpl',182),(1738,'./templates2/ocstyle/viewcache.tpl',236),(1739,'./ocstats.php',49),(1740,'./ocstats.php',54),(1745,'table:statpics;field=description',0),(1747,'table:statpics;field=description',0),(1752,'table:statpics;field=description',0),(1753,'table:statpics;field=description',0),(1754,'table:statpics;field=description',0),(1755,'table:statpics;field=description',0),(1756,'table:statpics;field=description',0),(1757,'table:statpics;field=description',0),(1758,'./templates2/ocstyle/activation.tpl',63),(1759,'./templates2/ocstyle/cache_note.tpl',10),(1760,'./templates2/ocstyle/cache_note.tpl',15),(1761,'./templates2/ocstyle/cache_note.tpl',29),(1763,'./templates2/ocstyle/error.tpl',48),(1764,'./templates2/ocstyle/search.tpl.inc.php',52),(1764,'./templates2/ocstyle/viewcache.tpl',391),(1764,'./templates2/ocstyle/viewcache_print.tpl',197),(1765,'./templates2/ocstyle/viewcache.tpl',496),(1765,'./templates2/ocstyle/viewcache_print.tpl',336),(1766,'./lib2/logic/npas.inc.php',40),(1766,'./templates2/ocstyle/viewcache.tpl',507),(1767,'./templates2/ocstyle/translate.tpl',33),(1768,'./templates2/ocstyle/translate.tpl',34),(1769,'./templates2/ocstyle/translate.tpl',35),(1770,'./templates2/ocstyle/translate.tpl',36),(1771,'./templates2/ocstyle/translate.tpl',52),(1772,'./templates2/ocstyle/translate.tpl',53),(1773,'./templates2/ocstyle/translate.tpl',54),(1774,'./templates2/ocstyle/translate.tpl',161),(1775,'./templates2/ocstyle/childwp.tpl',12),(1776,'./templates2/ocstyle/childwp.tpl',26),(1777,'./templates2/ocstyle/childwp.tpl',29),(1778,'./templates2/ocstyle/childwp.tpl',45),(1779,'./templates2/ocstyle/map2.tpl',2262),(1780,'src/Oc/Libse/ChildWp/AddPresenterChildWp.php',21),(1781,'src/Oc/Libse/ChildWp/AddPresenterChildWp.php',28),(1782,'src/Oc/Libse/ChildWp/DeletePresenterChildWp.php',21),(1783,'src/Oc/Libse/ChildWp/EditPresenterChildWp.php',21),(1788,'table:coordinates_type;field=name',0),(1789,'table:coordinates_type;field=name',0),(1790,'./lang/de/ocstyle/editcache.tpl.php',298),(1790,'./templates2/ocstyle/viewcache.tpl',408),(1790,'./templates2/ocstyle/viewcache_print.tpl',212),(1791,'./lang/de/ocstyle/editcache.tpl.php',299),(1792,'./lang/de/ocstyle/editcache.tpl.php',309),(1793,'./lang/de/ocstyle/editcache.inc.php',43),(1794,'./templates2/ocstyle/viewcache.tpl',424),(1796,'./templates2/ocstyle/map2.tpl',1194),(1796,'./templates2/ocstyle/viewcache.tpl',237),(1796,'./templates2/ocstyle/viewcache_print.tpl',85),(1797,'./lang/de/ocstyle/lib/menu.php',255),(1797,'./lang/de/ocstyle/lib/menu.php',258),(1797,'./lang/de/ocstyle/main.tpl.php',332),(1797,'./templates2/ocstyle/sys_main.tpl',338),(1797,'table:sys_menu;field=menustring',0),(1797,'table:sys_menu;field=title',0),(1798,'./lang/de/ocstyle/lib/menu.php',269),(1798,'./lang/de/ocstyle/lib/menu.php',272),(1798,'./templates2/ocstyle/sys_oc404.tpl',99),(1798,'table:sys_menu;field=menustring',0),(1798,'table:sys_menu;field=title',0),(1799,'table:cache_attrib;field=name',0),(1800,'table:cache_attrib;field=html_desc',0),(1801,'./config2/settings.inc.php',170),(1801,'./config2/settings.inc.php',171),(1801,'./lib/settings.inc.php',64),(1801,'./lib/settings.inc.php',65),(1802,'./templates2/ocstyle/adminreports.tpl',187),(1803,'./templates2/ocstyle/search.tpl',396),(1803,'table:cache_size;field=name',0),(1804,'./lib/common.inc.php',435),(1804,'./templates2/ocstyle/sys_main.tpl',290),(1806,'./adminuser.php',77),(1807,'./lang/de/ocstyle/editcache.tpl.php',364),(1807,'./lang/de/ocstyle/editdesc.tpl.php',99),(1807,'./lang/de/ocstyle/editlog.tpl.php',158),(1807,'./templates2/ocstyle/log_cache.tpl',343),(1807,'./templates2/ocstyle/mydescription.tpl',45),(1807,'./templates2/ocstyle/mylists.tpl',108),(1807,'./templates2/ocstyle/picture.tpl',140),(1808,'./templates2/ocstyle/register.tpl',185),(1809,'./templates2/ocstyle/register.tpl',187),(1810,'./templates2/ocstyle/viewcache.tpl',542),(1811,'./templates2/ocstyle/adminuser.tpl',117),(1812,'./templates2/ocstyle/adminhistory.tpl',43),(1812,'./templates2/ocstyle/adminreports.tpl',75),(1812,'./templates2/ocstyle/adminreports.tpl',82),(1812,'./templates2/ocstyle/admins.tpl',16),(1813,'./templates2/ocstyle/adminreports.tpl',75),(1813,'./templates2/ocstyle/adminreports.tpl',82),(1813,'./templates2/ocstyle/adoptcache.tpl',112),(1814,'./templates2/ocstyle/adminhistory.tpl',45),(1814,'./templates2/ocstyle/adminreports.tpl',75),(1814,'./templates2/ocstyle/adminreports.tpl',82),(1815,'./adminuser.php',81),(1816,'./lib2/logic/user.class.php',1062),(1817,'./templates2/ocstyle/adminuser.tpl',20),(1818,'./templates2/ocstyle/res_logentry_logitem.tpl',93),(1819,'./templates2/ocstyle/change_statpic.tpl',96),(1820,'./templates2/ocstyle/newpw.tpl',14),(1821,'table:statpics;field=description',0),(1822,'table:statpics;field=description',0),(1823,'table:statpics;field=description',0),(1824,'./templates2/ocstyle/verifyemail.tpl',13),(1824,'table:sys_menu;field=menustring',0),(1824,'table:sys_menu;field=title',0),(1825,'./templates2/ocstyle/verifyemail.tpl',17),(1826,'./templates2/ocstyle/verifyemail.tpl',19),(1827,'./templates2/ocstyle/verifyemail.tpl',22),(1828,'./templates2/ocstyle/verifyemail.tpl',23),(1829,'./templates2/ocstyle/adminuser.tpl',136),(1830,'./templates2/ocstyle/adminuser.tpl',136),(1831,'table:sys_menu;field=menustring',0),(1831,'table:sys_menu;field=title',0),(1832,'./templates2/ocstyle/admins.tpl',16),(1833,'./templates2/ocstyle/admins.tpl',27),(1834,'./templates2/ocstyle/adminuser.tpl',61),(1835,'./templates2/ocstyle/viewprofile.tpl',59),(1838,'./templates2/ocstyle/adminuser.tpl',14),(1839,'./templates2/ocstyle/query.tpl',117),(1840,'./templates2/ocstyle/map2.tpl',2301),(1841,'./templates2/ocstyle/map2.tpl',32),(1842,'./templates2/ocstyle/map2.tpl',2258),(1843,'./templates2/ocstyle/map2.tpl',2278),(1844,'./templates2/ocstyle/map2.tpl',1493),(1848,'./templates2/ocstyle/myprofile.tpl',208),(1849,'./templates2/ocstyle/map2.tpl',1928),(1850,'./templates2/ocstyle/map2.tpl',1846),(1851,'./templates2/ocstyle/map2.tpl',2231),(1852,'./templates2/ocstyle/map2.tpl',1804),(1853,'./templates2/ocstyle/map2.tpl',1782),(1855,'table:cache_type;field=short2',0),(1857,'table:cache_type;field=short2',0),(1859,'table:cache_type;field=short2',0),(1860,'table:cache_type;field=short2',0),(1861,'table:cache_type;field=short2',0),(1862,'table:cache_type;field=short2',0),(1863,'table:cache_type;field=short2',0),(1865,'./templates2/ocstyle/map2.tpl',2324),(1866,'./lib/common.inc.php',790),(1866,'./templates2/ocstyle/map2.tpl',2272),(1867,'./templates2/ocstyle/map2.tpl',2332),(1867,'table:profile_options;field=name',0),(1868,'./templates2/ocstyle/map2.tpl',2332),(1869,'./templates2/ocstyle/map2.tpl',2332),(1870,'./templates2/ocstyle/map2.tpl',2333),(1870,'table:profile_options;field=name',0),(1871,'./templates2/ocstyle/map2.tpl',2334),(1871,'table:profile_options;field=name',0),(1872,'./templates2/ocstyle/map2.tpl',2341),(1872,'table:profile_options;field=name',0),(1873,'./templates2/ocstyle/map2.tpl',2341),(1874,'./templates2/ocstyle/map2.tpl',2341),(1875,'./templates2/ocstyle/map2.tpl',2343),(1876,'./templates2/ocstyle/map2.tpl',516),(1877,'./templates2/ocstyle/map2.tpl',518),(1878,'./templates2/ocstyle/map2.tpl',514),(1879,'./templates2/ocstyle/adminhistory.tpl',36),(1879,'./templates2/ocstyle/adminuser.tpl',101),(1880,'table:sys_menu;field=menustring',0),(1880,'table:sys_menu;field=title',0),(1881,'./templates2/ocstyle/restorecaches.tpl',10),(1881,'./templates2/ocstyle/restorecaches.tpl',178),(1882,'./templates2/ocstyle/restorecaches.tpl',29),(1883,'./templates2/ocstyle/restorecaches.tpl',31),(1884,'./templates2/ocstyle/restorecaches.tpl',38),(1885,'./templates2/ocstyle/restorecaches.tpl',41),(1886,'./templates2/ocstyle/restorecaches.tpl',48),(1887,'./templates2/ocstyle/restorecaches.tpl',50),(1888,'./templates2/ocstyle/restorecaches.tpl',52),(1889,'./templates2/ocstyle/restorecaches.tpl',52),(1889,'./templates2/ocstyle/restorecaches.tpl',54),(1889,'./templates2/ocstyle/restorecaches.tpl',56),(1890,'./templates2/ocstyle/restorecaches.tpl',54),(1891,'./templates2/ocstyle/restorecaches.tpl',56),(1892,'./templates2/ocstyle/restorecaches.tpl',71),(1893,'./templates2/ocstyle/restorecaches.tpl',83),(1894,'./templates2/ocstyle/restorecaches.tpl',123),(1895,'./templates2/ocstyle/restorecaches.tpl',197),(1895,'./templates2/ocstyle/search.tpl',387),(1895,'./templates2/ocstyle/search.tpl',406),(1896,'./templates2/ocstyle/restorecaches.tpl',100),(1897,'./templates2/ocstyle/restorecaches.tpl',100),(1898,'./templates2/ocstyle/restorecaches.tpl',126),(1900,'./templates2/ocstyle/restorecaches.tpl',134),(1901,'./templates2/ocstyle/restorecaches.tpl',158),(1902,'./templates2/ocstyle/restorecaches.tpl',163),(1903,'./templates2/ocstyle/restorecaches.tpl',164),(1904,'./templates2/ocstyle/restorecaches.tpl',165),(1905,'./templates2/ocstyle/restorecaches.tpl',166),(1906,'./templates2/ocstyle/restorecaches.tpl',167),(1907,'./templates2/ocstyle/restorecaches.tpl',168),(1908,'./templates2/ocstyle/restorecaches.tpl',171),(1909,'./templates2/ocstyle/restorecaches.tpl',175),(1910,'./templates2/ocstyle/restorecaches.tpl',180),(1911,'./templates2/ocstyle/restorecaches.tpl',190),(1912,'./templates2/ocstyle/restorecaches.tpl',192),(1913,'./templates2/ocstyle/restorecaches.tpl',161),(1914,'./templates2/ocstyle/restorecaches.tpl',168),(1915,'./templates2/ocstyle/adminuser.tpl',89),(1919,'./templates2/ocstyle/newlogpics.tpl',9),(1919,'./templates2/ocstyle/start.tpl',85),(1920,'./templates2/ocstyle/search.result.caches.tpl',131),(1921,'./templates2/ocstyle/search.result.caches.tpl',132),(1922,'./lib2/search/search.gpx.inc.php',627),(1924,'./templates2/ocstyle/map2.tpl',1224),(1925,'./templates2/ocstyle/map2.tpl',1226),(1926,'table:coordinates_type;field=name',0),(1927,'table:coordinates_type;field=name',0),(1928,'./templates2/ocstyle/map2.tpl',2342),(1928,'table:profile_options;field=name',0),(1929,'./templates2/ocstyle/picture.tpl',122),(1930,'./templates2/ocstyle/map2.tpl',2338),(1940,'table:sys_menu;field=menustring',0),(1940,'table:sys_menu;field=title',0),(1941,'./templates2/ocstyle/newlogpics.tpl',14),(1942,'./templates2/ocstyle/newlogpics.tpl',14),(1943,'./templates2/ocstyle/newlogpics.tpl',16),(1943,'./templates2/ocstyle/viewprofile_pics.tpl',14),(1944,'table:profile_options;field=name',0),(1945,'./templates2/ocstyle/res_userstats.tpl',116),(1945,'./templates2/ocstyle/viewcache.tpl',258),(1946,'./templates2/ocstyle/myhome.tpl',102),(1947,'./templates2/ocstyle/viewprofile_pics.tpl',9),(1948,'./templates2/ocstyle/myhome.tpl',116),(1949,'./templates2/ocstyle/myhome.tpl',113),(1950,'./templates2/ocstyle/myhome.tpl',124),(1950,'./templates2/ocstyle/viewprofile_pics.tpl',15),(1952,'table:sys_menu;field=menustring',0),(1952,'table:sys_menu;field=title',0),(1953,'./templates2/ocstyle/myhome.tpl',108),(1954,'./templates2/ocstyle/viewprofile_pics.tpl',15),(1955,'./templates2/ocstyle/myhome.tpl',198),(1956,'./templates2/ocstyle/viewcache.tpl',258),(1957,'./templates2/ocstyle/viewcache.tpl',197),(1958,'./viewcache.php',404),(1963,'table:sys_menu;field=menustring',0),(1963,'table:sys_menu;field=title',0),(1964,'./templates2/ocstyle/viewprofile.tpl',61),(1966,'./lib2/logic/data-license.inc.php',42),(1967,'./lib2/logic/data-license.inc.php',92),(1968,'./templates2/ocstyle/myhome.tpl',76),(1968,'./templates2/ocstyle/start.tpl',26),(1968,'./templates2/ocstyle/start.tpl',72),(1968,'./templates2/ocstyle/start.tpl',86),(1968,'./templates2/ocstyle/start.tpl',144),(1968,'./templates2/ocstyle/viewcache.tpl',333),(1969,'./templates2/ocstyle/myprofile.tpl',21),(1970,'./lang/de/ocstyle/editlog.tpl.php',103),(1970,'./templates2/ocstyle/log_cache.tpl',236),(1971,'./lang/de/ocstyle/editlog.inc.php',21),(1971,'./templates2/ocstyle/log_cache.tpl',245),(1973,'./templates2/ocstyle/picture.tpl',108),(1974,'./templates2/ocstyle/newemail.tpl',49),(1974,'./templates2/ocstyle/newpw.tpl',45),(1974,'./templates2/ocstyle/register.tpl',17),(1974,'./templates2/ocstyle/remindemail.tpl',37),(1975,'./templates2/ocstyle/res_passworderror.tpl',15),(1976,'./templates2/ocstyle/start.tpl',59),(1976,'./templates2/ocstyle/start.tpl',120),(1977,'./lang/de/ocstyle/editcache.tpl.php',341),(1977,'./lang/de/ocstyle/newcache.tpl.php',371),(1978,'./templates2/ocstyle/log_cache.tpl',335),(1979,'./templates2/ocstyle/adminreports.tpl',165),(1980,'./lang/de/ocstyle/editlog.tpl.php',118),(1982,'./templates2/ocstyle/sys_oc404.tpl',50),(1983,'./templates2/ocstyle/sys_oc404.tpl',57),(1984,'./templates2/ocstyle/sys_oc404.tpl',57),(1985,'./templates2/ocstyle/sys_oc404.tpl',59),(1986,'./templates2/ocstyle/sys_oc404.tpl',67),(1987,'./templates2/ocstyle/sys_oc404.tpl',69),(1988,'./templates2/ocstyle/sys_oc404.tpl',77),(1989,'./templates2/ocstyle/sys_oc404.tpl',79),(1990,'./templates2/ocstyle/sys_oc404.tpl',87),(1991,'./templates2/ocstyle/sys_oc404.tpl',89),(1992,'./templates2/ocstyle/sys_oc404.tpl',97),(1993,'./templates2/ocstyle/sys_oc404.tpl',100),(1994,'./templates2/ocstyle/sys_oc404.tpl',100),(1995,'./templates2/ocstyle/sys_oc404.tpl',100),(1996,'./templates2/ocstyle/sys_oc404.tpl',54),(1998,'./templates2/ocstyle/log_cache.tpl',256),(1998,'./templates2/ocstyle/map2.tpl',2343),(2000,'./templates2/ocstyle/search.tpl',488),(2001,'./templates2/ocstyle/search.result.caches.tpl',160),(2002,'./templates2/ocstyle/myhome.tpl',71),(2003,'./templates2/ocstyle/myhome.tpl',71),(2004,'./templates2/ocstyle/res_userstats.tpl',12),(2006,'./templates2/ocstyle/res_logentry_logitem.tpl',110),(2007,'./templates2/ocstyle/viewprofile.tpl',27),(2008,'table:sys_menu;field=title',0),(2009,'table:sys_menu;field=menustring',0),(2010,'./templates2/ocstyle/viewcache.tpl',280),(2011,'./templates2/ocstyle/viewcache.tpl',289),(2012,'./templates2/ocstyle/viewcache.tpl',290),(2013,'./templates2/ocstyle/viewcache.tpl',291),(2014,'./templates2/ocstyle/viewcache.tpl',292),(2015,'table:cache_attrib;field=name',0),(2016,'table:cache_attrib;field=html_desc',0),(2017,'./lang/de/ocstyle/editcache.inc.php',34),(2017,'./lang/de/ocstyle/newcache.inc.php',40),(2023,'./templates2/ocstyle/res_logtype.tpl',25),(2023,'./templates2/ocstyle/search.tpl.inc.php',51),(2023,'./templates2/ocstyle/viewcache.tpl',102),(2023,'table:log_types;field=name',0),(2025,'./templates2/ocstyle/newlogs.tpl',166),(2026,'./templates2/ocstyle/newlogs.tpl',171),(2027,'./templates2/ocstyle/newlogs.tpl',174),(2028,'./templates2/ocstyle/newlogs.tpl',176),(2029,'./lang/de/ocstyle/editlog.inc.php',28),(2029,'./removelog.php',272),(2029,'./templates2/ocstyle/log_cache.tpl',230),(2029,'./templates2/ocstyle/newlogs.tpl',146),(2029,'./templates2/ocstyle/res_logentry_logitem.tpl',20),(2030,'./templates2/ocstyle/res_userstats.tpl',98),(2030,'./templates2/ocstyle/viewcache.tpl',254),(2030,'./templates2/ocstyle/viewcache_print.tpl',116),(2031,'./lang/de/ocstyle/editcache.inc.php',32),(2035,'./templates2/ocstyle/res_logentry_logitem.tpl',40),(2036,'./templates2/ocstyle/res_logentry_logitem.tpl',45),(2037,'./templates2/ocstyle/res_logentry_logitem.tpl',48),(2038,'./templates2/ocstyle/res_logentry_logitem.tpl',50),(2039,'./templates2/ocstyle/res_logentry_logitem.tpl',52),(2041,'./templates2/ocstyle/newlogs.tpl',72),(2042,'./templates2/ocstyle/mydescription.tpl',20),(2042,'./templates2/ocstyle/mydetails.tpl',109),(2043,'./templates2/ocstyle/mydetails.tpl',114),(2045,'./templates2/ocstyle/map2.tpl',2038),(2046,'./templates2/ocstyle/viewcache.tpl',255),(2046,'./templates2/ocstyle/viewcache_print.tpl',117),(2047,'./templates2/ocstyle/viewcache.tpl',256),(2047,'./templates2/ocstyle/viewcache_print.tpl',118),(2048,'./templates2/ocstyle/viewcache.tpl',254),(2048,'./templates2/ocstyle/viewcache_print.tpl',116),(2049,'./templates2/ocstyle/viewcache.tpl',257),(2049,'./templates2/ocstyle/viewcache_print.tpl',119),(2050,'./templates2/ocstyle/mydescription.tpl',34),(2050,'./templates2/ocstyle/mylists.tpl',89),(2051,'./templates2/ocstyle/mytop5.tpl',29),(2052,'./templates2/ocstyle/viewcache_print.tpl',321),(2053,'./templates2/ocstyle/adoptcache.tpl',37),(2055,'./templates2/ocstyle/adminhistory.tpl',36),(2056,'./templates2/ocstyle/adminhistory.tpl',44),(2057,'./templates2/ocstyle/adminhistory.tpl',46),(2058,'./templates2/ocstyle/adminhistory.tpl',74),(2059,'./templates2/ocstyle/adminhistory.tpl',10),(2059,'table:sys_menu;field=menustring',0),(2059,'table:sys_menu;field=title',0),(2060,'./templates2/ocstyle/adminhistory.tpl',15),(2061,'./adminhistory.php',33),(2062,'./templates2/ocstyle/adminhistory.tpl',87),(2063,'./templates2/ocstyle/adminhistory.tpl',96),(2063,'./templates2/ocstyle/adminhistory.tpl',125),(2067,'./templates2/ocstyle/adminhistory.tpl',49),(2067,'./templates2/ocstyle/adminhistory.tpl',95),(2067,'./templates2/ocstyle/res_cachelists.tpl',17),(2068,'./templates2/ocstyle/adminhistory.tpl',87),(2069,'./templates2/ocstyle/adminhistory.tpl',74),(2070,'./templates2/ocstyle/mailto.tpl',43),(2073,'./templates2/ocstyle/adoptcache.tpl',75),(2074,'./templates2/ocstyle/adminhistory.tpl',149),(2075,'./templates2/ocstyle/adminhistory.tpl',149),(2076,'./templates2/ocstyle/adminhistory.tpl',157),(2077,'./templates2/ocstyle/adminhistory.tpl',159),(2078,'./templates2/ocstyle/res_logentry.tpl',21),(2079,'./templates2/ocstyle/myhome.tpl',135),(2080,'./templates2/ocstyle/myhome.tpl',135),(2084,'./templates2/ocstyle/myhome.tpl',150),(2085,'./templates2/ocstyle/myhome.tpl',150),(2086,'./templates2/ocstyle/search.tpl.inc.php',14),(2087,'./templates2/ocstyle/search.result.caches.tpl',66),(2088,'./templates2/ocstyle/map2.tpl',2369),(2089,'./templates2/ocstyle/map2.tpl',2514),(2089,'./templates2/ocstyle/search.tpl',368),(2090,'./templates2/ocstyle/map2.tpl',2508),(2090,'./templates2/ocstyle/search.tpl',369),(2091,'./templates2/ocstyle/dbmaintain.tpl',18),(2092,'./templates2/ocstyle/log_cache.tpl',196),(2093,'./templates2/ocstyle/log_cache.tpl',199),(2094,'./templates2/ocstyle/log_cache.tpl',207),(2096,'./templates2/ocstyle/newlogs.tpl',169),(2097,'./templates2/ocstyle/res_logentry_logitem.tpl',43),(2098,'./templates2/ocstyle/search.tpl.inc.php',48),(2099,'./templates2/ocstyle/search.tpl.inc.php',13),(2100,'./templates2/ocstyle/search.tpl.inc.php',32),(2101,'./templates2/mail/register.tpl',23),(2102,'./templates2/mail/register.tpl',19),(2103,'./templates2/ocstyle/search.tpl',562),(2104,'./templates2/ocstyle/search.tpl',583),(2106,'./templates2/ocstyle/search.tpl',760),(2107,'./templates2/ocstyle/search.tpl',673),(2108,'./templates2/ocstyle/newcaches.tpl',15),(2108,'./templates2/ocstyle/newcachesrest.tpl',9),(2108,'./templates2/ocstyle/search.tpl',797),(2111,'./lang/de/ocstyle/lib/menu.php',183),(2111,'./lang/de/ocstyle/lib/menu.php',184),(2111,'table:sys_menu;field=menustring',0),(2111,'table:sys_menu;field=title',0),(2112,'table:sys_menu;field=menustring',0),(2112,'table:sys_menu;field=title',0),(2113,'table:sys_menu;field=menustring',0),(2113,'table:sys_menu;field=title',0),(2114,'./templates2/ocstyle/search.result.caches.row.tpl',36),(2115,'table:sys_menu;field=menustring',0),(2115,'table:sys_menu;field=title',0),(2116,'./templates2/ocstyle/myprofile.tpl',122),(2117,'./templates2/ocstyle/myprofile.tpl',130),(2118,'./templates2/ocstyle/myprofile.tpl',128),(2119,'./templates2/ocstyle/myhome.tpl',151),(2121,'./lang/de/ocstyle/rating.inc.php',32),(2122,'./lang/de/ocstyle/rating.inc.php',30),(2123,'./lang/de/ocstyle/rating.inc.php',24),(2125,'./templates2/ocstyle/adminuser.tpl',98),(2125,'./templates2/ocstyle/myhome.tpl',172),(2126,'table:sys_menu;field=menustring',0),(2126,'table:sys_menu;field=title',0),(2128,'./templates2/ocstyle/newlogs.tpl',95),(2129,'./templates2/ocstyle/newlogs.tpl',97),(2130,'./templates2/ocstyle/newlogs.tpl',12),(2131,'./templates2/ocstyle/adoptcache.tpl',57),(2132,'./templates2/ocstyle/adoptcache.tpl',61),(2133,'./templates2/ocstyle/translate.tpl',56),(2134,'./templates2/ocstyle/log_cache.tpl',202),(2135,'table:profile_options;field=name',0),(2136,'./templates2/ocstyle/viewprofile.tpl',135),(2137,'./templates2/ocstyle/res_oconly81.tpl',54),(2139,'./templates2/ocstyle/oconly81.tpl',9),(2139,'table:sys_menu;field=menustring',0),(2139,'table:sys_menu;field=title',0),(2140,'./templates2/ocstyle/oconly81.tpl',30),(2141,'./templates2/ocstyle/viewprofile.tpl',169),(2143,'./templates2/ocstyle/oconly81.tpl',14),(2144,'./templates2/ocstyle/oconly81.tpl',22),(2146,'./templates2/ocstyle/oconly81.tpl',48),(2147,'./templates2/ocstyle/oconly81.tpl',53),(2148,'./templates2/ocstyle/res_userstats.tpl',20),(2148,'./templates2/ocstyle/res_userstats.tpl',47),(2149,'./templates2/ocstyle/res_userstats.tpl',57),(2150,'./templates2/ocstyle/viewcache_print.tpl',354),(2151,'./templates2/ocstyle/viewcache_print.tpl',90),(2152,'./templates2/ocstyle/viewcache.tpl',41),(2153,'table:profile_options;field=name',0),(2155,'./lang/de/ocstyle/main.tpl.php',279),(2155,'./templates2/ocstyle/sys_main.tpl',265),(2156,'./lang/de/ocstyle/main.tpl.php',283),(2156,'./templates2/ocstyle/sys_main.tpl',269),(2157,'./lang/de/ocstyle/main.tpl.php',290),(2157,'./templates2/ocstyle/sys_main.tpl',276),(2158,'./lang/de/ocstyle/main.tpl.php',294),(2158,'./templates2/ocstyle/sys_main.tpl',280),(2159,'./lang/de/ocstyle/main.tpl.php',295),(2159,'./templates2/ocstyle/sys_main.tpl',281),(2160,'./lang/de/ocstyle/main.tpl.php',296),(2160,'./templates2/ocstyle/sys_main.tpl',282),(2161,'./templates2/ocstyle/register.tpl',67),(2162,'./templates2/ocstyle/newlogs.tpl',18),(2163,'./templates2/ocstyle/newlogs.tpl',195),(2164,'./editcache.php',554),(2165,'./editdesc.php',209),(2166,'./editcache.php',557),(2167,'./templates2/ocstyle/admins.tpl',10),(2168,'./templates2/ocstyle/newlogs.tpl',15),(2169,'./templates2/ocstyle/res_logentry_logitem.tpl',98),(2170,'./templates2/ocstyle/adminreports.tpl',106),(2171,'./templates2/ocstyle/myprofile.tpl',145),(2172,'./templates2/ocstyle/myprofile.tpl',149),(2173,'./templates2/ocstyle/myprofile.tpl',151),(2174,'./templates2/ocstyle/myprofile.tpl',141),(2175,'./templates2/ocstyle/myprofile.tpl',195),(2175,'./templates2/ocstyle/myprofile.tpl',199),(2176,'./templates2/ocstyle/newcaches.tpl',10),(2177,'./lang/de/ocstyle/newcache.inc.php',30),(2178,'./lang/de/ocstyle/editcache.inc.php',35),(2178,'./lang/de/ocstyle/newcache.inc.php',41),(2179,'./templates2/ocstyle/map2.tpl',2664),(2180,'./templates2/ocstyle/viewcache.tpl',136),(2181,'./templates2/ocstyle/addtolist.tpl',14),(2181,'table:sys_menu;field=menustring',0),(2181,'table:sys_menu;field=title',0),(2182,'./templates2/ocstyle/addtolist.tpl',19),(2183,'./templates2/ocstyle/addtolist.tpl',25),(2184,'./templates2/ocstyle/addtolist.tpl',30),(2184,'./templates2/ocstyle/mylists.tpl',69),(2185,'./templates2/ocstyle/addtolist.tpl',27),(2186,'./templates2/ocstyle/addtolist.tpl',46),(2187,'./templates2/ocstyle/addtolist.tpl',38),(2187,'./templates2/ocstyle/mylists.tpl',76),(2187,'./templates2/ocstyle/mylists.tpl',77),(2187,'./templates2/ocstyle/res_cachelists.tpl',28),(2188,'./templates2/ocstyle/addtolist.tpl',38),(2188,'./templates2/ocstyle/mylists.tpl',75),(2188,'./templates2/ocstyle/res_cachelists.tpl',28),(2188,'./templates2/ocstyle/search.result.caches.tpl',26),(2188,'./templates2/ocstyle/viewcache.tpl',336),(2189,'./templates2/ocstyle/cachelists.tpl',13),(2189,'./templates2/ocstyle/viewcache.tpl',328),(2189,'./templates2/ocstyle/viewprofile.tpl',189),(2189,'table:sys_menu;field=menustring',0),(2189,'table:sys_menu;field=title',0),(2190,'./templates2/ocstyle/cachelists.tpl',55),(2191,'./templates2/ocstyle/res_cachelists.tpl',15),(2191,'./templates2/ocstyle/search.result.caches.tpl',23),(2191,'./templates2/ocstyle/viewcache.tpl',328),(2192,'./templates2/ocstyle/res_cachelists.tpl',48),(2193,'./templates2/ocstyle/mylists.tpl',13),(2193,'table:sys_menu;field=menustring',0),(2193,'table:sys_menu;field=title',0),(2194,'./templates2/ocstyle/res_cachelists.tpl',41),(2195,'./templates2/ocstyle/mylists.tpl',27),(2196,'./templates2/ocstyle/addtolist.tpl',46),(2196,'./templates2/ocstyle/mylists.tpl',23),(2197,'./templates2/ocstyle/mylists.tpl',119),(2198,'./templates2/ocstyle/mylists.tpl',119),(2199,'./templates2/ocstyle/mylists.tpl',119),(2200,'./templates2/ocstyle/mylists.tpl',142),(2201,'./templates2/ocstyle/mylists.tpl',13),(2202,'./templates2/ocstyle/mylists.tpl',114),(2203,'./templates2/ocstyle/mylists.tpl',124),(2204,'./templates2/ocstyle/mylists.tpl',17),(2205,'./lang/de/ocstyle/editcache.tpl.php',352),(2206,'./templates2/ocstyle/mylists.tpl',83),(2207,'./templates2/ocstyle/res_cachelist_link.tpl',7),(2207,'./templates2/ocstyle/search.result.caches.tpl',25),(2209,'./templates2/ocstyle/mywatches.tpl',150),(2209,'./templates2/ocstyle/res_cachelists.tpl',43),(2209,'./templates2/ocstyle/viewprofile.tpl',197),(2210,'./templates2/ocstyle/mywatches.tpl',123),(2211,'./templates2/ocstyle/mywatches.tpl',161),(2214,'./templates2/ocstyle/myignores.tpl',29),(2215,'./templates2/ocstyle/cachelists.tpl',32),(2216,'./templates2/ocstyle/cachelists.tpl',36),(2218,'./templates2/ocstyle/addtolist.tpl',30),(2218,'./templates2/ocstyle/mylists.tpl',69),(2219,'./templates2/ocstyle/addtolist.tpl',30),(2219,'./templates2/ocstyle/mylists.tpl',69),(2220,'./templates2/ocstyle/viewcache.tpl',150),(2221,'./templates2/ocstyle/mylists.tpl',13),(2222,'./templates2/ocstyle/mylists.tpl',77),(2222,'./templates2/ocstyle/res_cachelists.tpl',28),(2223,'./templates2/ocstyle/viewcache.tpl',336),(2224,'./templates2/ocstyle/addtolist.tpl',38),(2225,'./templates2/ocstyle/map2.tpl',2528),(2225,'./templates2/ocstyle/search.tpl',372),(2226,'./templates2/ocstyle/viewcache.tpl',336),(2227,'./templates2/ocstyle/adminhistory.tpl',116),(2228,'./templates2/ocstyle/mylists.tpl',75),(2229,'./templates2/ocstyle/res_cachelists.tpl',28),(2229,'./templates2/ocstyle/search.result.caches.tpl',26),(2230,'./templates2/ocstyle/res_cachelists.tpl',15),(2231,'./templates2/ocstyle/res_cachelists.tpl',15),(2232,'./templates2/ocstyle/res_cachelists.tpl',42),(2233,'./templates2/ocstyle/search.result.caches.tpl',31),(2234,'./templates2/ocstyle/res_cachelist_link.tpl',7),(2234,'./templates2/ocstyle/search.result.caches.tpl',24),(2235,'./templates2/ocstyle/mylists.tpl',131),(2236,'./templates2/ocstyle/mylists.tpl',82),(2237,'./templates2/ocstyle/mylists.tpl',114),(2238,'./templates2/ocstyle/res_cachelists.tpl',32),(2238,'./templates2/ocstyle/search.result.caches.tpl',37),(2240,'table:languages;field=name',0),(2241,'table:languages;field=name',0),(2242,'table:languages;field=name',0),(2243,'table:languages;field=name',0),(2244,'./templates2/ocstyle/garmin.tpl',17),(2244,'./templates2/ocstyle/viewcache_print.tpl',17),(2245,'./templates2/ocstyle/tops.tpl',41),(2245,'./templates2/ocstyle/tops.tpl',76),(2246,'./lang/de/ocstyle/error.tpl.php',27),(2246,'./templates2/ocstyle/adminreports.tpl',119),(2246,'./templates2/ocstyle/adminreports.tpl',130),(2246,'./templates2/ocstyle/adminuser.tpl',55),(2246,'./templates2/ocstyle/adminuser.tpl',101),(2246,'./templates2/ocstyle/error.tpl',17),(2246,'./templates2/ocstyle/mydetails.tpl',37),(2246,'./templates2/ocstyle/myhome.tpl',76),(2246,'./templates2/ocstyle/myhome.tpl',150),(2246,'./templates2/ocstyle/mystatpic.tpl',17),(2246,'./templates2/ocstyle/res_userstats.tpl',83),(2246,'./templates2/ocstyle/res_userstats.tpl',90),(2246,'./templates2/ocstyle/res_userstats.tpl',98),(2246,'./templates2/ocstyle/res_userstats.tpl',108),(2246,'./templates2/ocstyle/res_userstats.tpl',116),(2246,'./templates2/ocstyle/search.result.caches.tpl',86),(2246,'./templates2/ocstyle/search.result.caches.tpl',198),(2246,'./templates2/ocstyle/search.result.caches.tpl',208),(2246,'./templates2/ocstyle/search.tpl',632),(2246,'./templates2/ocstyle/search.tpl',668),(2246,'./templates2/ocstyle/search.tpl',673),(2246,'./templates2/ocstyle/viewcache.tpl',240),(2246,'./templates2/ocstyle/viewprofile.tpl',73),(2247,'./templates2/ocstyle/sys_main.tpl',139),(2248,'./templates2/ocstyle/search.tpl',456),(2249,'./templates2/ocstyle/newcaches.tpl',16),(2249,'./templates2/ocstyle/newcachesrest.tpl',10),(2250,'./templates2/ocstyle/newcaches.tpl',17),(2250,'./templates2/ocstyle/newcachesrest.tpl',11),(2251,'./templates2/ocstyle/newlogs.tpl',44),(2252,'./templates2/ocstyle/newlogs.tpl',45),(2253,'./templates2/ocstyle/newlogs.tpl',46),(2254,'./lang/de/ocstyle/newdesc.inc.php',22),(2258,'./util/watchlist/runwatch.php',148),(2263,'./templates2/ocstyle/search.tpl.inc.php',54),(2264,'./templates2/ocstyle/search.tpl.inc.php',56),(2270,'table:towns;field=name',0),(2271,'table:towns;field=name',0),(2272,'table:towns;field=name',0),(2273,'table:towns;field=name',0),(2274,'table:towns;field=name',0),(2275,'table:towns;field=name',0),(2276,'table:towns;field=name',0),(2277,'table:towns;field=name',0),(2278,'table:towns;field=name',0),(2279,'table:towns;field=name',0),(2280,'table:towns;field=name',0),(2281,'table:towns;field=name',0),(2282,'table:towns;field=name',0),(2283,'table:towns;field=name',0),(2284,'table:towns;field=name',0),(2285,'table:towns;field=name',0),(2286,'table:towns;field=name',0),(2287,'table:towns;field=name',0),(2288,'table:towns;field=name',0),(2289,'table:towns;field=name',0),(2290,'table:towns;field=name',0),(2291,'table:towns;field=name',0),(2292,'table:towns;field=name',0),(2293,'table:towns;field=name',0),(2294,'table:towns;field=name',0),(2295,'table:towns;field=name',0),(2296,'table:towns;field=name',0),(2297,'table:towns;field=name',0),(2298,'table:towns;field=name',0),(2299,'table:towns;field=name',0),(2300,'table:towns;field=name',0),(2301,'table:towns;field=name',0),(2302,'table:towns;field=name',0),(2303,'table:towns;field=name',0),(2304,'table:towns;field=name',0),(2305,'table:towns;field=name',0),(2306,'table:towns;field=name',0),(2307,'table:towns;field=name',0),(2308,'table:towns;field=name',0),(2309,'table:towns;field=name',0),(2310,'table:towns;field=name',0),(2311,'table:towns;field=name',0),(2312,'table:towns;field=name',0),(2313,'table:towns;field=name',0),(2314,'table:towns;field=name',0),(2315,'table:towns;field=name',0),(2316,'table:towns;field=name',0),(2317,'table:towns;field=name',0),(2318,'table:towns;field=name',0),(2319,'table:towns;field=name',0),(2320,'table:towns;field=name',0),(2321,'table:towns;field=name',0),(2322,'table:towns;field=name',0),(2323,'table:towns;field=name',0),(2324,'table:towns;field=name',0),(2325,'table:towns;field=name',0),(2326,'table:towns;field=name',0),(2327,'table:towns;field=name',0),(2328,'table:towns;field=name',0),(2329,'table:towns;field=name',0),(2330,'table:towns;field=name',0),(2331,'table:towns;field=name',0),(2332,'table:towns;field=name',0),(2333,'table:towns;field=name',0),(2334,'table:towns;field=name',0),(2335,'table:towns;field=name',0),(2336,'table:towns;field=name',0),(2337,'table:towns;field=name',0),(2338,'table:towns;field=name',0),(2339,'table:towns;field=name',0),(2340,'table:towns;field=name',0),(2341,'table:towns;field=name',0),(2342,'table:towns;field=name',0),(2343,'table:towns;field=name',0),(2344,'table:towns;field=name',0),(2345,'table:towns;field=name',0),(2346,'table:towns;field=name',0),(2347,'table:towns;field=name',0),(2348,'table:towns;field=name',0),(2349,'table:towns;field=name',0),(2350,'table:towns;field=name',0),(2351,'table:towns;field=name',0),(2352,'table:towns;field=name',0),(2353,'table:towns;field=name',0),(2354,'table:towns;field=name',0),(2355,'table:towns;field=name',0),(2356,'table:towns;field=name',0),(2357,'table:towns;field=name',0),(2358,'table:towns;field=name',0),(2359,'table:towns;field=name',0),(2360,'table:towns;field=name',0),(2361,'table:towns;field=name',0),(2362,'table:towns;field=name',0),(2363,'table:towns;field=name',0),(2364,'table:towns;field=name',0),(2365,'table:towns;field=name',0),(2366,'table:towns;field=name',0),(2367,'table:towns;field=name',0),(2368,'table:towns;field=name',0),(2369,'table:towns;field=name',0),(2370,'table:towns;field=name',0),(2371,'table:towns;field=name',0),(2372,'table:towns;field=name',0),(2373,'table:towns;field=name',0),(2374,'table:towns;field=name',0),(2375,'table:towns;field=name',0),(2376,'table:towns;field=name',0),(2377,'table:towns;field=name',0),(2378,'table:towns;field=name',0),(2379,'table:towns;field=name',0),(2380,'table:towns;field=name',0),(2381,'table:towns;field=name',0),(2382,'table:towns;field=name',0),(2383,'table:towns;field=name',0),(2384,'table:towns;field=name',0),(2385,'table:towns;field=name',0),(2386,'table:towns;field=name',0),(2387,'table:towns;field=name',0),(2388,'table:towns;field=name',0),(2389,'table:towns;field=name',0),(2390,'table:towns;field=name',0),(2391,'table:towns;field=name',0),(2392,'table:towns;field=name',0),(2516,'./templates2/ocstyle/search.result.caches.tpl',32),(2517,'./templates2/ocstyle/search.result.caches.tpl',27),(2518,'./templates2/ocstyle/mytop5.tpl',28),(2518,'./templates2/ocstyle/usertops.tpl',19),(2519,'./templates2/ocstyle/coordinates.tpl',32),(2520,'./templates2/ocstyle/translate.tpl',44),(2521,'./templates2/ocstyle/translate.tpl',66),(2523,'./templates2/ocstyle/change_statpic.tpl',35),(2524,'./templates2/ocstyle/search.result.caches.tpl',17),(2525,'./templates2/ocstyle/change_statpic.tpl',55),(2527,'./templates2/ocstyle/newlogs.tpl',80),(2530,'./templates2/ocstyle/newlogs.tpl',51),(2531,'./templates2/ocstyle/newlogs.tpl',52),(2532,'./templates2/ocstyle/newlogs.tpl',53),(2533,'./templates2/ocstyle/reportcache.tpl',54),(2534,'./templates2/ocstyle/reportcache.tpl',62),(2535,'./templates2/ocstyle/reportcache.tpl',63),(2538,'./templates2/ocstyle/log_cache.tpl',250),(2541,'./templates2/ocstyle/log_cache.tpl',255),(2542,'./templates2/ocstyle/res_logflags.tpl',3),(2542,'./templates2/ocstyle/viewcache.tpl',104),(2543,'./templates2/ocstyle/res_logflags.tpl',3),(2544,'./templates2/ocstyle/log_cache.tpl',15),(2545,'./templates2/ocstyle/log_cache.tpl',265),(2546,'./templates2/ocstyle/log_cache.tpl',264),(2547,'./templates2/ocstyle/res_logflags.tpl',4),(2547,'./templates2/ocstyle/viewcache.tpl',105),(2548,'./templates2/ocstyle/res_logflags.tpl',4),(2549,'./templates2/ocstyle/log_cache.tpl',16),(2550,'./templates2/ocstyle/log_cache.tpl',16),(2551,'./templates2/ocstyle/log_cache.tpl',67),(2552,'./templates2/ocstyle/log_cache.tpl',69),(2553,'./lib2/search/search.gpx.inc.php',263),(2553,'./templates2/ocstyle/res_state_warning.tpl',17),(2554,'./lib2/search/search.gpx.inc.php',264),(2555,'./templates2/ocstyle/res_state_warning.tpl',17),(2560,'./templates2/ocstyle/log_cache.tpl',17),(2561,'./templates2/ocstyle/log_cache.tpl',18),(2562,'./templates2/ocstyle/log_cache.tpl',19),(2563,'./templates2/ocstyle/log_cache.tpl',20),(2564,'./lang/de/ocstyle/editcache.tpl.php',235),(2564,'./lang/de/ocstyle/newcache.tpl.php',233),(2565,'./lang/de/ocstyle/editcache.tpl.php',235),(2565,'./lang/de/ocstyle/newcache.tpl.php',233),(2566,'./templates2/ocstyle/res_logentry_logitem.tpl',106),(2567,'./templates2/ocstyle/res_logentry_logitem.tpl',10),(2568,'./templates2/ocstyle/res_logentry_logitem.tpl',10),(2569,'./templates2/ocstyle/res_logentry_logitem.tpl',12),(2570,'./templates2/ocstyle/res_logentry_logitem.tpl',13),(2571,'./lang/de/ocstyle/editcache.tpl.php',356),(2596,'./templates2/ocstyle/log_cache.tpl',273),(2597,'./templates2/ocstyle/viewcache.tpl',437),(2598,'./templates2/ocstyle/log_cache.tpl',15),(2599,'./templates2/ocstyle/log_cache.tpl',16),(2600,'./templates2/ocstyle/log_cache.tpl',16),(2601,'./templates2/ocstyle/log_cache.tpl',276),(2602,'./templates2/ocstyle/log_cache.tpl',276),(2603,'./templates2/ocstyle/viewprofile.tpl',56),(2604,'./templates2/ocstyle/adminreports.tpl',139),(2605,'./templates2/ocstyle/log_cache.tpl',21),(2606,'./lib2/logic/cache.class.php',470),(2607,'./templates2/ocstyle/picture.tpl',68),(2608,'./lang/de/ocstyle/editcache.inc.php',38),(2608,'./templates2/ocstyle/res_logentry_logitem.tpl',99),(2609,'table:cache_report_reasons;field=name',0),(2610,'./mailto.php',39),(2611,'./mailto.php',50),(2612,'./templates2/ocstyle/viewcache.tpl',417),(2616,'./templates2/ocstyle/search.tpl',574),(2617,'./templates2/ocstyle/search.tpl',579),(2618,'./templates2/ocstyle/search.tpl.inc.php',21),(2619,'./templates2/ocstyle/search.tpl',143),(2620,'./templates2/ocstyle/search.tpl.inc.php',22),(2621,'./templates2/ocstyle/search.tpl',126),(2632,'table:cache_attrib;field=name',0),(2633,'table:cache_attrib;field=html_desc',0),(2634,'./templates2/ocstyle/header/cookie_notice.tpl',57),(2635,'./templates2/ocstyle/header/cookie_notice.tpl',57),(2636,'./templates2/ocstyle/header/cookie_notice.tpl',57);
/*!40000 ALTER TABLE `sys_trans_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_trans_text`
--

DROP TABLE IF EXISTS `sys_trans_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_trans_text` (
  `trans_id` int(10) unsigned NOT NULL,
  `lang` varchar(2) NOT NULL,
  `text` longtext NOT NULL,
  `last_modified` datetime NOT NULL COMMENT 'via trigger (sys_trans_text)',
  PRIMARY KEY (`lang`,`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_trans_text`
--

LOCK TABLES `sys_trans_text` WRITE;
/*!40000 ALTER TABLE `sys_trans_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_trans_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sysTransTextBeforeInsert` BEFORE INSERT ON `sys_trans_text`
     FOR EACH ROW BEGIN
        IF NEW.`last_modified` < '2000-01-01 00:00:00' THEN
            SET NEW.`last_modified`=NOW();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sysTransTextBeforeUpdate` BEFORE UPDATE ON `sys_trans_text`
     FOR EACH ROW BEGIN
        SET NEW.`last_modified`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sysconfig`
--

DROP TABLE IF EXISTS `sysconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysconfig` (
  `name` varchar(60) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='obsolete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysconfig`
--

LOCK TABLES `sysconfig` WRITE;
/*!40000 ALTER TABLE `sysconfig` DISABLE KEYS */;
INSERT INTO `sysconfig` (`name`, `value`) VALUES ('datasql_checksum','416acec531ee1886f827e8615482e263'),('db_version','168'),('geokrety_lastupdate','2010-02-28 06:00:01'),('syslog_maillog_lastdate','2017-05-01 00:00:01');
/*!40000 ALTER TABLE `sysconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towns`
--

DROP TABLE IF EXISTS `towns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towns` (
  `country` char(2) NOT NULL,
  `name` varchar(40) NOT NULL,
  `trans_id` int(10) unsigned NOT NULL,
  `coord_lat` double NOT NULL,
  `coord_long` double NOT NULL,
  `maplist` tinyint(1) NOT NULL DEFAULT '0',
  KEY `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns`
--

LOCK TABLES `towns` WRITE;
/*!40000 ALTER TABLE `towns` DISABLE KEYS */;
INSERT INTO `towns` (`country`, `name`, `trans_id`, `coord_lat`, `coord_long`, `maplist`) VALUES ('AT','Bregenz',2369,48.20833,16.373064,1),('AT','Eisenstadt',2370,47.845556,16.518889,1),('AT','Graz',2371,47.066667,15.433333,1),('AT','Innsbruck',2372,47.267222,11.392778,1),('AT','Klagenfurt',2373,46.617778,14.305556,1),('AT','Linz',2374,48.303056,14.290556,1),('AT','Salzburg',2375,47.8,13.033333,1),('AT','Sankt Pölten',2376,48.204722,15.626667,1),('AT','Wien',2377,48.20833,16.373064,1),('CH','Aarau',2378,47.394443,8.045,1),('CH','Appenzell',2379,47.330828,9.408615,1),('CH','Herisau',2380,47.383329,9.266671,1),('CH','Liestal',2381,47.484,7.735,1),('CH','Basel',2382,47.557421,7.592573,1),('CH','Bern',2383,46.951081,7.438637,1),('CH','Fribourg',2384,46.806113,7.162775,1),('CH','Genève',2385,46.2,6.15,1),('CH','Glarus',2386,47.03333,9.066666,1),('CH','Chur',2387,46.85,9.53333,1),('CH','Delémont',2388,47.365282,7.347242,1),('CH','Luzern',2389,47.05,8.3,1),('CH','Neuchâtel',2390,46.990281,6.930567,1),('CH','Lausanne',2391,46.516672,6.633324,1),('CH','Zürich',2392,47.379022,8.541001,1),('DE','Berlin',2270,52.5234051,13.4113999,1),('DE','Bremen',2271,53.079294,8.816126,1),('DE','Dresden',2272,51.0509912,13.7336335,1),('DE','Düsseldorf',2273,51.2249429,6.7756524,1),('DE','Erfurt',2274,50.9737346,11.0223989,1),('DE','Hamburg',2275,53.580684,9.992638,1),('DE','Hannover',2276,52.3720683,9.7356861,1),('DE','Kiel',2277,54.3191939,10.1316016,1),('DE','Mainz',2278,49.9951227,8.2674264,1),('DE','Magdeburg',2279,52.130956,11.636701,1),('DE','München',2280,48.1391265,11.5801863,1),('DE','Potsdam',2281,52.3802099,13.0723571,1),('DE','Saarbrücken',2282,49.239851,6.991278,1),('DE','Schwerin',2283,53.625743,11.416893,1),('DE','Stuttgart',2284,48.7761027,9.18113708,1),('DE','Wiesbaden',2285,50.08408,8.2383918,1),('DE','Frankfurt am Main',2286,50.1134931,8.6810548,1),('DE','Dortmund',2287,51.5078845,7.4702625,1),('DE','Essen',2288,51.4456505,7.0102164,1),('DE','Leipzig',2289,51.3417825,12.3936349,1),('DE','Nürnberg',2290,49.4442306,11.0725565,1),('IT','Bologna',2291,44.497,11.343,1),('IT','Bolzano',2292,46.502,11.354,1),('IT','Corsica',2293,42.142924,9.11388,1),('IT','Cosenza',2294,39.296,16.249,1),('IT','Genova',2295,44.41148,8.966,1),('IT','Milano',2296,45.468,9.185,1),('IT','Napoli',2297,40.8561697,14.2723721,1),('IT','Palermo',2298,37.8,13.5,1),('IT','Roma',2299,41.902,12.48,1),('IT','Sardegna',2300,40.091047,9.066147,1),('IT','Udine',2301,46.066,13.228,1),('ES','A Coruña',2302,43.370873,-8.395835,1),('ES','Albacete',2303,38.997652,-1.86007,1),('ES','Alicante',2304,38.345203,-0.481006,1),('ES','Almería',2305,36.840164,-2.467922,1),('ES','Ávila',2306,40.656422,-4.700322,1),('ES','Badajoz',2307,38.878597,-6.970283,1),('ES','Barcelona',2308,41.387917,2.169919,1),('ES','Bilbao',2309,43.256963,-2.923441,1),('ES','Burgos',2310,42.340875,-3.699731,1),('ES','Cáceres',2311,39.476179,-6.37076,1),('ES','Cádiz',2312,36.529688,-6.292657,1),('ES','Castellón',2313,39.986068,-0.036024,1),('ES','Ceuta',2314,35.888287,-5.316195,1),('ES','Ciudad Real',2315,38.986096,-3.927263,1),('ES','Córdoba',2316,37.884727,-4.779152,1),('ES','Cuenca',2317,40.071835,-2.134005,1),('ES','Gerona',2318,41.981796,2.8237,1),('ES','Granada',2319,37.176487,-3.597929,1),('ES','Guadalajara',2320,40.629816,-3.166493,1),('ES','Huesca',2321,42.140102,-0.408898,1),('ES','Huelva',2322,37.257101,-6.949555,1),('ES','Jaén',2323,37.765739,-3.789518,1),('ES','Las Palmas de Gran Canaria',2324,28.124823,-15.430007,1),('ES','León',2325,42.599876,-5.571752,1),('ES','Lérida',2326,41.614152,0.625782,1),('ES','Logroño',2327,42.465776,-2.449995,1),('ES','Lugo',2328,43.012087,-7.555851,1),('ES','Madrid',2329,40.416691,-3.700345,1),('ES','Málaga',2330,36.719646,-4.420019,1),('ES','Melilla',2331,35.292339,-2.938794,1),('ES','Murcia',2332,37.983445,-1.12989,1),('ES','Ourense',2333,42.340009,-7.864641,1),('ES','Oviedo',2334,43.360259,-5.844758,1),('ES','Palencia',2335,42.012458,-4.531175,1),('ES','Palma de Mallorca',2336,39.569506,2.649966,1),('ES','Pamplona',2337,42.817991,-1.644215,1),('ES','Pontevedra',2338,42.433619,-8.648053,1),('ES','Salamanca',2339,40.964972,-5.663047,1),('ES','San Sebastián',2340,43.320736,-1.984421,1),('ES','Santa Cruz de Tenerife',2341,28.46981,-16.25485,1),('ES','Santander',2342,43.46096,-3.807934,1),('ES','Segovia',2343,40.949427,-4.119209,1),('ES','Sevilla',2344,37.38264,-5.996295,1),('ES','Soria',2345,41.763598,-2.464921,1),('ES','Tarragona',2346,41.118663,1.24533,1),('ES','Teruel',2347,40.34411,-1.10691,1),('ES','Toledo',2348,39.856778,-4.024476,1),('ES','Valencia',2349,39.470239,-0.376805,1),('ES','Valladolid',2350,41.652947,-4.728388,1),('ES','Vitoria-Gasteiz',2351,42.846406,-2.667893,1),('ES','Zamora',2352,42.846406,-2.667893,1),('ES','Zaragoza',2353,41.656287,-0.876538,1),('FR','Paris',2354,48.85568,2.351074,1),('FR','Marseille',2355,43.296699,5.370598,1),('FR','Lyon',2356,45.76405,4.835701,1),('FR','Toulouse',2357,43.60451,1.444359,1),('FR','Nice',2358,43.695431,7.266083,1),('FR','Nantes',2359,47.216537,-1.553707,1),('FR','Strasbourg',2360,48.581831,7.748623,1),('FR','Montpellier',2361,43.61085,3.876801,1),('FR','Bordeaux',2362,44.834935,-0.577126,1),('FR','Lille',2363,50.628558,3.057289,1),('FR','Rennes',2364,48.113391,-1.675587,1),('FR','Reims',2365,49.258619,4.030952,1),('FR','Le Havre',2366,49.495894,0.134411,1),('FR','Saint-Étienne',2367,45.438936,4.388351,1),('FR','Toulon',2368,43.124417,5.93102,1);
/*!40000 ALTER TABLE `towns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `node` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL COMMENT 'via Trigger (user)',
  `last_modified` datetime NOT NULL COMMENT 'via Trigger (user)',
  `last_login` date DEFAULT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `admin_password` binary(60) DEFAULT NULL,
  `roles` text,
  `email` varchar(60) DEFAULT NULL,
  `email_problems` int(10) NOT NULL DEFAULT '0',
  `first_email_problem` date DEFAULT NULL,
  `last_email_problem` datetime DEFAULT NULL,
  `mailing_problems` int(10) unsigned NOT NULL DEFAULT '0',
  `accept_mailing` tinyint(1) NOT NULL DEFAULT '1',
  `usermail_send_addr` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `is_active_flag` tinyint(1) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `country` char(2) DEFAULT NULL,
  `pmr_flag` tinyint(1) NOT NULL,
  `new_pw_code` varchar(13) DEFAULT NULL,
  `new_pw_date` datetime DEFAULT NULL,
  `new_email_code` varchar(13) DEFAULT NULL,
  `new_email_date` datetime DEFAULT NULL,
  `new_email` varchar(60) DEFAULT NULL,
  `permanent_login_flag` tinyint(1) NOT NULL,
  `watchmail_mode` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `watchmail_hour` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `watchmail_nextmail` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'via cronjob',
  `watchmail_day` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `activation_code` varchar(13) NOT NULL,
  `statpic_logo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `statpic_text` varchar(30) NOT NULL DEFAULT 'Opencaching',
  `no_htmledit_flag` tinyint(1) NOT NULL DEFAULT '0',
  `notify_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `notify_oconly` tinyint(1) NOT NULL DEFAULT '1',
  `language` char(2) DEFAULT NULL,
  `language_guessed` tinyint(1) NOT NULL DEFAULT '0',
  `domain` varchar(40) DEFAULT NULL,
  `admin` smallint(5) unsigned NOT NULL DEFAULT '0',
  `data_license` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `desc_htmledit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `email` (`email`),
  KEY `notify_radius` (`notify_radius`)
) ENGINE=InnoDB AUTO_INCREMENT=170300 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `uuid`, `node`, `date_created`, `last_modified`, `last_login`, `username`, `password`, `admin_password`, `roles`, `email`, `email_problems`, `first_email_problem`, `last_email_problem`, `mailing_problems`, `accept_mailing`, `usermail_send_addr`, `latitude`, `longitude`, `is_active_flag`, `last_name`, `first_name`, `country`, `pmr_flag`, `new_pw_code`, `new_pw_date`, `new_email_code`, `new_email_date`, `new_email`, `permanent_login_flag`, `watchmail_mode`, `watchmail_hour`, `watchmail_nextmail`, `watchmail_day`, `activation_code`, `statpic_logo`, `statpic_text`, `no_htmledit_flag`, `notify_radius`, `notify_oconly`, `language`, `language_guessed`, `domain`, `admin`, `data_license`, `description`, `desc_htmledit`) VALUES (107469,'32966607-BDFA-D0B8-06A8-D632824DC936',1,'2006-08-27 15:49:25','2020-12-16 21:00:10','2020-12-18','root','5e8edd851d2fdfbd7415232c67367cc3',NULL,NULL,'root@localhost',0,NULL,NULL,0,1,0,50,8.1666666666667,1,'','','DE',0,NULL,NULL,NULL,NULL,NULL,1,0,0,'2012-07-23 05:23:09',0,'',4,'',0,0,0,'EN',0,'docker.team-opencaching.de',255,0,'<p>\n</p><hr style=\"height:5px;width:100%;\" size=\"5\" /><p><span style=\"font-size:medium;\">You can find information and login data for other users here:</span></p>\n<p><span style=\"font-size:medium;\">..tbd..</span></p>\n<p><span style=\"font-size:medium;\"><br /></span></p>\n<p>\n</p><hr style=\"height:5px;width:100%;\" size=\"5\" />',1),(170288,'1405189a-3f86-11eb-96df-0242ac120002',5,'2020-12-16 19:00:48','2020-12-16 19:00:48','2020-12-16','SupportUser','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'support@example.com',0,NULL,NULL,0,1,0,0,0,1,'Sauer','Susi','DE',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:00:48',0,'',0,'Opencaching',0,0,1,'DE',0,'docker.team-opencaching.de',0,2,'',1),(170289,'39d92454-3f8a-11eb-96df-0242ac120002',5,'2020-12-16 19:30:30','2020-12-16 20:02:45','2020-12-18','Gustav_0815','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'Gustav_0815@example.com',0,NULL,NULL,0,1,0,51.16055,10.4425,1,'Gans','Gustav','DE',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:30:30',0,'',0,'Opencaching',0,150,0,'EN',0,'docker.team-opencaching.de',0,2,'<p><span style=\"font-size:large;\">Hallo, ich bin der Gustav.</span></p>',1),(170290,'817091ed-3f8a-11eb-96df-0242ac120002',5,'2020-12-16 19:32:30','2020-12-16 19:32:30','2020-12-18','Müßiggang','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'Muessiggang@example.com',0,NULL,NULL,0,1,0,47.8,13.033333333333,1,'Antonius','Anton','AT',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:32:30',0,'',0,'Opencaching',0,0,1,'EN',0,'docker.team-opencaching.de',0,2,'',1),(170291,'a945320e-3f8a-11eb-96df-0242ac120002',5,'2020-12-16 19:33:37','2020-12-16 19:33:37','2020-12-18','cacheteam Brügge','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'cacheteam_Bruegge@example.com',0,NULL,NULL,0,1,0,51.209444,3.22,1,'Blau','Berta','BE',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:33:37',0,'',0,'Opencaching',0,0,1,'EN',0,'docker.team-opencaching.de',0,2,'',1),(170292,'38dc9a9c-3f8b-11eb-96df-0242ac120002',5,'2020-12-16 19:37:38','2020-12-16 19:37:38','2020-12-18','king cach0r &&&///###','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'king_cach0r!$%&/=?@example.com',0,NULL,NULL,0,1,0,30.663611,104.066667,1,'Claus','Cäsar','CN',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:37:38',0,'',0,'Opencaching',0,0,1,'EN',0,'docker.team-opencaching.de',0,2,'',1),(170293,'5edc7f41-3f8b-11eb-96df-0242ac120002',5,'2020-12-16 19:38:41','2020-12-16 20:22:19','2020-12-18','lol','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'user05@example.com',0,NULL,NULL,0,1,0,51.22555,6.7827833333333,1,'Dörfler','Dora','DE',1,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:38:41',0,'',0,'Opencaching',0,0,1,'EN',0,'docker.team-opencaching.de',0,2,'',1),(170294,'c6e9746f-3f8b-11eb-96df-0242ac120002',5,'2020-12-16 19:41:36','2020-12-16 20:34:34','2020-12-18','Zar Peter','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'PeterDerGrosse@example.com',0,NULL,NULL,0,1,0,55.75,37.616666666667,1,'Der Große','Peter','RU',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:41:36',0,'',0,'Opencaching',0,10,0,'EN',0,'docker.team-opencaching.de',0,2,'<p><span style=\"font-size:medium;\"><a title=\"Zar Peter\" rel=\"noreferrer noopener\" href=\"https://ru.wikipedia.org/wiki/%D0%9F%D1%91%D1%82%D1%80_I\" target=\"_blank\"><strong>Пётр I Алексе́евич</strong></a>, прозванный Вели́ким (30 мая [9 июня] 1672 года — 28 января [8 февраля] 1725 года) — последний царь всея Руси (с 1682 года) и первый Император Всероссийский (с 1721 года).</span></p>\n<p><span style=\"font-size:medium;\"><img style=\"vertical-align:middle;border:1px solid #000000;margin-top:10px;margin-bottom:10px;margin-left:20px;margin-right:20px;\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Peter_der-Grosse_1838.jpg/274px-Peter_der-Grosse_1838.jpg\" alt=\"Pjotr\" width=\"274\" height=\"368\" /></span></p>\n<p><span style=\"font-size:medium;\"><span style=\"font-size:xx-large;\"><span style=\"font-size:x-small;\">(Quelle: ru.wikipedia.org)</span></span></span></p>',1),(170295,'01bfece2-3f8c-11eb-96df-0242ac120002',5,'2020-12-16 19:43:15','2020-12-16 20:33:33','2020-12-18','Beat Takeshi','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'takeshi@example.com',0,NULL,NULL,0,1,0,44.302616666667,142.63515,1,'Takeshi','Kitano','JP',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:43:15',0,'',0,'Opencaching',0,0,1,'EN',0,'docker.team-opencaching.de',0,2,'<p><span style=\"font-size:xx-large;\">蛙の子は蛙。</span></p>\n<p> </p>\n<p><span style=\"font-size:xx-large;\"><strong>Takeshi Kitano</strong> (<a title=\"Japanische Schrift\" href=\"https://de.wikipedia.org/wiki/Japanische_Schrift\">jap.</a> <span class=\"Hani\" lang=\"ja-hani\" xml:lang=\"ja-hani\">北野 武</span> <em>Kitano Takeshi</em>; * <a title=\"18. Januar\" href=\"https://de.wikipedia.org/wiki/18._Januar\">18. Januar</a> <a title=\"1947\" href=\"https://de.wikipedia.org/wiki/1947\">1947</a> in <a title=\"Adachi\" href=\"https://de.wikipedia.org/wiki/Adachi\">Adachi</a>, <a title=\"Tokio\" href=\"https://de.wikipedia.org/wiki/Tokio\">Tokio</a>) ist ein <a title=\"Japan\" href=\"https://de.wikipedia.org/wiki/Japan\">japanischer</a> <a title=\"Regisseur\" href=\"https://de.wikipedia.org/wiki/Regisseur\">Regisseur</a>, <a title=\"Schauspieler\" href=\"https://de.wikipedia.org/wiki/Schauspieler\">Schauspieler</a>, Dichter, Autor, TV- und Radiomoderator, Maler und populärer Comedian. In Deutschland ist er vorrangig dank der Filme <a class=\"mw-redirect\" title=\"Hana-Bi\" href=\"https://de.wikipedia.org/wiki/Hana-Bi\">Hana-Bi</a>, <a title=\"Battle Royale\" href=\"https://de.wikipedia.org/wiki/Battle_Royale\">Battle Royale</a>, <a title=\"Zatoichi – Der blinde Samurai\" href=\"https://de.wikipedia.org/wiki/Zatoichi_%E2%80%93_Der_blinde_Samurai\">Zatoichi – Der blinde Samurai</a>, <a title=\"Kikujiros Sommer\" href=\"https://de.wikipedia.org/wiki/Kikujiros_Sommer\">Kikujiros Sommer</a>, aber auch der Gameshow <a title=\"Takeshi’s Castle\" href=\"https://de.wikipedia.org/wiki/Takeshi%E2%80%99s_Castle\">Takeshi’s Castle</a> bekannt geworden. Seit April 2005 ist er außerdem Dozent an der <a class=\"mw-redirect\" title=\"Tokyo National University of Fine Arts and Music\" href=\"https://de.wikipedia.org/wiki/Tokyo_National_University_of_Fine_Arts_and_Music\">Tokyo National University of Fine Arts and Music</a>. In Japan ist er auch unter dem Pseudonym <em>Beat Takeshi</em> bekannt.</span></p>\n<p><span style=\"font-size:xx-large;\"><img src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/TakesiKitano.jpg/170px-TakesiKitano.jpg\" alt=\"\" /></span></p>\n<p><span style=\"font-size:xx-large;\"><span style=\"font-size:x-small;\">(Quelle: de.wikipedia.org)</span><br /></span></p>',1),(170296,'4c916985-3f8c-11eb-96df-0242ac120002',5,'2020-12-16 19:45:20','2020-12-16 19:45:20','2020-12-18','bruker','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'bruker@example.com',0,NULL,NULL,0,1,0,68.327466666667,16.77805,1,'Lyngstad','Anni-Frid','NO',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:45:20',0,'',0,'Opencaching',0,0,0,'EN',0,'docker.team-opencaching.de',0,2,'',1),(170297,'53ded00b-3f8d-11eb-96df-0242ac120002',5,'2020-12-16 19:52:42','2020-12-16 19:52:42',NULL,'Nichtaktivierter Nutzer','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'nichtaktiviert@example.com',0,NULL,NULL,0,1,0,0,0,0,'Pan','Peter','DE',0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-16 20:52:42',0,'27E0972C60D31',0,'Opencaching',0,0,1,NULL,0,NULL,0,2,'',1),(170298,'865f5a39-3fd6-11eb-96df-0242ac120002',5,'2020-12-17 13:23:34','2020-12-17 13:23:34','2020-12-18','Gesperrter Nutzer',NULL,NULL,NULL,NULL,0,NULL,NULL,0,1,0,0,0,0,'','',NULL,0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-17 14:23:34',0,'',0,'Opencaching',0,0,1,'EN',0,'docker.team-opencaching.de',0,2,'',1),(170299,'8c992f35-4052-11eb-96df-0242ac120002',5,'2020-12-18 11:19:42','2020-12-18 11:19:42','2020-12-18','DSGVO gelöschter Nutzer','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,'noDSGVO@example.com',0,NULL,NULL,0,1,0,0,0,1,'','',NULL,0,NULL,NULL,NULL,NULL,NULL,1,1,0,'2020-12-18 12:19:42',0,'',0,'Opencaching',0,0,1,'EN',0,'docker.team-opencaching.de',0,2,'',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `userBeforeInsert` BEFORE INSERT ON `user`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            SET NEW.`date_created`=NOW();
            SET NEW.`last_modified`=NOW();
        END IF;

        IF ISNULL(NEW.`uuid`) OR NEW.`uuid`='' THEN
            SET NEW.`uuid`=CREATE_UUID();
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `userBeforeUpdate` BEFORE UPDATE ON `user`
     FOR EACH ROW BEGIN
        
        IF ISNULL(@XMLSYNC) OR @XMLSYNC!=1 THEN
            IF
                NEW.`user_id`!=OLD.`user_id`
                OR NEW.`uuid`!=BINARY OLD.`uuid`
                OR NEW.`node`!=OLD.`node`
                OR NEW.`date_created`!=OLD.`date_created`
                OR NEW.`username`!=BINARY OLD.`username`
                OR NEW.`country`!=BINARY OLD.`country`
                OR NEW.`pmr_flag`!=OLD.`pmr_flag`
                OR NEW.`description`!=BINARY OLD.`description`
            THEN
                SET NEW.`last_modified`=NOW();
            END IF;
        END IF;
        IF NEW.`email_problems`>0 AND NEW.`first_email_problem` IS NULL THEN
            SET NEW.`first_email_problem` = NEW.`last_email_problem`;
        ELSEIF NEW.`email_problems`=0 THEN
            SET NEW.`first_email_problem` = NULL;
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `userBeforeDelete` BEFORE DELETE ON `user`
     FOR EACH ROW BEGIN
        IF IFNULL(@allowdelete,0)=0 THEN
            CALL error_set_allowdelete_to_delete_users();
            
        ELSEIF IFNULL(@fastdelete,0) = 0 THEN
            
            SET @deleting_user=1;

            DELETE FROM `cache_adoption` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_adoptions` WHERE `from_user_id`=OLD.user_id;
            DELETE FROM `cache_adoptions` WHERE `to_user_id`=OLD.user_id;
            DELETE FROM `cache_ignore` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_list_bookmarks` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_list_watches` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_lists` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_logs` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_logs_archived` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_rating` WHERE `user_id`=OLD.user_id;
            DELETE FROM `cache_reports` WHERE `userid`=OLD.user_id;  
            DELETE FROM `cache_watches` WHERE `user_id`=OLD.user_id;
            DELETE FROM `caches` WHERE `user_id`=OLD.user_id;
            DELETE FROM `coordinates` WHERE `user_id`=OLD.user_id;
            
            DELETE FROM `notify_waiting` WHERE `user_id`=OLD.user_id;
            DELETE FROM `queries` WHERE `user_id`=OLD.user_id;
            DELETE FROM `stat_cache_logs` WHERE `user_id`=OLD.user_id;
            DELETE FROM `stat_user` WHERE `user_id`=OLD.user_id;
            DELETE FROM `sys_repl_exclude` WHERE `user_id`=OLD.user_id;
            
            DELETE FROM `user_delegates` WHERE `user_id`=OLD.user_id;
            DELETE FROM `user_options` WHERE `user_id`=OLD.user_id;
            DELETE FROM `user_statpic` WHERE `user_id`=OLD.user_id;
            DELETE FROM `watches_logqueue` WHERE `user_id`=OLD.user_id;
            DELETE FROM `watches_notified` WHERE `user_id`=OLD.user_id;
            DELETE FROM `watches_waiting` WHERE `user_id`=OLD.user_id;

            SET @deleting_user=0;

            
        END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `userAfterDelete` AFTER DELETE ON `user`
     FOR EACH ROW BEGIN
        INSERT IGNORE INTO `removed_objects` (`localId`, `uuid`, `type`, `node`) VALUES (OLD.`user_id`, OLD.`uuid`, 4, OLD.`node`);
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_delegates`
--

DROP TABLE IF EXISTS `user_delegates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_delegates` (
  `user_id` int(10) unsigned NOT NULL,
  `node` tinyint(3) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_delegates`
--

LOCK TABLES `user_delegates` WRITE;
/*!40000 ALTER TABLE `user_delegates` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_delegates` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `userDelegatesBeforeInsert` BEFORE INSERT ON `user_delegates`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `userDelegatesBeforeUpdate` BEFORE UPDATE ON `user_delegates`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_options`
--

DROP TABLE IF EXISTS `user_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_options` (
  `user_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `option_visible` tinyint(1) NOT NULL DEFAULT '1',
  `option_value` longtext,
  PRIMARY KEY (`user_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='user options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_options`
--

LOCK TABLES `user_options` WRITE;
/*!40000 ALTER TABLE `user_options` DISABLE KEYS */;
INSERT INTO `user_options` (`user_id`, `option_id`, `option_visible`, `option_value`) VALUES (170289,1,0,'11'),(170289,2,1,'Niederdorla'),(170289,3,0,''),(170289,4,1,'99'),(170289,5,0,'1'),(170289,6,0,'1'),(170289,7,0,'0'),(170289,8,0,'0'),(170289,9,0,'1'),(170289,10,0,'7'),(170289,11,0,'1'),(170289,13,0,''),(170289,14,0,'1'),(170290,1,0,'11'),(170290,2,0,'Salzburg'),(170290,3,0,''),(170290,4,0,'3'),(170290,5,0,'1'),(170290,6,0,'1'),(170290,7,0,'0'),(170290,8,0,'0'),(170290,9,0,'1'),(170290,10,0,'7'),(170290,11,0,'1'),(170290,13,0,''),(170290,14,0,'1'),(170291,1,0,'11'),(170291,2,0,'Brügge'),(170291,3,0,''),(170291,4,0,''),(170291,5,0,'1'),(170291,6,0,'1'),(170291,7,0,'0'),(170291,8,0,'0'),(170291,9,0,'1'),(170291,10,0,'7'),(170291,11,0,'1'),(170291,13,0,''),(170291,14,0,'1'),(170292,1,0,'11'),(170292,2,1,'Chengdu'),(170292,3,0,''),(170292,4,1,'35'),(170292,5,0,'1'),(170292,6,0,'1'),(170292,7,0,'0'),(170292,8,0,'0'),(170292,9,0,'1'),(170292,10,0,'7'),(170292,11,0,'1'),(170292,13,0,''),(170292,14,0,'1'),(170293,1,0,'11'),(170293,2,1,'Düsseldorf'),(170293,3,0,''),(170293,4,1,''),(170293,5,0,'1'),(170293,6,0,'1'),(170293,7,0,'0'),(170293,8,0,'0'),(170293,9,0,'1'),(170293,10,0,'7'),(170293,11,0,'1'),(170293,13,0,''),(170293,14,0,'1'),(170294,1,0,'11'),(170294,2,1,'Москва́'),(170294,3,0,''),(170294,4,1,'111'),(170294,5,0,'1'),(170294,6,0,'1'),(170294,7,0,'0'),(170294,8,0,'0'),(170294,9,0,'1'),(170294,10,0,'7'),(170294,11,0,'1'),(170294,13,0,''),(170294,14,0,'1'),(170295,1,0,'11'),(170295,2,1,'足立区'),(170295,3,0,''),(170295,4,1,'73'),(170295,5,0,'1'),(170295,6,0,'1'),(170295,7,0,'0'),(170295,8,0,'0'),(170295,9,0,'1'),(170295,10,0,'7'),(170295,11,0,'1'),(170295,13,0,''),(170295,14,0,'1'),(170296,1,0,'11'),(170296,2,1,'Bjørkåsen'),(170296,3,0,''),(170296,4,1,'75'),(170296,5,0,'1'),(170296,6,0,'1'),(170296,7,0,'0'),(170296,8,0,'0'),(170296,9,0,'1'),(170296,10,0,'7'),(170296,11,0,'1'),(170296,13,0,''),(170296,14,0,'1');
/*!40000 ALTER TABLE `user_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_roles_user_id_role_id_uindex` (`user_id`,`role_id`),
  KEY `user_roles_security_roles_id_fk` (`role_id`),
  CONSTRAINT `user_roles_security_roles_id_fk` FOREIGN KEY (`role_id`) REFERENCES `security_roles` (`id`),
  CONSTRAINT `user_roles_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`id`, `user_id`, `role_id`) VALUES (1,107469,12);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statpic`
--

DROP TABLE IF EXISTS `user_statpic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_statpic` (
  `user_id` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statpic`
--

LOCK TABLES `user_statpic` WRITE;
/*!40000 ALTER TABLE `user_statpic` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_statpic` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `userStatpicBeforeInsert` BEFORE INSERT ON `user_statpic`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `watches_logqueue`
--

DROP TABLE IF EXISTS `watches_logqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watches_logqueue` (
  `log_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`log_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches_logqueue`
--

LOCK TABLES `watches_logqueue` WRITE;
/*!40000 ALTER TABLE `watches_logqueue` DISABLE KEYS */;
INSERT INTO `watches_logqueue` (`log_id`, `user_id`) VALUES (1,170291),(2,170291),(3,170291),(7,170293),(9,170293);
/*!40000 ALTER TABLE `watches_logqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watches_notified`
--

DROP TABLE IF EXISTS `watches_notified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watches_notified` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'via Trigger (watches_notified)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`object_id`,`object_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches_notified`
--

LOCK TABLES `watches_notified` WRITE;
/*!40000 ALTER TABLE `watches_notified` DISABLE KEYS */;
/*!40000 ALTER TABLE `watches_notified` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `watchesNotifiedBeforeInsert` BEFORE INSERT ON `watches_notified`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `watches_waiting`
--

DROP TABLE IF EXISTS `watches_waiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watches_waiting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'via trigger (watches_waiting)',
  `watchtext` longtext NOT NULL,
  `watchtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches_waiting`
--

LOCK TABLES `watches_waiting` WRITE;
/*!40000 ALTER TABLE `watches_waiting` DISABLE KEYS */;
/*!40000 ALTER TABLE `watches_waiting` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `watchesWaitingBeforeInsert` BEFORE INSERT ON `watches_waiting`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `watches_waitingtypes`
--

DROP TABLE IF EXISTS `watches_waitingtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watches_waitingtypes` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `watchtype` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='static content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches_waitingtypes`
--

LOCK TABLES `watches_waitingtypes` WRITE;
/*!40000 ALTER TABLE `watches_waitingtypes` DISABLE KEYS */;
INSERT INTO `watches_waitingtypes` (`id`, `watchtype`) VALUES (1,'ownerlog'),(2,'cache_watches');
/*!40000 ALTER TABLE `watches_waitingtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waypoint_reports`
--

DROP TABLE IF EXISTS `waypoint_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waypoint_reports` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_reported` datetime NOT NULL,
  `wp_oc` varchar(7) NOT NULL,
  `wp_external` varchar(8) NOT NULL,
  `source` varchar(64) NOT NULL,
  `gcwp_processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`report_id`),
  KEY `gcwp_processed` (`gcwp_processed`,`date_reported`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waypoint_reports`
--

LOCK TABLES `waypoint_reports` WRITE;
/*!40000 ALTER TABLE `waypoint_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `waypoint_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xmlsession`
--

DROP TABLE IF EXISTS `xmlsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlsession` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'via trigger (xmlsession)',
  `last_use` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `users` int(10) unsigned NOT NULL DEFAULT '0',
  `caches` int(10) unsigned NOT NULL DEFAULT '0',
  `cachedescs` int(10) unsigned NOT NULL DEFAULT '0',
  `cachelogs` int(10) unsigned NOT NULL DEFAULT '0',
  `pictures` int(10) unsigned NOT NULL DEFAULT '0',
  `removedobjects` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_since` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cleaned` tinyint(1) NOT NULL DEFAULT '0',
  `agent` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xmlsession`
--

LOCK TABLES `xmlsession` WRITE;
/*!40000 ALTER TABLE `xmlsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `xmlsession` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `xmlsessionBeforeInsert` BEFORE INSERT ON `xmlsession`
     FOR EACH ROW BEGIN
        SET NEW.`date_created`=NOW();
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `xmlsession_data`
--

DROP TABLE IF EXISTS `xmlsession_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlsession_data` (
  `session_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`,`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xmlsession_data`
--

LOCK TABLES `xmlsession_data` WRITE;
/*!40000 ALTER TABLE `xmlsession_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `xmlsession_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18 14:37:25