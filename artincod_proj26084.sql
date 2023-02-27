-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 27, 2023 at 12:17 PM
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
-- Database: `artincod_proj26084`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`artincod_26084`@`localhost` PROCEDURE `p_criar_senha` (IN `a` INT(11), `b` VARCHAR(50))   BEGIN
INSERT INTO senha VALUES (NULL, a, SHA1(b), CURRENT_TIMESTAMP);
DELETE FROM token WHERE idUtilizador = a;
UPDATE estado_utilizador SET idEstado = 2 WHERE idUtilizador = a;
END$$

CREATE DEFINER=`artincod_26084`@`localhost` PROCEDURE `p_limpar_token` ()   DELETE FROM token
WHERE (TIMESTAMPDIFF(HOUR, dataReg, CURRENT_TIMESTAMP)) > 24$$

CREATE DEFINER=`artincod_26084`@`localhost` PROCEDURE `p_recuperar_senha` (IN `a` INT(11), `b` VARCHAR(50))   BEGIN
INSERT INTO senha VALUES (NULL, a, SHA1(b), CURRENT_TIMESTAMP);
DELETE FROM token WHERE idUtilizador = a;
END$$

CREATE DEFINER=`artincod_26084`@`localhost` PROCEDURE `p_registar_estado` (IN `a` VARCHAR(50))   INSERT INTO estado VALUES (NULL, a, CURRENT_TIMESTAMP)$$

CREATE DEFINER=`artincod_26084`@`localhost` PROCEDURE `p_registar_utilizador` (IN `a` VARCHAR(50))   BEGIN
INSERT INTO utilizador VALUES (NULL, a, CURRENT_TIMESTAMP);
SET @idUtilizador = LAST_INSERT_ID();
SET @token = SUBSTRING(SHA1(RAND()),1, 40);
INSERT INTO token VALUES (NULL, @idUtilizador, @token, CURRENT_TIMESTAMP);
INSERT INTO estado_utilizador VALUES (NULL, 1, @idUtilizador, CURRENT_TIMESTAMP);
END$$

CREATE DEFINER=`artincod_26084`@`localhost` PROCEDURE `p_remover_utilizador` (IN `a` INT(11))   BEGIN
DELETE FROM token WHERE idUtilizador = a;
DELETE FROM senha WHERE idUtilizador = a;
DELETE FROM estado_utilizador WHERE idUtilizador = a;
DELETE FROM utilizador WHERE idUtilizador = a;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `colaborador`
--

CREATE TABLE `colaborador` (
  `idColaborador` int(11) NOT NULL,
  `designacao` varchar(100) NOT NULL,
  `vencimento` float(6,2) DEFAULT NULL,
  `idDepartamento` int(11) NOT NULL,
  `idSuperiorHierarquico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `colaborador`
--

INSERT INTO `colaborador` (`idColaborador`, `designacao`, `vencimento`, `idDepartamento`, `idSuperiorHierarquico`) VALUES
(1, 'Jorge', 1500.00, 1, NULL),
(2, 'Miguel', 1200.00, 1, 1),
(3, 'Jorge', 1300.00, 1, 1),
(4, 'Teresa', 1500.00, 2, NULL),
(5, 'Carlos', 1100.00, 2, 4),
(6, 'Maria', 1000.00, 2, 4),
(7, 'beatriz', 800.00, 2, 4),
(8, 'Braga', 1700.00, 3, NULL),
(9, 'Alfredo', 1200.00, 3, 8),
(10, 'Barros', 1300.00, 3, 8),
(11, 'Ana', 1100.00, 3, 10),
(12, 'Telmo', 1900.00, 3, 10),
(13, 'Emilia', 1200.00, 4, NULL),
(14, 'Diana', 1600.00, 4, 13),
(15, 'Sara', 1200.00, 5, NULL),
(16, 'Guilherme', 1400.00, 5, 15),
(17, 'Justino', 1100.00, 5, 15),
(18, 'Raul', 1000.00, 5, 16),
(19, 'Martins', 500.00, 5, 16),
(20, 'catia', 500.00, 5, 17);

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `designacao` varchar(100) NOT NULL,
  `idDiretor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `designacao`, `idDiretor`) VALUES
(1, 'Logistica', 1),
(2, 'Transportes', 4),
(3, 'Limpeza', 8),
(4, 'Recursos Humanos', 13),
(5, 'Informatica', 15);

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`idEstado`, `estado`, `dataReg`) VALUES
(1, 'inválido', '2023-02-22 21:17:30'),
(2, 'ativado', '2023-02-22 21:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `estado_utilizador`
--

CREATE TABLE `estado_utilizador` (
  `idEstadoUtilizador` int(11) NOT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idUtilizador` int(11) DEFAULT NULL,
  `dataReg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `estado_utilizador`
--

INSERT INTO `estado_utilizador` (`idEstadoUtilizador`, `idEstado`, `idUtilizador`, `dataReg`) VALUES
(2, 1, 2, '2023-02-23 10:57:55'),
(3, 1, 3, '2023-02-23 10:59:43');

-- --------------------------------------------------------

--
-- Stand-in structure for view `idade_token`
-- (See below for the actual view)
--
CREATE TABLE `idade_token` (
`idToken` int(11)
,`idUtilizador` int(11)
,`token` varchar(100)
,`dataReg` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P1`
-- (See below for the actual view)
--
CREATE TABLE `P1` (
`designacao` varchar(100)
,`departamento` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P2`
-- (See below for the actual view)
--
CREATE TABLE `P2` (
`designacao` varchar(100)
,`director` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P3`
-- (See below for the actual view)
--
CREATE TABLE `P3` (
`designacao` varchar(100)
,`departamento` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P4`
-- (See below for the actual view)
--
CREATE TABLE `P4` (
`designacao` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P5`
-- (See below for the actual view)
--
CREATE TABLE `P5` (
`designacao` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P6`
-- (See below for the actual view)
--
CREATE TABLE `P6` (
`designacao` varchar(100)
,`horas` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P7`
-- (See below for the actual view)
--
CREATE TABLE `P7` (
`designacao` varchar(100)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P8`
-- (See below for the actual view)
--
CREATE TABLE `P8` (
`designacao` varchar(100)
,`totalHoras` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P9`
-- (See below for the actual view)
--
CREATE TABLE `P9` (
`designacao` varchar(100)
,`totalHoras` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P10`
-- (See below for the actual view)
--
CREATE TABLE `P10` (
`designacao` varchar(100)
,`superior` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P11`
-- (See below for the actual view)
--
CREATE TABLE `P11` (
`designacao` varchar(100)
,`superior` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P12`
-- (See below for the actual view)
--
CREATE TABLE `P12` (
`designacao` varchar(100)
,`vencimentoMaximo` float(6,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P13`
-- (See below for the actual view)
--
CREATE TABLE `P13` (
`vencimentoMaximo` float(6,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P14`
-- (See below for the actual view)
--
CREATE TABLE `P14` (
`diferencaVencimentos` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P15`
-- (See below for the actual view)
--
CREATE TABLE `P15` (
`designacao` varchar(100)
,`superior` varchar(100)
,`superior.vencimento - colaborador.vencimento` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P16`
-- (See below for the actual view)
--
CREATE TABLE `P16` (
`diferencaMaxima` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P17`
-- (See below for the actual view)
--
CREATE TABLE `P17` (
`designacao` varchar(100)
,`vencimentoMedio` double(10,6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P18`
-- (See below for the actual view)
--
CREATE TABLE `P18` (
`designacao` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P19`
-- (See below for the actual view)
--
CREATE TABLE `P19` (
`designacao` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `P20`
-- (See below for the actual view)
--
CREATE TABLE `P20` (
`designacao` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `projeto`
--

CREATE TABLE `projeto` (
  `idProjeto` int(11) NOT NULL,
  `designacao` varchar(100) NOT NULL,
  `idDepartamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `projeto`
--

INSERT INTO `projeto` (`idProjeto`, `designacao`, `idDepartamento`) VALUES
(1, 'VODAFONE', 1),
(2, 'NOS', 2),
(3, 'MEO', 5);

-- --------------------------------------------------------

--
-- Table structure for table `senha`
--

CREATE TABLE `senha` (
  `idSenha` int(11) NOT NULL,
  `idUtilizador` int(11) DEFAULT NULL,
  `senha` varchar(100) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `superior`
-- (See below for the actual view)
--
CREATE TABLE `superior` (
`idColaborador` int(11)
,`designacao` varchar(100)
,`vencimento` float(6,2)
,`idDepartamento` int(11)
,`idSuperiorHierarquico` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `tarefas`
--

CREATE TABLE `tarefas` (
  `idTarefa` int(11) NOT NULL,
  `idColaborador` int(11) NOT NULL DEFAULT 0,
  `idProjeto` int(11) NOT NULL DEFAULT 0,
  `horas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tarefas`
--

INSERT INTO `tarefas` (`idTarefa`, `idColaborador`, `idProjeto`, `horas`) VALUES
(1, 1, 1, 4),
(2, 1, 2, 8),
(3, 2, 1, 3),
(4, 2, 2, 7),
(5, 3, 2, 7),
(6, 4, 2, 2),
(7, 5, 1, 4),
(8, 5, 3, 6),
(9, 6, 2, 3),
(10, 7, 1, 2),
(11, 10, 1, 1),
(12, 11, 1, 7),
(13, 11, 2, 2),
(14, 12, 2, 1),
(15, 12, 3, 3),
(16, 13, 1, 3),
(17, 14, 1, 3),
(18, 14, 2, 3),
(19, 15, 2, 5),
(20, 17, 2, 4),
(21, 17, 3, 1),
(22, 18, 3, 2),
(23, 20, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `idToken` int(11) NOT NULL,
  `idUtilizador` int(11) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`idToken`, `idUtilizador`, `token`, `dataReg`) VALUES
(2, 2, '1d64678c6ff6ac5ef3f5011b6059ab26630e96ea', '2023-02-23 10:57:55'),
(3, 3, 'b9f2079e467d708744e31393c6c7a9884d8193cd', '2023-02-23 10:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `utilizador`
--

CREATE TABLE `utilizador` (
  `idUtilizador` int(11) NOT NULL,
  `utilizador` varchar(50) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `utilizador`
--

INSERT INTO `utilizador` (`idUtilizador`, `utilizador`, `dataReg`) VALUES
(2, 'neka2@mail.pt', '2023-02-23 10:57:55'),
(3, 'neka3@mail.pt', '2023-02-23 10:59:43');

-- --------------------------------------------------------

--
-- Structure for view `idade_token`
--
DROP TABLE IF EXISTS `idade_token`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `idade_token`  AS SELECT `token`.`idToken` AS `idToken`, `token`.`idUtilizador` AS `idUtilizador`, `token`.`token` AS `token`, `token`.`dataReg` AS `dataReg` FROM `token` HAVING timestampdiff(HOUR,`token`.`dataReg`,current_timestamp()) > 2424  ;

-- --------------------------------------------------------

--
-- Structure for view `P1`
--
DROP TABLE IF EXISTS `P1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P1`  AS SELECT `colaborador`.`designacao` AS `designacao`, `departamento`.`designacao` AS `departamento` FROM (`colaborador` join `departamento` on(`colaborador`.`idDepartamento` = `departamento`.`idDepartamento`)) ORDER BY `departamento`.`designacao` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P2`
--
DROP TABLE IF EXISTS `P2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P2`  AS SELECT `departamento`.`designacao` AS `designacao`, `colaborador`.`designacao` AS `director` FROM (`departamento` join `colaborador`) WHERE `departamento`.`idDiretor` = `colaborador`.`idColaborador` ORDER BY `departamento`.`designacao` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P3`
--
DROP TABLE IF EXISTS `P3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P3`  AS SELECT `projeto`.`designacao` AS `designacao`, `departamento`.`designacao` AS `departamento` FROM (`projeto` join `departamento` on(`projeto`.`idDepartamento` = `departamento`.`idDepartamento`))  ;

-- --------------------------------------------------------

--
-- Structure for view `P4`
--
DROP TABLE IF EXISTS `P4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P4`  AS SELECT `projeto`.`designacao` AS `designacao` FROM `projeto` WHERE `projeto`.`idDepartamento` = 11  ;

-- --------------------------------------------------------

--
-- Structure for view `P5`
--
DROP TABLE IF EXISTS `P5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P5`  AS SELECT `projeto`.`designacao` AS `designacao` FROM (`projeto` join `departamento` on(`projeto`.`idDepartamento` = `departamento`.`idDepartamento`)) WHERE `departamento`.`designacao` like 'Transportes''Transportes'  ;

-- --------------------------------------------------------

--
-- Structure for view `P6`
--
DROP TABLE IF EXISTS `P6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P6`  AS SELECT `colaborador`.`designacao` AS `designacao`, `tarefas`.`horas` AS `horas` FROM ((`colaborador` join `tarefas` on(`colaborador`.`idColaborador` = `tarefas`.`idColaborador`)) join `projeto` on(`tarefas`.`idProjeto` = `projeto`.`idProjeto`)) WHERE `projeto`.`designacao` like 'VODAFONE' ORDER BY `tarefas`.`horas` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `P7`
--
DROP TABLE IF EXISTS `P7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P7`  AS SELECT `projeto`.`designacao` AS `designacao`, count(`colaborador`.`idColaborador`) AS `total` FROM ((`colaborador` join `tarefas` on(`colaborador`.`idColaborador` = `tarefas`.`idColaborador`)) join `projeto` on(`tarefas`.`idProjeto` = `projeto`.`idProjeto`)) GROUP BY `projeto`.`designacao``designacao`  ;

-- --------------------------------------------------------

--
-- Structure for view `P8`
--
DROP TABLE IF EXISTS `P8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P8`  AS SELECT `projeto`.`designacao` AS `designacao`, sum(`tarefas`.`horas`) AS `totalHoras` FROM ((`colaborador` join `tarefas` on(`colaborador`.`idColaborador` = `tarefas`.`idColaborador`)) join `projeto` on(`tarefas`.`idProjeto` = `projeto`.`idProjeto`)) GROUP BY `projeto`.`designacao``designacao`  ;

-- --------------------------------------------------------

--
-- Structure for view `P9`
--
DROP TABLE IF EXISTS `P9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P9`  AS SELECT `colaborador`.`designacao` AS `designacao`, sum(`tarefas`.`horas`) AS `totalHoras` FROM ((`colaborador` join `tarefas` on(`colaborador`.`idColaborador` = `tarefas`.`idColaborador`)) join `projeto` on(`tarefas`.`idProjeto` = `projeto`.`idProjeto`)) GROUP BY `colaborador`.`idColaborador``idColaborador`  ;

-- --------------------------------------------------------

--
-- Structure for view `P10`
--
DROP TABLE IF EXISTS `P10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P10`  AS SELECT `colaborador`.`designacao` AS `designacao`, `superior`.`designacao` AS `superior` FROM (`colaborador` join `superior` on(`superior`.`idColaborador` = `colaborador`.`idSuperiorHierarquico`))  ;

-- --------------------------------------------------------

--
-- Structure for view `P11`
--
DROP TABLE IF EXISTS `P11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P11`  AS SELECT `colaborador`.`designacao` AS `designacao`, `superior`.`designacao` AS `superior` FROM (`colaborador` left join `superior` on(`superior`.`idColaborador` = `colaborador`.`idSuperiorHierarquico`))  ;

-- --------------------------------------------------------

--
-- Structure for view `P12`
--
DROP TABLE IF EXISTS `P12`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P12`  AS SELECT `departamento`.`designacao` AS `designacao`, max(`colaborador`.`vencimento`) AS `vencimentoMaximo` FROM (`colaborador` join `departamento` on(`colaborador`.`idDepartamento` = `departamento`.`idDepartamento`)) GROUP BY `colaborador`.`idDepartamento``idDepartamento`  ;

-- --------------------------------------------------------

--
-- Structure for view `P13`
--
DROP TABLE IF EXISTS `P13`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P13`  AS SELECT max(`colaborador`.`vencimento`) AS `vencimentoMaximo` FROM `colaborador``colaborador`  ;

-- --------------------------------------------------------

--
-- Structure for view `P14`
--
DROP TABLE IF EXISTS `P14`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P14`  AS SELECT max(`colaborador`.`vencimento`) - min(`colaborador`.`vencimento`) AS `diferencaVencimentos` FROM `colaborador``colaborador`  ;

-- --------------------------------------------------------

--
-- Structure for view `P15`
--
DROP TABLE IF EXISTS `P15`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P15`  AS SELECT `colaborador`.`designacao` AS `designacao`, `superior`.`designacao` AS `superior`, `superior`.`vencimento`- `colaborador`.`vencimento` AS `superior.vencimento - colaborador.vencimento` FROM (`colaborador` join `superior` on(`superior`.`idColaborador` = `colaborador`.`idSuperiorHierarquico`))  ;

-- --------------------------------------------------------

--
-- Structure for view `P16`
--
DROP TABLE IF EXISTS `P16`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P16`  AS SELECT max(`dif`.`diferenca`) AS `diferencaMaxima` FROM (select `superior`.`vencimento` - `colaborador`.`vencimento` AS `diferenca` from (`colaborador` join `superior` on(`colaborador`.`idSuperiorHierarquico` = `superior`.`idColaborador`)) where `colaborador`.`vencimento` = (select min(`colaborador`.`vencimento`) from `superior`)) AS `dif``dif`  ;

-- --------------------------------------------------------

--
-- Structure for view `P17`
--
DROP TABLE IF EXISTS `P17`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P17`  AS SELECT `departamento`.`designacao` AS `designacao`, avg(`colaborador`.`vencimento`) AS `vencimentoMedio` FROM (`departamento` join `colaborador` on(`departamento`.`idDepartamento` = `colaborador`.`idDepartamento`)) GROUP BY `departamento`.`idDepartamento` HAVING avg(`colaborador`.`vencimento`) > 13001300  ;

-- --------------------------------------------------------

--
-- Structure for view `P18`
--
DROP TABLE IF EXISTS `P18`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P18`  AS SELECT `colaborador`.`designacao` AS `designacao` FROM ((`projeto` join `tarefas` on(`projeto`.`idProjeto` = `tarefas`.`idProjeto`)) join `colaborador` on(`tarefas`.`idColaborador` = `colaborador`.`idColaborador`)) WHERE `projeto`.`idDepartamento` <> `colaborador`.`idDepartamento` GROUP BY `tarefas`.`idColaborador``idColaborador`  ;

-- --------------------------------------------------------

--
-- Structure for view `P19`
--
DROP TABLE IF EXISTS `P19`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P19`  AS SELECT `colaborador`.`designacao` AS `designacao` FROM ((`projeto` join `tarefas` on(`projeto`.`idProjeto` = `tarefas`.`idProjeto`)) join `colaborador` on(`tarefas`.`idColaborador` = `colaborador`.`idColaborador`)) WHERE `projeto`.`idDepartamento` = `colaborador`.`idDepartamento``idDepartamento`  ;

-- --------------------------------------------------------

--
-- Structure for view `P20`
--
DROP TABLE IF EXISTS `P20`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `P20`  AS SELECT `colaborador`.`designacao` AS `designacao` FROM ((`projeto` join `tarefas` on(`projeto`.`idProjeto` = `tarefas`.`idProjeto`)) join `colaborador` on(`tarefas`.`idColaborador` = `colaborador`.`idColaborador`)) WHERE `projeto`.`idDepartamento` = `colaborador`.`idDepartamento` AND !(`tarefas`.`idColaborador` in (select `colaborador`.`idColaborador` from ((`projeto` join `tarefas` on(`projeto`.`idProjeto` = `tarefas`.`idProjeto`)) join `colaborador` on(`tarefas`.`idColaborador` = `colaborador`.`idColaborador`)) where `projeto`.`idDepartamento` <> `colaborador`.`idDepartamento` group by `colaborador`.`idColaborador`))  ;

-- --------------------------------------------------------

--
-- Structure for view `superior`
--
DROP TABLE IF EXISTS `superior`;

CREATE ALGORITHM=UNDEFINED DEFINER=`artincod_26084`@`localhost` SQL SECURITY DEFINER VIEW `superior`  AS SELECT `colaborador`.`idColaborador` AS `idColaborador`, `colaborador`.`designacao` AS `designacao`, `colaborador`.`vencimento` AS `vencimento`, `colaborador`.`idDepartamento` AS `idDepartamento`, `colaborador`.`idSuperiorHierarquico` AS `idSuperiorHierarquico` FROM `colaborador``colaborador`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`idColaborador`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD KEY `idDiretor` (`idDiretor`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indexes for table `estado_utilizador`
--
ALTER TABLE `estado_utilizador`
  ADD PRIMARY KEY (`idEstadoUtilizador`);

--
-- Indexes for table `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`idProjeto`),
  ADD KEY `idDepartamento` (`idDepartamento`);

--
-- Indexes for table `senha`
--
ALTER TABLE `senha`
  ADD PRIMARY KEY (`idSenha`);

--
-- Indexes for table `tarefas`
--
ALTER TABLE `tarefas`
  ADD PRIMARY KEY (`idTarefa`),
  ADD KEY `idColaborador` (`idColaborador`),
  ADD KEY `idProjeto` (`idProjeto`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`idToken`);

--
-- Indexes for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`idUtilizador`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colaborador`
--
ALTER TABLE `colaborador`
  MODIFY `idColaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estado_utilizador`
--
ALTER TABLE `estado_utilizador`
  MODIFY `idEstadoUtilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projeto`
--
ALTER TABLE `projeto`
  MODIFY `idProjeto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `senha`
--
ALTER TABLE `senha`
  MODIFY `idSenha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tarefas`
--
ALTER TABLE `tarefas`
  MODIFY `idTarefa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `idToken` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `idUtilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`idDiretor`) REFERENCES `colaborador` (`idColaborador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tarefas`
--
ALTER TABLE `tarefas`
  ADD CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`idColaborador`) REFERENCES `colaborador` (`idColaborador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tarefas_ibfk_2` FOREIGN KEY (`idProjeto`) REFERENCES `projeto` (`idProjeto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
