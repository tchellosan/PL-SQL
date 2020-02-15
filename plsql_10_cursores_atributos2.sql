clear scr;
set serveroutput on;

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
	where a.id = 1;

	if sql%found then
		dbms_output.put_line(to_char(wsalario, '9990.00') || ' - ' || wnome_func || ' - ' || wnome_depto );
	end if;

	exception	
		when no_data_found then
			dbms_output.put_line('Registro não encontrado!');		
		when too_many_rows then
			dbms_output.put_line('Foi retornando mais do que (1) linha!');
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/