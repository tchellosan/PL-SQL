clear scr;
set serveroutput on;

declare
	wdata date;
	wvalor number;
begin
						 
	--dbms_output.put_line(to_number('4,569,900.87', '9G999G999D00'));
	--dbms_output.put_line(to_number('4.569.900,87', '9G999G999D00'));
	dbms_output.put_line(to_number('R$4.569.900,87', 'L9G999G999D00', 'nls_numeric_characters=,.'));
end;
/