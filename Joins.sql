-- Joins In SQL

CREATE DATABASE result;

USE result;



CREATE TABLE student(
	student_id INT,
    name VARCHAR(50)
);

INSERT INTO student
(student_id, name)
VALUES
(101, "Adam"),
(102, "Bob"),
(103, "Casey");





CREATE TABLE course(
	student_id INT,
    course VARCHAR(50)
);

INSERT INTO course
(student_id, course)
VALUES
(102, "English"),
(105, "Math"),
(103, "Science"),
(107, "Computer Science");






-- Inner Join
SELECT * FROM student as s      -- alias (alternate name), s = student
INNER JOIN course as c
-- ON student.student_id = course.student_id;
ON s.student_id = c.student_id;


-- Left Join
SELECT * FROM student as s
LEFT JOIN course as c
ON s.student_id = c.student_id;


-- Right Join
SELECT * FROM student as s
RIGHT JOIN course as c
ON s.student_id = c.student_id;


-- Full Join / Full Outer Join
SELECT * FROM student as s
LEFT JOIN course as c
ON s.student_id = c.student_id
UNION
SELECT * FROM student as s
RIGHT JOIN course as c
ON s.student_id = c.student_id;
-- Full outer join statement works with oracle server, but it doesn't work with mySql 
-- Union by default gives unique values



-- Left Exclusive Join  -- only left table's data which is excluding right's data
SELECT * FROM student as s
LEFT JOIN course as c
ON s.student_id = c.student_id
WHERE c.student_id IS NULL;


-- Right Exclusive Join
SELECT * FROM student as s
RIGHT JOIN course as c
ON s.student_id = c.student_id
WHERE s.student_id IS NULL;


-- MAKE A QUERY ON JOIN WITHOUT TAKING THE SAME PORTION OF BOTH THE TABLES.
SELECT * FROM student as s
LEFT JOIN course as c
ON s.student_id = c.student_id
WHERE c.student_id IS NULL
UNION
SELECT * FROM student as s
RIGHT JOIN course as c
ON s.student_id = c.student_id
WHERE s.student_id IS NULL;












-- New Table here = employee
CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES 
(101, "Adam", 103),
(102, "Bob", 104),
(103, "Casey", NULL),
(104, "Donald", 103);

SELECT * FROM employee;

SELECT *
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;


-- Self Join = To make out the values from the same table.
SELECT a.name AS manager_name, b.name
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id;


-- UNION ALL allows duplicates values, whereas UNION doesn't. 
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;
