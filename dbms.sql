-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2023 at 07:43 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`) VALUES
(1, 'admin@gmail.com', 'admin', 'Prasad', '+91-9533848712');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `movie_name` varchar(255) NOT NULL,
  `movie_runtime` varchar(255) NOT NULL,
  `movie_genre` varchar(255) NOT NULL,
  `movie_release` varchar(255) NOT NULL,
  `movie_toma` varchar(50) NOT NULL,
  `movie_pop` varchar(50) NOT NULL,
  `movie_trailer` varchar(255) NOT NULL,
  `movie_file` varchar(255) NOT NULL,
  `movie_desc` varchar(750) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `movie_name`, `movie_runtime`, `movie_genre`, `movie_release`, `movie_toma`, `movie_pop`, `movie_trailer`, `movie_file`, `movie_desc`) VALUES
(1, 'KGF Chapter 2', '2hrs 48min\r\n', 'Action | Drama | Period\r\n', '14 April 2022', '83%', '90%', 'https://www.youtube.com/watch?v=JKa05nyUmuQ', 'kgf', 'The blood-soaked land of Kolar Gold Fields (KGF) has a new overlord now - Rocky, whose name strikes fear in the heart of his foes. His allies look up to Rocky as their saviour, the government sees him as a threat to law and order; enemies are clamouring for revenge and conspiring for his downfall. Bloodier battles and darker days await as Rocky continues on his quest for unchallenged supremacy.'),
(2, 'Guardians of the Galaxy Vol. 3', '2hrs 30min', 'Action | Adventure | Comedy | Sci-Fi\r\n', '5 May, 2023', '82%', '84%', 'https://www.youtube.com/watch?v=u3V5KDHRQvk', 'gotg', 'Our beloved band of misfits are settling into life on Knowhere. But it isn`t long before their lives are upended by the echoes of Rocket`s turbulent past. Peter Quill, still reeling from the loss of Gamora, must rally his team around him on a dangerous mission to save Rocket`s life - a mission that, if not completed successfully, could quite possibly lead to the end of the Guardians as we know them.'),
(3, 'The Kerala Story', '2hrs 18min', 'Drama', '5th May 2023', '85%', '84%', 'https://www.youtube.com/watch?v=3Jk3vquJDGs', 'kst', 'A spine-chilling, never told before true story - revealing a dangerous conspiracy that has been hatched against India. The Kerala Story is a compilation of the true stories of three young girls from different parts of Kerala.\\r\\n\\r\\nThe truth shall set us free! Thousands of innocent women have been systematically converted, radicalized & their lives destroyed. It`s their side of the story.'),
(4, 'Fast X', '2hr 14min', 'Action | Adventure | Crime | Thriller', '18th May 2023', '86%', '87%', 'https://www.youtube.com/watch?v=aOb15GVFZxU&pp=ygULZmFzdCB4IHRyYWk%3D', 'fx', 'Dom Toretto and his family must confront a terrifying new enemy who`s fueled by revenge.');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `seat_no` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `seat_name` varchar(255) NOT NULL,
  `seat_stats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `seat_no`, `show_id`, `seat_name`, `seat_stats`) VALUES
(1, 1, 1, 'g1', 0),
(2, 2, 1, 'g2', 0),
(3, 3, 1, 'g3', 0),
(4, 4, 1, 'g4', 1),
(5, 5, 1, 'g5', 0),
(6, 6, 1, 'g6', 1),
(7, 7, 1, 'g7', 0),
(8, 8, 1, 'g8', 0),
(9, 9, 1, 'g9', 0),
(10, 10, 1, 'g10', 0),
(11, 11, 1, 'g11', 0),
(12, 12, 1, 'g12', 1),
(13, 13, 1, 'g13', 0),
(14, 14, 1, 'g14', 1),
(15, 15, 1, 'f1', 0),
(16, 16, 1, 'f2', 0),
(17, 17, 1, 'f3', 0),
(18, 18, 1, 'f4', 1),
(19, 19, 1, 'f5', 0),
(20, 20, 1, 'f6', 1),
(21, 21, 1, 'f7', 0),
(22, 22, 1, 'f8', 0),
(23, 23, 1, 'f9', 0),
(24, 24, 1, 'f10', 0),
(25, 25, 1, 'f11', 0),
(26, 26, 1, 'f12', 1),
(27, 27, 1, 'f13', 0),
(28, 28, 1, 'f14', 1),
(29, 29, 1, 'e1', 0),
(30, 30, 1, 'e2', 0),
(31, 31, 1, 'e3', 0),
(32, 32, 1, 'e4', 1),
(33, 33, 1, 'e5', 0),
(34, 34, 1, 'e6', 1),
(35, 35, 1, 'e7', 0),
(36, 36, 1, 'e8', 0),
(37, 37, 1, 'e9', 0),
(38, 38, 1, 'e10', 0),
(39, 39, 1, 'e11', 0),
(40, 40, 1, 'e12', 1),
(41, 41, 1, 'e13', 0),
(42, 42, 1, 'e14', 1),
(43, 43, 1, 'd1', 0),
(44, 44, 1, 'd2', 0),
(45, 45, 1, 'd3', 0),
(46, 46, 1, 'd4', 1),
(47, 47, 1, 'd5', 0),
(48, 48, 1, 'd6', 1),
(49, 49, 1, 'd7', 0),
(50, 50, 1, 'd8', 0),
(51, 51, 1, 'd9', 0),
(52, 52, 1, 'd10', 0),
(53, 53, 1, 'd11', 0),
(54, 54, 1, 'd12', 1),
(55, 55, 1, 'd13', 0),
(56, 56, 1, 'd14', 1),
(57, 57, 1, 'c1', 0),
(58, 58, 1, 'c2', 0),
(59, 59, 1, 'c3', 0),
(60, 60, 1, 'c4', 1),
(61, 61, 1, 'c5', 0),
(62, 62, 1, 'c6', 1),
(63, 63, 1, 'c7', 0),
(64, 64, 1, 'c8', 0),
(65, 65, 1, 'c9', 0),
(66, 66, 1, 'c10', 0),
(67, 67, 1, 'c11', 0),
(68, 68, 1, 'c12', 1),
(69, 69, 1, 'c13', 0),
(70, 70, 1, 'c14', 1),
(71, 71, 1, 'b1', 0),
(72, 72, 1, 'b2', 0),
(73, 73, 1, 'b3', 0),
(74, 74, 1, 'b4', 1),
(75, 75, 1, 'b5', 0),
(76, 76, 1, 'b6', 1),
(77, 77, 1, 'b7', 0),
(78, 78, 1, 'b8', 0),
(79, 79, 1, 'b9', 0),
(80, 80, 1, 'b10', 0),
(81, 81, 1, 'b11', 0),
(82, 82, 1, 'b12', 1),
(83, 83, 1, 'b13', 0),
(84, 84, 1, 'b14', 1),
(85, 85, 1, 'a1', 0),
(86, 86, 1, 'a2', 0),
(87, 87, 1, 'a3', 0),
(88, 88, 1, 'a4', 1),
(89, 89, 1, 'a5', 0),
(90, 90, 1, 'a6', 1),
(91, 91, 1, 'a7', 0),
(92, 92, 1, 'a8', 0),
(93, 93, 1, 'a9', 0),
(94, 94, 1, 'a10', 0),
(95, 95, 1, 'a11', 0),
(96, 96, 1, 'a12', 1),
(97, 97, 1, 'a13', 0),
(98, 98, 1, 'a14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seats1`
--

CREATE TABLE `seats1` (
  `seat_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `seat_rema` int(11) NOT NULL,
  `seat_capaci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seats1`
--

INSERT INTO `seats1` (`seat_id`, `show_id`, `seat_rema`, `seat_capaci`) VALUES
(1, 1, 59, 98),
(2, 2, 7, 98),
(3, 3, 65, 98),
(4, 4, 76, 98),
(5, 5, 65, 98),
(6, 6, 7, 98),
(7, 7, 65, 98),
(8, 8, 79, 98),
(9, 9, 64, 98),
(10, 10, 7, 98),
(11, 11, 67, 98),
(12, 12, 79, 98),
(13, 13, 65, 98),
(14, 14, 7, 98),
(15, 15, 67, 98),
(16, 16, 79, 98),
(17, 17, 67, 98),
(18, 18, 72, 98),
(19, 19, 65, 98),
(20, 20, 56, 98),
(21, 21, 67, 98),
(22, 22, 7, 98),
(23, 23, 67, 98),
(24, 24, 79, 98),
(25, 25, 67, 98),
(26, 26, 7, 98),
(27, 27, 63, 98),
(28, 28, 79, 98),
(29, 29, 67, 98),
(30, 30, 7, 98),
(31, 31, 67, 98),
(32, 32, 79, 98),
(33, 33, 67, 98),
(34, 34, 7, 98),
(35, 35, 62, 98),
(36, 36, 79, 98),
(37, 37, 67, 98),
(38, 38, 7, 98),
(39, 39, 67, 98),
(40, 40, 79, 98),
(41, 41, 67, 98),
(42, 42, 7, 98),
(43, 43, 67, 98),
(44, 44, 79, 98),
(45, 45, 67, 98),
(46, 46, 7, 98),
(47, 47, 67, 98),
(48, 48, 79, 98),
(49, 49, 67, 98),
(50, 50, 7, 98),
(51, 51, 89, 98),
(52, 52, 79, 98),
(53, 53, 67, 98),
(54, 54, 7, 98),
(55, 55, 67, 98),
(56, 56, 79, 98),
(57, 57, 67, 98),
(58, 58, 7, 98),
(59, 59, 67, 98),
(60, 60, 79, 98),
(61, 61, 67, 98),
(62, 62, 7, 98),
(63, 63, 67, 98),
(64, 64, 79, 98),
(65, 65, 67, 98),
(66, 66, 56, 98),
(67, 67, 67, 98),
(68, 68, 79, 98),
(69, 69, 67, 98),
(70, 70, 7, 98),
(71, 71, 67, 98),
(72, 72, 79, 98),
(73, 73, 67, 98),
(74, 74, 7, 98),
(75, 75, 67, 98),
(76, 76, 79, 98),
(77, 77, 67, 98),
(78, 78, 7, 98),
(79, 79, 67, 98),
(80, 80, 79, 98);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `theater_id` int(11) NOT NULL,
  `show_date` varchar(255) NOT NULL,
  `show_time` varchar(255) NOT NULL,
  `show_end` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `theater_id`, `show_date`, `show_time`, `show_end`) VALUES
(1, 1, '23/10/2023', '09:40', '12:00'),
(2, 1, '23/10/2023', '13:45', '16:05'),
(3, 1, '23/10/2023', '17:00', '19:30'),
(4, 1, '23/10/2023', '19:50', '22:25'),
(5, 1, '24/10/2023', '09:40', '12:00'),
(6, 1, '24/10/2023', '13:45', '16:05'),
(7, 1, '24/10/2023', '17:00', '19:30'),
(8, 1, '24/10/2023', '19:50', '22:25'),
(9, 1, '25/10/2023', '09:40', '12:00'),
(10, 1, '25/10/2023', '13:45', '16:05'),
(11, 1, '25/10/2023', '17:00', '19:30'),
(12, 1, '25/10/2023', '19:50', '22:25'),
(13, 1, '26/10/2023', '09:40', '12:00'),
(14, 1, '26/10/2023', '13:45', '16:05'),
(15, 1, '26/10/2023', '17:00', '19:30'),
(16, 1, '26/10/2023', '19:50', '22:25'),
(17, 2, '23/10/2023', '09:40', '12:00'),
(18, 2, '23/10/2023', '13:45', '16:05'),
(19, 2, '23/10/2023', '17:00', '19:30'),
(20, 2, '23/10/2023', '19:50', '22:25'),
(21, 2, '24/10/2023', '09:40', '12:00'),
(22, 2, '24/10/2023', '13:45', '16:05'),
(23, 2, '24/10/2023', '17:00', '19:30'),
(24, 2, '24/10/2023', '19:50', '22:25'),
(25, 2, '25/10/2023', '09:40', '12:00'),
(26, 2, '25/10/2023', '13:45', '16:05'),
(27, 2, '25/10/2023', '17:00', '19:30'),
(28, 2, '25/10/2023', '19:50', '22:25'),
(29, 2, '26/10/2023', '09:40', '12:00'),
(30, 2, '26/10/2023', '13:45', '16:05'),
(31, 2, '26/10/2023', '17:00', '19:30'),
(32, 2, '26/10/2023', '19:50', '22:25'),
(33, 3, '23/10/2023', '09:40', '12:00'),
(34, 3, '23/10/2023', '13:45', '16:05'),
(35, 3, '23/10/2023', '17:00', '19:30'),
(36, 3, '23/10/2023', '19:50', '22:25'),
(37, 3, '24/10/2023', '09:40', '12:00'),
(38, 3, '24/10/2023', '13:45', '16:05'),
(39, 3, '24/10/2023', '17:00', '19:30'),
(40, 3, '24/10/2023', '19:50', '22:25'),
(41, 3, '25/10/2023', '09:40', '12:00'),
(42, 3, '25/10/2023', '13:45', '16:05'),
(43, 3, '25/10/2023', '17:00', '19:30'),
(44, 3, '25/10/2023', '19:50', '22:25'),
(45, 3, '26/10/2023', '09:40', '12:00'),
(46, 3, '26/10/2023', '13:45', '16:05'),
(47, 3, '26/10/2023', '17:00', '19:30'),
(48, 3, '26/10/2023', '19:50', '22:25'),
(49, 4, '23/10/2023', '09:40', '12:00'),
(50, 4, '23/10/2023', '13:45', '16:05'),
(51, 4, '23/10/2023', '17:00', '19:30'),
(52, 4, '23/10/2023', '19:50', '22:25'),
(53, 4, '24/10/2023', '09:40', '12:00'),
(54, 4, '24/10/2023', '13:45', '16:05'),
(55, 4, '24/10/2023', '17:00', '19:30'),
(56, 4, '24/10/2023', '19:50', '22:25'),
(57, 4, '25/10/2023', '09:40', '12:00'),
(58, 4, '25/10/2023', '13:45', '16:05'),
(59, 4, '25/10/2023', '17:00', '19:30'),
(60, 4, '25/10/2023', '19:50', '22:25'),
(61, 4, '26/10/2023', '09:40', '12:00'),
(62, 4, '26/10/2023', '13:45', '16:05'),
(63, 4, '26/10/2023', '17:00', '19:30'),
(64, 4, '26/10/2023', '19:50', '22:25'),
(65, 5, '23/10/2023', '09:40', '12:00'),
(66, 5, '23/10/2023', '13:45', '16:05'),
(67, 5, '23/10/2023', '17:00', '19:30'),
(68, 5, '23/10/2023', '19:50', '22:25'),
(69, 5, '24/10/2023', '09:40', '12:00'),
(70, 5, '24/10/2023', '13:45', '16:05'),
(71, 5, '24/10/2023', '17:00', '19:30'),
(72, 5, '24/10/2023', '19:50', '22:25'),
(73, 5, '25/10/2023', '09:40', '12:00'),
(74, 5, '25/10/2023', '13:45', '16:05'),
(75, 5, '25/10/2023', '17:00', '19:30'),
(76, 5, '25/10/2023', '19:50', '22:25'),
(77, 5, '26/10/2023', '09:40', '12:00'),
(78, 5, '26/10/2023', '13:45', '16:05'),
(79, 5, '26/10/2023', '17:00', '19:30'),
(80, 5, '26/10/2023', '19:50', '22:25');

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE `theater` (
  `theater_id` int(11) NOT NULL,
  `theater_name` varchar(500) NOT NULL,
  `theater_address` varchar(500) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `theater_screen` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theater`
--

INSERT INTO `theater` (`theater_id`, `theater_name`, `theater_address`, `movie_id`, `theater_screen`) VALUES
(1, 'PVR: Vinayak, Prayagraj', 'https://maps.google.co.in/?q=25.454662,81.834677(PVR:%20Vinayak,%20Prayagraj)', 1, 'Screen 1'),
(2, 'PVR: Vinayak, Prayagraj', 'https://maps.google.co.in/?q=25.454662,81.834677(PVR:%20Vinayak,%20Prayagraj)', 2, 'Screen 2'),
(3, 'Starworld Cinemas:Prayagraj', 'https://maps.google.co.in/?q=25.428364,81.841104(Starworld%20Cinemas:%20Mutthiganj,%20Prayagraj)', 1, 'Screen 3'),
(4, 'Newfangled Miniplex:Park', 'https://maps.google.co.in/?q=23.032611,72.508311(1,%20Newfangled%20Miniplex:%20Mondeal%20Retail%20Park)', 3, 'Screen - 4'),
(5, 'Cinepolis: Mantra Mall, Attapur', 'https://maps.google.co.in/?q=17.353790,78.420624(Cinepolis:%20Mantra%20Mall,%20Attapur)', 4, 'Screen - 2');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seat_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `show_id`, `user_id`, `seat_no`) VALUES
(1, 1, 1, 2),
(2, 1, 1, 2),
(3, 1, 1, 2),
(4, 9, 1, 3),
(5, 13, 1, 2),
(6, 1, 1, 2),
(7, 5, 1, 2),
(8, 7, 1, 2),
(9, 1, 1, 2),
(11, 18, 3, 2),
(12, 27, 3, 4),
(13, 35, 1, 5),
(20, 19, 2, 2),
(21, 18, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_name`, `user_phone`) VALUES
(1, 'ratan@gmail.com', 'ratan', 'Ratan Kalpa Sai', '+91-9440402140'),
(2, 'sri@gmail.com', 'sri@1234', 'Maloth Sridhar Varma', '+91-7981841338'),
(3, 'vishwanth@gmail.com', 'viswa@234', 'Vishwanth', '+91-9234567890'),
(4, 'sreeram@gmail.com', 'sre@34567', 'Sreeram Angina', '+91-9876534123'),
(5, 'rat@gmail.com', 'rat', 'Rat', '4567823456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `seats1`
--
ALTER TABLE `seats1`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `theater`
--
ALTER TABLE `theater`
  ADD PRIMARY KEY (`theater_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `show_id` (`show_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `seats1`
--
ALTER TABLE `seats1`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `theater`
--
ALTER TABLE `theater`
  MODIFY `theater_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `fk_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`);

--
-- Constraints for table `seats1`
--
ALTER TABLE `seats1`
  ADD CONSTRAINT `fk_show1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`);

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `fk_theater` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`theater_id`);

--
-- Constraints for table `theater`
--
ALTER TABLE `theater`
  ADD CONSTRAINT `fk_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_cust` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_sho` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
