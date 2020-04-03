select "Ticket_Productos".Codigo_de_barras_Productos from "Ticket_Productos" 

select count(Codigo_de_barras_Productos) from "Ticket_Productos"

select nombre,Dni from "Trabajador" inner join "Ticket" on "Ticket"."codigo_trabajador_Trabajador"="Trabajador".codigo_trabajdor
inner join "Ticket_productos" on "Ticket_productos".NTicket_ticket="Ticket"_NTicket inner join "Productos"  on 
"Productos".Codigo_de_barras="Ticket_Productos".Codigo_de_barras_Productos
where fecha>=2019-09-01 and  (select count(codigo_de_barras_productos) from "Ticket_Productos" group by nticket_ticket
having count(codigo_de_barras_productos)>1)>4 and "Productos".precio>500 and ("Trabajador".salario>=3000 or "Trabajador".salario<=5000) and
provincia='Madrid'--falta inner join tienda con productos y seguir

select fecha from "Ticket"

select count(nticket_ticket) from "Ticket_Productos"

select count(codigo_de_barras_productos) from "Ticket_Productos" group by nticket_ticket
having count(codigo_de_barras_productos)>1