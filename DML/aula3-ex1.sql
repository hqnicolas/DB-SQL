create table aluno (
cd_aluno integer,
nm_aluno varchar(100),
email varchar(100));

alter table aluno add constraint pk_aluno primary key (cd_aluno);

create table avaliacao (
cd_avaliacao integer,
ds_avaliacao varchar(100),
dt_abertura date,
dt_fechamento date);

alter table avaliacao add constraint pk_avaliacao primary key (cd_avaliacao);

create table questao (
cd_questao integer,
cd_avaliacao integer,
ds_questao varchar(4000),
tp_questao integer);

alter table questao add constraint pk_questao primary key (cd_questao);

create table avaliacao_aluno (
cd_avaliacao integer,
cd_aluno integer,
ds_avaliacao_aluno varchar(100),
dt_inicio date,
dt_fim date);

alter table avaliacao_aluno add constraint pk_avaliacao_aluno primary key (cd_avaliacao, cd_aluno);

create table resposta_fechada (
cd_avaliacao integer,
cd_aluno integer,
cd_questao_item integer,
dt_resposta date);

alter table resposta_fechada add constraint pk_questao_fechada primary key (cd_avaliacao, cd_questao_item, cd_aluno);

create table resposta_aberta (
cd_avaliacao integer,
cd_aluno integer,
cd_questao integer,
ds_resposta_aberta varchar(4000),
dt_resposta date);

alter table resposta_aberta add constraint pk_questao_aberta primary key (cd_avaliacao, cd_aluno, cd_questao);

create table questao_item (
cd_questao_item integer,
cd_questao integer,
ds_questao_item varchar(4000),
is_correta bit);

alter table questao_item add constraint pk_questao_item primary key (cd_questao_item);

/*foreign keys avaliacao_aluno*/
alter table avaliacao_aluno add constraint fk_aluno_avaliacao_aluno foreign key (cd_aluno) references aluno (cd_aluno);
alter table avaliacao_aluno add constraint fk_avaliacao_avaliacao_aluno foreign key (cd_avaliacao) references avaliacao (cd_avaliacao);

/*foreign keys resposta_fechada*/
alter table resposta_fechada add constraint fk_avaliacao_aluno_resposta_fechada foreign key (cd_avaliacao, cd_aluno) references avaliacao_aluno (cd_avaliacao, cd_aluno);

 
alter table resposta_fechada add constraint fk_avaliacao_aluno_fechada foreign key (cd_avaliacao, cd_aluno) references avaliacao_aluno (cd_avaliacao, cd_aluno);

alter table resposta_fechada add constraint fk_questao_item_resposta_fechada foreign key (cd_questao_item) references questao_item (cd_questao_item);

/*foreign keys questao_item*/
alter table questao_item add constraint fk_questao_questao_item foreign key (cd_questao) references questao (cd_questao);

/*foreign keys avaliacao*/
alter table avaliacao add constraint fk_avaliacao_questao foreign key (cd_avaliacao) references avaliacao (cd_avaliacao);

/*foreign keys resposta_aberta*/
alter table resposta_aberta add constraint fk_questao_resposta_aberta foreign key (cd_questao) references questao (cd_questao);
alter table resposta_aberta add constraint fk_avaliacao_resposta_aberta foreign key (cd_avaliacao, cd_aluno) references avaliacao_aluno (cd_avaliacao, cd_aluno);
alter table resposta_aberta add constraint fk_aluno_resposta_aberta foreign key (cd_avaliacao, cd_aluno) references avaliacao_aluno (cd_avaliacao, cd_aluno);



