DROP DATABASE LojaComponentes;
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

CREATE TABLE colaboradores(
idcol INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);
CREATE TABLE cliente(
idcliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);
CREATE TABLE tipoproduto(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)
);
CREATE TABLE marcas(
idmarca INT PRIMARY KEY AUTO_INCREMENT,
morada VARCHAR(200)
);
