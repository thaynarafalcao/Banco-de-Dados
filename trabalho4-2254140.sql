
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

INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794944', '100.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794922', '200.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794923', '300.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794924', '400.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794925', '500.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794926', '600.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794927', '700.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794928', '800.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794929', '900.000000', '10');
INSERT INTO criadores (CPF, capital, porcentagem_empresa)
VALUE ('08640794930', '100.000000', '10');

INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794944', '144868030', '3500');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794945', '144868031', '3500');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794946', '144868032', '3500');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794947', '144868033', '4000');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794948', '144868034', '4000');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794949', '144868035', '4000');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794950', '144868036', '4500');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794951', '144868037', '4500');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794952', '144868038', '4500');
INSERT INTO funcionarios (CPF, RG, salario)
VALUE ('08640794953', '144868039', '5000');


INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794930', '08640794953');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794929', '08640794952');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794928', '08640794951');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794927', '08640794950');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794926', '08640794949');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794925', '08640794948');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794924', '08640794947');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794923', '08640794946');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794922', '08640794945');
INSERT INTO criadores_contratam_func (cpf_criadores, cpf_funcionarios)
VALUE ('08640794944', '08640794944');


INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('123456789', 'email', 'conta e fraude');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('101112133', 'email', 'geral');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('14151616', 'email', 'troca de produto');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('18192021', 'live chat', 'reembolso');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('22232425', 'live chat', 'venda e faturamento');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('26272829', 'email', 'seguranca de conta');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('30313233', 'email', 'suporte tecnico');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('34353637', 'chat', 'estender garantia');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('38394041', 'chat', 'marketing');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('42434445', 'email', 'rastrear pedido');

INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('123123', 'email', 'rastrear pedido');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('123456', 'chat', 'estender garantia');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('123789', 'chat', 'suporte tecnico');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('321654', 'email', 'vendas');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('321987', 'chat', 'rastrear pedido');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('741852', 'email', 'rastrear pedido');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('258147', 'email', 'troca');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('963852', 'chat', 'reembolso');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('987654', 'email', 'segurança');
INSERT INTO suporte (n_protocolo, canal, tipo_atendimento)
VALUE ('951620', 'chat', 'rastrear pedido');



INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('ci5qhvrvhub', 'recompensas diarias', '1');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('p2ce6w73kxf', 'shopee figurinhas', '2');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('evhwkp3gqbt', 'shopee candy', '4');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('syppe4xjud3', 'pega brinde', '2');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('f5pxddti29j', 'shopee bolhas', '12');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('8x94r8vvnhb', 'shopee arremesso', '3');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('8x94r8vvnhc', 'jogo da cobrinha', '3');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('8x94r8vvnhd', 'jogo da forca', '3');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('8x94r8vvnhe', '7 erros', '3');
INSERT INTO jogos (codigo_jogo, nome, tentativas)
VALUE ('8x94r8vvnhf', 'carrinho fast', '3');


INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('thaynara ribeiro', 'thaynararibeiro@hotmail.com', '99277712', '123456789');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('thais falcao', 'thaisfalcao@gmail.com', '4499078301', '101112133');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('miriam mullati', 'mirianmullati@hotmail.com', '4497706789', '14151616');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('pamela lisa', 'pamelalisa@hotmail.com', '11943835219', '18192021');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('lucas krachinski', 'lucask@gmail.com', '11996567587', '22232425');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('henrique marcuzzo', 'henriquemarcuzzo@gmail.com', '17991524608', '26272829');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('eduarda galhardo', 'eduardagalhardo@gmail.com', '4497752224', '34353637');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('jesse pires', 'jessepires@hotmail.com', '4498971134', '38394041');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('enzo italiano', 'enzoitaliano@hotmail.com', '16997421838', '30313233');
 
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('eduarda bassalobre', 'duda@hotmail.com', '44998000472', '123123');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('leonice falcao', 'leonice@hotmail.com', '44998000473', '123456');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('andre lettrari', 'andre@hotmail.com', '44998000474', '123789');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('breno silva', 'breno@hotmail.com', '44998000475', '321654');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('felipe arcanjo', 'felipe@hotmail.com', '44998000421', '321987');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('joao moraski', 'joao@hotmail.com', '44998010471', '741852');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('vitor galafassi', 'vitor@hotmail.com', '44898000471', '987654');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('rafael silva', 'rafael@hotmail.com', '44978000471', '963852');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('reginaldo silva', 'reginaldo@hotmail.com', '44999000471', '321987');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('rafael berti', 'berti@hotmail.com', '44996600471', '258147');
INSERT INTO clientes (nome, email, telefone, n_protocolo)
VALUE ('ayrton santos', 'ayrton@hotmail.com', '44998220471', '951620');





INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('1234565', 'cartao de credito', '147258963', 'andre lettrari');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('1236555', 'boleto', '1230256', 'enzo italiano');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('741854', 'pix', '654283', 'thais falcao');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('789652', 'boleto', '556482', 'thaynara ribeiro');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('362509', 'pix', '136499', 'henrique marcuzzo');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('452163', 'boleto', '7946522', 'eduarda galhardo');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('985620', 'cartao de debito', '665420', 'jesse pires');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('754860', 'cartao de credito', '7896522', 'pamela lisa');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('649127', 'pix', '646452', 'lucas krachinski');
INSERT INTO compras (id_pedido, forma_pagamento, comprovante, nome_cliente)
VALUE ('649122', 'pix', '646442', 'miriam mullati');

INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('1jpeg', 10, 'veio tudo certo, gostei bastante', 649122);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('2jpeg', 10, 'veio tudo certo, só ainda não testei', 649127);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('3jpeg', 8, 'veio com um fone sem funcionar, mas os outros estao ok', 754860);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('4jpeg', 10, 'veio tudo certo, vou comprar outras vezes', 985620);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('5jpeg', 9, 'veio tudo certo, mas demorou muito', 452163);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('6jpeg', 10, 'veio tudo certo, recomendo', 362509);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('7jpeg', 10, 'veio tudo certo, obrigada', 789652);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('8jpeg', 9, 'veio tudo certo, mas ficou pequeno', 741854);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('9jpeg', 9, 'veio tudo certo, só achei fraco a embalagem', 1236555);
INSERT INTO avaliacao (foto, nota, comentario, id_pedido)
VALUE ('10peg', 10, 'veio tudo certo', 1234565);




INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('98404598000189', 'rua do centenario parana', '6569985622');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('22350030000160', 'rua curitiba campo mourao', '5548120036');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('67998411000199', 'rua araruna campo mourao', '669785413');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('25806057000103', 'centro pomerode', '996584759');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('08580860000153', 'sao carlos jardim boa vista', '9637418544');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('84332989000120', 'maringa zona dois', '7896548522');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('44587990000181', 'rua das rosas sao paulo', '0022546820');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('70492708000192', 'cruzeiro do sul sao paulo', '956532300');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('20539928000156', 'marechal tito sao paulo', '4512568966');
INSERT INTO lojas (cnpj, endereco, contrato)
VALUE ('80461188000104', 'caxias do sul shopping central', '1336598520');

INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('12365485621', 'roupas', '60.00','649127','80461188000104');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('14569875200', 'joias', '120.00','754860','20539928000156');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('96658743210', 'celulares', '3000','985620','70492708000192');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('00215698653', 'acessorios', '30.00','452163','44587990000181');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('96587455821', 'outros', '50.00','362509','84332989000120');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('36025412666', 'informatica', '80.00','789652','25806057000103');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('99875462310', 'esporte', '70.00','741854','67998411000199');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('56465487888', 'brinquedos', '45.00','1236555','22350030000160');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('33225698741', 'manicure', '65.00','1234565','98404598000189');
INSERT INTO produtos (id_produto, categoria, preco, id_compra, n_cnpj)
VALUE ('25836914700', 'maquiagem', '50.00','649122','08580860000153');

INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Brasspress Transportes', 'caminhao', 'caixa');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Jamef Transportes', 'caminhao', 'pacote');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Correios', 'carro', 'malote');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Sequoia', 'carro', 'saco');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Express', 'moto', 'caixa');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Mercado Livre', 'caminhao', 'saco');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Plimor', 'moto', 'pacote');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Patrus', 'carro', 'mala');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Transmedeiros', 'carreta', 'saco');
INSERT INTO transportadoras (nome_empresa, veiculos, embalagem)
VALUE ('Sul Brasil', 'caminhao', 'caixa');



INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('144868030', '08640793944', '04-04-01', 'miriam mullati');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('144868000', '08640794844', '03-08-01', 'thaynara ribeiro');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('144228030', '08640794994', '08-02-00', 'enzo italiano');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('114868030', '08640794984', '08-08-00', 'pamela lisa');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('124868030', '08640794974', '14-01-02', 'eduarda galhardo');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('123652012', '08640794964', '07-05-00', 'jesse pires');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('321654980', '08640794954', '06-12-00', 'henrique marcuzzo');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('654125080', '08640794904', '04-06-00', 'lucas krachinski');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('145698260', '08640794924', '29-04-06', 'thais falcao');
INSERT INTO pessoa_fisica (rg, cpf, data_nascimento, nome)
VALUE ('142536635', '08640794934', '24-03-01', 'joao moraski');

INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142536636', 'av tiradentes', '24-03-01', 'ayrton santos');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142536637', 'rua licilio', '24-03-01', 'rafael berti');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142536695', 'av flaviano melo', '24-03-01', 'reginaldo silva');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142536655', 'av gaspar coqueiro', '24-03-01', 'rafael silva');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142536635', 'av japao', '24-03-01', 'vitor galafassi');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142536335', 'av brasil', '24-03-01', 'joao moraski');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142530635', 'rua campo mourao', '24-03-01', 'felipe arcanjo');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142536635', 'rua benedito rodrigues', '24-03-01', 'breno silva');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142436635', 'rua tupis', '24-03-01', 'andre lettrari');
INSERT INTO pessoa_juridica (cnpj, endereco, data_nascimento, nome)
VALUE ('142236635', 'rua do centenario', '24-03-01', 'eduarda bassalobre');


INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Sul Brasil', 'eduarda bassalobre');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Transmedeiros', 'andre lettrari');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Patrus', 'enzo italiano');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Correios', 'thaynara ribeiro');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Plimor', 'henrique marcuzzo');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Mercado Livre', 'jesse pires');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Express', 'breno silva');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Sequoia', 'rafael berti');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Jamef Transportes', 'thais falcao');
INSERT INTO transp_envia_para_clientes (nome_transp, nome_cliente)
VALUE ( 'Brasspress Transportes', 'reginaldo silva');


INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( 'ci5qhvrvhub', 'joao moraski');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( 'p2ce6w73kxf', 'breno silva');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( 'evhwkp3gqbt', 'eduarda galhardo');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( 'syppe4xjud3', 'vitor galafassi');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( 'f5pxddti29j', 'jesse pires');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( '8x94r8vvnhb', 'enzo italiano');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( '8x94r8vvnhc', 'henrique marcuzzo');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( '8x94r8vvnhd', 'thais falcao');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( '8x94r8vvnhe', 'thaynara ribeiro');
INSERT INTO clientes_jogam_jogos (cod_jogo, nome_cliente)
VALUE ( '8x94r8vvnhf', 'rafael berti');

INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( 'ci5qhvrvhub', '08640794944');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( 'p2ce6w73kxf', '08640794945');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( 'evhwkp3gqbt', '08640794946');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( 'syppe4xjud3', '08640794947');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( 'f5pxddti29j', '08640794948');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( '8x94r8vvnhb', '08640794949');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( '8x94r8vvnhc', '08640794950');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( '8x94r8vvnhd', '08640794951');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( '8x94r8vvnhe', '08640794952');
INSERT INTO func_desenvolvem_jogos (cod_jogo, cpf_funcionario)
VALUE ( '8x94r8vvnhf', '08640794953');

INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794944', '123123');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794945', '123456');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794946', '123789');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794947', '321654');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794948', '321987');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794949', '741852');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794950', '258147');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794951', '963852');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794952', '987654');
INSERT INTO func_trabalham_em_sup(cpf_funcionario, n_protocolo)
VALUE ( '08640794953', '951620');

-- Clientes que jogam jogos com 3 tentativas
SELECT C.nome_cliente
FROM clientes_jogam_jogos C
WHERE C.cod_jogo in (
select J.codigo_jogo
from JOGOS J
where J.tentativas = 3);

-- Clientes que pediram suporte de reembolso

select c.nome
from clientes c
where c.n_protocolo in (
select s.n_protocolo
from suporte s
where s.tipo_atendimento = 'reembolso');

-- Clientes que receberam uma caixa pela transportadora

select tc.nome_cliente
from transp_envia_para_clientes tc
where tc.nome_transp in (
select t.nome_empresa
from transportadoras t
where t.embalagem = 'caixa');


--  cpf dos funcionarios que trabalham por chat no atendimento de rastrear pedidos
select f.cpf_funcionario
from func_trabalham_em_sup f
where f.n_protocolo in (
select s.n_protocolo
from suporte s
where s.canal = 'chat' and s.tipo_atendimento = 'rastrear pedido');

-- Endereço da loja que vende produtos de maquiagem
select l.endereco
from lojas l
where l.cnpj in (
select p.n_cnpj
from produtos p
where p.categoria = 'maquiagem');

-- comentario de uma avalição para uma compra feita por uma pessoa que pagou com cartao de credito
select a.comentario
from avaliacao a
where a.id_pedido in (
select c.id_pedido
from compras c
where c.forma_pagamento = 'cartao de credito');

-- nome do cliente que deu 8 na nota de avaliação
select c.nome_cliente
from compras c
where c.id_pedido in (
select a.id_pedido
from avaliacao a
where a.nota <= 8);

-- Tipo do suporte que atendeu cliente com o nome de thaynara
select s.tipo_atendimento
from suporte s
where s.n_protocolo in (
select c.n_protocolo
from clientes c
where c.nome like '%thaynara%');

-- Data de nascimento de um cliente que é pessoa juridica
select c.telefone
from clientes c
where c.nome in (
select pj.nome
from pessoa_juridica pj
where pj.nome like '%silva%'
);


-- cpf dos criadores que contratam funcionarios que recebem mais de 3k

select cc.cpf_funcionarios
from criadores_contratam_func cc
where cc.cpf_funcionarios in (
select fc.cpf
from  funcionarios fc
where fc.salario >= 4500
);

