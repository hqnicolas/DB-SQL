/* Fazer uma seleção de clientes exibindo o complemento SEM COMPLEMENTO quando o 
complemento for nulo */

SELECT NOME, RUA, NUMERO, BAIRRO
FROM CLIENTE
WHERE COMPLEMENTO IS NULL;
