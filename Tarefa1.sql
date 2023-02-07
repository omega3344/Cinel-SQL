CREATE VIEW P1 AS
SELECT nome, cidade FROM aeroporto WHERE pais LIKE 'portugal';

CREATE VIEW P2 AS
SELECT nome FROM aviao JOIN modelo USING(idModelo)WHERE versao LIKE 'DC-10';

CREATE VIEW P3 AS
SELECT nome, numMotores FROM aviao JOIN modelo USING(idModelo);

CREATE VIEW P4 AS
SELECT COUNT(*) AS Total FROM voo WHERE duracao=2 OR duracao=3;

CREATE VIEW P5 AS
SELECT IdModelo, versao FROM modelo WHERE versao LIKE 'A3%';

CREATE VIEW P6 AS
SELECT idVoo, duracao FROM voo ORDER BY duracao DESC, idVoo;

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
SELECT idVoo, cidade FROM voo JOIN aeroporto ON idAeroporto=idAeroportoPartida;
CREATE VIEW cidadeChegadas AS 
SELECT idVoo, cidade FROM voo JOIN aeroporto ON idAeroporto=idAeroportoChegada;
CREATE VIEW P9 AS
SELECT cidadePartidas.idVoo, cidadePartidas.cidade AS 'cidade Partida', cidadeChegadas.cidade AS 'cidade Chegada' FROM cidadePartidas, cidadeChegadas WHERE cidadePartidas.idVoo = cidadeChegadas.idVoo ORDER BY cidadePartidas.idVoo;


CREATE VIEW P10 AS
SELECT idVoo FROM voo JOIN aeroporto ON idAeroporto=idAeroportoPartida AND idAeroportoPartida=1 AND idAeroportoChegada=3;

CREATE VIEW P11 AS
SELECT pais, COUNT(*) AS total FROM aeroporto GROUP BY pais HAVING COUNT(pais)>2;

12
CREATE VIEW P12 AS
SELECT pais, MIN(soma) AS total FROM (SELECT pais, COUNT(pais) AS soma FROM aeroporto GROUP BY pais) AS filtro;

13
CREATE VIEW P13 AS
SELECT pais, MAX(soma) AS total FROM (SELECT pais, COUNT(pais) AS soma FROM aeroporto GROUP BY pais) AS filtro;

CREATE VIEW P14 AS
SELECT fabricante, versao, COUNT(versao) AS total FROM aviao JOIN modelo USING (idModelo) GROUP BY versao ORDER BY COUNT(versao) DESC;

15
-- SELECT fabricante, versao, COUNT(aviao.idModelo) FROM aviao JOIN modelo USING(idModelo) GROUP BY idModelo;
SELECT fabricante, versao, COUNT(soma) FROM modelo, (SELECT COUNT(idModelo) AS soma FROM aviao) AS tabela GROUP BY versao
-- SELECT COUNT(idModelo) FROM aviao GROUP BY idModelo;;;;;;;
SELECT fabricante, versao, COUNT(versao) AS total FROM modelo LEFT JOIN aviao USING (idModelo) GROUP BY versao ORDER BY total DESC;
