CREATE DATABASE college;

USE college;

-- create only when doesn't exist
CREATE DATABASE IF NOT EXISTS college;

-- deleting database only if it exists.
-- DROP DATABASE IF EXISTS company; 

CREATE TABLE student (
	id 	INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

INSERT INTO student VALUES(1, "Khushi", 19);
INSERT INTO student VALUES(2, "Gunnu", 19);

SELECT * FROM student;

SHOW DATABASES;
SHOW TABLES;

DROP TABLE student;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

-- select and view all columns
SELECT * FROM student;

INSERT INTO student VALUES(101, "khushi");

USE college;

CREATE TABLE temp1 (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
	city VARCHAR(30)
    -- PRIMARY KEY(id, name)	== two fields primary key
);

CREATE TABLE emp (
    id INT,
    salary INT DEFAULT 25000
);

INSERT INTO emp(id) VALUES(100); 












CREATE DATABASE university;
USE university;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student 
(rollno, name , marks , grade, city)
VALUES
(101, "Anit", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

SELECT * FROM student;
SELECT name, marks FROM student;
SELECT DISTINCT city FROM student;
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE CITY = "Mumbai";

--  AND (to check for both conditions to be true)
SELECT * FROM student WHERE marks > 80 AND city = "Mumbai";

-- OR (to check for one of the conditions to be true)
SELECT * FROM student WHERE marks > 90 OR  city = "Mumbai";

-- BETWEEN (selects for a given range, also they are inclusive with the values)  
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

-- IN (matches any value in the list)
SELECT * FROM STUDENT WHERE city IN ("Delhi", "Mumbai", "Gurgaon");

-- NOT (to negate the given condition)
SELECT * FROM student WHERE city NOT IN ("Delhi", "Mumbai"); 


-- Limit Clause
SELECT * FROM student LIMIT 3;


-- Order By Clause
SELECT * FROM student ORDER BY city ASC;


SELECT * FROM student ORDER BY marks DESC LIMIT 3;


-- Aggregate Functions 
SELECT MAX(marks) FROM student;


-- Group By Function
SELECT city, name, COUNT(rollno) FROM student GROUP BY city, name;


SELECT city, avg(marks) FROM student GROUP BY city ORDER BY avg(marks) DESC;

SELECT grade, count(rollno) 
FROM student 
GROUP BY grade 
ORDER BY grade;



-- Count number of students in each city where max marks cross 90.
SELECT count(name), city 
FROM student 
GROUP BY city 
HAVING max(marks) > 90;



-- General Order
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING max(marks) >= 93
ORDER BY city ASC;



SET SQL_SAFE_UPDATES = 0;
-- Table Related Queries  
UPDATE student 
SET grade = "O" 
WHERE grade = "A"; 



UPDATE student
SET marks = 82 
WHERE rollno = 105;



UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;



UPDATE student
SET marks = marks + 1;

SELECT * FROM student;

-- DELETE FROM student 
-- WHERE marks < 33;


ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT	19;

SELECT * from student;

-- ALTER TABLE student
-- DROP COLUMN age;

-- Modifying the column 
ALTER TABLE student
MODIFY age VARCHAR(2);

ALTER TABLE student
CHANGE age stu_age INT;

INSERT INTO student
(rollno, name, marks, grade, city, stu_age)
VALUES
(107, "Khushi", 67, "C", "Jaipur", 100);

-- DROP TABLE student; 

-- ALTER TABLE student
-- RENAME TO students;

-- SELECT * FROM students;

-- Truncate only deletes the table's data, whereas drop deletes the entire table.
-- TRUNCATE TABLE students;

-- DROP TABLE students;



-- Practice Questions 
ALTER TABLE student
CHANGE name full_name VARCHAR(50); 

DELETE FROM student
WHERE marks < 80;

ALTER TABLE student
DROP COLUMN grade;

SELECT * FROM student;

