select *
from dbo.tblGender;

select *
from dbo.tblPerson;

-- add a person to the person table
insert into tblPerson (ID,Name,Email) values (3,'Paul','wechulipaul@yahoo.com');
insert into tblPerson (ID,Name,Email) values (4,'Wechuli','wechulipl@yahoo.com');
insert into tblPerson (ID,Name,Email) values (5,'Wechuli','wechulipl@yahoo.com');
insert into tblPerson (ID,Name,Email,GenderID) values (6,'Wechuli','wechulipl@yahoo.com',1);

insert into tblPerson values (7,'Johny','wechulipaul@yahoo.com',null);


-- add a new unknown gender
insert into tblGender values (3,'Unknown');

-- add a default contraint
alter table tblPerson
add constraint df_tblPerson_GenderId
default 3 for GenderId;


-- droping a constraint
alter table tblPerson
drop constraint df_tblPerson_GenderId;