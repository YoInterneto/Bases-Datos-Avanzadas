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


delete from "Tienda" where "Id_tienda"=1000;
delete from "Trabajador" where "Nombre"='Siro';
delete from "Ticket" where "Importe"=15;

set role postgres;
--Pregunta 9
begin;
insert into "Tienda" values(1000,'Tienda3', 'Sevilla','Giralda','Andalucia'); 
insert into "Trabajador" values(1,'46345677H', 'Siro','Lopez','Dependiente',2000,1000); 
insert into "Ticket" values(1,15, '05/05/2020','1'); 
commit;

select * from txid_current();
select * from txid_current_snapshot();


--Pregunta 10
select "fecha","Trabajador"."Nombre","Ciudad","Id_tienda" from "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda" 
inner join "Ticket" on "codigo_trabajador" = "codigo_trabajador_Trabajador";










