DROP DATABASE LojaComponentes;
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

CREATE TABLE categoria(
idcat INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nomecat VARCHAR (200)
);

CREATE TABLE marcas(
idmarca INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nomemarca VARCHAR (200),
morada VARCHAR(200),
numerofiscal INT UNIQUE
);

CREATE TABLE colaboradores(
idcol INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);

CREATE TABLE cliente(
idcliente INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);

CREATE TABLE tipoproduto_eletronica(
idtipo INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

CREATE TABLE produto_eletronica(
idproduto INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
numreferencia INT UNIQUE,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DOUBLE,
dimensoes VARCHAR(100),
idcategoria INT, FOREIGN KEY (idcategoria) REFERENCES categoria(idcat),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_eletronica(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE TIPOS DE PRODUTOS - Eletronica */
INSERT INTO tipoproduto_eletronica(idtipo,nome) VALUES 
(1, 'Bobines de indutância'),
(2, 'Circuitos Integrados'),
(3, 'Condensadores'),
(4, 'Cristais'),
(5, 'Cabos'),
(6, 'Diodos'),
(7, 'Fichas'),
(8, 'Filtros'),
(9, 'Fio para Bobinagem'),
(10, 'Lâmpadas'),
(11, 'LEDs'),
(12, 'Resistências'),
(13, 'Termocondutores'),
(14, 'Tiristores'),
(15, 'Transistores'),
(16, 'Triacs'),
(17, 'Ventoinhas'),
(18, 'PCBs');
/* FIM DE INSERÇÃO DE TIPOS DE PRODUTO --------*/

/* INSERÇÃO DAS MARCAS - CARLOS */

/* FIM DE INSERÇÃO DAS MARCAS */

/* INSERÇÃO DE CLIENTES - Rosa */

/* FIM DE INSERÇÃO DE CLIENTES */

/* INSERÇÃO DE COLABORADORES - Rosa */

/* FIM DE INSERÇÃO DE COLABORADORES */

/* INSERÇÃO DE PRODUTOS - Ruben */

/* FIM DE INSERÇÃO DE PRODUTOS */

SHOW TABLES;
