-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2022 at 03:50 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cape`
--

-- --------------------------------------------------------

--
-- Table structure for table `beverage`
--

CREATE TABLE `beverage` (
  `MenuID` varchar(5) NOT NULL,
  `BeverageName` varchar(255) NOT NULL,
  `BeveragePrice` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` varchar(5) NOT NULL,
  `CustomerName` char(255) NOT NULL,
  `CustomerPhone` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `snack`
--

CREATE TABLE `snack` (
  `MenuID` varchar(5) NOT NULL,
  `SnackName` varchar(255) NOT NULL,
  `SnackPrice` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionID` varchar(5) NOT NULL,
  `CustomerID` varchar(5) NOT NULL,
  `MenuID` varchar(5) NOT NULL,
  `Quantity` int(255) DEFAULT NULL,
  `TotalPembayaran` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beverage`
--
ALTER TABLE `beverage`
  ADD PRIMARY KEY (`MenuID`),
  ADD UNIQUE KEY `MenuID` (`MenuID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`MenuID`),
  ADD UNIQUE KEY `MenuID` (`MenuID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD UNIQUE KEY `CustomerID` (`CustomerID`),
  ADD UNIQUE KEY `MenuID` (`MenuID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beverage`
--
ALTER TABLE `beverage`
  ADD CONSTRAINT `beverage_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `transaction` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `transaction` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `snack`
--
ALTER TABLE `snack`
  ADD CONSTRAINT `snack_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `transaction` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
