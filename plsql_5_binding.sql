clear scr;
set serveroutput on;
set autoprint off;

variable mensagem varchar2(200);

begin
	:mensagem := 'curso pl_sql';
end;
/

begin
	dbms_output.put_line(:mensagem);
end;
/