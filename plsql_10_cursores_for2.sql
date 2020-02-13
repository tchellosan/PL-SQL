clear scr;
set serveroutput on;

begin
	for r1 in (
			select 
			a.nome, 
			a.salario, 
			b.nome as nome_depto
			from emp a
			inner join depto b
			on a.id_depto = b.id
			where a.id_depto >= 20
		) loop
		dbms_output.put_line(to_char(r1.salario, '9990.00') || ' - ' || r1.nome || ' - ' || r1.nome_depto );
--		exit when r1.salario = 8500.70;
		
		if r1.salario = 8500.70 then
			exit;
		end if;

	end loop;

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/