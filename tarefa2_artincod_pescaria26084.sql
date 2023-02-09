-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 09, 2023 at 03:19 PM
-- Server version: 10.3.37-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artincod_pescaria26084`
--

-- --------------------------------------------------------

--
-- Table structure for table `barco`
--

CREATE TABLE `barco` (
  `idBarco` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `pesoMaximo` int(11) NOT NULL,
  `tripulacao` int(11) NOT NULL,
  `comprimento` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barco`
--

INSERT INTO `barco` (`idBarco`, `nome`, `pesoMaximo`, `tripulacao`, `comprimento`) VALUES
(1, 'Aurélio', 100000, 2, '10.0'),
(2, 'Simone', 20000, 3, '6.0'),
(3, 'Batista', 50000, 3, '8.0'),
(4, 'Fortunato', 40000, 2, '10.0'),
(5, 'Evaristo', 45000, 2, '6.0'),
(6, 'Afonso', 30000, 3, '8.0');

-- --------------------------------------------------------

--
-- Stand-in structure for view `P1`
-- (See below for the actual view)
--
CREATE TABLE `P1` (
`idPescador` int(11)
,`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P2`
-- (See below for the actual view)
--
CREATE TABLE `P2` (
`idPeixe` int(11)
,`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P3`
-- (See below for the actual view)
--
CREATE TABLE `P3` (
`numero` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P4`
-- (See below for the actual view)
--
CREATE TABLE `P4` (
`numero` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P5`
-- (See below for the actual view)
--
CREATE TABLE `P5` (
`idPescaria` int(11)
,`dataReg` text
,`numero` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P6`
-- (See below for the actual view)
--
CREATE TABLE `P6` (
`idPescaria` int(11)
,`dataReg` text
,`numero` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P7`
-- (See below for the actual view)
--
CREATE TABLE `P7` (
`idPescaria` int(11)
,`dataReg` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P8`
-- (See below for the actual view)
--
CREATE TABLE `P8` (
`idPescaria` int(11)
,`dataReg` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P9`
-- (See below for the actual view)
--
CREATE TABLE `P9` (
`idBarco` int(11)
,`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P10`
-- (See below for the actual view)
--
CREATE TABLE `P10` (
`idBarco` int(11)
,`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P11`
-- (See below for the actual view)
--
CREATE TABLE `P11` (
`idPescador` int(11)
,`nome` varchar(100)
,`numero` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P12`
-- (See below for the actual view)
--
CREATE TABLE `P12` (
`idPeixe` int(11)
,`nome` varchar(100)
,`numero` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P13`
-- (See below for the actual view)
--
CREATE TABLE `P13` (
`idPescaria` int(11)
,`dataReg` text
,`media` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P14`
-- (See below for the actual view)
--
CREATE TABLE `P14` (
`idPescaria` int(11)
,`dataReg` text
,`peso` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P15`
-- (See below for the actual view)
--
CREATE TABLE `P15` (
`idPescaria` int(11)
,`idBarco` int(11)
,`pesoMaximo` int(11)
,`total` decimal(32,0)
,`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P16`
-- (See below for the actual view)
--
CREATE TABLE `P16` (
`idPescaria` int(11)
,`pesoMaximo` int(11)
,`total` decimal(32,0)
,`idPeixe` int(11)
,`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `peixe`
--

CREATE TABLE `peixe` (
  `idPeixe` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `pesoMedio` decimal(4,1) NOT NULL,
  `preco` decimal(4,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `peixe`
--

INSERT INTO `peixe` (`idPeixe`, `nome`, `pesoMedio`, `preco`) VALUES
(1, 'Faneca', '0.2', '5.0'),
(2, 'Carapau', '18.5', '6.0'),
(3, 'Dourada', '3.5', '12.5'),
(4, 'Pescada', '1.2', '7.5'),
(5, 'Cavala', '2.0', '8.0'),
(6, 'Atum', '12.0', '15.0'),
(7, 'Peixe espada', '100.0', '12.0'),
(8, 'Peixe gato', '200.0', '14.5');

-- --------------------------------------------------------

--
-- Table structure for table `pescado`
--

CREATE TABLE `pescado` (
  `idPescado` int(11) NOT NULL,
  `idPescaria` int(11) NOT NULL,
  `idPeixe` int(11) NOT NULL,
  `peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pescado`
--

INSERT INTO `pescado` (`idPescado`, `idPescaria`, `idPeixe`, `peso`) VALUES
(1, 1, 1, 10000),
(2, 1, 5, 20000),
(3, 2, 6, 15000),
(4, 2, 4, 25000),
(5, 3, 2, 8000),
(6, 4, 8, 7000),
(7, 5, 7, 12000),
(8, 5, 8, 1000),
(9, 6, 4, 3000),
(10, 6, 2, 5000),
(11, 7, 1, 8500),
(12, 8, 6, 9000),
(13, 9, 6, 13000),
(14, 10, 4, 4000),
(15, 11, 7, 5000),
(16, 12, 8, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `pescador`
--

CREATE TABLE `pescador` (
  `idPescador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `idade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pescador`
--

INSERT INTO `pescador` (`idPescador`, `nome`, `cidade`, `idade`) VALUES
(1, 'Marco Rocha', 'Vila do Conde', 52),
(2, 'Miguel Abrantes', 'Aveiro', 44),
(3, 'Paulo Trindade', 'Afurada', 46),
(4, 'Jorge Vieira', 'Afurada', 45),
(5, 'Carlos Santana', 'Mira', 45),
(6, 'Daniel Oliveira', 'Ilhavo', 66),
(7, 'Ricardo Abreu', 'Ilhavo', 68),
(8, 'Luis Ralha', 'Vila do Conde', 35);

-- --------------------------------------------------------

--
-- Table structure for table `pescador_pescaria`
--

CREATE TABLE `pescador_pescaria` (
  `idPescadorPescaria` int(11) NOT NULL,
  `idPescador` int(11) NOT NULL,
  `idPescaria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pescador_pescaria`
--

INSERT INTO `pescador_pescaria` (`idPescadorPescaria`, `idPescador`, `idPescaria`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 8, 3),
(7, 6, 4),
(8, 5, 5),
(9, 8, 5),
(10, 1, 5),
(11, 2, 6),
(12, 4, 6),
(13, 3, 7),
(14, 8, 8),
(15, 6, 8),
(16, 5, 9),
(17, 1, 9),
(18, 1, 10),
(19, 3, 10),
(20, 4, 11),
(21, 8, 11),
(22, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `pescaria`
--

CREATE TABLE `pescaria` (
  `idPescaria` int(11) NOT NULL,
  `dataReg` text NOT NULL,
  `hora` time NOT NULL,
  `duracao` int(11) NOT NULL,
  `idBarco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pescaria`
--

INSERT INTO `pescaria` (`idPescaria`, `dataReg`, `hora`, `duracao`, `idBarco`) VALUES
(1, '2017-1-1', '06:00:00', 2, 1),
(2, '2017-1-1', '07:30:00', 1, 2),
(3, '2017-1-1', '08:00:00', 1, 4),
(4, '2017-1-2', '05:00:00', 4, 3),
(5, '2017-1-2', '05:30:00', 6, 4),
(6, '2017-1-2', '06:00:00', 2, 2),
(7, '2017-1-2', '06:30:00', 3, 6),
(8, '2017-1-3', '07:00:00', 4, 2),
(9, '2017-1-3', '07:30:00', 5, 4),
(10, '2017-1-4', '08:00:00', 1, 2),
(11, '2017-1-4', '09:30:00', 1, 3),
(12, '2017-1-5', '06:00:00', 3, 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_pescado`
-- (See below for the actual view)
--
CREATE TABLE `total_pescado` (
`idPescaria` int(11)
,`idBarco` int(11)
,`total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `P1`
--
DROP TABLE IF EXISTS `P1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P1`  AS SELECT `pescador`.`idPescador` AS `idPescador`, `pescador`.`nome` AS `nome` FROM ((`pescador` join `pescador_pescaria` on(`pescador`.`idPescador` = `pescador_pescaria`.`idPescador`)) join `pescaria` on(`pescador_pescaria`.`idPescaria` = `pescaria`.`idPescaria`)) WHERE `pescaria`.`dataReg` = '2017-1-3''2017-1-3'  ;

-- --------------------------------------------------------

--
-- Structure for view `P2`
--
DROP TABLE IF EXISTS `P2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P2`  AS SELECT `peixe`.`idPeixe` AS `idPeixe`, `peixe`.`nome` AS `nome` FROM ((`peixe` join `pescado` on(`peixe`.`idPeixe` = `pescado`.`idPeixe`)) join `pescaria` on(`pescado`.`idPescaria` = `pescaria`.`idPescaria`)) WHERE `pescaria`.`dataReg` = '2017-1-3' GROUP BY `peixe`.`idPeixe``idPeixe`  ;

-- --------------------------------------------------------

--
-- Structure for view `P3`
--
DROP TABLE IF EXISTS `P3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P3`  AS SELECT count(`pescaria`.`idPescaria`) AS `numero` FROM `pescaria` WHERE `pescaria`.`dataReg` = '2017-1-2''2017-1-2'  ;

-- --------------------------------------------------------

--
-- Structure for view `P4`
--
DROP TABLE IF EXISTS `P4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P4`  AS SELECT count(`barco`.`idBarco`) AS `numero` FROM `barco` WHERE `barco`.`pesoMaximo` > 3500035000  ;

-- --------------------------------------------------------

--
-- Structure for view `P5`
--
DROP TABLE IF EXISTS `P5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P5`  AS SELECT `pescaria`.`idPescaria` AS `idPescaria`, `pescaria`.`dataReg` AS `dataReg`, count(`pescador_pescaria`.`idPescador`) AS `numero` FROM (`pescaria` join `pescador_pescaria` on(`pescaria`.`idPescaria` = `pescador_pescaria`.`idPescaria`)) GROUP BY `pescaria`.`idPescaria``idPescaria`  ;

-- --------------------------------------------------------

--
-- Structure for view `P6`
--
DROP TABLE IF EXISTS `P6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P6`  AS SELECT `pescaria`.`idPescaria` AS `idPescaria`, `pescaria`.`dataReg` AS `dataReg`, count(`pescado`.`idPeixe`) AS `numero` FROM (`pescaria` join `pescado` on(`pescaria`.`idPescaria` = `pescado`.`idPescaria`)) GROUP BY `pescaria`.`idPescaria``idPescaria`  ;

-- --------------------------------------------------------

--
-- Structure for view `P7`
--
DROP TABLE IF EXISTS `P7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P7`  AS SELECT `pescaria`.`idPescaria` AS `idPescaria`, `pescaria`.`dataReg` AS `dataReg` FROM (`pescaria` join `pescado` on(`pescaria`.`idPescaria` = `pescado`.`idPescaria`)) GROUP BY `pescaria`.`idPescaria` HAVING sum(`pescado`.`peso`) > 1000010000  ;

-- --------------------------------------------------------

--
-- Structure for view `P8`
--
DROP TABLE IF EXISTS `P8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P8`  AS SELECT `pescaria`.`idPescaria` AS `idPescaria`, `pescaria`.`dataReg` AS `dataReg` FROM ((`pescaria` join `pescador_pescaria` on(`pescaria`.`idPescaria` = `pescador_pescaria`.`idPescaria`)) join `pescador` on(`pescador_pescaria`.`idPescador` = `pescador`.`idPescador`)) GROUP BY `pescaria`.`idPescaria` HAVING sum(`pescador`.`idade`) / count(`pescador`.`idade`) > 5050  ;

-- --------------------------------------------------------

--
-- Structure for view `P9`
--
DROP TABLE IF EXISTS `P9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P9`  AS SELECT `barco`.`idBarco` AS `idBarco`, `barco`.`nome` AS `nome` FROM `barco` WHERE !(`barco`.`idBarco` in (select `pescaria`.`idBarco` from ((`pescado` join `peixe` on(`pescado`.`idPeixe` = `peixe`.`idPeixe`)) join `pescaria` on(`pescado`.`idPescaria` = `pescaria`.`idPescaria`)) where `peixe`.`nome` like 'Atum'))  ;

-- --------------------------------------------------------

--
-- Structure for view `P10`
--
DROP TABLE IF EXISTS `P10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P10`  AS SELECT `barco`.`idBarco` AS `idBarco`, `barco`.`nome` AS `nome` FROM `barco` WHERE !(`barco`.`idBarco` in (select `pescaria`.`idBarco` from ((`pescador` join `pescador_pescaria` on(`pescador`.`idPescador` = `pescador_pescaria`.`idPescador`)) join `pescaria` on(`pescador_pescaria`.`idPescaria` = `pescaria`.`idPescaria`)) where `pescador`.`nome` like 'Paulo Trindade'))  ;

-- --------------------------------------------------------

--
-- Structure for view `P11`
--
DROP TABLE IF EXISTS `P11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P11`  AS SELECT `pescador`.`idPescador` AS `idPescador`, `pescador`.`nome` AS `nome`, count(`pescador_pescaria`.`idPescador`) AS `numero` FROM (`pescador` left join `pescador_pescaria` on(`pescador`.`idPescador` = `pescador_pescaria`.`idPescador`)) GROUP BY `pescador`.`idPescador` ORDER BY count(`pescador_pescaria`.`idPescador`) ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P12`
--
DROP TABLE IF EXISTS `P12`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P12`  AS SELECT `peixe`.`idPeixe` AS `idPeixe`, `peixe`.`nome` AS `nome`, count(`pescado`.`idPescaria`) AS `numero` FROM (`peixe` left join `pescado` on(`peixe`.`idPeixe` = `pescado`.`idPeixe`)) GROUP BY `peixe`.`idPeixe` ORDER BY count(`pescado`.`idPescaria`) AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P13`
--
DROP TABLE IF EXISTS `P13`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P13`  AS SELECT `pescador_pescaria`.`idPescaria` AS `idPescaria`, `pescaria`.`dataReg` AS `dataReg`, avg(`pescador`.`idade`) AS `media` FROM ((`pescador` join `pescador_pescaria` on(`pescador`.`idPescador` = `pescador_pescaria`.`idPescador`)) join `pescaria` on(`pescador_pescaria`.`idPescaria` = `pescaria`.`idPescaria`)) GROUP BY `pescador_pescaria`.`idPescaria` HAVING `media` <= all (select avg(`pescador`.`idade`) from (`pescador` join `pescador_pescaria` on(`pescador`.`idPescador` = `pescador_pescaria`.`idPescador`)) group by `pescador_pescaria`.`idPescaria`)  ;

-- --------------------------------------------------------

--
-- Structure for view `P14`
--
DROP TABLE IF EXISTS `P14`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P14`  AS SELECT `pescaria`.`idPescaria` AS `idPescaria`, `pescaria`.`dataReg` AS `dataReg`, sum(`pescado`.`peso`) AS `peso` FROM (`pescaria` join `pescado` on(`pescaria`.`idPescaria` = `pescado`.`idPescaria`)) GROUP BY `pescaria`.`idPescaria` HAVING `peso` <= all (select sum(`pescado`.`peso`) from `pescado` group by `pescado`.`idPescaria`)  ;

-- --------------------------------------------------------

--
-- Structure for view `P15`
--
DROP TABLE IF EXISTS `P15`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P15`  AS SELECT `pescaria`.`idPescaria` AS `idPescaria`, `total_pescado`.`idBarco` AS `idBarco`, `barco`.`pesoMaximo` AS `pesoMaximo`, `total_pescado`.`total` AS `total`, `pescador`.`nome` AS `nome` FROM ((((`total_pescado` join `barco` on(`total_pescado`.`idBarco` = `barco`.`idBarco`)) join `pescaria` on(`total_pescado`.`idPescaria` = `pescaria`.`idPescaria`)) join `pescador_pescaria` on(`total_pescado`.`idPescaria` = `pescador_pescaria`.`idPescaria`)) join `pescador` on(`pescador_pescaria`.`idPescador` = `pescador`.`idPescador`)) WHERE `total_pescado`.`total` > `barco`.`pesoMaximo` GROUP BY `pescador`.`nome``nome`  ;

-- --------------------------------------------------------

--
-- Structure for view `P16`
--
DROP TABLE IF EXISTS `P16`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P16`  AS SELECT `pescado`.`idPescaria` AS `idPescaria`, `barco`.`pesoMaximo` AS `pesoMaximo`, `total_pescado`.`total` AS `total`, `peixe`.`idPeixe` AS `idPeixe`, `peixe`.`nome` AS `nome` FROM (((`total_pescado` join `barco` on(`total_pescado`.`idBarco` = `barco`.`idBarco`)) join `pescado` on(`total_pescado`.`idPescaria` = `pescado`.`idPescaria`)) join `peixe` on(`pescado`.`idPeixe` = `peixe`.`idPeixe`)) WHERE `total_pescado`.`total` > `barco`.`pesoMaximo``pesoMaximo`  ;

-- --------------------------------------------------------

--
-- Structure for view `total_pescado`
--
DROP TABLE IF EXISTS `total_pescado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `total_pescado`  AS SELECT `pescado`.`idPescaria` AS `idPescaria`, `pescaria`.`idBarco` AS `idBarco`, sum(`pescado`.`peso`) AS `total` FROM (`pescado` join `pescaria` on(`pescado`.`idPescaria` = `pescaria`.`idPescaria`)) GROUP BY `pescado`.`idPescaria``idPescaria`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barco`
--
ALTER TABLE `barco`
  ADD PRIMARY KEY (`idBarco`);

--
-- Indexes for table `peixe`
--
ALTER TABLE `peixe`
  ADD PRIMARY KEY (`idPeixe`);

--
-- Indexes for table `pescado`
--
ALTER TABLE `pescado`
  ADD PRIMARY KEY (`idPescado`),
  ADD KEY `idPescaria` (`idPescaria`),
  ADD KEY `idPeixe` (`idPeixe`);

--
-- Indexes for table `pescador`
--
ALTER TABLE `pescador`
  ADD PRIMARY KEY (`idPescador`);

--
-- Indexes for table `pescador_pescaria`
--
ALTER TABLE `pescador_pescaria`
  ADD PRIMARY KEY (`idPescadorPescaria`),
  ADD KEY `idPescador` (`idPescador`),
  ADD KEY `idPescaria` (`idPescaria`);

--
-- Indexes for table `pescaria`
--
ALTER TABLE `pescaria`
  ADD PRIMARY KEY (`idPescaria`),
  ADD KEY `idBarco` (`idBarco`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barco`
--
ALTER TABLE `barco`
  MODIFY `idBarco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peixe`
--
ALTER TABLE `peixe`
  MODIFY `idPeixe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pescado`
--
ALTER TABLE `pescado`
  MODIFY `idPescado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pescador`
--
ALTER TABLE `pescador`
  MODIFY `idPescador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pescador_pescaria`
--
ALTER TABLE `pescador_pescaria`
  MODIFY `idPescadorPescaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pescaria`
--
ALTER TABLE `pescaria`
  MODIFY `idPescaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pescado`
--
ALTER TABLE `pescado`
  ADD CONSTRAINT `pescado_ibfk_1` FOREIGN KEY (`idPescaria`) REFERENCES `pescaria` (`idPescaria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pescado_ibfk_2` FOREIGN KEY (`idPeixe`) REFERENCES `peixe` (`idPeixe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pescador_pescaria`
--
ALTER TABLE `pescador_pescaria`
  ADD CONSTRAINT `pescador_pescaria_ibfk_1` FOREIGN KEY (`idPescador`) REFERENCES `pescador` (`idPescador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pescador_pescaria_ibfk_2` FOREIGN KEY (`idPescaria`) REFERENCES `pescaria` (`idPescaria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pescaria`
--
ALTER TABLE `pescaria`
  ADD CONSTRAINT `pescaria_ibfk_1` FOREIGN KEY (`idBarco`) REFERENCES `barco` (`idBarco`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
