
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vtcs`
--
CREATE DATABASE IF NOT EXISTS `vtcs` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `vtcs`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE `auth_groups_users` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES
(1, 1, 'superadmin', '2024-01-18 01:11:10'),
(4, 4, 'superadmin', '2024-02-01 01:39:59');

-- --------------------------------------------------------

--
-- Table structure for table `auth_identities`
--

DROP TABLE IF EXISTS `auth_identities`;
CREATE TABLE `auth_identities` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `secret` varchar(255) NOT NULL,
  `secret2` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text,
  `force_reset` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_identities`
--

INSERT INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'email_password', NULL, 'suheel@athamneh.info', '$2y$12$7myA5DyphG4wUJ6qsPugf.l4Tc13yMM/o1UdTZaqmnfdL0f0ibuRm', NULL, NULL, 0, '2024-01-23 13:12:15', '2024-01-18 01:11:10', '2024-01-23 13:12:15'),
(9, 4, 'email_password', NULL, 'admin@cocare.com', '$2y$12$6UCXMr3JpUt/2MXsG4IAXe81IzcR5zhIz0dQ7K/aIu/At1yUgjKgq', NULL, NULL, 0, NULL, '2024-02-01 01:39:59', '2024-02-01 01:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE `auth_logins` (
  `id` int UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES
(1, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-18 01:15:12', 1),
(2, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-18 03:18:42', 1),
(3, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-18 14:22:39', 1),
(4, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-19 13:26:44', 1),
(5, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-19 19:00:43', 1),
(6, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-22 20:55:58', 1),
(7, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-23 02:05:40', 1),
(8, '136.226.73.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'magic-link', 'a3bd5d0ce7f36771d349', NULL, '2024-01-23 03:33:22', 0),
(9, '136.226.73.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'magic-link', 'd717f43fdadb6529ecef', NULL, '2024-01-23 03:33:55', 0),
(10, '136.226.73.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'magic-link', 'a3bd5d0ce7f36771d349', NULL, '2024-01-23 03:34:41', 0),
(11, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'email_password', 'suheel@athamneh.info', 1, '2024-01-23 13:12:15', 1),
(12, '108.49.176.85', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'magic-link', '8ce8c11b584da785453b', 2, '2024-01-23 14:23:10', 1),
(13, '73.167.98.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'magic-link', '9d0bcc72850b45e12e5e', 1, '2024-01-23 14:48:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions_users`
--

DROP TABLE IF EXISTS `auth_permissions_users`;
CREATE TABLE `auth_permissions_users` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `permission` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_remember_tokens`
--

DROP TABLE IF EXISTS `auth_remember_tokens`;
CREATE TABLE `auth_remember_tokens` (
  `id` int UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_token_logins`
--

DROP TABLE IF EXISTS `auth_token_logins`;
CREATE TABLE `auth_token_logins` (
  `id` int UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `meta_info`
--

DROP TABLE IF EXISTS `meta_info`;
CREATE TABLE `meta_info` (
  `id` int UNSIGNED NOT NULL,
  `resource_id` int UNSIGNED NOT NULL,
  `class` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1705540250, 1),
(2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1705540250, 1),
(3, '2021-09-04-044800', 'App\\Database\\Migrations\\AdditionalUserFields', 'default', 'Bonfire\\{Users}', 1705540250, 1),
(4, '2021-10-05-040656', 'App\\Database\\Migrations\\CreateMetaTable', 'default', 'Bonfire\\{Users}', 1705540250, 1),
(5, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1705540250, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int NOT NULL,
  `class` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  `type` varchar(31) NOT NULL DEFAULT 'string',
  `context` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `class`, `key`, `value`, `type`, `context`, `created_at`, `updated_at`) VALUES
(1, 'Config\\Email', 'fromName', 'Co-Care', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(2, 'Config\\Email', 'fromEmail', 'vtcs-noreply@vtcs.shams.technology', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(3, 'Config\\Email', 'protocol', 'smtp', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(4, 'Config\\Email', 'mailPath', '/usr/sbin/sendmail', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(5, 'Config\\Email', 'SMTPHost', 'smtp.gmail.com', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(6, 'Config\\Email', 'SMTPPort', '587', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(7, 'Config\\Email', 'SMTPUser', 'vtcs@athamneh.info', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(8, 'Config\\Email', 'SMTPPass', '	 Peace@123%%', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(9, 'Config\\Email', 'SMTPCrypto', 'tls', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(10, 'Config\\Email', 'SMTPTimeout', '5', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(11, 'Config\\Email', 'SMTPKeepAlive', '0', 'string', NULL, '2024-01-18 01:34:31', '2024-01-18 01:34:31'),
(12, 'Config\\Site', 'siteName', 'vtcs', 'string', NULL, '2024-01-18 01:35:41', '2024-01-18 01:35:41'),
(13, 'Config\\Site', 'siteOnline', '1', 'string', NULL, '2024-01-18 01:35:41', '2024-01-18 01:35:41'),
(14, 'Config\\App', 'appTimezone', 'America/New_York', 'string', NULL, '2024-01-18 01:35:41', '2024-01-18 01:35:41'),
(15, 'Config\\App', 'dateFormat', 'm/d/Y', 'string', NULL, '2024-01-18 01:35:41', '2024-01-18 01:35:41'),
(16, 'Config\\App', 'timeFormat', 'g:i A', 'string', NULL, '2024-01-18 01:35:41', '2024-01-18 01:35:41'),
(17, 'Bonfire\\Widgets\\Config\\PolarAreaChart', 'polarArea_showTitle', 'on', 'string', NULL, '2024-01-18 01:36:25', '2024-01-18 01:36:25'),
(18, 'Bonfire\\Widgets\\Config\\PolarAreaChart', 'polarArea_showLegend', 'on', 'string', NULL, '2024-01-18 01:36:25', '2024-01-18 01:36:25'),
(19, 'Bonfire\\Widgets\\Config\\PolarAreaChart', 'polarArea_legendPosition', 'bottom', 'string', NULL, '2024-01-18 01:36:25', '2024-01-18 01:36:25'),
(20, 'Bonfire\\Widgets\\Config\\PolarAreaChart', 'polarArea_enableAnimation', 'on', 'string', NULL, '2024-01-18 01:36:25', '2024-01-18 01:36:25'),
(21, 'Bonfire\\Widgets\\Config\\PolarAreaChart', 'polarArea_colorScheme', 'null', 'string', NULL, '2024-01-18 01:36:25', '2024-01-18 01:36:25'),
(22, 'Bonfire\\Widgets\\Config\\Stats', 'Stats_0', 'on', 'string', NULL, '2024-01-18 01:36:32', '2024-01-18 01:36:32'),
(23, 'Bonfire\\Widgets\\Config\\Stats', 'Charts_0', 'on', 'string', NULL, '2024-01-18 01:36:32', '2024-01-18 01:36:32'),
(24, 'Bonfire\\Widgets\\Config\\Stats', 'Charts_1', 'on', 'string', NULL, '2024-01-18 01:36:32', '2024-01-18 01:36:32'),
(25, 'Bonfire\\Widgets\\Config\\Stats', 'Charts_2', 'on', 'string', NULL, '2024-01-18 01:36:32', '2024-01-18 01:36:32'),
(26, 'Bonfire\\Widgets\\Config\\Stats', 'Charts_3', 'on', 'string', NULL, '2024-01-18 01:36:32', '2024-01-18 01:36:32'),
(27, 'Bonfire\\Widgets\\Config\\Stats', 'Charts_4', 'on', 'string', NULL, '2024-01-18 01:36:32', '2024-01-18 01:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `avatar`, `status`, `status_message`, `active`, `last_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sa', 'Suheel', 'Athamneh', NULL, NULL, NULL, 1, '2024-01-23 17:54:16', '2024-01-18 01:11:10', '2024-01-18 01:11:10', NULL),
(4, 'cocare', 'CoCare', 'Admin', NULL, NULL, NULL, 1, NULL, '2024-02-01 01:39:59', '2024-02-01 01:39:59', NULL);
-- --------------------------------------------------------

--
-- Table structure for table `vtcs_answers`
--

DROP TABLE IF EXISTS `vtcs_answers`;
CREATE TABLE `vtcs_answers` (
  `answer_id` int NOT NULL,
  `assessment_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `answer_value` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `saved_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_answers`
--

INSERT INTO `vtcs_answers` (`answer_id`, `assessment_id`, `question_id`, `patient_id`, `answer_value`, `created_at`, `updated_at`, `deleted_at`, `saved_by`) VALUES
(158, 25, 1, 1, 'true', '2023-10-12 20:03:59', '2023-10-12 20:03:59', NULL, 1),
(159, 25, 2, 1, 'test', '2023-10-12 20:03:59', '2023-10-12 20:03:59', NULL, 1),
(160, 25, 3, 1, '3', '2023-10-12 20:03:59', '2023-10-12 20:03:59', NULL, 1),
(161, 26, 1, 1, 'true', '2023-10-12 20:33:27', '2023-10-12 20:33:27', NULL, 1),
(162, 26, 2, 1, 'whatever', '2023-10-12 20:33:27', '2023-10-12 20:33:27', NULL, 1),
(163, 26, 3, 1, '3', '2023-10-12 20:33:27', '2023-10-12 20:33:27', NULL, 1),
(164, 27, 4, 1, 'true', '2023-10-12 20:34:22', '2023-10-12 20:34:22', NULL, 1),
(165, 27, 5, 1, 'false', '2023-10-12 20:34:22', '2023-10-12 20:34:22', NULL, 1),
(166, 27, 6, 1, 'true', '2023-10-12 20:34:22', '2023-10-12 20:34:22', NULL, 1),
(167, 27, 7, 1, 'false', '2023-10-12 20:34:22', '2023-10-12 20:34:22', NULL, 1),
(168, 28, 24, 3, '1', '2023-10-13 13:13:36', '2023-10-13 13:13:36', NULL, 1),
(169, 28, 25, 3, '2', '2023-10-13 13:13:36', '2023-10-13 13:13:36', NULL, 1),
(170, 29, 24, 2, '1', '2023-10-13 19:42:24', '2023-10-13 19:42:24', NULL, 1),
(171, 29, 25, 2, '1', '2023-10-13 19:42:24', '2023-10-13 19:42:24', NULL, 1),
(172, 30, 24, 2, '5', '2023-10-17 19:02:19', '2023-10-17 19:02:19', NULL, 1),
(173, 30, 25, 2, '10', '2023-10-17 19:02:19', '2023-10-17 19:02:19', NULL, 1),
(175, 31, 24, 2, '5', '2023-10-17 19:15:43', '2023-10-17 19:15:43', NULL, 1),
(176, 31, 25, 2, '10', '2023-10-17 19:15:43', '2023-10-17 19:15:43', NULL, 1),
(178, 32, 24, 2, '5', '2023-10-17 19:16:18', '2023-10-17 19:16:18', NULL, 1),
(179, 32, 25, 2, '10', '2023-10-17 19:16:18', '2023-10-17 19:16:18', NULL, 1),
(181, 33, 24, 2, '5', '2023-10-17 19:39:31', '2023-10-17 19:39:31', NULL, 1),
(182, 33, 25, 2, '10', '2023-10-17 19:39:31', '2023-10-17 19:39:31', NULL, 1),
(183, 33, 26, 2, 'false', '2023-10-17 19:39:31', '2023-10-19 17:20:35', NULL, 1),
(184, 34, 24, 2, '5', '2023-10-19 17:06:45', '2023-10-19 17:06:45', NULL, 1),
(185, 34, 25, 2, '5', '2023-10-19 17:06:45', '2023-10-19 17:06:45', NULL, 1),
(186, 34, 26, 2, 'false', '2023-10-19 17:06:45', '2023-10-19 17:28:55', NULL, 1),
(187, 35, 24, 2, '1', '2023-10-19 17:20:56', '2023-10-19 17:20:56', NULL, 1),
(188, 35, 25, 2, '1', '2023-10-19 17:20:56', '2023-10-19 17:20:56', NULL, 1),
(189, 35, 26, 2, 'false', '2023-10-19 17:20:56', '2023-10-19 17:36:01', NULL, 1),
(190, 36, 24, 2, '5', '2023-10-19 17:29:11', '2023-10-19 17:29:11', NULL, 1),
(191, 36, 25, 2, '10', '2023-10-19 17:29:11', '2023-10-19 17:29:11', NULL, 1),
(192, 36, 26, 2, 'false', '2023-10-19 17:29:11', '2023-10-19 17:43:29', NULL, 1),
(193, 37, 24, 2, '5', '2023-10-19 17:36:17', '2023-10-19 17:36:17', NULL, 1),
(194, 37, 25, 2, '10', '2023-10-19 17:36:17', '2023-10-19 17:36:17', NULL, 1),
(195, 37, 26, 2, 'false', '2023-10-19 17:36:17', '2023-10-19 17:46:22', NULL, 1),
(196, 38, 24, 2, '5', '2023-10-19 17:43:42', '2023-10-19 17:43:42', NULL, 1),
(197, 38, 25, 2, '10', '2023-10-19 17:43:42', '2023-10-19 17:43:42', NULL, 1),
(198, 38, 26, 2, 'false', '2023-10-19 17:43:42', '2023-10-19 17:48:03', NULL, 1),
(199, 39, 24, 2, '5', '2023-10-19 17:46:50', '2023-10-19 17:46:50', NULL, 1),
(200, 39, 25, 2, '10', '2023-10-19 17:46:50', '2023-10-19 17:46:50', NULL, 1),
(201, 39, 26, 2, 'false', '2023-10-19 17:46:50', '2023-10-19 17:50:08', NULL, 1),
(202, 40, 24, 2, '5', '2023-10-19 17:48:21', '2023-10-19 17:48:21', NULL, 1),
(203, 40, 25, 2, '10', '2023-10-19 17:48:21', '2023-10-19 17:48:21', NULL, 1),
(204, 40, 26, 2, 'false', '2023-10-19 17:48:21', '2023-10-19 19:43:42', NULL, 1),
(205, 41, 24, 2, '5', '2023-10-19 17:50:20', '2023-10-19 17:50:20', NULL, 1),
(206, 41, 25, 2, '10', '2023-10-19 17:50:20', '2023-10-19 17:50:20', NULL, 1),
(207, 41, 26, 2, 'false', '2023-10-19 17:50:20', '2023-10-19 19:43:46', NULL, 1),
(208, 42, 24, 2, '1', '2023-10-19 19:44:01', '2023-10-19 19:44:01', NULL, 1),
(209, 42, 25, 2, '10', '2023-10-19 19:44:01', '2023-10-19 19:44:01', NULL, 1),
(210, 42, 26, 2, 'false', '2023-10-19 19:44:01', '2023-10-19 19:48:19', NULL, 1),
(211, 43, 24, 2, '1', '2023-10-19 19:44:13', '2023-10-19 19:44:13', NULL, 1),
(212, 43, 25, 2, '2', '2023-10-19 19:44:13', '2023-10-19 19:44:13', NULL, 1),
(213, 43, 26, 2, 'false', '2023-10-19 19:44:13', '2023-10-19 19:51:05', NULL, 1),
(214, 44, 24, 2, '1', '2023-10-19 19:48:32', '2023-10-19 19:48:32', NULL, 1),
(215, 44, 25, 2, '10', '2023-10-19 19:48:32', '2023-10-19 19:48:32', NULL, 1),
(216, 44, 26, 2, 'false', '2023-10-19 19:48:32', '2023-10-19 19:52:43', NULL, 1),
(217, 45, 24, 2, '1', '2023-10-19 19:52:15', '2023-10-19 19:52:15', NULL, 1),
(218, 45, 25, 2, '10', '2023-10-19 19:52:15', '2023-10-19 19:52:15', NULL, 1),
(219, 45, 26, 2, 'false', '2023-10-19 19:52:15', '2023-10-19 19:59:14', NULL, 1),
(220, 46, 24, 2, '5', '2023-10-19 19:54:46', '2023-10-19 19:54:46', NULL, 1),
(221, 46, 25, 2, '10', '2023-10-19 19:54:46', '2023-10-19 19:54:46', NULL, 1),
(222, 46, 26, 2, 'true', '2023-10-19 19:54:46', '2023-10-19 19:54:46', NULL, 1),
(223, 47, 24, 1, 'Yes', '2023-10-19 20:39:55', '2023-10-19 20:39:55', NULL, 1),
(224, 47, 25, 1, 'Yes', '2023-10-19 20:39:55', '2023-10-19 20:39:55', NULL, 1),
(225, 47, 26, 1, 'true', '2023-10-19 20:39:56', '2023-10-19 20:39:56', NULL, 1),
(226, 48, 24, 1, 'Yes', '2023-10-19 20:40:17', '2023-10-19 20:40:17', NULL, 1),
(227, 48, 25, 1, 'Yes', '2023-10-19 20:40:17', '2023-10-19 20:40:17', NULL, 1),
(228, 48, 26, 1, 'true', '2023-10-19 20:40:17', '2023-10-19 20:40:17', NULL, 1),
(229, 49, 24, 1, 'none', '2023-10-22 23:48:10', '2023-10-22 23:48:10', NULL, 4),
(230, 49, 25, 1, 'none', '2023-10-22 23:48:10', '2023-10-22 23:48:10', NULL, 4),
(231, 49, 26, 1, 'true', '2023-10-22 23:48:10', '2023-10-22 23:48:10', NULL, 4),
(232, 50, 24, 2, '5', '2023-11-14 19:34:11', '2023-11-14 19:34:11', NULL, 1),
(233, 50, 25, 2, '1', '2023-11-14 19:34:11', '2023-11-14 19:34:11', NULL, 1),
(234, 50, 26, 2, 'true', '2023-11-14 19:34:11', '2023-11-14 19:34:11', NULL, 1),
(235, 51, 24, 1, '1', '2024-01-11 13:24:56', '2024-01-11 13:24:56', NULL, 1),
(236, 51, 25, 1, '1', '2024-01-11 13:24:56', '2024-01-11 13:24:56', NULL, 1),
(237, 51, 26, 1, 'true', '2024-01-11 13:24:56', '2024-01-11 13:24:56', NULL, 1),
(238, 52, 24, 1, '5', '2024-01-11 15:12:59', '2024-01-11 15:12:59', NULL, 1),
(239, 52, 25, 1, '10', '2024-01-11 15:12:59', '2024-01-11 15:12:59', NULL, 1),
(240, 52, 26, 1, 'true', '2024-01-11 15:12:59', '2024-01-11 15:12:59', NULL, 1),
(241, 53, 24, 1, '1', '2024-01-11 15:13:39', '2024-01-11 15:13:39', NULL, 1),
(242, 53, 25, 1, '10', '2024-01-11 15:13:39', '2024-01-11 15:13:39', NULL, 1),
(243, 53, 26, 1, 'true', '2024-01-11 15:13:39', '2024-01-11 15:13:39', NULL, 1),
(244, 54, 1, 1, 'true', '2024-01-12 13:56:14', '2024-01-12 13:56:14', NULL, 3),
(245, 54, 2, 1, 'none', '2024-01-12 13:56:14', '2024-01-12 13:56:14', NULL, 3),
(246, 54, 3, 1, '0', '2024-01-12 13:56:14', '2024-01-12 13:56:14', NULL, 3),
(247, 55, 1, 1, 'true', '2024-01-12 20:19:06', '2024-01-12 20:19:06', NULL, 1),
(248, 55, 2, 1, 'none', '2024-01-12 20:19:06', '2024-01-12 20:19:06', NULL, 1),
(249, 55, 3, 1, '3', '2024-01-12 20:19:06', '2024-01-12 20:19:06', NULL, 1),
(250, 56, 1, 1, 'true', '2024-01-12 20:27:38', '2024-01-12 20:27:38', NULL, 1),
(251, 56, 2, 1, 'test', '2024-01-12 20:27:38', '2024-01-12 20:27:38', NULL, 1),
(252, 56, 3, 1, '1', '2024-01-12 20:27:38', '2024-01-12 20:27:38', NULL, 1),
(253, 57, 1, 1, 'true', '2024-01-12 20:28:29', '2024-01-12 20:28:29', NULL, 1),
(254, 57, 2, 1, 'test', '2024-01-12 20:28:29', '2024-01-12 20:28:29', NULL, 1),
(255, 57, 3, 1, '1', '2024-01-12 20:28:29', '2024-01-12 20:28:29', NULL, 1),
(256, 58, 1, 1, 'false', '2024-01-15 13:31:27', '2024-01-15 13:31:27', NULL, 1),
(257, 58, 2, 1, 'test', '2024-01-15 13:31:27', '2024-01-15 13:31:27', NULL, 1),
(258, 58, 3, 1, '1', '2024-01-15 13:31:27', '2024-01-15 13:31:27', NULL, 1),
(259, 59, 1, 1, 'true', '2024-01-15 13:50:35', '2024-01-15 13:50:35', NULL, 3),
(260, 59, 2, 1, 'ecnounter #1 with registry', '2024-01-15 13:50:35', '2024-01-15 13:50:35', NULL, 3),
(261, 59, 3, 1, '0', '2024-01-15 13:50:35', '2024-01-15 13:50:35', NULL, 3),
(262, 60, 8, 1, '0', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(263, 60, 9, 1, '2', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(264, 60, 10, 1, '2', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(265, 60, 11, 1, '2', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(266, 60, 12, 1, '2', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(267, 60, 13, 1, '2', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(268, 60, 14, 1, '2', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(269, 60, 15, 1, '1', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(270, 60, 16, 1, '2', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1),
(271, 67, 8, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(272, 67, 9, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(273, 67, 10, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(274, 67, 11, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(275, 67, 12, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(276, 67, 13, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(277, 67, 14, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(278, 67, 15, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(279, 67, 16, 5, '2', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1),
(280, 68, 8, 5, '3', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(281, 68, 9, 5, '2', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(282, 68, 10, 5, '2', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(283, 68, 11, 5, '2', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(284, 68, 12, 5, '3', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(285, 68, 13, 5, '2', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(286, 68, 14, 5, '3', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(287, 68, 15, 5, '2', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(288, 68, 16, 5, '3', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1),
(289, 69, 8, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(290, 69, 9, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(291, 69, 10, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(292, 69, 11, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(293, 69, 12, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(294, 69, 13, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(295, 69, 14, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(296, 69, 15, 5, '0', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1),
(297, 69, 16, 5, '3', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_appointments`
--

DROP TABLE IF EXISTS `vtcs_appointments`;
CREATE TABLE `vtcs_appointments` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` enum('Scheduled','Completed','Missed','Cancelled','Rescheduled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_appointments`
--

INSERT INTO `vtcs_appointments` (`id`, `patient_id`, `appointment_date`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-01-26 11:00:00', 'Completed', 'Optional notes', '2024-01-18 07:20:49', '2024-01-18 09:44:38'),
(2, 3, '2024-01-23 16:00:00', 'Completed', 'Optional notes', '2024-01-18 07:27:08', '2024-01-23 13:37:43'),
(3, 6, '2024-01-02 12:00:00', 'Scheduled', 'Optional notes', '2024-01-18 07:29:28', '2024-01-19 20:22:28'),
(4, 5, '2024-01-10 14:00:00', 'Scheduled', 'Optional notes', '2024-01-18 07:34:28', '2024-01-18 07:48:29'),
(5, 4, '2024-02-16 12:00:00', 'Scheduled', 'rrr', '2024-01-18 08:00:39', '2024-01-18 08:00:39'),
(6, 1, '2024-01-01 09:42:28', 'Missed', NULL, '2024-01-18 09:42:57', '2024-01-18 09:54:56'),
(7, 1, '2024-03-21 12:00:00', 'Completed', 'Nope', '2024-01-18 09:53:56', '2024-01-18 15:44:49'),
(8, 5, '2024-03-13 10:00:00', 'Completed', 'March appt.', '2024-01-18 11:12:51', '2024-01-19 13:33:44'),
(9, 7, '2024-04-30 17:00:00', 'Rescheduled', 'April', '2024-01-18 11:13:23', '2024-01-19 13:31:53'),
(10, 12, '2024-05-22 11:00:00', 'Scheduled', 'May', '2024-01-18 14:30:42', '2024-01-18 14:30:42'),
(11, 2, '2024-01-18 10:00:00', 'Scheduled', 'Hello', '2024-01-18 15:45:36', '2024-01-18 15:45:36'),
(12, 2, '2024-02-22 13:00:00', 'Scheduled', 'test', '2024-01-18 15:49:46', '2024-01-18 15:49:46'),
(13, 8, '2024-01-18 12:00:00', 'Completed', 'test', '2024-01-18 15:51:57', '2024-01-19 13:33:33'),
(15, 13, '2024-01-17 15:00:00', 'Scheduled', 'test', '2024-01-18 16:14:37', '2024-01-19 20:20:48'),
(16, 8, '2024-01-19 15:00:00', 'Scheduled', 'testing', '2024-01-19 13:32:24', '2024-01-19 13:34:15'),
(17, 9, '2024-01-31 15:00:00', 'Scheduled', 'test', '2024-01-19 13:39:20', '2024-01-19 13:39:20'),
(18, 10, '2024-01-31 14:00:00', 'Scheduled', 'something', '2024-01-19 19:23:55', '2024-01-19 19:23:55'),
(19, 15, '2024-01-20 15:00:00', 'Scheduled', '', '2024-01-19 19:35:11', '2024-01-19 19:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_assessments`
--

DROP TABLE IF EXISTS `vtcs_assessments`;
CREATE TABLE `vtcs_assessments` (
  `assessment_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `assessment_type_id` int DEFAULT NULL,
  `assessment_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `added_by` int UNSIGNED DEFAULT NULL,
  `encounter_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_assessments`
--

INSERT INTO `vtcs_assessments` (`assessment_id`, `patient_id`, `assessment_type_id`, `assessment_date`, `created_at`, `updated_at`, `deleted_at`, `added_by`, `encounter_id`) VALUES
(25, 1, 1, '2023-10-12 20:03:59', '2023-10-12 20:03:59', '2023-10-12 20:03:59', NULL, 1, NULL),
(26, 1, 1, '2023-10-12 20:33:27', '2023-10-12 20:33:27', '2023-10-12 20:33:27', NULL, 1, NULL),
(27, 1, 4, '2023-10-12 20:34:22', '2023-10-12 20:34:22', '2023-10-12 20:34:22', NULL, 1, NULL),
(28, 3, 7, '2023-10-13 13:13:36', '2023-10-13 13:13:36', '2023-10-13 13:13:36', NULL, 1, NULL),
(29, 2, 7, '2023-10-13 19:42:24', '2023-10-13 19:42:24', '2023-10-13 19:42:24', NULL, 1, NULL),
(30, 2, 7, '2023-10-17 19:02:19', '2023-10-17 19:02:19', '2023-10-17 19:02:19', NULL, 1, NULL),
(31, 2, 7, '2023-10-17 19:15:43', '2023-10-17 19:15:43', '2023-10-17 19:15:43', NULL, 1, NULL),
(32, 2, 7, '2023-10-17 19:16:18', '2023-10-17 19:16:18', '2023-10-17 19:16:18', NULL, 1, NULL),
(33, 2, 7, '2023-10-17 19:39:31', '2023-10-17 19:39:31', '2023-10-17 19:39:31', NULL, 1, NULL),
(34, 2, 7, '2023-10-19 17:06:45', '2023-10-19 17:06:45', '2023-10-19 17:06:45', NULL, 1, NULL),
(35, 2, 7, '2023-10-19 17:20:56', '2023-10-19 17:20:56', '2023-10-19 17:20:56', NULL, 1, NULL),
(36, 2, 7, '2023-10-19 17:29:11', '2023-10-19 17:29:11', '2023-10-19 17:29:11', NULL, 1, NULL),
(37, 2, 7, '2023-10-19 17:36:17', '2023-10-19 17:36:17', '2023-10-19 17:36:17', NULL, 1, NULL),
(38, 2, 7, '2023-10-19 17:43:42', '2023-10-19 17:43:42', '2023-10-19 17:43:42', NULL, 1, NULL),
(39, 2, 7, '2023-10-19 17:46:50', '2023-10-19 17:46:50', '2023-10-19 17:46:50', NULL, 1, NULL),
(40, 2, 7, '2023-10-19 17:48:21', '2023-10-19 17:48:21', '2023-10-19 17:48:21', NULL, 1, NULL),
(41, 2, 7, '2023-10-19 17:50:20', '2023-10-19 17:50:20', '2023-10-19 17:50:20', NULL, 1, NULL),
(42, 2, 7, '2023-10-19 19:44:01', '2023-10-19 19:44:01', '2023-10-19 19:44:01', NULL, 1, NULL),
(43, 2, 7, '2023-10-19 19:44:13', '2023-10-19 19:44:13', '2023-10-19 19:44:13', NULL, 1, NULL),
(44, 2, 7, '2023-10-19 19:48:32', '2023-10-19 19:48:32', '2023-10-19 19:48:32', NULL, 1, NULL),
(45, 2, 7, '2023-10-19 19:52:15', '2023-10-19 19:52:15', '2023-10-19 19:52:15', NULL, 1, NULL),
(46, 2, 7, '2023-10-19 19:54:46', '2023-10-19 19:54:46', '2023-10-19 19:54:46', NULL, 1, NULL),
(47, 1, 7, '2023-10-19 20:39:55', '2023-10-19 20:39:55', '2023-10-19 20:39:55', NULL, 1, NULL),
(48, 1, 7, '2023-10-19 20:40:17', '2023-10-19 20:40:17', '2023-10-19 20:40:17', NULL, 1, NULL),
(49, 1, 7, '2023-10-22 23:48:10', '2023-10-22 23:48:10', '2024-01-18 13:53:11', NULL, 1, NULL),
(50, 2, 7, '2023-11-14 19:34:11', '2023-11-14 19:34:11', '2023-11-14 19:34:11', NULL, 1, NULL),
(51, 1, 7, '2024-01-11 13:24:56', '2024-01-11 13:24:56', '2024-01-11 13:24:56', NULL, 1, NULL),
(52, 1, 7, '2024-01-11 15:12:59', '2024-01-11 15:12:59', '2024-01-11 15:12:59', NULL, 1, NULL),
(53, 1, 7, '2024-01-11 15:13:39', '2024-01-11 15:13:39', '2024-01-11 15:13:39', NULL, 1, NULL),
(54, 1, 1, '2024-01-12 13:56:14', '2024-01-12 13:56:14', '2024-01-18 13:53:15', NULL, 1, NULL),
(55, 1, 1, '2024-01-12 20:19:06', '2024-01-12 20:19:06', '2024-01-12 20:19:06', NULL, 1, NULL),
(56, 1, 1, '2024-01-12 20:27:38', '2024-01-12 20:27:38', '2024-01-12 20:27:38', NULL, 1, NULL),
(57, 1, 1, '2024-01-12 20:28:29', '2024-01-12 20:28:29', '2024-01-12 20:28:29', NULL, 1, NULL),
(58, 1, 1, '2024-01-15 13:31:27', '2024-01-15 13:31:27', '2024-01-15 13:31:27', NULL, 1, NULL),
(59, 1, 1, '2024-01-15 13:50:35', '2024-01-15 13:50:35', '2024-01-18 13:53:19', NULL, 1, NULL),
(60, 1, 5, '2024-01-18 17:09:13', '2024-01-18 17:09:13', '2024-01-18 17:09:13', NULL, 1, NULL),
(67, 5, 5, '2024-01-18 17:47:36', '2024-01-18 17:47:36', '2024-01-18 17:47:36', NULL, 1, 4),
(68, 5, 5, '2024-01-18 18:18:01', '2024-01-18 18:18:01', '2024-01-18 18:18:01', NULL, 1, 4),
(69, 5, 5, '2024-01-18 18:23:24', '2024-01-18 18:23:24', '2024-01-18 18:23:24', NULL, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_assessment_types`
--

DROP TABLE IF EXISTS `vtcs_assessment_types`;
CREATE TABLE `vtcs_assessment_types` (
  `assessment_type_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_assessment_types`
--

INSERT INTO `vtcs_assessment_types` (`assessment_type_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Physical Examination', 'A comprehensive physical examination and clinical assessment of the patient.', '2023-10-11 00:33:56', '2023-10-11 00:33:56', NULL),
(2, 'Mental Health Screening', 'Evaluation of a patient\'s mental health status.', '2023-10-11 00:33:56', '2023-10-11 00:33:56', NULL),
(3, 'Cardiovascular Check', 'Assessment focused on cardiovascular health and potential risks.', '2023-10-11 00:33:56', '2023-10-11 00:33:56', NULL),
(4, 'Opioid Assessment', 'Assessment related to opioid usage, withdrawal symptoms, cravings, and medication side effects.', '2023-10-11 16:18:38', '2023-10-11 16:18:38', NULL),
(5, 'PHQ9', 'Patient Health Questionnaire for Depression Severity', '2023-10-11 19:04:54', '2023-10-11 19:04:54', NULL),
(6, 'GAD-7', 'Generalized Anxiety Disorder Screener', '2023-10-11 22:57:38', '2023-10-11 22:57:38', NULL),
(7, 'UDS', 'Urine Drug Screen tests', '2023-10-13 13:09:57', '2023-10-13 13:09:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_cm_draw`
--

DROP TABLE IF EXISTS `vtcs_cm_draw`;
CREATE TABLE `vtcs_cm_draw` (
  `draw_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `prize_id` int DEFAULT NULL,
  `draw_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_cm_prizes`
--

DROP TABLE IF EXISTS `vtcs_cm_prizes`;
CREATE TABLE `vtcs_cm_prizes` (
  `prize_id` int NOT NULL,
  `prize_name` varchar(255) DEFAULT NULL,
  `quantity` tinyint NOT NULL,
  `prize_level` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_cm_prizes`
--

INSERT INTO `vtcs_cm_prizes` (`prize_id`, `prize_name`, `quantity`, `prize_level`) VALUES
(1, 'CVS GC $5', 5, NULL),
(2, 'Walgreen GC $5', 5, NULL),
(3, 'Dunkin 5$', 5, NULL),
(4, 'Starbucks 5$', 5, NULL),
(5, 'Amazon GC 5$', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_encounters`
--

DROP TABLE IF EXISTS `vtcs_encounters`;
CREATE TABLE `vtcs_encounters` (
  `id` int NOT NULL,
  `appointment_id` int NOT NULL,
  `encounter_notes` text,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_encounters`
--

INSERT INTO `vtcs_encounters` (`id`, `appointment_id`, `encounter_notes`, `completed`, `created_at`, `updated_at`) VALUES
(1, 7, NULL, 1, '2024-01-18 09:01:08', '2024-01-18 15:44:49'),
(2, 1, NULL, 1, '2023-01-01 04:16:43', '2024-01-01 04:16:43'),
(3, 2, NULL, 1, '2024-01-18 09:24:37', '2024-01-18 09:24:57'),
(4, 8, NULL, 1, '2024-01-18 17:29:51', '2024-01-19 13:33:44'),
(5, 13, '', 1, '2024-01-18 20:06:23', '2024-01-19 13:33:33');

--
-- Triggers `vtcs_encounters`
--
DROP TRIGGER IF EXISTS `update_appointment_status`;
DELIMITER $$
CREATE TRIGGER `update_appointment_status` AFTER UPDATE ON `vtcs_encounters` FOR EACH ROW BEGIN
    IF NEW.completed = 1 THEN
        UPDATE vtcs_appointments
        SET status = 'Completed'
        WHERE id = NEW.appointment_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_locations`
--

DROP TABLE IF EXISTS `vtcs_locations`;
CREATE TABLE `vtcs_locations` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_locations`
--

INSERT INTO `vtcs_locations` (`id`, `name`, `address`, `city`, `state`, `zip`, `created_at`, `updated_at`) VALUES
(1, 'East', '1001 First St', 'Cityone', 'ST', '12345', '2023-10-02 01:36:22', '2023-10-02 15:24:25'),
(2, 'West', '2002 Second Rd', 'Citytwo', 'TS', '23456', '2023-10-02 01:36:22', '2023-10-02 15:24:32'),
(3, 'North', '3003 Third Ave', 'Citythree', 'TS', '34567', '2023-10-02 01:36:22', '2023-10-02 15:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_medications`
--

DROP TABLE IF EXISTS `vtcs_medications`;
CREATE TABLE `vtcs_medications` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  `drugtest` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_medications`
--

INSERT INTO `vtcs_medications` (`id`, `name`, `category_id`, `drugtest`) VALUES
(1, 'Amoxicillin', 1, 0),
(2, 'Ibuprofen', 2, 0),
(3, 'Paracetamol', 3, 0),
(4, 'Lithium', 4, 1),
(5, 'Morphine', 2, 1),
(6, 'Buperenohine', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_medication_categories`
--

DROP TABLE IF EXISTS `vtcs_medication_categories`;
CREATE TABLE `vtcs_medication_categories` (
  `id` int NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_medication_categories`
--

INSERT INTO `vtcs_medication_categories` (`id`, `category_name`) VALUES
(1, 'Antibiotics'),
(2, 'Analgesics'),
(3, 'Antipyretics'),
(4, 'Mood Stabilizers');

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_patients`
--

DROP TABLE IF EXISTS `vtcs_patients`;
CREATE TABLE `vtcs_patients` (
  `id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `mrn` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `primary_location_id` int DEFAULT NULL,
  `assigned_provider_id` int DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `SSN` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive','Discharged') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_patients`
--

INSERT INTO `vtcs_patients` (`id`, `first_name`, `last_name`, `dob`, `address`, `city`, `zip`, `state`, `mrn`, `gender`, `registration_date`, `primary_location_id`, `assigned_provider_id`, `phone`, `email`, `SSN`, `photo`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'John', 'Doe', '1980-01-01', '123 Main St', 'Anytown', '12345', 'CA', '12345', 'Male', '2023-01-01', 1, 1, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:47:43', NULL),
(2, 'Jane', 'Smith', '1990-02-02', '456 Oak St', 'Somecity', '67890', 'TX', '23456', 'Female', '2023-02-02', 2, 2, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:47:51', NULL),
(3, 'Michael', 'Johnson', '1975-03-03', '789 Pine St', 'Thistown', '11223', 'FL', '34567', 'Male', '2023-03-03', 3, 3, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:47:57', NULL),
(4, 'Emily', 'White', '2000-04-04', '101 Maple St', 'Thatcity', '44556', 'NY', '45678', 'Female', '2023-04-04', 1, 4, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:48:03', NULL),
(5, 'Christopher', 'Brown', '1985-05-05', '202 Elm St', 'Othertown', '77889', 'NV', '56789', 'Male', '2023-05-05', 2, 5, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:48:10', NULL),
(6, 'Amanda', 'Martinez', '1995-06-06', '303 Birch St', 'Thattown', '99001', 'AZ', '67891', 'Female', '2023-06-06', 3, 1, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:48:21', NULL),
(7, 'Brian', 'Garcia', '1988-07-07', '404 Spruce St', 'Thiscity', '66554', 'WA', '78911', 'Male', '2023-07-07', 1, 2, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:48:30', NULL),
(8, 'Rebecca', 'Rodriguez', '1970-08-08', '505 Cedar St', 'Yettown', '33221', 'OR', '89101', 'Female', '2023-08-08', 2, 3, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:48:41', NULL),
(9, 'Brandon', 'Lee', '1998-09-09', '606 Redwood St', 'Sometown', '55443', 'CO', '910101', 'Male', '2023-09-09', 3, 4, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 19:48:49', NULL),
(10, 'Laura', 'Kim', '1992-10-10', '707 Willow St', 'Anycity', '77665', 'MT', NULL, 'Female', '2023-10-10', 1, 5, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 01:41:42', NULL),
(11, 'Matthew', 'Lewis', '1982-11-11', '808 Ash St', 'Cityville', '99882', 'UT', NULL, 'Male', '2023-11-11', 2, 1, NULL, NULL, NULL, NULL, 'Inactive', '2023-10-02 01:41:42', '2023-10-02 19:59:08', NULL),
(12, 'Heather', 'Clark', '1978-12-12', '909 Cherry St', 'Townville', '44002', 'NM', NULL, 'Female', '2023-12-12', 3, 2, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 01:41:42', NULL),
(13, 'Justin', 'Walker', '2002-01-13', '1010 Birch St', 'Villageville', '22334', 'WY', NULL, 'Male', '2023-01-13', 1, 3, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 01:41:42', NULL),
(14, 'Jessica', 'Hernandez', '1997-02-14', '1111 Pine St', 'Hamletville', '55677', 'ND', NULL, 'Female', '2023-02-14', 2, 4, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 01:41:42', NULL),
(15, 'Andrew', 'Martinez', '1972-03-15', '1212 Maple St', 'Boroughville', '99887', 'SD', NULL, 'Male', '2023-03-15', 3, 5, NULL, NULL, NULL, NULL, 'Active', '2023-10-02 01:41:42', '2023-10-02 01:41:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_prescriptions`
--

DROP TABLE IF EXISTS `vtcs_prescriptions`;
CREATE TABLE `vtcs_prescriptions` (
  `id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `medication_id` int DEFAULT NULL,
  `date_prescribed` date DEFAULT NULL,
  `added_by` int UNSIGNED DEFAULT NULL,
  `dose` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `duration` varchar(100) NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_prescriptions`
--

INSERT INTO `vtcs_prescriptions` (`id`, `patient_id`, `medication_id`, `date_prescribed`, `added_by`, `dose`, `duration`, `notes`) VALUES
(1, 1, 1, '2023-10-05', NULL, '', '', ''),
(2, 2, 4, '2023-09-20', 1, '250mg', 'twice/day', 'given 50 for two weeks.'),
(3, 3, 5, '2023-08-15', NULL, '', '', ''),
(4, 2, 6, '2023-10-16', 1, '150mL', 'once', 'administered in the clinic'),
(5, NULL, NULL, '2023-10-16', NULL, '', '', ''),
(6, NULL, NULL, '2023-10-16', NULL, '', '', ''),
(7, NULL, NULL, '2023-10-16', NULL, '', '', ''),
(8, NULL, NULL, '2023-10-16', NULL, '', '', ''),
(9, NULL, NULL, '2023-10-16', NULL, '', '', ''),
(10, 2, 1, '2023-10-16', 1, '250mb', 'twice/day', 'testing'),
(11, 2, 4, '2024-01-11', 1, '10mL', 'twice a day', 'test'),
(12, 1, 4, '2024-01-23', 1, '10mL', 'twice a day', 'Let\'s assess next visit'),
(13, 4, 3, '2024-01-23', 1, '500mg', 'every 4hours', 'test'),
(14, 4, 2, '2024-01-23', 1, '250mg', 'twice a day', '..'),
(15, 5, 6, '2024-01-23', 1, '500mg', 'twice a day', '.'),
(16, 6, 1, '2024-01-23', 1, '500mg', 'Once', '.');

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_providers`
--

DROP TABLE IF EXISTS `vtcs_providers`;
CREATE TABLE `vtcs_providers` (
  `id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `status` enum('Active','On Leave','Inactive') NOT NULL DEFAULT 'Active',
  `substitute_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_providers`
--

INSERT INTO `vtcs_providers` (`id`, `first_name`, `last_name`, `specialty`, `phone`, `email`, `office`, `status`, `substitute_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dr.', 'Alan Smith', 'General Practice', '123-456-7890', 'alan.smith@example.com', 'Office 101', 'Active', NULL, '2023-10-02 01:37:21', '2023-10-02 01:37:52', NULL),
(2, 'Dr.', 'Barbara Johnson', 'Neurology', '234-567-8901', 'barbara.johnson@example.com', 'Office 102', 'Active', NULL, '2023-10-02 01:37:21', '2023-10-02 01:37:21', NULL),
(3, 'Dr.', 'Charlie Brown', 'Orthopedics', '345-678-9012', 'charlie.brown@example.com', 'Office 103', 'On Leave', NULL, '2023-10-02 01:37:21', '2023-10-02 01:37:21', NULL),
(4, 'Dr.', 'Diana White', 'Pediatrics', '456-789-0123', 'diana.white@example.com', 'Office 104', 'Active', NULL, '2023-10-02 01:37:21', '2023-10-02 01:37:21', NULL),
(5, 'Dr.', 'Edward Lee', 'General Practice', '567-890-1234', 'edward.lee@example.com', 'Office 105', 'On Leave', 1, '2023-10-02 01:37:21', '2023-10-02 01:38:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtcs_questions`
--

DROP TABLE IF EXISTS `vtcs_questions`;
CREATE TABLE `vtcs_questions` (
  `question_id` int NOT NULL,
  `assessment_type_id` int DEFAULT NULL,
  `question_text` text,
  `question_type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `order` int DEFAULT NULL,
  `choices` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `vtcs_questions`
--

INSERT INTO `vtcs_questions` (`question_id`, `assessment_type_id`, `question_text`, `question_type`, `created_at`, `updated_at`, `deleted_at`, `order`, `choices`) VALUES
(1, 1, 'Is the patient\'s blood pressure within the normal range?', 'boolean', '2023-10-11 00:33:56', '2023-10-11 00:33:56', NULL, 1, NULL),
(2, 1, 'Describe any abnormalities in the patient\'s heartbeat.', 'text', '2023-10-11 00:33:56', '2023-10-11 00:33:56', NULL, 2, NULL),
(3, 1, 'Rate the patient\'s reflexes (1-5, with 5 being most responsive).', 'multiple_choice', '2023-10-11 00:33:56', '2023-10-12 18:56:40', NULL, 3, '[\"1-One\", \"2-Two\", \"3-Three\", \"4-Four\"]'),
(4, 4, 'Have you had any opioid withdrawal symptoms?', 'boolean', '2023-10-11 16:18:38', '2023-10-11 16:18:38', NULL, 1, NULL),
(5, 4, 'Have you had any opioid craving?', 'boolean', '2023-10-11 16:18:38', '2023-10-11 16:18:38', NULL, 2, NULL),
(6, 4, 'Have you used any illicit opioids?', 'boolean', '2023-10-11 16:18:38', '2023-10-11 16:18:38', NULL, 3, NULL),
(7, 4, 'Have you had any medication side effects?', 'boolean', '2023-10-11 16:18:38', '2023-10-11 16:18:38', NULL, 4, NULL),
(8, 5, 'Little interest or pleasure in doing things', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 1, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(9, 5, 'Feeling down, depressed, or hopeless', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 2, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(10, 5, 'Trouble falling or staying asleep, or sleeping too much', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 3, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(11, 5, 'Feeling tired or having little energy', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 4, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(12, 5, 'Poor appetite or overeating', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 5, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(13, 5, 'Feeling bad about yourself — or that you are a failure or have let yourself or your family down', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 6, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(14, 5, 'Trouble concentrating on things, such as reading the newspaper or watching television', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 7, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(15, 5, 'Moving or speaking so slowly that other people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 8, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(16, 5, 'Thoughts that you would be better off dead or of hurting yourself in some way', 'multiple_choice', '2023-10-11 19:05:53', '2023-10-11 19:05:53', NULL, 9, '[\"Not at all\", \"Several days\", \"More than half the days\", \"Nearly every day\"]'),
(17, 6, 'Feeling nervous, anxious, or on edge', 'multiple_choice', '2023-10-11 22:58:28', '2023-10-11 22:58:28', NULL, 1, '[\"Not at all\", \"Several days\", \"Over half the days\", \"Nearly every day\"]'),
(18, 6, 'Not being able to stop or control worrying', 'multiple_choice', '2023-10-11 22:58:28', '2023-10-11 22:58:28', NULL, 2, '[\"Not at all\", \"Several days\", \"Over half the days\", \"Nearly every day\"]'),
(19, 6, 'Worrying too much about different things', 'multiple_choice', '2023-10-11 22:58:28', '2023-10-11 22:58:28', NULL, 3, '[\"Not at all\", \"Several days\", \"Over half the days\", \"Nearly every day\"]'),
(20, 6, 'Trouble relaxing', 'multiple_choice', '2023-10-11 22:58:28', '2023-10-11 22:58:28', NULL, 4, '[\"Not at all\", \"Several days\", \"Over half the days\", \"Nearly every day\"]'),
(21, 6, 'Being so restless that it\'s hard to sit still', 'multiple_choice', '2023-10-11 22:58:28', '2023-10-11 22:58:28', NULL, 5, '[\"Not at all\", \"Several days\", \"Over half the days\", \"Nearly every day\"]'),
(22, 6, 'Becoming easily annoyed or irritable', 'multiple_choice', '2023-10-11 22:58:28', '2023-10-11 22:58:28', NULL, 6, '[\"Not at all\", \"Several days\", \"Over half the days\", \"Nearly every day\"]'),
(23, 6, 'Feeling afraid as if something awful might happen', 'multiple_choice', '2023-10-11 22:58:28', '2023-10-11 22:58:28', NULL, 7, '[\"Not at all\", \"Several days\", \"Over half the days\", \"Nearly every day\"]'),
(24, 7, 'Opioids', 'text', '2023-10-13 13:11:29', '2023-10-13 13:11:29', NULL, 1, NULL),
(25, 7, 'Other Substances', 'text', '2023-10-13 13:11:57', '2023-10-13 13:11:57', NULL, 2, NULL),
(26, 7, 'Is the the results expected?', 'boolean', '2023-10-16 19:45:24', '2023-10-17 19:39:08', NULL, 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `auth_identities`
--
ALTER TABLE `auth_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_secret` (`type`,`secret`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_identifier` (`id_type`,`identifier`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_permissions_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `auth_remember_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `auth_token_logins`
--
ALTER TABLE `auth_token_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_identifier` (`id_type`,`identifier`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `meta_info`
--
ALTER TABLE `meta_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vtcs_answers`
--
ALTER TABLE `vtcs_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `assessment_id` (`assessment_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `vtcs_appointments`
--
ALTER TABLE `vtcs_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `vtcs_assessments`
--
ALTER TABLE `vtcs_assessments`
  ADD PRIMARY KEY (`assessment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `assessment_type_id` (`assessment_type_id`),
  ADD KEY `FK_addedBy` (`added_by`),
  ADD KEY `encounter_id` (`encounter_id`);

--
-- Indexes for table `vtcs_assessment_types`
--
ALTER TABLE `vtcs_assessment_types`
  ADD PRIMARY KEY (`assessment_type_id`);

--
-- Indexes for table `vtcs_cm_draw`
--
ALTER TABLE `vtcs_cm_draw`
  ADD PRIMARY KEY (`draw_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `prize_id` (`prize_id`);

--
-- Indexes for table `vtcs_cm_prizes`
--
ALTER TABLE `vtcs_cm_prizes`
  ADD PRIMARY KEY (`prize_id`);

--
-- Indexes for table `vtcs_encounters`
--
ALTER TABLE `vtcs_encounters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `vtcs_locations`
--
ALTER TABLE `vtcs_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtcs_medications`
--
ALTER TABLE `vtcs_medications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `vtcs_medication_categories`
--
ALTER TABLE `vtcs_medication_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtcs_patients`
--
ALTER TABLE `vtcs_patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_primary_location` (`primary_location_id`),
  ADD KEY `fk_assigned_provider` (`assigned_provider_id`);

--
-- Indexes for table `vtcs_prescriptions`
--
ALTER TABLE `vtcs_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `medication_id` (`medication_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `vtcs_providers`
--
ALTER TABLE `vtcs_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_substitute` (`substitute_id`);

--
-- Indexes for table `vtcs_questions`
--
ALTER TABLE `vtcs_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `assessment_type_id` (`assessment_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_identities`
--
ALTER TABLE `auth_identities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_token_logins`
--
ALTER TABLE `auth_token_logins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_info`
--
ALTER TABLE `meta_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vtcs_answers`
--
ALTER TABLE `vtcs_answers`
  MODIFY `answer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `vtcs_appointments`
--
ALTER TABLE `vtcs_appointments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `vtcs_assessments`
--
ALTER TABLE `vtcs_assessments`
  MODIFY `assessment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `vtcs_assessment_types`
--
ALTER TABLE `vtcs_assessment_types`
  MODIFY `assessment_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vtcs_cm_draw`
--
ALTER TABLE `vtcs_cm_draw`
  MODIFY `draw_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vtcs_cm_prizes`
--
ALTER TABLE `vtcs_cm_prizes`
  MODIFY `prize_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vtcs_encounters`
--
ALTER TABLE `vtcs_encounters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vtcs_locations`
--
ALTER TABLE `vtcs_locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vtcs_medications`
--
ALTER TABLE `vtcs_medications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vtcs_medication_categories`
--
ALTER TABLE `vtcs_medication_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vtcs_patients`
--
ALTER TABLE `vtcs_patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vtcs_prescriptions`
--
ALTER TABLE `vtcs_prescriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `vtcs_providers`
--
ALTER TABLE `vtcs_providers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vtcs_questions`
--
ALTER TABLE `vtcs_questions`
  MODIFY `question_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_identities`
--
ALTER TABLE `auth_identities`
  ADD CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  ADD CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  ADD CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vtcs_answers`
--
ALTER TABLE `vtcs_answers`
  ADD CONSTRAINT `vtcs_answers_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `vtcs_assessments` (`assessment_id`),
  ADD CONSTRAINT `vtcs_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `vtcs_questions` (`question_id`),
  ADD CONSTRAINT `vtcs_answers_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `vtcs_patients` (`id`);

--
-- Constraints for table `vtcs_appointments`
--
ALTER TABLE `vtcs_appointments`
  ADD CONSTRAINT `vtcs_appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `vtcs_patients` (`id`);

--
-- Constraints for table `vtcs_assessments`
--
ALTER TABLE `vtcs_assessments`
  ADD CONSTRAINT `FK_addedBy` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `vtcs_assessments_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `vtcs_encounters` (`id`);

--
-- Constraints for table `vtcs_cm_draw`
--
ALTER TABLE `vtcs_cm_draw`
  ADD CONSTRAINT `vtcs_cm_draw_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `vtcs_patients` (`id`),
  ADD CONSTRAINT `vtcs_cm_draw_ibfk_2` FOREIGN KEY (`prize_id`) REFERENCES `vtcs_cm_prizes` (`prize_id`);

--
-- Constraints for table `vtcs_encounters`
--
ALTER TABLE `vtcs_encounters`
  ADD CONSTRAINT `vtcs_encounters_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `vtcs_appointments` (`id`);

--
-- Constraints for table `vtcs_medications`
--
ALTER TABLE `vtcs_medications`
  ADD CONSTRAINT `vtcs_medications_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `vtcs_medication_categories` (`id`);

--
-- Constraints for table `vtcs_patients`
--
ALTER TABLE `vtcs_patients`
  ADD CONSTRAINT `fk_assigned_provider` FOREIGN KEY (`assigned_provider_id`) REFERENCES `vtcs_providers` (`id`),
  ADD CONSTRAINT `fk_primary_location` FOREIGN KEY (`primary_location_id`) REFERENCES `vtcs_locations` (`id`);

--
-- Constraints for table `vtcs_prescriptions`
--
ALTER TABLE `vtcs_prescriptions`
  ADD CONSTRAINT `vtcs_prescriptions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `vtcs_patients` (`id`),
  ADD CONSTRAINT `vtcs_prescriptions_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `vtcs_medications` (`id`),
  ADD CONSTRAINT `vtcs_prescriptions_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `vtcs_providers`
--
ALTER TABLE `vtcs_providers`
  ADD CONSTRAINT `fk_substitute` FOREIGN KEY (`substitute_id`) REFERENCES `vtcs_providers` (`id`);

--
-- Constraints for table `vtcs_questions`
--
ALTER TABLE `vtcs_questions`
  ADD CONSTRAINT `vtcs_questions_ibfk_1` FOREIGN KEY (`assessment_type_id`) REFERENCES `vtcs_assessment_types` (`assessment_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE USER 'vtcs'@'%' IDENTIFIED BY 'dockerVTCS';
GRANT ALL PRIVILEGES ON *.* TO 'vtcs'@'%' WITH GRANT OPTION;