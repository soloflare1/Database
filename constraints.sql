-- Drop tables if they already exist
DROP TABLE IF EXISTS Student;
-- ============================================
-- Table: Student
-- Description: Contains student details with various constraints
-- ============================================

CREATE TABLE Student (
    id INTEGER NOT NULL,                              -- Unique ID
    Name TEXT NOT NULL,                               -- Student name, required
    Email TEXT NOT NULL,                              -- Student email, required
    VarsityName VARCHAR(40) UNIQUE,                   -- Unique university name
    Address VARCHAR(40),                              -- Optional address
    Age INTEGER,                                      -- Age field
    City VARCHAR(25) DEFAULT 'New York',              -- Default city
    size TEXT,                                        -- Size field (with constraint below)

    -- Composite primary key using constraint (this is valid)
    CONSTRAINT pt_rule PRIMARY KEY (id, Email),

    -- Proper CHECK constraints (can't check multiple columns in one CHECK)
    CONSTRAINT check_age CHECK (Age >= 18),
    CONSTRAINT check_size CHECK (size IN ('S', 'M', 'L', 'XL'))
);


--INPUT
--address optional  & city default
--INSERT INTO Student(id, Name, Email, VarsityName, Age, size)
--VALUES(5, 'Naba', 'naba@gmail.com', 'BAIUST', 20,'L');

-- with address and city 
INSERT INTO Student(id, Name, Email, VarsityName,	Address, Age, City, size)
VALUES(5, 'Naba', 'naba@gmail.com', 'BAIUST','Bangladesh', 20, 'Cumilla', 'L');
