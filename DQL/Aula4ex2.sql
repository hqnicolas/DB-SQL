/* Fazer uma seleção de cliente trazendo o código, nome e data de nascimento. Coloque o alias 
da tabela como cli e da data de nascimento como "Data de nascimento“. Ordene por cidade e 
nome do cliente. */

SELECT c.IDCLIENTE AS "Código", c.NOME AS "Nome", c.DTNASCIMENTO AS "Data de Nascimento"
FROM CLIENTE c
ORDER BY c.IDCIDADE, c.NOME;