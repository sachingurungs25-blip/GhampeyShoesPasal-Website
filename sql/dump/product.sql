-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 06:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ghyampes_shoes`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Item_name` varchar(200) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Before_Price` decimal(10,2) DEFAULT 0.00,
  `Description` text DEFAULT NULL,
  `Image_URL` varchar(255) DEFAULT NULL,
  `Stock` int(11) DEFAULT 10,
  `Category` varchar(100) DEFAULT NULL,
  `Admin_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Item_name`, `Price`, `Before_Price`, `Description`, `Image_URL`, `Stock`, `Category`, `Admin_ID`) VALUES
(1, 'Neon Velocity Runner', 18500.00, 0.00, NULL, NULL, 10, 'Men\'s Running Shoe', 1),
(2, 'Classic Gold Edition', 12000.00, 0.00, NULL, NULL, 7, 'Unisex Casual Sneaker', 1),
(3, 'Mahogany Oxford', 22500.00, 0.00, NULL, NULL, 10, 'Men\'s Formal Shoe', 1),
(4, 'Court Dominator Elite', 25000.00, 0.00, NULL, NULL, 10, 'Men\'s Basketball Shoe', 1),
(5, 'Air Jordan 1 Retro', 18500.00, 22000.00, 'Classic basketball shoes.', 'images/basketball_shoe_1777806717532.png', 10, 'Men', 1),
(6, 'Classic White Sneaker', 4500.00, 0.00, 'Clean and minimal sneakers.', 'images/casual_sneaker_1777806486456.png', 10, 'Women', 1),
(7, 'Premium Oxford Formal', 7200.00, 8500.00, 'Elegant leather formal shoes.', 'images/formal_shoe_1777806518757.png', 9, 'Men', 1),
(8, 'Ultra Boost Running', 12000.00, 0.00, 'High-performance running shoes.', 'images/running_shoe_1777806317504.png', 10, 'Men', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
