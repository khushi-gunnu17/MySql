-- Sql sub queries

USE college;

CREATE TABLE students (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);

INSERT INTO students
(rollno, name , marks, city) 
VALUES
(101, "Anil", 78, "Pune"),
(102, "Bhumika", 93, "Mumbai"),
(103, "Chetan", 85, "Mumbai"),
(104, "Dhruv", 96, "Delhi"),
(105, "Emanuel", 92, "Delhi"),
(106, "Farah", 82, "Delhi");

-- SubQueries
-- Get names of all students who scored more than class average.
SELECT name, marks FROM students 
WHERE marks > (SELECT AVG(marks) FROM students);


-- Find the names of all students with even roll numbers.
SELECT rollno, name FROM students 
WHERE rollno % 2 = 0;


-- Find the max marks from the students of Delhi
SELECT max(marks)
FROM 
(SELECT * FROM students 
WHERE city = "Delhi") AS temp;
-- Alias is necessary with FROM.


SELECT MAX(marks) FROM students 
WHERE city = "Mumbai";

-- with select 
SELECT (SELECT MAX(marks) FROM students), name 
FROM students;

