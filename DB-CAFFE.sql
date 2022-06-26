SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `beverage` (
  `BeverageID` char(5) NOT NULL,
  `BeverageName` varchar(255) DEFAULT NULL,
  `BeveragePrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `beverage` (`BeverageID`, `BeverageName`, `BeveragePrice`) VALUES
('B0001', 'Air Mineral', 3000),
('B0002', 'Kopi Luak', 5000),
('B0003', 'Wedang Jahe', 6500),
('B0004', 'Kunyir Asem', 9000),
('B0005', 'Kopi Mandailing', 10000),
('B0006', 'Kopi Arjuna', 12000),
('B0007', 'Susu Madu', 4000),
('B0008', 'Ekstra Jos', 3000),
('B0009', 'Susu Jahe', 5000),
('B0010', 'V60', 14000),
('B0011', 'ToraBika', 2500),
('B0012', 'Kopi Toraja', 5000),
('B0013', 'Kopi Tjiberem', 6000);


CREATE TABLE `customer` (
  `CustomerID` char(5) NOT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `CustomerPhone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerPhone`) VALUES
('C0001', 'Aldi Dwi', '08560602028'),
('C0002', 'Ernes Gideon', '08621312324'),
('C0003', 'Yohanes Ricky', '08560601233'),
('C0004', 'Jayawardhana Bayu', '08123456789'),
('C0005', 'Bina Kaling', '098765463732'),
('C0006', 'Bekong Aton', '098765432112'),
('C0007', 'Fitri Siput', '098756792827'),
('C0008', 'Ame ga kuru', '051232883782'),
('C0009', 'Akasan',      '013223123113');


CREATE TABLE `snack` (
  `SnackID` char(5) NOT NULL,
  `SnackName` varchar(255) DEFAULT NULL,
  `SnackPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `snack` (`SnackID`, `SnackName`, `SnackPrice`) VALUES
('S0001', 'Kentang', 2000),
('S0002', 'TELO GORENG', 5000),
('S0003', 'Kue Cubit', 15000),
('S0004', 'Mozza Stick', 30000),
('S0005', 'Pizza Kecil', 25000),
('S0006', 'Pizza Medium', 45000),
('S0007', 'Pizza Large', 60000),
('S0008', 'Lasagna Mozarela', 40000),
('S0009', 'Lasagna Sapi', 50000),
('S0010', 'Sosis Bakar', 6000),
('S0011', 'Sosis Kentang', 12000),
('S0012', 'Sosis Goreng', 11000),
('S0013', 'Ayam Bakar', 25000),
('S0014', 'Ayam Geprek', 15000);

CREATE TABLE `transactionmenu` (
  `TransactionID` char(5) NOT NULL,
  `BeverageID` char(5) DEFAULT NULL,
  `SnackID` char(5) DEFAULT NULL,
  `CustomerID` char(5) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPembayaran` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



ALTER TABLE `beverage`
  ADD PRIMARY KEY (`BeverageID`);


ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

ALTER TABLE `snack`
  ADD PRIMARY KEY (`SnackID`);


ALTER TABLE `transactionmenu`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `BeverageID` (`BeverageID`),
  ADD KEY `SnackID` (`SnackID`),
  ADD KEY `CustomerID` (`CustomerID`);

ALTER TABLE `transactionmenu`
  ADD CONSTRAINT `transactionmenu_ibfk_1` FOREIGN KEY (`BeverageID`) REFERENCES `beverage` (`BeverageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionmenu_ibfk_2` FOREIGN KEY (`SnackID`) REFERENCES `snack` (`SnackID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactionmenu_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
