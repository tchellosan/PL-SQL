create or replace procedure sp_folha_pagamento(pqt_dias number) is
	wvl_bruto	number;
	wvl_ir		number;
	wlv_liquido number;

	begin
		wvl_bruto	:=	(pqt_dias * 25);

		declare 
			wtx_ir	number	:=11;

		begin
			if wvl_bruto > 5400 then
				wtx_ir := 27.5;
			end if;

			dbms_output.put_line('Taxa IR: ' || wtx_ir);			
			wvl_ir		:= (wvl_bruto * wtx_ir) / 100;
			wlv_liquido	:= (wvl_bruto - wvl_ir);		
		end;

		dbms_output.put_line('Valor do salario bruto: ' || wvl_bruto);
		dbms_output.put_line('Desconto valor do IR: ' || wvl_ir);
		dbms_output.put_line('Valor do salario liquido: ' || wlv_liquido);

		exception
			when others then
				dbms_output.put_line('Erro ao calcular pagamento. Erro: ' || sqlerrm);

	end sp_folha_pagamento;
/

begin
	sp_folha_pagamento(pqt_dias => 400);
end;
/