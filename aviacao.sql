

CREATE TABLE `aeroporto` (
  `idAeroporto` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `aviao` (
  `idAviao` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idModelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL,
  `fabricante` varchar(50) NOT NULL,
  `versao` varchar(50) NOT NULL,
  `numMotores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `modelo` (`idModelo`, `fabricante`, `versao`, `numMotores`) VALUES
(1, 'Douglas', 'DC-10', 3),
(2, 'Boeing', '737', 2),
(3, 'Boeing', '747', 4),
(4, 'Airbus', 'A300', 2),
(5, 'Airbus', 'A340', 4);

CREATE TABLE `voo` (
  `idVoo` int(11) NOT NULL,
  `idAeroportoPartida` int(11) NOT NULL,
  `idAeroportoChegada` int(11) NOT NULL,
  `companhia` varchar(50) NOT NULL,
  `duracao` int(11) NOT NULL,
  `idAviao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

ALTER TABLE `aeroporto`
  ADD PRIMARY KEY (`idAeroporto`);

ALTER TABLE `aviao`
  ADD PRIMARY KEY (`idAviao`),
  ADD KEY `idModelo` (`idModelo`);

ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idModelo`);

ALTER TABLE `voo`
  ADD PRIMARY KEY (`idVoo`),
  ADD KEY `idAviao` (`idAviao`),
  ADD KEY `idAeroportoChegada` (`idAeroportoChegada`),
  ADD KEY `idAeroportoPartida` (`idAeroportoPartida`);

ALTER TABLE `aviao`
  ADD CONSTRAINT `aviao_ibfk_1` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `voo`
  ADD CONSTRAINT `voo_ibfk_1` FOREIGN KEY (`idAeroportoChegada`) REFERENCES `aeroporto` (`idAeroporto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voo_ibfk_2` FOREIGN KEY (`idAeroportoPartida`) REFERENCES `aeroporto` (`idAeroporto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voo_ibfk_3` FOREIGN KEY (`idAviao`) REFERENCES `aviao` (`idAviao`) ON DELETE CASCADE ON UPDATE CASCADE;