clear scr;
set serveroutput on;
set autoprint off;

define tabela1 = 'stg_vendedor'

select * from &tabela1;

--var tabela2 varchar2(20);
--exec :tabela2 :='stg_vendedor'

--select * from :tabela2;
/