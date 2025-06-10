CREATE DATABASE db_normalformdemo;

--1NF: Eliminate Repeating Groups

-- Create 1NF table
CREATE TABLE StudentCourses1NF (
    StudentID INT,
    StudentName VARCHAR(100),
    Course VARCHAR(100),
    Instructor VARCHAR(100)
);

-- Insert sample data
INSERT INTO StudentCourses1NF VALUES 
(1, 'Alice', 'Math', 'Dr. Smith'),
(1, 'Alice', 'Math', 'Dr. Lee'),
(1, 'Alice', 'Physics', 'Dr. Smith'),
(1, 'Alice', 'Physics', 'Dr. Lee'),
(2, 'Bob', 'Math', 'Dr. Smith'),
(2, 'Bob', 'Math', 'Dr. Kumar'),
(2, 'Bob', 'Chemistry', 'Dr. Smith'),
(2, 'Bob', 'Chemistry', 'Dr. Kumar');

SELECT * FROM StudentCourses1NF;

-- 2NF: Remove Partial Dependencies

-- Student table (StudentID → StudentName)
CREATE TABLE Student2NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

-- Populate Student2NF
INSERT INTO Student2NF
SELECT DISTINCT StudentID, StudentName FROM StudentCourses1NF;

-- Enrollment table (StudentID, Course, Instructor)
CREATE TABLE Enrollment2NF (
    StudentID INT,
    Course VARCHAR(100),
    Instructor VARCHAR(100),
    PRIMARY KEY (StudentID, Course, Instructor)
);

INSERT INTO Enrollment2NF VALUES (1, 'Math', 'Dr. Smith');
INSERT INTO Enrollment2NF VALUES (1, 'Math', 'Dr. Lee');
INSERT INTO Enrollment2NF VALUES (1, 'Physics', 'Dr. Smith');
INSERT INTO Enrollment2NF VALUES (1, 'Physics', 'Dr. Lee');
INSERT INTO Enrollment2NF VALUES (2, 'Math', 'Dr. Smith');
INSERT INTO Enrollment2NF VALUES (2, 'Math', 'Dr. Kumar');
INSERT INTO Enrollment2NF VALUES (2, 'Chemistry', 'Dr. Smith');
INSERT INTO Enrollment2NF VALUES (2, 'Chemistry', 'Dr. Kumar');

-- Populate Enrollment2NF
INSERT INTO Enrollment2NF
SELECT StudentID, Course, Instructor FROM StudentCourses1NF;

SELECT * FROM Student2NF;
SELECT * FROM Enrollment2NF;

DROP TABLE StudentCourses1NF;

