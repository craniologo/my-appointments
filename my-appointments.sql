-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 10, 2022 at 10:53 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my-appointments`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialty_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `scheduled_date` date NOT NULL,
  `scheduled_time` time NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Reservada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `description`, `specialty_id`, `doctor_id`, `patient_id`, `scheduled_date`, `scheduled_time`, `type`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Holaaaaaaaaaaaaa', 3, 3, 2, '2022-03-24', '09:00:00', 'Examen', '2022-03-19 21:01:15', '2022-03-19 21:01:15', 'Reservada');

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
(71, '2014_10_12_000000_create_users_table', 1),
(72, '2014_10_12_100000_create_password_resets_table', 1),
(73, '2022_02_16_135734_create_specialties_table', 1),
(74, '2022_03_05_221220_create_work_days_table', 1),
(75, '2022_03_11_123400_create_appointments_table', 1),
(76, '2022_03_11_140135_create_specialty_user_table', 1),
(77, '2022_04_02_044049_add_status_to_appointments', 2);

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
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Oftalmología', NULL, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(2, 'Pediatría', NULL, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(3, 'Neurología', NULL, '2022-03-19 03:58:12', '2022-03-19 03:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `specialty_user`
--

CREATE TABLE `specialty_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `specialty_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specialty_user`
--

INSERT INTO `specialty_user` (`id`, `user_id`, `specialty_id`, `created_at`, `updated_at`) VALUES
(1, 54, 1, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(2, 55, 1, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(3, 56, 1, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(4, 57, 2, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(5, 58, 2, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(6, 59, 2, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(7, 60, 3, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(8, 61, 3, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(9, 62, 3, '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(10, 3, 3, '2022-03-19 03:58:12', '2022-03-19 03:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `dni`, `address`, `phone`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Juan Ramos', 'hola@programacionymas.com', NULL, '$2y$10$ooNmGCI0eyfkWaYL3cbpsegF4QH53S1YjP7cnueKVquso6yWpX/9C', NULL, NULL, NULL, 'admin', NULL, '2022-03-19 03:58:11', '2022-03-19 03:58:11'),
(2, 'Paciente Test', 'patient@programacionymas.com', NULL, '$2y$10$nVkascbxluP2wCLaIQLt9Oyp66zHQg5byUydtyEuh1fN3/2tqckGC', NULL, NULL, NULL, 'patient', 'CWqfCTeLnO2gJeKoEtxEUAA7UP6T1yYMkUn9mwJReuPSfSJkVGyxxnBvXgJs', '2022-03-19 03:58:11', '2022-03-19 03:58:11'),
(3, 'Médico Test', 'doctor@programacionymas.com', NULL, '$2y$10$C4z5V2nSUgPcxz60HqKqmOWNbd7k8tpRYoydBBx4JDcc48ct6pyUW', NULL, NULL, NULL, 'doctor', 'NkxdIncd1kY0gIBCGK3FbGmYQQC5pYp9DCtJlLrpEAYDlt2FzbfkMTW2gtwS', '2022-03-19 03:58:11', '2022-03-19 03:58:11'),
(4, 'Reymundo Fadel', 'mcdermott.monique@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '88979016', '6392 Moore Harbor\nPort Haileetown, IL 45140', '+8162882431522', 'patient', 'MEuHGuj9yT', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(5, 'Ken Mitchell', 'kevin58@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '82059009', '685 Desmond Courts\nEast Carmelburgh, TX 02906-9274', '+7725729902060', 'patient', 'vCpB2DegIM', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(6, 'Elise Satterfield', 'gay.graham@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '82999957', '3186 Amalia Plaza\nMcClurefort, LA 22750-8087', '+1235144880547', 'patient', 'IU9NVqyLLz', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(7, 'Mrs. Hannah Koss V', 'ulesch@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '42015699', '3015 Rosalinda Flat\nWhiteview, SC 59750-4107', '+7231616737514', 'patient', 'Gwu3D8myvc', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(8, 'Prof. Bryce Corwin I', 'jammie.boyer@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '30134850', '8187 Valentine Vista Suite 419\nVerniceborough, MA 32385', '+3390967840870', 'patient', 'NZFSktoOvu', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(9, 'Fiona Hessel', 'helga02@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '12925992', '977 Raynor Ports\nWandastad, PA 66628-2368', '+7213327481861', 'patient', '9oO81h1lYD', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(10, 'Mr. Jeffery Morissette Jr.', 'rau.loma@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '91577876', '336 Gottlieb Track\nWelchview, NY 76393-9343', '+5039755975628', 'patient', 'IvaNIrQ66l', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(11, 'Mr. Louisa Jones', 'jillian32@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '60548790', '641 Goodwin Isle Apt. 180\nPort Whitney, TN 44899-7264', '+7753690926882', 'patient', 'ebSRjfSLHl', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(12, 'Miss Emelia Jacobs', 'nigel12@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '12973242', '4184 Schneider Station Apt. 846\nNew Israelchester, NE 63897', '+6012159208080', 'patient', 'MaB61OmOJJ', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(13, 'Dr. Edward Parisian I', 'gusikowski.peter@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '42033666', '83728 O\'Connell Oval\nEmmerichshire, ND 84141', '+9018921850863', 'patient', 'HuuVUOnJXa', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(14, 'Mrs. Emmy Flatley', 'alisha72@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '71678223', '134 Lowe Wall Suite 838\nNorth Bartonshire, GA 73357', '+4838145524489', 'patient', '7mAureIitI', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(15, 'Bobbie Hartmann PhD', 'sigurd97@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '79230167', '15931 Betty Streets Suite 814\nNew Kathlynport, RI 64581-6635', '+1955221928680', 'patient', 'BqirsFCGxG', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(16, 'Ms. Destinee Grimes', 'jerrell52@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '63167157', '861 O\'Kon Squares Suite 245\nMorissetteton, WI 10563', '+8617282408910', 'patient', 'zEcNsvyt4B', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(17, 'Prof. Lois Kautzer', 'hazle.roberts@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '22950527', '7151 Alfonso Ridges\nCollinburgh, FL 82995', '+6558821359664', 'patient', 'j9RONWiF4G', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(18, 'Virgie Lueilwitz Sr.', 'donnelly.darian@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '45878122', '44625 Linwood Stream Apt. 472\nWest Stephania, WV 39931', '+3873595259365', 'patient', 'RN9RXE7vdd', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(19, 'Mark Stanton', 'fcrona@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '18918448', '68289 Josiah Creek\nPort Alek, DE 49703', '+4809791586031', 'patient', 'E7wjwwbhcb', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(20, 'Vern Mitchell', 'emmy91@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '48569174', '105 Ratke Groves Apt. 043\nCecelialand, WI 70618-0500', '+1928556471011', 'patient', 'Vj4RStskLB', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(21, 'Tania Rogahn Jr.', 'koepp.billie@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '60432211', '841 Paucek Road Suite 669\nEast Oralfort, UT 38910-8359', '+1234827647689', 'patient', 'pMLTHJE2G2', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(22, 'Al Zieme', 'gwill@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '60329791', '912 Mekhi Coves\nLake Gerardoburgh, PA 25188', '+9177958658221', 'patient', 'k05foG39IO', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(23, 'Mr. Bradly Hilpert IV', 'kari35@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '38362763', '63803 Alexandrine Curve\nNorth Christopheburgh, MI 02404', '+7339644436478', 'patient', 'K6NMw0wmup', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(24, 'Miss Letitia Bechtelar IV', 'anderson.christy@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '22694793', '9671 McKenzie Forks Suite 666\nNorth Lottie, HI 02885', '+7185250959912', 'patient', 'wFakVutgQD', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(25, 'Dr. Osborne Smith', 'velda.ferry@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '46636078', '8687 Scarlett Corner Apt. 684\nFisherchester, TX 81297-7201', '+4205171652235', 'patient', '2zdhq538lS', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(26, 'Stanton McGlynn Jr.', 'witting.lavinia@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '89681473', '1213 Lucinda Station\nDietrichborough, CT 32854', '+1308169784903', 'patient', '1igfR1Bvdh', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(27, 'Mrs. Anika Thompson', 'grimes.allison@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '90815875', '58618 Gutmann Keys\nKlockotown, VT 55203-6352', '+8813657725738', 'patient', 'uW3iHbfDoW', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(28, 'Evelyn Huels', 'leuschke.wellington@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '67790375', '811 Ashlynn Parkways Suite 441\nWest Samirstad, KY 18963', '+2362570288785', 'patient', 'tJXHuE9OsJ', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(29, 'Mr. Kennedi Shields III', 'nakia.howell@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '71907096', '7459 Zella Ways\nFurmanmouth, FL 05957', '+8702873409613', 'patient', 'X9tB2IXnUa', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(30, 'Kenna Fay', 'fisher.emiliano@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '70746325', '3811 Eichmann Islands\nSchultzhaven, TN 70536', '+9673788014016', 'patient', 'Z6QlVGKIFy', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(31, 'Prof. Schuyler Orn DVM', 'tromp.bart@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '44957280', '453 Wuckert Tunnel\nPort Fayland, NY 97374-5124', '+9143224380361', 'patient', 'kvEilALsCu', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(32, 'Tara Satterfield', 'fisher.elza@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '54606420', '6789 Ezekiel Lights\nPort Lura, AZ 36292-4337', '+1317820160669', 'patient', 'H3BC5aGUZN', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(33, 'Pablo Bernhard', 'damore.gwen@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '98968857', '9382 Prohaska Plaza Suite 728\nWolffburgh, NV 07658', '+5946872213677', 'patient', 'tK7IURRxrS', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(34, 'Dr. Manley Gibson III', 'schinner.brenna@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '45539475', '355 Lehner Orchard\nJudahside, NH 25390-6404', '+6034613525184', 'patient', 'uosw6MDO5g', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(35, 'Mrs. Sophia Luettgen', 'marlene.greenholt@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '65793172', '4213 Bud Fall\nTillmanburgh, WY 67964-1226', '+6100437056297', 'patient', 'rqCaWIi6pt', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(36, 'Lacy Treutel V', 'orlando.dietrich@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '44626844', '8601 Doyle Lane Apt. 998\nSouth Yadira, LA 78197-9974', '+2660065515592', 'patient', 'JJK4ioaxTz', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(37, 'Sabryna Spinka', 'kuvalis.kaci@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '32317325', '8639 Wintheiser Vista Suite 721\nArmstrongland, NJ 28103-9404', '+5117584106534', 'patient', 'vs479pYEG1', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(38, 'Herbert Frami', 'nbotsford@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '21427949', '84298 Jailyn Parkways\nPort Rhiannonville, IL 18406', '+5004423555073', 'patient', 'OY1T8hvrKx', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(39, 'Boyd Hand', 'connelly.dannie@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '98152828', '168 Brianne Crossroad\nNorth Mateo, KY 33942', '+4897401950136', 'patient', 'J78hZD0oaQ', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(40, 'Prof. Bianka Hayes IV', 'pgorczany@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '60020672', '25207 Schulist Harbors Apt. 656\nPort Tre, SC 28194', '+2238853841677', 'patient', 'QKqi6BQdgv', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(41, 'Jaren O\'Reilly', 'maggie16@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '97937069', '136 Michelle Pines Suite 639\nPort Isabellville, NC 46650', '+5303573407053', 'patient', 'BOHHfGmEAm', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(42, 'Vanessa Daniel', 'hintz.dewitt@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '85941872', '3501 Wunsch Walks\nKayleighville, DC 65800', '+4752624190083', 'patient', '7t8GrmgXoF', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(43, 'Prof. Bruce Jacobi Jr.', 'xwalter@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '36222672', '9321 Weimann Burg Suite 779\nLake Gregg, WI 48587-4904', '+9873444659775', 'patient', 'GukqJaTTRv', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(44, 'Lynn Roob', 'ocie.schmeler@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '85333086', '9760 Eloy Garden\nNew Denisburgh, OH 64400', '+9882563849740', 'patient', 'kosukHw8RD', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(45, 'Dell Gutmann PhD', 'dashawn.donnelly@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '89387357', '4715 Roob Lights\nShieldsberg, CA 88753', '+8362365531088', 'patient', 'yuibM8jjZ8', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(46, 'Annetta Boehm DVM', 'ygaylord@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '41938453', '7967 Mark Neck Suite 782\nWest Juliana, IA 90586', '+2939346671764', 'patient', 'O9usd6C0oW', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(47, 'Bonnie Abbott', 'brittany.huel@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '18354718', '9883 Sterling Underpass Suite 702\nSouth Abe, MS 89341', '+4006140763640', 'patient', '9R0nrBOVIk', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(48, 'Rocky Trantow', 'hyatt.delpha@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '93939809', '14483 Minnie Road\nAlexanechester, RI 64636', '+4955369105496', 'patient', 'JGLSf1whf2', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(49, 'Bette Abbott DDS', 'maxine26@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '39948495', '8215 Michele Cape Apt. 665\nFaustinohaven, VA 46591', '+4603733556974', 'patient', '7frHj52TWc', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(50, 'Laurine Luettgen III', 'annamae81@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '42446143', '88275 Hayes Viaduct Suite 575\nLeoniestad, AK 29364', '+8219355744304', 'patient', 'viwqh5puvE', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(51, 'Seamus Jacobson', 'khoeger@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '97996334', '256 Seamus Estate Apt. 139\nNew Dixietown, VA 02070-2182', '+8118697272015', 'patient', 'MuYHbQXG5K', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(52, 'Hubert Schroeder', 'melyssa.mitchell@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '48372082', '27149 Schneider Isle\nSusieside, AL 70719', '+4539233280786', 'patient', 'nKOIcB8NjQ', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(53, 'Juwan Stark II', 'eokuneva@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '86678660', '6975 Turcotte Lodge Suite 673\nSouth Florian, NJ 90782', '+8285128032731', 'patient', 'G4vg09Kmpo', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(54, 'Mr. Arno Dare PhD', 'filiberto.nolan@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '54072291', '4186 Manley Hollow\nNew Lucianostad, AZ 08600-3052', '+5353078822686', 'doctor', 'ZXR8kzDiko', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(55, 'Garnett Hyatt', 'destini74@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '90915002', '254 Halvorson Square\nErdmanhaven, NM 05562-0840', '+3707176540859', 'doctor', 'cDsKg3MgyH', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(56, 'Christy Cruickshank', 'lia.lindgren@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '39871536', '11027 Bettie Freeway\nPort Terranceland, NY 75116-2392', '+2957793969782', 'doctor', 'oSEYu1TNgv', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(57, 'Dr. Antonette Shanahan', 'concepcion.watsica@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '74869175', '328 Leannon Prairie\nWest Christophe, IN 43687-9654', '+8308006195889', 'doctor', '93mJinfatv', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(58, 'Bill Tillman', 'sbashirian@example.org', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '62097918', '979 Coby Ports\nGutmannbury, SC 00379', '+5634259163807', 'doctor', 'GPJHUBx5TJ', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(59, 'Ms. Zita Jakubowski', 'dominique09@example.com', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '70633088', '8703 Jakubowski Meadows\nDanielland, WV 93557', '+4838051920024', 'doctor', 'J06xKSZxww', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(60, 'Prof. Marcelo Bergnaum MD', 'sammie36@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '68971256', '986 Russel Mountain\nEast Eleanora, GA 55864', '+4265853136555', 'doctor', 'iUCKfvGIfX', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(61, 'Cortney Weissnat', 'dora65@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '67407899', '17420 Willms Pine\nEast Selinaport, AZ 22299', '+9525776115128', 'doctor', 'edzozWTkqO', '2022-03-19 03:58:12', '2022-03-19 03:58:12'),
(62, 'Prof. Mitchell Luettgen', 'jkunze@example.net', NULL, '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '44648349', '22983 Avis Roads\nTayaburgh, AL 69425-5475', '+1392199987264', 'doctor', 'xf8m55ui9z', '2022-03-19 03:58:12', '2022-03-19 03:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `work_days`
--

CREATE TABLE `work_days` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` smallint(5) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `morning_start` time NOT NULL,
  `morning_end` time NOT NULL,
  `afternoon_start` time NOT NULL,
  `afternoon_end` time NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_days`
--

INSERT INTO `work_days` (`id`, `day`, `active`, `morning_start`, `morning_end`, `afternoon_start`, `afternoon_end`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 0, 1, '05:30:00', '06:00:00', '13:30:00', '14:00:00', 3, '2022-04-03 03:58:12', '2022-04-02 09:22:06'),
(2, 1, 0, '05:30:00', '05:30:00', '13:30:00', '13:30:00', 3, '2022-04-03 03:58:12', '2022-04-02 09:22:06'),
(3, 2, 0, '05:30:00', '05:30:00', '13:30:00', '13:30:00', 3, '2022-04-03 03:58:12', '2022-04-02 09:22:06'),
(4, 3, 0, '05:30:00', '05:00:00', '13:30:00', '13:00:00', 3, '2022-04-03 03:58:12', '2022-04-02 09:22:06'),
(5, 4, 0, '05:30:00', '05:30:00', '13:30:00', '13:30:00', 3, '2022-04-03 03:58:12', '2022-04-02 09:22:06'),
(6, 5, 0, '05:30:00', '05:30:00', '13:30:00', '13:30:00', 3, '2022-04-03 03:58:12', '2022-04-02 09:22:06'),
(7, 6, 0, '05:30:00', '05:30:00', '13:30:00', '13:30:00', 3, '2022-04-03 03:58:12', '2022-04-02 09:22:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_specialty_id_foreign` (`specialty_id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`);

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
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialty_user`
--
ALTER TABLE `specialty_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialty_user_user_id_foreign` (`user_id`),
  ADD KEY `specialty_user_specialty_id_foreign` (`specialty_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `work_days`
--
ALTER TABLE `work_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_days_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specialty_user`
--
ALTER TABLE `specialty_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `work_days`
--
ALTER TABLE `work_days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`);

--
-- Constraints for table `specialty_user`
--
ALTER TABLE `specialty_user`
  ADD CONSTRAINT `specialty_user_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`),
  ADD CONSTRAINT `specialty_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `work_days`
--
ALTER TABLE `work_days`
  ADD CONSTRAINT `work_days_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
