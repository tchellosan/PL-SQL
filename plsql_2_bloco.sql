clear scr;
set serveroutput on;

declare
	soma number default 0;
begin
	soma	:= 45 + 55;
	dbms_output.put_line('soma: ' || soma);
exception
	when others then
		raise_application_error(-20001, 'erro ao somar os valores.');
end;
/