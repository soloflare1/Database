drop database college;
create database college;
use college;

create table studentinfo(
    id int,
    name varchar(50),
    marks int not null,
    cg float,
    city varchar(20),
    primary key(id)
);

insert into studentinfo
(id, name, marks, cg, city)
values
(1, 'Naba', 790, 3.93, 'Cumilla'),
(2, 'Nasir', 750, 3.92, 'Cumilla'),
(3, 'Tanha', 720, 3.92, 'Tomsom'),
(4, 'Ishtiak', 730, 3.92, 'Cumilla');


-- Show First 3 Students
select name
from studentinfo
limit 3;

select *
from studentinfo
limit 3;

-- Shows average marks for each city, sorted alphabetically.
select city, avg(marks) 
from studentinfo
group by city
order by city; -- Default in ASC
-- or order bt city asc;

select city, avg(marks)
from studentinfo 
group by city
order by avg(marks) desc
limit 3;  
-- so, it shows top 3 



select cg, count(id)
from studentinfo
group by cg
order by cg;

