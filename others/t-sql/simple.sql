select * from HumanResources.Department

create table courses (
id int primary key,
title varchar(50),
hours int);

insert into dbo.courses values (1,'Software Engineering',45);
insert into courses values (2,'Telecommunication Engineering',45);
insert into courses values (4,'Web Development',60);

select * from courses;

select id as course_id,title as course_title ,hours
from dbo.courses 
where hours > 45;

select max(hours) as max_hours, AVG(hours) as average_hours
from courses;

select * from courses;

