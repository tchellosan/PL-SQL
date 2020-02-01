clear scr;
set serveroutput on;
set autoprint off;

declare
	
begin
	for i in(select des_vendedor from stg_vendedor /*where cod_vendedor = 0*/) loop
		dbms_output.put_line(i.des_vendedor);
	end loop;
end;
/