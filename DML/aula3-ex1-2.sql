create table aluno(
cd_aluno serial constraint pk_aluno primary key,
nm_aluno varchar(100),
email varchar(100));

create table avaliacao(
cd_avaliacao serial constraint pk_avaliacao primary key,
ds_avaliacao varchar(100),
dt_abertura date,
dt_fechamento date);

create table questao(
cd_questao serial constraint pk_questao primary key,
cd_avaliacao int constraint fk_avaliacao_questao references avaliacao(cd_avaliacao),
ds_questao varchar(4000),
tp_questao int);

create table questao_item(
cd_questao_item serial constraint pk_questaoitem primary key,
cd_questao int constraint fk_questao_questao_item references questao(cd_questao),
ds_questao_item varchar(4000),
is_correta bit);


create table avaliacao_aluno(
cd_avaliacao int constraint fk_avaliacao_avaliacao_aluno references avaliacao(cd_avaliacao),
cd_aluno int constraint fk_aluno_avaliacao_aluno references aluno(cd_aluno),
ds_avaliacao_aluno varchar(100),
dt_inicio date,
dt_fim date);

alter table avaliacao_aluno add constraint pk_avaliacao_aluno primary key (cd_avaliacao, cd_aluno);

create table resposta_aberta(
cd_avaliacao int ,
cd_aluno int,
cd_questao int constraint fk_questao_resposta_aberta references questao(cd_questao),
ds_resposta_aberta varchar(4000),
dt_resposta date);

alter table resposta_aberta add constraint pk_resposta_aberta primary key (cd_avaliacao, cd_aluno, cd_questao);

alter table resposta_aberta add constraint fk_avaliacao_aluno_resposta_aberta foreign key (cd_avaliacao, cd_aluno) references avaliacao_aluno (cd_avaliacao, cd_aluno);


create table resposta_fechada(
cd_avaliacao int ,
cd_aluno int,
cd_questao_item int constraint fk_questao_item_resposta_fechada references questao_item(cd_questao_item),
dt_resposta date);

alter table resposta_fechada add constraint fk_avaliacao_aluno_resposta_fechada foreign key (cd_avaliacao, cd_aluno) references avaliacao_aluno (cd_avaliacao, cd_aluno);


alter table resposta_fechada add constraint pk_resposta_fechada primary key (cd_avaliacao, cd_aluno, cd_questao_item);

alter table questao add constraint ck_tp_questao check (tp_questao in (0,1));

insert into aluno(nm_aluno, email) 
values ('João', 'joao@gmail.com'),
('Maria', 'maria@gmail.com');

insert into avaliacao (ds_avaliacao, dt_abertura, dt_fechamento) 
values ('Avaliacao de testes', '2024-01-01', '2024-01-01');

insert into questao( cd_avaliacao, ds_questao, tp_questao)
values (1, 'A questão fechada', 0),
(1, 'A questão aberta', 1);


insert into questao_item (cd_questao, ds_questao_item, is_correta)
values (1, 'Resposta A - certa', '1'),
(1, 'Resposta B - errada', '0'),
(1, 'Resposta C - errada', '0');

insert into avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, 
dt_inicio, dt_fim)
values (1, 1, 1,'2024-01-01', '2024-01-01');

insert into avaliacao_aluno (cd_avaliacao, cd_aluno, ds_avaliacao_aluno, 
dt_inicio, dt_fim)
values (1, 2, 1,'2024-01-01', '2024-01-01');

insert into resposta_aberta(cd_avaliacao, cd_aluno, cd_questao,	ds_resposta_aberta, dt_resposta )
values (1, 1, 2, 'Resposta aberta','2024-01-01');


insert into resposta_aberta(cd_avaliacao, cd_aluno, cd_questao,	ds_resposta_aberta, dt_resposta )
values (1, 2, 2, 'Resposta aberta - outro aluno','2024-01-01');


insert into resposta_fechada (cd_avaliacao, cd_aluno, cd_questao_item, dt_resposta)
values (1, 1, 1, '2024-01-01');

insert into resposta_fechada (cd_avaliacao, cd_aluno, cd_questao_item, dt_resposta)
values (1, 2, 3, '2024-01-01');
