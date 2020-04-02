ALTER TABLE "Productos" DISABLE TRIGGER ALL;
ALTER TABLE "Ticket" DISABLE TRIGGER ALL;
ALTER TABLE "Ticket_Productos" DISABLE TRIGGER ALL;
ALTER TABLE "Tienda" DISABLE TRIGGER ALL;
ALTER TABLE "Tienda_Productos" DISABLE TRIGGER ALL;
ALTER TABLE "Trabajador" DISABLE TRIGGER ALL;

ALTER TABLE "Productos" ENABLE TRIGGER ALL;
ALTER TABLE "Ticket" ENABLE TRIGGER ALL;
ALTER TABLE "Ticket_Productos" ENABLE TRIGGER ALL;
ALTER TABLE "Tienda" ENABLE TRIGGER ALL;
ALTER TABLE "Tienda_Productos" ENABLE TRIGGER ALL;
ALTER TABLE "Trabajador" ENABLE TRIGGER ALL;

select * from "Tienda"

select * from "Productos";

select * from "Tienda_Productos";

truncate "Tienda"

select * from "Ticket";

copy "Ticket" from 'C:\tickets.txt' with delimiter as ';' 
---copy "Ticket" from 'C:\prueba1.txt' with delimiter as ';' ---Falta cambiar la fecha 


copy "Ticket_Productos" from 'C:\tickets_productos.txt' with delimiter as ';' 

select * from "Ticket";
delete from "Ticket";

select * from "Tienda_Productos"
delete from "Tienda_Productos";

select * from "Ticket_Productos"
delete from "Ticket_Productos";

