-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27-Fev-2023 às 14:10
-- Versão do servidor: 5.7.37
-- versão do PHP: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `crud-sql`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_criar_senha` (IN `a` INT(11), `b` VARCHAR(50))   BEGIN
INSERT INTO senha VALUES (NULL, a, SHA1(b), CURRENT_TIMESTAMP);
DELETE FROM token WHERE idUtilizador = a;
UPDATE estado_utilizador SET idEstado = 2 WHERE idUtilizador = a;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_limpar_token` ()   DELETE FROM token
WHERE (TIMESTAMPDIFF(HOUR, dataReg, CURRENT_TIMESTAMP)) > 24$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_recuperar_senha` (IN `a` INT(11), `b` VARCHAR(50))   BEGIN
INSERT INTO senha VALUES (NULL, a, SHA1(b), CURRENT_TIMESTAMP);
DELETE FROM token WHERE idUtilizador = a;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_remover_utilizador` (IN `a` INT(11))   BEGIN
DELETE FROM token WHERE idUtilizador = a;
DELETE FROM senha WHERE idUtilizador = a;
DELETE FROM estado_utilizador WHERE idUtilizador = a;
DELETE FROM utilizador WHERE idUtilizador = a;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`idEstado`, `estado`, `dataReg`) VALUES
(1, 'inválido', '2023-02-22 21:17:30'),
(2, 'ativado', '2023-02-22 21:30:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado_utilizador`
--

CREATE TABLE `estado_utilizador` (
  `idEstadoUtilizador` int(11) NOT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idUtilizador` int(11) DEFAULT NULL,
  `dataReg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado_utilizador`
--

INSERT INTO `estado_utilizador` (`idEstadoUtilizador`, `idEstado`, `idUtilizador`, `dataReg`) VALUES
(2, 1, 2, '2023-02-23 10:57:55'),
(3, 1, 3, '2023-02-23 10:59:43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `senha`
--

CREATE TABLE `senha` (
  `idSenha` int(11) NOT NULL,
  `idUtilizador` int(11) DEFAULT NULL,
  `senha` varchar(100) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `token`
--

CREATE TABLE `token` (
  `idToken` int(11) NOT NULL,
  `idUtilizador` int(11) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `token`
--

INSERT INTO `token` (`idToken`, `idUtilizador`, `token`, `dataReg`) VALUES
(2, 2, '1d64678c6ff6ac5ef3f5011b6059ab26630e96ea', '2023-02-23 10:57:55'),
(3, 3, 'b9f2079e467d708744e31393c6c7a9884d8193cd', '2023-02-23 10:59:43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `idUtilizador` int(11) NOT NULL,
  `utilizador` varchar(50) NOT NULL,
  `dataReg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`idUtilizador`, `utilizador`, `dataReg`) VALUES
(2, 'neka2@mail.pt', '2023-02-23 10:57:55'),
(3, 'neka3@mail.pt', '2023-02-23 10:59:43');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
