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

-- 3NF: Remove Transitive Dependencies

-- CourseInstructor table (Course, Instructor)
CREATE TABLE CourseInstructor3NF (
    Course VARCHAR(100),
    Instructor VARCHAR(100),
    PRIMARY KEY (Course, Instructor)
);

-- Populate CourseInstructor3NF
INSERT INTO CourseInstructor3NF
SELECT DISTINCT Course, Instructor FROM Enrollment2NF;

-- StudentEnrollment table (StudentID, Course)
CREATE TABLE StudentEnrollment3NF (
    StudentID INT,
    Course VARCHAR(100),
    PRIMARY KEY (StudentID, Course)
);

-- Populate StudentEnrollment3NF
INSERT INTO StudentEnrollment3NF
SELECT DISTINCT StudentID, Course FROM Enrollment2NF;

SELECT * FROM Student2NF;
SELECT * FROM CourseInstructor3NF;
SELECT * FROM StudentEnrollment3NF;

DROP TABLE Enrollment2NF;

-- BCNF: Remove All Anomalies

CREATE TABLE CourseBCNF (
    Course VARCHAR(100) PRIMARY KEY,
    Instructor VARCHAR(100)
);

-- Migrate:
INSERT INTO CourseBCNF
SELECT Course, MIN(Instructor) -- or other aggregate function if duplicates
FROM CourseInstructor3NF
GROUP BY Course;

SELECT * FROM Student2NF;
SELECT * FROM StudentEnrollment3NF;
SELECT * FROM CourseBCNF;

DROP TABLE CourseInstructor3NF;

-- 4NF: Remove Multivalued Dependencies

-- StudentCourse table
CREATE TABLE StudentCourse (
    StudentID INT,
    Course VARCHAR(100),
    PRIMARY KEY (StudentID, Course)
);

-- StudentClub table
CREATE TABLE StudentClub4NF (
    StudentID INT,
    Club VARCHAR(100),
    PRIMARY KEY (StudentID, Club)
);

-- Insert sample data
INSERT INTO StudentCourse VALUES (1, 'Math');
INSERT INTO StudentCourse VALUES (1, 'Physics');

-- Migrate (assuming you have club data)
INSERT INTO StudentClub4NF VALUES (1, 'Chess');
INSERT INTO StudentClub4NF VALUES (1, 'Drama');

SELECT * FROM StudentCourse;
SELECT * FROM StudentClub4NF;

-- Fifth Normal Form (5NF)

-- StudentCourse table
CREATE TABLE StudentCourse5NF (
    StudentID INT,
    Course VARCHAR(100),
    PRIMARY KEY (StudentID, Course)
);

CREATE TABLE CourseInstructor5NF (
    Course VARCHAR(100),
    Instructor VARCHAR(100),
    PRIMARY KEY (Course, Instructor)
);

CREATE TABLE StudentInstructor5NF (
    StudentID INT,
    Instructor VARCHAR(100),
    PRIMARY KEY (StudentID, Instructor)
);


-- From the previous tables, or if you can infer:
INSERT INTO StudentCourse5NF VALUES (1, 'Math');
INSERT INTO StudentCourse5NF VALUES (1, 'Physics');
INSERT INTO StudentCourse5NF VALUES (2, 'Math');
INSERT INTO StudentCourse5NF VALUES (2, 'Chemistry');

INSERT INTO CourseInstructor5NF VALUES ('Math', 'Dr. Smith');
INSERT INTO CourseInstructor5NF VALUES ('Physics', 'Dr. Lee');
INSERT INTO CourseInstructor5NF VALUES ('Chemistry', 'Dr. Kumar');

INSERT INTO StudentInstructor5NF VALUES (1, 'Dr. Smith');
INSERT INTO StudentInstructor5NF VALUES (1, 'Dr. Lee');
INSERT INTO StudentInstructor5NF VALUES (2, 'Dr. Smith');
INSERT INTO StudentInstructor5NF VALUES (2, 'Dr. Kumar');

SELECT * FROM StudentCourse5NF;
SELECT * FROM CourseInstructor5NF;
SELECT * FROM StudentInstructor5NF;