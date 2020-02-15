clear scr;
set serveroutput on;

set transaction read write;

declare
	wid		number	default 1;
	wqtde	number	default 0;

begin

	update emp
		set salario = 8600.00
		where id = wid;
		
	if sql%found then

		wqtde := sql%rowcount;

		declare
			wnome_func	emp.nome%type;
			wsalario	emp.salario%type;
			wnome_depto	depto.nome%type;
		begin
			select 
				a.nome, 
				a.salario, 
				b.nome as nome_depto
			into
				wnome_func,
				wsalario,
				wnome_depto
			from emp a
			inner join depto b
				on a.id_depto = b.id
				where a.id = wid;

			if sql%found then
				dbms_output.put_line(to_char(wsalario, '9990.00') || ' - ' || wnome_func || ' - ' || wnome_depto );
			end if;

			exception	
				when no_data_found then
					raise_application_error(+20100, 'Registro não encontrado!');		
				when too_many_rows then
					raise_application_error(-20811, 'Foi retornando mais do que (1) linha!');
				when others then
					raise_application_error(-20999, 'bloco_1: ' || sqlerrm);
		end;

		commit;

		dbms_output.put_line('Registro atualizado. Qtde: ' || wqtde);
	else		
		dbms_output.put_line('Registro não atualizado');
	end if;

	exception	
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
			rollback;
end;
/