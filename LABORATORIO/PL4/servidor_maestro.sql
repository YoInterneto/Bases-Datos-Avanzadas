--Creamos la extension
CREATE EXTENSION postgres_fdw;


create server tienda_alberto foreign data wrapper postgres_fdw
options(host '83.57.35.56', dbname 'Tienda2', port '5432');


create user mapping for postgres server tienda_alberto options(user 'postgres', password 'postgres'); 

create schema Tienda2;

import foreign schema public from server tienda_alberto into Tienda2;


select * from Tienda2."Tienda";

