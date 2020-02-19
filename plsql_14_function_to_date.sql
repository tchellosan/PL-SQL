clear scr;
set serveroutput on;

declare
	wdata date;
	wvalor number;
begin

	--wdata := to_date('21-FEV-09', 'DD-MON-YY');
	--wdata := to_date('05/21/81', 'MM/DD/YY');
	wdata := to_date('21/05/81', 'DD/MM/YY');
	dbms_output.put_line(wdata);

	dbms_output.put_line(to_date('010682', 'ddmmrr'));
	dbms_output.put_line(to_date('21.05.2009', 'dd.mm.yyyy'));
	dbms_output.put_line(to_date('April 21', 'month dd', 'nls_date_language=american'));
	dbms_output.put_line(to_date('Abril 21', 'month dd', 'nls_date_language=''BRAZILIAN PORTUGUESE'''));
--	dbms_output.put_line(to_date('Abril 21', 'month XX', 'nls_date_language=''BRAZILIAN PORTUGUESE'''));
	
	dbms_output.put_line('-');
	dbms_output.put_line(to_char(sysdate, 'DD/MM/YYYY HH24:MI:SS'));
	dbms_output.put_line(to_date('2008', 'yyyy'));
	dbms_output.put_line(to_date(60, 'ddd'));

	dbms_output.put_line('-');
	dbms_output.put_line(to_char(sysdate, 'dd/mm/yyyy'));
	dbms_output.put_line(to_char(to_date('01/01/49', 'dd/mm/yy'), 'dd/mm/yyyy'));	
	dbms_output.put_line(to_char(to_date('01/01/50', 'dd/mm/yy'), 'dd/mm/yyyy'));	
	dbms_output.put_line(to_char(to_date('01/01/49', 'dd/mm/rr'), 'dd/mm/rrrr'));	
	dbms_output.put_line(to_char(to_date('01/01/50', 'dd/mm/rr'), 'dd/mm/rrrr'));		

end;
/