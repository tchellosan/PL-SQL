clear scr;
set serveroutput on;
set autoprint off;

declare
	dt_entrada			date			default	sysdate;
	dt_saida			date;
--	fornecedor			tipo_pessoa;
	qt_max				number(5)		default 1000;
	qt_min	constant	number(5)		default	100;
	nm_pessoa1			char(60)		default 'Marcelo Silva Char';
	nm_pessoa2			varchar(60)		default 'Marcelo Silva Varchar';
	nm_pessoa3			varchar2(60)	default 'Marcelo Silva Varchar2';
	vl_salario			number(11,2)	default 123456789.01;
	cd_depto			number(2)		:=	10;
	in_nao				boolean			default true;
	qtd					number(10)		:=	0;
	vl_perc	constant	number(6,-1)	:=	5.12;
	des_vend			stg_vendedor.des_vendedor%type;
	reg_vend			stg_vendedor%rowtype;

begin
	cd_depto := 100 / 0;
	dbms_output.put_line('dt_entrada: ' || dt_entrada);
	dbms_output.put_line('dt_saida: ' 	|| dt_saida);
	dbms_output.put_line('qt_max: ' 	|| qt_max);
	dbms_output.put_line('qt_min: ' 	|| qt_min);
	dbms_output.put_line('nm_pessoa1: '	|| nm_pessoa1);
	dbms_output.put_line('nm_pessoa2: ' || nm_pessoa2);
	dbms_output.put_line('nm_pessoa3: ' || nm_pessoa3);
	dbms_output.put_line('vl_salario: ' || vl_salario);
	dbms_output.put_line('cd_depto: ' 	|| cd_depto);

	if in_nao = false then
		dbms_output.put_line('in_nao: ' || 'false');
	else
		dbms_output.put_line('in_nao: ' || 'true');
	end if;

	dbms_output.put_line('qtd: ' 		|| qtd);
	dbms_output.put_line('vl_perc: '	|| vl_perc);
	exception
		when value_error then
			dbms_output.put_line('USER: Excedeu a quantidade de dígitos do número.');		
		when zero_divide then
			dbms_output.put_line('USER: Divisao por zero.');
end;
/