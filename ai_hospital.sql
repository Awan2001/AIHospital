-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2023 at 10:16 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ai_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_fname` varchar(20) NOT NULL,
  `admin_lname` varchar(20) NOT NULL,
  `admin_no` varchar(15) NOT NULL,
  `admin_pass` varchar(50) NOT NULL,
  `admin_username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_fname`, `admin_lname`, `admin_no`, `admin_pass`, `admin_username`) VALUES
(1, 'Izzat', 'Fadzlan', '0123456789', '123', 'izzat');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `pt_ic` varchar(20) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `app_case` varchar(500) NOT NULL,
  `app_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_id`, `doc_id`, `pt_ic`, `admin_id`, `app_case`, `app_date`) VALUES
(1, 2, '011022020103', 1, 'Lately im having a stomache :(', '2023-08-14'),
(2, 1, '700509095724', 1, 'She got severe abdominal injury', '2023-08-04'),
(3, 2, '101222023456', 1, 'her blood pressure increase in short period', '2023-09-10'),
(4, 4, '011022020103', 1, 'Lately im having a stomache :(', '2023-08-31'),
(5, 2, '101222023456', 1, 'Im having some breathing issues', '2023-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bills_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `bills_date` date NOT NULL,
  `bills_status` varchar(10) NOT NULL,
  `bill_amount` double NOT NULL,
  `bill_method` varchar(20) DEFAULT NULL,
  `pt_ic` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bills_id`, `app_id`, `bills_date`, `bills_status`, `bill_amount`, `bill_method`, `pt_ic`) VALUES
(1, 1, '2023-08-23', 'Paid', 22, 'paypal', '011022020103'),
(2, 3, '2023-08-16', 'Paid', 33.5, 'E-wallet', '101222023456'),
(3, 5, '2023-08-23', 'Paid', 120.7, 'paypal', '101222023456');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_name`) VALUES
(1, 'Gastroenterologists'),
(2, 'Cardiologist'),
(3, 'Neurologist'),
(4, 'Oncologist'),
(5, 'Psychiatrist'),
(6, 'Radiologist'),
(7, 'Optometrist');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doc_id` int(11) NOT NULL,
  `doc_fname` varchar(20) NOT NULL,
  `doc_lname` varchar(20) NOT NULL,
  `doc_no` varchar(20) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_id`, `doc_fname`, `doc_lname`, `doc_no`, `dept_id`) VALUES
(1, 'Afiqah', 'Azri', '0112223333', 1),
(2, 'Ammar', 'Saufi', '01234673545', 2),
(3, 'Ainin', 'Sofea', '011233423', 3),
(4, 'Nayli', 'Uzma', '0124124235', 2),
(5, 'Nur', 'Batrisha', '01232452351', 4);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pt_ic` varchar(20) NOT NULL,
  `pt_fname` varchar(30) NOT NULL,
  `pt_lname` varchar(30) NOT NULL,
  `pt_add` varchar(50) NOT NULL,
  `pt_no` varchar(20) NOT NULL,
  `pt_pass` varchar(20) NOT NULL,
  `pt_cpass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pt_ic`, `pt_fname`, `pt_lname`, `pt_add`, `pt_no`, `pt_pass`, `pt_cpass`) VALUES
('011022020103', 'Arif', 'Sabri', 'No 30 Kampung Kenanga', '01169921724', '123', '123'),
('101222023456', 'Salsa', 'Qiya', 'No35 Jalan Lurus, Kecamatan Tegal', '08832414153', '123', '123'),
('700509095724', 'Asiah', 'Abdullah', 'No 33 Kg Baru Ada', '0124603166', '123', '123');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `pt_ic` varchar(20) NOT NULL,
  `req_id` int(11) NOT NULL,
  `req_desc` varchar(500) NOT NULL,
  `req_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`pt_ic`, `req_id`, `req_desc`, `req_status`) VALUES
('011022020103', 1, 'Lately im having a stomache :(', 'pending'),
('101222023456', 2, 'Im having some breathing issues', 'pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `UC_admin` (`admin_username`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `pt_ic` (`pt_ic`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bills_id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `pt_ic` (`pt_ic`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pt_ic`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `pt_ic` (`pt_ic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bills_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`pt_ic`) REFERENCES `patients` (`pt_ic`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `appointment` (`app_id`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`pt_ic`) REFERENCES `patients` (`pt_ic`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`pt_ic`) REFERENCES `patients` (`pt_ic`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
