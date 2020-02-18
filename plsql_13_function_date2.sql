clear scr;
set serveroutput on;

declare
	wdt_termino_exp	date;
	wqt_meses_Trab	number;

	cursor c1 is
		select 
		e.ename,
		d.dname,
		to_char(e.hiredate, 'dd/mm/yyyy') as hiredate,
		to_char(add_months(e.hiredate, 500), 'dd/mm/yyyy') as plus500
		from emp e, dept d
		where e.deptno = d.deptno
		order by e.hiredate;

begin

	for r1 in c1 loop
		wdt_termino_exp := 	add_months(r1.hiredate, 3);
		wqt_meses_Trab	:=	to_char(months_between(current_date, r1.hiredate), '990D00');
		
		dbms_output.put_line(
			' Nome: ' || rpad(r1.ename, 6, ' ') || 
--			' Depto: ' || rpad(r1.dname, 10, ' ') || 
			' Adm: ' || r1.hiredate ||
			' Term Exp: ' || to_char(wdt_termino_exp, 'dd/mm/yyyy') ||
			' Qtd Mes Trab: ' || wqt_meses_Trab
			);

	end loop;			

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/