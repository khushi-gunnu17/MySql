-- Sql sub queries

USE college;

CREATE TABLE students (
rollno INT PRIMARY KEY, 
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1), 
city VARCHAR(20)
);

INSERT INTO students (rollno, name , marks , grade , city) 
VALUES 
(101, "Anil", 78, "C", "Pune"), 
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Karan", 12, "F", "Delhi"),
(106, "Farah", 84, "B", "DElhi");


-- SubQueries
-- Get names of all students who scored more than class average.
-- Dynamic Queries 
SELECT name, marks FROM students 
WHERE marks > (SELECT AVG(marks) FROM students);


-- Find the names of all students with even roll numbers.
SELECT name, rollno  FROM students 
WHERE rollno % 2 = 0;






-- Find the max marks from the students of Delhi
SELECT max(marks)
FROM 
(SELECT * FROM students 
WHERE city = "Delhi") AS temp;
-- Alias is necessary with FROM.

-- Easy way of the above query
SELECT MAX(marks) FROM students 
WHERE city = "Delhi";




-- with select 
SELECT (SELECT MAX(marks) FROM students) as maxMarks , name 
FROM students;














-- Views in sql

CREATE VIEW view1 AS 
SELECT rollno, name FROM students;

SELECT * FROM view1;

SELECT * FROM view1
WHERE marks > 90;