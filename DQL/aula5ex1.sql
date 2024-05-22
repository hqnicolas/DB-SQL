/* 
 Inserir dois dependentes para cada cliente.
*/

CREATE TABLE CLIENTE_DEPENDENTE (
  IDCLIENTEDEPENDENTE SERIAL NOT NULL,
  IDCLIENTE INTEGER NOT NULL,
  NOME VARCHAR(100) NOT NULL,
  OBSERVAÇÃO VARCHAR(4000),
  PRIMARY KEY (IDCLIENTEDEPENDENTE),
  CONSTRAINT FK_CLIENTE_DEPENDENTE_CLIENTE FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE_DEPENDENTE (IDCLIENTE, NOME, OBSERVAÇÃO)
VALUES 
(1, 'Filha de Ana', 'Estuda em Criciúma'),
(1, 'Filho de Ana', 'Joga futebol no time do bairro'),
(2, 'Filho de João', 'Estuda em Içara'),
(2, 'Filha de João', 'Ameniza a casa do pai'),
(3, 'Neta de Camila', 'Tem 5 anos e gosta de brinquedos'),
(3, 'Neto de Camila', 'Joga futebol no campo da escola'),
(4, 'Filha de Joana', 'Estuda em Criciúma'),
(4, 'Filho de Joana', 'Gosta de jogar videogame'),
(5, 'Filha de Pedro', 'Estuda em Jaguaruna'),
(5, 'Filho de Pedro', 'Gosta de jogar Peteca');
