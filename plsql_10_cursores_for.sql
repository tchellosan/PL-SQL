clear scr;
set serveroutput on;

declare
	cursor c1(pid_depto number) is
		select 
		a.nome, 
		a.salario, 
		b.nome as nome_depto
		from emp a
		inner join depto b
		on a.id_depto = b.id
		where a.id_depto >= pid_depto;

begin

	for r1 in c1(pid_depto => 20) loop
		dbms_output.put_line(to_char(r1.salario, '9990.00') || ' - ' || r1.nome || ' - ' || r1.nome_depto );
	end loop;

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/