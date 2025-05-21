create database sj;
use sj;
DROP TABLE IF EXISTS Employees;

create table Employees 
(
    Employee_Id int,
    manager_Id int,
    Employee_Name varchar(10),
    primary key(Employee_Id, manager_Id)
);

insert into  Employees  (Employee_Id, manager_Id,Employee_Name)
values
	(1,2,'Mr. AB'),
    (2,3,'Mr. BC'),
    (3,1,'Mr. CD'),
   

SELECT e.Employee_Name, m.manager_Id
FROM 
    Employees as e
JOIN Employees as m
ON  m.Employee_Id = e.manager_Id;      -- Match each employee's ManagerID with a manager's EmployeeID.



SELECT e.EmployeeName AS EmployeeName, m.EmployeeName AS ManagerName
FROM Employee e
LEFT JOIN Employee m ON e.ManagerID = m.EmployeeID;
