-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2022 at 07:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing1`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_name` varchar(250) NOT NULL,
  `brand_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `category_id`, `brand_name`, `brand_status`) VALUES
(1, 1, 'Rolax', 'active'),
(2, 3, 'Apex', 'active'),
(3, 3, 'Bata', 'active'),
(4, 5, 'Asus', 'active'),
(5, 5, 'Dell', 'active'),
(6, 2, 'Aghanoor ', 'active'),
(7, 2, 'Gul', 'active'),
(8, 4, 'Techniq', 'active'),
(9, 4, 'Mac', 'active'),
(10, 5, 'HP', 'active'),
(11, 1, 'Imported sunglasses', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `category_status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`) VALUES
(1, 'Lifestyle', 'active'),
(2, 'Dresses', 'active'),
(3, 'shoes', 'active'),
(4, 'Makeup', 'active'),
(5, 'Electronics', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order`
--

CREATE TABLE `inventory_order` (
  `inventory_order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inventory_order_total` double(10,2) NOT NULL,
  `inventory_order_date` date NOT NULL,
  `inventory_order_name` varchar(255) NOT NULL,
  `inventory_order_address` text NOT NULL,
  `payment_status` enum('cash','credit') NOT NULL,
  `inventory_order_status` varchar(100) NOT NULL,
  `inventory_order_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_order`
--

INSERT INTO `inventory_order` (`inventory_order_id`, `user_id`, `inventory_order_total`, `inventory_order_date`, `inventory_order_name`, `inventory_order_address`, `payment_status`, `inventory_order_status`, `inventory_order_created_date`) VALUES
(1, 1, 1050.00, '2022-01-11', 'Dori', 'Dhaka,Bangladesh', 'cash', 'active', '2022-01-11'),
(27, 1, 1575.00, '2022-01-10', 'john', 'Bangladesh', 'cash', 'active', '2022-01-11'),
(28, 1, 67200.00, '2022-01-12', 'ron', 'Dhaka', 'credit', 'active', '2022-01-11'),
(29, 3, 3090.00, '2022-01-10', 'mina', 'sylet.', 'credit', 'active', '2022-01-11'),
(30, 3, 19800.00, '2022-01-09', 'hinaaa', 'Dhaka,Bangladesh', 'cash', 'active', '2022-01-11'),
(31, 2, 18900.00, '2022-01-03', 'harry', 'london', 'credit', 'active', '2022-01-11'),
(32, 2, 420.00, '2022-01-10', 'abcd', 'Bangladesh', 'cash', 'active', '2022-01-11'),
(33, 2, 3510.00, '2022-01-12', 'mimi', 'Dhaka,Bangladesh', 'cash', 'active', '2022-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_order_product`
--

CREATE TABLE `inventory_order_product` (
  `inventory_order_product_id` int(11) NOT NULL,
  `inventory_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `tax` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_order_product`
--

INSERT INTO `inventory_order_product` (`inventory_order_product_id`, `inventory_order_id`, `product_id`, `quantity`, `price`, `tax`) VALUES
(1, 1, 7, 2, 500.00, 5.00),
(58, 27, 2, 1, 1500.00, 5.00),
(59, 28, 4, 1, 60000.00, 12.00),
(60, 29, 8, 1, 3000.00, 3.00),
(61, 30, 5, 2, 9000.00, 10.00),
(62, 31, 27, 2, 9000.00, 5.00),
(63, 32, 28, 1, 400.00, 5.00),
(64, 33, 28, 1, 400.00, 5.00),
(65, 33, 26, 1, 3000.00, 3.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_name` varchar(300) NOT NULL,
  `product_description` text NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_unit` varchar(150) NOT NULL,
  `product_base_price` double(10,2) NOT NULL,
  `product_tax` decimal(4,2) NOT NULL,
  `product_minimum_order` double(10,2) NOT NULL,
  `product_enter_by` int(11) NOT NULL,
  `product_status` enum('active','inactive') NOT NULL,
  `product_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `brand_id`, `product_name`, `product_description`, `product_quantity`, `product_unit`, `product_base_price`, `product_tax`, `product_minimum_order`, `product_enter_by`, `product_status`, `product_date`) VALUES
(23, 2, 6, 'december collection', 'cotton febric', 10, 'Box', 9000.00, '12.00', 0.00, 1, 'active', '2022-01-11'),
(24, 5, 10, 'laptop1', 'new', 55, 'Box', 60000.00, '10.00', 0.00, 1, 'active', '2022-01-11'),
(25, 1, 11, 'Sunglass1', 'black', 10, 'Packet', 400.00, '5.00', 0.00, 1, 'active', '2022-01-11'),
(26, 1, 1, 'watch1', 'ladies', 100, 'Packet', 3000.00, '3.00', 0.00, 1, 'active', '2022-01-11'),
(27, 4, 9, 'lip01', 'red', 40, 'Packet', 9000.00, '5.00', 0.00, 1, 'active', '2022-01-11'),
(28, 4, 8, 'eye2', 'glitter', 55, 'Packet', 400.00, '5.00', 0.00, 1, 'active', '2022-01-11'),
(29, 3, 3, 'shoe2', 'gents', 10, 'Box', 1500.00, '3.00', 0.00, 1, 'active', '2022-01-11'),
(30, 3, 2, 'shoe2', 'gents', 60, 'Box', 3000.00, '5.00', 0.00, 1, 'active', '2022-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_type` enum('master','user') NOT NULL,
  `user_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_email`, `user_password`, `user_name`, `user_type`, `user_status`) VALUES
(1, 'mow.monira@gmail.com', '$2y$10$Wfpln5E2.cs587u9cWqziep2XjPFXPbpN8FcpicizGQBbwUVwKvLq', 'mow', 'master', 'Active'),
(2, 'a@gmail.com', '$2y$10$0NBRnDGRVKm6YbCWjsZO8u0pmnc7IW3kIhsZIIpq2SEH6HHM/gVC2', 'a1', 'user', 'Active'),
(3, 'b@gmail.com', '$2y$10$24byoklnis5cKgEftyLavOv.7i8Q50DWxVsvESc1xzoeHpdm4e1Ea', 'b2', 'user', 'Active'),
(11, 'c@gmail.com', '$2y$10$ITZhJdM70cAJczpDLbS7NOGNclXxATTGr7J3eUoMLWHnsZttV0BLS', 'm', 'user', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `inventory_order`
--
ALTER TABLE `inventory_order`
  ADD PRIMARY KEY (`inventory_order_id`);

--
-- Indexes for table `inventory_order_product`
--
ALTER TABLE `inventory_order_product`
  ADD PRIMARY KEY (`inventory_order_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inventory_order`
--
ALTER TABLE `inventory_order`
  MODIFY `inventory_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `inventory_order_product`
--
ALTER TABLE `inventory_order_product`
  MODIFY `inventory_order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
