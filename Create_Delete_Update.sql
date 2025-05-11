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
