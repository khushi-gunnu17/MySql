-- 01.) Table Insertion

CREATE DATABASE class;

USE class;

CREATE TABLE E1 (
	RollNo INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO E1 
VALUES
(509, "Siddharth"),
(510, "Khushi"),
(513, "Rupali");

SELECT * FROM E1;










-- 02.) UNIQUE AND NOT NULL USAGE

USE class;

CREATE TABLE students (
	RollNo INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    PhoneNo VARCHAR(50) UNIQUE
);

INSERT INTO students VALUES 
(509, "Siddharth", 7976166464),
(510, "Khushi", 7976959559),
(513, "Rupali", 9414245677);

SELECT * FROM students;
DROP TABLE students;










-- 03.) FOREIGN KEY USAGE

-- parent table
USE class;

CREATE TABLE dept (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept
VALUES 
(101, "English"),
(102, "Maths");

SELECT * FROM dept;


-- child table

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES dept(id)
);

INSERT INTO teacher
VALUES 
(1, "Adam", 101),
(2, "Eve", 102);

SELECT * FROM teacher;











-- 04.) Applying Insert, Select, Distinct Clause , Where Clause on database Tables

USE class;

CREATE TABLE employees (
	EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50)
); 

INSERT INTO employees VALUES 
(1, "Davolio", "Nancy"),
(2, "Fuller", "Andrew"),
(3, "Leverling", "Janet"),
(4, "Peacock", "Margaret"),
(5, "Darling", "Margaret");


SELECT * FROM employees;

SELECT DISTINCT FirstName FROM employees;

SELECT * FROM employees
WHERE FirstName = "Nancy";


-- or


CREATE TABLE emp (
	EmpId INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary VARCHAR(50),
    DOB Date,
    Designation VARCHAR(50)
);

INSERT INTO emp VALUES
(101, "Ram", 30000, '1965-07-12', 'Manager'),
(102, "Shyam", 97400, '1998-04-24', "Head Manager"),
(103, "Ritu", 65000, '1990-06-17', "P.O."),
(104, "Ayush", 50000, '1980-07-06', 'Clerk'),
(105, "Aryan", 70000, '1990-04-08', "Clerk"),
(106, "Ram", 65000, "1991-12-23", "CEO");

SELECT * FROM emp;

SELECT DISTINCT(Name) FROM emp 
WHERE Salary > 50000;

SELECT * FROM emp 
WHERE Name LIKE("%m");












-- 05.) applying update, delete or drop statements

USE class;

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
(105, "Emmanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

DESC student;

SELECT * FROM student;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET marks = 82 
WHERE rollno = 105;

/*
UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;
*/

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT	19;

DELETE FROM student 
WHERE marks < 33;

ALTER TABLE student
ADD UNIQUE (name);

ALTER TABLE student
DROP COLUMN age;

SELECT * FROM student;

-- DROP TABLE student; 












-- 06.) Usage of UNION, INTERSECT and MINUS keywords.
-- Intersect and minus functions not working in workbench

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
(104, "Donald", 103),
(105, "Aarav", 104);

SELECT * FROM employee;

-- Union 
SELECT id, name FROM employee
WHERE name = "Adam"
UNION ALL
SELECT id, name FROM employee
WHERE name = "Aarav";

-- Intersect 
-- keyword not working
SELECT id, name FROM employee
WHERE id > 102
INTERSECT
SELECT id, name FROM employee
WHERE id = 104;


SELECT e1.id, e1.name
FROM employee e1
JOIN employee e2 ON e1.id = e2.id
WHERE e1.id > 102 AND e1.id = 104;


-- Minus

SELECT * from employee
MINUS
SELECT * from employee 
where name like '%a';


SELECT DISTINCT manager_id
FROM employee
WHERE manager_id IS NOT NULL
AND manager_id NOT IN (
    SELECT id
    FROM employee
);

drop table employee;
 
 


 
-- or
Use class;
 
CREATE TABLE First(
	Id INT PRIMARY KEY,
    Name Varchar(30)
);

INSERT INTO First 
(Id, Name)
Values 
(1, 'Jack'),
(2, "Harry"),
(3, "Jackson");

CREATE TABLE Second(
	Id INT PRIMARY KEY,
    Name Varchar(30)
);

INSERT INTO Second 
(Id, Name)
Values 
(3, 'Jackson'),
(4, "Stephan"),
(5, "David");

-- UNION
SELECT * FROM First   
UNION  
SELECT * FROM Second;  

-- Intersect
SELECT * FROM First   
INTERSECT  
SELECT * FROM Second;  

-- Minus 
SELECT * FROM First   
MINUS
SELECT * FROM Second;  
-- except working in the mysql command line 












-- 07.) usage of group by, order by and having function

use class;

CREATE TABLE children (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO children 
(rollno, name , marks , grade, city)
VALUES
(101, "Anit", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi"); 

-- group by function 
SELECT city, name, COUNT(rollno) FROM children GROUP BY city, name;

-- order by function
SELECT city, avg(marks) FROM children GROUP BY city ORDER BY avg(marks) DESC;

-- having function
SELECT count(name), city 
FROM children 
GROUP BY city 
HAVING max(marks) > 90;










-- 08.) Practice Queries using Arithmetic Operators, Comparison Operator and logical operators

USE class;

CREATE TABLE children (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO children 
(rollno, name , marks , grade, city)
VALUES
(101, "Anit", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi"); 

-- Logical operators
SELECT * FROM children 
WHERE marks > 80 AND city = "Mumbai";

SET SQL_SAFE_UPDATES = 0;

-- Arithmetic operators
UPDATE children
SET marks = marks + 1;

-- Comparison operators
SELECT count(name), city 
FROM children 
GROUP BY city 
HAVING max(marks) > 90;









-- 09.) Practice Queries using any four String Functions. 

USE class;

CREATE TABLE workers (
    worker_id INT PRIMARY KEY,
    full_name VARCHAR(50),
    dept_id INT NOT NULL,
    city VARCHAR(50) DEFAULT 'Delhi'
);

INSERT INTO workers 
(worker_id, full_name, dept_id, city)
VALUES
(1, 'Rajesh Mehta', 302, 'Mumbai'),
(2, 'Mrinal Mathur', 312, 'Delhi'),
(3, 'Khush Rathore', 456, "Noida"),
(4, 'Jayesh Joshi', 324, "Jaipur"),
(5, 'Kriti Kabra', 324, 'Delhi');

SELECT UPPER(full_name) AS upper_case_name
FROM workers;

SELECT LOWER(full_name) AS lower_case_name
FROM workers;

SELECT LEFT(full_name, 6) AS  first_six_characters
FROM workers;

SELECT full_name , LENGTH(full_name) AS name_length
FROM workers;

 







-- 10.) Practice Queries using Numeric Functions.

SELECT ROUND(123.345, 1) AS rounded_value;

SELECT ABS(-45.34) AS abslute_value;

SELECT CEILING(12.34) AS ceiling_value;

SELECT FLOOR(12.34) AS floored_value;

SELECT POWER(12, 2) AS squared_value;

SELECT RAND() * 10 AS random_value;

SELECT MOD(15, 4) as remainder_value;











-- 11.) Practice Queries using Date Functions. 

SELECT CURRENT_DATE AS todays_date;

SELECT CURRENT_TIME AS todays_time;

SELECT CURRENT_TIMESTAMP AS timestamp;

SELECT DATE_FORMAT(CURRENT_DATE, '%D %M %Y') AS formatted_date;

SELECT DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY) AS future_date;

SELECT DATEDIFF('2024-05-08', '2004-03-17') AS days_difference;

SELECT YEAR('2024-05-08') AS extracted_year;

SELECT WEEKDAY('2024-05-08') AS weekday_index;

SELECT DAY('2024-05-08') AS extracted_day;