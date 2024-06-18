-- Consulta 1: Listar todos os produtos
SELECT * FROM produtos;

-- Consulta 2: Consultar o estoque atual de todos os produtos
SELECT p.idproduto, p.descritivo, e.quantidade, e.atualizado
FROM produtos p
JOIN estoque e ON p.idproduto = e.idproduto;

-- Consulta 3: Consultar transações de um produto específico
SELECT t.idtransaction, p.descritivo, t.quantidade, t.TransactionType, t.date
FROM transactions t
JOIN produtos p ON t.idproduto = p.idproduto
WHERE p.idproduto = 1;

-- Consulta 4: Consultar análise de demanda de produtos
SELECT p.descritivo, a.demanda, a.datacheck
FROM analise a
JOIN produtos p ON a.idproduto = p.idproduto
ORDER BY a.datacheck DESC;

-- Consulta 5: Listar produtos abaixo do alerta mínimo
SELECT p.descritivo, e.quantidade, a.alertaminimo, a.alertadata
FROM produtos p
JOIN estoque e ON p.idproduto = e.idproduto
JOIN alertas a ON p.idproduto = a.idproduto
WHERE e.quantidade < a.alertaminimo;

-- Consulta 6: Calcular o valor total em estoque de todos os produtos
SELECT SUM(p.valor * e.quantidade) AS valor_total_estoque
FROM produtos p
JOIN estoque e ON p.idproduto = e.idproduto;