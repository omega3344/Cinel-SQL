-- PROCEDIMENTOS
-- _ 9 Crie os procedimentos necessários à recuperação de senha (criação de uma nova senha) de um utilizador – 1º escreve na tabela do token; 2º Regista na tabela da senha e apaga o token

DROP PROCEDURE IF EXISTS p_criar_senha;
DELIMITER $$
CREATE PROCEDURE p_criar_senha (IN a INT(11), b VARCHAR(50))
BEGIN
INSERT INTO senha VALUES (NULL, a, SHA1(b), CURRENT_TIMESTAMP);
DELETE FROM token WHERE idUtilizador = a;
UPDATE TABLE estado_utilizador SET idEstado = 2 WHERE idUtilizador = a
END
$$ DELIMITER ; 

DROP PROCEDURE IF EXISTS p_recuperar_senha;
DELIMITER $$
CREATE PROCEDURE p_recuperar_senha (IN a INT(11), b VARCHAR(50))
BEGIN
SET @idUtilizador = LAST_INSERT_ID();
SET @token = SUBSTRING(SHA1(RAND()),1, 40);
INSERT INTO token VALUES (NULL, @idUtilizador, @token, CURRENT_TIMESTAMP);
INSERT INTO estado_utilizador VALUES (NULL, 1, idUtilizador, CURRENT_TIMESTAMP);
END
$$ DELIMITER ; 


-- _10 Crie um procedimento que liste os tokens que têm mais de 24 horas (e que não foram apagados)

-- _11 Crie um procedimento que remova um token que tenha mais de 24 horas.

-- _12 Crie um procedimento que remova um utilizador da base de dados e de todas as tabelas a si associadas

/*
Vistas_1 Crie uma vista que apresente todos os estados. (estado)_2 Crie uma vista que apresente todos os utilizadores e todos os seu estados.(idUtilizador, utilizador, estado)_3 Crie uma vista que apresente todos os utilizadores não validados.(idUtilizador, utilizador, estado)_4 Crie uma vista que apresente todos os utilizadores ativos.(idUtilizador, utilizador, estado)_5 Crie uma vista que apresente os utilizadores e todas as suas senhas.(idUtilizador, utilizador, senha)_6 Crie uma vista que apresente os utilizadores e a sua senha atual.(idUtilizador, utilizador, estado)_7 Crie uma vista que apresente os utilizadores e o seu estado atual.(idUtilizador, utilizador, estado)_8 Crie uma vista que mostre todos os tokens e seus utilizadores.(idUtilizador, utilizador, token)
*/