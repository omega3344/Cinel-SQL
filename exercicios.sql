-- exercício 1
SELECT COUNT(id) AS 'Total de cursos', 'Fernando Cunha' AS Responsável, NOW() 'Data de extração' 
FROM curso;

-- exercício 2
SELECT COUNT(id) AS 'Total de cursos de multimedia', 'Fernando Cunha' AS 'Responsável' , NOW() AS 'Data de extração'
FROM curso 
WHERE curso LIKE 'CET Multimedia';

-- exercício 3
SELECT regime AS 'Regime CET de multimédia' 
FROM curso 
WHERE curso LIKE 'CET Multimedia' 
ORDER BY regime;

-- exercício 4
SELECT curso AS 'CET em regime Pós laboral' 
FROM curso 
WHERE regime LIKE 'Pós Laboral' AND curso LIKE 'CET%' 
ORDER BY curso;

-- exercício 5
SELECT DISTINCT curso AS 'Cursos diferentes' 
FROM curso 
ORDER BY curso ASC;

-- exercício 6
SELECT COUNT(curso) AS 'Total de cursos por regime', regime 
FROM curso 
GROUP BY regime;

-- exercício 7
SELECT COUNT(curso) AS 'Total CET Redes em Pos Laboral', regime 
FROM curso 
WHERE curso LIKE '%CET Redes%' AND regime LIKE 'Pós Laboral';

-- exercício 8
SELECT DISTINCT situacaoEmprego AS 'Situação de emprego' 
FROM formando
-- GROUP BY situacaoEmprego;

-- exercício 9
CREATE VIEW idade_formando AS 
SELECT id, nome, apelido, dataNascimento, NOW() AS 'Data atual', TIMESTAMPDIFF(year,dataNascimento,NOW()) AS 'Idade do formando' 
FROM formando;

-- exercício 10
CREATE VIEW exercicio10 AS SELECT situacaoEmprego, AVG(TIMESTAMPDIFF(year,dataNascimento,NOW())) AS 'Idade do formando' 
FROM formando 
GROUP BY situacaoEmprego;

-- exercicio 11
SELECT id, nome, apelido, TIMESTAMPDIFF(year,dataNascimento,NOW()) AS 'Idade do formando', 'menor' AS 'estado' 
FROM formando 
WHERE TIMESTAMPDIFF(year,dataNascimento,NOW()) < 18;

-- exercício 12
SELECT id AS 'idFormando', nome, apelido, TIMESTAMPDIFF(year, dataNascimento, NOW()) AS 'Idade do formando', IF (TIMESTAMPDIFF(year, dataNascimento, NOW())<18, 'menor', 'maior') AS 'estado' 
FROM formando;

-- exercício 13
SELECT ROUND(AVG(TIMESTAMPDIFF(year, dataNascimento, NOW())), 2) AS 'Media idades dos formandos' 
FROM formando;

-- exercício 14
SELECT COUNT(*) AS 'total', CONCAT(ROUND(COUNT(*) * 100 / SUM(COUNT(id)) OVER(), 2),'%') AS 'percentagem', habilitacao 
FROM formando 
GROUP BY habilitacao;

-- exercício 15
SELECT id AS 'idFormando', nome, apelido, genero, situacaoEmprego, TIMESTAMPDIFF(year, dataNascimento, NOW()) AS 'idade', dataNascimento 
FROM formando 
WHERE genero = 'masculino' 
AND TIMESTAMPDIFF(year, dataNascimento, NOW())=(SELECT MAX(TIMESTAMPDIFF(year, dataNascimento, NOW())) FROM formando);

-- exercício 16
SELECT id AS 'idFormando', nome, apelido, genero, situacaoEmprego, TIMESTAMPDIFF(year, dataNascimento, NOW()) AS 'idade', dataNascimento 
FROM formando 
WHERE genero = 'feminino' AND situacaoEmprego = 'empregado' 
AND TIMESTAMPDIFF(year, dataNascimento, NOW())=(SELECT ROUND(AVG(TIMESTAMPDIFF(year, dataNascimento, NOW())),0) FROM formando);

-- exercício 17
SELECT a.id AS 'idFormando', a.nome, a.apelido
FROM formando a
JOIN (SELECT nome, apelido, COUNT(*)
FROM formando 
WHERE genero = 'Masculino' AND habilitacao = 'Superior' 
GROUP BY nome, apelido
HAVING count(*) > 1 ) b
ON a.nome = b.nome
AND a.apelido = b.apelido
ORDER BY nome, apelido;

-- exercício 18
SELECT id AS 'idFormando', nome, apelido, dataNascimento, COUNT(dataNascimento) AS 'total' 
FROM formando 
GROUP BY dataNascimento HAVING COUNT(dataNascimento)>1 
ORDER BY dataNascimento;

-- exercício 19
SELECT CONCAT(MAX(TIMESTAMPDIFF(year, dataNascimento, NOW())) - MIN(TIMESTAMPDIFF(year, dataNascimento, NOW())), ' anos.') AS diferenca 
FROM formando;
