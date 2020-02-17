clear scr;
set serveroutput on;

declare
	wres number;
begin

	wres := mod(10, 2);
	dbms_output.put_line('mod: ' || wres);	

	wres := mod(10, 3);
	dbms_output.put_line('mod: ' || wres);	

	wres := sqrt(64);
	dbms_output.put_line('sqrt: ' || wres);

	wres := power(10, 3);
	dbms_output.put_line('power: ' || wres);	

	wres := abs(-20);
	dbms_output.put_line('abs: ' || wres);	

	wres := ceil(10.2);
	dbms_output.put_line('ceil: ' || wres);	

	wres := floor(10.2);
	dbms_output.put_line('floor: ' || wres);		

	wres := sign(-2000);
	dbms_output.put_line('sign: ' || wres);			

	wres := sign(2000);
	dbms_output.put_line('sign: ' || wres);				

	wres := sign(0);
	dbms_output.put_line('sign: ' || wres);			

end;
/