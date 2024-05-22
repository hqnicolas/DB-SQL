/*
Exibir uma lista com o nome do cliente e o total de 
dependentes.
*/

SELECT 
    c.NOME,
    COUNT(d.IDCLIENTEDEPENDENTE) AS Total_Dependentes
FROM 
    CLIENTE c
LEFT JOIN 
    CLIENTE_DEPENDENTE d ON c.IDCLIENTE  = d.IDCLIENTE
GROUP BY 
    c.NOME;
