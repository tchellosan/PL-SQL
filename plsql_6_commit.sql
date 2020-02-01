clear scr;
set serveroutput on;
set autoprint off;
--
update stg_vendedor
	set des_vendedor = 'marcelo silva'
	where cod_vendedor = 1
	
	commit