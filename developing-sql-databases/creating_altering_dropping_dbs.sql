-- creating a database
create database Sample2;

-- rename a database
alter database Sample2 modify name = Sample3;

--rename a databse using stored procedures
sp_renameDB 'Sample3','Sample4';

--drop a database
drop database Sample1_gr;
drop database Sample4;

create database sample;