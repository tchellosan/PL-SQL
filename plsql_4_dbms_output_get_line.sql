clear scr;
set serveroutput off;

begin
	dbms_output.enable(2000);
	dbms_output.put('como ');
	dbms_output.new_line;
	dbms_output.put('aprender ');
	dbms_output.new_line;    
	dbms_output.put('pl/sql? ');
	dbms_output.new_line;        
end;
/

clear scr;
set serveroutput on;

declare
	var1  	varchar2(100) 	default null;
	var2 	varchar2(100) 	default null;
	var3 	varchar2(100) 	default null;
	status 	number 			default null;
begin
	dbms_output.get_line(var1, status);
	dbms_output.get_line(var2, status);
	dbms_output.get_line(var3, status);
	dbms_output.put_line('pergunta: ' || var1 || ' ' || var2 || ' ' || var3);
end;
/