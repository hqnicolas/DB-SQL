create table cliente(
cod_cliente serial constraint pk_cliente primary key,
nome varchar(50),
sexo char(1),
endereco varchar(200),
telefone_fixo varchar(10),
telefone_celular varchar(11));

create table apolice (
codapolice serial constraint pk_apolice primary key,
cod_cliente int constraint fk_apolice references cliente(cod_cliente),
data_inicio_vigencia date,
data_fm_vigencia date,
valor_cobertura numeric(10,2),
valor_franquia numeric(10,2),
placa varchar(10) );

create table carro (
placa char(10),
modelo varchar(50),
chassi varchar(30),
marca varchar(30),
ano int,
cor varchar(10));

alter table carro add constraint pk_carro primary key (placa);

alter table apolice add constraint fk_apolice_carro foreign key (placa) references carro (placa);

create table sinistro (
cod_sinistro integer,
placa char(10),
data_sinistro date,
hora_sinistro time,
local_sinistro varchar(100),
condutor varchar(50));

alter table sinistro add constraint pk_sinistro primary key (cod_sinistro);

alter table sinistro add constraint fk_sinistro_carro foreign key (placa) references carro (placa);

CREATE SEQUENCE seq_sinistro
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1;
