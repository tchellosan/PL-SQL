clear scr;
set serveroutput on;

begin
	for n in reverse 1..10 loop
		dbms_output.put_line('5 x ' || n || ' = ' || 5 * n);
	end loop;	
end;
/