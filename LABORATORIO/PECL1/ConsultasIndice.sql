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