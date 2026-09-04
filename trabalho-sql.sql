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
INSERT INTO tipoproduto(idtipo,nome) VALUES (1, 'Bobines de indutância');
INSERT INTO tipoproduto(idtipo,nome) VALUES (2, 'Circuitos Integrados');
INSERT INTO tipoproduto(idtipo,nome) VALUES (3, 'Condensadores');
INSERT INTO tipoproduto(idtipo,nome) VALUES (4, 'Cristais');
INSERT INTO tipoproduto(idtipo,nome) VALUES (5, 'Cabos');
INSERT INTO tipoproduto(idtipo,nome) VALUES (6, 'Diodos');
INSERT INTO tipoproduto(idtipo,nome) VALUES (7, 'Fichas');
INSERT INTO tipoproduto(idtipo,nome) VALUES (8, 'Filtros');
INSERT INTO tipoproduto(idtipo,nome) VALUES (9, 'Fio para Bobinagem');
INSERT INTO tipoproduto(idtipo,nome) VALUES (10, 'Lâmpadas');
INSERT INTO tipoproduto(idtipo,nome) VALUES (11, 'LEDs');
INSERT INTO tipoproduto(idtipo,nome) VALUES (12, 'Resistências');
INSERT INTO tipoproduto(idtipo,nome) VALUES (13, 'Termocondutores');
INSERT INTO tipoproduto(idtipo,nome) VALUES (14, 'Tiristores');
INSERT INTO tipoproduto(idtipo,nome) VALUES (15, 'Transistores');
INSERT INTO tipoproduto(idtipo,nome) VALUES (16, 'Triacs');
INSERT INTO tipoproduto(idtipo,nome) VALUES (17, 'Ventoinhas');
INSERT INTO tipoproduto(idtipo,nome) VALUES (18, 'PCBs');
/* FIM DE INSERÇÃO DE TIPOS DE PRODUTO --------*/

/* INSERÇÃO DE CLIENTES - Rosa */

/* FIM DE INSERÇÃO DE CLIENTES */

/* INSERÇÃO DE COLABORADORES - Rosa */

/* FIM DE INSERÇÃO DE COLABORADORES */

/* INSERÇÃO DE PRODUTOS - Ruben */

/* FIM DE INSERÇÃO DE PRODUTOS */

SHOW TABLES;
