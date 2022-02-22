-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 22, 2022 at 01:13 PM
-- Server version: 5.7.36
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(121, 'Promotion', 'promotion', '2022-02-17 18:44:05', '2022-02-18 15:49:34'),
(124, 'Test5', 'test5', '2022-02-18 16:42:33', '2022-02-18 16:42:33'),
(3, 'ENFANT', 'enfant', NULL, NULL),
(123, 'Test3', 'test3', '2022-02-18 16:06:42', '2022-02-18 16:42:21'),
(2, 'FEMME', 'femme', NULL, NULL),
(1, 'HOMME', 'homme', NULL, NULL);

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
-- Table structure for table `home_categories`
--

DROP TABLE IF EXISTS `home_categories`;
CREATE TABLE IF NOT EXISTS `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sel_categories` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '124,3,123,2,1', 8, '2022-02-12 20:57:31', '2022-02-21 14:23:43');

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_02_09_150757_create_sessions_table', 1),
(7, '2022_02_10_180251_create_categories_table', 1),
(8, '2022_02_10_180336_create_products_table', 1),
(9, '2022_02_13_120144_create_orders_table', 2),
(10, '2022_02_13_120159_create_order_items_table', 2),
(11, '2022_02_13_120218_create_shippings_table', 2),
(12, '2022_02_13_120231_create_transactions_table', 2),
(13, '2022_02_14_180620_create_shoppingcart_table', 3),
(14, '2022_02_15_223015_create_home_categories_table', 4),
(15, '2022_02_16_180022_add_delivered_canceled_date_to_orders_table', 5),
(16, '2022_02_17_190408_create_subcategories_table', 6),
(17, '2022_02_20_231126_create_product_attributes_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `city`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(118, 4, '0.00', '0.00', '398.00', '481.58', 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', 'ordered', 0, '2022-02-19 08:32:38', '2022-02-19 08:32:38', NULL, NULL),
(119, 4, '0.00', '0.00', '598.00', '723.58', 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', 'delivered', 0, '2022-02-19 10:46:26', '2022-02-21 18:12:11', '2022-02-21', NULL),
(117, 5, '0.00', '0.00', '199.00', '240.79', 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', 'delivered', 0, '2022-02-18 16:41:08', '2022-02-18 16:45:06', '2022-02-18', NULL),
(120, 4, '0.00', '0.00', '299.00', '361.79', 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', 'delivered', 0, '2022-02-21 14:31:16', '2022-02-21 18:12:14', '2022-02-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_order_id_foreign` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 16, 4, '199.00', 1, '2022-02-14 18:11:40', '2022-02-14 18:11:40'),
(2, 18, 4, '199.00', 2, '2022-02-14 18:11:40', '2022-02-14 18:11:40'),
(3, 16, 5, '199.00', 1, '2022-02-14 18:14:53', '2022-02-14 18:14:53'),
(4, 18, 5, '199.00', 2, '2022-02-14 18:14:53', '2022-02-14 18:14:53'),
(5, 16, 6, '199.00', 1, '2022-02-14 18:15:48', '2022-02-14 18:15:48'),
(6, 18, 6, '199.00', 2, '2022-02-14 18:15:48', '2022-02-14 18:15:48'),
(7, 16, 7, '199.00', 1, '2022-02-14 18:18:38', '2022-02-14 18:18:38'),
(8, 18, 7, '199.00', 2, '2022-02-14 18:18:38', '2022-02-14 18:18:38'),
(9, 15, 8, '299.00', 1, '2022-02-14 18:20:05', '2022-02-14 18:20:05'),
(10, 15, 9, '299.00', 1, '2022-02-14 18:20:54', '2022-02-14 18:20:54'),
(11, 15, 10, '299.00', 1, '2022-02-14 18:21:30', '2022-02-14 18:21:30'),
(12, 15, 11, '299.00', 1, '2022-02-14 18:21:45', '2022-02-14 18:21:45'),
(13, 15, 12, '299.00', 1, '2022-02-14 18:23:19', '2022-02-14 18:23:19'),
(14, 15, 13, '299.00', 1, '2022-02-14 18:28:11', '2022-02-14 18:28:11'),
(15, 15, 14, '299.00', 1, '2022-02-14 18:28:28', '2022-02-14 18:28:28'),
(16, 18, 14, '199.00', 1, '2022-02-14 18:28:28', '2022-02-14 18:28:28'),
(17, 18, 15, '199.00', 1, '2022-02-14 18:30:08', '2022-02-14 18:30:08'),
(18, 15, 16, '299.00', 1, '2022-02-14 18:30:30', '2022-02-14 18:30:30'),
(19, 15, 17, '299.00', 1, '2022-02-14 18:38:11', '2022-02-14 18:38:11'),
(20, 15, 18, '299.00', 1, '2022-02-14 19:37:46', '2022-02-14 19:37:46'),
(21, 16, 19, '299.00', 1, '2022-02-14 21:34:06', '2022-02-14 21:34:06'),
(22, 17, 20, '199.00', 1, '2022-02-15 09:19:01', '2022-02-15 09:19:01'),
(23, 28, 20, '199.00', 1, '2022-02-15 09:19:01', '2022-02-15 09:19:01'),
(24, 27, 20, '199.00', 2, '2022-02-15 09:19:01', '2022-02-15 09:19:01'),
(25, 28, 21, '199.00', 2, '2022-02-15 11:10:52', '2022-02-15 11:10:52'),
(26, 28, 22, '199.00', 2, '2022-02-15 16:25:45', '2022-02-15 16:25:45'),
(27, 28, 23, '199.00', 2, '2022-02-15 16:29:08', '2022-02-15 16:29:08'),
(28, 28, 24, '199.00', 2, '2022-02-15 16:30:02', '2022-02-15 16:30:02'),
(29, 28, 25, '199.00', 2, '2022-02-15 16:37:27', '2022-02-15 16:37:27'),
(30, 28, 26, '199.00', 2, '2022-02-15 16:38:39', '2022-02-15 16:38:39'),
(31, 28, 27, '199.00', 2, '2022-02-15 16:40:42', '2022-02-15 16:40:42'),
(32, 28, 28, '199.00', 2, '2022-02-15 16:54:23', '2022-02-15 16:54:23'),
(33, 28, 29, '199.00', 2, '2022-02-15 17:00:28', '2022-02-15 17:00:28'),
(34, 28, 30, '199.00', 2, '2022-02-15 17:04:16', '2022-02-15 17:04:16'),
(35, 28, 31, '199.00', 2, '2022-02-15 17:06:36', '2022-02-15 17:06:36'),
(36, 28, 32, '199.00', 2, '2022-02-15 17:13:14', '2022-02-15 17:13:14'),
(37, 28, 33, '199.00', 2, '2022-02-15 17:13:50', '2022-02-15 17:13:50'),
(38, 28, 34, '199.00', 2, '2022-02-15 17:14:34', '2022-02-15 17:14:34'),
(39, 28, 35, '199.00', 2, '2022-02-15 17:45:38', '2022-02-15 17:45:38'),
(40, 28, 36, '199.00', 2, '2022-02-15 18:01:10', '2022-02-15 18:01:10'),
(41, 28, 37, '199.00', 2, '2022-02-15 18:02:33', '2022-02-15 18:02:33'),
(42, 28, 38, '199.00', 2, '2022-02-15 18:12:47', '2022-02-15 18:12:47'),
(43, 28, 39, '199.00', 2, '2022-02-15 18:13:58', '2022-02-15 18:13:58'),
(44, 28, 40, '199.00', 2, '2022-02-15 18:15:06', '2022-02-15 18:15:06'),
(45, 28, 41, '199.00', 2, '2022-02-15 18:15:57', '2022-02-15 18:15:57'),
(46, 28, 42, '199.00', 2, '2022-02-15 18:17:06', '2022-02-15 18:17:06'),
(47, 28, 43, '199.00', 2, '2022-02-15 18:19:04', '2022-02-15 18:19:04'),
(48, 28, 44, '199.00', 2, '2022-02-15 18:26:59', '2022-02-15 18:26:59'),
(49, 28, 45, '199.00', 2, '2022-02-15 18:27:38', '2022-02-15 18:27:38'),
(50, 27, 46, '199.00', 1, '2022-02-15 18:33:35', '2022-02-15 18:33:35'),
(51, 27, 47, '199.00', 1, '2022-02-15 18:34:03', '2022-02-15 18:34:03'),
(52, 27, 48, '199.00', 1, '2022-02-15 18:34:48', '2022-02-15 18:34:48'),
(53, 28, 49, '199.00', 1, '2022-02-16 07:56:32', '2022-02-16 07:56:32'),
(54, 15, 50, '299.00', 1, '2022-02-16 07:57:28', '2022-02-16 07:57:28'),
(55, 28, 50, '199.00', 1, '2022-02-16 07:57:28', '2022-02-16 07:57:28'),
(56, 15, 51, '34.00', 1, '2022-02-16 08:00:15', '2022-02-16 08:00:15'),
(57, 27, 52, '199.00', 1, '2022-02-16 08:11:22', '2022-02-16 08:11:22'),
(58, 31, 53, '199.00', 2, '2022-02-16 12:35:48', '2022-02-16 12:35:48'),
(59, 33, 53, '199.00', 1, '2022-02-16 12:35:48', '2022-02-16 12:35:48'),
(60, 36, 54, '199.00', 2, '2022-02-16 19:11:07', '2022-02-16 19:11:07'),
(61, 31, 54, '199.00', 1, '2022-02-16 19:11:07', '2022-02-16 19:11:07'),
(62, 28, 55, '199.00', 1, '2022-02-16 19:11:38', '2022-02-16 19:11:38'),
(63, 35, 56, '199.00', 1, '2022-02-16 19:16:16', '2022-02-16 19:16:16'),
(64, 28, 57, '199.00', 1, '2022-02-16 19:18:56', '2022-02-16 19:18:56'),
(65, 28, 58, '199.00', 1, '2022-02-16 19:19:31', '2022-02-16 19:19:31'),
(66, 25, 59, '199.00', 1, '2022-02-16 19:30:22', '2022-02-16 19:30:22'),
(67, 25, 60, '199.00', 1, '2022-02-16 19:57:19', '2022-02-16 19:57:19'),
(68, 30, 61, '199.00', 1, '2022-02-16 20:03:39', '2022-02-16 20:03:39'),
(69, 28, 62, '199.00', 1, '2022-02-16 20:04:37', '2022-02-16 20:04:37'),
(70, 28, 63, '199.00', 2, '2022-02-16 20:14:14', '2022-02-16 20:14:14'),
(71, 25, 63, '199.00', 2, '2022-02-16 20:14:14', '2022-02-16 20:14:14'),
(72, 28, 64, '199.00', 2, '2022-02-16 20:15:24', '2022-02-16 20:15:24'),
(73, 25, 64, '199.00', 2, '2022-02-16 20:15:24', '2022-02-16 20:15:24'),
(74, 28, 65, '199.00', 2, '2022-02-16 20:16:18', '2022-02-16 20:16:18'),
(75, 25, 65, '199.00', 2, '2022-02-16 20:16:18', '2022-02-16 20:16:18'),
(76, 28, 66, '199.00', 2, '2022-02-16 20:18:58', '2022-02-16 20:18:58'),
(77, 25, 66, '199.00', 2, '2022-02-16 20:18:58', '2022-02-16 20:18:58'),
(78, 28, 67, '199.00', 2, '2022-02-16 21:07:33', '2022-02-16 21:07:33'),
(79, 25, 67, '199.00', 2, '2022-02-16 21:07:33', '2022-02-16 21:07:33'),
(80, 31, 68, '199.00', 1, '2022-02-16 21:09:05', '2022-02-16 21:09:05'),
(81, 30, 69, '199.00', 1, '2022-02-16 21:12:15', '2022-02-16 21:12:15'),
(82, 25, 70, '199.00', 1, '2022-02-16 21:14:44', '2022-02-16 21:14:44'),
(83, 28, 71, '199.00', 1, '2022-02-16 21:16:31', '2022-02-16 21:16:31'),
(84, 28, 72, '199.00', 1, '2022-02-16 21:18:21', '2022-02-16 21:18:21'),
(85, 34, 73, '299.00', 1, '2022-02-16 21:32:34', '2022-02-16 21:32:34'),
(86, 37, 73, '299.00', 1, '2022-02-16 21:32:34', '2022-02-16 21:32:34'),
(87, 28, 74, '199.00', 1, '2022-02-16 21:44:24', '2022-02-16 21:44:24'),
(88, 30, 75, '199.00', 1, '2022-02-16 21:53:28', '2022-02-16 21:53:28'),
(89, 28, 76, '199.00', 1, '2022-02-16 21:57:32', '2022-02-16 21:57:32'),
(90, 28, 77, '199.00', 1, '2022-02-16 22:01:52', '2022-02-16 22:01:52'),
(91, 24, 78, '199.00', 1, '2022-02-16 22:05:49', '2022-02-16 22:05:49'),
(92, 28, 79, '199.00', 1, '2022-02-16 22:10:52', '2022-02-16 22:10:52'),
(93, 30, 80, '199.00', 1, '2022-02-16 22:12:05', '2022-02-16 22:12:05'),
(94, 31, 81, '199.00', 1, '2022-02-16 22:12:42', '2022-02-16 22:12:42'),
(95, 28, 82, '199.00', 1, '2022-02-16 22:24:58', '2022-02-16 22:24:58'),
(96, 28, 83, '199.00', 1, '2022-02-16 22:37:25', '2022-02-16 22:37:25'),
(97, 28, 84, '199.00', 1, '2022-02-16 22:39:50', '2022-02-16 22:39:50'),
(98, 46, 84, '345.00', 1, '2022-02-16 22:39:50', '2022-02-16 22:39:50'),
(99, 28, 85, '199.00', 2, '2022-02-16 22:49:54', '2022-02-16 22:49:54'),
(100, 46, 85, '345.00', 1, '2022-02-16 22:49:54', '2022-02-16 22:49:54'),
(101, 30, 86, '199.00', 1, '2022-02-16 22:51:33', '2022-02-16 22:51:33'),
(102, 30, 87, '199.00', 1, '2022-02-16 22:52:39', '2022-02-16 22:52:39'),
(103, 30, 88, '199.00', 1, '2022-02-16 22:59:26', '2022-02-16 22:59:26'),
(104, 30, 89, '199.00', 1, '2022-02-16 23:03:15', '2022-02-16 23:03:15'),
(105, 30, 90, '199.00', 1, '2022-02-16 23:03:58', '2022-02-16 23:03:58'),
(106, 30, 91, '199.00', 1, '2022-02-16 23:06:46', '2022-02-16 23:06:46'),
(107, 30, 92, '199.00', 1, '2022-02-16 23:09:27', '2022-02-16 23:09:27'),
(108, 30, 93, '199.00', 1, '2022-02-16 23:13:00', '2022-02-16 23:13:00'),
(109, 30, 94, '199.00', 1, '2022-02-16 23:18:49', '2022-02-16 23:18:49'),
(110, 30, 95, '199.00', 1, '2022-02-16 23:24:10', '2022-02-16 23:24:10'),
(111, 30, 96, '199.00', 1, '2022-02-16 23:30:48', '2022-02-16 23:30:48'),
(112, 30, 97, '199.00', 1, '2022-02-16 23:33:36', '2022-02-16 23:33:36'),
(113, 30, 98, '199.00', 1, '2022-02-16 23:41:44', '2022-02-16 23:41:44'),
(114, 30, 99, '199.00', 1, '2022-02-16 23:43:50', '2022-02-16 23:43:50'),
(115, 30, 100, '199.00', 1, '2022-02-16 23:44:18', '2022-02-16 23:44:18'),
(116, 30, 101, '199.00', 1, '2022-02-16 23:45:17', '2022-02-16 23:45:17'),
(117, 28, 102, '199.00', 1, '2022-02-16 23:59:26', '2022-02-16 23:59:26'),
(118, 30, 102, '199.00', 1, '2022-02-16 23:59:26', '2022-02-16 23:59:26'),
(119, 25, 103, '199.00', 1, '2022-02-17 00:01:55', '2022-02-17 00:01:55'),
(120, 31, 104, '199.00', 1, '2022-02-17 00:03:25', '2022-02-17 00:03:25'),
(121, 28, 105, '199.00', 1, '2022-02-17 00:12:49', '2022-02-17 00:12:49'),
(122, 31, 105, '199.00', 1, '2022-02-17 00:12:49', '2022-02-17 00:12:49'),
(123, 28, 106, '199.00', 1, '2022-02-17 00:13:42', '2022-02-17 00:13:42'),
(124, 31, 107, '199.00', 1, '2022-02-17 19:29:55', '2022-02-17 19:29:55'),
(125, 28, 108, '199.00', 1, '2022-02-17 19:36:32', '2022-02-17 19:36:32'),
(126, 31, 109, '199.00', 2, '2022-02-18 15:38:10', '2022-02-18 15:38:10'),
(127, 28, 109, '199.00', 1, '2022-02-18 15:38:10', '2022-02-18 15:38:10'),
(128, 28, 110, '199.00', 1, '2022-02-18 15:39:14', '2022-02-18 15:39:14'),
(129, 53, 111, '199.00', 1, '2022-02-18 15:46:53', '2022-02-18 15:46:53'),
(130, 31, 111, '199.00', 1, '2022-02-18 15:46:53', '2022-02-18 15:46:53'),
(131, 25, 112, '199.00', 1, '2022-02-18 15:47:54', '2022-02-18 15:47:54'),
(132, 53, 113, '554.00', 1, '2022-02-18 16:03:40', '2022-02-18 16:03:40'),
(133, 28, 114, '199.00', 1, '2022-02-18 16:04:21', '2022-02-18 16:04:21'),
(134, 28, 115, '199.00', 1, '2022-02-18 16:04:56', '2022-02-18 16:04:56'),
(135, 33, 116, '199.00', 2, '2022-02-18 16:40:13', '2022-02-18 16:40:13'),
(136, 24, 117, '199.00', 1, '2022-02-18 16:41:08', '2022-02-18 16:41:08'),
(137, 31, 118, '199.00', 2, '2022-02-19 08:32:38', '2022-02-19 08:32:38'),
(138, 61, 119, '299.00', 2, '2022-02-19 10:46:26', '2022-02-19 10:46:26'),
(139, 61, 120, '299.00', 1, '2022-02-21 14:31:16', '2022-02-21 14:31:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`) VALUES
(55, 'Produit_1245', 'produit-1245', 'lorem epsum dolor lorem epsum dolor lorem epsum dolor ', 'lorem epsum dolor lorem epsum dolor lorem epsum dolor lorem epsum dolor lorem epsum dolor ', '199.00', '299.00', '29839', 'instock', 0, 23, '1645206184.png', NULL, 124, '2022-02-18 15:51:25', '2022-02-18 16:43:04'),
(31, 'product_4', 'product-4', 'clorem', 'lorem epsum', '199.00', '199.00', '1', 'instock', 0, 19, '1644917990.png', NULL, 1, '2022-02-15 08:21:19', '2022-02-15 08:39:50'),
(24, 'product_6', 'product-6', 'lorem epsum ', 'lorem epsum', '199.00', '199.00', '9', 'instock', 0, 12, '1644915842.jpg', NULL, 2, '2022-02-15 08:04:02', '2022-02-15 08:04:02'),
(25, 'chaussure-jordan-series-es-pour-zPGmm0-', 'chaussure-jordan-series-es-pour-zpgmm0', 'lorem epsum ', 'lorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsumlorem epsum', '199.00', '199.00', '9', 'instock', 0, 12, '1645045163.png', NULL, 1, '2022-02-15 08:04:23', '2022-02-16 19:59:23'),
(33, 'jacket', 'jacket', 'lorem espsum dolor lorem espsum dolor lorem espsum dolor lorem espsum dolor ', 'lorem espsum dolor lorem espsum dolor lorem espsum dolor lorem espsum dolor lorem espsum dolor lorem espsum dolor ', '199.00', '199.00', '2387', 'instock', 0, 12, '1645011458.png', NULL, 1, '2022-02-16 10:28:50', '2022-02-16 10:37:38'),
(15, 'djdj', 'jlkjdlkj', 'kdjljk', 'dkljdkj', '299.00', '34.00', 'k', 'instock', 0, 293, '1644744883.jpg', NULL, 2, '2022-02-12 23:07:02', '2022-02-13 08:34:43'),
(34, 'jacket test', 'jacket-test', 'lorem espsum dolor lorem espsum dolor lorem espsum dolor ', 'lorem espsum dolor lorem espsum dolor lorem espsum dolor ', '299.00', '299.00', '232', 'instock', 0, 29, '1645011501.png', NULL, 1, '2022-02-16 10:31:44', '2022-02-16 10:38:21'),
(36, 'shoes 2', 'shoes-2', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '199.00', '189.00', '19289', 'instock', 0, 19, '1645039710.jpg', NULL, 1, '2022-02-16 18:28:30', '2022-02-16 18:28:30'),
(61, 'product test gallery', 'product-test-gallery', 'lorem ipsum dolor vlorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '299.00', '299.00', '29922', 'instock', 0, 99, '1645267004.png', ',16452670040.png,16452670041.png,16452670042.png,16452670043.png', 124, '2022-02-19 09:36:44', '2022-02-19 09:36:44'),
(53, 'shoes_34', 'shoes-34', 'lorem ispsum dolor lorem ispsum dolor lorem ispsum dolor lorem ispsum dolor lorem ispsum dolor ', 'lorem ispsum dolor lorem ispsum dolor lorem ispsum dolor lorem ispsum dolor ', '199.00', '554.00', '293898', 'instock', 0, 28, '1645203031.png', NULL, 121, '2022-02-17 00:17:01', '2022-02-18 15:50:31'),
(39, 'seat a capuche 8', 'seat-a-capuche-8', 'lorem ipsum dolor lorem lorem ipsum dolor dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '399.00', '299.00', '345', 'instock', 0, 12, '1645060577.png', NULL, 2, '2022-02-16 18:55:59', '2022-02-17 00:16:17'),
(40, 'seat a capuche enfant', 'seat-a-capuche-enfant', 'lorem ipsum dolor lorem lorem ipsum dolor dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '399.00', '333.00', '345', 'instock', 0, 12, '1645041373.png', NULL, 3, '2022-02-16 18:56:13', '2022-02-16 18:56:13'),
(41, 'sweat a capuche femme', 'sweat-a-capuche-femme', 'lorem ipsum dolor lorem lorem ipsum dolor dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '399.00', '333.00', '345', 'instock', 0, 12, '1645041402.png', NULL, 2, '2022-02-16 18:56:42', '2022-02-16 18:56:42'),
(42, 'sweat a capuche enf', 'sweat-a-capuche-enf', 'lorem ipsum dolor lorem lorem ipsum dolor dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '399.00', '333.00', '345', 'instock', 0, 12, '1645041419.png', NULL, 3, '2022-02-16 18:56:59', '2022-02-16 18:56:59'),
(43, 'vest a capuche 1', 'vest-a-capuche-1', 'lorem ipsum dolor lorem lorem ipsum dolor dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '399.00', '333.00', '345', 'instock', 0, 12, '1645041453.png', NULL, 3, '2022-02-16 18:57:33', '2022-02-16 18:57:33'),
(44, 'veste-sportswear-paris-saint-germain-pour-plus-age-gtgLzQ', 'veste-sportswear-paris-saint-germain-pour-plus-age-gtglzq', 'lorem ipsum dolor lorem lorem ipsum dolor dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '399.00', '345.00', '345', 'instock', 0, 12, '1645041476.png', NULL, 3, '2022-02-16 18:57:56', '2022-02-16 18:57:56'),
(45, 'veste-sportswear-pack-pour-plus-age-s6ssGJ-removebg-preview', 'veste-sportswear-pack-pour-plus-age-s6ssgj-removebg-preview', 'lorem ipsum dolor lorem lorem ipsum dolor dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '399.00', '345.00', '345', 'instock', 0, 12, '1645041498.png', NULL, 3, '2022-02-16 18:58:18', '2022-02-16 18:58:18'),
(46, 'veste-a-zip-sportswear-windrunner-pour-petit-JdfDPD-', 'veste-a-zip-sportswear-windrunner-pour-petit-jdfdpd', 'lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor ', 'lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor ', '292.00', '345.00', '23', 'instock', 0, 234, '1645041567.png', NULL, 3, '2022-02-16 18:59:27', '2022-02-16 18:59:27'),
(47, 'haut-a-manches-courtes-sportswear-pour-plus-age-5fzSX7', 'haut-a-manches-courtes-sportswear-pour-plus-age-5fzsx7', 'lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor ', 'lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor lorem ipsume dolor ', '292.00', '345.00', '23', 'instock', 0, 234, '1645041611.png', NULL, 3, '2022-02-16 19:00:11', '2022-02-16 19:00:11'),
(60, 'produtc_test_gallery', 'produtc-test-gallery', 'ldlorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '299.00', '299.00', '929929', 'instock', 0, 29, '1645266841.png', ',16452667850.png,16452667851.png,16452667852.png', 124, '2022-02-19 09:33:05', '2022-02-19 09:34:01'),
(58, 'product-002', 'product-002', 'lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum ', 'lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum ', '123.00', '299.00', '12', 'instock', 0, 233, '1645204624.png', NULL, 123, '2022-02-18 16:17:04', '2022-02-18 16:17:04'),
(59, 'produit_12353', 'produit-12353', 'lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum ', 'lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum ', '199.00', '199.00', '232', 'instock', 0, 23, '1645206234.png', NULL, 124, '2022-02-18 16:43:54', '2022-02-18 16:43:54'),
(57, 'produit_124', 'produit-124', 'lorem lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum ', 'lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum lorem epsum ', '233.00', '299.00', '32332', 'instock', 0, 23, '1645204418.png', NULL, 123, '2022-02-18 16:13:38', '2022-02-18 16:13:38'),
(62, 'produit pour test gallery', 'produit-pour-test-gallery', 'me lorem ipsum dolor lorem ipsum dolor 11', 'lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor ', '299.00', '199.00', '9191', 'instock', 0, 19, '1645267054.png', ',16452670540.png,16452670541.png,16452670542.png,16452670543.png', 124, '2022-02-19 09:37:34', '2022-02-19 09:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Colour', '2022-02-21 14:17:48', '2022-02-21 14:17:48'),
(2, 'Taille', '2022-02-21 14:23:11', '2022-02-21 14:23:11');

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
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('xFV7fP8OlO9IIzvyjJ4gUh9XeS9BsnrQNz460hxX', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidDNieEoxNFNvbkI0OEIxUjFjYWFYdDgyUHZjTmdXeEJ6dFUwaHBFNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ4ZFRCM2lINFVPTE92cEY2cWVlUkllczl3MVRiZGMzWTkwc0JjRVZsSVFnMW04SWhkMWpvMiI7czo0OiJjYXJ0IjthOjE6e3M6NzoiZGVmYXVsdCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MTp7czozMjoiZjRhNDI4NTk3MDU4M2IzZmVlMzk4NDM2NWY4Yzk5YzkiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiJmNGE0Mjg1OTcwNTgzYjNmZWUzOTg0MzY1ZjhjOTljOSI7czoyOiJpZCI7aTo2MTtzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czoyMDoicHJvZHVjdCB0ZXN0IGdhbGxlcnkiO3M6NToicHJpY2UiO2Q6Mjk5O3M6Nzoib3B0aW9ucyI7TzozOToiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW1PcHRpb25zIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6NDk6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBhc3NvY2lhdGVkTW9kZWwiO3M6MTg6IkFwcFxNb2RlbHNcUHJvZHVjdCI7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAHRheFJhdGUiO2k6MjE7czo0MToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGlzU2F2ZWQiO2I6MDt9fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDhkVEIzaUg0VU9MT3ZwRjZxZWVSSWVzOXcxVGJkYzNZOTBzQmNFVmxJUWcxbThJaGQxam8yIjt9', 1645458804),
('dLirPP7CoZTl3E97DkWhFqK9szIa6gPW63lERla1', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNGtQS2hiV2V0MmJwVllMVGtHY3h4OXRFc1RVU0hOUDg0VVpDMkZkeCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDhkVEIzaUg0VU9MT3ZwRjZxZWVSSWVzOXcxVGJkYzNZOTBzQmNFVmxJUWcxbThJaGQxam8yIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQ4ZFRCM2lINFVPTE92cEY2cWVlUkllczl3MVRiZGMzWTkwc0JjRVZsSVFnMW04SWhkMWpvMiI7fQ==', 1645470736),
('BEmuHere8y99NeeqOVjW4dGQl4s7Ggj1mlXBWl4m', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiQlJKNE11eVFVZFdMbW1HcjU0M05FNm1OeDFETUdKOHF3ZGd0MDIyUCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkOGRUQjNpSDRVT0xPdnBGNnFlZVJJZXM5dzFUYmRjM1k5MHNCY0VWbElRZzFtOEloZDFqbzIiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDhkVEIzaUg0VU9MT3ZwRjZxZWVSSWVzOXcxVGJkYzNZOTBzQmNFVmxJUWcxbThJaGQxam8yIjtzOjQ6ImNhcnQiO2E6MTp7czo3OiJkZWZhdWx0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YToxOntzOjMyOiJmNGE0Mjg1OTcwNTgzYjNmZWUzOTg0MzY1ZjhjOTljOSI7TzozMjoiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0iOjk6e3M6NToicm93SWQiO3M6MzI6ImY0YTQyODU5NzA1ODNiM2ZlZTM5ODQzNjVmOGM5OWM5IjtzOjI6ImlkIjtpOjYxO3M6MzoicXR5IjtpOjE7czo0OiJuYW1lIjtzOjIwOiJwcm9kdWN0IHRlc3QgZ2FsbGVyeSI7czo1OiJwcmljZSI7ZDoyOTk7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7czoxODoiQXBwXE1vZGVsc1xQcm9kdWN0IjtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AdGF4UmF0ZSI7aToyMTtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AaXNTYXZlZCI7YjowO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319fQ==', 1645529214);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
CREATE TABLE IF NOT EXISTS `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shippings_order_id_foreign` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `city`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 4, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:11:40', '2022-02-14 18:11:40'),
(2, 5, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:14:53', '2022-02-14 18:14:53'),
(3, 6, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:15:48', '2022-02-14 18:15:48'),
(4, 7, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:18:38', '2022-02-14 18:18:38'),
(5, 8, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:20:05', '2022-02-14 18:20:05'),
(6, 9, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:20:54', '2022-02-14 18:20:54'),
(7, 10, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:21:30', '2022-02-14 18:21:30'),
(8, 11, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:21:45', '2022-02-14 18:21:45'),
(9, 12, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:23:19', '2022-02-14 18:23:19'),
(10, 13, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:28:11', '2022-02-14 18:28:11'),
(11, 14, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:28:28', '2022-02-14 18:28:28'),
(12, 15, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:30:08', '2022-02-14 18:30:08'),
(13, 16, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:30:30', '2022-02-14 18:30:30'),
(14, 17, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 18:38:11', '2022-02-14 18:38:11'),
(15, 18, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-14 19:37:46', '2022-02-14 19:37:46'),
(16, 19, 'radouane', 'tamouss', '08880099998', 'atamousse@gmail.com', 'el jadida', 'el jadida', '24100', '2022-02-14 21:34:06', '2022-02-14 21:34:06'),
(17, 20, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-15 09:19:01', '2022-02-15 09:19:01'),
(18, 21, 'radouane', 'tamouss', '0772561225', 'a@gmail.com', 'el jadida', 'el Jadida', '24100', '2022-02-15 11:10:52', '2022-02-15 11:10:52'),
(19, 22, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 16:25:45', '2022-02-15 16:25:45'),
(20, 23, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 16:29:08', '2022-02-15 16:29:08'),
(21, 24, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 16:30:02', '2022-02-15 16:30:02'),
(22, 25, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 16:37:28', '2022-02-15 16:37:28'),
(23, 26, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 16:38:39', '2022-02-15 16:38:39'),
(24, 27, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 16:40:42', '2022-02-15 16:40:42'),
(25, 28, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 16:54:23', '2022-02-15 16:54:23'),
(26, 29, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-15 17:00:28', '2022-02-15 17:00:28'),
(27, 30, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 17:04:16', '2022-02-15 17:04:16'),
(28, 31, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 17:06:36', '2022-02-15 17:06:36'),
(29, 32, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 17:13:14', '2022-02-15 17:13:14'),
(30, 33, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 17:13:50', '2022-02-15 17:13:50'),
(31, 34, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 17:14:34', '2022-02-15 17:14:34'),
(32, 35, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 17:45:38', '2022-02-15 17:45:38'),
(33, 36, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:01:10', '2022-02-15 18:01:10'),
(34, 37, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:02:33', '2022-02-15 18:02:33'),
(35, 38, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:12:47', '2022-02-15 18:12:47'),
(36, 39, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:13:58', '2022-02-15 18:13:58'),
(37, 40, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:15:06', '2022-02-15 18:15:06'),
(38, 41, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:15:57', '2022-02-15 18:15:57'),
(39, 42, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:17:06', '2022-02-15 18:17:06'),
(40, 43, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:19:04', '2022-02-15 18:19:04'),
(41, 44, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:26:59', '2022-02-15 18:26:59'),
(42, 45, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:27:38', '2022-02-15 18:27:38'),
(43, 46, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:33:35', '2022-02-15 18:33:35'),
(44, 47, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:34:03', '2022-02-15 18:34:03'),
(45, 48, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-15 18:34:48', '2022-02-15 18:34:48'),
(46, 49, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 07:56:32', '2022-02-16 07:56:32'),
(47, 50, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 07:57:28', '2022-02-16 07:57:28'),
(48, 51, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 08:00:15', '2022-02-16 08:00:15'),
(49, 52, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 08:11:22', '2022-02-16 08:11:22'),
(50, 53, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 12:35:48', '2022-02-16 12:35:48'),
(51, 54, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 19:11:07', '2022-02-16 19:11:07'),
(52, 55, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 19:11:38', '2022-02-16 19:11:38'),
(53, 56, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 19:16:16', '2022-02-16 19:16:16'),
(54, 57, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 19:18:56', '2022-02-16 19:18:56'),
(55, 58, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 19:19:31', '2022-02-16 19:19:31'),
(56, 59, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 19:30:22', '2022-02-16 19:30:22'),
(57, 60, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 19:57:19', '2022-02-16 19:57:19'),
(58, 61, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 20:03:39', '2022-02-16 20:03:39'),
(59, 62, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 20:04:37', '2022-02-16 20:04:37'),
(60, 63, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 20:14:14', '2022-02-16 20:14:14'),
(61, 64, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 20:15:24', '2022-02-16 20:15:24'),
(62, 65, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-16 20:16:18', '2022-02-16 20:16:18'),
(63, 66, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 20:18:58', '2022-02-16 20:18:58'),
(64, 67, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:07:33', '2022-02-16 21:07:33'),
(65, 68, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-16 21:09:05', '2022-02-16 21:09:05'),
(66, 69, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:12:15', '2022-02-16 21:12:15'),
(67, 70, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:14:44', '2022-02-16 21:14:44'),
(68, 71, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:16:31', '2022-02-16 21:16:31'),
(69, 72, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:18:21', '2022-02-16 21:18:21'),
(70, 73, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:32:34', '2022-02-16 21:32:34'),
(71, 74, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:44:24', '2022-02-16 21:44:24'),
(72, 75, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:53:28', '2022-02-16 21:53:28'),
(73, 76, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 21:57:32', '2022-02-16 21:57:32'),
(74, 77, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:01:52', '2022-02-16 22:01:52'),
(75, 78, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:05:49', '2022-02-16 22:05:49'),
(76, 79, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:10:52', '2022-02-16 22:10:52'),
(77, 80, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-16 22:12:05', '2022-02-16 22:12:05'),
(78, 81, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-16 22:12:42', '2022-02-16 22:12:42'),
(79, 82, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:24:58', '2022-02-16 22:24:58'),
(80, 83, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:37:25', '2022-02-16 22:37:25'),
(81, 84, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:39:50', '2022-02-16 22:39:50'),
(82, 85, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:49:54', '2022-02-16 22:49:54'),
(83, 86, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:51:33', '2022-02-16 22:51:33'),
(84, 87, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:52:39', '2022-02-16 22:52:39'),
(85, 88, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 22:59:26', '2022-02-16 22:59:26'),
(86, 89, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:03:15', '2022-02-16 23:03:15'),
(87, 90, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:03:58', '2022-02-16 23:03:58'),
(88, 91, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:06:46', '2022-02-16 23:06:46'),
(89, 92, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:09:27', '2022-02-16 23:09:27'),
(90, 93, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:13:00', '2022-02-16 23:13:00'),
(91, 94, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:18:49', '2022-02-16 23:18:49'),
(92, 95, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:24:10', '2022-02-16 23:24:10'),
(93, 96, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:30:48', '2022-02-16 23:30:48'),
(94, 97, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:33:36', '2022-02-16 23:33:36'),
(95, 98, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:41:44', '2022-02-16 23:41:44'),
(96, 99, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:43:50', '2022-02-16 23:43:50'),
(97, 100, 'ASMA', 'TAMOUSS', '0652977978', 'atamouss@gmail.com', 'KENZI IMM8/ETAGE 4/APPT A', 'DEROUA', '26200', '2022-02-16 23:44:18', '2022-02-16 23:44:18'),
(98, 101, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:45:17', '2022-02-16 23:45:17'),
(99, 102, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-16 23:59:26', '2022-02-16 23:59:26'),
(100, 103, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-17 00:01:55', '2022-02-17 00:01:55'),
(101, 104, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-17 00:03:25', '2022-02-17 00:03:25'),
(102, 105, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-17 00:12:49', '2022-02-17 00:12:49'),
(103, 106, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-17 00:13:42', '2022-02-17 00:13:42'),
(104, 107, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-17 19:29:55', '2022-02-17 19:29:55'),
(105, 108, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-17 19:36:32', '2022-02-17 19:36:32'),
(106, 109, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 15:38:10', '2022-02-18 15:38:10'),
(107, 110, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 15:39:14', '2022-02-18 15:39:14'),
(108, 111, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 15:46:53', '2022-02-18 15:46:53'),
(109, 112, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 15:47:54', '2022-02-18 15:47:54'),
(110, 113, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 16:03:40', '2022-02-18 16:03:40'),
(111, 114, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 16:04:21', '2022-02-18 16:04:21'),
(112, 115, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 16:04:56', '2022-02-18 16:04:56'),
(113, 116, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 16:40:13', '2022-02-18 16:40:13'),
(114, 117, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-18 16:41:08', '2022-02-18 16:41:08'),
(115, 118, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-19 08:32:38', '2022-02-19 08:32:38'),
(116, 119, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-19 10:46:26', '2022-02-19 10:46:26'),
(117, 120, 'radouane', 'tamouss', '0772561225', 'atamousse.red@gmail.com', 'ehay essalam el jadida', 'el jadida', '20400', '2022-02-21 14:31:16', '2022-02-21 14:31:16');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE IF NOT EXISTS `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('admin@admin.com', 'default', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"f4a4285970583b3fee3984365f8c99c9\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"f4a4285970583b3fee3984365f8c99c9\";s:2:\"id\";i:61;s:3:\"qty\";i:1;s:4:\"name\";s:20:\"product test gallery\";s:5:\"price\";d:299;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-02-21 14:31:06', NULL),
('atamousse.red@gmail.com', 'default', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-02-17 00:14:20', NULL),
('user1@me.com', 'default', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"6aa0d4b8fac3c55a3e83b7e2b7d1cb97\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"6aa0d4b8fac3c55a3e83b7e2b7d1cb97\";s:2:\"id\";i:24;s:3:\"qty\";i:1;s:4:\"name\";s:9:\"product_6\";s:5:\"price\";d:199;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-02-18 16:41:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refender') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_order_id_foreign` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 15, 'cod', 'pending', '2022-02-14 18:30:08', '2022-02-14 18:30:08'),
(2, 4, 19, 'cod', 'pending', '2022-02-14 21:34:06', '2022-02-14 21:34:06'),
(3, 1, 20, 'cod', 'pending', '2022-02-15 09:19:01', '2022-02-15 09:19:01'),
(4, 1, 21, 'cod', 'pending', '2022-02-15 11:10:52', '2022-02-15 11:10:52'),
(5, 11, 45, 'card', 'approved', '2022-02-15 18:27:48', '2022-02-15 18:27:48'),
(6, 11, 48, 'card', 'approved', '2022-02-15 18:34:55', '2022-02-15 18:34:55'),
(7, 5, 49, 'cod', 'pending', '2022-02-16 07:56:32', '2022-02-16 07:56:32'),
(8, 2, 50, 'cod', 'pending', '2022-02-16 07:57:28', '2022-02-16 07:57:28'),
(9, 2, 51, 'cod', 'pending', '2022-02-16 08:00:15', '2022-02-16 08:00:15'),
(10, 2, 52, 'card', 'approved', '2022-02-16 08:11:26', '2022-02-16 08:11:26'),
(11, 4, 53, 'cod', 'pending', '2022-02-16 12:35:48', '2022-02-16 12:35:48'),
(12, 4, 54, 'cod', 'pending', '2022-02-16 19:11:07', '2022-02-16 19:11:07'),
(13, 4, 55, 'card', 'approved', '2022-02-16 19:11:42', '2022-02-16 19:11:42'),
(14, 4, 56, 'card', 'approved', '2022-02-16 19:16:21', '2022-02-16 19:16:21'),
(15, 4, 58, 'card', 'approved', '2022-02-16 19:19:36', '2022-02-16 19:19:36'),
(16, 4, 59, 'cod', 'pending', '2022-02-16 19:30:22', '2022-02-16 19:30:22'),
(17, 4, 60, 'cod', 'pending', '2022-02-16 19:57:19', '2022-02-16 19:57:19'),
(18, 4, 61, 'cod', 'pending', '2022-02-16 20:03:39', '2022-02-16 20:03:39'),
(19, 4, 62, 'card', 'approved', '2022-02-16 20:04:41', '2022-02-16 20:04:41'),
(20, 4, 67, 'cod', 'pending', '2022-02-16 21:07:33', '2022-02-16 21:07:33'),
(21, 4, 68, 'cod', 'pending', '2022-02-16 21:09:05', '2022-02-16 21:09:05'),
(22, 4, 69, 'cod', 'pending', '2022-02-16 21:12:15', '2022-02-16 21:12:15'),
(23, 4, 70, 'cod', 'pending', '2022-02-16 21:14:44', '2022-02-16 21:14:44'),
(24, 4, 71, 'cod', 'pending', '2022-02-16 21:16:31', '2022-02-16 21:16:31'),
(25, 4, 72, 'cod', 'pending', '2022-02-16 21:18:21', '2022-02-16 21:18:21'),
(26, 4, 73, 'cod', 'pending', '2022-02-16 21:32:34', '2022-02-16 21:32:34'),
(27, 4, 74, 'cod', 'pending', '2022-02-16 21:44:24', '2022-02-16 21:44:24'),
(28, 4, 75, 'cod', 'pending', '2022-02-16 21:53:28', '2022-02-16 21:53:28'),
(29, 4, 76, 'cod', 'pending', '2022-02-16 21:57:32', '2022-02-16 21:57:32'),
(30, 4, 77, 'cod', 'pending', '2022-02-16 22:01:52', '2022-02-16 22:01:52'),
(31, 4, 78, 'cod', 'pending', '2022-02-16 22:05:49', '2022-02-16 22:05:49'),
(32, 4, 79, 'cod', 'pending', '2022-02-16 22:10:52', '2022-02-16 22:10:52'),
(33, 4, 80, 'cod', 'pending', '2022-02-16 22:12:05', '2022-02-16 22:12:05'),
(34, 4, 81, 'cod', 'pending', '2022-02-16 22:12:42', '2022-02-16 22:12:42'),
(35, 4, 82, 'cod', 'pending', '2022-02-16 22:24:58', '2022-02-16 22:24:58'),
(36, 4, 83, 'cod', 'pending', '2022-02-16 22:37:25', '2022-02-16 22:37:25'),
(37, 4, 85, 'cod', 'pending', '2022-02-16 22:49:54', '2022-02-16 22:49:54'),
(38, 4, 101, 'card', 'approved', '2022-02-16 23:45:21', '2022-02-16 23:45:21'),
(39, 4, 102, 'cod', 'pending', '2022-02-16 23:59:26', '2022-02-16 23:59:26'),
(40, 4, 103, 'cod', 'pending', '2022-02-17 00:01:55', '2022-02-17 00:01:55'),
(41, 4, 104, 'cod', 'pending', '2022-02-17 00:03:25', '2022-02-17 00:03:25'),
(42, 2, 105, 'cod', 'pending', '2022-02-17 00:12:49', '2022-02-17 00:12:49'),
(43, 2, 106, 'card', 'approved', '2022-02-17 00:13:46', '2022-02-17 00:13:46'),
(44, 4, 107, 'cod', 'pending', '2022-02-17 19:29:55', '2022-02-17 19:29:55'),
(45, 4, 108, 'cod', 'pending', '2022-02-17 19:36:32', '2022-02-17 19:36:32'),
(46, 5, 109, 'cod', 'pending', '2022-02-18 15:38:10', '2022-02-18 15:38:10'),
(47, 5, 110, 'card', 'approved', '2022-02-18 15:39:23', '2022-02-18 15:39:23'),
(48, 5, 111, 'cod', 'pending', '2022-02-18 15:46:53', '2022-02-18 15:46:53'),
(49, 5, 112, 'card', 'approved', '2022-02-18 15:47:59', '2022-02-18 15:47:59'),
(50, 5, 113, 'cod', 'pending', '2022-02-18 16:03:40', '2022-02-18 16:03:40'),
(51, 5, 114, 'cod', 'pending', '2022-02-18 16:04:21', '2022-02-18 16:04:21'),
(52, 5, 115, 'card', 'approved', '2022-02-18 16:05:01', '2022-02-18 16:05:01'),
(53, 5, 116, 'card', 'approved', '2022-02-18 16:40:18', '2022-02-18 16:40:18'),
(54, 5, 117, 'cod', 'pending', '2022-02-18 16:41:08', '2022-02-18 16:41:08'),
(55, 4, 118, 'cod', 'pending', '2022-02-19 08:32:38', '2022-02-19 08:32:38'),
(56, 4, 119, 'cod', 'pending', '2022-02-19 10:46:26', '2022-02-19 10:46:26'),
(57, 4, 120, 'cod', 'pending', '2022-02-21 14:31:16', '2022-02-21 14:31:16');

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
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Costomer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$.ONASqv/TSMR0pKUx5/Ge.cc4zZxb4D2axJuoURk/wsw2sIHpOBvi', NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-02-11 18:26:43', '2022-02-11 18:26:43'),
(2, 'radouane', 'atamousse.red@gmail.com', NULL, '$2y$10$zLpf5j74lh3ZIfDARyvf4.p/5pT5eMimZQAhsShD7KxoCV/ffxKam', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-12 08:22:17', '2022-02-12 08:22:17'),
(3, 'ahmed', 'ahmed@example.com', NULL, '$2y$10$q5iHoV7bMsz.8JLBQGhWfuhqM1a3cLrLDbUifDhOAvkFtIQ2kptyi', NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-02-12 08:52:26', '2022-02-12 08:52:26'),
(4, 'admin', 'admin@admin.com', NULL, '$2y$10$8dTB3iH4UOLOvpF6qeeRIes9w1Tbdc3Y90sBcEVlIQg1m8Ihd1jo2', NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-02-12 09:20:39', '2022-02-12 09:20:39'),
(5, 'user1', 'user1@me.com', NULL, '$2y$10$UETKPUBN3Wc815NpvVLvuubQf9mXRAN9rB/nBxzV/EeYJ.8i.Zw/a', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-14 18:04:15', '2022-02-14 18:04:15'),
(6, 'red1', 'rado@me.com', NULL, '$2y$10$bbIZJKR3lxgpmbNKwI7zJe/ggkrZiAyl4le7EzMcn86CEJXetG97q', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-15 14:06:08', '2022-02-15 14:06:08'),
(7, 'red2', 'me@mee.com', NULL, '$2y$10$AezkCCGgxhkZahTn6KNCCeXR0qHjW345iWu36rqoc2NHORPubupyi', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-15 14:06:42', '2022-02-15 14:06:42'),
(8, 'dashborad', 'k@k.com', NULL, '$2y$10$UvQGHR944omTtXUSrjokTO6JFk0akJGuko5DQqH1V5hDTybYNH2Me', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-15 14:09:41', '2022-02-15 14:09:41'),
(9, 'ASMA TAMOUSS', 'w@w.com', NULL, '$2y$10$/H.OUZ0CgW/E5UBVZ9hXduQkEThGEc.40t6qqNURJMQUuHEydBGa6', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-15 14:14:52', '2022-02-15 14:14:52'),
(10, 'mek', 'me@meedd.com', NULL, '$2y$10$YjPnSVZLOdvQQ72ZS421EuWBV/WpyHt13wZ90li14cfZ790ZbRP3a', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-15 14:15:41', '2022-02-15 14:15:41'),
(11, 'radouane', 'kdkd@kdk.com', NULL, '$2y$10$P9VmrqjNRkx6troPnZITPu5TxT4SLArQ1cyGDQ01k70e08fpL1YMG', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-02-15 14:17:09', '2022-02-15 14:17:09');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
