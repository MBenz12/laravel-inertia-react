/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.21-MariaDB : Database - laravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `laravel`;

/*Table structure for table `data_rows` */

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_rows` */

insert  into `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) values 
(1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),
(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),
(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),
(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),
(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),
(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),
(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),
(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),
(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),
(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),
(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),
(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),
(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),
(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),
(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),
(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),
(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),
(22,6,'id','text','Id',1,0,0,0,0,0,'{}',1),
(23,6,'name','text','Name',1,1,1,1,1,1,'{}',2),
(24,6,'health','text','Health',1,1,1,1,1,1,'{}',3),
(25,6,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),
(26,6,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),
(27,7,'id','text','Id',1,0,0,0,0,0,'{}',1),
(28,7,'name','text','Name',1,1,1,1,1,1,'{}',2),
(29,7,'damage','number','Damage',1,1,1,1,1,1,'{}',3),
(30,7,'is_range','checkbox','Is Range',1,1,1,1,1,1,'{}',4),
(31,7,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),
(32,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),
(33,10,'id','text','Id',1,0,0,0,0,0,'{}',1),
(34,10,'hero_id','number','Hero Id',1,1,1,1,1,1,'{}',2),
(35,10,'weapon_id','number','Weapon Id',1,1,1,1,1,1,'{}',3),
(36,10,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),
(37,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5);

/*Table structure for table `data_types` */

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_types` */

insert  into `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) values 
(1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2022-07-12 13:59:05','2022-07-12 13:59:05'),
(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2022-07-12 13:59:06','2022-07-12 13:59:06'),
(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2022-07-12 13:59:06','2022-07-12 13:59:06'),
(6,'heroes','heroes','Hero','Heroes',NULL,'App\\Models\\Hero',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2022-07-12 15:54:32','2022-07-12 15:54:32'),
(7,'weapons','weapons','Weapon','Weapons',NULL,'App\\Models\\Weapon',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-07-12 15:56:54','2022-07-13 00:52:52'),
(10,'hero_weapons','hero-weapons','Hero Weapon','Hero Weapons',NULL,'App\\Models\\HeroWeapon',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2022-07-13 01:03:59','2022-07-13 01:03:59');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `hero_weapons` */

DROP TABLE IF EXISTS `hero_weapons`;

CREATE TABLE `hero_weapons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hero_id` bigint(20) unsigned NOT NULL,
  `weapon_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hero_id` (`hero_id`,`weapon_id`),
  KEY `weapon_id` (`weapon_id`),
  CONSTRAINT `hero_weapons_ibfk_1` FOREIGN KEY (`hero_id`) REFERENCES `heroes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hero_weapons_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hero_weapons` */

insert  into `hero_weapons`(`id`,`hero_id`,`weapon_id`,`created_at`,`updated_at`) values 
(1,1,3,'2022-07-13 01:04:21','2022-07-13 01:04:21'),
(2,1,5,'2022-07-13 01:04:30','2022-07-13 01:04:30'),
(3,3,1,'2022-07-13 01:04:39','2022-07-13 01:04:39'),
(4,5,10,'2022-07-13 01:04:51','2022-07-13 01:04:51'),
(5,2,3,'2022-07-13 01:05:00','2022-07-13 01:05:00'),
(6,4,5,'2022-07-13 01:05:08','2022-07-13 01:05:08'),
(7,4,6,'2022-07-13 01:05:16','2022-07-13 01:05:16'),
(8,5,7,'2022-07-13 01:05:36','2022-07-13 01:05:36'),
(9,1,2,'2022-07-13 01:05:48','2022-07-13 01:05:48');

/*Table structure for table `heroes` */

DROP TABLE IF EXISTS `heroes`;

CREATE TABLE `heroes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `health` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `heroes` */

insert  into `heroes`(`id`,`name`,`health`,`created_at`,`updated_at`) values 
(1,'Sven',3000,'2022-07-12 16:29:55','2022-07-12 16:29:55'),
(2,'Davion',2600,'2022-07-12 16:30:11','2022-07-12 16:30:11'),
(3,'Slark',2000,'2022-07-12 16:30:34','2022-07-12 16:30:34'),
(4,'Motred',22000,'2022-07-12 16:30:51','2022-07-12 16:30:51'),
(5,'Magnataur',2700,'2022-07-12 16:31:11','2022-07-12 16:31:11');

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `menu_items` */

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_items` */

insert  into `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) values 
(1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2022-07-12 13:59:09','2022-07-12 13:59:09','voyager.dashboard',NULL),
(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2022-07-12 13:59:09','2022-07-12 13:59:09','voyager.media.index',NULL),
(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2022-07-12 13:59:10','2022-07-12 13:59:10','voyager.users.index',NULL),
(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2022-07-12 13:59:10','2022-07-12 13:59:10','voyager.roles.index',NULL),
(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2022-07-12 13:59:10','2022-07-12 13:59:10',NULL,NULL),
(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2022-07-12 13:59:10','2022-07-12 13:59:10','voyager.menus.index',NULL),
(7,1,'Database','','_self','voyager-data',NULL,5,11,'2022-07-12 13:59:10','2022-07-12 13:59:10','voyager.database.index',NULL),
(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2022-07-12 13:59:10','2022-07-12 13:59:10','voyager.compass.index',NULL),
(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2022-07-12 13:59:10','2022-07-12 13:59:10','voyager.bread.index',NULL),
(10,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2022-07-12 13:59:10','2022-07-12 13:59:10','voyager.settings.index',NULL),
(11,1,'Heroes','','_self',NULL,NULL,NULL,15,'2022-07-12 15:54:32','2022-07-12 15:54:32','voyager.heroes.index',NULL),
(12,1,'Weapons','','_self',NULL,NULL,NULL,16,'2022-07-12 15:56:54','2022-07-12 15:56:54','voyager.weapons.index',NULL),
(13,1,'Hero Weapons','','_self',NULL,NULL,NULL,17,'2022-07-13 01:04:00','2022-07-13 01:04:00','voyager.hero-weapons.index',NULL);

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'admin','2022-07-12 13:59:09','2022-07-12 13:59:09');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(6,'2016_01_01_000000_add_voyager_user_fields',2),
(7,'2016_01_01_000000_create_data_types_table',2),
(8,'2016_05_19_173453_create_menu_table',2),
(9,'2016_10_21_190000_create_roles_table',2),
(10,'2016_10_21_190000_create_settings_table',2),
(11,'2016_11_30_135954_create_permission_table',2),
(12,'2016_11_30_141208_create_permission_role_table',2),
(13,'2016_12_26_201236_data_types__add__server_side',2),
(14,'2017_01_13_000000_add_route_to_menu_items_table',2),
(15,'2017_01_14_005015_create_translations_table',2),
(16,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',2),
(17,'2017_03_06_000000_add_controller_to_data_types_table',2),
(18,'2017_04_21_000000_add_order_to_data_rows_table',2),
(19,'2017_07_05_210000_add_policyname_to_data_types_table',2),
(20,'2017_08_05_000000_add_group_to_settings_table',2),
(21,'2017_11_26_013050_add_user_role_relationship',2),
(22,'2017_11_26_015000_create_user_roles_table',2),
(23,'2018_03_11_000000_add_user_settings',2),
(24,'2018_03_14_000000_add_details_to_data_types_table',2),
(25,'2018_03_16_000000_make_settings_value_nullable',2),
(26,'2022_07_12_142200_create_heroes_table',3),
(27,'2022_07_12_142249_create_weapons_table',3),
(28,'2022_07_12_143048_create_hero_weapons_table',3),
(29,'2022_07_13_012721_create_jobs_table',4);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`permission_id`,`role_id`) values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) values 
(1,'browse_admin',NULL,'2022-07-12 13:59:11','2022-07-12 13:59:11'),
(2,'browse_bread',NULL,'2022-07-12 13:59:11','2022-07-12 13:59:11'),
(3,'browse_database',NULL,'2022-07-12 13:59:11','2022-07-12 13:59:11'),
(4,'browse_media',NULL,'2022-07-12 13:59:11','2022-07-12 13:59:11'),
(5,'browse_compass',NULL,'2022-07-12 13:59:11','2022-07-12 13:59:11'),
(6,'browse_menus','menus','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(7,'read_menus','menus','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(8,'edit_menus','menus','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(9,'add_menus','menus','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(10,'delete_menus','menus','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(11,'browse_roles','roles','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(12,'read_roles','roles','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(13,'edit_roles','roles','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(14,'add_roles','roles','2022-07-12 13:59:11','2022-07-12 13:59:11'),
(15,'delete_roles','roles','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(16,'browse_users','users','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(17,'read_users','users','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(18,'edit_users','users','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(19,'add_users','users','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(20,'delete_users','users','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(21,'browse_settings','settings','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(22,'read_settings','settings','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(23,'edit_settings','settings','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(24,'add_settings','settings','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(25,'delete_settings','settings','2022-07-12 13:59:12','2022-07-12 13:59:12'),
(26,'browse_heroes','heroes','2022-07-12 15:54:32','2022-07-12 15:54:32'),
(27,'read_heroes','heroes','2022-07-12 15:54:32','2022-07-12 15:54:32'),
(28,'edit_heroes','heroes','2022-07-12 15:54:32','2022-07-12 15:54:32'),
(29,'add_heroes','heroes','2022-07-12 15:54:32','2022-07-12 15:54:32'),
(30,'delete_heroes','heroes','2022-07-12 15:54:32','2022-07-12 15:54:32'),
(31,'browse_weapons','weapons','2022-07-12 15:56:54','2022-07-12 15:56:54'),
(32,'read_weapons','weapons','2022-07-12 15:56:54','2022-07-12 15:56:54'),
(33,'edit_weapons','weapons','2022-07-12 15:56:54','2022-07-12 15:56:54'),
(34,'add_weapons','weapons','2022-07-12 15:56:54','2022-07-12 15:56:54'),
(35,'delete_weapons','weapons','2022-07-12 15:56:54','2022-07-12 15:56:54'),
(36,'browse_hero_weapons','hero_weapons','2022-07-13 01:03:59','2022-07-13 01:03:59'),
(37,'read_hero_weapons','hero_weapons','2022-07-13 01:03:59','2022-07-13 01:03:59'),
(38,'edit_hero_weapons','hero_weapons','2022-07-13 01:03:59','2022-07-13 01:03:59'),
(39,'add_hero_weapons','hero_weapons','2022-07-13 01:03:59','2022-07-13 01:03:59'),
(40,'delete_hero_weapons','hero_weapons','2022-07-13 01:03:59','2022-07-13 01:03:59');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) values 
(1,'admin','Administrator','2022-07-12 13:59:10','2022-07-12 13:59:10'),
(2,'user','Normal User','2022-07-12 13:59:10','2022-07-12 13:59:10');

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) values 
(1,'site.title','Site Title','Site Title','','text',1,'Site'),
(2,'site.description','Site Description','Site Description','','text',2,'Site'),
(3,'site.logo','Site Logo','','','image',3,'Site'),
(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),
(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),
(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),
(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),
(8,'admin.loader','Admin Loader','','','image',3,'Admin'),
(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),
(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');

/*Table structure for table `translations` */

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `translations` */

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_roles` */

insert  into `user_roles`(`user_id`,`role_id`) values 
(1,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role_id`,`name`,`email`,`avatar`,`email_verified_at`,`password`,`remember_token`,`settings`,`created_at`,`updated_at`) values 
(1,NULL,'admin','admin@admin.com','users/default.png',NULL,'$2y$10$dWU8qO.Gjfubd/WcNd2ssOJwYbu4P6o9iU6JNged/VNdzZZ1OaISm',NULL,'{\"locale\":\"en\"}','2022-07-12 07:50:01','2022-07-12 16:19:01');

/*Table structure for table `weapons` */

DROP TABLE IF EXISTS `weapons`;

CREATE TABLE `weapons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `damage` int(11) NOT NULL,
  `is_range` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `weapons` */

insert  into `weapons`(`id`,`name`,`damage`,`is_range`,`created_at`,`updated_at`) values 
(1,'Black King bar',60,0,'2022-07-13 00:53:38','2022-07-13 00:53:38'),
(2,'Monkey King bar',40,1,'2022-07-13 00:54:54','2022-07-13 00:54:54'),
(3,'Dagon',700,1,'2022-07-13 00:55:11','2022-07-13 00:55:11'),
(4,'Military Hammer',40,0,'2022-07-13 00:55:34','2022-07-13 00:55:34'),
(5,'Broadsword',20,1,'2022-07-13 00:55:53','2022-07-13 00:55:53'),
(6,'Claymore',30,1,'2022-07-13 00:56:09','2022-07-13 00:56:09'),
(7,'Shadow Armulet',37,1,'2022-07-13 00:56:31','2022-07-13 00:56:31'),
(8,'Hyperstone',15,1,'2022-07-13 00:57:03','2022-07-13 00:57:03'),
(9,'Bloodstone',40,0,'2022-07-13 00:57:27','2022-07-13 00:57:27'),
(10,'Septer',50,1,'2022-07-13 00:58:23','2022-07-13 00:58:23');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
