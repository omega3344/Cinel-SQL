CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `curso` varchar(100) NOT NULL,
  `regime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `curso` (`id`, `curso`, `regime`) VALUES
(1, 'CET Multimedia', 'Pos Laboral'),
(2, 'CET Multimedia', 'Laboral'),
(3, 'CET Redes', 'Pos Laboral'),
(4, 'CET Redes', 'Laboral'),
(5, 'CET Sistemas de Informacao', 'Laboral'),
(6, 'CET Sistemas de Informacao', 'Pos Laboral'),
(7, 'CET de Automacao', 'Laboral'),
(8, 'CET de Automacao', 'Pos Laboral'),
(9, 'EFA de Redes', 'Pos Laboral'),
(10, 'EFA de Sistemas', 'Laboral');

ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabela `curso`
--

ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;