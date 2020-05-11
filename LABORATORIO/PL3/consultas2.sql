--Pregunta 11
set role usuario2;

select * from "Tienda";

select "fecha","Trabajador"."Nombre","Tienda"."Nombre","Ciudad","Id_tienda" from "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda" 
inner join "Ticket" on "codigo_trabajador" = "codigo_trabajador_Trabajador";

select * from txid_current();

select * from txid_current_snapshot();

--Pregunta 16
set role usuario1;

insert into "Tienda" values(31145,'Tienda10', 'Cadiz','Puerto de Santa Maria','Andalucia'); 
insert into "Trabajador" values(45678,'24789688X', 'Ana','Gonzalez','Dependiente',2000,31145); 


--Pregunta 17
set role usuario2;

--Pregunta 17-19
begin;
update "Tienda" set "Nombre"='Tienda Alcala' where "Id_tienda"=31145;
update "Trabajador" set "Puesto"='Capataz' where "codigo_trabajador"=45678;

commit;

select * from  "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda";


select "Trabajador"."Nombre","Tienda"."Nombre","Ciudad","Id_tienda" from "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda" 

select current_user;

select * from pg_stat_activity;

--Pregunta 23
set role usuario2;
begin;
update "Tienda" set "Nombre"='Saturn' where "Id_tienda"=6789;
commit;

select * from "Tienda";




