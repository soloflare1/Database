-- Drop tables if they already exist
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Persons;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Shippings;
DROP TABLE IF EXISTS Student;


CREATE TABLE Student (
    id INTEGER NOT NULL,                          
    Name TEXT NOT NULL,                              
    Email TEXT NOT NULL,                              
    VarsityName VARCHAR(40) UNIQUE,                   
                                   
    CONSTRAINT pt_rule PRIMARY KEY (id, Email)
);

-- (Input Section)
-- ========================================
INSERT INTO Student(id, Name, Email, VarsityName)
VALUES 
    (5, 'Naba', 'naba@gmail.com', 'BAIUST'),
    (88, 'XY', 'XY@gmail.com', 'MIT'),
    (55, 'UV', 'UV@gmail.com', 'IIT');
    

------Select---------
-- (Output Section)
-- ========================================
--SELECT Query----> Showing data 
-- Way 1: Select all data with specific column names
SELECT id, Name, Email, VarsityName
FROM Student;

-- Way 2: Select all columns using '*'
SELECT *
FROM Student;

-- See only specific column (e.g., 'Name' of students)
SELECT Name
FROM Student;



------WHERE---------
-- (Output Section)
-- ========================================

-- Output 1: Get all info for student named 'Naba'
SELECT *
FROM Student
WHERE Name = 'Naba';

-- Output 2: Get only the 'id' for student with id = 55
SELECT id
FROM Student
WHERE id = 55;
