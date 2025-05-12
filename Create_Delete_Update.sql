-- Dropping tables if they exist
DROP TABLE IF EXISTS Student;


--creating database
CREATE database Student;
USE Student;


-- Creating Student table
CREATE TABLE Student(
    ID CHAR(4) PRIMARY KEY,
    Name VARCHAR(50),
    Marks DOUBLE
);


--INPUT
-- Inserting a row into Student
INSERT INTO Student (ID, Name, Marks) 
VALUES ('1', 'ABC', 90);


-- Updating the Name of the student with ID = 1
UPDATE Student
SET Name = 'Mst. ABC'
WHERE ID = '1';  -- Use primary key to update the specific row


-- Deleting the student with ID = 1
DELETE FROM Student
WHERE ID = '1';  -- Use primary key to delete the specific row



Programiz Logo
Online SQL Editor
Interactive SQL Course
Input



Run SQL
Drop Table if Exists Fees;
Drop Table if Exists Library;
Drop Table if Exists Student;
Drop Table if Exists Employee;

DROP TABLE IF EXISTS Student;



Create Table Student
(
    id int Not Null,
    Name Varchar(20) Not Null,
    Email Varchar(30) Not Null Unique,
    birthdate Date Not Null,
    Dept Varchar(10) Default 'CSE',  

    Constraint pk_k Primary Key(id)
);

Insert into Student(id, Name, Email, birthdate)
Values
(1, 'Mr. AB', 'ab@gmail.com', '8-6-2005'),
(2, 'Mr. XY', 'xy@gmail.com', '9-3-2004'),
(3, 'Mr. UV', 'uv@gmail.com', '10-5-2006');



SET SQL_Safe UPDATES = 0;
UPDATE Student
SET Name = 'Mst. ABC'
WHERE ID = '1';  


DELETE FROM Student
WHERE ID = '2';  
SET SQL_Safe DELETE = 1;
