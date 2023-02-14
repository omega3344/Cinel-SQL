CREATE VIEW P1 AS
SELECT idPescador, nome 
FROM pescador JOIN pescador_pescaria USING(idPescador) JOIN pescaria USING(idPescaria) 
WHERE dataReg = '2017-1-3';

CREATE VIEW P2 AS
SELECT idPeixe, nome 
FROM peixe JOIN pescado USING(idPeixe) JOIN pescaria USING(idPescaria) 
WHERE dataReg = '2017-1-3' 
GROUP BY idPeixe;

CREATE VIEW P3 AS
SELECT COUNT(idPescaria) AS numero 
FROM pescaria 
WHERE dataReg = '2017-1-2';

CREATE VIEW P4 AS
SELECT COUNT(idBarco) AS numero 
FROM barco 
WHERE pesoMaximo > 35000;

CREATE VIEW P5 AS
SELECT idPescaria, dataReg, COUNT(idPescador) AS numero 
FROM pescaria JOIN pescador_pescaria USING(idPescaria) 
GROUP BY idPescaria;

CREATE VIEW P6 AS
SELECT idPescaria, dataReg, COUNT(idPeixe) AS numero 
FROM pescaria JOIN pescado USING(idPescaria) 
GROUP BY idPescaria;

CREATE VIEW P7 AS
SELECT idPescaria, dataReg 
FROM pescaria JOIN pescado USING(idPescaria) 
GROUP BY idPescaria 
HAVING SUM(peso)>10000;

CREATE VIEW P8 AS
SELECT idPescaria, dataReg 
FROM pescaria JOIN pescador_pescaria USING(idPescaria) JOIN pescador USING(idPescador) 
GROUP BY idPescaria 
HAVING (SUM(idade)/COUNT(idade))>50;

CREATE VIEW P9 AS
SELECT idBarco, nome 
FROM barco WHERE idBarco NOT IN (SELECT idBarco FROM pescado JOIN peixe USING(idPeixe) JOIN pescaria USING(idPescaria)
WHERE peixe.nome LIKE 'Atum');

CREATE VIEW P10 AS 
SELECT idBarco, nome 
FROM barco 
WHERE idBarco NOT IN (
    SELECT idBarco 
    FROM pescador JOIN pescador_pescaria USING(idPescador) JOIN pescaria USING(idPescaria) 
    WHERE pescador.nome LIKE 'Paulo Trindade'
    );

CREATE VIEW P11 AS 
SELECT idPescador, nome, COUNT(pescador_pescaria.idPescador) AS numero 
FROM pescador LEFT JOIN pescador_pescaria USING(idPescador) 
GROUP BY idPescador 
ORDER BY numero ASC;

CREATE VIEW P12 AS 
SELECT idPeixe, nome, COUNT(pescado.idPescaria) AS numero 
FROM peixe LEFT JOIN pescado USING(idPeixe) 
GROUP BY idPeixe 
ORDER BY numero DESC;

CREATE VIEW P13 AS 
SELECT idPescaria, dataReg, AVG(idade) AS media 
FROM pescador JOIN pescador_pescaria USING(idPescador) JOIN pescaria USING(idPescaria)
GROUP BY idPescaria
HAVING media <= ALL (
    SELECT AVG(idade) 
    FROM pescador JOIN pescador_pescaria USING(idPescador) 
    GROUP BY idPescaria
    );

CREATE VIEW P14 AS 
SELECT idPescaria, dataReg, SUM(peso) AS peso 
FROM pescaria JOIN pescado USING(idPescaria)
GROUP BY idPescaria
HAVING peso <= ALL (
    SELECT SUM(peso) 
	FROM pescado 
	GROUP BY idPescaria
    );

CREATE VIEW total_pescado AS
SELECT idPescaria, idBarco, SUM(peso) AS total
FROM pescado JOIN pescaria USING(idPescaria)
GROUP BY idPescaria;
CREATE VIEW P15 AS
SELECT pescaria.idPescaria, total_pescado.idBarco, pesoMaximo, total, pescador.nome
FROM total_pescado JOIN barco USING(idBarco) JOIN pescaria USING(idPescaria) JOIN pescador_pescaria USING(idPescaria)JOIN pescador USING(idPescador) 
WHERE total > pesoMaximo
GROUP BY pescador.nome;

CREATE VIEW P16 AS
SELECT pescado.idPescaria, pesoMaximo, total, peixe.idPeixe,peixe.nome
FROM total_pescado JOIN barco USING(idBarco) JOIN pescado USING(idPescaria) JOIN peixe USING(idPeixe) 
WHERE total > pesoMaximo;