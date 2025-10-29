select * from city;
select * from country;
select * from countrylanguage;
-- A) Crie um procedimento que inclua na tabela "city" uma nova cidade. Passe com
-- parâmetro: nome da cidade, nome do estado, nome do país, e a população. Atenção: eu
-- não pedi o código do país, e sim seu nome por extenso. Consulte a tabela "Country", os
-- nomes estão em inglês. Caso o país não seja encontrado, exiba a mensagem 'País não
-- encontrado'. Caso seja inserido a nova cidade, retorno a mensagem "Código da cidade:
-- ID". Dicas: use "concat()" e Last_Inserted_Id().
delimiter $$
create procedure addCity(cidade varchar(100), estado varchar(100), pais varchar(100), populacao int)
begin
	declare maxID int;
	declare codigopais varchar(100);
	declare codigocity varchar(100);
		select Code into codigopais	from country where Name=pais;
        if (codigopais != '') then
			select MAX(Id) into maxID from city;
            insert into city(ID, Name, CountryCode, Population ) values(maxID+1, cidade, codigopais, population);
			select concat("Código da cidade: ",(maxID+1)) into codigocity;
            select codigocity;
        else
			select "Pais não encontrado!";
		end if;
end $$
call addCity ("cidade da thaissa", "estado da thaissa", "Aruba", 10);


-- Crie uma função semelhante ao do exercício anterior. Contudo, ao invés de mostrar as
-- mensagens de país não encontrado ou código da cidade. Ao invés disso, caso não seja
-- possível inserir a nova cidade, a função deve retornar o valor NULL. Caso a cidade seja
-- inserira com sucesso, a função retornara o ID da cidade. Não se esqueça do comando
-- "DETERMINISTIC" antes do BEGIN principal.
delimiter $$
create procedure addCity2(cidade varchar(100), estado varchar(100), pais varchar(100), populacao int)
begin
	declare maxID int;
	declare codigopais varchar(100);
	declare codigocity varchar(100);
		select Code into codigopais	from country where Name=pais;
        if (codigopais != '') then
			select MAX(Id) into maxID from city;
            insert into city(ID, Name, CountryCode, Population ) values(maxID+1, cidade, codigopais, population);
			select maxID+1 into codigocity;
            select codigocity;
        else
			select Null;
		end if;
end $$
call addCity2 ("cidade da thaissa", "estado da thaissa", "A", 10);



-- --------------------------------------------------
select * from city;
delete from city where Name='cidade da thaissa';

drop procedure addCity;
select * from country where Code = 'ABW'