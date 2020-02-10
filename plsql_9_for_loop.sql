clear scr;
set serveroutput on;

declare
	ini	number(2)	default 1;
	fim	number(2)	default 10;

begin
	for n in ini..fim loop
		dbms_output.put_line('Tabuada: ' || n);

		for m in ini..fim loop
			if	mod(n, 2) = 0 and mod(m, 2) = 0 then
				dbms_output.put_line(n || ' x ' || m || ' = ' || n * m);
			end if;				
		end loop;

		dbms_output.put_line('-');
		dbms_output.put_line('-');
	end loop;	
end;
/
