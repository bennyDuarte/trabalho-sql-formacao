DROP DATABASE IF EXISTS LojaComponentes;
CREATE DATABASE LojaComponentes;
USE LojaComponentes;

CREATE TABLE categoria(
idcat INT PRIMARY KEY AUTO_INCREMENT,
nomecat VARCHAR (200)
);
/* INSERÇÃO DE CATEGORIAS */
INSERT INTO categoria(nomecat) VALUES
('ELETRONICA'),
('AUTOMOVEL'),
('DOMOTICA'),
('BATERIAS');
/* MARCAS */
CREATE TABLE marcas(
idmarca INT PRIMARY KEY AUTO_INCREMENT,
nomemarca VARCHAR (200),
morada VARCHAR(200),
numerofiscal VARCHAR(15) UNIQUE
);

INSERT INTO marcas (nomemarca,morada,numerofiscal)VALUES
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
('STMicroelectronics CORP.','STMicroelectronics Corporation 201 Flynn Road Camarillo, California 93012 USA', '852018462'),
('STMicroelectronics Gmbh','STMicroelectronics Corporation 201 Flynn Road Camarillo, California 93012 USA', '853015960'),
('Arrow Electronics','Arrow Electronics Corporation 201 Flynn Road Camarillo, California 93012 USA', '455017960'),
('AMiO', 'POLONIA', '560000001'),
('K2', 'ESTADOS UNIDOS', '560000002'),
('TE Connectivity', 'IRLANDA', '560000003'),
('TE DEUTSCH', 'ALEMANHA', '0000004'),
('ELTA', 'REINO UNIDO', '560000005'),
('EcoFlow', 'ESTADOS UNIDOS', '560000006'),
('Högert', 'ALEMANHA', '560000007'),
('Amazon', '410 Terry Ave N, Seattle, WA 98109 USA', '560000008'),
('Aqara', 'Shenzhen China', '560000009'),
('BroadLink', '57 Jianger Road, Binjiang District, Hangzhou, China', '557000210'),
('Danalock', 'Grønhøjvej 64 A, 8462 Harlev, Denmark', '570000011'),
('Sonoff', 'Shenzhen, Guangdong Province, China', '570000013'),
('Raspberry PI', 'Cambridge, 37 Hills Rd, United Kingdom', '00000014'),
('Phasak', 'C/ El Pensamiento 27, Escalera Izquierda, 28020 Madrid, Spain', '00000015'),
('Green Cell', 'Kalwaryjska 33, PL-30-509 Krakow, Poland', '00000016');

/* -------------------------------CONSULTAS-QUERIES------------------------ */
 /* IMPORTANTE !!!
 Consultas (em SQL com pergunta e  - !!! RESULTADOS/outputs !!!) - Descrição de dez
consultas (mínimo) pertinentes com resposta em SQL para o cenário em análise com
os seguintes requisitos:
1 Pergunta só com critérios (uma tabela----FEITO
1 Pergunta só com critérios (N tabelas-----FEITO
1 Pergunta com Group By (Distinct) ------------------------------------------
1 Pergunta com Group By (com critérios)
1 Pergunta com NOT IN
1 Pergunta com Subquery
1 Pergunta com cálculo de máximo/mínimo
1 Pergunta com UNION
1 Pergunta com IF
1 Pergunta com subquery + cálculo
IMPORTANTE !!!
/* -------------------------------CONSULTAS--num3-------------------------------------------------------*/
 /*
 ==3ª========================================================================
 1 Pergunta com Group By (Distinct) -----  CONSULTAS COM DISTINCT
 ============================================================================
 */

-- 1. Listar categorias sem valores repetidos
SELECT DISTINCT nomecat
FROM categoria
ORDER BY nomecat;


-- 2. Listar marcas sem valores repetidos
SELECT DISTINCT nomemarca
FROM marcas
ORDER BY nomemarca;


-- 3. Listar moradas sem repetição
SELECT DISTINCT morada
FROM marcas
ORDER BY morada;


-- 4. Listar números fiscais diferentes
SELECT DISTINCT numerofiscal
FROM marcas
ORDER BY numerofiscal;


 /*
 =========================================================
 CONSULTAS COM GROUP BY
 =========================================================
 */

-- 5. Contar quantas categorias existem
SELECT COUNT(*) AS total_categorias
FROM categoria;


-- 6. Contar quantas marcas existem
SELECT COUNT(*) AS total_marcas
FROM marcas;


-- 7. Agrupar categorias pelo nome
SELECT
    nomecat,
    COUNT(*) AS quantidade
FROM categoria
GROUP BY nomecat
ORDER BY nomecat;


-- 8. Agrupar marcas pelo nome
SELECT
    nomemarca,
    COUNT(*) AS quantidade
FROM marcas
GROUP BY nomemarca
ORDER BY nomemarca;


-- 9. Mostrar apenas marcas repetidas
SELECT
    nomemarca,
    COUNT(*) AS quantidade
FROM marcas
GROUP BY nomemarca
HAVING COUNT(*) > 1
ORDER BY nomemarca;


-- 10. Agrupar marcas pela primeira letra do nome
SELECT
    LEFT(nomemarca, 1) AS primeira_letra,
    COUNT(*) AS quantidade_marcas
FROM marcas
GROUP BY LEFT(nomemarca, 1)
ORDER BY primeira_letra;


-- 11. Agrupar marcas pela morada
SELECT
    morada,
    COUNT(*) AS quantidade_marcas
FROM marcas
GROUP BY morada
ORDER BY quantidade_marcas DESC;


-- 12. Mostrar moradas utilizadas por mais do que uma marca
SELECT
    morada,
    COUNT(*) AS quantidade_marcas
FROM marcas
GROUP BY morada
HAVING COUNT(*) > 1
ORDER BY quantidade_marcas DESC;


 /*
 =========================================================
 CONSULTAS COM COUNT(DISTINCT)
 =========================================================
 */

-- 13. Contar categorias diferentes
SELECT COUNT(DISTINCT nomecat) AS total_categorias_diferentes
FROM categoria;


-- 14. Contar marcas diferentes
SELECT COUNT(DISTINCT nomemarca) AS total_marcas_diferentes
FROM marcas;


-- 15. Contar moradas diferentes
SELECT COUNT(DISTINCT morada) AS total_moradas_diferentes
FROM marcas;


-- 16. Contar números fiscais diferentes
SELECT COUNT(DISTINCT numerofiscal) AS total_numeros_fiscais_diferentes
FROM marcas;


 /*
 =========================================================
 CONSULTAS COM GROUP BY E DISTINCT
 =========================================================
 */

-- 17. Agrupar por número fiscal e contar marcas diferentes
SELECT
    numerofiscal,
    COUNT(DISTINCT nomemarca) AS quantidade_marcas
FROM marcas
GROUP BY numerofiscal
ORDER BY numerofiscal;


-- 18. Agrupar por morada e contar números fiscais diferentes
SELECT
    morada,
    COUNT(DISTINCT numerofiscal) AS quantidade_numeros_fiscais
FROM marcas
GROUP BY morada
ORDER BY quantidade_numeros_fiscais DESC;


-- 19. Agrupar por primeira letra e contar marcas diferentes
SELECT
    LEFT(nomemarca, 1) AS primeira_letra,
    COUNT(DISTINCT nomemarca) AS marcas_diferentes
FROM marcas
GROUP BY LEFT(nomemarca, 1)
ORDER BY primeira_letra;

-- Para verificar se existem duplicados nos nomes das marcas, a consulta principal é:

SELECT
    nomemarca,
    COUNT(*) AS quantidade
FROM marcas
GROUP BY nomemarca
HAVING COUNT(*) > 1;

-- Para verificar duplicados nas moradas:
SELECT 
    morada, COUNT(*) AS quantidade
FROM
    marcas
GROUP BY morada
HAVING COUNT(*) > 1;

-- Aqui está um exemplo de um único script com GROUP BY e critérios, utilizando WHERE para filtrar os registos e HAVING para filtrar os grupos:

 /*
    Listar a quantidade de marcas agrupadas
    pela primeira letra do nome.

    Critérios:
    - Considerar apenas marcas cujo número fiscal começa por '56';
    - Mostrar apenas letras com pelo menos 2 marcas;
    - Ordenar da maior para a menor quantidade.
 */

SELECT
    LEFT(nomemarca, 1) AS primeira_letra,
    COUNT(DISTINCT nomemarca) AS quantidade_marcas
FROM marcas
WHERE numerofiscal LIKE '56%'
GROUP BY LEFT(nomemarca, 1)
HAVING COUNT(DISTINCT nomemarca) >= 2
ORDER BY quantidade_marcas DESC, primeira_letra ASC;

-- WHERE numerofiscal LIKE '56%' - é o critério aplicado antes do agrupamento. Seleciona apenas os números fiscais iniciados por 56.
-- GROUP BY LEFT(nomemarca, 1) - agrupa as marcas pela primeira letra do respetivo nome.
-- HAVING COUNT(DISTINCT nomemarca) >= 2 - mostra apenas os grupos que têm pelo menos duas marcas diferentes.
-- ORDER BY quantidade_marcas DESC - ordena os resultados começando pelo grupo com mais marcas

/* -------------------------1 script com NOT IN ----------------------------------------------------------------------------------- */
/* 
Aqui está um exemplo de script utilizando o operador NOT IN.
O NOT IN é utilizado para filtrar registos que não coincidem com nenhum dos valores de uma lista específica.
   Listar todas as categorias, 
   EXCETO as categorias de 'ELETRONICA' e 'BATERIAS'.
   Explicação do que acontece:

    O SQL olha para a tabela categoria.
    Ele verifica cada linha: "O nome desta categoria está na lista ('ELETRONICA', 'BATERIAS')?".
    Se a resposta for Não, o registo é incluído no resultado.
    Resultado esperado: O script irá devolver apenas 'AUTOMOVEL' e 'DOMOTICA'.
   
*/

SELECT nomecat 
FROM categoria 
WHERE nomecat NOT IN ('ELETRONICA', 'BATERIAS');


 /*
    Listar a quantidade de marcas agrupadas
    pela primeira letra do nome.

    Critério:
    - Excluir as marcas Amazon, Aqara, BroadLink,
      Danalock e Sonoff;
    - Mostrar apenas grupos com pelo menos duas marcas.
    -- WHERE nomemarca NOT IN (...)
 */

SELECT
    LEFT(nomemarca, 1) AS primeira_letra,
    COUNT(DISTINCT nomemarca) AS quantidade_marcas
FROM marcas
WHERE nomemarca NOT IN (
    'Amazon',
    'Aqara',
    'BroadLink',
    'Danalock',
    'Sonoff'
)
GROUP BY LEFT(nomemarca, 1)
HAVING COUNT(DISTINCT nomemarca) >= 2
ORDER BY quantidade_marcas DESC, primeira_letra ASC;
/* --------------------------------------------------1 Pergunta com Subquery--------------------------------------------------- */
/* 
Subquery (Consulta Interna): SELECT idmarca FROM produto_eletro O SQL primeiro executa esta parte,
 criando uma lista de todos os IDs de marcas que já têm pelo menos um produto eletrónico.
Consulta Externa: SELECT nomemarca FROM marcas WHERE idmarca NOT IN (...) O SQL depois olha para a tabela de marcas e filtra 
apenas aquelas cujo ID não aparece na lista gerada pela subquery.
   Listar as marcas que NÃO possuem 
   nenhum produto registado na tabela 'produto_eletro'.
*/

SELECT nomemarca 
FROM marcas 
WHERE idmarca NOT IN (SELECT idmarca FROM produto_eletro);

/* Outro exemplo rápido (comparação de valores):
Se quiser listar produtos que custam mais do que a média de todos os produtos:
*/

SELECT nome, preco 
FROM produto_eletro 
WHERE preco > (SELECT AVG(preco) FROM produto_eletro);

/* ---------------------------1 Pergunta com cálculo de máximo/mínimo------------------------------------------------------- */
/* 
Para este exemplo, utiliza a tabela produto_eletro, que contém a coluna preco, 
ideal para cálculos de valores máximos e mínimos.
Apresentar um script que faz duas coisas: calcula os valores globais
 (mais caro e mais barato de toda a loja) e os valores por marca.
 */
 /* 
   Cálculo de Preços Máximos e Mínimos 
   Explicação Técnica:

    MAX(preco): Analisa todos os valores da coluna preco e devolve apenas o maior valor encontrado.
    MIN(preco): Analisa todos os valores da coluna preco e devolve apenas o menor valor encontrado.
    AVG(preco): (Bónus) Calcula a média aritmética de todos os preços.
    GROUP BY m.nomemarca: No segundo exemplo, o cálculo de máximo e mínimo deixa de ser para a loja toda
    e passa a ser feito dentro de cada grupo de marca. Ou seja, o SQL separa os produtos por marca e, para cada marca,
    identifica qual é o seu produto mais caro e o mais barato.

*/

-- 1. Encontrar o preço mais caro e o mais barato de TODOS os produtos eletrónicos
SELECT 
    MAX(preco) AS preco_maximo, 
    MIN(preco) AS preco_minimo,
    AVG(preco) AS preco_medio
FROM produto_eletro;

-- 2. Encontrar o produto mais caro e o mais barato de cada marca
-- Aqui juntamos a tabela de marcas para ver o nome da marca em vez de apenas o ID

SELECT 
    m.nomemarca, 
    MAX(p.preco) AS produto_mais_caro, 
    MIN(p.preco) AS produto_mais_barato
FROM marcas m
JOIN produto_eletro p ON m.idmarca = p.idmarca
GROUP BY m.nomemarca;
 
 -- OPCAO 2
 -- qual é o nome do produto que tem o preço máximo (em vez de saber apenas o valor), teria de usar uma subquery, assim:
 SELECT nome, preco 
FROM produto_eletro 
WHERE preco = (SELECT MAX(preco) FROM produto_eletro);
 
/* ---------------------------1 Pergunta com UNION----------------------------------------------------------------------------- */

/* 
O operador UNION é utilizado para combinar o resultado de duas ou mais consultas SELECT num único conjunto de resultados.
 Para que funcione, as consultas devem ter o mesmo número de colunas e tipos de dados semelhantes.

No seu projeto, como os produtos estão divididos em tabelas diferentes (produto_eletro, produto_auto, produto_domo, produto_bat),
 o UNION é a ferramenta perfeita para criar uma lista global de todos os produtos da loja.

   Gerar uma lista única com TODOS os produtos de todas as categorias,
   identificando a origem de cada produto.
*/

SELECT 
    nome AS nome_produto, preco, 'Eletrónica' AS categoria
FROM
    produto_eletro 
UNION SELECT 
    nome, preco, 'Automóvel'
FROM
    produto_auto 
UNION SELECT 
    nome, preco, 'Domótica'
FROM
    produto_domo 
UNION SELECT 
    nome, preco, 'Baterias'
FROM
    produto_bat
ORDER BY preco DESC;

/*
Explicação do que foi feito:

    Coluna Virtual ('Eletrónica' AS categoria): Como os produtos estão em tabelas separadas, 
    adicionei um texto fixo em cada SELECT para que, no resultado final, saibamos a qual categoria aquele produto pertence.
    Colunas Correspondentes: Todas as quatro consultas selecionam exatamente duas colunas reais (nome, preco)
    e uma coluna de texto, mantendo a mesma ordem.
    UNION: Este operador junta os resultados. Se houvesse um produto com o nome e preço exatamente iguais
    em duas tabelas diferentes, o UNION removeria a duplicata. (Se quisesse manter tudo, mesmo duplicados, usaria UNION ALL).
    ORDER BY: O comando de ordenação é colocado apenas no final do script e aplica-se ao resultado global da união.
    Neste caso, os produtos aparecem do mais caro para o mais barato.

Resultado esperado:
Uma tabela única com três colunas: nome_produto, preco e categoria, contendo todos os itens de todas as tabelas de produtos.
*/
/* ---------------------------1 Pergunta com IF------------------------------------------------------------------------------------- */
/*No MySQL, o IF pode ser usado de duas formas: como uma função dentro de um SELECT (para criar colunas condicionais)
 ou como um comando dentro de blocos de programação (Stored Procedures).
Para o seu trabalho, o mais comum e útil é a função IF(), que permite classificar dados no momento da consulta.
Vou criar um script que classifica os produtos da tabela produto_eletro como "Caro" ou "Acessível" com base no preço.
*/
/* 
   Classificar os produtos de eletrónica com base no preço.
   Critério: 
   - Se o preço for superior a 5.00, é "Caro".
   - Se for igual ou inferior a 5.00, é "Acessível".
*/

SELECT 
    nome, 
    preco, 
    IF(preco > 5.00, 'Caro', 'Acessível') AS classificacao_preco
FROM produto_eletro;

/*
Explicação Técnica:
A sintaxe da função é: IF(condição, valor_se_verdadeiro, valor_se_falso)
    preco > 5.00: Esta é a condição que o MySQL testa para cada linha.
    'Caro': É o valor que será escrito na coluna se a condição for verdadeira.
    'Acessível': É o valor que será escrito se a condição for falsa.
    AS classificacao_preco: Dá um nome à nova coluna criada pelo IF.

Dica Extra: E se eu tiver mais de 2 opções? (CASE) ------------------ INTERESSANTE !!!!!

O IF só serve para "Sim ou Não" (dois caminhos). Se quiser criar várias categorias (ex: Barato, Médio, Caro),
 deve usar o comando CASE, que é o "IF" avançado do SQL:
*/
SELECT 
    nome, 
    preco, 
    CASE 
        WHEN preco < 1.00 THEN 'Muito Barato'
        WHEN preco BETWEEN 1.00 AND 10.00 THEN 'Preço Médio'
        ELSE 'Produto Premium'
    END AS categoria_preco
FROM produto_eletro;

/* ---------------------------1 Pergunta com subquery + cálculo------------------------------------------------------------------------- */
/*
Para este exemplo, vamos criar um script que não só usa uma subquery, 
mas também realiza cálculos matemáticos comparando cada produto com a média geral da loja.
O objetivo será: Listar os produtos de eletrónica que custam mais do que a média, 
calculando a diferença exata de preço entre o produto e essa média.

   Consulta: Produtos acima da média de preço.
   Subquery: Calcula a média de todos os produtos.
   Cálculo: Subtrai a média do preço do produto para encontrar a diferença.
*/

SELECT 
    nome, 
    preco, 
    -- Subquery para mostrar a média global ao lado de cada produto
    (SELECT AVG(preco) FROM produto_eletro) AS media_global,
    
    -- Cálculo: Preço do produto MENOS a média global
    (preco - (SELECT AVG(preco) FROM produto_eletro)) AS valor_acima_da_media
FROM produto_eletro
WHERE preco > (SELECT AVG(preco) FROM produto_eletro)
ORDER BY valor_acima_da_media DESC;

/*
Explicação Detalhada:

    A Subquery (SELECT AVG(preco) FROM produto_eletro):
        Esta subquery é executada primeiro. Ela calcula a média (AVG) de todos os preços da tabela.
        Ela aparece em três lugares: no SELECT (para mostrar o valor), no cálculo da diferença e no WHERE (para filtrar).
    O Cálculo Matemático:
        (preco - (SELECT AVG(preco) ...)) →→ Aqui estamos a fazer uma operação de subtração. O SQL pega no preço da linha atual e subtrai o resultado da subquery (a média).
        Isso permite saber exatamente quantos euros aquele produto está acima da média da loja.
    O Filtro WHERE:
        Garante que a consulta ignore os produtos baratos e mostre apenas aqueles cujo preço é superior ao valor retornado pela subquery da média.
*/
/* output:
Para este exemplo, vamos criar um script que não só usa uma **subquery**, mas também realiza **cálculos matemáticos**
 comparando cada produto com a média geral da loja.
O objetivo será: **Listar os produtos de eletrónica que custam mais do que a média, calculando a diferença 
exata de preço entre o produto e essa média.**

/* 
   Consulta: Produtos acima da média de preço.
   Subquery: Calcula a média de todos os produtos.
   Cálculo: Subtrai a média do preço do produto para encontrar a diferença.

### Explicação Detalhada:

1.  **A Subquery `(SELECT AVG(preco) FROM produto_eletro)`**:
    *   Esta subquery é executada primeiro. Ela calcula a média (`AVG`) de todos os preços da tabela.
    *   Ela aparece em três lugares: no `SELECT` (para mostrar o valor), no cálculo da diferença e no `WHERE` (para filtrar).

2.  **O Cálculo Matemático**:
    *   `(preco - (SELECT AVG(preco) ...))` $\rightarrow$ Aqui estamos a fazer uma operação de subtração. O SQL pega no preço da linha atual e subtrai o resultado da subquery (a média). 
    *   Isso permite saber exatamente quantos euros aquele produto está acima da média da loja.

3.  **O Filtro `WHERE`**:
    *   Garante que a consulta ignore os produtos baratos e mostre apenas aqueles cujo preço é superior ao valor retornado pela subquery da média.

### Exemplo de como o resultado seria apresentado:

| nome | preco | media_global | valor_acima_da_media |
| :--- | :--- | :--- | :--- |
| Sunon DP200A... | 14.99 | 2.15 | **12.84** |
| Bobine de fio... | 8.75 | 2.15 | **6.60** |
| Fio bobinagem... | 8.30 | 2.15 | **6.15** |

*(Valores hipotéticos apenas para ilustração)*

*/


