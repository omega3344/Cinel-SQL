-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2023 at 05:28 PM
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
-- Database: `artincod_aviacao26084`
--

-- --------------------------------------------------------

--
-- Table structure for table `aeroporto`
--

CREATE TABLE `aeroporto` (
  `idAeroporto` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aeroporto`
--

INSERT INTO `aeroporto` (`idAeroporto`, `nome`, `cidade`, `pais`) VALUES
(1, 'Sa Carneiro', 'Porto', 'Portugal'),
(2, 'Madeira', 'Funchal', 'Portugal'),
(3, 'Portela', 'Lisboa', 'Portugal'),
(4, 'Ponta Delgada', 'S. Miguel', 'Portugal'),
(5, 'Faro', 'Faro', 'Portugal'),
(8, 'Charles de Gaule', 'Paris', 'France'),
(9, 'Orly', 'Paris', 'France'),
(11, 'Heathrow', 'Londres', 'United Kingdom'),
(12, 'Gatwick', 'Londres', 'United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `aviao`
--

CREATE TABLE `aviao` (
  `idAviao` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idModelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aviao`
--

INSERT INTO `aviao` (`idAviao`, `nome`, `idModelo`) VALUES
(1, 'Scott Adams', 1),
(2, 'Milo Manara', 1),
(3, 'Serpieri', 5),
(4, 'Henki Bilal', 3),
(5, 'Gary Larson', 4),
(6, 'Bill Waterson', 4),
(7, 'J R R Tolkien', 3),
(8, 'Franquin', 3),
(9, 'Douglas Adams', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chegadas`
-- (See below for the actual view)
--
CREATE TABLE `chegadas` (
`idVooEscala` int(11)
,`idAeroporto` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cidadeChegadas`
-- (See below for the actual view)
--
CREATE TABLE `cidadeChegadas` (
`idVoo` int(11)
,`cidade` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cidadePartidas`
-- (See below for the actual view)
--
CREATE TABLE `cidadePartidas` (
`idVoo` int(11)
,`cidade` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL,
  `fabricante` varchar(50) NOT NULL,
  `versao` varchar(50) NOT NULL,
  `numMotores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`idModelo`, `fabricante`, `versao`, `numMotores`) VALUES
(1, 'Douglas', 'DC-10', 3),
(2, 'Boeing', '737', 2),
(3, 'Boeing', '747', 4),
(4, 'Airbus', 'A300', 2),
(5, 'Airbus', 'A340', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P1`
-- (See below for the actual view)
--
CREATE TABLE `P1` (
`nome` varchar(50)
,`cidade` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P2`
-- (See below for the actual view)
--
CREATE TABLE `P2` (
`nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P3`
-- (See below for the actual view)
--
CREATE TABLE `P3` (
`nome` varchar(50)
,`numMotores` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P4`
-- (See below for the actual view)
--
CREATE TABLE `P4` (
`Total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P5`
-- (See below for the actual view)
--
CREATE TABLE `P5` (
`IdModelo` int(11)
,`versao` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P6`
-- (See below for the actual view)
--
CREATE TABLE `P6` (
`idVoo` int(11)
,`duracao` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P7`
-- (See below for the actual view)
--
CREATE TABLE `P7` (
`idVooPartida` int(11)
,`idVooEscala` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P8`
-- (See below for the actual view)
--
CREATE TABLE `P8` (
`pais` varchar(50)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P9`
-- (See below for the actual view)
--
CREATE TABLE `P9` (
`idVoo` int(11)
,`cidade Partida` varchar(50)
,`cidade Chegada` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P10`
-- (See below for the actual view)
--
CREATE TABLE `P10` (
`idVoo` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P11`
-- (See below for the actual view)
--
CREATE TABLE `P11` (
`pais` varchar(50)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P12`
-- (See below for the actual view)
--
CREATE TABLE `P12` (
`pais` varchar(50)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P13`
-- (See below for the actual view)
--
CREATE TABLE `P13` (
`pais` varchar(50)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P14`
-- (See below for the actual view)
--
CREATE TABLE `P14` (
`fabricante` varchar(50)
,`versao` varchar(50)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P15`
-- (See below for the actual view)
--
CREATE TABLE `P15` (
`fabricante` varchar(50)
,`versao` varchar(50)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `partidas`
-- (See below for the actual view)
--
CREATE TABLE `partidas` (
`idVooPartida` int(11)
,`idAeroporto` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `voo`
--

CREATE TABLE `voo` (
  `idVoo` int(11) NOT NULL,
  `idAeroportoPartida` int(11) NOT NULL,
  `idAeroportoChegada` int(11) NOT NULL,
  `companhia` varchar(50) NOT NULL,
  `duracao` int(11) NOT NULL,
  `idAviao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `voo`
--

INSERT INTO `voo` (`idVoo`, `idAeroportoPartida`, `idAeroportoChegada`, `companhia`, `duracao`, `idAviao`) VALUES
(1001, 1, 2, 'TAP', 2, 1),
(1002, 2, 3, 'TAP', 1, 2),
(1003, 2, 12, 'BA', 2, 5),
(1004, 4, 3, 'SATA', 3, 6),
(1005, 9, 2, 'AirFrance', 2, 3),
(1006, 8, 11, 'BA', 1, 5),
(1007, 5, 1, 'TAP', 1, 5),
(1008, 3, 12, 'Portugalia', 3, 4),
(1009, 1, 3, 'Portugalia', 1, 2),
(1010, 12, 4, 'BA', 3, 3),
(1111, 1, 3, 'TAP', 2, 3);

-- --------------------------------------------------------

--
-- Structure for view `chegadas`
--
DROP TABLE IF EXISTS `chegadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `chegadas`  AS SELECT `voo`.`idVoo` AS `idVooEscala`, `voo`.`idAeroportoPartida` AS `idAeroporto` FROM `voo` WHERE `voo`.`idAeroportoChegada` = 11 OR `voo`.`idAeroportoChegada` = 1212  ;

-- --------------------------------------------------------

--
-- Structure for view `cidadeChegadas`
--
DROP TABLE IF EXISTS `cidadeChegadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `cidadeChegadas`  AS SELECT `voo`.`idVoo` AS `idVoo`, `aeroporto`.`cidade` AS `cidade` FROM (`voo` join `aeroporto` on(`aeroporto`.`idAeroporto` = `voo`.`idAeroportoChegada`))  ;

-- --------------------------------------------------------

--
-- Structure for view `cidadePartidas`
--
DROP TABLE IF EXISTS `cidadePartidas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `cidadePartidas`  AS SELECT `voo`.`idVoo` AS `idVoo`, `aeroporto`.`cidade` AS `cidade` FROM (`voo` join `aeroporto` on(`aeroporto`.`idAeroporto` = `voo`.`idAeroportoPartida`))  ;

-- --------------------------------------------------------

--
-- Structure for view `P1`
--
DROP TABLE IF EXISTS `P1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P1`  AS SELECT `aeroporto`.`nome` AS `nome`, `aeroporto`.`cidade` AS `cidade` FROM `aeroporto` WHERE `aeroporto`.`pais` like 'portugal''portugal'  ;

-- --------------------------------------------------------

--
-- Structure for view `P2`
--
DROP TABLE IF EXISTS `P2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P2`  AS SELECT `aviao`.`nome` AS `nome` FROM (`aviao` join `modelo` on(`aviao`.`idModelo` = `modelo`.`idModelo`)) WHERE `modelo`.`versao` like 'DC-10''DC-10'  ;

-- --------------------------------------------------------

--
-- Structure for view `P3`
--
DROP TABLE IF EXISTS `P3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P3`  AS SELECT `aviao`.`nome` AS `nome`, `modelo`.`numMotores` AS `numMotores` FROM (`aviao` join `modelo` on(`aviao`.`idModelo` = `modelo`.`idModelo`))  ;

-- --------------------------------------------------------

--
-- Structure for view `P4`
--
DROP TABLE IF EXISTS `P4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P4`  AS SELECT count(0) AS `Total` FROM `voo` WHERE `voo`.`duracao` = 2 OR `voo`.`duracao` = 33  ;

-- --------------------------------------------------------

--
-- Structure for view `P5`
--
DROP TABLE IF EXISTS `P5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P5`  AS SELECT `modelo`.`idModelo` AS `IdModelo`, `modelo`.`versao` AS `versao` FROM `modelo` WHERE `modelo`.`versao` like 'A3%''A3%'  ;

-- --------------------------------------------------------

--
-- Structure for view `P6`
--
DROP TABLE IF EXISTS `P6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P6`  AS SELECT `voo`.`idVoo` AS `idVoo`, `voo`.`duracao` AS `duracao` FROM `voo` ORDER BY `voo`.`duracao` DESC, `voo`.`idVoo` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P7`
--
DROP TABLE IF EXISTS `P7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P7`  AS SELECT `partidas`.`idVooPartida` AS `idVooPartida`, `chegadas`.`idVooEscala` AS `idVooEscala` FROM (`partidas` join `chegadas` on(`partidas`.`idAeroporto` = `chegadas`.`idAeroporto`))  ;

-- --------------------------------------------------------

--
-- Structure for view `P8`
--
DROP TABLE IF EXISTS `P8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P8`  AS SELECT `aeroporto`.`pais` AS `pais`, count(`aeroporto`.`pais`) AS `total` FROM `aeroporto` GROUP BY `aeroporto`.`pais` ORDER BY count(`aeroporto`.`pais`) ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P9`
--
DROP TABLE IF EXISTS `P9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P9`  AS SELECT `cidadePartidas`.`idVoo` AS `idVoo`, `cidadePartidas`.`cidade` AS `cidade Partida`, `cidadeChegadas`.`cidade` AS `cidade Chegada` FROM (`cidadePartidas` join `cidadeChegadas`) WHERE `cidadePartidas`.`idVoo` = `cidadeChegadas`.`idVoo` ORDER BY `cidadePartidas`.`idVoo` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P10`
--
DROP TABLE IF EXISTS `P10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P10`  AS SELECT `voo`.`idVoo` AS `idVoo` FROM (`voo` join `aeroporto` on(`aeroporto`.`idAeroporto` = `voo`.`idAeroportoPartida` and `voo`.`idAeroportoPartida` = 1 and `voo`.`idAeroportoChegada` = 3))  ;

-- --------------------------------------------------------

--
-- Structure for view `P11`
--
DROP TABLE IF EXISTS `P11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P11`  AS SELECT `aeroporto`.`pais` AS `pais`, count(0) AS `total` FROM `aeroporto` GROUP BY `aeroporto`.`pais` HAVING count(`aeroporto`.`pais`) > 22  ;

-- --------------------------------------------------------

--
-- Structure for view `P12`
--
DROP TABLE IF EXISTS `P12`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P12`  AS SELECT `aeroporto`.`pais` AS `pais`, count(`aeroporto`.`pais`) AS `total` FROM `aeroporto` GROUP BY `aeroporto`.`pais` HAVING `total` = (select min(`filtro`.`total`) from (select count(`aeroporto`.`pais`) AS `total` from `aeroporto` group by `aeroporto`.`pais`) `filtro`)  ;

-- --------------------------------------------------------

--
-- Structure for view `P13`
--
DROP TABLE IF EXISTS `P13`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P13`  AS SELECT `aeroporto`.`pais` AS `pais`, count(`aeroporto`.`pais`) AS `total` FROM `aeroporto` GROUP BY `aeroporto`.`pais` HAVING `total` = (select max(`filtro`.`total`) from (select count(`aeroporto`.`pais`) AS `total` from `aeroporto` group by `aeroporto`.`pais`) `filtro`)  ;

-- --------------------------------------------------------

--
-- Structure for view `P14`
--
DROP TABLE IF EXISTS `P14`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P14`  AS SELECT `modelo`.`fabricante` AS `fabricante`, `modelo`.`versao` AS `versao`, count(`aviao`.`idAviao`) AS `total` FROM (`modelo` join `aviao` on(`modelo`.`idModelo` = `aviao`.`idModelo`)) GROUP BY `modelo`.`versao` ORDER BY count(`aviao`.`idAviao`) AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P15`
--
DROP TABLE IF EXISTS `P15`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P15`  AS SELECT `modelo`.`fabricante` AS `fabricante`, `modelo`.`versao` AS `versao`, count(`aviao`.`idAviao`) AS `total` FROM (`modelo` left join `aviao` on(`modelo`.`idModelo` = `aviao`.`idModelo`)) GROUP BY `modelo`.`versao` ORDER BY count(`aviao`.`idAviao`) AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `partidas`
--
DROP TABLE IF EXISTS `partidas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `partidas`  AS SELECT `voo`.`idVoo` AS `idVooPartida`, `voo`.`idAeroportoChegada` AS `idAeroporto` FROM `voo` WHERE `voo`.`idAeroportoPartida` = 11  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aeroporto`
--
ALTER TABLE `aeroporto`
  ADD PRIMARY KEY (`idAeroporto`);

--
-- Indexes for table `aviao`
--
ALTER TABLE `aviao`
  ADD PRIMARY KEY (`idAviao`),
  ADD KEY `idModelo` (`idModelo`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idModelo`);

--
-- Indexes for table `voo`
--
ALTER TABLE `voo`
  ADD PRIMARY KEY (`idVoo`),
  ADD KEY `idAviao` (`idAviao`),
  ADD KEY `idAeroportoChegada` (`idAeroportoChegada`),
  ADD KEY `idAeroportoPartida` (`idAeroportoPartida`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aviao`
--
ALTER TABLE `aviao`
  ADD CONSTRAINT `aviao_ibfk_1` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voo`
--
ALTER TABLE `voo`
  ADD CONSTRAINT `voo_ibfk_1` FOREIGN KEY (`idAeroportoChegada`) REFERENCES `aeroporto` (`idAeroporto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voo_ibfk_2` FOREIGN KEY (`idAeroportoPartida`) REFERENCES `aeroporto` (`idAeroporto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voo_ibfk_3` FOREIGN KEY (`idAviao`) REFERENCES `aviao` (`idAviao`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
