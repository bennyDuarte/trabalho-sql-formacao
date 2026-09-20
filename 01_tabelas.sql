/* ------------------------------------------------------------------------------------------------------------------------------- */
/*                                                                                                                                 */
/*                                            TRABALHO DE SQL - UC02830                                                            */
/*                                 DESENVOLVIDO POR RUBEN DUARTE, CARLOS GOMES E ROSA BORGES                                       */
/*                                                 MODULO 1 - TABELAS                                                              */
/* ------------------------------------------------------------------------------------------------------------------------------- */

DROP DATABASE IF EXISTS LojaComponentes;
CREATE DATABASE LojaComponentes CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE LojaComponentes;

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE categoriaProduto(
	idcat INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL UNIQUE
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE marcaProduto(
	idmarca INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	morada VARCHAR(255),
	numfiscal VARCHAR(30)
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE tipoProduto(
	idtipo INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	idcat INT NOT NULL,
	FOREIGN KEY (idcat) REFERENCES categoriaProduto(idcat) ON DELETE RESTRICT
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE produto(
	idProd INT PRIMARY KEY AUTO_INCREMENT,
	ean VARCHAR(20) UNIQUE,
	numref VARCHAR(20) UNIQUE,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(500),
	preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
	dimensoes VARCHAR(100),
	idtipo INT NOT NULL,
	idmarca INT NOT NULL,
	FOREIGN KEY (idtipo) REFERENCES tipoProduto(idtipo) ON DELETE RESTRICT,
	FOREIGN KEY (idmarca) REFERENCES marcaProduto(idmarca) ON DELETE RESTRICT
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE loja(
	idLoja INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	localidade VARCHAR(255) NOT NULL,
	codigo_postal VARCHAR(100) NOT NULL,
	distrito VARCHAR(255) NOT NULL
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE armazem(
	idArmazem INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	localidade VARCHAR(255) NOT NULL,
	codigo_postal VARCHAR(100) NOT NULL,
	distrito VARCHAR(255) NOT NULL
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE stock(
	idProd INT NOT NULL,
	idArmazem INT NOT NULL, 
	quantidade INT NOT NULL CHECK (quantidade >= 0),
	PRIMARY KEY (idProd, idArmazem)
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE pessoa(
	idpessoa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	datanascimento DATE,
	rua VARCHAR(100) NOT NULL,
	localidade VARCHAR(100) NOT NULL,
	codigo_postal VARCHAR(100) NOT NULL,
	distrito VARCHAR(200) NOT NULL,
	ncontribuinte VARCHAR(15) NOT NULL UNIQUE
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE colaborador(
	idpessoa INT PRIMARY KEY,
	cargo VARCHAR(50) DEFAULT 'Funcionário',
	data_admissao DATE DEFAULT (CURRENT_DATE),
	FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE CASCADE
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE cliente(
	idpessoa INT PRIMARY KEY,
	data_registo DATE DEFAULT (CURRENT_DATE),
	FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE fatura(
	idfat INT PRIMARY KEY AUTO_INCREMENT,
	idcliente INT NOT NULL,
	idcolaborador INT NOT NULL,
	idLoja INT NOT NULL,
	data_emissao DATETIME DEFAULT CURRENT_TIMESTAMP,
	valor_total DECIMAL(10,2) DEFAULT 0.00,
	FOREIGN KEY (idcliente) REFERENCES cliente(idpessoa) ON DELETE RESTRICT,
	FOREIGN KEY (idcolaborador) REFERENCES colaborador(idpessoa) ON DELETE RESTRICT,
	FOREIGN KEY (idLoja) REFERENCES loja(idLoja) ON DELETE RESTRICT
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE linha_fatura(
	idlinha INT PRIMARY KEY AUTO_INCREMENT,
	idfat INT NOT NULL,
	idProd INT NOT NULL,
	quantidade INT NOT NULL CHECK (quantidade > 0),
	preco_unitario DECIMAL(10,2) NOT NULL CHECK (preco_unitario >= 0),
	FOREIGN KEY (idfat) REFERENCES fatura(idfat) ON DELETE CASCADE,
	FOREIGN KEY (idProd) REFERENCES produto(idProd) ON DELETE RESTRICT
);

/* ------------------------------------------------------------------------------------------------------------------------------- */
