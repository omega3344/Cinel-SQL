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
FROM colaborador JOIN tarefas USING(idColaborador) JOIN projeto USING(idProjeto)
GROUP BY idColaborador;

CREATE VIEW superior AS
SELECT *
FROM colaborador;
CREATE VIEW P10 AS
SELECT superior.designacao,colaborador.designacao AS superior
FROM colaborador JOIN superior 
ON superior.idSuperiorHierarquico = colaborador.idColaborador;

CREATE VIEW P11 AS
SELECT superior.designacao,colaborador.designacao AS superior
FROM superior LEFT JOIN colaborador 
ON superior.idSuperiorHierarquico = colaborador.idColaborador;

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
SELECT superior.designacao, colaborador.designacao AS superior,  colaborador.vencimento - superior.vencimento
FROM colaborador JOIN superior 
ON superior.idSuperiorHierarquico = colaborador.idColaborador;

CREATE VIEW P16 AS
SELECT MAX(diferenca) AS diferencaMaxima 
FROM (
SELECT (colaborador.vencimento - superior.vencimento) AS diferenca 
FROM colaborador JOIN superior
ON superior.idSuperiorHierarquico = colaborador.idColaborador
WHERE superior.vencimento = (
    SELECT MIN(superior.vencimento) 
    FROM superior)
) AS m;

CREATE VIEW P17 AS
SELECT departamento.designacao, AVG(vencimento) AS vencimentoMedio 
FROM departamento JOIN colaborador USING(idDepartamento)
GROUP BY idDepartamento
HAVING AVG(vencimento) > 1300;


