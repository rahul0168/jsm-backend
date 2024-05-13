-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 13, 2024 at 11:13 AM
-- Server version: 8.0.18
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

DROP TABLE IF EXISTS `job_applications`;
CREATE TABLE IF NOT EXISTS `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_applications_job_id_foreign` (`job_id`),
  KEY `job_applications_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 6, 11, '2024-05-13 05:16:42', '2024-05-13 05:16:42'),
(2, 6, 11, '2024-05-13 05:17:17', '2024-05-13 05:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_posts`
--

DROP TABLE IF EXISTS `job_posts`;
CREATE TABLE IF NOT EXISTS `job_posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_req` text COLLATE utf8mb4_unicode_ci,
  `commitment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_posts`
--

INSERT INTO `job_posts` (`id`, `user_id`, `title`, `company_name`, `company_email`, `role`, `description`, `detail_req`, `commitment`, `category`, `salary`, `location`, `created_at`, `updated_at`) VALUES
(1, '1', 'Senior PHP Develope', 'Lighterature studios', 'hr@studios.io', 'Programming', 'The ideal candidate will have experience in managing a project from start to finish. This candidate will be able to create a plan of action which will consider a fixed timeline and evaluate risks. This individual should also have experience managing people and be an effective communicator.\r\n\r\n\r\nResponsibilities\r\nCreate, design, and implement layouts for new and existing web pages.\r\nArchitect brand-new software solutions to fulfil project requirements.\r\nCreate and maintain database designs for data storage and processing.\r\nMaintain legacy code written by other developers, including bug fixes.\r\nIntegrate external software libraries and APIs into existing projects.\r\nAWS Server Architecture Management.\r\nTeam Management.\r\n\r\n\r\nQualifications\r\nExcellent knowledge programming languages (Laravel, CodeIgniter) knowledge of ( NodeJS, React, Java, jQuery, C#)\r\nExcellent knowledge of front-end web programming languages, (NextJS, JavaScript, AngularJS, HTML, CSS, with ability to render server-side and client-side content)\r\n7+ years of experience in project management or relevant fields\r\nExperience with common web development tools and services, such as version control software, package managers, and CI/CD pipelines\r\nFamiliarity with common programming design patterns and best practices\r\nExcellent written and verbal communication skills\r\nStrong attention to detail and problem-solving skills\r\nBachelor’s degree in computer science, engineering, or a related technical field\r\n\r\n\r\n\r\n\r\nJOB TIMINGS: (Evening & Night Shift) 7 pm to 3 am IST\r\nJOB TYPE: Remote (Work from Home)', 'Responsibilities\r\nCreate, design, and implement layouts for new and existing web pages.\r\nArchitect brand-new software solutions to fulfil project requirements.\r\nCreate and maintain database designs for data storage and processing.\r\nMaintain legacy code written by other developers, including bug fixes.\r\nIntegrate external software libraries and APIs into existing projects.\r\nAWS Server Architecture Management.\r\nTeam Management.\r\n\r\n\r\nQualifications\r\nExcellent knowledge programming languages (Laravel, CodeIgniter) knowledge of ( NodeJS, React, Java, jQuery, C#)\r\nExcellent knowledge of front-end web programming languages, (NextJS, JavaScript, AngularJS, HTML, CSS, with ability to render server-side and client-side content)\r\n7+ years of experience in project management or relevant fields\r\nExperience with common web development tools and services, such as version control software, package managers, and CI/CD pipelines\r\nFamiliarity with common programming design patterns and best practices\r\nExcellent written and verbal communication skills\r\nStrong attention to detail and problem-solving skills\r\nBachelor’s degree in computer science, engineering, or a related technical field', 'Part-time', NULL, NULL, 'Kerala', '2024-05-13 05:27:05', '2024-05-13 05:27:05'),
(2, '1', 'PHP Developer', 'Lighterature studios', 'hr@studios.io', 'Programming', 'The ideal candidate will have experience in managing a project from start to finish. This candidate will be able to create a plan of action which will consider a fixed timeline and evaluate risks. This individual should also have experience managing people and be an effective communicator.\r\n\r\n\r\nResponsibilities\r\nCreate, design, and implement layouts for new and existing web pages.\r\nArchitect brand-new software solutions to fulfil project requirements.\r\nCreate and maintain database designs for data storage and processing.\r\nMaintain legacy code written by other developers, including bug fixes.\r\nIntegrate external software libraries and APIs into existing projects.\r\nAWS Server Architecture Management.\r\nTeam Management.\r\n\r\n\r\nQualifications\r\nExcellent knowledge programming languages (Laravel, CodeIgniter) knowledge of ( NodeJS, React, Java, jQuery, C#)\r\nExcellent knowledge of front-end web programming languages, (NextJS, JavaScript, AngularJS, HTML, CSS, with ability to render server-side and client-side content)\r\n7+ years of experience in project management or relevant fields\r\nExperience with common web development tools and services, such as version control software, package managers, and CI/CD pipelines\r\nFamiliarity with common programming design patterns and best practices\r\nExcellent written and verbal communication skills\r\nStrong attention to detail and problem-solving skills\r\nBachelor’s degree in computer science, engineering, or a related technical field\r\n\r\n\r\n\r\n\r\nJOB TIMINGS: (Evening & Night Shift) 7 pm to 3 am IST\r\nJOB TYPE: Remote (Work from Home)', 'Responsibilities\r\nCreate, design, and implement layouts for new and existing web pages.\r\nArchitect brand-new software solutions to fulfil project requirements.\r\nCreate and maintain database designs for data storage and processing.\r\nMaintain legacy code written by other developers, including bug fixes.\r\nIntegrate external software libraries and APIs into existing projects.\r\nAWS Server Architecture Management.\r\nTeam Management.\r\n\r\n\r\nQualifications\r\nExcellent knowledge programming languages (Laravel, CodeIgniter) knowledge of ( NodeJS, React, Java, jQuery, C#)\r\nExcellent knowledge of front-end web programming languages, (NextJS, JavaScript, AngularJS, HTML, CSS, with ability to render server-side and client-side content)\r\n7+ years of experience in project management or relevant fields\r\nExperience with common web development tools and services, such as version control software, package managers, and CI/CD pipelines\r\nFamiliarity with common programming design patterns and best practices\r\nExcellent written and verbal communication skills\r\nStrong attention to detail and problem-solving skills\r\nBachelor’s degree in computer science, engineering, or a related technical field', 'Part-time', NULL, NULL, 'Kerala', '2024-05-13 05:27:05', '2024-05-13 05:27:05'),
(3, '1', '.Net Developer', 'Lighterature studios', 'hr@studios.io', 'Programming', 'The ideal candidate will have experience in managing a project from start to finish. This candidate will be able to create a plan of action which will consider a fixed timeline and evaluate risks. This individual should also have experience managing people and be an effective communicator.\r\n\r\n\r\nResponsibilities\r\nCreate, design, and implement layouts for new and existing web pages.\r\nArchitect brand-new software solutions to fulfil project requirements.\r\nCreate and maintain database designs for data storage and processing.\r\nMaintain legacy code written by other developers, including bug fixes.\r\nIntegrate external software libraries and APIs into existing projects.\r\nAWS Server Architecture Management.\r\nTeam Management.\r\n\r\n\r\nQualifications\r\nExcellent knowledge programming languages (Laravel, CodeIgniter) knowledge of ( NodeJS, React, Java, jQuery, C#)\r\nExcellent knowledge of front-end web programming languages, (NextJS, JavaScript, AngularJS, HTML, CSS, with ability to render server-side and client-side content)\r\n7+ years of experience in project management or relevant fields\r\nExperience with common web development tools and services, such as version control software, package managers, and CI/CD pipelines\r\nFamiliarity with common programming design patterns and best practices\r\nExcellent written and verbal communication skills\r\nStrong attention to detail and problem-solving skills\r\nBachelor’s degree in computer science, engineering, or a related technical field\r\n\r\n\r\n\r\n\r\nJOB TIMINGS: (Evening & Night Shift) 7 pm to 3 am IST\r\nJOB TYPE: Remote (Work from Home)', 'Responsibilities\r\nCreate, design, and implement layouts for new and existing web pages.\r\nArchitect brand-new software solutions to fulfil project requirements.\r\nCreate and maintain database designs for data storage and processing.\r\nMaintain legacy code written by other developers, including bug fixes.\r\nIntegrate external software libraries and APIs into existing projects.\r\nAWS Server Architecture Management.\r\nTeam Management.\r\n\r\n\r\nQualifications\r\nExcellent knowledge programming languages (Laravel, CodeIgniter) knowledge of ( NodeJS, React, Java, jQuery, C#)\r\nExcellent knowledge of front-end web programming languages, (NextJS, JavaScript, AngularJS, HTML, CSS, with ability to render server-side and client-side content)\r\n7+ years of experience in project management or relevant fields\r\nExperience with common web development tools and services, such as version control software, package managers, and CI/CD pipelines\r\nFamiliarity with common programming design patterns and best practices\r\nExcellent written and verbal communication skills\r\nStrong attention to detail and problem-solving skills\r\nBachelor’s degree in computer science, engineering, or a related technical field', 'Part-time', NULL, NULL, 'Kerala', '2024-05-13 05:27:05', '2024-05-13 05:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_04_12_133529_create_oauth_clients_table', 1),
(5, '2024_04_12_133530_create_oauth_access_tokens_table', 1),
(6, '2024_04_12_133531_create_oauth_auth_codes_table', 1),
(7, '2024_04_12_133532_create_oauth_refresh_tokens_table', 1),
(8, '2024_04_12_133533_create_oauth_personal_access_clients_table', 1),
(9, '2024_04_12_133815_create_products_table', 1),
(10, '2024_05_10_111029_create_jobs_table', 2),
(11, '2024_05_10_111639_create_job_applications_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('d64206db60eeddc52da620864fc0c9a505c62517fbc2eb1acea04f7ea0a1d3c49999c7ad892f7054', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'jsm', '[]', 0, '2024-05-10 00:10:04', '2024-05-10 00:10:04', '2025-05-10 05:40:04'),
('6b60c0d9c7bdc26cb2ae5a84651c0dff1df228b8c05510b4a3b1902a9173d87d3f5f74f81485fe5b', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 00:12:10', '2024-05-10 00:12:10', '2025-05-10 05:42:10'),
('05c195123974b46d87817943d702bb91f570a2ae2c2b2a461315d0597568ed9248d0672aa30fe59b', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 01:44:06', '2024-05-10 01:44:06', '2025-05-10 07:14:06'),
('31c14026d3fe647f0fb23ce7c0e20e5bdaf19dcf8ab7c4beffc4f92ec887d18c52b854df883375ea', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 02:49:51', '2024-05-10 02:49:51', '2025-05-10 08:19:51'),
('3b1ff5385aed26fc330b55181ed62e969828c408a52bba02f29a7348aac7d8c2dd692dbe0c0ac42f', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 02:58:48', '2024-05-10 02:58:48', '2025-05-10 08:28:48'),
('f346bc2a6ae3149cea3ac06bc25da0c26cd9ea6093e2899b01748989a9711dae0f0b2af555dfc4bf', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 02:59:12', '2024-05-10 02:59:12', '2025-05-10 08:29:12'),
('f6d5fea60ff2aef4f16991094b31c9a16ec751499e5901cbe35fd2b127ffb2e3fe74f768cd726437', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:06:59', '2024-05-10 03:06:59', '2025-05-10 08:36:59'),
('bd73373b1d5b11ec345117d69f4fa42b56a4785cdaf0694b95f0fc0d2bafbc2a7559239f53658d46', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:08:08', '2024-05-10 03:08:08', '2025-05-10 08:38:08'),
('6ab436bd1129f285d903a8993c93780d28b249708754d3d51c7c38e639b5e8040c548d7023165870', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:09:59', '2024-05-10 03:09:59', '2025-05-10 08:39:59'),
('a79958c3c2c2b0d1093190759fbeac903978b813a775ee040e9ce739ff72048f39220581fc89eb3c', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:10:11', '2024-05-10 03:10:11', '2025-05-10 08:40:11'),
('cc24be1f048207972705d6a39fc9f07c44394c69bfcbf3ba95aa314daac910c163b294b9d4c06c23', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:10:32', '2024-05-10 03:10:32', '2025-05-10 08:40:32'),
('b6094c814ee63afc0cd1e80c8e259d5a9e44a62bd32240f2476b0457c643628fb2d93143c1421081', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:14:46', '2024-05-10 03:14:46', '2025-05-10 08:44:46'),
('5878f3df4a25d0e31ee7c9ef43523931c33b29a26dc72026b6bc3d65706da283e85a82312e3adb15', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:16:18', '2024-05-10 03:16:18', '2025-05-10 08:46:18'),
('bfd61a89a43af7be83efdf987fb8f063239e1c75e75210f31d7c664a1a53fcc328f11f4b1e062bae', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:17:13', '2024-05-10 03:17:13', '2025-05-10 08:47:13'),
('1b629e1640590bd595c6d4d3a2b6ce2028fa669e38f093292d1d4c76f972e9b0f6b318a39c036ca3', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:17:49', '2024-05-10 03:17:49', '2025-05-10 08:47:49'),
('1fd5bd8cb7ff74ef96ede6fc9300e141ae78e66e3a01514088ba529b64b09763b2e3cce4b60dd02c', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:19:04', '2024-05-10 03:19:04', '2025-05-10 08:49:04'),
('c6c12cdd3170cbea0d0d24dba987078da845a48a2d87fa57cad55501d10b0c28904525a0a751d8bc', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:25:17', '2024-05-10 03:25:17', '2025-05-10 08:55:17'),
('3738c96a0c3c4dba77ac39636704f3b4cefdc2baafeb0b10997dd75a92e5ab942313f2fd7f770768', 12, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 03:34:42', '2024-05-10 03:34:42', '2025-05-10 09:04:42'),
('72e51b325fe86130614dcef3bb0cd321e3e632f80365fe727375550dd1d688f1d537c306ff68d528', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 06:21:18', '2024-05-10 06:21:18', '2025-05-10 11:51:18'),
('5aa0bce6633050d238749762621e9ae5de0b0cb1b73d1e665d7e0c0864aac3a609cd525cf588cf65', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 06:50:18', '2024-05-10 06:50:18', '2025-05-10 12:20:18'),
('9297d4500be1180d510ad891abba740ab6c10a4153d283fd6039a65cd102f64bbbe83402d665426f', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 07:08:42', '2024-05-10 07:08:42', '2025-05-10 12:38:42'),
('b76dc19aea9eacff8ee60ed7855bd9d0925e16d60fe2102a9849afaefb2fcf496e2bd0204000ca03', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 07:29:40', '2024-05-10 07:29:40', '2025-05-10 12:59:40'),
('598edbeb34bdae4297488b92ef391e68b2242f5fd1131f21e34d4e8715c64e1b6f6fcd0c6716f91c', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 07:32:02', '2024-05-10 07:32:02', '2025-05-10 13:02:02'),
('5cb0270769e5f9329296ec520e5f3e0f3652d00cc8658fa53c7e4c8078d4ca550bc521f771c8cf40', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-10 08:36:52', '2024-05-10 08:36:52', '2025-05-10 14:06:52'),
('83424f5a83918ee4cd5708d5037fd8b1ea074a91cc11703ead3756f7ea20f0ccef8b1d4663bdb470', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-11 03:23:59', '2024-05-11 03:23:59', '2025-05-11 08:53:59'),
('704d7d5e3c0237948902d34d1d1fa3082fe4a5fbed9852b6994f1430d1566ba53a47046680332240', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-11 03:38:02', '2024-05-11 03:38:02', '2025-05-11 09:08:02'),
('8dbaa9bc86b0492b2c494d0b80e245df0caaf2bf470d89f5ce05d21f79c268fc2ff76b838b62d7db', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-11 06:15:06', '2024-05-11 06:15:06', '2025-05-11 11:45:06'),
('d63b7ede7f8f1be646b68045f66081270e99ac042377db222fd11872a0d9c4a01d3f99d50cddc6b4', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-11 10:39:04', '2024-05-11 10:39:04', '2025-05-11 16:09:04'),
('0757afa9cd574cc9cbe59178bea26f4414bbd363fa604626ee371747050fdd8dc4d1d39e03324c81', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-11 10:48:06', '2024-05-11 10:48:06', '2025-05-11 16:18:06'),
('2777d758fe2f8d9415e76a442e3f84969831456d3bad342a53d47ccb1dcc57604b2eaca64383f9c9', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 02:22:21', '2024-05-12 02:22:21', '2025-05-12 07:52:21'),
('f543872b2380622460405535d2ceee77a9e1e94af2726b5633463a5b5c362dfa636c1ddfef7a33c7', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 07:14:43', '2024-05-12 07:14:43', '2025-05-12 12:44:43'),
('7dc8805d3fce5460b7773eb91e18a16b0d6327de4e7f2e215bbe1c73f43e79790362d44085443f72', 13, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 07:17:26', '2024-05-12 07:17:26', '2025-05-12 12:47:26'),
('f836a34d6922475381fda196230b13abe358b234de0c9c21756ed5f1f9afc4fee330ef3a083823b3', 14, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 07:43:40', '2024-05-12 07:43:40', '2025-05-12 13:13:40'),
('be3147c6fb55e1261d208b70984ee98735fb1b17977c70e0932977fa54658f31892c6a683d37ea92', 14, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 07:58:30', '2024-05-12 07:58:30', '2025-05-12 13:28:30'),
('f24423049519250d24b30a0f0a5922ce2a805a08e2e46ced31ef8b394380e7fab318718624cd2b96', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 08:48:33', '2024-05-12 08:48:33', '2025-05-12 14:18:33'),
('d40a99f10ccabecc89c02c751f110f787b524475d52a069960a03ee4b453c15236d3eadb45816e33', 13, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 08:50:47', '2024-05-12 08:50:47', '2025-05-12 14:20:47'),
('4c7fb4cb3838fc6e33a83069907b59c440a282a82f9ac89909afa6fa53c2c83d1ef3c2c74d432143', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-12 14:11:43', '2024-05-12 14:11:43', '2025-05-12 19:41:43'),
('eafed555563706634b46b2929d51a2a96e476d1f7360852113729bb1f4a7307cb84088b9782c6763', 11, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-13 04:47:41', '2024-05-13 04:47:42', '2025-05-13 10:17:41'),
('cca7687a332b4a022c22dbd64f4c90cfda59f5e790ed26acb3f36d4f1443aa26ef85ee6ca1f1c282', 1, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-13 05:25:28', '2024-05-13 05:25:28', '2025-05-13 10:55:28'),
('547df01923bfaf232110c2fdd0b0619e2fb7fa0c6a11e59be2c306798f65e6d8ff2fde114bf3583a', 1, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', 'MyApp', '[]', 0, '2024-05-13 05:25:44', '2024-05-13 05:25:44', '2025-05-13 10:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9c01e386-f8c2-48c8-aa3e-b089d1412821', NULL, 'rahul', '$2y$10$55yTX2ZuM7G1kdyG4IcF1.y2DiFCJV2S.rw.FEys5k8xtCF0kAf32', NULL, 'http://localhost', 0, 0, 0, '2024-05-10 00:04:21', '2024-05-10 00:04:21'),
('9c01e3f5-0f88-4159-8ea9-74a6b8889065', NULL, 'jsm', '$2y$10$A3SyMtaT0YocNE9dLu5zAONh/dKZ.30SIHdyTLECr9w9Syl8F6j2u', NULL, 'http://localhost', 1, 0, 0, '2024-05-10 00:05:33', '2024-05-10 00:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9c01e3f5-0f88-4159-8ea9-74a6b8889065', '2024-05-10 00:05:33', '2024-05-10 00:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$FLoexjW.L25hGJ4ZMwVnOuqE2mExfA4vhiIK0QGzjIuhbcs6JNktm', 'recruiter', NULL, '2024-05-13 05:25:28', '2024-05-13 05:25:28');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
