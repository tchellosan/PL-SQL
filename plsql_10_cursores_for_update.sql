clear scr;
set serveroutput on;

variable vid_depto number default 20;
--variable vid_depto number = 20;
--variable vid_depto number := 20;

select
id, 
nome,
salario
from emp
where id_depto = :vid_depto;

declare
	cursor c2(pid_depto number) is
		select
		id, 
		nome,
		salario
		from emp
		where id_depto = pid_depto
		for update of salario nowait;

	r2 c2%rowtype;			

	wreg_atualizados	number default 0;

begin

	for r2 in c2(pid_depto => :vid_depto) loop
		update emp
			set salario = salario * 1.10
		where current of c2;

		wreg_atualizados := wreg_atualizados + sql%rowcount;
	end loop;

	dbms_output.put_line('Registros atualizado: ' || wreg_atualizados);

	exception	
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/

select
id, 
nome,
salario
from emp
where id_depto = :vid_depto;