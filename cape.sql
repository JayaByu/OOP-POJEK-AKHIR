SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
