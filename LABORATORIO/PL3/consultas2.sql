--Pregunta 11
set role usuario2;

select "fecha","Trabajador"."Nombre","Ciudad","Id_tienda" from "Tienda" inner join "Trabajador" on "Id_tienda_Tienda"="Id_tienda" 
inner join "Ticket" on "codigo_trabajador" = "codigo_trabajador_Trabajador";

select * from txid_current();

select * from txid_current_snapshot();
