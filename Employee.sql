/*Create a table named Employee with EmployeeId, EmployeeName, EmployeeSalary and JoiningDate
Create table
Insert 2 employee data
Delete 1 employee data*/

DROP TABLE IF EXISTS EMPLOYEE;

CREATE TABLE EMPLOYEE(
  EmployeeId int  PRIMARY KEY,
  EmployeeName CHAR(10),
  EmployeeSalary DOUBLE,
  JoiningDate DATE
);


INSERT INTO EMPLOYEE
(EmployeeId,EmployeeName,EmployeeSalary,JoiningDate) 
VALUES
(1,'MR. AB', 50000, '20/2/24'),
(2,'MR. XY', 10000, '12/3/24');


DELETE FROM EMPLOYEE
WHERE EmployeeId = 1;
    
