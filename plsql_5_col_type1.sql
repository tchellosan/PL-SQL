clear scr;
set serveroutput on;
set autoprint off;

declare
	wk_des stg_vendedor.des_vendedor%type;
	
begin
	select des_vendedor into wk_des from stg_vendedor where rownum <= 50;
	dbms_output.put_line(wk_des);
	exception
		when no_data_found then
			dbms_output.put_line('USER: Dados não encontrados.');		
		when too_many_rows then
			dbms_output.put_line('USER: Retornou mais de um registro.');
		when others then
			dbms_output.put_line(sqlerrm);
end;
/