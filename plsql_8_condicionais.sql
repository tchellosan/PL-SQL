clear scr;
set serveroutput on;

declare
	x	number	:=	13;
	res	number	:=	0;
begin
	res := mod(x, 5);

	if res = 1 then
		dbms_output.put_line('RESTO UM');
	elsif res = 2 then
		dbms_output.put_line('RESTO DOIS');
	else
		dbms_output.put_line('RESTO MAIOR QUE DOIS');
	end if;		

	dbms_output.put_line('Resultado: ' || res);
end;
/