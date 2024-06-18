
TABLE produtos {
  idproduto SERIAL [PRIMARY KEY]
  codbarras VARCHAR(50) 
  descritivo TEXT 
  valor DECIMAL(10, 2) 
  startstock INT 
}

TABLE estoque {
  idprateleira SERIAL [PRIMARY KEY]
  idproduto INT
  quantidade INT
  atualizado TIMESTAMP
}

TABLE transactions {
  idtransaction SERIAL [PRIMARY KEY]
  idproduto INT 
  quantidade INT 
  TransactionType VARCHAR(10)
  date TIMESTAMP
}

TABLE alertas {
  idalerta SERIAL [PRIMARY KEY]
  idproduto INT
  alertaminimo INT 
  alertadata TIMESTAMP
}

TABLE analise {
  idanalise SERIAL [PRIMARY KEY]
  idproduto INT
  demanda INT
  datacheck DATE
}
Ref: analise.idproduto > produtos.idproduto
Ref: alertas.idproduto > produtos.idproduto 
Ref: estoque.idproduto > produtos.idproduto 
Ref: transactions.idproduto > produtos.idproduto 
