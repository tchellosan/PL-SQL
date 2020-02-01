clear scr;
set serveroutput on;
set autoprint off;

select * from stg_vendedor
where cod_vendedor = :bcod_vendedor

select * from stg_vendedor
where cod_vendedor = &dcod_vendedor

select * from stg_vendedor
where cod_vendedor = &&dcod_vendedor

select * from stg_vendedor
where cod_vendedor > &1
order by cast(cod_vendedor as number) &2