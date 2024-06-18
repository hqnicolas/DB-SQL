create table produtos (
idproduto serial not null,
codbarras varchar(50) not null,
descritivo text not null,
valor decimal(10,2) not null,
startstock int not null);

create table analise(
idanalise serial not null,
idproduto int not null,
demanda int not null,
datacheck date not null);

create table transactions(
idtransaction serial not null,
idproduto int not null,
quantidade int not null,
TransactionType varchar(10),
date timestamp not null);

create table estoque(
idprateleira serial not null,
idproduto int not null,
quantidade int default '0' not null,
atualizado timestamp not null);

create table alertas(
idalerta serial not null,
idproduto int not null,
alertaminimo int not null,
alertadata timestamp not null);

alter table produtos
add constraint pk_idproduto primary key (idproduto);
alter table analise
add constraint pk_idanalise primary key (idanalise);
alter table estoque
add constraint pk_idprateleira primary key (idprateleira);
alter table transactions
add constraint pk_idtransaction primary key (idtransaction);
alter table alertas
add constraint pk_idalerta primary key (idalerta);

alter table transactions
add constraint ck_TransactionType check (TransactionType in ('Venda', 'Compra'));

alter table estoque
add constraint fk_estoque_produtos foreign key (idproduto) references produtos (idproduto);
alter table alertas
add constraint fk_alertas_produtos foreign key (idproduto) references produtos (idproduto);
alter table transactions
add constraint fk_transactions_produtos foreign key (idproduto) references produtos (idproduto);
alter table analise
add constraint fk_analise_produtos foreign key (idproduto) references produtos (idproduto);

insert into produtos (codbarras, descritivo, valor, startstock)
values ('111111', 'Lápis', '3.20', '100');
insert into produtos (codbarras, descritivo, valor, startstock)
values ('222222', 'Caneta Bic Azul', '7.20', '100');
insert into produtos (codbarras, descritivo, valor, startstock)
values ('333333', 'Borracha', '5.00', '50');
insert into produtos (codbarras, descritivo, valor, startstock)
values ('444444', 'Lapiseira', '10.40', '100');
insert into produtos (codbarras, descritivo, valor, startstock)
values ('555555', 'Apontador', '6.90', '40');
insert into produtos (codbarras, descritivo, valor, startstock)
values ('666666', 'Compasso', '12.20', '30');
insert into produtos (codbarras, descritivo, valor, startstock)
values ('777777', 'Régua 30cm', '15.10', '25');
insert into produtos (codbarras, descritivo, valor, startstock)
values ('888888', 'Abaco', '35.80', '0');

insert into estoque (idproduto, quantidade, atualizado)
values ('1', '200', '2024-06-15 16:00:00');
insert into estoque (idproduto, quantidade, atualizado)
values ('2', '200', '2024-06-15 16:01:00');
insert into estoque (idproduto, quantidade, atualizado)
values ('3', '100', '2024-06-15 16:02:00');
insert into estoque (idproduto, quantidade, atualizado)
values ('4', '200', '2024-06-15 16:03:00');
insert into estoque (idproduto, quantidade, atualizado)
values ('5', '80', '2024-06-15 16:04:00');
insert into estoque (idproduto, quantidade, atualizado)
values ('6', '60', '2024-06-15 16:05:00');
insert into estoque (idproduto, quantidade, atualizado)
values ('7', '50', '2024-06-15 16:06:00');
insert into estoque (idproduto, quantidade, atualizado)
values ('8', '2', '2024-06-15 16:07:00');

insert into analise (idproduto, demanda, datacheck)
values ('1', '200', '2024-06-15');
insert into analise (idproduto, demanda, datacheck)
values ('2', '200', '2024-06-15');
insert into analise (idproduto, demanda, datacheck)
values ('3', '100', '2024-06-15');
insert into analise (idproduto, demanda, datacheck)
values ('4', '200', '2024-06-15');
insert into analise (idproduto, demanda, datacheck)
values ('5', '80', '2024-06-15');
insert into analise (idproduto, demanda, datacheck)
values ('6', '60', '2024-06-15');
insert into analise (idproduto, demanda, datacheck)
values ('7', '50', '2024-06-15');
insert into analise (idproduto, demanda, datacheck)
values ('8', '20', '2024-04-15');

insert into transactions (idproduto, quantidade, TransactionType, date)
values ('1', '5', 'Venda', '2024-06-15 17:00:00');
insert into transactions (idproduto, quantidade, TransactionType, date)
values ('2', '10', 'Venda', '2024-06-15 17:01:00');
insert into transactions (idproduto, quantidade, TransactionType, date)
values ('3', '7', 'Venda', '2024-06-15 17:02:00');
insert into transactions (idproduto, quantidade, TransactionType, date)
values ('4', '50', 'Compra', '2024-06-15 17:03:00');
insert into transactions (idproduto, quantidade, TransactionType, date)
values ('5', '10', 'Venda', '2024-06-15 17:04:00');
insert into transactions (idproduto, quantidade, TransactionType, date)
values ('6', '100', 'Compra', '2024-06-15 17:05:00');
insert into transactions (idproduto, quantidade, TransactionType, date)
values ('7', '50', 'Compra', '2024-06-15 17:06:00');
insert into transactions (idproduto, quantidade, TransactionType, date)
values ('8', '1', 'Compra', '2024-03-15 17:06:00');

insert into alertas (idproduto, alertaminimo, alertadata)
values ('1', '100', '2024-06-15 18:00:00' );
insert into alertas (idproduto, alertaminimo, alertadata)
values ('2', '100', '2024-06-15 18:01:00' );
insert into alertas (idproduto, alertaminimo, alertadata)
values ('3', '50', '2024-06-15 18:02:00' );
insert into alertas (idproduto, alertaminimo, alertadata)
values ('4', '100', '2024-06-15 18:03:00' );
insert into alertas (idproduto, alertaminimo, alertadata)
values ('5', '40', '2024-06-15 18:04:00' );
insert into alertas (idproduto, alertaminimo, alertadata)
values ('6', '30', '2024-06-15 18:05:00' );
insert into alertas (idproduto, alertaminimo, alertadata)
values ('7', '25', '2024-06-15 18:06:00' );
insert into alertas (idproduto, alertaminimo, alertadata)
values ('8', '10', '2024-06-15 18:05:00' );


