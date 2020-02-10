clear scr;
set serveroutput on;

declare
	wsal			number(10,2);
	werro_salario	exception;
begin
	--
	begin
		select nvl(avg(salario), 0) as salario_medio
		into wsal
		from emp
		where id_depto = 99;

		if wsal = 0 then
			raise werro_salario;
		end if;

	exception
		when werro_salario then
			raise werro_salario;
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
	when werro_salario then
		dbms_output.put_line('O salario necessita ser maior que zero.');	
	when others then
		dbms_output.put_line(sqlerrm(sqlcode));
--
end;
/