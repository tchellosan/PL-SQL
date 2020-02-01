clear scr;
set serveroutput on;
set autoprint off;
--
update stg_vendedor
	set des_vendedor = 'sem nome'
	
	rollback
