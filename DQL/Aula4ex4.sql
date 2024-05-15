/* Fazer uma seleção de clientes trazendo os clientes que NÃO estão com o complemento nulo */

SELECT * 
FROM CLIENTE 
WHERE COMPLEMENTO IS NOT NULL;
