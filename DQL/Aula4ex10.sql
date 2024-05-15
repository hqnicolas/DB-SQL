/* Fazer uma seleção que traga o total de clientes por cidade */

SELECT CIDADE.NOME AS Cidade, COUNT(CLIENTE.IDCLIENTE) AS Total_Clientes
FROM CLIENTE
JOIN CIDADE ON CLIENTE.IDCIDADE = CIDADE.IDCIDADE
GROUP BY CIDADE.NOME;
