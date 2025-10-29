insert into cliente values(1, 'Ana paula', 'rua dos pombos, 10', 'rio de janeiro', '11111111', 'RJ','21111111111');
insert into cliente values(2, 'Rose', 'rua das flores, 20', 'rio de janeiro', '22222222', 'RJ','21222222222');
insert into cliente values(3, 'Jose', 'rua do vale, 30', 'rio de janeiro', '33333333', 'RJ','21333333333');
insert into cliente values(4, 'Paulo', 'rua jurema, 40', 'rio de janeiro', '44444444', 'RJ','21444444444');
insert into cliente values(5, 'Joao', 'rua verde, 50', 'rio de janeiro', '55555555', 'RJ','21555555555');
select * from cliente;

insert into vendedor values(1, 'Vanderson', 1200, 1.5);
insert into vendedor values(2, 'Val', 1200, 1.5);
insert into vendedor values(3, 'Paula', 1200, 1.5);
insert into vendedor values(4, 'Clara', 1200, 1.5);
insert into vendedor values(5, 'Samuel', 1200, 1.5);
select * from vendedor;

insert into produto values (1, '5unidades', 'copos descartáveis', 5.50);
insert into produto values (2, '10unidades', 'papel toalha', 5);
insert into produto values (3, '15unidades', 'colher de plástico', 3);
insert into produto values (4, '20unidades', 'granulado 500g', 10);
insert into produto values (5, '25unidades', 'leite condensado', 7);
select * from produto;

insert into pedido values (1,1,1,10);
insert into pedido values (2,2,2,10);
insert into pedido values (3,3,3,10);
insert into pedido values (4,4,4,10);
insert into pedido values (5,5,5,10);
select * from pedido;

insert into item_pedido values(1,1,1);
insert into item_pedido values(2,2,1);
insert into item_pedido values(3,3,1);
insert into item_pedido values(4,4,1);
insert into item_pedido values(5,5,1);
select * from item_pedido;
