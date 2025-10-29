create table cliente
( cliente_id integer not null auto_increment,
nome varchar(50),
endereco varchar(50),
cidade varchar(50),
cep varchar(8),
uf varchar(2),
telefone varchar(11),
primary key(cliente_id)
);

create table vendedor
( vendedor_id integer not null auto_increment,
nome varchar(50),
salario float,
faixa_comissao float,
primary key(vendedor_id)
);

CREATE TABLE pedido
(
numero_ped INTEGER not null auto_increment,
cliente_id INTEGER not null,
vendedor_id INTEGER not null,
prazo_entrega INTEGER not null,
primary key (numero_ped),
foreign key (cliente_id) references cliente(cliente_id),
foreign key (vendedor_id) references vendedor(vendedor_id) 
);

create table produto
( produto_cod integer not null auto_increment,
unidade varchar(50),
descricao varchar(50),
valor_unitario float,
primary key(produto_cod)
);

create table item_pedido
(
numero_ped integer not null,
produto_cod integer not null,
quantidade integer not null,
foreign key(numero_ped) references pedido(numero_ped),
foreign key(produto_cod) references produto(produto_cod)
);
