/*																																 */
/*												TRABALHO DE SQL - UC02830														 */
/*								 DESENVOLVIDO POR RUBEN DUARTE, CARLOS GOMES E ROSA BORGES										 */
DROP DATABASE LojaComponentes;
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

/* Tabelas sem foreign keys */
CREATE TABLE categoria(
idcat INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nomecat VARCHAR (200)
);

/* MARCAS */
CREATE TABLE marcas(
idmarca INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nomemarca VARCHAR (200),
morada VARCHAR(200),
numerofiscal INT UNIQUE
);

/* INSERÇÃO DAS MARCAS - CARLOS */

/* FIM DE INSERÇÃO DAS MARCAS */
/* -------------------------------------------------------------------------------------------------------- */

CREATE TABLE colaboradores(
idcol INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);
/* INSERÇÃO DE COLABORADORES - Rosa */
INSERT INTO colaboradores (nome,datanascimento,morada,ncontribuinte)VALUES
('Ana Julia', '1987-07-24', 'Coimbra',  '12345875'),
('Maria Amelia', '1988-01-7',  'Lisboa','13457588'),
('Paula Esteves', '1975-06-17',' Mafra', '14470764'),
('Teresa Chaves', '1975-05-10','Rua 25-de Abril', '1777810'),
('Rosa Neves', '1995-08-16', 'Rua monte abraao','1227689'),
('Carlos Gomes','1981-11-15','Rua da Anogola','1495790'),
('Ruben Sousa', '1987-06-30','Rua Pregritos', '1397732'),
('Marcos Daniel', '1977-12-24', 'Rua Njinga','1786543');
/* FIM DE INSERÇÃO DE COLABORADORES */
/* -------------------------------------------------------------------------------------------------------- */

CREATE TABLE cliente(
idcliente INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
datanascimento date,
morada VARCHAR(200),
ncontribuinte INT UNIQUE
);

/* INSERÇÃO DE CLIENTES - Rosa */
INSERT INTO cliente(nome, datanascimento,morada,ncontribuinte)VALUES
('Antonio Vaz', '1950-01-1', 'Aveiro',  '12345822'),
('Marcelo Texeira', '1960-03-4',  'Braga','13457588'),
('Marlene Chaves', '1964-06-14',' Viseu', '14470711'),
('Marcela Nuno', '1944-07-11','Rua 19-de Abril', '1777810'),
('Lucia Neves', '1975-04-28', 'Rua Olivaça','12276801'),
('Novoes Mendes','1945-05-9','Rua da Alemanha','1495722'),
('Ruben Tavares', '1981-05-29','Rua Avida-Brasil', '1397732'),
('Neves Daniel', '1984-09-24', 'Rua Perigrino','1786533'),
('Ana Luisa', '1932-02-11', 'Rua Barcelona', '1765906'),
('Pereira Marcio','1958-09-04', 'Rua Moçabique','1644017'),
('Aguiar Mendes', '1976-08-07',  'Rua Belgica','1945219'),
('Merico Trindade','1970-07-11', 'Rua Benguela','1001876');
/* FIM DE INSERÇÃO DE CLIENTES */
/* -------------------------------------------------------------------------------------------------------- */
/* Fim das tabelas sem foreign keys */

/* ELETRONICA */
CREATE TABLE tipoproduto_eletro(
idtipo INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
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
idproduto INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
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
idtipo INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

CREATE TABLE produto_auto(
idproduto INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
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

/* FIM DE INSERÇÃO DE PRODUTOS - AUTOMÓVEL */
/* FIM DA AUTOMOVEL */
/* -------------------------------------------------------------------------------------------------------- */

/* DOMOTICA */
CREATE TABLE tipoproduto_domo(
idtipo INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

CREATE TABLE produto_domo(
idproduto INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
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
idtipo INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
nome VARCHAR(100),
idcategoria INT, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

CREATE TABLE produto_bat(
idproduto INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
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
