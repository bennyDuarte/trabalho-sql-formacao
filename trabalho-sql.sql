/* ------------------------------------------------------------------------------------------------------------------------------- */
/*																																   */
/*											    	TRABALHO DE SQL - UC02830													   */
/*								 DESENVOLVIDO POR RUBEN DUARTE, CARLOS GOMES E ROSA BORGES										   */
/*																																   */
/* ------------------------------------------------------------------------------------------------------------------------------- */

DROP DATABASE IF EXISTS LojaComponentes; /* -> Verifica se existe a base de dados, caso exista, é eliminada */
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

CREATE TABLE categoriaProduto(
	idcat INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (200)
);

INSERT INTO categoriaProduto(nome) VALUES
('Eletrónica'),
('Automóvel'),
('Domótica'),
('Baterias');

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE marcasProduto(
	idmarca INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200),
	morada VARCHAR(200),
	numfiscal VARCHAR(15)
);

INSERT INTO marcasProduto(nome,morada,numfiscal) VALUES
/* BATOTA */
('Genérica','NULL','NULL'),
/* Eletrónica - id 2 a id 19 */
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
('Arrow Electronics','Arrow Electronics Corporation 201 Flynn Road Camarillo, California 93012 USA', '455017960'),
/* Automóvel - id 20 a id 27 */
('AMiO', '63A Knurowska Street 41-800 Zabrze, Poland', 'PL6482786722'),
('K2', 'ESTADOS UNIDOS', '0000002'),
('TE Connectivity', 'IRLANDA', '0000003'),
('TE DEUTSCH', 'ALEMANHA', '0000004'),
('ELTA', 'REINO UNIDO', '0000005'),
('EcoFlow', 'ESTADOS UNIDOS', '0000006'),
('Högert', 'ALEMANHA', '0000007'),
/* Domótica - id 28 a id 35 */
('Amazon', '410 Terry Ave N, Seattle, WA 98109 USA', '0000008'),
('Aqara', 'Shenzhen China', '0000009'),
('BroadLink', '57 Jianger Road, Binjiang District, Hangzhou, China', '0000010'),
('Danalock', 'Grønhøjvej 64 A, 8462 Harlev, Denmark', '0000011'),
('Sonoff', 'Shenzhen, Guangdong Province, China', '0000013'),
/* Baterias - id 36 a id 38 */
('Raspberry PI', 'Cambridge, 37 Hills Rd, United Kingdom', '00000014'),
('Phasak', 'C/ El Pensamiento 27, Escalera Izquierda, 28020 Madrid, Spain', '00000015'),
('Green Cell', 'Kalwaryjska 33, PL-30-509 Krakow, Poland', '00000016');

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE tipoProduto(
	idtipo INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100),
	idcat INT,
	FOREIGN KEY (idcat) REFERENCES categoriaProduto(idcat) 
);

INSERT INTO tipoProduto(nome,idcat) VALUES
/* Eletrónica - id 1 a id 17*/
('Bobines de indutância',1),
('Circuitos Integrados',1),
('Condensadores',1),
('Cristais',1),
('Cabos',1),
('Diodos',1),
('Fichas',1),
('Filtros',1),
('Fio para Bobinagem',1),
('Lâmpadas',1),
('LEDs',1),
('Resistências',1),
('Termocondutores',1),
('Tiristores',1),
('Transistores',1),
('Triacs',1),
('Ventoinhas',1),
/* Automóvel - id 18 a id 24*/
('Diagnostico ODB',2),
('Outros',2) ,
('Superseal 1.5 (estanques)',2),
('Terminais fêmea',2),
('Presença e Sinalização',2),
('Power Station',2),
('Cabos para bateria',2),
/* Domótica - id 25 a id 29 */
('Amazon Alexa',3),
('Aqara',3),
('Broadlink',3),
('Danalock',3),
('Dispositivos RF',3),
/* Baterias - id 30 a id 34 */
('Baterias Backup',4),
('Baterias Chumbo / Gel',4),
('Baterias de Lítio',4),
('Baterias Li-Po genéricas',4),
('Baterias p/ aspiradores',4);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE produtos(
	idProd INT PRIMARY KEY AUTO_INCREMENT,
	numref VARCHAR(20) NULL UNIQUE,
	nome VARCHAR(255),
	descricao VARCHAR(500),
	preco DECIMAL (10,2),
	dimensoes VARCHAR(100),
	idtipo INT,
	idmarca INT,
	FOREIGN KEY (idtipo) REFERENCES tipoProduto(idtipo),
	FOREIGN KEY (idmarca) REFERENCES marcasProduto(idmarca)
);

INSERT INTO produtos(numref,nome,descricao,preco,dimensoes,idtipo,idmarca) VALUES
/* Eletrónica */
('031-0071','Bobina de indutância axial 1000uH/1mH 60mA Ø3x8mm','Indutor axial com montagem THT, capaz de fornecer 1000 µH de indutância',0.16,'3x8',1,1),
('001-0109','Circuito Integrado NE555','K40472',0.53,'3x8',2,1),
('004-5086','Condensador cerâmico 100nF 50V','Condensador cerâmico de montagem through-hole (THT)',0.09,'3x8',3,1),
('069-9630','Cristal de Quartzo 16.0MHz - Baixo perfil',NULL,0.80,'3x8',4,1),
('5903293044551','AMiO - Bobine de fio CCA multifilar 1x1.50mm² - preto - 50m',NULL,8.75,'50',5,19),
('007-0209','Diodo Rectificador 1000V 1A - 1N4007','Este diodo retificador de alta tensão utiliza montagem em THT e oferece tolerância de até 1 kV de tensão reversa.',0.09,'1',6,1),
('019-4849','Conjunto de 10 cabos de ligação Jumper Dupont fêmea -> Crocodilo - 20cm',NULL,3.39,'20',7,1),
('096-2424','Filtro de ferrite para cabo redondo Ø6mm',NULL,1.22,'6',8,1),
('5410329402983','Velleman WIK01N - Fio bobinagem Ø0.1mm (1.5 Kohm) - 715m',NULL,8.30,'715',9,8), 
('3522291184117','Lâmpada tubular E14 25W 24V - 16x54mm',NULL,4.10,NULL,10,1),
('017-1209','LED 5mm transparente branco alto-brilho 33000mcd 15º','LED de 5 mm com brilho entre 23.5k e 33k mcd, cor branca fria, lente transparente e frente convexa.',0.20,NULL,11,1),
('104-7048','Resistência de filme metálico 10kR 0.6W ±1% Ø2.5x6.8mm','Resistência de filme metálico para montagem THT',0.11,NULL,12,1),
('8445577000626','Pasta térmica (2.0W/mK) - Branca - 3g','Pasta térmica branca com condutividade térmica de 2.0 W/m-K e densidade de 2,8 g/cm³',4.21,NULL,13,1),
('002-1363','Tiristor BT169D',NULL,0.18,NULL,14,1),
('002-1190','Transistor IRLZ44N','Transístor MOSFET de potência com canal enriquecido e nível lógico',1.14,NULL,15,1),
('002-1361','Triac BTB24-800BWRG','Triac de potência com montagem THT, carcaça TO220AB, embalagem tubo',2.31,NULL,16,1),
('048-0150','Sunon DP200A2123XST.GN','A ventoinha de 120x120x38 mm é alimentada a 230 VAC, 50 Hz, com potência de 22 W e corrente de 140 mA',14.99,NULL,17,1),
/* Automóvel */
('5903293047330', 'AMiO - Interface de diagnóstico compacto Bluetooth OBD2 / CAN - v2.2', 'interface de diagnóstico', 5.51, '25x25x25', 18, 19),
('5906534017475', 'K2 Lamp Protect - Kit revestimento de proteção para faróis (selante de faróis)', 'K2 LAMP PROTECT é uma solução de proteção de longa duração', 7.95, '50x50x25', 19, 20),
(NULL, 'TE Deutsch 1062-16-0122 - Terminal fêmea para fichas Deutsch Size 16 (0.75...2mm²)', 'Tamanho do terminal: 16', 0.59, '50x50x25', 21, 22),
(NULL, 'TE Connectivity 183024-1 - Terminal macho para ficha AMP macho para fio 0.75..1.5mm² 14A', 'Tipo de conector: terminal macho para fichas AMP Superseal 1.5 macho', 0.18, '22.75x1.5', 21, 21),
('5021374445872', 'ELTA EB0380TB - Lâmpada BAY15d P21/5W 12V', 'Tipo de lâmpada: para automóveis', 0.65, '22.75x1.5', 22, 23),
('4895251658829', 'EcoFlow Delta 3 Max Plus - Power Station 3000W 2048Wh (expansível) c/ bateria LFP de 10 anos e App', 'A EcoFlow DELTA 3 Max Plus redefine o conceito de energia portátil', 0.65, '22.75x1.5', 23, 24),
('5902801283147', 'Högert HT8G602 - Cabos de arranque de bateria p/ automóvel 600A - 3,5m', 'Comprimento: 3,5m', 14.70, '3 metros', 24, 25),
/* Domótica */
('0840080539898', 'Amazon Echo Dot (5th Gen) - Coluna inteligente com Alexa e Bluetooth - Preto Antracite', 'Coluna inteligente com assistente de voz que permite gerir dispositivos via Wi-Fi e Bluetooth. ', 61.99, '100x100x89', 25, 26),
('6975833352135', 'Aqara DW-S03D - Sensor de Portas e Janelas sem fios ZigBee [T1]', 'Sensor de portas e janelas sem fios com ZigBee 3.0', 19.99, '41x22x11', 26, 27),
('6924826708442', 'BroadLink RM4 mini - Estação Controlo Remoto IR universal Mini 360º', 'Controla dispositivos por infravermelho através de smartphone através de Wi-Fi ou rede móvel', 16.99, '48x42', 27, 28),
('095-4194', 'Danalock DCE35030NID5 - Cilindro (''canhão'') ajustável para Danalock V3 c/ 5 chaves incluídas - 50-30mm', 'Cilindro de segurança com perfil Euro para fechaduras inteligentes Danalock V3', 94.43, '40x30', 28, 29),
('096-6145', 'Sonoff RF R2 - Wireless Smart Switch Com Receptor RF para Smart Home', 'O interruptor sem fios RF 433MHz permite ligar e desligar dispositivos a partir de qualquer lugar através da app eWeLink', 9.72, '89x39x24', 29, 30),
/* Baterias */
('5056561803739', 'Raspberry Pi SC1163 - Bateria de Backup para o RTC do Raspberry Pi 5', 'O IC de gestão de energia utilizado numa placa integra um relógio de tempo real e um circuito de carregamento', 5.99, NULL, 30, 31),
('5605922047222', 'Phasak PHB 1209 - Bateria de Chumbo (Pb) 12V 9.0Ah (term. largos)', 'A Phasak PHB 1209 é uma bateria selada de chumbo-ácido (VRLA) de 12V e 9Ah', 17.00, NULL, 31, 32),
('5904326374874', 'Green Cell LFPGC12V20AH - Bateria de Lithium (LiFePO4) BMS 12.8V 256Wh 20A', 'Bateria de lítio LiFePO4 de alta eficiência com BMS integrado 12.8V 256Wh', 85.90, NULL, 32, 33),
('8436300862703', 'Bateria 3.7v 250mAH Li-Po 20x30x5mm', 'Bateria de lítio recarregável com 3,7 V e 250 mAh, ideal para dispositivos compactos, oferecendo desempenho estável.', 5.85, '20x30x5mm', 33, 31),
('4047038305895', 'Bateria para aspirador compatível com Dirt Devil Libero M606 14.4V 800mAh 11,5Wh NiMH', 'Esta bateria de substituição NiMH de 14,4V oferece 800mAh e 11,5Wh de energia para aspiradores Dirt Devil', 20.27, NULL, 34, 32);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE pessoas(
	idpessoa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100),
	datanascimento DATE,
	morada VARCHAR(200),
	ncontribuinte VARCHAR(15) NOT NULL UNIQUE
);

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

CREATE TABLE colaboradores(
idpessoa INT PRIMARY KEY,
cargo VARCHAR(50) DEFAULT 'Funcionário',
data_admissao DATE,
FOREIGN KEY (idpessoa) REFERENCES pessoas(idpessoa) ON DELETE CASCADE
);

INSERT INTO colaboradores (idpessoa, cargo) VALUES
('5', 'Gerente de loja'),
('8', 'Administrador de IT');

CREATE TABLE cliente(
idpessoa INT PRIMARY KEY,
data_registo DATE,
FOREIGN KEY (idpessoa) REFERENCES pessoas(idpessoa) ON DELETE RESTRICT
);

INSERT INTO cliente (idpessoa) VALUES
('5'),
('15');
/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE lojas(
	idLoja INT PRIMARY KEY AUTO_INCREMENT,
	rua VARCHAR(255),
	localidade VARCHAR(255),
	distrito VARCHAR(255)
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

CREATE TABLE fatura(
	idfat INT PRIMARY KEY AUTO_INCREMENT,
	idcliente INT NOT NULL,
	idcolaborador INT NOT NULL,
	data_emissao DATETIME DEFAULT CURRENT_TIMESTAMP,
	Valor_total DECIMAL (10,2) DEFAULT 0.00,
	FOREIGN KEY (idcliente) REFERENCES cliente(idpessoa) ON DELETE RESTRICT,
	FOREIGN KEY (idcolaborador) REFERENCES colaboradores(idpessoa) ON DELETE RESTRICT
);

CREATE TABLE linha_fatura(
	idlinha INT PRIMARY KEY AUTO_INCREMENT,
	idfat INT NOT NULL,
	idProd INT NOT NULL,
	quantidade INT NOT NULL CHECK (quantidade > 0),
	preco_unitario DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (idfat) REFERENCES fatura(idfat) ON DELETE CASCADE,
	FOREIGN KEY (idProd) REFERENCES produtos(idProd) ON DELETE RESTRICT
);

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* FOI USADO IA PARA A QUERY*/
INSERT INTO fatura (idcliente, idcolaborador) VALUES (15, 5);

INSERT INTO linha_fatura (idfat, idProd, quantidade, preco_unitario) VALUES 
(1, 1, 10, 0.16),
(1, 18, 1, 5.51); 

UPDATE fatura 
SET valor_total = (SELECT SUM(quantidade * preco_unitario) FROM linha_fatura WHERE idfat = 1)
WHERE idfat = 1;

SELECT 
    f.idfat, 
    p_cli.nome AS cliente, 
    p_cli.ncontribuinte AS contribuinte, 
    p_col.nome AS colaborador, 
    prod.nome AS produto, 
    lf.quantidade, 
    lf.preco_unitario, 
    (lf.quantidade * lf.preco_unitario) AS subtotal,
    f.valor_total AS total_fatura
FROM fatura f
INNER JOIN pessoas p_cli ON f.idcliente = p_cli.idpessoa
INNER JOIN pessoas p_col ON f.idcolaborador = p_col.idpessoa
INNER JOIN linha_fatura lf ON f.idfat = lf.idfat
INNER JOIN produtos prod ON lf.idProd = prod.idProd
WHERE f.idfat = 1;

/* ------------------------------------------------------------------------------------------------------------------------------- */
