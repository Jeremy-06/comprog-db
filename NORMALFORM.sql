CREATE DATABASE db_normalformdemo;

--1NF: Eliminate Repeating Groups

-- Create 1NF table
CREATE TABLE StudentCourses (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Course VARCHAR(100),
    Instructor VARCHAR(100)
);

-- Insert sample data
INSERT INTO StudentCourses VALUES 
(1, 'Alice', 'Math', 'Dr. Smith'),
(1, 'Alice', 'Math', 'Dr. Lee'),
(1, 'Alice', 'Physics', 'Dr. Smith'),
(1, 'Alice', 'Physics', 'Dr. Lee'),
(2, 'Bob', 'Math', 'Dr. Smith'),
(2, 'Bob', 'Math', 'Dr. Kumar'),
(2, 'Bob', 'Chemistry', 'Dr. Smith'),
(2, 'Bob', 'Chemistry', 'Dr. Kumar');

SELECT * FROM StudentCourses;

