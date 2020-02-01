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
    dbms_output.put('você sabe? ');
    dbms_output.new_line;            
end;
/

clear scr;
set serveroutput on;

declare
	tab		dbms_output.chararr;
	qtlines	number			default	3;
	res		varchar2(100) 	default null;
begin
	dbms_output.get_lines(tab, qtlines);
	dbms_output.put_line('retornou: ' || qtlines || ' registros' );

	for i in 1..qtlines loop
		res := res || ' ' || tab(i);
	end loop;
	dbms_output.put_line('pergunta: ' || res);
end;
/