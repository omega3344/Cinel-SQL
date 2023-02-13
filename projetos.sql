CREATE TABLE colaborador (
  idColaborador int(11) NOT NULL,
  designacao varchar(100) NOT NULL,
  vencimento float(6,2) DEFAULT NULL,
  idDepartamento int(11) NOT NULL,
  idSuperiorHierarquico int(11) DEFAULT NULL
);

INSERT INTO colaborador (idColaborador, designacao, vencimento, idDepartamento, idSuperiorHierarquico) VALUES
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

CREATE TABLE departamento (
  idDepartamento int(11) NOT NULL,
  designacao varchar(100) NOT NULL,
  idDiretor int(11) DEFAULT NULL
);

INSERT INTO departamento (idDepartamento, designacao, idDiretor) VALUES
(1, 'Logistica', 1),
(2, 'Transportes', 4),
(3, 'Limpeza', 8),
(4, 'Recursos Humanos', 13),
(5, 'Informatica', 15);

CREATE TABLE projeto (
  idProjeto int(11) NOT NULL,
  designacao varchar(100) NOT NULL,
  idDepartamento int(11) DEFAULT NULL
);

INSERT INTO projeto (idProjeto, designacao, idDepartamento) VALUES
(1, 'VODAFONE', 1),
(2, 'NOS', 2),
(3, 'MEO', 5);

CREATE TABLE tarefas (
  idTarefa int(11) NOT NULL,
  idColaborador int(11) NOT NULL DEFAULT '0',
  idProjeto int(11) NOT NULL DEFAULT '0',
  horas int(11) NOT NULL
);

INSERT INTO tarefas (idTarefa, idColaborador, idProjeto, horas) VALUES
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

ALTER TABLE colaborador
  ADD PRIMARY KEY (idColaborador);

ALTER TABLE departamento
  ADD PRIMARY KEY (idDepartamento),
  ADD KEY idDiretor (idDiretor);

ALTER TABLE projeto
  ADD PRIMARY KEY (idProjeto),
  ADD KEY idDepartamento (idDepartamento);

ALTER TABLE tarefas
  ADD PRIMARY KEY (idTarefa),
  ADD KEY idColaborador (idColaborador),
  ADD KEY idProjeto (idProjeto);

ALTER TABLE colaborador
  MODIFY idColaborador int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE departamento
  MODIFY idDepartamento int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE projeto
  MODIFY idProjeto int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE tarefas
  MODIFY idTarefa int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE departamento
  ADD CONSTRAINT departamento_ibfk_1 FOREIGN KEY (idDiretor) REFERENCES colaborador (idColaborador) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE projeto
  ADD CONSTRAINT projeto_ibfk_1 FOREIGN KEY (idDepartamento) REFERENCES departamento (idDepartamento) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tarefas
  ADD CONSTRAINT tarefas_ibfk_1 FOREIGN KEY (idColaborador) REFERENCES colaborador (idColaborador) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT tarefas_ibfk_2 FOREIGN KEY (idProjeto) REFERENCES projeto (idProjeto) ON DELETE CASCADE ON UPDATE CASCADE;