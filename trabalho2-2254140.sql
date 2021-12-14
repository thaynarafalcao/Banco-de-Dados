create table CRIADORES (
CPF char(11) primary key, 
capital integer, 
porcentagem_empresa float
);

create table FUNCIONARIOS (
CPF char(11) primary key, 
RG char(9), 
salario float
);

create table SUPORTE (
n_protocolo bigint primary key, 
canal varchar(20), 
tipo_atendimento varchar(20)
);

create table JOGOS (
codigo_jogo varchar(30) primary key, 
nome varchar(20), 
tentativas integer
);

create table CLIENTES (
nome varchar(25) primary key not null, 
email varchar(30), 
telefone bigint,
n_protocolo bigint,
FOREIGN KEY (n_protocolo) REFERENCES SUPORTE(n_protocolo)
);



create table COMPRAS(
id_pedido integer primary key not null, 
forma_pagamento varchar(30), 
comprovante bigint,
nome_cliente varchar(25),
FOREIGN KEY (nome_cliente) REFERENCES CLIENTES(nome)
);

create table LOJAS(
cnpj char(14) primary key,
endereco varchar(100),
contrato bigint
);

create table PRODUTOS (
id_produto bigint primary key, 
categoria varchar(20), 
preco float,
id_compra integer,
n_cnpj char(14),
FOREIGN KEY (id_compra) REFERENCES COMPRAS(id_pedido),
FOREIGN KEY (n_cnpj) REFERENCES LOJAS(cnpj)
);

create table TRANSPORTADORAS (
nome_empresa varchar(30) primary key, 
veiculos varchar(20), 
embalagem varchar(25)
);

create table AVALIACAO (
foto varchar(25),
nota integer, 
comentario varchar(100), 
id_pedido integer,
foreign key (id_pedido) references COMPRAS(id_pedido) on delete cascade,
primary key (id_pedido, comentario)
);

create table PESSOA_JURIDICA (
cnpj char(14),
endereco varchar(35), 
data_nascimento date, 
nome varchar(25),
foreign key (nome) references clientes(nome), 
primary key (nome)
);

create table PESSOA_FISICA(
rg char(9), 
cpf char(11), 
data_nascimento date, 
nome char(25),
foreign key (nome) references clientes(nome), 
primary key (nome)
);

create table CRIADORES_CONTRATAM_FUNC(
cpf_criadores char(11),
cpf_funcionarios char(11), 
FOREIGN KEY(cpf_criadores) REFERENCES CRIADORES(CPF),
FOREIGN KEY(cpf_funcionarios) REFERENCES FUNCIONARIOS(CPF),
primary key(cpf_criadores, cpf_funcionarios)
);

create table TRANSP_ENVIA_PARA_CLIENTES(
nome_transp varchar(30),
nome_cliente varchar(25),
FOREIGN KEY(nome_transp) REFERENCES TRANSPORTADORAS(nome_empresa),
FOREIGN KEY(nome_cliente) REFERENCES CLIENTES(nome),
primary key(nome_transp, nome_cliente)
);

create table CLIENTES_JOGAM_JOGOS(
cod_jogo varchar(30),
nome_cliente varchar(25),
FOREIGN KEY(cod_jogo) REFERENCES JOGOS(codigo_jogo),
FOREIGN KEY(nome_cliente) REFERENCES CLIENTES(NOME),
primary key(cod_jogo, nome_cliente)
);

create table FUNC_DESENVOLVEM_JOGOS(
cod_jogo varchar(30),
cpf_funcionario char(11),
FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIOS(CPF),
FOREIGN KEY(cod_jogo) REFERENCES JOGOS(codigo_jogo),
primary key(cpf_funcionario, cod_jogo)
);

create table FUNC_TRABALHAM_EM_SUP(
cpf_funcionario char(11),
n_protocolo bigint,
FOREIGN KEY(cpf_funcionario) REFERENCES FUNCIONARIOS(CPF),
FOREIGN KEY(n_protocolo) REFERENCES SUPORTE(n_protocolo),
primary key(cpf_funcionario, n_protocolo)
);
