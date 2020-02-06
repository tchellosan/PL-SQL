create table depto(
	id			int,
	nome		varchar2(20),
	primary key (id)
);

create table emp(
	id			int,
	nome		varchar2(20),
	salario 	number(10,2),
	id_depto	int,
	primary key (id)
);

alter table emp
	add constraint c_id foreign key (id_depto) references depto(id);

alter table emp
	modify salario 	number(10,2) not null
