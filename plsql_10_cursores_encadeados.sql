clear scr;
set serveroutput on;

declare

	cursor c1 is
		select
		id, 
		nome
		from depto
		order by nome asc;

	r1 c1%rowtype;		

	cursor c2(pid_depto number) is
		select
		id, 
		nome,
		salario
		from emp
		where id_depto = pid_depto
		order by nome asc;

	r2 c2%rowtype;			

begin

	for r1 in c1 loop
		dbms_output.put_line(r1.id || ' - ' || r1.nome);

		open c2(pid_depto => r1.id);

		fetch c2 into r2;

		if c2%notfound then
			dbms_output.put_line('===> Departamento sem funcionario cadastrado');
		else
			loop
				dbms_output.put_line('===> ' || r2.id || ' - ' || r2.nome || ' - ' || to_char(r2.salario, '9990.00'));
				fetch c2 into r2;
				exit when c2%notfound;
			end loop;												
		end if;

		close c2;

	end loop;

	exception	
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/