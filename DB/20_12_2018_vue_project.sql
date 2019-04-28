-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2018 at 11:15 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vue_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `upload_file`
--

CREATE TABLE `upload_file` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `mime` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `contact_no` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contact_no`, `address`) VALUES
(1, 'Naim uddin', NULL, '01986873220', 'Dhaka, Bangladesh'),
(2, 'Md Foysal', NULL, '016888545566', 'Mirpur, Bangladesh'),
(3, 'Mahdi', NULL, '016554455', 'Uttara, Bangladesh'),
(4, 'Kamal', NULL, '01566455655', 'Khulna'),
(5, 'Hasan', NULL, '01776444', 'Rangpur'),
(6, 'test name', NULL, '0155545554855', 'Kalkini'),
(7, 'Md Mahin', NULL, '015664565', 'Park road, Dhaka'),
(10, 'Md Maruf', 'maruf@gmail.com', '0155545655', 'Madaripur'),
(11, 'Kamal Hossain', 'kamal@gmail.com', '0122554565', 'Kaligonj'),
(12, 'Marvin Gomez', 'marvin@beatnikbd.com', '01555554445', 'Dhaka'),
(13, 'Md Kamal uddin', 'kamal@gmail.com', '0155545554', 'Kaligonj Madaripur'),
(14, 'Mr Hasan', 'hasan@gmail.com', '34534534', 'Mogbazzar'),
(15, 'Rahim', 'rahim@gmail.com', '234234234', 'Mirpur'),
(16, 'Md Malek', 'malek@gmail.com', '01555445555', 'malek@gmail.com'),
(17, 'Md Malek', 'malek@gmail.com', '01555445555', 'malek@gmail.com'),
(18, 'Hasib', 'hasib@gmail.com', '2342342342', 'Khulna'),
(19, 'Kamrul', 'karmul@gmail.com', '01554444455', 'Kalkini'),
(20, 'Abdul', 'abdul@gmail.com', '015654555', 'Gopalgonj'),
(21, 'Abdul Hmid', 'abdul.hamid@gmail.com', '015654555', 'Gopalgonj'),
(22, 'Abir', 'abri@gmail.com', '01555455', 'Munshigonj'),
(23, 'Korbir', 'kobir@gmail.com', '015555', 'Abc'),
(24, 'Arman', 'arman@gmail.com', '015555', 'Abc'),
(25, 'Kabil', 'kabil@gmail.com', '015555445', 'Savar'),
(26, 'Nasrin Akter', 'nasrin@gmail.com', '0155545555', 'Gazipur');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `upload_file`
--
ALTER TABLE `upload_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `upload_file`
--
ALTER TABLE `upload_file`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
