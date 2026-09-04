DROP DATABASE LojaComponentes;
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

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

CREATE TABLE tipoproduto(
idtipo INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100)
);

CREATE TABLE marcas(
idmarca INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
morada VARCHAR(200),
numerofiscal INT UNIQUE
);

CREATE TABLE produto(
idproduto INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
numreferencia INT UNIQUE,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DOUBLE,
dimensoes VARCHAR(100),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE TIPOS DE PRODUTOS */
INSERT INTO tipoproduto(idtipo,nome) VALUES 
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
(17, 'Ventoinhas');,
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
