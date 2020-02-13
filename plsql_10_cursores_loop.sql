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

--	r1 emp%rowtype;
	r1 c1%rowtype;

begin
--	open c1(0);
	open c1(pid_depto => 20);

	loop
		fetch c1 into r1;
		exit when c1%notfound;

		dbms_output.put_line(to_char(r1.salario, '9990.00') || ' - ' || r1.nome || ' - ' || r1.nome_depto );
	end loop;

	close c1;

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/