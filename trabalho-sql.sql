 /* ------------------------------------------------------------------------------------------------------------------------------- */
/*																																   */
/*											    	TRABALHO DE SQL - UC02830													   */
/*								 DESENVOLVIDO POR RUBEN DUARTE, CARLOS GOMES E ROSA BORGES										   */
/*																																   */
/* ------------------------------------------------------------------------------------------------------------------------------- */

DROP DATABASE IF EXISTS LojaComponentes; /* -> Verifica se existe a base de dados, caso exista, é eliminada */
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

/* Tabelas sem foreign keys */
CREATE TABLE categoria(
idcat INT PRIMARY KEY AUTO_INCREMENT,
nomecat VARCHAR (200)
);
/* ------- --- ------- ---- */

/* INSERÇÃO DE CATEGORIAS */
INSERT INTO categoria(nomecat) VALUES
('ELETRONICA'),
('AUTOMOVEL'),
('DOMOTICA'),
('BATERIAS');
/* -------- -- ---------- */

/* MARCAS */
CREATE TABLE marcas(
idmarca INT PRIMARY KEY AUTO_INCREMENT,
nomemarca VARCHAR (200),
morada VARCHAR(200),
numerofiscal VARCHAR(15) UNIQUE
);

/* INSERÇÃO DAS MARCAS - CARLOS, RUBEN, ROSA */
/* ELETRONICA - CARLOS */
INSERT INTO marcas (nomemarca,morada,numerofiscal)VALUES
('NULL','NULL','NULL'),
('Texas Instrumentes','12500 TI Blvd. Dallas Texas 75243 USA','972995201'),
('Microchip Technology Inc','2355 West Chandler Blvd. Chandler Arizona USA', '972995122'),
('Analog Divices','2356 West Chandler Blvd. Chandler Arizona USA', '972995223'),
('Toshiba','72-34, Horikawa-cho, Saiwai-ku Kawasaki-shi Kanagawa 212-8585, Japan', '972995224'),
('Microship Technology Inc.','2355 West Chandler Blvd. Chandler, Arizona, USA', '972995225'),
('Vishay Intertechnology, Inc.','Edificio Xi Bloque B Polígono Industrial Mas Blau 08820 El Prat de Llobregat Spain', '972995226'),
('Velleman, Group.','Legen Heirweg 33, Gavere Belgium ', '0768858127'),
('Nexperia','Jonkerbosplein 526534 AB Nijmegen The Netherlands ', '0768858128'),
('Kemo Electronic GmbH','Leher Landstr. 20 D-27607 Geestland-Germany ', '0768858139'),
('Broadcom','Calle Quintanapalla, 2 Madrid, 28050 Spain ', '0968858339'),
('AIMTEC','U Prazdroje 2807/8 Pilsen, 301 00 Czech Republic ', '252018160'),
('SEMTECH ELECTRONICS LIMITED','Semtech Corporation 200 Flynn Road Camarillo, California 93012 USA', '852038960'),
('Motorola','Semtech Corporation 200 Flynn Road Camarillo, California 93012 USA', '862018964'),
('SIEMENS','SieMENSTEch Corporation 200 Flynn Road Camarillo, California 93012 Germany', '852048960'),
('Fairchild','Fairchild Corporation 201 Flynn Road Camarillo, California 93012 USA', '852018960'),
('STMicroelectronics','STMicroelectronics Corporation 201 Flynn Road Camarillo, California 93012 USA', '852018460'),
('STMicroelectronics','STMicroelectronics Corporation 201 Flynn Road Camarillo, California 93012 USA', '853015960'),
('Arrow Electronics','Arrow Electronics Corporation 201 Flynn Road Camarillo, California 93012 USA', '455017960'),
/* ---------- - ------ */
/* AUTOMOVEL - RUBEN */
('AMiO', 'POLONIA', '0000001'),
('K2', 'ESTADOS UNIDOS', '0000002'),
('TE Connectivity', 'IRLANDA', '0000003'),
('TE DEUTSCH', 'ALEMANHA', '0000004'),
('ELTA', 'REINO UNIDO', '0000005'),
('EcoFlow', 'ESTADOS UNIDOS', '0000006'),
('Högert', 'ALEMANHA', '0000007');
/* --------- - -----  */
/* DOMOTICA - ROSA */

/* -------- - ---- */
/* FIM DE INSERÇÃO DAS MARCAS */
/* ------------------------------------------------------------------------------------------------------------------------------- */

/* PESSOAS */
CREATE TABLE pessoas(
idpessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100),
datanascimento DATE,
morada VARCHAR (200),
ncontribuinte VARCHAR(15) UNIQUE NOT NULL	
);

/* INSERÇÃO DE PESSOAS */
INSERT INTO pessoas (nome,datanascimento,morada,ncontribuinte)VALUES
('Ana Julia', '1987-07-24', 'Coimbra',  '12345875'),
('Maria Amelia', '1988-01-07', 'Lisboa', '13457588'),
('Paula Esteves', '1975-06-17', ' Mafra', '14470764'),
('Teresa Chaves', '1975-05-10', 'Rua 25-de Abril', '1777810'),
('Rosa Neves', '1995-08-16', 'Rua monte abraao', '1227689'),
('Carlos Gomes', '1981-11-15', 'Rua da Angola', '1495790'),
('Ruben Sousa', '1987-06-30', 'Rua Pregritos',  '1397732'),
('Marcos Daniel', '1977-12-24', 'Rua Njinga', '1786543'),
('Antonio Vaz', '1950-01-01', 'Aveiro', '12345822'),
('Marcelo Texeira', '1960-03-04', 'Braga', '13427588'),
('Marlene Chaves', '1964-06-14', ' Viseu', '14470711'),
('Marcela Nuno', '1944-07-11', 'Rua 19-de Abril', '1277810'),
('Lucia Neves', '1975-04-28', 'Rua Olivaça', '12276801'),
('Novoes Mendes', '1945-05-09', 'Rua da Alemanha', '1495722'),
('Ruben Tavares', '1981-05-29', 'Rua Avenida-Brasil', '1397532'),
('Neves Daniel', '1984-09-24', 'Rua Perigrino', '1786533'),
('Ana Luisa', '1932-02-11', 'Rua Barcelona', '1765906'),
('Pereira Marcio', '1958-09-04', 'Rua Moçabique', '1644017'),
('Aguiar Mendes',  '1976-08-07', 'Rua Belgica', '1945219'),
('Merico Trindade', '1970-07-11', 'Rua Benguela', '1001876');
/* FIM DA INSERÇÃO DE PESSOAS */

/* TABELAS DE CLIENTE E COLABORADORES */
CREATE TABLE colaboradores(
idpessoa INT PRIMARY KEY,
cargo VARCHAR(50) DEFAULT 'Funcionário',
data_admissao DATE,
FOREIGN KEY (idpessoa) REFERENCES pessoas(idpessoa) ON DELETE CASCADE
);

/* INSERÇÃO DE COLABORADORES */
INSERT INTO colaboradores (idpessoa, cargo) VALUES
('5', 'Gerente de loja'),
('8', 'Administrador de IT');
/* FIM DE INSERÇÃO DE COLABORADORES */

CREATE TABLE cliente(
idpessoa INT PRIMARY KEY,
data_registo DATE,
FOREIGN KEY (idpessoa) REFERENCES pessoas(idpessoa) ON DELETE RESTRICT
);

/* INSERÇÃO DE CLIENTES */
INSERT INTO cliente (idpessoa) VALUES
('5'),
('15');
/* FIM DE INSERÇÃO DE CLIENTES */

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* ELETRONICA */
CREATE TABLE tipoproduto_eletro(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT DEFAULT 1, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);

/* INSERÇÃO DE TIPOS DE PRODUTOS - Eletronica */
INSERT INTO tipoproduto_eletro(nome) VALUES 
('Bobines de indutância'),
('Circuitos Integrados'),
('Condensadores'),
('Cristais'),
('Cabos'),
('Diodos'),
('Fichas'),
('Filtros'),
('Fio para Bobinagem'),
('Lâmpadas'),
('LEDs'),
('Resistências'),
('Termocondutores'),
('Tiristores'),
('Transistores'),
('Triacs'),
('Ventoinhas');
/* FIM DE INSERÇÃO DE TIPOS DE PRODUTO --------*/

CREATE TABLE produto_eletro(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia VARCHAR(20) UNIQUE,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DECIMAL(10,2),
dimensoes VARCHAR(100),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_eletro(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - ELETRONICA - Ruben */
INSERT INTO produto_eletro(numreferencia,nome,descricao,preco,dimensoes,idtipo,idmarca) VALUES
('031-0071','Bobina de indutância axial 1000uH/1mH 60mA Ø3x8mm','Indutor axial com montagem THT, capaz de fornecer 1000 µH de indutância','0.16','3x8',1,1),
('001-0109','Circuito Integrado NE555','K40472','0.53','3x8',2,1),
('004-5086','Condensador cerâmico 100nF 50V','Condensador cerâmico de montagem through-hole (THT)','0.09','3x8',3,1),
('069-9630','Cristal de Quartzo 16.0MHz - Baixo perfil','NULL','0.80','3x8',4,1),
('5903293044551','AMiO - Bobine de fio CCA multifilar 1x1.50mm² - preto - 50m','NULL','8.75','50',5,20),
('007-0209','Diodo Rectificador 1000V 1A - 1N4007','Este diodo retificador de alta tensão utiliza montagem em THT e oferece tolerância de até 1 kV de tensão reversa.','0.09','1',6,1),
('019-4849','Conjunto de 10 cabos de ligação Jumper Dupont fêmea -> Crocodilo - 20cm','NULL','3.39','20',7,1),
('096-2424','Filtro de ferrite para cabo redondo Ø6mm','NULL','1.22','6',8,1),
('5410329402983','Velleman WIK01N - Fio bobinagem Ø0.1mm (1.5 Kohm) - 715m','NULL','8.30','715',9,8), 
('3522291184117','Lâmpada tubular E14 25W 24V - 16x54mm','NULL','4.10','NULL',10,1),
('017-1209','LED 5mm transparente branco alto-brilho 33000mcd 15º','LED de 5 mm com brilho entre 23.5k e 33k mcd, cor branca fria, lente transparente e frente convexa.','0.20','NULL',11,1),
('104-7048','Resistência de filme metálico 10kR 0.6W ±1% Ø2.5x6.8mm','Resistência de filme metálico para montagem THT','0.11','NULL',12,1),
('8445577000626','Pasta térmica (2.0W/mK) - Branca - 3g','Pasta térmica branca com condutividade térmica de 2.0 W/m-K e densidade de 2,8 g/cm³','4.21','NULL',13,1),
('002-1363','Tiristor BT169D','NULL','0.18','NULL',14,1),
('002-1190','Transistor IRLZ44N','Transístor MOSFET de potência com canal enriquecido e nível lógico','1.14','NULL',15,1),
('002-1361','Triac BTB24-800BWRG','Triac de potência com montagem THT, carcaça TO220AB, embalagem tubo','2.31','NULL',16,1),
('048-0150','Sunon DP200A2123XST.GN','A ventoinha de 120x120x38 mm é alimentada a 230 VAC, 50 Hz, com potência de 22 W e corrente de 140 mA','14.99','NULL',17,1);
/* FIM DE INSERÇÃO DE PRODUTOS */
/* FIM DA ELETRONICA */
/* ------------------------------------------------------------------------------------------------------------------------------- */

/* AUTOMOVEL */
CREATE TABLE tipoproduto_auto(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT DEFAULT 2, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);
/* INSERÇÃO DE TIPOS DE PRODUTOS - Automovel */
INSERT INTO tipoproduto_auto(nome) VALUES
('Diagnostico ODB'),
('Outros') ,
('Superseal 1.5 (estanques)'),
('Terminais fêmea'),
('Presença e Sinalização'),
('Power Station'),
('Cabos para bateria');
/* FIM DE INSERÇÃO DE TIPOS DE PRODUTO - Automovel */

CREATE TABLE produto_auto(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia VARCHAR(20) UNIQUE NULL,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DECIMAL(10,2),
dimensoes VARCHAR(100),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_auto(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - AUTOMÓVEL - Ruben */
INSERT INTO produto_auto(numreferencia,nome,descricao,preco,dimensoes,idtipo,idmarca) VALUES
('5903293047330', 'AMiO - Interface de diagnóstico compacto Bluetooth OBD2 / CAN - v2.2', 'interface de diagnóstico', '5.51', '25x25x25', '1', '0001'),
('5906534017475', 'K2 Lamp Protect - Kit revestimento de proteção para faróis (selante de faróis)', 'K2 LAMP PROTECT é uma solução de proteção de longa duração', '7.95', '50x50x25', '2', '0002'),
(NULL, 'TE Deutsch 1062-16-0122 - Terminal fêmea para fichas Deutsch Size 16 (0.75...2mm²)', 'Tamanho do terminal: 16', '0.59', '50x50x25', '3', '0003'),
(NULL, 'TE Connectivity 183024-1 - Terminal macho para ficha AMP macho para fio 0.75..1.5mm² 14A', 'Tipo de conector: terminal macho para fichas AMP Superseal 1.5 macho', '0.18', '22.75x1.5', '3', '0004'),
('5021374445872', 'ELTA EB0380TB - Lâmpada BAY15d P21/5W 12V', 'Tipo de lâmpada: para automóveis', '0.65', '22.75x1.5', '4', '0005'),
('4895251658829', 'EcoFlow Delta 3 Max Plus - Power Station 3000W 2048Wh (expansível) c/ bateria LFP de 10 anos e App', 'A EcoFlow DELTA 3 Max Plus redefine o conceito de energia portátil', '0.65', '22.75x1.5', '5', '0006'),
('5902801283147', 'Högert HT8G602 - Cabos de arranque de bateria p/ automóvel 600A - 3,5m', 'Comprimento: 3,5m', '14.70', '3 metros', '6', '0007');
/* FIM DE INSERÇÃO DE PRODUTOS - AUTOMÓVEL */
/* FIM DA AUTOMOVEL */
/* ------------------------------------------------------------------------------------------------------------------------------- */

/* DOMOTICA */
CREATE TABLE tipoproduto_domo(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT DEFAULT 3, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);
INSERT INTO tipoproduto_domo (nome) VALUES
 ('Tomada Inteligente'),
 ('Modulo Interruptor'),
 ('Interruptor Inteligente'), 
 ('Modulo interruptor para automaçao'),
 ('Modulo medidor'),
 ('Computador'),
 ('Mtgud'),
 ('Modulo medidor de consumo trifasico'),
 ('Rule Modulo Shelly proq3em'),
 ('50A ct modulo medidor de consumo duplo'),
 ('Medidor consumo trafico Wifi c/3');

CREATE TABLE produto_domo(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia VARCHAR(20) UNIQUE NULL,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DECIMAL(10,2),
dimensoes VARCHAR(100),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_domo(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - DOMÓTICA - Ruben */
/*INSERT INTO produto_domo(referencia,nome,descriçao,preço,idtipo,idmarca) VALUES */

/* FIM DE INSERÇÃO DE PRODUTOS - DOMÓTICA */
/* FIM DA DOMOTICA */
/* ------------------------------------------------------------------------------------------------------------------------------- */

/* BATERIAS */
CREATE TABLE tipoproduto_bat(
idtipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idcategoria INT DEFAULT 4, FOREIGN KEY(idcategoria) REFERENCES categoria(idcat)
);
/* INSERÇÃO DE TIPO DE PRODUTOS - BATERIAS */ 

/* -------- -- ---- -- -------- - -------- */
CREATE TABLE produto_bat(
idproduto INT PRIMARY KEY AUTO_INCREMENT,
numreferencia VARCHAR(20) UNIQUE NULL,
nome VARCHAR(100),
descricao VARCHAR(500),
preco DECIMAL(10,2),
dimensoes VARCHAR(100),
idtipo INT, FOREIGN KEY (idtipo) REFERENCES tipoproduto_bat(idtipo),
idmarca INT, FOREIGN KEY (idmarca) REFERENCES marcas(idmarca)
);

/* INSERÇÃO DE PRODUTOS - BATERIAS - Ruben */

/* FIM DE INSERÇÃO DE PRODUTOS - BATERIAS */
/* FIM DA BATERIAS */
/* ------------------------------------------------------------------------------------------------------------------------------- */

/* ------------------------------------------------------------------------------------------------------------------------------- */
/*																																   */
/*	                                                      QUERIES																   */
/*																																   */
/* ------------------------------------------------------------------------------------------------------------------------------- */
