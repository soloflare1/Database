Drop Table if Exists Student;
Drop Table if Exists Marks;

Create Table Marks
(
    id int Not Null Primary key,
    Age int,
    CSE121_marks int,  
    CSE122_marks int,
    Fee int
);

--input
Insert into Marks(id, Age, CSE121_marks, CSE122_marks, Fee)
Values
(1, 20, 100, 100, 50000),
(2, 21, 90, 99, 70000),
(3, 18, 50, 80, 90000),
(22, 21, 47, 99, 90000),
(29, 21, 22, 99, 90000);

--sequence must to do follow
--1. Select
--2. From
--3. Where
--4. Order by
--5. Limit
--6. Offset

-- Unique fee values (distinct values)
Select Distinct Fee
From Marks;

-- Order by age in ascending order (ASC), descending order (DESC) can also be used if needed
Select id, Age
From Marks
Order by Age ASC;
