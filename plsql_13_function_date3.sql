clear scr;
set serveroutput on;

declare
	wsessiontimezone	varchar2(10) 	default sessiontimezone;
	wcurrent_date		date 			default current_date;
	wsysdate			date 			default sysdate;

begin

	dbms_output.put_line('Fuso horário  : ' || wsessiontimezone);
	dbms_output.put_line('Data local    : ' || wcurrent_date);
	dbms_output.put_line('Data servidor : ' || wsysdate);

	dbms_output.put_line('last_day      : ' || last_day(wsysdate));
	dbms_output.put_line('Round         : ' || round(to_date('05/08/2020'), 'year'));
	dbms_output.put_line('trunc         : ' || trunc(to_date('05/08/2020'), 'year'));

	exception
		when others then
			dbms_output.put_line(sqlerrm(sqlcode));
end;
/