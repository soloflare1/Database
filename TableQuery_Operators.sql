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
Insert into Marks(id, Age, CSE121_marks, CSE122_marks,Fee)
Values
(1, 20, 100, 100, 50000),
(2, 21, 90, 99, 70000),
(3, 18, 50, 80, 90000);


----------Arithmetic Operator----------
--all students
Select CSE121_marks + CSE122_marks,  CSE121_marks - CSE122_marks, CSE121_marks % CSE122_marks
From Marks;

--specific id
Select CSE121_marks + CSE122_marks,  CSE121_marks - CSE122_marks, CSE121_marks % CSE122_marks
From Marks
where id = 1;


----------Comparison Operator----------
--students whose total marks are 150 or more
Select CSE121_marks + CSE122_marks
From Marks
where CSE121_marks + CSE122_marks >= 150;

--students whose age is 20 or more
Select CSE121_marks + CSE122_marks
From Marks
where Age >= 20;

----------Logical AND,OR Operator----------
--students whose age is more than 20 and Fee is more than 50000, show id and fee
Select id, Fee
From Marks
Where Age > 20 AND Fee > 50000;

--students who paid less than 70000 OR (age less than 25 but paid more than 40000)
Select *
From Marks
Where Fee < 70000 OR (Age < 25 AND Fee > 40000);
