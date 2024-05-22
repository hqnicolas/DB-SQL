/*
Exibir uma lista de dependentes com o nome do dependente, 
nome do cliente, cidade do cliente.
*/

SELECT 
    d.NOME AS Dependente,
    c.NOME AS Cliente,
    cid.NOME AS Cidade
FROM 
    CLIENTE_DEPENDENTE d
JOIN 
    CLIENTE c ON d.IDCLIENTE = c.IDCLIENTE
JOIN 
    CIDADE cid ON c.IDCIDADE = cid.IDCIDADE;
