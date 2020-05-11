insert into "Tienda" values(1,'Tienda1', 'Madrid','Vicalvaro','Madrid'); 


drop user usuario1;
drop user usuario2;

--Pregunta 7
create user usuario1 with password 'passusuario1';
create user usuario2 with password 'passusuario2';

grant select,update,delete,insert on all tables in schema public to usuario1;
grant select,update,delete,insert on all tables in schema public to usuario2;

revoke all privileges on all tables in schema public from usuario1;
revoke all privileges on all tables in schema public from usuario2;


delete from "Tienda" where "Id_tienda"=2;


--Pregunta 8
begin;
insert into "Tienda" values(2,'Tienda2', 'Barcelona','Canaletas','Catalunya'); 
select * from "Tienda";
commit;

select * from txid_current();
select * from txid_current_snapshot();


delete from "Tienda" where "Id_tienda"=4;
delete from "Trabajador" where "Nombre"='Siro';
delete from "Ticket" where "Importe"=15;

set role postgres;
--Pregunta 9
set role usuario1;
begin;
insert into "Tienda" values(1000,'Tienda3', 'Sevilla','Giralda','Andalucia'); 
insert into "Trabajador" values(1,'46345677H', 'Siro','Lopez','Dependiente',2000,1000); 
insert into "Ticket" values(1,15, '05/05/2020','1'); 
commit;

begin;
insert into "Tienda" values(4,'Tienda4', 'Sevilla','Giralda','Andalucia'); 

select * from "Tienda";

select * from txid_current();
select * from txid_current_snapshot();


--Pregunta 10
select "fecha","Trabajador"."Nombre","Ciudad","Id_tienda" from "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda" 
inner join "Ticket" on "codigo_trabajador" = "codigo_trabajador_Trabajador";


--Pregunta 14
begin;
insert into "Tienda" values(2000,'Tienda4', 'Madrid','Barrio Salamanca','Madrid'); 
insert into "Trabajador" values(2,'46345688K', 'Roberto','Martinez','Encargado',3500,2000); 
insert into "Ticket" values(54300,40, '06/05/2020','2');
update "Trabajador" set "Id_tienda_Tienda"=1000 where "Id_tienda_Tienda"=2000;
commit;

select "fecha","Trabajador"."Nombre","Ciudad","Id_tienda" from "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda" 
inner join "Ticket" on "codigo_trabajador" = "codigo_trabajador_Trabajador";

--Pregunta 15
begin;
insert into "Tienda" values(5,'Tienda5', 'Barcelona','Diagonal','Catalunya'); 
insert into "Trabajador" values(3,'53645688D', 'Diego','Alonso','Mozo',1750,5); 
insert into "Ticket" values(10,85, '06/06/2020','3');
rollback;

select current_user;


select * from  "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda";

select "fecha","Trabajador"."Nombre","Ciudad","Id_tienda","Salario" from "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda" 
inner join "Ticket" on "codigo_trabajador" = "codigo_trabajador_Trabajador";

--Pregunta 18-20

set role usuario1;
begin;
update "Trabajador" set "Salario"=3000 where "codigo_trabajador"=45678;
update "Tienda" set "Barrio"='El Ensanche' where "Id_tienda"=31145;

commit;

--Pregunta 22
set role usuario1;
insert into "Tienda" values(6789,'Tienda13', 'Coslada','Central','Madrid'); 

begin;
update "Tienda" set "Nombre"='Mediamarkt' where "Id_tienda"=6789;
commit;

select * from "Tienda" where "Id_tienda"=6789;








