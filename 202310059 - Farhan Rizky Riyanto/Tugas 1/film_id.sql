-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2023 at 11:02 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `film_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `ID` int(10) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ID` int(10) NOT NULL,
  `CityID` int(10) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `Address2` varchar(50) NOT NULL,
  `District` int(20) NOT NULL,
  `Postal_Code` varchar(10) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(10) NOT NULL,
  `CountryID` int(10) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ID` int(10) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) DEFAULT NULL,
  `AddressColumn` int(10) DEFAULT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `ID` int(10) NOT NULL,
  `LanguageID` int(10) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Release_Year` int(4) NOT NULL,
  `Rental_Duration` int(10) NOT NULL,
  `Rental_Rate` decimal(19,0) NOT NULL,
  `Length` int(2) NOT NULL,
  `Replacement_Cost` decimal(19,0) NOT NULL,
  `Rating` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Special_Features` varchar(255) NOT NULL,
  `Full_Text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `film_actor`
--

CREATE TABLE `film_actor` (
  `FilmID` int(10) DEFAULT NULL,
  `ActorID` int(10) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `film_category`
--

CREATE TABLE `film_category` (
  `FilmID` int(10) DEFAULT NULL,
  `CategoryID` int(10) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ID` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `ID` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `ID` int(10) NOT NULL,
  `Amount` decimal(19,0) NOT NULL,
  `Payment_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `RentalID` int(10) DEFAULT NULL,
  `CustomerID` int(10) DEFAULT NULL,
  `StaffID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `ID` int(10) NOT NULL,
  `Rental_Date` date NOT NULL DEFAULT curdate(),
  `Return_Date` date NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `StaffID` int(10) DEFAULT NULL,
  `CustomerID` int(10) DEFAULT NULL,
  `InventoryID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID` int(10) NOT NULL,
  `AddressID` int(10) DEFAULT NULL,
  `StoreID` int(10) DEFAULT NULL,
  `PaymentID` int(10) DEFAULT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL,
  `Username` varchar(16) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PictureURL` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `ID` int(10) NOT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddressID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CityCountry` (`CountryID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `AddressColumn` (`AddressID`),
  ADD UNIQUE KEY `AddressColumn_2` (`AddressID`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LanguageID` (`LanguageID`);

--
-- Indexes for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD KEY `FilmID` (`FilmID`),
  ADD KEY `ActorID` (`ActorID`);

--
-- Indexes for table `film_category`
--
ALTER TABLE `film_category`
  ADD KEY `FilmID` (`FilmID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RentalID` (`RentalID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `InventoryID` (`InventoryID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StoreID` (`StoreID`),
  ADD KEY `AddressID` (`AddressID`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AddressID` (`AddressID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `customer` (`AddressID`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`CityID`) REFERENCES `city` (`ID`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_CityCountry` FOREIGN KEY (`CountryID`) REFERENCES `country` (`ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`);

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`LanguageID`) REFERENCES `language` (`ID`);

--
-- Constraints for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `film_actor_ibfk_1` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`),
  ADD CONSTRAINT `film_actor_ibfk_2` FOREIGN KEY (`ActorID`) REFERENCES `actor` (`ID`);

--
-- Constraints for table `film_category`
--
ALTER TABLE `film_category`
  ADD CONSTRAINT `film_category_ibfk_1` FOREIGN KEY (`FilmID`) REFERENCES `film` (`ID`),
  ADD CONSTRAINT `film_category_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`);

--
-- Constraints for table `language`
--
ALTER TABLE `language`
  ADD CONSTRAINT `FK_FilmLanguage` FOREIGN KEY (`ID`) REFERENCES `film` (`ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`ID`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`ID`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`ID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `store` (`ID`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`),
  ADD CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
