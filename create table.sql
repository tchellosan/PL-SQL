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

-------------------------------------------------------------------

create table regions (
	region_id number,
	region_name varchar2(60),
	primary key (region_id)
);

insert into regions values(1, 'europe');
insert into regions values(2, 'americas');
insert into regions values(3, 'asia');
insert into regions values(4, 'middle east and africa');