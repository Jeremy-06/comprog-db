CREATE DATABASE db_normalformdemo;

--1NF: Eliminate Repeating Groups

-- Create 1NF table
CREATE TABLE StudentCourses (
    StudentID INT,
    StudentName VARCHAR(100),
    Course VARCHAR(100),
    Instructor VARCHAR(100)
);

-- Insert sample data
INSERT INTO StudentCourses VALUES (1, 'Alice', 'Math', 'Dr. Smith');
INSERT INTO StudentCourses VALUES (1, 'Alice', 'Math', 'Dr. Lee');
INSERT INTO StudentCourses VALUES (1, 'Alice', 'Physics', 'Dr. Smith');
INSERT INTO StudentCourses VALUES (1, 'Alice', 'Physics', 'Dr. Lee');
INSERT INTO StudentCourses VALUES (2, 'Bob', 'Math', 'Dr. Smith');
INSERT INTO StudentCourses VALUES (2, 'Bob', 'Math', 'Dr. Kumar');
INSERT INTO StudentCourses VALUES (2, 'Bob', 'Chemistry', 'Dr. Smith');
INSERT INTO StudentCourses VALUES (2, 'Bob', 'Chemistry', 'Dr. Kumar');

