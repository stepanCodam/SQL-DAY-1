-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2022 at 03:03 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `model` varchar(55) DEFAULT NULL,
  `plate_number` int(11) NOT NULL,
  `pass_capacity` int(11) DEFAULT NULL,
  `driver` varchar(55) DEFAULT NULL,
  `fk_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`model`, `plate_number`, `pass_capacity`, `driver`, `fk_code`) VALUES
('Ikarus', 666, 90, 'Valdemar Pitunovich', 3451),
('MAN', 2341, 80, 'MIkola', 1666),
('Mercedes', 5603291, 100, 'Pedro', 2451);

-- --------------------------------------------------------

--
-- Table structure for table `busrouting`
--

CREATE TABLE `busrouting` (
  `city` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `phone_number` int(11) NOT NULL,
  `fk_destination` int(11) NOT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `busrouting`
--

INSERT INTO `busrouting` (`city`, `address`, `phone_number`, `fk_destination`, `order_number`) VALUES
('Krakow', 'Wiedzmin Pinis 321/2', 65296585, 1666, 9583),
('Bern', 'Schnitzelgasse 66/9', 887976544, 2451, 890897),
('Katowice', 'Pizdograd 910/67', 2147483647, 3451, 34556);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `destination` varchar(55) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `total_distance_km` int(11) DEFAULT NULL,
  `starting_source` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`destination`, `code`, `total_distance_km`, `starting_source`) VALUES
('Vienna', 1666, 2000, 'Lviv Ukraine'),
('Madrid', 2451, 3000, 'Lviv'),
('Berlin', 3451, 2500, 'Warsaw');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`plate_number`),
  ADD KEY `fk_code` (`fk_code`);

--
-- Indexes for table `busrouting`
--
ALTER TABLE `busrouting`
  ADD PRIMARY KEY (`phone_number`),
  ADD KEY `fk_code` (`fk_destination`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`fk_code`) REFERENCES `route` (`code`);

--
-- Constraints for table `busrouting`
--
ALTER TABLE `busrouting`
  ADD CONSTRAINT `busrouting_ibfk_1` FOREIGN KEY (`fk_destination`) REFERENCES `route` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
