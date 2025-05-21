-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 06:44 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `specialisten_afspraken`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `subject` varchar(255) NOT NULL,
  `problems` varchar(255) DEFAULT NULL,
  `discussed` longtext NOT NULL,
  `patient_id` int(11) NOT NULL,
  `specialist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `date`, `time`, `subject`, `problems`, `discussed`, `patient_id`, `specialist_id`) VALUES
(1, '2025-04-15', '09:52:00', 'vuodfuidsbvi', 'zdvcsdyvc', 'duvsuidvisdb', 8, 2),
(2, '2025-04-15', '10:06:00', 'dv dkfj', 'df', 'efvr', 8, 2),
(3, '2025-04-15', '13:56:00', 'dfgrfgr', 'eferf', 'rergrgr', 8, 1),
(5, '2025-05-06', '09:31:00', 'sdgsd', 'sdd', 'zdg', 9, 3),
(6, '2025-05-13', '14:50:00', 'hart', 'hart probleem', 'volgende week', 8, 3),
(7, '2025-05-13', '14:21:00', 'gnrfn', 'fgndfg', 'ngdfn', 10, 3),
(8, '2025-05-15', '00:30:00', 'Moeilijk met ademen', 'vcywdvc', 'volgend afspraak is volgend week', 11, 3),
(9, '2025-05-19', '23:06:00', 'asdf', 'dfgh', 'fyguh', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250408081222', '2025-04-08 10:12:37', 93),
('DoctrineMigrations\\Version20250408081946', '2025-04-08 10:20:20', 11),
('DoctrineMigrations\\Version20250408082624', '2025-04-08 10:26:35', 27),
('DoctrineMigrations\\Version20250408084933', '2025-04-08 10:49:53', 180);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `adress`, `zip_code`, `city`, `specialization`) VALUES
(1, 'hallo@gmail.nl', '[\"ROLE_SPECIALIST\"]', '$2y$13$A6a4geXzYbMimTGiQMx1eeK5H16Jjyvc8QgWEKYNZRrA8phF/iksq', 'hallo', 'yes', 'pece', NULL, 'bbfiv', 'internist'),
(2, 'hi', '[]', '$2y$13$.gEkP69ma6K.glhNri8TqeU5m4cWV0PV/8f2AT.YBaw89dmhFa3E2', 'ali', 'malf', 'edef', '1232pv', 'delft', NULL),
(3, 'ali@gmail.com', '[\"ROLE_SPECIALIST\"]', '$2y$13$ZdbH5Vf4MsYs00HO5CFpJubCSz7FuNwtKEvU2nvdtC.tVi7DaytcS', 'ali', 'm', 'bcdhsdbch', '1232pv', 'delft', 'hartchirurg'),
(4, 'alim@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$DORyrLE8HXQXcrYuVeKg0uTNzXQCK7nTJpesGefdDYeg9IIYUnb0K', 'Ali', 'M', 'newyork', '1234ab', 'delft', NULL),
(5, 'jamil@gmail.com', '[]', '$2y$13$B4lmhRnrx8jW9VpfBMXoHOYt6vuT8l.caLTjQnFBpsDwbNR5GiCwG', 'jamil', 'hamada', 'wertuhde', '5992', 'Almere', NULL),
(6, 'ahmed@gmail.com', '[\"ROLE_SPECIALIST\"]', '$2y$13$fIcrG4sGiJD50d9mgDL6V.ZzJ4Stgtb02P9S084TR4oE9oZh25saO', 'Ahmed', 'M', 'rioejfri', '12345ii', 'delft', NULL),
(7, 'jak@gmail.com', '[\"ROLE_PATIENT\"]', '$2y$13$MBvva9qoU2qODWroLhibZelxhaCuWXF5SbgGMfmp4qVw6whMndvGu', 'jak', 'm', 'qedbei', '1234vb', 'delft', NULL),
(8, 'nick@gmail.com', '[\"ROLE_PATIENT\"]', '$2y$13$dDzXiMOrTrbqqpyieFd3b.Fce2Yu8JNC4ZujisRZL4FyyYY0mnzAW', 'nick', 'devlin', 'bfiefuvr', '1234ab', 'delft', NULL),
(9, 'noam@gmail.com', '[\"ROLE_PATIENT\"]', '$2y$13$AS8Wxs2c5F4BJCAg8eLfbeew2KpKul.OgL/cze.zR0U6N4rYo880u', 'noam', 'B', 'spoedstraat', '1234bn', 'delft', NULL),
(10, 'chris@gmail.com', '[\"ROLE_PATIENT\"]', '$2y$13$sawMziaE4/qWSlAh4M68c.IQtv9NSOKTipJzOY9ENAU/Axe3EU.g.', 'chris', 'lemmen', 'Hoefkade', '1234 Ab', 'delft', NULL),
(11, 'Adnan@gmail.com', '[\"ROLE_PATIENT\"]', '$2y$13$pCEaFJ7JY4WDogAQey2kF.9TQhiydWSgxi.5sM.Yr3ppHTeSQdfOK', 'Adnan', 'Arabbaj', 'rijswijk', '1234ab', 'Rijswijk', NULL),
(12, 'mohammed@gmail.com', '[\"ROLE_ADMIN\"]', '123456', 'ali', 'm', 'bcsdk', 'vdf', 'efv', 'ev'),
(13, 'one@gmail.com', '[[\"ROLE_PATIENT\",\"ROLE_ADMIN\"]]', '123456', 'ccssd', 'sdvdf', 'dfsvsdf', 'sdfvs', 'sdfv', 'sdfvs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FE38F8446B899279` (`patient_id`),
  ADD KEY `IDX_FE38F8447B100C1A` (`specialist_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FK_FE38F8446B899279` FOREIGN KEY (`patient_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FE38F8447B100C1A` FOREIGN KEY (`specialist_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
