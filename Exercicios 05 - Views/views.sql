-- 1. Criação de Views – “Views Estáticas”:
-- a. Crie e exiba uma View Estática com seus dados:
-- nome, CPF, endereço, cidades, estado, pais, cep, e-mail e telefone.
create view dadosUsuario as select "maria" as nome, "12345678910" as cpf, "rua dos pombos, numero 0" as endereco, "Rio de janeiro" as cidade, "Rio de janeiro" as estado, "Brasil" as pais, "12345-678" as cep, "maria@gmail.com" as email, "21 99999-9999" as telefone; 
select * from dadosUsuario;

-- b. Crie e exiba uma View Estática com dados de um veículo que mais gosta:
-- modelo, ano, serie, montadora, valor.
create view veiculo as select "modelo-carro" as modelo, "2024" as ano, "12345" as serie, "Honda" as montadora, 100.000 as valor;
select * from veiculo;
-- c. Crie e exiba uma View Estática com os dados de um computador dos seus sonhos:
-- memória, armazenamento, vídeo, processador, som e etc.
create view dadosComputador as select "32gb" as memoria, "1 Terabyte" as armazenamento, "exemploVideo" as video, "ryzen 5" as processador, "som estereo" as som;
select * from dadosComputador;

-- -------------------------------------------------------------------------------------
-- 2. Criação de Views – “Views Dinâmicas” – Usando o banco de dados World:

-- a. Crie uma view que exiba todos os países com expectativa de vida maior que 77 anos.
-- Mostrando a expectativa e o nome do país;
create view expectativaVidaPorPais as
select name, lifeExpectancy from country where LifeExpectancy>77;
select * from expectativaVidaPorPais;

-- b. Crie uma view que mostre todos os países que possuem falantes língua chinesa e
-- japonesa, mostre o país, a porcentagem e a língua;
create view PaisesFalantesLinguasChinesaEJaponesa as
select Name, Language, Percentage from country, countrylanguage where Code=CountryCode AND language='Chinese' OR language="Japonese";
select * from PaisesFalantesLinguasChinesaEJaponesa;

-- c. Crie uma view para mostrar as cidades paulistas e cariocas com menos de 100000 habitantes.
create view cidadesPaulistasCariocas as
select city.Name from city, country where CountryCode=Code and city.Population<100000;
select * from cidadesPaulistasCariocas;

-- d. Crie uma view que exiba o nome do país e sua cidade CAPITAL 
-- (nome do país e todos os campos de cidade);
create view paisCapital as
select country.Name as Pais, city.Name as cidadeCapital, city.CountryCode, city.District, city.Population from city, country where CountryCode=Code and ID=Capital;
select * from paisCapital;

-- e. Crie uma view que mostre a língua OFICIAL de cada um dos países e exiba a porcentagem de falantes;
create view PaisLinguaOficial as
select country.Name as Pais, Percentage from country, countrylanguage where Code=CountryCode AND IsOfficial="T";
select * from PaisLinguaOficial;

-- f. Crie uma view que mostre a quantidade de países falantes de cada uma das línguas.
create view quantidadePaisesPorLingua as
select Language, count(country.Name) from countrylanguage, country where Code=CountryCode group by (Language);
select * from quantidadePaisesPorLingua;

-- g. Crie uma view que mostre a quantidade de países em cada um dos regimes governamentais.
CREATE VIEW PaisesRegimesGovernamentais as
select GovernmentForm, count(Name)  from country group by(GovernmentForm);
select * from PaisesRegimesGovernamentais;


-- h. Crie uma view que mostre a quantidade da população mundial;
create view populacaoMundial as
select sum(Population) as populacaoMundial from country;
select * from populacaoMundial;

-- i. Crie uma view que mostre cada um dos países e seu tamanho territorial;
create view paisTerritorio as
select Name, SurfaceArea from country;
select * from paisTerritorio;

-- j. Crie uma view que mostre a soma do tamanho territorial e
--  a quantidade de falantes de cada idioma;
create view SomaTerritorioEFalantesLingua as
select sum(SurfaceArea) as SomaTerritorio, sum(Population*Percentage) as QuantFalantes, Language
from country, countrylanguage where Code=CountryCode group by (Language);
select * from SomaTerritorioEFalantesLingua;

-- k. Crie uma view parecida com a anterior, porém, 
-- exiba somente a que população menor que 10 mil;
create view SomaTerritorioEFalantesLinguaMenos10K as
select sum(SurfaceArea) as SomaTerritorio, sum(Population*Percentage) as QuantFalantes, Language
from country, countrylanguage where Code=CountryCode and Population<10.000 group by (Language);
select * from SomaTerritorioEFalantesLinguaMenos10K;


select * from city;
select * from country;
select * from countrylanguage;
