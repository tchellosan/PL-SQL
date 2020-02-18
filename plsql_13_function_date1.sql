clear scr;
set serveroutput on;

declare
	wdt_admissao	date;
	wsexta			date;

	cursor c1 is
		select 
		first_name,
		hire_date
		from employees
		where to_char(hire_date, 'mm') = to_char(current_date, 'mm')
		order by hire_date;

begin

	for r1 in c1 loop
		wdt_admissao 	:= to_date(to_char(r1.hire_date, 'dd/mm')||'/'||to_char(current_date,'rrrr'),'dd/mm/rrrr');
		wsexta			:= next_day(to_date(to_char(r1.hire_date, 'dd/mm')||'/'||to_char(current_date,'rrrr'),'dd/mm/rrrr'), 'SEXTA');

		dbms_output.put_line('Nome: ' || rpad(r1.first_name, 10, ' ') || ' | Dt. Admissão: ' || wdt_admissao || ' | Folga: ' || wsexta);

	end loop;			

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/