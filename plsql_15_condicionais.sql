-----------------------------------------------------------------------
-- case
-----------------------------------------------------------------------
clear scr;
set serveroutput on;

declare
cursor c1 is 
select
job,
sum(case when deptno = 10 then sal
	else 0 end) Depto_10,
sum(case when deptno = 20 then sal
	else 0 end) Depto_20,
sum(case when deptno = 30 then sal
	else 0 end) Depto_30,
sum(sal) total_job
from emp
group by job;

begin

for r1 in c1 loop

dbms_output.put_line(
	rpad(r1.job,8,' ') || 
	' Depto 10 ' || to_char(r1.Depto_10, 'fm9G990D00') ||
	' Depto 20 ' || to_char(r1.Depto_20, 'fm9G990D00') ||
	' Depto 30 ' || to_char(r1.Depto_30, 'fm9G990D00') ||
	' Total ' || to_char(r1.total_job, 'fm9G990D00')
);

end loop;

end;
/

-----------------------------------------------------------------------
-- decode
-----------------------------------------------------------------------
clear scr;
set serveroutput on;

declare
cursor c1 is 
select
job,
sum(decode(deptno, 10, sal, 0)) Depto_10,
sum(decode(deptno, 20, sal, 0)) Depto_20,
sum(decode(deptno, 30, sal, 0)) Depto_30,
sum(sal) total_job
from emp
group by job;

begin

for r1 in c1 loop

dbms_output.put_line(
	rpad(r1.job,8,' ') || 
	' Depto 10 ' || to_char(r1.Depto_10, 'fm9G990D00') ||
	' Depto 20 ' || to_char(r1.Depto_20, 'fm9G990D00') ||
	' Depto 30 ' || to_char(r1.Depto_30, 'fm9G990D00') ||
	' Total ' || to_char(r1.total_job, 'fm9G990D00')
);

end loop;

end;
/

-----------------------------------------------------------------------
-- nvl
-----------------------------------------------------------------------
clear scr;
set serveroutput on;

declare
wsal_comm1 number;
wsal_comm2 number;

begin

select sum(sal + comm) into wsal_comm1 from emp;
select sum(sal + nvl(comm, 0)) into wsal_comm2 from emp;

dbms_output.put_line('Sal. Comm1: '|| to_char(wsal_comm1, 'fm999G990D00'));
dbms_output.put_line('Sal. Comm2: '|| to_char(wsal_comm2, 'fm999G990D00'));

end;
/

-----------------------------------------------------------------------
-- greatest / least
-----------------------------------------------------------------------
clear scr;
set serveroutput on;

declare 
wmaior varchar2(1);
wmenor varchar2(1);
wn1 number;
wn2 number;

begin

select greatest('b','x','t','u','a') into wmaior from dual;
select least('b','x','t','u','a') into wmenor from dual;

select least(1,5,9,-20,40,7) into wn1 from dual;
select greatest(1,5,9,-20,40,7) into wn2 from dual;

dbms_output.put_line('Maior Letra: '||wmaior ||' - Menor Letra: '||wmenor );
dbms_output.put_line('Maior: '||wn2 ||' - Menor: '||wn1 );
end;
/

-----------------------------------------------------------------------
-- nullif
-----------------------------------------------------------------------
clear scr;
set serveroutput on;
declare
comp1 varchar2(100);
comp2 varchar2(100);

begin
select decode(nullif('marcelo', 'marcelo'), null, 'iguais', 'diferentes') into comp1 from dual;
select decode(nullif('marcelo', 'dayana'), null, 'iguais', 'diferentes')into comp2 from dual;

dbms_output.put_line('Comparação 1: '||comp1||' - Comparação 2: '||comp2);

end;
/

-----------------------------------------------------------------------
-- case x decode
-----------------------------------------------------------------------

declare
cursor c1 is
select ename
, job
, mgr
,
case
when mgr = 7902 then 'MENSALISTA'
when mgr = 7839 then 'COMISSIONADO'
when mgr = 7566 then 'MENSAL/HORISTA'
else
'OUTROS'
end tipo
from emp;

begin
for r1 in c1 loop
dbms_output.put_line('Nome: '||r1.ename||' - Cargo: '||r1.job||' - Gerente: '|| r1.mgr||' - Tipo: '||r1.tipo);
end loop;
end;
/

declare
cursor c1 is
select ename
, job
, mgr
, decode(mgr, 7902, 'MENSALISTA',7839, 'COMISSIONADO',7566,'MENSAL/HORISTA','OUTROS') tipo

from emp;

begin
for r1 in c1 loop
dbms_output.put_line('Nome: '||r1.ename||' - Cargo: '||r1.job||' - Gerente: '|| r1.mgr||' - Tipo: '||r1.tipo);
end loop;
end;
/