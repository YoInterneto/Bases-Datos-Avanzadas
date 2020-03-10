-- Table: public.trabaja_proyectos

-- DROP TABLE public.trabaja_proyectos;

CREATE TABLE public.trabaja_proyectos
(	numero_empleado_fk numeric NOT NULL,
 	numero_proyecto_fk numeric NOT NULL,
 	horas numeric,
 	CONSTRAINT "trabaja_proyectos_pk" PRIMARY KEY (numero_empleado_fk,numero_proyecto_fk)
);

ALTER TABLE public.trabaja_proyectos ADD CONSTRAINT "empleados_fk" FOREIGN KEY (numero_empleado_fk)
REFERENCES public.empleados (numero_empleado) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.trabaja_proyectos ADD CONSTRAINT "proyectos_fk" FOREIGN KEY (numero_proyecto_fk)
REFERENCES public.proyectos (numero_proyecto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

TABLESPACE pg_default;

ALTER TABLE public.trabaja_proyectos
    OWNER to postgres;
	
	
	
	
select distinct nombre from "empleados";	


select * from pg_stats where tablename='proyectos' or tablename='empleados' or tablename='trabaja_proyectos';


create tablespace bloques location 'C:\Users\Javier\Desktop\INFORMATICA';

alter tablespace bloques set (seq_page_cost=1, random_page_cost=1 );

alter tablespace bloques1 set( seq_page_cost(1));

random_page_cost (1);

cpu_tuple_cost (0);
cpu_index_tuple_cost (0)
cpu_operator_cost (0);
parallel_setup_cost (0);
parallel_tuple_cost (0);
min_parallel_table_scan_size (0);
min_parallel_index_scan_size (0);
effective_cache_size (0);
jit_above_cost (0);
jit_inline_above_cost (0);
jit_optimize_above_cost (0);


