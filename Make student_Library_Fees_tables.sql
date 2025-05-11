Drop Table if Exists Marks;
Drop Table if Exists Fees;
Drop Table if Exists Student;
Drop Table if Exists Library;

/*
Create tables
a.Make a student table
b.Make a Library table
c.Make a Fees table
	Create tables with proper relations & Add proper constraints
*/


-- a.student table
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


-- b. Library table
Create Table Library
(
    Bookid int Not Null Primary Key,
    BookName Varchar(20) Not Null,
    StudentId int Not Null,
    issuedate Date Not Null,
    
    Foreign key(StudentId) References Student(id)
);

Insert into Library(Bookid, BookName, StudentId, issuedate)
Values
(12453, 'Algo Book', 1, '5-4-2025'),
(73638, 'CP Book', 3, '12-4-2025');

-- c. Fees table
Create Table Fees
(
    Payment_Slip_No Varchar(20) Not Null,
    BankName Varchar(30) Default 'Trust Bank',
    StudentId int Not Null,
    PaymentDate Date Not Null,

    Constraint pk_k Primary Key(Payment_Slip_No),
    Foreign key(StudentId) References Student(id)

);

Insert into Fees(Payment_Slip_No, StudentId, PaymentDate)
Values
(7803, 1, '1-4-2025'),
(7901, 3, '5-4-2025'),
(7804, 2, '6-4-2025');


Select *
From Student;

Select *
From Library;

Select *
From Fees;
