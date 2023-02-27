
-- 1. Vistas
-- _1a Crie uma vista que apresente todos os estados. (estado)
SELECT estado 
FROM estado;

-- _1b Crie uma vista que apresente todos os utilizadores e todos os seu estados.(idUtilizador, utilizador, estado)
SELECT idUtilizador, utilizador, estado 
FROM utilizador JOIN estado USING(idUtilizador)
GROUP BY utilizador;

-- _1c Crie uma vista que apresente todos os utilizadores não validados.(idUtilizador, utilizador, estado)
SELECT idUtilizador, utilizador, estado 
FROM utilizador JOIN estado USING(idUtilizador) 
GROUP BY utilizador
HAVING estado LIKE 'inválido';

-- _1d Crie uma vista que apresente todos os utilizadores ativos.(idUtilizador, utilizador, estado)
SELECT idUtilizador, utilizador, estado 
FROM utilizador JOIN estado USING(idUtilizador)
GROUP BY utilizador
HAVING estado LIKE 'activo';

-- _1e Crie uma vista que apresente os utilizadores e todas as suas senhas.(idUtilizador, utilizador, senha)
SELECT idUtilizador, utilizador, senha 
FROM utilizador JOIN senha USING(idUtilizador) 
GROUP BY utilizador;

-- _1f Crie uma vista que apresente os utilizadores e a sua senha atual.(idUtilizador, utilizador, estado)


-- _1g Crie uma vista que apresente os utilizadores e o seu estado atual.(idUtilizador, utilizador, estado)


-- _1h Crie uma vista que mostre todos os tokens e seus utilizadores.(idUtilizador, utilizador, token)
SELECT idUtilizador, utilizador, token 
FROM token JOIN utilizador USING(idUtilizador)
GROUP BY token;


-- 2. Procedimentos
-- 2a Crie os procedimentos necessários à recuperação de senha (criação de uma nova senha) de um utilizador
DROP PROCEDURE IF EXISTS p_recuperar_senha;
DELIMITER $$
CREATE PROCEDURE p_recuperar_senha (IN a INT(11), b VARCHAR(50))
BEGIN
INSERT INTO senha VALUES (NULL, a, SHA1(b), CURRENT_TIMESTAMP);
DELETE FROM token WHERE idUtilizador = a;
END
$$ DELIMITER ; 

-- 2b Crie os procedimentos necessários ao registo da senha de um utilizador
DROP PROCEDURE IF EXISTS p_registar_senha;
DELIMITER $$
CREATE PROCEDURE p_registar_senha (IN a INT(11), b VARCHAR(50))
BEGIN
INSERT INTO senha VALUES (NULL, a, SHA1(b), CURRENT_TIMESTAMP);
DELETE FROM token WHERE idUtilizador = a;
UPDATE estado_utilizador SET idEstado = 2 WHERE idUtilizador = a;
END
$$ DELIMITER ; 

-- 2c Crie um procedimento que remova um token que tenha mais de 24 horas.
DROP PROCEDURE IF EXISTS p_limpar_token;
DELIMITER $$
CREATE PROCEDURE p_limpar_token()
DELETE FROM token
WHERE (TIMESTAMPDIFF(HOUR, dataReg, CURRENT_TIMESTAMP)) > 24;
$$ DELIMITER ;

-- 2d Crie um procedimento que remova um utilizador da base de dados e de todas as tabelas a si associadas
DROP PROCEDURE IF EXISTS p_remover_utilizador;
DELIMITER $$
CREATE PROCEDURE p_remover_utilizador(IN a INT(11))
BEGIN
DELETE FROM token WHERE idUtilizador = a;
DELETE FROM senha WHERE idUtilizador = a;
DELETE FROM estado_utilizador WHERE idUtilizador = a;
DELETE FROM utilizador WHERE idUtilizador = a;
END
$$ DELIMITER ;



-- 3a Crie um trigger para cada evento ocorrido em cada tabela de senha quando ocorrer uma nova inserção
DROP TRIGGER IF EXISTS insert_senha; 
CREATE TRIGGER insert_senha AFTER INSERT ON senha 
FOR EACH ROW 
INSERT INTO eventos VALUES(NULL, 'Insert', 'Senha', NEW.idSenha, CURRENT_TIMESTAMP);

-- 3b Crie um trigger para cada evento ocorrido em cada tabela de estado_utilizador quando ocorrer uma nova inserção
DROP TRIGGER IF EXISTS insert_estado_utilizador; 
CREATE TRIGGER insert_estado_utilizador AFTER INSERT ON estado_utilizador 
FOR EACH ROW 
INSERT INTO eventos VALUES(NULL, 'Insert', 'Estado_Utilizador', NEW.idEstadoUtilizador, CURRENT_TIMESTAMP);

-- 3c Crie um trigger para cada evento ocorrido em cada tabela de token para quando ocorrer uma nova inserção ou um registo for removido.
DROP TRIGGER IF EXISTS insert_token; 
CREATE TRIGGER insert_token 
AFTER INSERT ON token 
FOR EACH ROW 
INSERT INTO eventos VALUES(NULL, 'Insert', 'Token', NEW.idToken, CURRENT_TIMESTAMP);

DROP TRIGGER IF EXISTS delete_token;
CREATE TRIGGER delete_token 
BEFORE DELETE ON token 
FOR EACH ROW 
INSERT INTO eventos VALUES(NULL, 'Delete', 'Token', OLD.idToken, CURRENT_TIMESTAMP);



/*
DROP TRIGGER IF EXISTS insert_utilizador; 
CREATE TRIGGER insert_utilizador AFTER INSERT ON utilizador 
FOR EACH ROW 
INSERT INTO eventos VALUES(NULL, 'Insert', 'Utilizador', NEW.idUtilizador, CURRENT_TIMESTAMP);


DROP TRIGGER IF EXISTS after_update_utilizador; 
CREATE TRIGGER after_update_utilizador AFTER UPDATE ON utilizador 
FOR EACH ROW 
INSERT INTO eventos VALUES(NULL, 'Update', 'Utilizador', OLD.idUtilizador, CURRENT_TIMESTAMP);

DROP TRIGGER IF EXISTS after_delete_utilizador; 
CREATE TRIGGER after_delete_utilizador BEFORE DELETE ON utilizador 
FOR EACH ROW 
INSERT INTO eventos VALUES(NULL, 'Delete', 'Utilizador', OLD.idUtilizador, CURRENT_TIMESTAMP);
*/