/* ------------------------------------------------------------------------------------------------------------------------------- */
/*                                                                                                                                 */
/*                                            TRABALHO DE SQL - UC02830                                                            */
/*                                 DESENVOLVIDO POR RUBEN DUARTE, CARLOS GOMES E ROSA BORGES                                       */
/*                                                  MODULO 2 - INSERT                                                              */
/* ------------------------------------------------------------------------------------------------------------------------------- */

USE LojaComponentes;

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* categoriaProduto */

INSERT INTO categoriaProduto(nome) VALUES
('Eletrónica'),
('Automóvel'),
('Domótica'),
('Baterias');

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* marcaProduto */

INSERT INTO marcaProduto(nome, morada, numfiscal) VALUES
('Genérica', NULL, NULL),
('Texas Instruments', '12500 TI Blvd, Dallas, TX 75243, USA', 'US750272200'),
('Microchip Technology Inc', '2355 W Chandler Blvd, Chandler, AZ 85224, USA', 'US860629024'),
('Analog Devices', '1 Analog Way, Wilmington, MA 01887, USA', 'US042234820'),
('Toshiba', '1-1-1 Shibaura, Minato-ku, Tokyo 105-8001, Japan', 'JP1010401022285'),
('NXP Semiconductors', 'High Tech Campus 60, 5656 AG Eindhoven, Netherlands', 'NL815887290B01'),
('Vishay Intertechnology, Inc.', '63 Lancaster Ave, Malvern, PA 19355, USA', 'US381686453'),
('Velleman Group', 'Legen Heirweg 33, 9890 Gavere, Belgium', 'BE0437555062'),
('Nexperia', 'Jonkerbosplein 52, 6534 AB Nijmegen, Netherlands', 'NL857243911B01'),
('Kemo Electronic GmbH', 'Leher Landstr. 20, D-27607 Geestland, Germany', 'DE116155982'),
('Broadcom', '1320 Ridder Park Dr, San Jose, CA 95131, USA', 'US352061033'),
('AIMTEC', 'U Prazdroje 2807/8, 301 00 Plzeň, Czech Republic', 'CZ25201816'),
('SEMTECH ELECTRONICS LIMITED', '200 Flynn Rd, Camarillo, CA 93012, USA', 'US952216707'),
('Motorola', '222 W Merchandise Mart Plaza, Chicago, IL 60654, USA', 'US361115800'),
('SIEMENS', 'Werner-von-Siemens-Straße 1, 80333 Munich, Germany', 'DE129274282'),
('Fairchild', '82 Running Hill Rd, South Portland, ME 04106, USA', 'US010211516'),
('STMicroelectronics', '39 Chemin du Champ-des-Filles, 1228 Plan-les-Ouates, Geneva, Switzerland', 'CHE106038472'),
('Arrow Electronics', '9201 E Dry Creek Rd, Centennial, CO 80112, USA', 'US111806155'),
('AMiO', 'ul. Knurowska 63A, 41-800 Zabrze, Poland', 'PL6482786722'),
('K2 (Melle Sp. z o.o.)', 'Stary Staw 9, 63-400 Ostrów Wielkopolski, Poland', 'PL6222301004'),
('TE Connectivity', '10 Earlsfort Terrace, Dublin 2, D02 T380, Ireland', 'IE9513361O'),
('TE DEUTSCH', 'Amperestraße 12-14, 64625 Bensheim, Germany', 'DE111627883'),
('ELTA Automotive Ltd', 'Express House, Phoenix Way, Halesowen, B62 8JZ, United Kingdom', 'GB485458002'),
('EcoFlow', '100 Bayview Point, Suite 100, San Mateo, CA 94402, USA', 'US824092817'),
('Högert Technik', 'ul. Przyszłości 21, 05-800 Pruszków, Poland', 'PL5342505912'),
('Amazon', '410 Terry Ave N, Seattle, WA 98109, USA', 'LU26375245'),
('Aqara (Lumi United Tech)', '8th Floor, Bldg 1, Chongwen Park, Nanshan iPark, Shenzhen, China', 'CN914403000539829283'),
('BroadLink', '57 Jianger Road, Binjiang District, Hangzhou, Zhejiang, China', 'CN91330108072120032N'),
('Danalock ApS', 'Grønhøjvej 68, 8462 Harlev, Denmark', 'DK31613291'),
('Sonoff (Shenzhen Sonoff Tech)', '1001, BLDG 8, Lianhua Industrial Park, Longhua District, Shenzhen, China', 'CN91440300359892182B'),
('Raspberry Pi Ltd', 'Maurice Wilkes Building, St John''s Innovation Park, Cambridge CB4 0DS, UK', 'GB126304979'),
('Phasak', 'Calle El Pensamiento 27, 28020 Madrid, Spain', 'ESB84521908'),
('Green Cell (CSG S.A.)', 'ul. Kalwaryjska 33, 30-509 Kraków, Poland', 'PL6793089012');

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* tipoProduto */
INSERT INTO tipoProduto(nome, idcat) VALUES
('Bobines de indutância', 1),
('Circuitos Integrados', 1),
('Condensadores', 1),
('Cristais', 1),
('Cabos', 1),
('Diodos', 1),
('Fichas', 1),
('Filtros', 1),
('Fio para Bobinagem', 1),
('Lâmpadas', 1),
('LEDs', 1),
('Resistências', 1),
('Termocondutores', 1),
('Tiristores', 1),
('Transistores', 1),
('Triacs', 1),
('Ventoinhas', 1),
('Diagnostico ODB', 2),
('Outros', 2),
('Superseal 1.5 (estanques)', 2),
('Terminais fêmea', 2),
('Presença e Sinalização', 2),
('Power Station', 2),
('Cabos para bateria', 2),
('Amazon Alexa', 3),
('Aqara', 3),
('Broadlink', 3),
('Danalock', 3),
('Dispositivos RF', 3),
('Baterias Backup', 4),
('Baterias Chumbo / Gel', 4),
('Baterias de Lítio', 4),
('Baterias Li-Po genéricas', 4),
('Baterias p/ aspiradores', 4);

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* produto */

INSERT INTO produto(ean, numref, nome, descricao, preco, dimensoes, idtipo, idmarca) VALUES
(NULL, '031-0071', 'Bobina de indutância axial 1000uH/1mH 60mA Ø3x8mm', 'Indutor axial com montagem THT, capaz de fornecer 1000 µH de indutância', 0.16, '3x8', 1, 1),
(NULL, '001-0109', 'Circuito Integrado NE555', 'K40472', 0.53, '3x8', 2, 1),
(NULL, '004-5086', 'Condensador cerâmico 100nF 50V', 'Condensador cerâmico de montagem through-hole (THT)', 0.09, '3x8', 3, 1),
(NULL, '069-9630', 'Cristal de Quartzo 16.0MHz - Baixo perfil', NULL, 0.80, '3x8', 4, 1),
('5903293044551', 'AMIO-50M', 'AMiO - Bobine de fio CCA multifilar 1x1.50mm² - preto - 50m', NULL, 8.75, '50', 5, 19),
(NULL, '007-0209', 'Diodo Rectificador 1000V 1A - 1N4007', 'Este diodo retificador de alta tensão utiliza montagem em THT e oferece tolerância de até 1 kV de tensão reversa.', 0.09, '1', 6, 1),
(NULL, '019-4849', 'Conjunto de 10 cabos de ligação Jumper Dupont fêmea -> Crocodilo - 20cm', NULL, 3.39, '20', 7, 1),
(NULL, '096-2424', 'Filtro de ferrite para cabo redondo Ø6mm', NULL, 1.22, '6', 8, 1),
('5410329402983', 'VEL-WIK01N', 'Velleman WIK01N - Fio bobinagem Ø0.1mm (1.5 Kohm) - 715m', NULL, 8.30, '715', 9, 8),
('3522291184117', 'LMP-E14-25W', 'Lâmpada tubular E14 25W 24V - 16x54mm', NULL, 4.10, NULL, 10, 1),
(NULL, '017-1209', 'LED 5mm transparente branco alto-brilho 33000mcd 15º', 'LED de 5 mm com brilho entre 23.5k e 33k mcd, cor branca fria, lente transparente e frente convexa.', 0.20, NULL, 11, 1),
(NULL, '104-7048', 'Resistência de filme metálico 10kR 0.6W ±1% Ø2.5x6.8mm', 'Resistência de filme metálico para montagem THT', 0.11, NULL, 12, 1),
('8445577000626', 'PASTA-TERM', 'Pasta térmica (2.0W/mK) - Branca - 3g', 'Pasta térmica branca com condutividade térmica de 2.0 W/m-K e densidade de 2,8 g/cm³', 4.21, NULL, 13, 1),
(NULL, '002-1363', 'Tiristor BT169D', NULL, 0.18, NULL, 14, 1),
(NULL, '002-1190', 'Transistor IRLZ44N', 'Transístor MOSFET de potência com canal enriquecido e nível lógico', 1.14, NULL, 15, 1),
(NULL, '002-1361', 'Triac BTB24-800BWRG', 'Triac de potência com montagem THT, carcaça TO220AB, embalagem tubo', 2.31, NULL, 16, 1),
(NULL, '048-0150', 'Sunon DP200A2123XST.GN', 'A ventoinha de 120x120x38 mm é alimentada a 230 VAC, 50 Hz, com potência de 22 W e corrente de 140 mA', 14.99, NULL, 17, 1),
('5903293047330', 'AMIO-OBD2', 'AMiO - Interface de diagnóstico compacto Bluetooth OBD2 / CAN - v2.2', 'interface de diagnóstico', 5.51, '25x25x25', 18, 19),
('5906534017475', 'K2-LAMP-PROT', 'K2 Lamp Protect - Kit revestimento de proteção para faróis (selante de faróis)', 'K2 LAMP PROTECT é uma solução de proteção de longa duração', 7.95, '50x50x25', 19, 20),
(NULL, 'TE-1062-16', 'TE Deutsch 1062-16-0122 - Terminal fêmea para fichas Deutsch Size 16 (0.75...2mm²)', 'Tamanho do terminal: 16', 0.59, '50x50x25', 21, 22),
(NULL, 'TE-183024-1', 'TE Connectivity 183024-1 - Terminal macho para ficha AMP macho para fio 0.75..1.5mm² 14A', 'Tipo de conector: terminal macho para fichas AMP Superseal 1.5 macho', 0.18, '22.75x1.5', 21, 21),
('5021374445872', 'ELT-EB0380TB', 'ELTA EB0380TB - Lâmpada BAY15d P21/5W 12V', 'Tipo de lâmpada: para automóveis', 0.65, '22.75x1.5', 22, 23),
('4895251658829', 'ECO-D3-MAX', 'EcoFlow Delta 3 Max Plus - Power Station 3000W 2048Wh (expansível) c/ bateria LFP de 10 anos e App', 'A EcoFlow DELTA 3 Max Plus redefine o conceito de energia portátil', 0.65, '22.75x1.5', 23, 24),
('5902801283147', 'HOG-HT8G602', 'Högert HT8G602 - Cabos de arranque de bateria p/ automóvel 600A - 3,5m', 'Comprimento: 3,5m', 14.70, '3 metros', 24, 25),
('0840080539898', 'AMZ-ECHO-D5', 'Amazon Echo Dot (5th Gen) - Coluna inteligente com Alexa e Bluetooth - Preto Antracite', 'Coluna inteligente com assistente de voz que permite gerir dispositivos via Wi-Fi e Bluetooth. ', 61.99, '100x100x89', 25, 26),
('6975833352135', 'AQA-DWS03D', 'Aqara DW-S03D - Sensor de Portas e Janelas sem fios ZigBee [T1]', 'Sensor de portas e janelas sem fios com ZigBee 3.0', 19.99, '41x22x11', 26, 27),
('6924826708442', 'BRD-RM4-MINI', 'BroadLink RM4 mini - Estação Controlo Remoto IR universal Mini 360º', 'Controla dispositivos por infravermelho através de smartphone através de Wi-Fi ou rede móvel', 16.99, '48x42', 27, 28),
(NULL, '095-4194', 'Danalock DCE35030NID5 - Cilindro (''canhão'') ajustável para Danalock V3 c/ 5 chaves incluídas - 50-30mm', 'Cilindro de segurança com perfil Euro para fechaduras inteligentes Danalock V3', 94.43, '40x30', 28, 29),
('6920075775709', '096-6145', 'Sonoff RF R2 - Wireless Smart Switch Com Receptor RF para Smart Home', 'O interruptor sem fios RF 433MHz permite ligar e desligar dispositivos a partir de qualquer lugar através da app eWeLink', 9.72, '89x39x24', 29, 30),
('5056561803739', 'RPI-SC1163', 'Raspberry Pi SC1163 - Bateria de Backup para o RTC do Raspberry Pi 5', 'O IC de gestão de energia utilizado numa placa integra um relógio de tempo real e um circuito de carregamento', 5.99, NULL, 30, 31),
('5605922047222', 'PHA-PHB1209', 'Phasak PHB 1209 - Bateria de Chumbo (Pb) 12V 9.0Ah (term. largos)', 'A Phasak PHB 1209 é uma bateria selada de chumbo-ácido (VRLA) de 12V e 9Ah', 17.00, NULL, 31, 32),
('5904326374874', 'GC-LFP12V20', 'Green Cell LFPGC12V20AH - Bateria de Lithium (LiFePO4) BMS 12.8V 256Wh 20A', 'Bateria de lítio LiFePO4 de alta eficiência com BMS integrado 12.8V 256Wh', 85.90, NULL, 32, 33),
('8436300862703', 'BAT-LIPO-250', 'Bateria 3.7v 250mAH Li-Po 20x30x5mm', 'Bateria de lítio recarregável com 3,7 V e 250 mAh, ideal para dispositivos compactos, oferecendo desempenho estável.', 5.85, '20x30x5mm', 33, 1),
('4047038305895', 'BAT-DD-M606', 'Bateria para aspirador compatível com Dirt Devil Libero M606 14.4V 800mAh 11,5Wh NiMH', 'Esta bateria de substituição NiMH de 14,4V oferece 800mAh e 11,5Wh de energia para aspiradores Dirt Devil', 20.27, NULL, 34, 32);

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* loja */

INSERT INTO loja (nome, rua, localidade, codigo_postal, distrito) VALUES
('Loja de Leiria', 'Rua D. João III, nº 42', 'Leiria', '2400-150', 'Leiria'),
('Loja de Lisboa', 'Avenida da Liberdade, nº 120', 'Lisboa', '1250-146', 'Lisboa'),
('Loja do Porto', 'Rua de Santa Catarina, nº 300', 'Porto', '4000-443', 'Porto'),
('Loja de Coimbra', 'Avenida Fernão de Magalhães, nº 85', 'Coimbra', '3000-176', 'Coimbra');

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* armazem */

INSERT INTO armazem(nome, rua, localidade, codigo_postal, distrito) VALUES
('Armazém Central Norte', 'Zona Industrial de Braga, Lote 42', 'Braga', '4705-808', 'Braga'),
('Armazém Logístico Centro', 'Avenida Principal, nº 100', 'Leiria', '2400-123', 'Leiria'),
('Armazém Sul e Ilhas', 'Park Logístico de Lisboa, Armazém 3', 'Lisboa', '1990-205', 'Lisboa'),
('Armazém Regional Algarve', 'Estrada Nacional 125, Km 95', 'Faro', '8005-515', 'Faro');

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* stock */

INSERT INTO stock (idProd, idArmazem, quantidade) VALUES
(1, 1, 150),
(1, 2, 80),
(2, 1, 200),
(2, 3, 45),
(3, 1, 500),
(3, 2, 300),
(3, 4, 120),
(4, 1, 75),
(5, 2, 30),
(5, 3, 50),
(6, 1, 120),
(6, 4, 60),
(7, 2, 90),
(8, 1, 150),
(9, 3, 25),
(10, 1, 200),
(10, 2, 110),
(11, 1, 350),
(11, 3, 180),
(12, 1, 1000),
(12, 2, 450),
(12, 4, 300),
(13, 2, 85),
(14, 1, 60),
(15, 3, 40),
(16, 1, 55),
(17, 2, 15),
(18, 1, 40),
(18, 3, 35),
(19, 2, 50),
(20, 1, 110),
(21, 1, 220),
(22, 2, 70),
(23, 3, 10),
(24, 1, 25),
(25, 3, 30),
(26, 4, 45),
(27, 2, 60),
(28, 1, 12),
(29, 3, 85),
(30, 1, 90),
(31, 2, 40),
(32, 3, 20),
(33, 1, 150),
(34, 2, 25);

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* pessoa */

INSERT INTO pessoa (nome, datanascimento, rua, localidade, codigo_postal, distrito, ncontribuinte) VALUES
('Ana Julia', '1987-07-24', 'Rua Ferreira Borges, nº 10', 'Coimbra', '3000-179', 'Coimbra', '123458751'),
('Maria Amelia', '1988-01-07', 'Avenida da Liberdade, nº 45', 'Lisboa', '1250-096', 'Lisboa', '134575882'),
('Paula Esteves', '1975-06-17', 'Rua Dr. José de Abreu, nº 12', 'Mafra', '2640-482', 'Lisboa', '144707643'),
('Teresa Chaves', '1975-05-10', 'Rua 25 de Abril, nº 88', 'Sintra', '2710-520', 'Lisboa', '177781004'),
('Rosa Neves', '1995-08-16', 'Rua Monte Abraão, nº 5', 'Monte Abraão', '2745-302', 'Lisboa', '122768905'),
('Carlos Gomes', '1981-11-15', 'Rua de Angola, nº 14', 'Agualva', '2735-100', 'Lisboa', '149579006'),
('Ruben Sousa', '1987-06-30', 'Rua dos Peregrinos, nº 3', 'Leiria', '2400-001', 'Leiria', '139773207'),
('Marcos Daniel', '1977-12-24', 'Rua Rainha Ginga, nº 22', 'Porto', '4000-002', 'Porto', '178654308'),
('Antonio Vaz', '1950-01-01', 'Avenida Lourenço Peixinho, nº 101', 'Aveiro', '3800-159', 'Aveiro', '123458229'),
('Marcelo Texeira', '1960-03-04', 'Rua do Raio, nº 50', 'Braga', '4700-020', 'Braga', '134275810'),
('Marlene Chaves', '1964-06-14', 'Rua Direita, nº 15', 'Viseu', '3500-110', 'Viseu', '144707111'),
('Marcela Nuno', '1944-07-11', 'Rua 19 de Abril, nº 7', 'Setúbal', '2900-123', 'Setúbal', '127781012'),
('Lucia Neves', '1975-04-28', 'Rua de Olivais, nº 31', 'Lisboa', '1800-001', 'Lisboa', '122768013'),
('Novoes Mendes', '1945-05-09', 'Rua da Alemanha, nº 4', 'Almada', '2800-010', 'Setúbal', '149572214'),
('Ruben Tavares', '1981-05-29', 'Avenida do Brasil, nº 200', 'Lisboa', '1700-065', 'Lisboa', '139753215'),
('Neves Daniel', '1984-09-24', 'Rua do Peregrino, nº 18', 'Faro', '8000-100', 'Faro', '178653316'),
('Ana Luisa', '1932-02-11', 'Rua de Barcelona, nº 9', 'Cascais', '2750-010', 'Lisboa', '176590617'),
('Pereira Marcio', '1958-09-04', 'Rua de Moçambique, nº 77', 'Amadora', '2700-001', 'Lisboa', '164401718'),
('Aguiar Mendes', '1976-08-07', 'Rua da Bélgica, nº 33', 'Vila Nova de Gaia', '4400-001', 'Porto', '194521919'),
('Merico Trindade', '1970-07-11', 'Rua de Benguela, nº 11', 'Barreiro', '2830-001', 'Setúbal', '100187620');

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* colaborador

INSERT INTO colaborador (idpessoa, cargo) VALUES
(5, 'Gerente de loja'),
(8, 'Administrador de IT');

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* colaborador */

INSERT INTO cliente (idpessoa) VALUES
(5),
(15);

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* fatura */

INSERT INTO fatura (idcliente, idcolaborador, idLoja) VALUES
(15, 5, 1);

/* ------------------------------------------------------------------------------------------------------------------------------- */

/* linha_fatura */

INSERT INTO linha_fatura (idfat, idProd, quantidade, preco_unitario) VALUES
(1, 1, 10, 0.16),
(1, 18, 1, 5.51);

UPDATE fatura
SET valor_total = (SELECT SUM(quantidade * preco_unitario) FROM linha_fatura WHERE idfat = 1)
WHERE idfat = 1;
