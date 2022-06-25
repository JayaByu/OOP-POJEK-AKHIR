-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2022 at 05:03 PM
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
-- Database: `caffe`
--

-- --------------------------------------------------------

--
-- Table structure for table `beverage`
--

CREATE TABLE `beverage` (
  `BeverageID` char(5) NOT NULL,
  `BeverageName` varchar(255) DEFAULT NULL,
  `BeveragePrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beverage`
--

INSERT INTO `beverage` (`BeverageID`, `BeverageName`, `BeveragePrice`) VALUES
('B0001', 'AQUA', 1000),
('B0002', 'KOPI LUAQ', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` char(5) NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `CustomerPhone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerPhone`) VALUES
('C0001', 'ALDI CUPANG', '08560602028'),
('C0002', 'ERNES GAY', '08621312324'),
('C0003', 'RICKY WIBU', '08560601233');

-- --------------------------------------------------------

--
-- Table structure for table `snack`
--

CREATE TABLE `snack` (
  `SnackID` char(5) NOT NULL,
  `SnackName` varchar(255) DEFAULT NULL,
  `SnackPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `snack`
--

INSERT INTO `snack` (`SnackID`, `SnackName`, `SnackPrice`) VALUES
('S0001', 'Kentang', 2000),
('S0002', 'TELO GORENG', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `transactionmenu`
--

CREATE TABLE `transactionmenu` (
  `TransactionID` char(5) NOT NULL,
  `BeverageID` char(5) DEFAULT NULL,
  `SnackID` char(5) DEFAULT NULL,
  `CustomerID` char(5) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPembayaran` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactionmenu`
--

INSERT INTO `transactionmenu` (`TransactionID`, `BeverageID`, `SnackID`, `CustomerID`, `Quantity`, `TotalPembayaran`) VALUES
('T0001', 'B0001', NULL, 'C0001', 1, 1000),
('T0002', 'B0002', 'S0002', 'C0002', 2, 10000),
('T0003', NULL, 'S0001', 'C0003', 1, 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beverage`
--
ALTER TABLE `beverage`
  ADD PRIMARY KEY (`BeverageID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`SnackID`);

--
-- Indexes for table `transactionmenu`
--
ALTER TABLE `transactionmenu`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `BeverageID` (`BeverageID`),
  ADD KEY `SnackID` (`SnackID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactionmenu`
--
ALTER TABLE `transactionmenu`
  ADD CONSTRAINT `transactionmenu_ibfk_1` FOREIGN KEY (`BeverageID`) REFERENCES `beverage` (`BeverageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionmenu_ibfk_2` FOREIGN KEY (`SnackID`) REFERENCES `snack` (`SnackID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionmenu_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
