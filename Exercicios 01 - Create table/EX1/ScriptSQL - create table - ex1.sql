create table empresa 
(codemp integer not null auto_increment,
nome varchar(50) not null,
primary key(codemp)
);

create table aviao
(codaviao integer not null auto_increment,
codemp integer not null,
tipo varchar(50),
capacidade integer,
primary key (codaviao),
foreign key(codemp) references empresa(codemp)
);

create table voo 
(codvoo integer not null auto_increment,
codemp integer not null,
primary key (codvoo),
foreign key(codemp) references empresa (codemp) );

create table trecho
(origem varchar(50) not null,
destino varchar(50) not null,
distancia integer,
primary key(origem, destino)
);

create table rota
(codrota integer not null auto_increment,
origem varchar(50),
destino varchar(50),
codvoo integer not null,
h_saida datetime,
h_chegada datetime,
primary key(codrota),
foreign key (origem, destino) references trecho(origem, destino),
foreign key (codvoo) references voo(codvoo)
);

create table viagem
(codrota integer not null,
data_voo date not null,
codaviao integer,
h_saida_real datetime,
h_chegada_real datetime,
primary key(codrota, data_voo),
foreign key(codrota) references rota (codrota),
foreign key(codaviao) references aviao (codaviao)
);
drop table aviao;
drop table empresa;
drop table rota;
drop table trecho;
drop table viagem;
drop table voo;
