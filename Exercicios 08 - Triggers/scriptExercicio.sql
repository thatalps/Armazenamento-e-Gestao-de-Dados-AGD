-- ----------- criacao de tabela log
create table log
(id int primary key NOT NULL AUTO_INCREMENT, operação varchar(100), tabela varchar(100), data_hora datetime);

-- -------------------- tabela produtos
-- trigger de inserção na tabela de produtos
delimiter $$
create trigger log_insert_produtos after insert
on produtos
for each row 
begin
	insert into log values (null, 'insert', 'produtos', now());
end $$

insert into produtos values("004", 'açucar', 10);
select * from produtos
select * from log

-- trigger de deleção de produto 
delimiter $$
create trigger log_delete_produtos after delete
on produtos
for each row
begin
	insert into log values(null, 'delete', 'produtos', now());
end$$
delete from produtos where referencia = '004';
select * from produtos;
select * from log;

-- trigger de update de produto
delimiter $$  
create trigger log_update_produtos after update
on produtos
for each row
begin
	insert into log values(null, 'update', 'produtos', now());
end $$

update produtos
set produtos.Estoque =10
where Descricao = 'Arroz';

select * from produtos;
select * from log;

-- -------------------- tabela itensvenda
delimiter $$
create trigger log_insert_itensvenda after insert
on itensvenda
for each row
begin
	insert into log values (null, 'insert', 'itensvenda', now());
    update produtos set estoque = new.quantidade where referencia=new.produto;
end $$

insert into itensvenda values (3, '002', 5);
select * from log;
select * from produtos;
select * from itensvenda;

-- trigger de delete itensvenda
delimiter $$
create trigger log_delete_itensvenda after delete 
on itensvenda
for each row
begin 
	insert into log values (null, 'delete', 'itensvenda', now());
    update produtos set estoque = estoque + old.quantidade where referencia =old.produto;
end$$

delete from itensvenda where venda=3;

select * from itensvenda;
select * from log;

-- trigger de update itensvenda
delimiter $$
create trigger log_update_itensvenda after update
on itensvenda
for each row
begin 
    insert into log values (null, 'update', 'itensvenda', now());
      
    -- mudar o produto, tem que restaurar o estoque do antigo e atualizar o do novo --aqui
     if (new.Produto != old.Produto) then
		update produtos set Estoque = Estoque + (new.Quantidade - old.Quantidade) where Referencia=old.Produto;
        update produtos set Estoque = Estoque - (new.Quantidade - old.Quantidade) where Referencia=new.Produto;
	 end if;
     
     -- mudar a quantidade, tem que mudar o estoque de produtos
    if(new.Quantidade != old.Quantidade and new.Produto = old.Produto) then
		if (new.Quantidade > old.Quantidade) then -- novo valor é maior que o antigo -> 10(new) maior que 5(old)
			update produtos set Estoque = Estoque - (new.Quantidade - old.Quantidade);
		else -- novo valor menor que o antigo -> 5(new) menor que 10(old)
			update produtos set Estoque = Estoque + (new.Quantidade - old.Quantidade);
		end if;
	end if;
end $$
    
update itensvenda set quantidade=10 where Venda=2;

update itensvenda set Produto='001' where Venda=2;

select * from itensvenda;
select * from produtos;
select * from log;

drop schema mercado;
drop trigger log_update_itensvenda;