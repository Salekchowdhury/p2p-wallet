-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2023 at 10:12 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p2p_wallet_system`
--
CREATE DATABASE IF NOT EXISTS `p2p_wallet_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `p2p_wallet_system`;

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credits`
--

INSERT INTO `credits` (`id`, `currency`, `balance`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'USD', '100', 1, '2022-04-20 18:25:23', '2022-04-26 17:32:15'),
(2, 'USD', '200', 3, '2023-02-01 13:52:10', '2023-02-02 13:52:15'),
(3, 'USD', '100', 2, '2022-04-20 18:25:23', '2022-04-26 17:32:15'),
(5, 'usd', NULL, 2, '2023-02-22 10:39:42', '2023-02-22 10:39:42'),
(6, 'usd', '1234', 2, '2023-02-22 10:41:18', '2023-02-22 10:41:18'),
(7, 'usd', '8574', 2, '2023-02-22 10:42:49', '2023-02-22 10:42:49'),
(8, 'usd', '8510', NULL, '2023-02-22 11:05:33', '2023-02-22 11:05:33'),
(9, 'usd', '8520', NULL, '2023-02-22 11:07:07', '2023-02-22 11:07:07'),
(10, 'usd', '8521', NULL, '2023-02-22 11:11:52', '2023-02-22 11:11:52'),
(11, 'usd', '8526', NULL, '2023-02-22 11:17:37', '2023-02-22 11:17:37'),
(12, 'usd', '8528', NULL, '2023-02-22 11:18:34', '2023-02-22 11:18:34'),
(13, 'usd', '100', NULL, '2023-02-22 11:19:29', '2023-02-22 11:19:29'),
(14, 'usd', '107.356637', NULL, '2023-02-22 11:23:27', '2023-02-22 11:23:27'),
(15, 'eur', '345', NULL, '2023-02-22 11:29:34', '2023-02-22 11:29:34'),
(16, 'Aud', '450', NULL, '2023-02-23 00:18:19', '2023-02-23 00:18:19'),
(17, 'eur', '233', NULL, '2023-02-23 02:21:07', '2023-02-23 02:21:07'),
(18, 'eur', '334', NULL, '2023-02-23 02:42:23', '2023-02-23 02:42:23'),
(19, 'eur', '56', NULL, '2023-02-23 02:43:08', '2023-02-23 02:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `credit_id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` int(11) NOT NULL,
  `cash_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `sender_id`, `receiver_id`, `credit_id`, `currency`, `balance`, `cash_id`, `cash_out`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 2, '500', 500, '200', '5', '2023-02-22 09:29:50', '2023-02-22 09:29:50'),
(2, 2, 3, 2, '500', 500, '200', '5', '2023-02-22 09:31:25', '2023-02-22 09:31:25'),
(3, 2, 3, 2, '500', 500, '200', '5', '2023-02-22 09:33:56', '2023-02-22 09:33:56'),
(4, 2, 3, 2, '500', 500, '200', '5', '2023-02-22 09:35:56', '2023-02-22 09:35:56'),
(5, 2, 3, 2, '500', 500, '200', '5', '2023-02-22 09:36:02', '2023-02-22 09:36:02'),
(6, 5, 3, 2, '500', 500, '200', '5', '2023-02-22 09:38:03', '2023-02-22 09:38:03'),
(7, 5, 3, 2, '500', 500, '200', '5', '2023-02-22 09:38:33', '2023-02-22 09:38:33'),
(8, 5, 3, 2, '500', 500, '200', '5', '2023-02-22 09:41:22', '2023-02-22 09:41:22'),
(9, 5, 3, 2, '500', 500, '200', '5', '2023-02-22 09:42:38', '2023-02-22 09:42:38'),
(10, 5, 3, 2, '500', 500, '200', '5', '2023-02-22 09:46:23', '2023-02-22 09:46:23'),
(11, 3, 3, 2, '500', 500, '200', '5', '2023-02-22 09:46:24', '2023-02-22 09:46:24'),
(12, 3, 3, 2, '500', 500, '200', '5', '2023-02-22 09:48:22', '2023-02-22 09:48:22'),
(13, 3, 3, 2, '500', 500, '200', '5', '2023-02-22 09:49:23', '2023-02-22 09:49:23'),
(14, 3, 3, 2, '500', 500, '200', '5', '2023-02-22 09:58:52', '2023-02-22 09:58:52'),
(15, 12, 2, 8, 'usd', 8510, NULL, 'out', '2023-02-22 11:05:34', '2023-02-22 11:05:34'),
(16, 12, 2, 9, 'usd', 8520, NULL, 'out', '2023-02-22 11:07:10', '2023-02-22 11:07:10'),
(17, 12, 2, 10, 'usd', 8521, NULL, 'out', '2023-02-22 11:11:53', '2023-02-22 11:11:53'),
(18, 12, 2, 11, 'usd', 8526, NULL, 'out', '2023-02-22 11:17:37', '2023-02-22 11:17:37'),
(19, 12, 2, 12, 'usd', 8528, NULL, 'out', '2023-02-22 11:18:35', '2023-02-22 11:18:35'),
(20, 12, 2, 13, 'usd', 106, NULL, 'out', '2023-02-22 11:19:30', '2023-02-22 11:19:30'),
(21, 12, 2, 14, 'usd', 101, NULL, 'out', '2023-02-22 11:23:27', '2023-02-22 11:23:27'),
(22, 12, 2, 15, 'eur', 345, NULL, 'out', '2023-02-22 11:29:34', '2023-02-22 11:29:34'),
(23, 2, 1, 16, 'Aud', 450, NULL, 'out', '2023-02-23 00:18:19', '2023-02-23 00:18:19'),
(24, 2, 3, 17, 'eur', 233, NULL, 'out', '2023-02-23 02:21:07', '2023-02-23 02:21:07'),
(25, 2, 3, 18, 'eur', 334, NULL, 'out', '2023-02-23 02:42:23', '2023-02-23 02:42:23'),
(26, 2, 3, 19, 'eur', 56, NULL, 'out', '2023-02-23 02:43:08', '2023-02-23 02:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2014_10_12_000000_create_users_table', 2),
(9, '2023_02_19_055225_create_credits_table', 2),
(15, '2023_02_22_132136_create_deposits_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '3f164097bbf22094c4e67fc73f5d233e2415df51db1f72d3433d57478363b2cc', '[\"*\"]', NULL, '2023-02-19 12:17:37', '2023-02-19 12:17:37'),
(2, 'App\\Models\\User', 1, 'token', '9c7df76da00887b2e3e90caaa028e7a677fa786fe6b2edae6f384546ba21d993', '[\"*\"]', NULL, '2023-02-20 05:34:18', '2023-02-20 05:34:18'),
(3, 'App\\Models\\User', 1, 'token', '67f42363ba498796550d083f36d51e0b898797a2a47a1bf833162d483cec5b5c', '[\"*\"]', NULL, '2023-02-20 05:40:00', '2023-02-20 05:40:00'),
(4, 'App\\Models\\User', 1, 'token', 'a78d4bf28fb069bdef847dcd64be41273129059e4485919b422d46222546ac62', '[\"*\"]', NULL, '2023-02-20 05:40:10', '2023-02-20 05:40:10'),
(5, 'App\\Models\\User', 1, 'token', 'abeb1a20ffb5d6649e216b64f448a0a8056d819042e2de6618a9c9fe3bbd9c2f', '[\"*\"]', NULL, '2023-02-20 05:46:57', '2023-02-20 05:46:57'),
(6, 'App\\Models\\User', 1, 'token', '54179c7bbf8436c818f993790fa16a0a7e2e81227e3b816a73ed6f90b8eab528', '[\"*\"]', NULL, '2023-02-20 05:53:19', '2023-02-20 05:53:19'),
(7, 'App\\Models\\User', 1, 'token', '8d0c4ef3bf9ed69f948b28de06064f22a62aad6d6f9929071e0bb9d2a3e296d8', '[\"*\"]', NULL, '2023-02-20 05:55:39', '2023-02-20 05:55:39'),
(8, 'App\\Models\\User', 1, 'token', 'e062cd0e58520ca22f61f8362158ca90235d822b3943b06882e888d45b102303', '[\"*\"]', NULL, '2023-02-20 05:56:47', '2023-02-20 05:56:47'),
(9, 'App\\Models\\User', 1, 'token', '52c511e7bf6d7e96eb9debd0a92098b4290498aeec6e78fe55e1013fe3441d1d', '[\"*\"]', NULL, '2023-02-20 05:58:15', '2023-02-20 05:58:15'),
(10, 'App\\Models\\User', 1, 'token', 'f50682f7d43697228ec692686a4ecceccd4460a80c35dcb54425346d91267357', '[\"*\"]', NULL, '2023-02-20 05:58:49', '2023-02-20 05:58:49'),
(11, 'App\\Models\\User', 1, 'token', '5ee5a848082a2888f69a3d8c37f00dc80c4d1260ab018eac8ba1b89f3bd5411c', '[\"*\"]', NULL, '2023-02-20 06:00:04', '2023-02-20 06:00:04'),
(12, 'App\\Models\\User', 1, 'token', '7334a007ad194c3648876e27776f5b49460ec6732775fe0ab9be030e278eef66', '[\"*\"]', NULL, '2023-02-20 06:00:21', '2023-02-20 06:00:21'),
(13, 'App\\Models\\User', 11, 'token', '26c5041e844c2bda5a9e19afc72cc779cb556b4840591cd568d7e476aa4ea9bc', '[\"*\"]', NULL, '2023-02-20 23:11:44', '2023-02-20 23:11:44'),
(14, 'App\\Models\\User', 11, 'token', '490844278fe0c9bb3223311f1b984359e5caeb3a322477aff58ac306abfff297', '[\"*\"]', NULL, '2023-02-20 23:13:13', '2023-02-20 23:13:13'),
(15, 'App\\Models\\User', 11, 'token', '9ffaacc3b808109feb7037f066617dafa382c63d789732100d32f22f7736b74b', '[\"*\"]', NULL, '2023-02-20 23:17:48', '2023-02-20 23:17:48'),
(16, 'App\\Models\\User', 11, 'token', 'a505e2663bedcd439b68fd0908c310207e801458395e9e09a19898ff4d23e5e7', '[\"*\"]', NULL, '2023-02-20 23:17:57', '2023-02-20 23:17:57'),
(17, 'App\\Models\\User', 11, 'token', '531ddca9fc02b254c2ca75527d249149b4f7539a78194a5db8534cfb6ff46fa9', '[\"*\"]', NULL, '2023-02-20 23:18:00', '2023-02-20 23:18:00'),
(18, 'App\\Models\\User', 11, 'token', '591714b18201f2a78c06e21909582602a6966af54fbffc170b8bb5272245f0d5', '[\"*\"]', NULL, '2023-02-20 23:18:20', '2023-02-20 23:18:20'),
(19, 'App\\Models\\User', 11, 'token', '2c75e1b4a6888e50337fbb0184b1b6aeeaa0bd574a54de9858647a277de2fd69', '[\"*\"]', NULL, '2023-02-20 23:19:08', '2023-02-20 23:19:08'),
(20, 'App\\Models\\User', 11, 'token', 'a27335ba44e4e5340cfaa438a8591e7043cc42a57653383bd80f8dc3e02b2aaa', '[\"*\"]', NULL, '2023-02-20 23:19:24', '2023-02-20 23:19:24'),
(21, 'App\\Models\\User', 11, 'token', 'd122c16e01730f77868fde9c55fb7610f44df7fc23c89fc23ae6d5d906ca90d0', '[\"*\"]', NULL, '2023-02-20 23:55:02', '2023-02-20 23:55:02'),
(22, 'App\\Models\\User', 11, 'token', '23ec9b344535c08f5dec6d71944fe34b31e4a209b55f8e880fd61035eeb6b485', '[\"*\"]', NULL, '2023-02-20 23:55:38', '2023-02-20 23:55:38'),
(23, 'App\\Models\\User', 11, 'token', 'af07a12be7040c94d27997540a42629dc509c599d4ccf67204267098d2c2b1ed', '[\"*\"]', NULL, '2023-02-21 12:53:54', '2023-02-21 12:53:54'),
(24, 'App\\Models\\User', 11, 'token', '91f660150d440834278509b5e9378719cb59138d68f287e331eca47bd7a1124e', '[\"*\"]', NULL, '2023-02-21 13:09:15', '2023-02-21 13:09:15'),
(25, 'App\\Models\\User', 11, 'token', '90e749c667f6d1d85e4f2105862b824f5cf646be160e03b612905902b8286cff', '[\"*\"]', NULL, '2023-02-21 13:11:44', '2023-02-21 13:11:44'),
(26, 'App\\Models\\User', 11, 'token', '20a6ab2a4649ebd06d0a57643c3cae0e781695f04968320b5976c68e0dd7a1b1', '[\"*\"]', NULL, '2023-02-21 13:13:05', '2023-02-21 13:13:05'),
(27, 'App\\Models\\User', 11, 'token', 'b14820dcc002949d4cf3397ee8e96fb79e6358991b1f242c098a5a814d840ce4', '[\"*\"]', NULL, '2023-02-21 13:13:52', '2023-02-21 13:13:52'),
(28, 'App\\Models\\User', 12, 'token', '5dea7e53a2a9e575ceade76b65ee52f767fdb124b6f8d838e6a45488f3156fad', '[\"*\"]', NULL, '2023-02-21 13:35:53', '2023-02-21 13:35:53'),
(29, 'App\\Models\\User', 12, 'token', '526f6192c7e123a86f24476f4f1d9c2ca2e7c420c91868067a3a1baa165a10d6', '[\"*\"]', NULL, '2023-02-21 13:37:08', '2023-02-21 13:37:08'),
(30, 'App\\Models\\User', 12, 'token', 'd8819cad893a2e0c27be4e44ab5919512f69610447704ed5b346d65a4d596a9c', '[\"*\"]', NULL, '2023-02-22 12:07:52', '2023-02-22 12:07:52'),
(31, 'App\\Models\\User', 12, 'token', 'df2da8a3e25ce7d9fab198aec598e531b1205828a8ae8294b3e2e3ed0d090297', '[\"*\"]', NULL, '2023-02-22 12:08:37', '2023-02-22 12:08:37'),
(32, 'App\\Models\\User', 2, 'token', '24ea125859d945ee410952f3eb212028b5d524b02dbaccc6fcc57985e9299934', '[\"*\"]', NULL, '2023-02-22 23:01:20', '2023-02-22 23:01:20'),
(33, 'App\\Models\\User', 2, 'token', '85fa0f4acd75fbdc1d495d9d0b9c25212432ca95c824c5d6c9fbc76584600d59', '[\"*\"]', NULL, '2023-02-22 23:03:37', '2023-02-22 23:03:37'),
(34, 'App\\Models\\User', 2, 'token', 'b730eb1c24a4209432283af58664e08514117b8f36ef303d75c81d936d2dbcd7', '[\"*\"]', NULL, '2023-02-22 23:06:00', '2023-02-22 23:06:00'),
(35, 'App\\Models\\User', 2, 'token', '2d1daa488f1b4be069a45248afa15c7d2981cdb1bdeab437feb28542e5921cc9', '[\"*\"]', NULL, '2023-02-22 23:06:33', '2023-02-22 23:06:33'),
(36, 'App\\Models\\User', 2, 'token', 'cc343eacef326c295c1e7fcd7766178c2971a6f895ab7a36269ab52c8147e2d3', '[\"*\"]', NULL, '2023-02-22 23:06:58', '2023-02-22 23:06:58'),
(37, 'App\\Models\\User', 2, 'token', 'ef449662803ae6586d2fa13ae95f4efe6eeca0d47c8dd6ce1b29d327dc8cb9b8', '[\"*\"]', NULL, '2023-02-22 23:09:13', '2023-02-22 23:09:13'),
(38, 'App\\Models\\User', 12, 'token', '643164e97694f0238364c512c9eacf14e0485e615410585b3cca073270919689', '[\"*\"]', NULL, '2023-02-22 23:11:58', '2023-02-22 23:11:58'),
(39, 'App\\Models\\User', 12, 'token', 'c0cbc1b19c196f86c9678042c13e455ff5d06f834b3f4105b1549956a994d7aa', '[\"*\"]', NULL, '2023-02-22 23:12:55', '2023-02-22 23:12:55'),
(40, 'App\\Models\\User', 12, 'token', 'ef338b10a79121399d7ac519a54a2b57203ec3de85bf258f4a86f67fc339a222', '[\"*\"]', NULL, '2023-02-22 23:24:56', '2023-02-22 23:24:56'),
(41, 'App\\Models\\User', 12, 'token', '7193b7c6bcd717a8c2e0a7244373514ba2e75b119a84fb71cdd89afef5c9e07d', '[\"*\"]', NULL, '2023-02-22 23:28:26', '2023-02-22 23:28:26'),
(42, 'App\\Models\\User', 12, 'token', '6d708929558982f4e1e178def44923110b33b437c799cf396fd7d46e139612f4', '[\"*\"]', NULL, '2023-02-22 23:30:19', '2023-02-22 23:30:19'),
(43, 'App\\Models\\User', 2, 'token', '051bdf0c9aa2649407290e10ff7bdee0e780c00e19a3ee182707d0bc71e3c6e0', '[\"*\"]', NULL, '2023-02-22 23:31:12', '2023-02-22 23:31:12'),
(44, 'App\\Models\\User', 12, 'token', '4cce69a1ba76b3eb2157759d001d99cc408e785ef38b451171caf2a0e1a60952', '[\"*\"]', NULL, '2023-02-23 03:00:07', '2023-02-23 03:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usd',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `currency`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sanford Johnston III s', 'ss.titus@example.org', 'Aud', 'admin', NULL, '$2y$10$C9Nk8Z4MKp78Lh8YLip0kuvGH66cYyM9lySj5ENbR.YUVUqoEDuDm', NULL, '2023-02-21 13:30:01', '2023-02-21 23:26:54'),
(2, 'Riley Tromp', 'customer@gmail.com', 'eur', 'customer', NULL, '$2y$10$5TKnqVl19w/AycNh1YI3iO7Z6KZ6PMgVSNeKDD6XKd32JE32.pNT6', NULL, '2023-02-21 13:30:01', '2023-02-21 13:30:01'),
(3, 'Vidal Osinski', 'roslyn31@example.org', 'eur', 'customer', NULL, '$2y$10$KYzIXDczK2U/mEYpZyfwDuqHBz4jxEjxdo16B1G0Viad9eHb.KJCC', NULL, '2023-02-21 13:30:01', '2023-02-22 05:45:54'),
(5, 'Dr. Ari Murazik PhD', 'ybayer@example.com', 'usd', 'customer', NULL, '$2y$10$v7ezZED5a/S91ppVZm4tpu34IdH3JIfhwHAVtG4fP99RhxqwRJdlG', NULL, '2023-02-21 13:30:01', '2023-02-21 13:30:01'),
(6, 'Mrs. Desiree Swift', 'beahan.ed@example.org', 'usd', 'customer', NULL, '$2y$10$gX1azQqVo4L/9kdc/ijxouJICteltmyvqW355BAANh5qQ1/9ddKyy', NULL, '2023-02-21 13:30:01', '2023-02-21 13:30:01'),
(10, 'Darrin Schinner III', 'isadore.oberbrunner@example.net', 'usd', 'customer', NULL, '$2y$10$mZZcq.RfHksAjQ5y7pqYWe/lTakwBv21KGRUgYlz/D8o3TYh2x6KC', NULL, '2023-02-21 13:30:01', '2023-02-21 13:30:01'),
(12, 'Md Salek Chowdhury', 'super.admin@gmail.com', 'usd', 'super-admin', NULL, '$2y$10$Z3RBEz07BtyjALQv3Qk6KO100o8x3Eo7gDZBD4pVJ8GoPEqwg3IUq', NULL, '2023-02-21 13:35:36', '2023-02-21 13:35:36'),
(55, 'Dr. Name Turner', 'tkling@example.net', 'usd', 'customer', NULL, '$2y$10$XBOON0C.6q5vvAJmKVem7eiiYN35.MMatmNUYsgQwwEixVQYUJNY2', NULL, '2023-02-22 12:00:20', '2023-02-22 12:00:20'),
(56, 'Polly Hessel', 'casper.stehr@example.org', 'usd', 'customer', NULL, '$2y$10$2JqB.oMhViDhTZ9wSumccu0e6pBtlDOFbBI94uPAeMqUQ.h1pJMEm', NULL, '2023-02-22 12:00:20', '2023-02-22 12:00:20'),
(57, 'Veronica Wilkinson', 'wayne50@example.net', 'usd', 'customer', NULL, '$2y$10$qiscFB5ppmgIjTCyPMoly.JAynNTlhLsQ.cvpD0dqmeTmcUHiBrnq', NULL, '2023-02-22 12:00:20', '2023-02-22 12:00:20'),
(58, 'Dr. Kurtis O\'Kon', 'anita06@example.net', 'usd', 'customer', NULL, '$2y$10$fwxuh80EbBEzKGJZORr4kOploV3cDW1mJOwPPk7VnwR4.sQ0l4NC2', NULL, '2023-02-22 12:00:20', '2023-02-22 12:00:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credits_user_id_foreign` (`user_id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_sender_id_foreign` (`sender_id`),
  ADD KEY `deposits_receiver_id_foreign` (`receiver_id`),
  ADD KEY `deposits_credit_id_foreign` (`credit_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credits`
--
ALTER TABLE `credits`
  ADD CONSTRAINT `credits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_credit_id_foreign` FOREIGN KEY (`credit_id`) REFERENCES `credits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposits_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposits_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
