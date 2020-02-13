clear scr;
set serveroutput on;
set autoprint off;

variable bcod_produto varchar2;
exec :bcod_produto := 1;

declare
	cursor c1(pcod_produto varchar2) is
		select * from stg_venda
		where cod_produto = pcod_produto
		and rownum < 10
		order by 1, 2;

	r1 c1%rowtype;

begin
	open c1(pcod_produto => :bcod_produto);

	loop
		fetch c1 into r1;
--		if c1%found then
		if c1%notfound then
			exit;
		else
			dbms_output.put_line('nome: ' || r1.id_venda || ' ' || 'qtde. venda: ' || r1.qtd_venda);
		end if;
	end loop;

	close c1;

	exception
		when invalid_cursor then
			dbms_output.put_line('USER: Cursor deve ser aberto antes do uso.');
		when others then
			raise_application_error(-20001, sqlerrm);
end;
/