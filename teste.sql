-- Apresenta a data
SELECT NOW() AS 'Data Atual';

-- Apresenta o autor
SELECT NOW() AS 'Data Atual', 'Fernando Cunha' AS Autor;

-- exercício
SELECT 2 AS 'n1', 3 AS 'n2', 2+3 AS 'n1+n2', 2*3 AS 'n1*n2', 2-3 AS 'n1-n2';

-- DISTINCT permite escolher registos sem repetições
SELECT DISTINCT curso FROM curso;
SELECT curso FROM curso GROUP BY curso;
SELECT DISTINCT regime FROM curso;

-- WHERE filtra registos
SELECT * FROM curso WHERE 1;
SELECT * FROM curso WHERE true;
SELECT * FROM curso WHERE 1=1;
SELECT * FROM curso WHERE 1+1=2;
