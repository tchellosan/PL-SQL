clear scr;
set serveroutput on;
set autoprint off;

--	set transaction (deve ser o primeiro comando ou um erro irá ocorrer)
delete from stg_vendedor;
--
set transaction read write;
--
rollback
--	savepoint