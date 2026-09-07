/*																																 */
/*												TRABALHO DE SQL - UC02830														 */
/*								 DESENVOLVIDO POR RUBEN DUARTE, CARLOS GOMES E ROSA BORGES										 */
/*																																 */
DROP DATABASE IF EXISTS LojaComponentes;
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

/* Tabelas sem foreign keys */
CREATE TABLE categoria(
idcat INT PRIMARY KEY AUTO_INCREMENT,
nomecat VARCHAR (200)
);

/* INSERÇÃO DE CATEGORIAS */
INSERT INTO categoria(idcat,nomecat) VALUES
('1' ,'ELETRONICA'),
('2', 'AUTOMOVEL'),
('3', 'DOMOTICA'),
('4', 'BATERIAS');
/* ---------------------- */

/* MARCAS */
CREATE TABLE marcas(
idmarca INT PRIMARY KEY AUTO_INCREMENT,
nomemarca VARCHAR (200),
morada VARCHAR(200),
numerofiscal INT UNIQUE
);

/* INSERÇÃO DAS MARCAS - CARLOS, RUBEN, ROSA */
/* ELETRONICA */

/* --------- */
/* AUTOMOVEL */
INSERT INTO marcas(idmarca,nomemarca,morada,numerofiscal)VALUES
("0001", 'AMiO', 'POLONIA', '0000001'),
("0002", 'K2', 'ESTADOS UNIDOS', '0000002'),
("0003", 'TE Connectivity', 'IRLANDA', '0000003'),
("0004", 'TE DEUTSCH', 'ALEMANHA', '0000004'),
("0005", 'ELTA', 'REINO UNIDO', '0000005'),
("0006", 'EcoFlow', 'ESTADOS UNIDOS', '0000006'),
("0007", 'Högert', 'ALEMANHA', '0000007');
/* --------- */
/* DOMOTICA */

/* ------- */


/* FIM DE INSERÇÃO DAS MARCAS */
/* -------------------------------------------------------------------------------------------------------- */

CREATE TABLE colaboradores(
idcol INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);
/* INSERÇÃO DE COLABORADORES - Rosa */
INSERT INTO colaboradores (nome,datanascimento,morada,ncontribuinte)VALUES
('Ana Julia', '1987-07-24', 'Coimbra',  '12345875'),
('Maria Amelia', '1988-01-7', 'Lisboa', '13457588'),
('Paula Esteves', '1975-06-17', ' Mafra', '14470764'),
('Teresa Chaves', '1975-05-10', 'Rua 25-de Abril', '1777810'),
('Rosa Neves', '1995-08-16', 'Rua monte abraao', '1227689'),
('Carlos Gomes', '1981-11-15', 'Rua da Anogola', '1495790'),
('Ruben Sousa', '1987-06-30', 'Rua Pregritos',  '1397732'),
('Marcos Daniel', '1977-12-24', 'Rua Njinga', '1786543');
/* FIM DE INSERÇÃO DE COLABORADORES */
/* -------------------------------------------------------------------------------------------------------- */

CREATE TABLE cliente(
idcliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);

/* INSERÇÃO DE CLIENTES - Rosa */
INSERT INTO cliente(nome, datanascimento,morada,ncontribuinte)VALUES
('Antonio Vaz', '1950-01-1', 'Aveiro', '12345822'),
('Marcelo Texeira', '1960-03-4', 'Braga', '13457588'),
('Marlene Chaves', '1964-06-14', ' Viseu', '14470711'),
('Marcela Nuno', '1944-07-11', 'Rua 19-de Abril', '1777810'),
('Lucia Neves', '1975-04-28', 'Rua Olivaça', '12276801'),
('Novoes Mendes', '1945-05-9', 'Rua da Alemanha', '1495722'),
('Ruben Tavares', '1981-05-29', 'Rua Avida-Brasil', '1397732'),
('Neves Daniel', '1984-09-24', 'Rua Perigrino', '1786533'),
('Ana Luisa', '1932-02-11', 'Rua Barcelona', '1765906'),
('Pereira Marcio', '1958-09-04', 'Rua Moçabique', '1644017'),
('Aguiar Mendes',  '1976-08-07', 'Rua Belgica', '1945219'),
('Merico Trindade', '1970-07-11', 'Rua Benguela', '1001876');
/* FIM DE INSERÇÃO DE CLIENTES */
/* -------------------------------------------------------------------------------------------------------- */
/* Fim das tabelas sem foreign keys */

/* ELETRONICA */
CREATE TABLE tipoproduto_eletro(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

/* INSERÇÃO DE TIPOS DE PRODUTOS - Eletronica */
INSERT INTO tipoproduto_eletro(idtipo,nome) VALUES 
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

CREATE TABLE produto_eletro(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia INT UNIQUE,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DOUBLE,
dimensoes VARCHAR(100),
idcategoria INT, FOREIGN KEY (idcategoria) REFERENCES categoria(idcat),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_eletro(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - ELETRONICA - Ruben */

/* FIM DE INSERÇÃO DE PRODUTOS */
/* FIM DA ELETRONICA */
/* -------------------------------------------------------------------------------------------------------- */

/* AUTOMOVEL */
CREATE TABLE tipoproduto_auto(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);
/* INSERÇÃO DE TIPOS DE PRODUTOS - Automovel */
INSERT INTO tipoproduto_auto(nome) VALUES
('Diagnostico ODB'),
('Outros'),
('Superseal 1.5 (estanques)'),
('Terminais fêmea'),
('Presença e Sinalização'),
('Power Station'),
('Cabos para bateria');
/* FIM DE INSERÇÃO DE TIPOS DE PRODUTO - Automovel */

CREATE TABLE produto_auto(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia INT UNIQUE,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DOUBLE,
dimensoes VARCHAR(100),
idcategoria INT, FOREIGN KEY (idcategoria) REFERENCES categoria(idcat),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_auto(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - AUTOMÓVEL - Ruben */
INSERT INTO produto_auto(nome,descricao,preco,dimensoes,idcategoria,idtipo,idmarca) VALUES
('AMiO - Interface de diagnóstico compacto Bluetooth OBD2 / CAN - v2.2', 'interface de diagnóstico', '5.51', '25x25x25', '2', '1', '0001'),
('K2 Lamp Protect - Kit revestimento de proteção para faróis (selante de faróis)', 'K2 LAMP PROTECT é uma solução de proteção de longa duração', '7.95', '50x50x25', '2', '2', '0002'),
('TE Deutsch 1062-16-0122 - Terminal fêmea para fichas Deutsch Size 16 (0.75...2mm²)', 'Tamanho do terminal: 16', '0.59', '50x50x25', '2', '3', '0003'),
('TE Connectivity 183024-1 - Terminal macho para ficha AMP macho para fio 0.75..1.5mm² 14A', 'Tipo de conector: terminal macho para fichas AMP Superseal 1.5 macho', '0.18', '22.75x1.5', '2', '3', '0003'),
('ELTA EB0380TB - Lâmpada BAY15d P21/5W 12V', 'Tipo de lâmpada: para automóveis', '0.65', '22.75x1.5', '2', '4', '0004'),
('EcoFlow Delta 3 Max Plus - Power Station 3000W 2048Wh (expansível) c/ bateria LFP de 10 anos e App', 'A EcoFlow DELTA 3 Max Plus redefine o conceito de energia portátil', '0.65', '22.75x1.5', '2', '5', '0005'),
('Högert HT8G602 - Cabos de arranque de bateria p/ automóvel 600A - 3,5m', 'Comprimento: 3,5m', '14.70', '3 metros', '2', '6', '0006');
/* FIM DE INSERÇÃO DE PRODUTOS - AUTOMÓVEL */
/* FIM DA AUTOMOVEL */
/* -------------------------------------------------------------------------------------------------------- */

/* DOMOTICA */
CREATE TABLE tipoproduto_domo(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

CREATE TABLE produto_domo(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia INT UNIQUE,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DOUBLE,
dimensoes VARCHAR(100),
idcategoria INT, FOREIGN KEY (idcategoria) REFERENCES categoria(idcat),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_domo(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - DOMÓTICA - Ruben */

/* FIM DE INSERÇÃO DE PRODUTOS - DOMÓTICA */
/* FIM DA DOMOTICA */
/* -------------------------------------------------------------------------------------------------------- */

/* BATERIAS */
CREATE TABLE tipoproduto_bat(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

CREATE TABLE produto_bat(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia INT UNIQUE,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DOUBLE,
dimensoes VARCHAR(100),
idcategoria INT, FOREIGN KEY (idcategoria) REFERENCES categoria(idcat),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_bat(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - BATERIAS - Ruben */

/* FIM DE INSERÇÃO DE PRODUTOS - BATERIAS */
/* FIM DA BATERIAS */
/* -------------------------------------------------------------------------------------------------------- */

SHOW TABLES;
