clear scr;
set serveroutput on;

declare

	cursor c1 is
		select 
		b.id as id_depto,
		b.nome as nome_depto,
		count(a.salario) as qtde_func,
		sum(a.salario) as total_salario,
		avg(a.salario) as media_salario,
		min(a.salario) as min_salario,
		max(a.salario) as max_salario
		from emp a
		inner join depto b
		on a.id_depto = b.id
		group by b.id, b.nome
		having count(a.salario) >= 2
		order by sum(a.salario);

	cursor c2(pid_depto number) is
		select 
		id,
		nome,
		salario
		from emp
		where id_depto = pid_depto
		order by salario;

begin

	for r1 in c1 loop
		dbms_output.put_line('Nome: ' || rpad(upper(r1.nome_depto), 15, ' '));
		dbms_output.put_line('Qtde: ' || r1.qtde_func);
		dbms_output.put_line('Total Salario: ' || lpad(to_char(r1.total_salario, 'fm999G990D00'), 10, ' '));
		dbms_output.put_line('Média Salario: ' || lpad(to_char(r1.media_salario, 'fm999G990D00'), 10, ' '));
		dbms_output.put_line('Min   Salario: ' || lpad(to_char(r1.min_salario, 'fm999G990D00'), 10, ' '));
		dbms_output.put_line('Max   Salario: ' || lpad(to_char(r1.max_salario, 'fm999G990D00'), 10, ' '));
		for r2 in c2(pid_depto => r1.id_depto) loop
			dbms_output.put_line('==> ' || rpad(r2.nome, 15, ' '));
			dbms_output.put_line('====> ' || 'Salario: ' || lpad(to_char(r2.salario, 'fm999G990D00'), 10, ' '));
		dbms_output.put_line('-');					
		end loop;		
		dbms_output.put_line('-');		
	end loop;

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/