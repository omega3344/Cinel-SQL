CREATE VIEW P1 AS
SELECT colaborador.designacao, departamento.designacao as departamento
FROM colaborador JOIN departamento USING(idDepartamento)
ORDER BY departamento.designacao;

CREATE VIEW P2 AS
SELECT departamento.designacao, colaborador.designacao AS director
FROM departamento JOIN colaborador WHERE idDiretor = idColaborador
ORDER BY departamento.designacao;

CREATE VIEW P3 AS
SELECT projeto.designacao, departamento.designacao AS departamento
FROM projeto JOIN departamento USING(idDepartamento);

CREATE VIEW P4 AS
SELECT projeto.designacao
FROM projeto WHERE idDepartamento = 1;

CREATE VIEW P5 AS
SELECT projeto.designacao
FROM projeto JOIN departamento USING(idDepartamento)
WHERE departamento.designacao LIKE 'Transportes';

CREATE VIEW P6 AS
SELECT colaborador.designacao, horas 
FROM colaborador JOIN tarefas USING(idColaborador) JOIN projeto USING(idProjeto) 
WHERE projeto.designacao LIKE 'VODAFONE'
ORDER BY tarefas.horas DESC;

CREATE VIEW P7 AS
SELECT projeto.designacao, COUNT(idColaborador) AS total
FROM colaborador JOIN tarefas USING(idColaborador) JOIN projeto USING(idProjeto)
GROUP BY projeto.designacao;

CREATE VIEW P8 AS
SELECT projeto.designacao, SUM(tarefas.horas) AS totalHoras
FROM colaborador JOIN tarefas USING(idColaborador) JOIN projeto USING(idProjeto)
GROUP BY projeto.designacao;

CREATE VIEW P9 AS
SELECT colaborador.designacao, SUM(tarefas.horas) AS totalHoras
FROM colaborador 
    JOIN tarefas USING(idColaborador) 
    JOIN projeto USING(idProjeto)
GROUP BY idColaborador;

CREATE VIEW superior AS
SELECT *
FROM colaborador;
CREATE VIEW P10 AS
SELECT colaborador.designacao, superior.designacao AS superior
FROM colaborador JOIN superior 
ON superior.idColaborador = colaborador.idSuperiorHierarquico;

CREATE VIEW P11 AS
SELECT colaborador.designacao, superior.designacao AS superior
FROM colaborador LEFT JOIN superior 
ON superior.idColaborador = colaborador.idSuperiorHierarquico;

CREATE VIEW P12 AS
SELECT departamento.designacao, MAX(vencimento) AS vencimentoMaximo 
FROM colaborador JOIN departamento USING(idDepartamento) 
GROUP BY idDepartamento;

CREATE VIEW P13 AS
SELECT MAX(vencimento) AS vencimentoMaximo 
FROM colaborador;

CREATE VIEW P14 AS
SELECT MAX(vencimento)-MIN(vencimento) AS diferencaVencimentos 
FROM colaborador;

CREATE VIEW P15 AS
SELECT colaborador.designacao, superior.designacao AS superior,  superior.vencimento - colaborador.vencimento
FROM colaborador JOIN superior 
ON superior.idColaborador = colaborador.idSuperiorHierarquico;

CREATE VIEW P16 AS
SELECT MAX(diferenca) AS diferencaMaxima 
FROM (
SELECT (superior.vencimento - colaborador.vencimento) AS diferenca 
FROM colaborador JOIN superior
ON colaborador.idSuperiorHierarquico = superior.idColaborador
WHERE colaborador.vencimento = (
    SELECT MIN(colaborador.vencimento) 
    FROM superior)
) AS dif;

CREATE VIEW P17 AS
SELECT departamento.designacao, AVG(vencimento) AS vencimentoMedio 
FROM departamento JOIN colaborador USING(idDepartamento)
GROUP BY idDepartamento
HAVING AVG(vencimento) > 1300;

CREATE VIEW P18 AS
SELECT colaborador.designacao
FROM projeto JOIN tarefas USING(idProjeto) JOIN colaborador USING(idColaborador)
WHERE projeto.idDepartamento != colaborador.idDepartamento
GROUP BY idColaborador;

CREATE VIEW P19 AS
SELECT colaborador.designacao
FROM projeto JOIN tarefas USING(idProjeto) JOIN colaborador USING(idColaborador)
WHERE projeto.idDepartamento = colaborador.idDepartamento

CREATE VIEW P20 AS
SELECT colaborador.designacao
FROM projeto JOIN tarefas USING(idProjeto) JOIN colaborador USING(idColaborador)
WHERE projeto.idDepartamento = colaborador.idDepartamento AND idColaborador NOT IN (
    SELECT colaborador.idColaborador
    FROM projeto JOIN tarefas USING(idProjeto) JOIN colaborador USING(idColaborador)
    WHERE projeto.idDepartamento != colaborador.idDepartamento
    GROUP BY idColaborador);
