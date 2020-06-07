--Creamos la extension
CREATE EXTENSION postgres_fdw;


create server tienda_alberto3 foreign data wrapper postgres_fdw
options(host '83.58.64.201', dbname 'Tienda2', port '5432');


create user mapping for postgres server tienda_alberto3 options(user 'postgres', password 'postgres'); 

create schema Tienda3;

import foreign schema public from server tienda_alberto3 into Tienda3;


select * from Tienda3."Tienda";
select * from "Tienda";



select * from "Trabajador";
select * from "Ticket";

insert into "Trabajador" values(3,'46675677H', 'Fernando','Lopez','Dependiente',2000,59); 
insert into "Trabajador" values(4,'46378977H', 'Antonio','Rodriguez','Reponedor',3000,58); 
insert into "Trabajador" values(5,'46344877H', 'Carlos','Garcia','Informatico',4500,58); 

insert into "Ticket" values(78901,15, '07/06/2020','4');
insert into "Ticket" values(12345,55, '04/04/2020','2');
insert into "Ticket" values(23456,66, '06/07/2020','3');
insert into "Ticket" values(45678,99, '08/08/2020','5');


insert into "Productos" values(816190,'producto1','menaje','mala',52)
insert into "Productos" values(554444,'producto2','cosmetica','buena',24)
insert into "Productos" values(111111,'producto3','alimentacion','regular',11)
insert into "Productos" values(222222,'producto2','limpieza','mala',25)
insert into "Productos" values(333333,'producto4','deporte','buena',150)

select * from "Productos";


insert into "Ticket_Productos" values(54300,333333,6);
insert into "Ticket_Productos" values(223560,1,7);
insert into "Ticket_Productos" values(78901,816190,8);
insert into "Ticket_Productos" values(12345,554444,9);
insert into "Ticket_Productos" values(23456,111111,10);
insert into "Ticket_Productos" values(45678,222222,11);

select * from "Ticket_Productos";

insert into "Tienda_Productos" values(1,333333,25);
insert into "Tienda_Productos" values(2,554444,58);
insert into "Tienda_Productos" values(59,816190,96);
insert into "Tienda_Productos" values(1000,222222,36);
insert into "Tienda_Productos" values(1000,111111,47);



explain (format json)(select "Trabajador"."Nombre","Tienda"."Nombre" from "Trabajador" inner join "Tienda" on "Id_tienda"="Id_tienda_Tienda"
inner join "Tienda_Productos" on "Id_tienda"="Tienda_Productos"."Id_tienda_Tienda" inner join "Productos"
on "Codigo de barras_Productos"="Codigo de barras" 
inner join "Ticket_Productos" on "Ticket_Productos"."Codigo de barras_Productos"="Codigo de barras")
union
(select Tienda3."Trabajador"."Nombre",Tienda3."Tienda"."Nombre" from Tienda3."Trabajador" 
 inner join Tienda3."Tienda" on "Id_tienda"="Id_tienda_Tienda"
inner join Tienda3."Tienda_Productos" on "Id_tienda"=Tienda3."Tienda_Productos"."Id_tienda_Tienda" 
 inner join Tienda3."Productos"
on "Codigo de barras_Productos"="Codigo de barras" 
inner join Tienda3."Ticket_Productos" on Tienda3."Ticket_Productos"."Codigo de barras_Productos"="Codigo de barras")
;











