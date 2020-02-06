clear scr;
set serveroutput on;

declare
	wsal	number(10,2);
	wdepto	int;
begin
	--
	begin
		select 
		id_depto, avg(salario) as salario_medio
		into 
		wdepto, wsal
		from emp
		where id_depto = 10
		group by id_depto;

	exception
		when no_data_found then
			raise_application_error(-20100, 'Não existem registros para o depto 99.');
		when too_many_rows then
			raise_application_error(-20101, 'Pesquisa retornou mais de um registro.');			
		when others then
			raise_application_error(-20999, 'bloco_1: ' || sqlerrm);
	end;

	declare
		id_depto	int				:= 20;
		nome_depto	varchar2(20)	:= 'Vendas';		

		id_emp		int				:= 4;
		nome_emp	varchar2(20)	:= 'Quiteria Maria';

	begin
--		insert into depto 	values(id_depto, nome_depto);
		insert into emp		values(id_emp, nome_emp, wsal, id_depto);
		commit;

		dbms_output.put_line('Empregado inserido com sucesso: ' || id_emp || ' - ' || nome_emp);

	exception
		when dup_val_on_index then
			raise_application_error(-20803, 'Registro duplicado (depto | emp).');
		when others then
			raise_application_error(-20999, 'bloco_2: ' || sqlerrm);
	end;
	
exception
	when others then
		dbms_output.put_line(sqlerrm(sqlcode));
--
end;
/