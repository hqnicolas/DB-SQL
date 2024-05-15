/* Fazer uma seleção que traga a soma total da renda dos clientes da cidade 1 */


SELECT SUM(renda) AS soma_renda FROM CLIENTE 
WHERE IDCIDADE = 1;
