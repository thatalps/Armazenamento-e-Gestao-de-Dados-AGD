insert into empresa values (1, 'aviadora-1');
insert into empresa values (2, 'aviadora-2');
insert into empresa values (3, 'aviadora-3');
insert into empresa values (4, 'aviadora-4');
insert into empresa values (5, 'aviadora-5');
select * from empresa;

insert into aviao values(1,1,'Boeing 731 pequeno', 30);
insert into aviao values(2,2,'Boeing 732 pequeno', 30);
insert into aviao values(3,3,'Boeing 733 medio', 40);
insert into aviao values(4,4,'Boeing 734 medio', 40);
insert into aviao values(5,5,'Boeing 735 grande', 50);
select * from aviao;

insert into voo values (1,1);
insert into voo values (2,2);
insert into voo values (3,3);
insert into voo values (4,4);
insert into voo values (5,5);
select * from voo;

insert into trecho values('Rio de janeiro', 'Sao Paulo', 100);
insert into trecho values('Rio de janeiro', 'Belo Horizonte', 200);
insert into trecho values('Rio de janeiro', 'Paraná', 500);
insert into trecho values('Sao Paulo','Rio de janeiro', 100);
insert into trecho values('Sao Paulo', 'Belo Horizonte', 300);
select * from trecho;


insert into rota values(1, 'Rio de janeiro', 'Sao Paulo', 1, '2024-01-01 10:11', '2024-01-01 11:11');
insert into rota values(2, 'Rio de janeiro', 'Sao Paulo', 2, '2024-01-01 10:22', '2024-01-01 12:22');
insert into rota values(3, 'Rio de janeiro', 'Sao Paulo', 3, '2024-01-01 10:33', '2024-01-01 13:33');
insert into rota values(4, 'Sao Paulo', 'Rio de janeiro', 4, '2024-01-01 10:44', '2024-01-01 14:44');
insert into rota values(5, 'Sao Paulo', 'Rio de janeiro', 5, '2024-01-01 10:55', '2024-01-01 15:55');
select * from rota;

insert into viagem values (1, '2024-01-01', 1, '2024-01-01 10:20', '2024-01-01 11:20');
insert into viagem values (2, '2024-01-01', 2, '2024-01-01 10:25', '2024-01-01 12:25');
insert into viagem values (3, '2024-01-01', 3, '2024-01-01 10:35', '2024-01-01 13:35');
insert into viagem values (4, '2024-01-01', 4, '2024-01-01 10:45', '2024-01-01 14:45');
insert into viagem values (5, '2024-01-01', 5, '2024-01-01 10:59', '2024-01-01 15:59');
select * from viagem;