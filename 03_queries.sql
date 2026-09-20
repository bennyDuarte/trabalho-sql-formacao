/* ------------------------------------------------------------------------------------------------------------------------------- */
/*																																   */
/*											    	TRABALHO DE SQL - UC02830													   */
/*								 DESENVOLVIDO POR RUBEN DUARTE, CARLOS GOMES E ROSA BORGES										   */
/*																																   */
/* ------------------------------------------------------------------------------------------------------------------------------- */

USE LojaComponentes;

/* ------------------------------------------------------------------------------------------------------------------------------- */
/* IMPORTANTE !!!
 Consultas (em SQL com pergunta e  - !!! RESULTADOS/outputs !!!) - Descrição de dez
consultas (mínimo) pertinentes com resposta em SQL para o cenário em análise com
os seguintes requisitos:
1 Pergunta só com critérios (uma tabela)
1 Pergunta só com critérios (N tabelas)
1 Pergunta com Group By (Distinct) ------------------------------------------
1 Pergunta com Group By (com critérios)
1 Pergunta com NOT IN
1 Pergunta com Subquery
1 Pergunta com cálculo de máximo/mínimo
1 Pergunta com UNION
1 Pergunta com IF
1 Pergunta com subquery + cálculo
IMPORTANTE !!!
/* -------------------------------CONSULTAS---------------------------------------------------------*/


/* Query (1) - 1 Pergunta só com critérios (uma tabela)  -------------------------------------------*/
SELECT m.nome
FROM marcaProduto m
WHERE m.nome = 'AMiO';

/* Query (2) - 1 Pergunta só com critérios (N tabelas) ---------------------------------------------*/
SELECT p.idpessoa, p.nome, co.cargo, cl.data_registo AS data_registo_cliente
FROM pessoa p
INNER JOIN colaborador co ON co.idpessoa = p.idpessoa
INNER JOIN cliente cl ON cl.idpessoa = p.idpessoa
WHERE co.cargo IS NOT NULL;

/* Query (3) - 1 Pergunta com Group By (Distinct)  ----------------------------------------------   */

SELECT
    numfiscal,
    COUNT(DISTINCT nome) AS quantidade_marcas
FROM marcaProduto
GROUP BY numfiscal
ORDER BY numfiscal;

/* Query (4) 1 Pergunta com Group By (com critérios)  ------------------------------------------    */

SELECT
    LEFT(nome, 1) AS primeira_letra,
    COUNT(*) AS quantidade_marcas
FROM marcaProduto m
GROUP BY LEFT(nome, 1)
HAVING COUNT(*) >= 1
ORDER BY primeira_letra;

 /* (5) Query - 1 Pergunta com NOT IN  ----------------------------------------------------------    */

SELECT
    LEFT(nome, 1) AS primeira_letra,
    COUNT(DISTINCT nome) AS quantidade_marcas
FROM marcaProduto
WHERE nome NOT IN (
    'Amazon',
    'Aqara',
    'BroadLink',
    'Danalock',
    'Sonoff'
)
GROUP BY LEFT(nome, 1)
HAVING COUNT(DISTINCT nome) >= 2
ORDER BY quantidade_marcas DESC, primeira_letra ASC;

/* =========== OPÇÃO 2: ========== */

SELECT *
FROM categoriaProduto
WHERE nome NOT IN ('Eletrónica', 'Automóvel');

 /* Query (6)  1 Pergunta com Subquery   --------------------------------------------------------  */

SELECT nome, preco 
FROM produto 
WHERE preco > (SELECT AVG(preco) FROM produto);


/* Query (7) 1. Encontrar o preço mais caro e o mais barato,
 de TODOS os produto eletrónicos -----------------------------------------------------------------*/
SELECT 
    m.nome, 
    MAX(p.preco) AS produto_mais_caro, 
    MIN(p.preco) AS produto_mais_barato
FROM marcaProduto m
JOIN produto p ON m.idmarca = p.idmarca
JOIN tipoProduto t ON p.idtipo = t.idtipo
JOIN categoriaProduto c ON t.idcat = c.idcat
WHERE c.nome = 'Eletrónica'
GROUP BY m.nome;

 /* (8) Query - 1 Pergunta com UNION ------------------------------------------------------------- */

SELECT p.nome AS nome_produto, p.preco, 'Eletrónica' AS categoria
FROM produto p
INNER JOIN tipoProduto t ON p.idtipo = t.idtipo
INNER JOIN categoriaProduto c ON t.idcat = c.idcat
WHERE c.nome = 'Eletrónica'

UNION ALL

SELECT p.nome AS nome_produto, p.preco, 'Automóvel' AS categoria
FROM produto p
INNER JOIN tipoProduto t ON p.idtipo = t.idtipo
INNER JOIN categoriaProduto c ON t.idcat = c.idcat
WHERE c.nome = 'Automóvel'

UNION ALL

SELECT p.nome AS nome_produto, p.preco, 'Domótica' AS categoria
FROM produto p
INNER JOIN tipoProduto t ON p.idtipo = t.idtipo
INNER JOIN categoriaProduto c ON t.idcat = c.idcat
WHERE c.nome = 'Domótica'

UNION ALL

SELECT p.nome AS nome_produto, p.preco, 'Baterias' AS categoria
FROM produto p
INNER JOIN tipoProduto t ON p.idtipo = t.idtipo
INNER JOIN categoriaProduto c ON t.idcat = c.idcat
WHERE c.nome = 'Baterias'
ORDER BY preco DESC;

 /* (9) Query - 1 Pergunta com IF   -------------------------------------------------------------  */

SELECT 
    nome, 
    preco, 
    IF(preco > 5.00, 'Caro', 'Acessível') AS classificacao_preco
FROM produto;

/* ========== Com uso do CASE ========== */

SELECT 
    nome, 
    preco, 
    CASE 
        WHEN preco < 1.00 THEN 'Muito Barato'
        WHEN preco BETWEEN 1.00 AND 10.00 THEN 'Preço Médio'
        ELSE 'Produto Premium'
    END AS categoria_preco
FROM produto;

 /* (10) Query - 1 Pergunta com subquery + cálculo   ----------------------------------------------  */

SELECT 
    nome, preco, 
    -- Subquery para mostrar a média global ao lado de cada produto
    (SELECT AVG(preco) FROM produto) AS media_global,
    -- Cálculo: Preço do produto MENOS a média global
    (preco - (SELECT AVG(preco) FROM produto)) AS valor_acima_da_media
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto)
ORDER BY valor_acima_da_media DESC;

/* ------------------------------- FIM CONSULTAS-QUERIES------------------------ */