clear scr;
set serveroutput on;

declare
	wsalario	varchar2(50);

begin
	for r1 in (select ename, sal from emp) loop
		--wsalario := to_char(r1.sal, '9G999G990D00', 'nls_numeric_characters=,.');
		wsalario := to_char(r1.sal, '9G999G990D00');
		dbms_output.put_line('Nome: ' || rpad(r1.ename, 10, ' ') || ' | ' || wsalario);
	end loop;
	dbms_output.put_line('---');

	for r1 in (
		select count(*) as qtd_admin, to_char(hiredate, 'month') as mes
		from emp
		group by to_char(hiredate, 'mm'), to_char(hiredate, 'month')
		order by to_char(hiredate, 'mm')
	) loop
		dbms_output.put_line('Admitidos: ' || rpad(r1.qtd_admin, 10, ' ') || ' | ' || r1.mes);
	end loop;
	dbms_output.put_line('---');

	for r1 in (
		select count(*) as qtd_admin, substr(hiredate, 4, 2) as mes
		from emp
		group by substr(hiredate, 4, 2)
		order by substr(hiredate, 4, 2)
	) loop
		dbms_output.put_line('Admitidos: ' || rpad(r1.qtd_admin, 10, ' ') || ' | ' || r1.mes);
	end loop;	
	dbms_output.put_line('---');

	dbms_output.put_line('19 de fevereiro de 2020 será o dia: ' || to_char(to_char(to_date('19/02/2020', 'dd/mm/yyyy'),'fmddd'), '999'));
	dbms_output.put_line('---');
	
	for r1 in (select ename, hiredate from emp) loop
		dbms_output.put_line('Nome: ' || rpad(r1.ename, 10, ' ') || ' | Adimissão: ' || to_char(r1.hiredate, 'day'));
	end loop;
	dbms_output.put_line('---');
	
	dbms_output.put_line('São Paulo, ' || to_char(current_date, 'dd') || ' de ' || to_char(current_date, 'fmmonth') || ' de ' || to_char(current_date, 'yyyy') || '.');
	dbms_output.put_line('---');
	
	for r1 in (
		select ename, to_char(hiredate, 'dd/mm/yyyy') as data
		from emp
		where to_char(hiredate, 'yyyy') = '1982'
		order by hiredate
	) loop
		dbms_output.put_line('Nome: ' || rpad(r1.ename, 10, ' ') || ' | Data: ' || r1.data);
	end loop;	
	dbms_output.put_line('---');

	for r1 in (select sal from emp) loop
		dbms_output.put_line('Salário: R$ ' || to_char(r1.sal, 'fm9G999G990D00'));
	end loop;		
	dbms_output.put_line('---');

	for r1 in (select sal from emp) loop
		dbms_output.put_line('Salário: ' || to_char(r1.sal, 'fmL9G999G990D00'));
	end loop;			

	dbms_output.put_line('---');	
	dbms_output.put_line('Positivo: ' || to_char(174984283.75, 'fmS999,999,990.00'));
	dbms_output.put_line('Negativo: ' || to_char(-174984283.75, 'fmS999,999,990.00'));

end;
/