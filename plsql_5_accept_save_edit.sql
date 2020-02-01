clear scr;
set serveroutput on;
set autoprint off;

accept dcod_vendedor number for 999 default 20 prompt "Informe dcod_vendedor: "
select * from stg_vendedor
where cod_vendedor > &dcod_vendedor
order by cod_vendedor asc

--
save pl_sql_9c.sql
--
edit pl_sql_9c.sql