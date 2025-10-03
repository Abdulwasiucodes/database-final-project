-- Create the database
-- CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;

--  Table: Students
--  CREATE TABLE Students (
--     student_id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL,
--     date_of_birth DATE,
--     gender ENUM('Male', 'Female', 'Other')
--  );

-- -- Table: Teachers
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(100)
);

-- -- Table: Courses
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- -- Table: Enrollments (Many-to-Many: Students <-> Courses)
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE(student_id, course_id) -- prevent duplicate enrollments
);


-- Insert sample data
-- -----------------------------

-- Insert Teachers
INSERT INTO Teachers (first_name, last_name, email, department)
VALUES
('John', 'Smith', 'jsmith@school.com', 'Mathematics'),
('Sarah', 'Johnson', 'sjohnson@school.com', 'Computer Science'),
('David', 'Brown', 'dbrown@school.com', 'Physics');

-- Insert Students
INSERT INTO Students (first_name, last_name, email, date_of_birth, gender)
VALUES
('Alice', 'Walker', 'alice.walker@email.com', '2006-05-15', 'Female'),
('Michael', 'Green', 'michael.green@email.com', '2005-11-02', 'Male'),
('Sophia', 'Taylor', 'sophia.taylor@email.com', '2007-01-20', 'Female');

-- Insert Courses
INSERT INTO Courses (course_name, credits, teacher_id)
VALUES
('Algebra 101', 3, 1),
('Introduction to Programming', 4, 2),
('Physics Fundamentals', 3, 3);


use studentrecordsdb;

-- Insert Enrollments
INSERT INTO Enrollments (student_id, course_id)
VALUES
(1, 1), -- Alice → Algebra
(1, 2), -- Alice → Programming
(2, 3), -- Michael → Physics
(3, 2); -- Sophia → Programming
SELECT * FROM Students;
SELECT * FROM Teachers;
SELECT * FROM Courses;
SELECT * FROM Enrollments;