use [sample]
go
-- creating a table
create table tblGender
(
ID int not null Primary Key,
Gender nvarchar(50) not null
);

-- creating a foreign key contraint
alter table tblPerson add constraint tblperson_GenderID_FK
foreign key (GenderID) references tblGender(ID); 