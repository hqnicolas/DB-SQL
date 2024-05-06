create table cliente (
cod_cliente integer,
nome varchar(50),
cpf char(11),
sexo char(1),
endereco varchar(200),
telefone_fixo varchar(10),
telefone_celular varchar(11));

create table apolice (
cod_apolice integer,
cod_cliente integer,
data_inicio_vigencia date,
data_fim_vigencia date,
valor_cobertura numeric(10,2),
valor_franquia numeric(10,2),
placa char(10));

create table carro (
placa char(10),
endereco varchar(50),
endereco varchar(30),
endereco varchar(30),
ano integer,
cor varchar(10));

create table sinistro (
cod_sinistro integer,
placa char(10),
data_sinistro date,
hora_sinistro time,
local_sinistro varchar(100),
condutor varchar(50));

alter table cliente add constraint pk_cliente primary key (cod_cliente);

alter table apolice add constraint pk_apolice primary key (cod_apolice);

alter table carro add constraint pk_carro primary key (placa);

alter table sinistro add constraint pk_sinistro primary key (cod_sinistro);

alter table apolices add constraint fk_cliente_apolice foreign key (cod_cliente) references cliente (cod_cliente);

alter table apolices add constraint fk_carro_apolice foreign key (placa) references carro (placa);

alter table sinistro add constraint fk_carro_sinistro foreign key (placa) references carro (placa);