/* 
Criar tabela CLIENTE_DEPENDENTE com os campos:
IDCLIENTEDEPENDENTE – inteiro – chave primária
IDCLIENTE – inteiro – chave estrangeira
NOME – alfanumérico de 100
OBSERVAÇÃO – alfanumérico de 4000
*/

CREATE TABLE CLIENTE (
IDCLIENTE SERIAL NOT NULL,
NOME VARCHAR(200) NOT NULL,
DTNASCIMENTO DATE,
STATUS VARCHAR(10),
RUA VARCHAR(200) NOT NULL,
NUMERO VARCHAR(50) NOT NULL,
BAIRRO VARCHAR(200) NOT NULL,
COMPLEMENTO VARCHAR(200),
IDCIDADE INTEGER NOT NULL);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY  (IDCLIENTE);

ALTER TABLE CLIENTE ADD CONSTRAINT CK_STATUS_CLIENTE CHECK (STATUS IN ('Ativo', 'Inativo'));


CREATE TABLE CIDADE (
IDCIDADE SERIAL NOT NULL,
NOME VARCHAR(200) NOT NULL);

ALTER TABLE CIDADE ADD CONSTRAINT PK_CIDADE PRIMARY KEY (IDCIDADE);

ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_CIDADE FOREIGN KEY (IDCIDADE) REFERENCES CIDADE (IDCIDADE);


insert into CIDADE (NOME)
values ('Criciúma');

insert into CIDADE (NOME)
values ('Içara');

insert into CIDADE (NOME)
values ('Araranguá');


insert into CIDADE (NOME)
values ('Florianópolis');

insert into CLIENTE (NOME, DTNASCIMENTO, STATUS,
RUA, NUMERO, BAIRRO, COMPLEMENTO, IDCIDADE)
values ('Ana', '02/05/2001', 'Ativo', 'Rua dos Milagres', 's/n', 'Centro', null, 1);

insert into CLIENTE (NOME, DTNASCIMENTO, STATUS,
RUA, NUMERO, BAIRRO, COMPLEMENTO, IDCIDADE)
values ('João', '10/09/2003', 'Ativo', 'Rua do banco', '1009', 'Santa Bárbara', null, 2);

insert into CLIENTE (NOME, DTNASCIMENTO, STATUS,
RUA, NUMERO, BAIRRO, COMPLEMENTO, IDCIDADE)
values ('Camila', '01/04/2001', 'Ativo', 'Rua Margarida', '2', 'Pinheirinho', 'Perto da SATC', 1);

insert into CLIENTE (NOME, DTNASCIMENTO, STATUS,
RUA, NUMERO, BAIRRO, COMPLEMENTO, IDCIDADE)
values ('Joana', '23/10/2004', 'Ativo', 'Rua Flores', 's/n', 'Centro', null, 3);

insert into CLIENTE (NOME, DTNASCIMENTO, STATUS,
RUA, NUMERO, BAIRRO, COMPLEMENTO, IDCIDADE)
values ('Pedro', '19/04/2000', 'Ativo', 'Av. Centenário', 's/n', 'Centro', null, 1);

update cliente set status = 'Inativo' where nome = 'Pedro';

alter table cliente add renda numeric(15,2) default 0 not null;

update cliente
set renda = random();