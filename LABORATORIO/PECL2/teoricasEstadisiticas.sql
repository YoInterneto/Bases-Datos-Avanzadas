select * from pg_stats where tablename='empleados' or tablename='proyectos' or tablename='trabaja_proyectos';

UPDATE STATISTICS ;
select max(salario) from "empleados"


select * from pg_stats where tablename='trabaja_proyectos';

select  count(distinct numero_empleado_fk) from "trabaja_proyectos"
select  count(distinct numero_empleado) from "empleados"

select count(*) from "proyectos"
select count(*) from "trabaja_proyectos"
select count(*) from "empleados"

select min(coste) from "proyectos"
select max(coste) from "proyectos"

select count(*) from "empleados" where salario=24000

select count(*) from "trabaja_proyectos" where horas<2

select count(*) from "proyectos" where coste<=15000


select count(distinct horas) from "trabaja_proyectos";

select count(distinct salario) from "empleados";

select count(distinct coste) from "proyectos";



