clear scr;
set serveroutput on;
set autoprint off;
--undef ntab;
--def ntab = stg_venda;

var bcod_produto varchar2;
exec :bcod_produto := 1;

begin 
	for i in(select * from &ntab where cod_produto = :bcod_produto and rownum < 10 order by 1, 2) loop
		dbms_output.put_line('nome: ' || i.id_venda || ' ' || 'qtde. venda: '	 || i.qtd_venda);
	end loop;
end;
/