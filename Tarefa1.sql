CREATE VIEW P1 AS
SELECT nome, cidade FROM aeroporto WHERE pais LIKE 'portugal';

CREATE VIEW P2 AS
SELECT nome FROM aviao JOIN modelo USING(idModelo)WHERE versao LIKE 'DC-10';

CREATE VIEW P3 AS
SELECT nome, numMotores FROM aviao JOIN modelo USING(idModelo);

CREATE VIEW P4 AS
SELECT COUNT(*) FROM voo WHERE duracao=2 OR duracao=3;

CREATE VIEW P5 AS
SELECT IdModelo, versao FROM modelo WHERE versao LIKE 'A3%';

CREATE VIEW P6 AS
SELECT idVoo, duracao FROM voo ORDER BY duracao DESC;

CREATE VIEW partidas AS
SELECT idVoo AS idVooPartida, idAeroportoChegada AS idAeroporto  FROM voo WHERE idAeroportoPartida=1;
CREATE VIEW chegadas AS
SELECT idVoo AS idVooEscala, idAeroportoPartida AS idAeroporto  FROM voo WHERE idAeroportoChegada=11 OR idAeroportoChegada=12;
CREATE VIEW P7 AS
SELECT idVooPartida, idVooEscala FROM partidas JOIN chegadas USING(idAeroporto);

CREATE VIEW P8 AS
SELECT pais, COUNT(pais) AS total FROM aeroporto GROUP BY pais ORDER BY COUNT(pais) ASC;

9
CREATE VIEW cidadePartidas AS
SELECT idVoo, cidade FROM voo JOIN aeroporto ON idAeroporto=idAeroportoPartida ORDER BY idVoo;
CREATE VIEW cidadeChegadas AS 
SELECT cidade FROM voo JOIN aeroporto ON idAeroporto=idAeroportoChegada ORDER BY idVoo;
CREATE VIEW P9 AS
SELECT idVoo, cidadePartidas.cidade, cidadeChegadas.cidade FROM cidadePartidas, cidadeChegadas;


CREATE VIEW P10 AS
SELECT idVoo FROM voo JOIN aeroporto ON idAeroporto=idAeroportoPartida AND idAeroportoPartida=1 AND idAeroportoChegada=3;

CREATE VIEW P11 AS
SELECT pais, COUNT(*) FROM aeroporto GROUP BY pais HAVING COUNT(pais)>2;

12

13

CREATE VIEW P14 AS
SELECT fabricante, versao, COUNT(versao) AS total FROM aviao JOIN modelo USING (idModelo) GROUP BY versao;

15