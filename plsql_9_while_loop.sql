clear scr;
set serveroutput on;

declare
	n			number			default 0;
	label_vert	varchar2(240)	default '&label';
	tam_label	number			default 0;

begin
	tam_label := length(label_vert);

	while(n < tam_label) loop
		n := n + 1;
		dbms_output.put_line(substr(label_vert, n, 1));
	end loop;
end;
/