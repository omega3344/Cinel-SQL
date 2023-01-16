-- exercício 1
SELECT COUNT(id) AS 'Total de cursos', 'Fernando Cunha' AS Responsável, NOW() 'Data de extração' FROM curso;

-- exercício 2
SELECT COUNT(id) AS 'Total de cursos de multimedia', 'Fernando Cunha' AS 'Responsável' , NOW() AS 'Data de extração' FROM curso WHERE curso LIKE 'CET Multimedia';

-- exercício 3
SELECT regime AS 'Regime CET de multimédia' FROM curso WHERE curso LIKE 'CET Multimedia' ORDER BY regime;

-- exercício 4
SELECT curso AS 'CET em regime Pós laboral' FROM curso WHERE regime LIKE 'Pós Laboral' AND curso LIKE 'CET%' ORDER BY curso;

-- exercício 5
SELECT DISTINCT curso AS 'Cursos diferentes' FROM curso ORDER BY curso ASC;

-- exercício 6
SELECT COUNT(curso) AS 'Total de cursos por regime', regime FROM curso GROUP BY regime;

-- exercício 7
SELECT COUNT(curso) AS 'Total CET Redes em Pos Laboral', regime FROM curso WHERE curso LIKE '%CET Redes%' AND regime LIKE 'Pós Laboral';