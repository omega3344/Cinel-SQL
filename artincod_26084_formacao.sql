-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 23, 2023 at 07:15 PM
-- Server version: 8.0.31
-- PHP Version: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artincod_26084_formacao`
--

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `id` int NOT NULL,
  `curso` varchar(100) NOT NULL,
  `regime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id`, `curso`, `regime`) VALUES
(1, 'CET Multimedia', 'Pos Laboral'),
(2, 'CET Multimedia', 'Laboral'),
(3, 'CET Redes', 'Pos Laboral'),
(4, 'CET Redes', 'Laboral'),
(5, 'CET Sistemas de Informacao', 'Labora'),
(6, 'CET Sistemas de Informacao', 'Pos Laboral'),
(7, 'CET de Automacao', 'Laboral'),
(8, 'CET de Automacao', 'Pos Laboral'),
(9, 'EFA de Redes', 'Pos Laboral'),
(10, 'EFA de Sistemas', 'Laboral');

-- --------------------------------------------------------

--
-- Table structure for table `formando`
--

CREATE TABLE `formando` (
  `idFormando` int NOT NULL,
  `nome` varchar(50) CHARACTER SET latin7 COLLATE latin7_general_ci DEFAULT NULL,
  `apelido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin7;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formando`
--
ALTER TABLE `formando`
  ADD PRIMARY KEY (`idFormando`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
