CREATE SCHEMA IF NOT EXISTS dana
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_spanish2_ci;
  
CREATE TABLE IF NOT EXISTS paginaWeb(
	codPW INT,
	url VARCHAR(100) NOT NULL, 
	name  VARCHAR(100),
    description VARCHAR(100),
	PRIMARY KEY(codPW));
    
ALTER TABLE dana.paginaWeb AUTO_INCREMENT = 1;
    
CREATE TABLE IF NOT EXISTS ciudad(
	codC INT,
    nombre VARCHAR(30),
    PRIMARY KEY(codC)
);

ALTER TABLE dana.ciudad AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS puntosDeEntrega(
	codPE INT UNIQUE NOT NULL AUTO_INCREMENT,
    codC INT,
	ubicacion VARCHAR(100) NOT NULL, 
	paginaWeb  VARCHAR(100),
	CONSTRAINT FOREIGN KEY(codC)
		REFERENCES ciudad(codC),
	PRIMARY KEY(codPE, codC));


CREATE TABLE IF NOT EXISTS poblacionAfectada(
	codPA INT,
    codPW INT,
    codC INT,
    CONSTRAINT FOREIGN KEY(codPW)
		REFERENCES paginaWeb(codPW),
    CONSTRAINT FOREIGN KEY(codC)
		REFERENCES ciudad(codC),
    nombre VARCHAR(30),
    numTlf VARCHAR(15),
    instagram VARCHAR(30),
    PRIMARY KEY(codPA, codPW, codC)
);

ALTER TABLE dana.poblacionAfectada AUTO_INCREMENT = 1;