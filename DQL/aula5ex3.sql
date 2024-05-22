/*
Exibir uma lista de clientes com nome do cliente, data 
nascimento, rua, número, bairro, complemento e nome da 
cidade. Para isso, use:
• Subquery
• From
• Join
*/

SELECT 
    c.NOME,
    c.DTNASCIMENTO,
    c.RUA,
    c.NUMERO,
    c.BAIRRO,
    c.COMPLEMENTO,
    cid.NOME AS CIDADE
FROM 
    CLIENTE c
JOIN 
    CIDADE cid ON c.IDCIDADE = cid.IDCIDADE;