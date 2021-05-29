-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: ntayeb
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.21.04.1

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
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(23,4,'recipe_id','text','Recipe Id',1,1,1,1,1,1,'{}',2),(24,4,'name','text','Name',1,1,1,1,1,1,'{}',3),(25,4,'qty','text','Qty',1,1,1,1,1,1,'{}',4),(26,4,'unit','text','Unit',1,1,1,1,1,1,'{}',5),(27,5,'id','text','Id',1,0,0,0,0,0,'{}',1),(28,5,'user_id','text','User Id',1,1,1,1,1,1,'{}',2),(29,5,'name','text','Name',1,1,1,1,1,1,'{}',3),(30,5,'description','text','Description',1,1,1,1,1,1,'{}',4),(31,5,'image','text','Image',1,1,1,1,1,1,'{}',5),(32,5,'category','text','Category',1,1,1,1,1,1,'{}',6),(33,5,'prep','text','Prep',1,1,1,1,1,1,'{}',7),(34,5,'cook','text','Cook',1,1,1,1,1,1,'{}',8),(35,5,'difficulty','text','Difficulty',1,1,1,1,1,1,'{}',9),(36,5,'yield','text','Yield',1,1,1,1,1,1,'{}',10),(37,5,'valida','text','Valida',1,1,1,1,1,1,'{}',11),(38,5,'cuisine','text','Cuisine',1,1,1,1,1,1,'{}',12),(39,5,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',13),(40,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',14),(41,5,'recipe_hasmany_recipe_ingredient_relationship','relationship','recipe_ingredients',0,1,1,1,1,1,'{\"model\":\"App\\\\RecipeIngredient\",\"table\":\"recipe_ingredients\",\"type\":\"hasMany\",\"column\":\"recipe_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":null}',15),(42,6,'id','text','Id',1,0,0,0,0,0,'{}',1),(43,6,'recipe_id','text','Recipe Id',1,1,1,1,1,1,'{}',2),(44,6,'description','text','Description',1,1,1,1,1,1,'{}',3),(45,5,'recipe_hasmany_recipe_direction_relationship','relationship','recipe_directions',0,1,1,1,1,1,'{\"model\":\"App\\\\RecipeDirection\",\"table\":\"recipe_directions\",\"type\":\"hasMany\",\"column\":\"recipe_id\",\"key\":\"id\",\"label\":\"description\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":null}',16);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2019-07-18 14:20:26','2019-07-18 14:20:26'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2019-07-18 14:20:26','2019-07-18 14:20:26'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-07-18 14:20:26','2019-07-18 14:20:26'),(4,'recipe_ingredients','recipe-ingredients','Recipe Ingredient','Recipe Ingredients',NULL,'App\\RecipeIngredient',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-07-18 14:21:13','2019-07-18 14:21:13'),(5,'recipes','recipes','Recipe','Recipes',NULL,'App\\Recipe',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-07-18 14:21:30','2019-07-18 14:21:30'),(6,'recipe_directions','recipe-directions','Recipe Direction','Recipe Directions',NULL,'App\\RecipeDirection',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-07-18 14:23:24','2019-07-18 14:23:24');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2019-07-18 14:20:26','2019-07-18 14:20:26','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2019-07-18 14:20:26','2019-07-18 14:20:26','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2019-07-18 14:20:26','2019-07-18 14:20:26','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2019-07-18 14:20:26','2019-07-18 14:20:26','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2019-07-18 14:20:26','2019-07-18 14:20:26',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2019-07-18 14:20:26','2019-07-18 14:20:26','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,11,'2019-07-18 14:20:26','2019-07-18 14:20:26','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2019-07-18 14:20:27','2019-07-18 14:20:27','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2019-07-18 14:20:27','2019-07-18 14:20:27','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2019-07-18 14:20:27','2019-07-18 14:20:27','voyager.settings.index',NULL),(11,1,'Hooks','','_self','voyager-hook',NULL,5,13,'2019-07-18 14:20:27','2019-07-18 14:20:27','voyager.hooks',NULL),(12,1,'Recipe Ingredients','','_self',NULL,NULL,NULL,15,'2019-07-18 14:21:13','2019-07-18 14:21:13','voyager.recipe-ingredients.index',NULL),(13,1,'Recipes','','_self',NULL,NULL,NULL,16,'2019-07-18 14:21:30','2019-07-18 14:21:30','voyager.recipes.index',NULL),(14,1,'Recipe Directions','','_self',NULL,NULL,NULL,17,'2019-07-18 14:23:24','2019-07-18 14:23:24','voyager.recipe-directions.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2019-07-18 14:20:26','2019-07-18 14:20:26');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2016_01_01_000000_add_voyager_user_fields',1),(3,'2016_01_01_000000_create_data_types_table',1),(4,'2016_05_19_173453_create_menu_table',1),(5,'2016_10_21_190000_create_roles_table',1),(6,'2016_10_21_190000_create_settings_table',1),(7,'2016_11_30_135954_create_permission_table',1),(8,'2016_11_30_141208_create_permission_role_table',1),(9,'2016_12_26_201236_data_types__add__server_side',1),(10,'2017_01_13_000000_add_route_to_menu_items_table',1),(11,'2017_01_14_005015_create_translations_table',1),(12,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(13,'2017_03_06_000000_add_controller_to_data_types_table',1),(14,'2017_04_21_000000_add_order_to_data_rows_table',1),(15,'2017_07_05_210000_add_policyname_to_data_types_table',1),(16,'2017_08_05_000000_add_group_to_settings_table',1),(17,'2017_11_26_013050_add_user_role_relationship',1),(18,'2017_11_26_015000_create_user_roles_table',1),(19,'2018_03_11_000000_add_user_settings',1),(20,'2018_03_14_000000_add_details_to_data_types_table',1),(21,'2018_03_16_000000_make_settings_value_nullable',1),(22,'2019_04_06_194011_create_recipes_table',1),(23,'2019_04_06_194032_create_recipe_ingredients_table',1),(24,'2019_04_06_194044_create_recipe_directions_table',1),(25,'2019_06_25_225555_add_unit_to_ingredients',1),(26,'2014_10_12_100000_create_password_resets_table',2),(27,'2017_12_07_122845_create_oauth_providers_table',2),(28,'2020_05_04_194015_create_tags_table',3),(29,'2020_05_04_194607_create_tagrec_table',4),(30,'2019_08_19_000000_create_failed_jobs_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_providers`
--

DROP TABLE IF EXISTS `oauth_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_providers_user_id_foreign` (`user_id`),
  KEY `oauth_providers_provider_user_id_index` (`provider_user_id`),
  CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_providers`
--

LOCK TABLES `oauth_providers` WRITE;
/*!40000 ALTER TABLE `oauth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2019-07-18 14:20:27','2019-07-18 14:20:27'),(2,'browse_bread',NULL,'2019-07-18 14:20:27','2019-07-18 14:20:27'),(3,'browse_database',NULL,'2019-07-18 14:20:27','2019-07-18 14:20:27'),(4,'browse_media',NULL,'2019-07-18 14:20:27','2019-07-18 14:20:27'),(5,'browse_compass',NULL,'2019-07-18 14:20:27','2019-07-18 14:20:27'),(6,'browse_menus','menus','2019-07-18 14:20:27','2019-07-18 14:20:27'),(7,'read_menus','menus','2019-07-18 14:20:27','2019-07-18 14:20:27'),(8,'edit_menus','menus','2019-07-18 14:20:27','2019-07-18 14:20:27'),(9,'add_menus','menus','2019-07-18 14:20:27','2019-07-18 14:20:27'),(10,'delete_menus','menus','2019-07-18 14:20:27','2019-07-18 14:20:27'),(11,'browse_roles','roles','2019-07-18 14:20:27','2019-07-18 14:20:27'),(12,'read_roles','roles','2019-07-18 14:20:27','2019-07-18 14:20:27'),(13,'edit_roles','roles','2019-07-18 14:20:27','2019-07-18 14:20:27'),(14,'add_roles','roles','2019-07-18 14:20:27','2019-07-18 14:20:27'),(15,'delete_roles','roles','2019-07-18 14:20:27','2019-07-18 14:20:27'),(16,'browse_users','users','2019-07-18 14:20:27','2019-07-18 14:20:27'),(17,'read_users','users','2019-07-18 14:20:27','2019-07-18 14:20:27'),(18,'edit_users','users','2019-07-18 14:20:27','2019-07-18 14:20:27'),(19,'add_users','users','2019-07-18 14:20:27','2019-07-18 14:20:27'),(20,'delete_users','users','2019-07-18 14:20:27','2019-07-18 14:20:27'),(21,'browse_settings','settings','2019-07-18 14:20:27','2019-07-18 14:20:27'),(22,'read_settings','settings','2019-07-18 14:20:27','2019-07-18 14:20:27'),(23,'edit_settings','settings','2019-07-18 14:20:27','2019-07-18 14:20:27'),(24,'add_settings','settings','2019-07-18 14:20:27','2019-07-18 14:20:27'),(25,'delete_settings','settings','2019-07-18 14:20:27','2019-07-18 14:20:27'),(26,'browse_hooks',NULL,'2019-07-18 14:20:27','2019-07-18 14:20:27'),(27,'browse_recipe_ingredients','recipe_ingredients','2019-07-18 14:21:13','2019-07-18 14:21:13'),(28,'read_recipe_ingredients','recipe_ingredients','2019-07-18 14:21:13','2019-07-18 14:21:13'),(29,'edit_recipe_ingredients','recipe_ingredients','2019-07-18 14:21:13','2019-07-18 14:21:13'),(30,'add_recipe_ingredients','recipe_ingredients','2019-07-18 14:21:13','2019-07-18 14:21:13'),(31,'delete_recipe_ingredients','recipe_ingredients','2019-07-18 14:21:13','2019-07-18 14:21:13'),(32,'browse_recipes','recipes','2019-07-18 14:21:30','2019-07-18 14:21:30'),(33,'read_recipes','recipes','2019-07-18 14:21:30','2019-07-18 14:21:30'),(34,'edit_recipes','recipes','2019-07-18 14:21:30','2019-07-18 14:21:30'),(35,'add_recipes','recipes','2019-07-18 14:21:30','2019-07-18 14:21:30'),(36,'delete_recipes','recipes','2019-07-18 14:21:30','2019-07-18 14:21:30'),(37,'browse_recipe_directions','recipe_directions','2019-07-18 14:23:24','2019-07-18 14:23:24'),(38,'read_recipe_directions','recipe_directions','2019-07-18 14:23:24','2019-07-18 14:23:24'),(39,'edit_recipe_directions','recipe_directions','2019-07-18 14:23:24','2019-07-18 14:23:24'),(40,'add_recipe_directions','recipe_directions','2019-07-18 14:23:24','2019-07-18 14:23:24'),(41,'delete_recipe_directions','recipe_directions','2019-07-18 14:23:24','2019-07-18 14:23:24');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_directions`
--

DROP TABLE IF EXISTS `recipe_directions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_directions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int unsigned NOT NULL,
  `description` varchar(3055) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_directions`
--

LOCK TABLES `recipe_directions` WRITE;
/*!40000 ALTER TABLE `recipe_directions` DISABLE KEYS */;
INSERT INTO `recipe_directions` VALUES (1,1,'Cuire'),(2,1,'Manger'),(3,2,'Preparer'),(4,2,'Cuire'),(5,2,'servir'),(6,2,'Manger'),(7,3,'Line muffin tins with paper liners or grease with butter. Adjust oven rack to middle position and preheat oven to 350°F.'),(8,3,'In a medium bowl, whisk together oats, flour, sugar, baking powder, and salt. Set aside.'),(9,4,'Line muffin tins with paper liners or grease with butter. Adjust oven rack to middle position and preheat oven to 350°F.'),(10,4,'In a medium bowl, whisk together oats, flour, sugar, baking powder, and salt. Set aside.'),(11,5,'Line muffin tins with paper liners or grease with butter. Adjust oven rack to middle position and preheat oven to 350°F.'),(12,5,'In a medium bowl, whisk together oats, flour, sugar, baking powder, and salt. Set aside.'),(13,6,'Line muffin tins with paper liners or grease with butter. Adjust oven rack to middle position and preheat oven to 350°F.'),(14,6,'In a medium bowl, whisk together oats, flour, sugar, baking powder, and salt. Set aside.'),(15,7,'Line muffin tins with paper liners or grease with butter. Adjust oven rack to middle position and preheat oven to 350°F.'),(16,7,'In a medium bowl, whisk together oats, flour, sugar, baking powder, and salt. Set aside.'),(17,7,'In a small bowl, whisk together milk, sour cream, and egg. Add to dry ingredients and stir until just combined. Stir in chocolate chips. Let batter stand 5 minutes for oats to absorb some liquid.'),(18,7,'Pour batter into muffin cups, filling 3/4 way. Bake until a cake tester inserted in the middle of a muffin comes out clean, about 12 minutes.'),(19,8,'bvbvb'),(20,8,'vbcvbcvb'),(21,10,'bing bonhg'),(22,10,'bong bong'),(23,11,'preparer'),(24,11,'manger'),(25,11,'bbb'),(26,12,'preparer'),(27,12,'manger'),(28,12,'bbb'),(29,13,'test'),(30,13,'test'),(31,14,'Test'),(32,14,'Caraméliser le moule:\nOn peut utiliser des ramequins individuels ou bien un moule à brioche ou un moule en couronne…etc.\nPréparer le caramel :\nDans une casserole imbiber les morceaux de sucre d’eau. Poser sur feu moyen. Secouer de temps en temps la casserole si la cuisson n’est pas régulière, surtout ne pas remuer. Verser dans le moule quand la couleur désirée est atteinte.'),(33,14,'Faire bouillir le lait dans une casserole avec la gousse de vanilla fendue. Ajouter le sucre. Puis laisser le lait infuser pendant 5 minutes. Retirer la gousse de vanille'),(35,15,'bla bla'),(36,15,'bla bla'),(37,16,'Laissez ramollir le beurre à température ambiante. Dans un saladier, malaxez-le avec le sucre.'),(38,16,'Ajoutez l\'oeuf et éventuellement le sucre vanillé.'),(39,16,'Versez progressivement la farine, la levure chimique, le sel et les pépites de chocolat. Mélangez bien.'),(40,16,'Beurrez une plaque allant au four ou recouvrez-la d\'une plaque de silicone. À l\'aide de deux cuillères à soupe ou simplement avec les mains, formez des noix de pâte en les espaçant car elles s\'étaleront à la cuisson.'),(41,16,'Faites cuire 8 à 10 minutes à 180°C soit thermostat 6. Il faut les sortir dès que les contours commencent à brunir.');
/*!40000 ALTER TABLE `recipe_directions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int unsigned NOT NULL,
  `ingredient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,'Oignon','1','Kg'),(2,2,'Viande','1','Kg'),(3,2,'Oignon','4','7abbate'),(4,2,'Ail','1','Gouse'),(5,2,'Eau','1','L'),(6,2,'Moutarde','2','Cas'),(7,3,'quick cooking oats','3/4','cup'),(8,3,'all purpose flour','1/2','cup'),(9,3,'sugar','1/4','cup'),(10,3,'baking powder','1 1/2','teaspoons'),(11,3,'salt','1/4','teaspoon'),(12,3,'milk','1/2','cup'),(13,3,'sour cream','1/8','cup'),(14,3,'egg','1','7abba'),(15,3,'semi sweet chocolate chips','1/4','cup'),(16,4,'quick cooking oats','3/4','cup'),(17,4,'all purpose flour','1/2','cup'),(18,4,'sugar','1/4','cup'),(19,4,'baking powder','1 1/2','teaspoons'),(20,4,'salt','1/4','teaspoon'),(21,4,'milk','1/2','cup'),(22,4,'sour cream','1/8','cup'),(23,4,'egg','1','7abba'),(24,4,'semi sweet chocolate chips','1/4','cup'),(25,5,'quick cooking oats','3/4','cup'),(26,5,'all purpose flour','1/2','cup'),(27,5,'sugar','1/4','cup'),(28,5,'baking powder','1 1/2','teaspoons'),(29,5,'salt','1/4','teaspoon'),(30,5,'milk','1/2','cup'),(31,5,'sour cream','1/8','cup'),(32,5,'egg','1','7abba'),(33,5,'semi sweet chocolate chips','1/4','cup'),(34,6,'quick cooking oats','3/4','cup'),(35,6,'all purpose flour','1/2','cup'),(36,6,'sugar','1/4','cup'),(37,6,'baking powder','1 1/2','teaspoons'),(38,6,'salt','1/4','teaspoon'),(39,6,'milk','1/2','cup'),(40,6,'sour cream','1/8','cup'),(41,6,'egg','1','7abba'),(42,6,'semi sweet chocolate chips','1/4','cup'),(43,7,'quick cooking oats','3/4','cup'),(44,7,'all purpose flour','1/2','cup'),(45,7,'sugar','1/4','cup'),(46,7,'baking powder','1 1/2','teaspoons'),(47,7,'salt','1/4','teaspoon'),(48,7,'milk','1/2','cup'),(49,7,'sour cream','1/8','cup'),(50,7,'egg','1','7abba'),(51,7,'semi sweet chocolate chips','1/4','cup'),(52,8,'dfsdfs','1','cc'),(53,9,'khourchouff','112','cc'),(54,10,'khourchouff','112','cc'),(55,10,'bla bla bla','15','cc'),(56,11,'Sucre','1','gr'),(57,12,'Sucre','1','gr'),(58,13,'sucre','1','gr'),(59,14,'Lait','50','cl'),(60,14,'Sucre semoule','75','gr'),(61,14,'Oeufs','3','unités'),(62,14,'Vanille','1','gousse'),(63,14,'Sucre en morceaux','15','morceaux'),(64,15,'test','1','unité'),(65,16,'Oeuf','1','unité'),(66,16,'Sucre','85','gr'),(67,16,'Beurre doux','85','gr'),(68,16,'Farine','150','gr'),(69,16,'Pépites de chocolat','100','gr'),(70,16,'Sucre vanillé','1','sachet'),(71,16,'Levure chimique','1','sachet'),(72,16,'Sel','1/2','càc');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prep` int NOT NULL,
  `cook` int NOT NULL,
  `difficulty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `yield` int NOT NULL,
  `valida` int NOT NULL,
  `cuisine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,1,'Soupe à l\'oignon','Grand classique de la cuisine française, la soupe à l\'oignon est toute simple à préparer, délicieuse et revigorante à souhait.','TiA3ThRj9aFhPmMJV3dDVnqP2Jx7RERP.jpeg','Salades',15,20,'Facile',4,1,'Française','2019-07-18 14:20:00','2019-07-18 14:58:08'),(2,1,'La Vionde','Ce plat c\'est de la viande ya 3attay','Mdq5Koie5vAzXWsp8iyZp9pP4XDeSSsY.jpeg','Viande',40,25,'Moyenne',4,1,'Grecque','2019-07-31 13:04:00','2019-07-31 13:33:47'),(7,1,'Oatmeal Mini Muffins','bla bla','r44DhGvEloz0Y8T9WiVl51KmaEjjbdEp.jpeg','Dessert',10,15,'Facile',2,1,'Algérienne','2019-08-21 13:22:52','2019-08-21 13:22:52'),(10,2,'test','dfsfsd','PyHl3CqaBfDEQfmmvAvSsnlATACqvQVS.jpeg','Viande',12,44,'Moyenne',2,0,'Italienne','2020-05-16 15:51:00','2020-05-17 03:41:38'),(12,1,'testingsdfsdfsdf','dfsfsdfsdf','bQDKcrm13fhaaiKjWbO2gXLuTCLdd2z9.jpeg','Salades‎',15,22,'Moyenne',4,0,'Italienne','2020-05-17 03:28:37','2020-05-17 03:28:37'),(13,1,'testing','test','62460t2UPMgauM7p1wK7tEwkb5j1BUQ0.jpeg','Plats',11,22,'Moyenne',4,0,'Tunisienne','2020-05-17 03:30:00','2020-05-17 03:41:13'),(14,3,'La crème renversée','La crème renversée, qu’on appelle aussi œufs au lait si elle est cuite dans un plat en porcelaine à feu et présentée telle quelle, est souvent parfumée à la vanille. Mais elle peut aussi être au café, au caramel ou au chocolat.','6oI3rJjOKq3vVPBWpwCCaSP3EJadYNgd.jpeg','Dessert',20,30,'Facile',6,1,'Française','2020-05-17 03:36:00','2020-05-17 03:37:22'),(15,1,'Recette Test','Bla bla','WHDpcnuBEeJT6oP0ggjdFTmjb4vJBEwj.jpeg','Dessert',10,12,'Moyenne',2,1,'Algéroise','2020-05-17 20:54:00','2020-05-17 20:54:56'),(16,1,'Cookies','Découvrez la recette de Cookies, un peu de rêve et d\'évasion dans un biscuit tendre qui enchante les enfants, les adolescents et les adultes.&','1xXsf5uNRt0iqJ8OEAAgq4yLRp3LSWdu.webp','Dessert',15,10,'Facile',6,1,'Grecque','2020-05-17 21:58:00','2020-05-17 21:58:19');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2019-07-18 14:20:27','2019-07-18 14:20:27'),(2,'user','Normal User','2019-07-18 14:20:27','2019-07-18 14:20:27');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagrec`
--

DROP TABLE IF EXISTS `tagrec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagrec` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagrec`
--

LOCK TABLES `tagrec` WRITE;
/*!40000 ALTER TABLE `tagrec` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagrec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Amir','amir.bouzouina@gmail.com','users/default.png',NULL,'$2y$10$miKeYihg2ENsMkPyPdFUAuhQRjBgd3NqUTExFZU8OwyvdsJgjWhN2','CtAplG8xia6PTTyzGltlqfAtwb25zwq9JW5PM3RVyeWIY0GtfJ8aQHmFHBEe',NULL,NULL,'2019-07-18 14:19:05','2021-04-23 20:06:28'),(2,2,'riad','evilator@gmail.com','users/default.png',NULL,'$2y$10$jFX4iao.sEMD2AD9oZsDp.vuK.QIhd8KucN6B/oY.jjUFah46Q1iq','hqlhcTgytT0ZoYt8bgOo2X8pNG7ZzVsfnqJ9lgqSxwUnDgANbFjp3yWm18A7',NULL,NULL,'2020-05-16 01:20:02','2020-05-16 15:46:47'),(3,2,'Lou','alm.tutor@gmail.com','users/default.png',NULL,'$2y$10$5Em87bBvygt5gihoo20oou9qp.qGi1LfUfCsN1J.laZU3nVVDMhnu','98HtXdWCalTZ9w0jutEuc8RoHrKzu58RF9RhOMvDuCrwt9HgNNnZ2O55dpEn',NULL,NULL,'2020-05-17 02:54:49','2020-05-17 22:16:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ntayeb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-29 20:05:53
