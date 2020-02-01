clear scr;
set serveroutput on;
set autoprint off;

begin
	--
	insert into stg_vendedor values ('20', 'func 20');
		savepoint sp1;
	--
	insert into stg_vendedor values ('21', 'func 21');
		savepoint sp2;
	--		
	insert into stg_vendedor values ('22', 'func 22');
		savepoint sp3;
	--			
	insert into stg_vendedor values ('23', 'func 23');
		rollback to savepoint sp2;
	--	
	commit;
--
end;