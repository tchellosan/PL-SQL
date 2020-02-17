clear scr;
set serveroutput on;

declare
	wsal_calc	number;

begin

	for r1 in (select nome, salario from emp) loop
		wsal_calc := (r1.salario / 2.7);
		dbms_output.put_line('Nome: ' || rpad(r1.nome, 15, ' ') || ' Salário: ' || wsal_calc);
	end loop;
	dbms_output.put_line('-');

	for r1 in (select nome, salario from emp) loop
		wsal_calc := (r1.salario / 2.7);
		dbms_output.put_line('Nome: ' || rpad(r1.nome, 15, ' ') || ' trunc(): ' || trunc(wsal_calc) || ' trunc(,2): ' || trunc(wsal_calc, 2));
	end loop;
	dbms_output.put_line('-');	

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/