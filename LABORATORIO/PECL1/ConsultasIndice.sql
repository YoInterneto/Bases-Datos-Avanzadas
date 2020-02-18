-- Database: MiBaseDatos

-- DROP DATABASE "MiBaseDatos";

CREATE DATABASE "MiBaseDatos"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	select * from pg_class where relname='ArbolMiTabla';
	
	select * from pgstatindex('"ArbolMiTabla"'::regclass);
	
	select * from bt_page_stats('"ArbolMiTabla"',500);
	
	create index "HashMiTabla" on "MiTabla" using HASH (puntos);
	create index "HashMiTablaPK" on "MiTabla" using HASH (id_cliente);
	
	
	select pg_relpages('"ArbolMiTabla"');
	
	
	
	
	delete from "MiTabla" where id_cliente>=0 and ;
	
	delete from "MiTabla" where id_cliente in (select id_cliente from "MiTabla" where id_cliente>0 limit 2000000);
	
	SELECT 
	relname AS ObjectName
	,pg_stat_get_live_tuples(c.oid) AS LiveTuples
	,pg_stat_get_dead_tuples(c.oid) AS DeadTuplesS
FROM pg_class c  ;

vacuum full "MiTabla";

select * from pg_class where oid=16622 or oid=16623 or oid=16625
or oid=16624 or oid=16614 or oid=16611 or oid=16610 or oid=16609
or oid=16562 or oid=16557 or oid=16616;

select * from pg_class where oid=16626;

select * from "MiTabla2";

update "MiTabla2"
set nombre='Juan', apellidos='Garcia',direccion='Barcelona',puntos=300 where id_cliente=4456535;

delete from "MiTabla2" where id_cliente=10;


insert into "MiTabla2" (id_cliente,nombre,apellidos,direccion,puntos) 
	values(10,'Pepe','Martinez','Bilbao',345);

select CTID from "MiTabla2" where id_cliente=10;

select * from pg_class;


create table "MiTabla3" (
    "id_cliente"         int ,
    "nombre"         text ,
    "apellidos"        text,
    "direccion"       text,
	"puntos"          int
) PARTITION BY HASH (puntos);

create table "particion0" partition of "MiTabla3" for values with (modulus 10, remainder 0);
create table "particion1" partition of "MiTabla3" for values with (modulus 10, remainder 1);
create table "particion2" partition of "MiTabla3" for values with (modulus 10, remainder 2);
create table "particion3" partition of "MiTabla3" for values with (modulus 10, remainder 3);
create table "particion4" partition of "MiTabla3" for values with (modulus 10, remainder 4);
create table "particion5" partition of "MiTabla3" for values with (modulus 10, remainder 5);
create table "particion6" partition of "MiTabla3" for values with (modulus 10, remainder 6);
create table "particion7" partition of "MiTabla3" for values with (modulus 10, remainder 7);
create table "particion8" partition of "MiTabla3" for values with (modulus 10, remainder 8);
create table "particion9" partition of "MiTabla3" for values with (modulus 10, remainder 9);



select count(*) from "particion9";


