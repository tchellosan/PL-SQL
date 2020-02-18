--drop user plsql
create user c##plsql identified by plsql;
grant connect, resource to c##plsql;
grant create table to c##plsql;
grant create view to c##plsql;
grant dba to c##plsql;