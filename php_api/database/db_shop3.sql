-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2026 at 01:04 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'เครื่องใช้ไฟฟ้า'),
(2, 'เสื้อผ้า'),
(3, 'รองเท้า');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstName`, `lastName`, `phone`, `username`, `password`) VALUES
(00000002, 'วิภา', 'สุขสันต์', '0898765432', 'wipa', 'wipa2025'),
(00000003, 'John', 'Doe', '0991122334', 'johnd', 'securepwd'),
(00000004, 'เมษา', 'เด็กดี', '038743690', 'mesa', '$2y$10$tSSl6/EruDffk'),
(00000005, 'มานะ', 'มีใจ', '038754920', 'mana', '$2y$10$tA0rn9nxLE.i6q5U5qvgMuij0eJZJkNEQMTRn3lJsDECEt1jSq58u'),
(00000006, 'ชูใจ', 'เด็กดี', '038743690', 'shoojai', '$2y$10$9JiaB6GjUeHH1pWQlsYpyebE7FVT8zZgINfMV2Ud16XKRlPGCtW5m'),
(00000007, 'ลูกผู้ชาย', 'พันดี', '0888888888', 'bigasboy022', '$2y$10$ed0y1ZHADtJXrr24pjl5mO0kYmmDuBPouTEW5ptRBoEyKtuDR6c7.');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `image` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `full_name`, `department`, `salary`, `active`, `image`, `created_at`) VALUES
(0000000001, 'สมชาย คนดี', 'การตลาด', '25000.00', 1, '', '2026-01-18 10:27:14'),
(0000000002, 'สมหญิง ดีงาม', 'บัญชี', '28000.00', 1, '', '2026-01-18 10:27:14'),
(0000000003, 'อนันต์ สุขใจ', 'การตลาด', '25000.00', 0, '', '2026-01-18 10:27:14'),
(0000000004, 'สุดา พรมดี', 'ทรัพยากรบุคคล', '32000.00', 1, '', '2026-01-18 10:27:14'),
(0000000005, 'นวรัตน์  เกิดผล', 'คอมพิวเตอร์', '25000.00', 1, '', '2026-01-25 09:43:49'),
(0000000006, 'มานี มีตา ', 'ไอที', '25000.00', 1, '', '2026-01-25 11:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `image`, `stock`, `category_id`, `created_at`) VALUES
(00000000006, 'เสื้อยืดคอกลม', 'เสื้อยืดผ้าฝ้าย 100% สวมใส่สบาย', '199.00', 'p1.jpg', 50, 1, '2026-01-25 10:42:55'),
(00000000007, 'กางเกงยีนส์', 'กางเกงยีนส์ทรงกระบอก สีฟ้าอ่อน', '799.00', 'p2.jpg', 30, 1, '2026-01-25 10:42:55'),
(00000000008, 'ข้าวเหนียวทองคำ', 'ข้าวเหนียวโบราณที่พึ่งขุดพบแถวๆวัดแห่งหนึ่งในภาคอีสานมีข่าวว่ากินแล้วจะมีพลังวิเศษ', '8000.00', '1771760468_1.jpg', 1, 1, '2026-01-25 10:42:55'),
(00000000009, 'ลูกผู้ชายพันดี', 'ไอหนุ่มอีสานพลังงานลีกลับ', '999999.00', '1771145405_1.jpg', 1, 3, '2026-02-15 08:50:05'),
(00000000011, 'ชุดกับปิตัน', 'ชุดเท่ๆ', '500.00', '1771760916_2.jpg', 10, 2, '2026-02-22 11:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `tb_type`
--

CREATE TABLE `tb_type` (
  `type_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `type_name` varchar(30) NOT NULL COMMENT 'ชื่อประเภท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_type`
--

INSERT INTO `tb_type` (`type_id`, `type_name`) VALUES
(1, 'เครื่องใช้ไฟฟ้า'),
(2, 'เครื่องเขียน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tb_type`
--
ALTER TABLE `tb_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_type`
--
ALTER TABLE `tb_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า', AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
