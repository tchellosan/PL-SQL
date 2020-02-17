clear scr;
set serveroutput on;

declare
	wnome1 			varchar2(100) default 'analista de sistemas';
	wnome2 			varchar2(100) default 'PEDREIRO';
	wnome3 			varchar2(100) default 'padeiro';
	wregion_name	varchar2(500);
	wsalario		varchar2(20);
	valor			number;

	wnome 			varchar(100);
	wsalario2		varchar(50);

begin

	dbms_output.put_line('+++ initcap, lower, upper +++');
	wnome1 := initcap(wnome1);
	wnome2 := lower(wnome2);
	wnome3 := upper(wnome3);

	dbms_output.put_line(wnome1);
	dbms_output.put_line(wnome2);
	dbms_output.put_line(wnome3);

	dbms_output.put_line('+++ substr +++');
	for r1 in (select region_name from regions) loop
		wregion_name := upper(substr(r1.region_name, 1, 2));
		dbms_output.put_line(wregion_name || ' - ' || r1.region_name);
	end loop;

	dbms_output.put_line('+++ to_char +++');

	for r1 in (select nome, salario from emp) loop
		wsalario := 'R$ ' || to_char(r1.salario, 'fm999G990D00');
		dbms_output.put_line('Nome: ' || r1.nome);
		dbms_output.put_line('Salário: ' || wsalario);
		dbms_output.put_line('-');
	end loop;

	dbms_output.put_line('+++ instr +++');
	valor := instr(37462.12, '62');
	dbms_output.put_line('Posição: ' || valor);	

	dbms_output.put_line('+++ length +++');
	for r1 in (select nome, length(nome) as tam from emp where length(nome) > 13) loop
		dbms_output.put_line('Nome: ' || r1.nome || ' Tam:' || r1.tam);	
	end loop;

	dbms_output.put_line('+++ rpad, lpad +++');
	for r1 in (select nome, salario from emp) loop
		wnome 		:= rpad(r1.nome, 20, ' ');
		wsalario2 	:= lpad(r1.salario, 7, '0');
		dbms_output.put_line('Nome: ' || wnome || ' Salário: ' || wsalario2);	
	end loop;
end;
/