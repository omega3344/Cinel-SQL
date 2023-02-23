DROP TABLE IF EXISTS utilizador;
CREATE TABLE utilizador(
    idUtilizador INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    utilizador VARCHAR(50) NOT NULL,
    dataReg TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

DROP TABLE IF EXISTS estado;
CREATE TABLE estado(
	idEstado INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50) NOT NULL,
    dataReg TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

DROP TABLE IF EXISTS senha;
CREATE TABLE senha(
	idSenha INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idUtilizador INT(11),
    senha VARCHAR(100) NOT NULL,
    dataReg TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

DROP TABLE IF EXISTS token;
CREATE TABLE token(
	idToken INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idUtilizador INT(11),
    token VARCHAR(100) NOT NULL,
    dataReg TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

DROP TABLE IF EXISTS estado_utilizador;
CREATE TABLE estado_utilizador(
	idEstadoUtilizador INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idEstado INT(11),
    idUtilizador INT(11),
    dataReg TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );


-- escrever na tabela estado

INSERT INTO estado (estado) VALUES ('novo valor estado');
INSERT INTO estado VALUES (NULL,'novo valor estado', CURRENT_TIMESTAMP);

-- criar procedimento para registar estado
DROP PROCEDURE IF EXISTS p_registar_estado;
DELIMITER $$
CREATE PROCEDURE p_registar_estado (IN a VARCHAR(50))
INSERT INTO estado VALUES (NULL, a, CURRENT_TIMESTAMP);
$$ DELIMITER ; 

-- chamar procedimento para registar estado
CALL p_registar_estado('inválido');
CALL p_registar_estado('ativado');


-- criar procedimento para registar novo utilizador
DROP PROCEDURE IF EXISTS p_registar_utilizador;
DELIMITER $$
CREATE PROCEDURE p_registar_utilizador (IN a VARCHAR(50))
BEGIN
INSERT INTO utilizador VALUES (NULL, a, CURRENT_TIMESTAMP);
SET @idUtilizador = LAST_INSERT_ID();
SET @token = SUBSTRING(SHA1(RAND()),1, 40);
INSERT INTO token VALUES (NULL, @idUtilizador, @token, CURRENT_TIMESTAMP);
INSERT INTO estado_utilizador VALUES (NULL, 1, @idUtilizador, CURRENT_TIMESTAMP);
END
$$ DELIMITER ; 

CALL p_registar_utilizador ('neka@mail.pt');


