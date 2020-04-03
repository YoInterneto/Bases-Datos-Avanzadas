select "Ticket_Productos".Codigo_de_barras_Productos from "Ticket_Productos" 

select count(Codigo_de_barras_Productos) from "Ticket_Productos";
--Consulta auxiliar
select nticket_ticket  from "Ticket_Productos" group by nticket_ticket
having count("Ticket_Productos".codigo_de_barras_productos)>4;

--Consulta 
explain (format json) (select "Trabajador".nombre,dni from "Trabajador" 
inner join "Ticket" on "Ticket"."codigo_trabajador_trabajador"="Trabajador".codigo_trabajador
inner join (select nticket_ticket  from "Ticket_Productos" group by nticket_ticket 
having count("Ticket_Productos".codigo_de_barras_productos)>4) as "ticket_valido" 
on "ticket_valido".nticket_ticket="Ticket".nticket inner join "Ticket_Productos" on
"ticket_valido".nticket_ticket="Ticket_Productos".nticket_ticket
inner join "Productos"  on "Productos".codigo_de_barras="Ticket_Productos".codigo_de_barras_productos
where (fecha between '2019-09-01' and '2019-12-31') and precio>500
union
select "Trabajador".nombre,dni from "Trabajador" inner join
"Tienda" on "Tienda".id_tienda="Trabajador".id_tienda_tienda
inner join "Tienda_Productos" on "Tienda_Productos".id_tienda_tienda="Tienda".id_tienda
inner join "Productos" on "Productos".codigo_de_barras="Tienda_Productos".codigo_de_barras_productos
where (salario between 3000 and 5000) and
provincia='Madrid' and stock<100 and precio>400)
 ----------------
 
 
 
select "Trabajador".nombre,dni from "Trabajador" 
inner join "Ticket" on "Ticket"."codigo_trabajador_trabajador"="Trabajador".codigo_trabajador
inner join (select nticket_ticket  from "Ticket_Productos" group by nticket_ticket 
having count("Ticket_Productos".codigo_de_barras_productos)>4) as "ticket_valido" 
on "ticket_valido".nticket_ticket="Ticket".nticket inner join "Ticket_Productos" on
"ticket_valido".nticket_ticket="Ticket_Productos".nticket_ticket
inner join "Productos"  on "Productos".codigo_de_barras="Ticket_Productos".codigo_de_barras_productos
where (fecha between '2019-09-01' and '2019-12-31') and precio>500
union
select "Trabajador".nombre,dni from "Trabajador" inner join
"Tienda" on "Tienda".id_tienda="Trabajador".id_tienda_tienda
inner join "Tienda_Productos" on "Tienda_Productos".id_tienda_tienda="Tienda".id_tienda
inner join "Productos" on "Productos".codigo_de_barras="Tienda_Productos".codigo_de_barras_productos
where (salario between 3000 and 5000) and
provincia='Madrid' and stock<100 and precio>400


--Crear indices

Create index btree_dni on "Trabajador"(dni);
Create index btree_nombre on "Trabajador"(nombre);
Create index btree_codigo_trabajador_trabajador on "Ticket"(codigo_trabajador_trabajador);
Create index btree_codigo_trabajador on "Trabajador"(codigo_trabajador);
Create index btree_nticket_ticket on "Ticket_Productos"(nticket_ticket);
Create index btree_nticket on "Ticket"(nticket);
Create index btree_codigo_de_barras_productos on "Ticket_Productos"(codigo_de_barras_productos);
Create index btree_codigo_de_barras on "Productos"(codigo_de_barras);
Create index btree_id_tienda on "Tienda"(id_tienda);
Create index btree_id_tienda_tienda on "Trabajador"(id_tienda_tienda);
Create index btree_id_tienda_tienda_productos on "Tienda_Productos"(id_tienda_tienda);
Create index btree_codigo_de_barras_productos_tienda on "Tienda_Productos"(codigo_de_barras_productos);

select * from pg_indexes

 
 select count(*) from "Trabajador" inner join
"Tienda" on "Tienda".id_tienda="Trabajador".id_tienda_tienda where provincia='Madrid'
inner join "Tienda_Productos" on "Tienda_Productos".id_tienda_tienda="Tienda".id_tienda
inner join "Productos" on "Productos".codigo_de_barras="Tienda_Productos".codigo_de_barras_productos
where (salario between 3000 and 5000) 
provincia='Madrid' and stock<100 and precio>400

select id_tienda from "Tienda";

select count(*) from "Trabajador" 


((salario=>3000 or salario<=5000) and provincia='Madrid'and stock<100 and precio>400)


select count(*) from "Tienda_Productos";
---Pregunta 12
delete top 100000 from "Tienda";
alter table "Tienda_Productos" add foreign key(id_tienda_tienda) references "Tienda"(id_tienda) on delete cascade
alter table "Trabajador" add foreign key(id_tienda_tienda) references "Tienda"(id_tienda) on delete cascade


select fecha from "Ticket"

select count(nticket_ticket) from "Ticket_Productos"

select count(codigo_de_barras_productos) from "Ticket_Productos" group by nticket_ticket
having count(codigo_de_barras_productos)>1


vacuum analyze "Productos";
vacuum analyze "Ticket";
vacuum analyze "Ticket_Productos";
vacuum analyze "Tienda";
vacuum analyze "Tienda_Productos";
vacuum analyze "Trabajador";


Reindex index btree_dni;
Reindex index btree_codigo_trabajador_trabajador;
Reindex index btree_nombre;
Reindex index btree_codigo_trabajador;
Reindex index btree_nticket_ticket;
Reindex index btree_nticket;
Reindex index btree_codigo_de_barras_productos;
Reindex index btree_codigo_de_barras;
Reindex index btree_id_tienda;
Reindex index btree_id_tienda_tienda;
Reindex index btree_id_tienda_tienda_productos;
Reindex index btree_codigo_de_barras_productos_tienda;



