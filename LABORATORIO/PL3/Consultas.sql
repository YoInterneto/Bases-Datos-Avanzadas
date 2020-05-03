insert into "Tienda" values(1,'Tienda1', 'Madrid','Vicalvaro','Madrid'); 


drop user usuario1;
drop user usuario2;

create user usuario1 with password 'passusuario1';

create user usuario2 with password 'passusuario2';

grant select,update on "Tienda" to usuario1;

grant select,update on "Tienda" to usuario2;


--grant select,update on "Tienda" to usuario2;

begin;
insert into "Tienda" values(2,'Tienda2', 'Barcelona','Canaletas','Catalunya'); 
select * from "Tienda";



select procpid,datname,usename,current_query,client_addr,client_port
from pg_stat_activity;
select pg_cancel_backend(procpid);


