select * from tblPerson;
select * from tblGender;

-- the command below will fail because this primary key references a foreign
delete from tblGender where ID = 1;