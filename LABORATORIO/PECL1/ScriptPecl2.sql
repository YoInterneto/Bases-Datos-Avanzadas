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