USE department;

CREATE TABLE employee (
    E_no INT PRIMARY KEY,
    E_name VARCHAR(50),
    City VARCHAR(50) DEFAULT 'Delhi'
);

INSERT INTO employee 
VALUES
(1, "Ram", "Delhi"),
(2, "Varun", "Chandiigarh"),
(3, "Ravi", "Chandigarh"),
(4, "Amrit", "Delhi"),
(5, "Nitin", "Noida");





CREATE TABLE department (
    Dept_No INT PRIMARY KEY,
    Dept_name VARCHAR(50),
    E_id INT,
    FOREIGN KEY(E_id) REFERENCES employee(E_no)
);

INSERT INTO department 
VALUES 
(101, 'HR', 1),
(102, 'IT', 2),
(103, 'MARKETING', 4),
(104, 'FINANCE', 5);






-- Natural Join
-- Find the employee names who are working in a ddepartment

SELECT E_name FROM employee AS e, department AS d
WHERE e.E_no = d.E_id;

-- with Natural Join keyword
SELECT * FROM employee NATURAL JOIN department
WHERE employee.E_no = department.E_id;







-- Self Join
-- Find the City where more than one employee resides.

SELECT T1.City FROM employee AS T1, employee AS T2
WHERE T1.City = T2.City AND T1.E_no <> T2.E_no;






CREATE TABLE dept2 (
    Dept_No INT PRIMARY KEY,
    Location VARCHAR(50),
    E_no INT,
    FOREIGN KEY(E_no) REFERENCES employee(E_no)
);

INSERT INTO dept2
VALUES
(101, "Delhi", 1),
(102, "Pune", 2),
(104, "Patna", 4);




-- Equi Join
-- Find the employee name who worked in a department having location same as their address.

SELECT E_name FROM employee AS e, dept2 AS d
WHERE e.E_no = d.E_no and e.City = d.Location;






ALTER TABLE employee
ADD COLUMN Dept_No INT;

SET SQL_SAFE_UPDATES = 0;

-- Adding values inside the column Dept_No
UPDATE employee
SET Dept_No = 101
WHERE E_no = 1;

UPDATE employee
SET Dept_No = 102
WHERE E_no = 2;

UPDATE employee
SET Dept_No = 101
WHERE E_no = 3;



-- Left Outer Join
SELECT e.E_no, E_name, Location FROM employee AS e LEFT OUTER JOIN dept2 AS d
ON (e.Dept_No = d.Dept_No);





-- Right Outer Join
SELECT d.E_no, E_name, d.Dept_No, Location FROM employee AS e RIGHT OUTER JOIN dept2 AS d
ON (e.Dept_No = d.Dept_No);










-- Subqueries

CREATE TABLE emp (
    E_id INT PRIMARY KEY,
    E_name VARCHAR(50),
    Dept VARCHAR(50),
    Salary INT DEFAULT 30000
);

INSERT INTO emp
VALUES
(1, "Ram", "HR", 10000),
(2, "Amrit", "MRKT", 20000),
(3, "Ravi", "Finance", 30000),
(4, "Nitin", "MRKT", 40000),
(5, "Varun", "IT", 45000);


-- Max salary from emp table
SELECT MAX(Salary) FROM emp;


-- Nested (Bottom Up) Approach
-- display emp name who is taking the maximum salary
SELECT E_name FROM emp
WHERE Salary = (SELECT MAX(Salary) FROM emp);


-- display second highest salary from emp table
SELECT MAX(Salary) FROM emp 
WHERE Salary <> (SELECT MAX(Salary) FROM emp);


-- display emp name who is taking the second highest salary
SELECT E_name FROM emp 
WHERE Salary = (
    SELECT MAX(Salary) FROM emp 
    WHERE Salary <> (SELECT MAX(Salary) FROM emp)
);


-- display all the dept names along with the no of emp working in that
SELECT Dept, COUNT(*) FROM emp
GROUP BY Dept;


-- display all the dept names where number of employees are less than 2
SELECT Dept, COUNT(*) FROM emp
GROUP BY Dept
HAVING COUNT(*) < 2;


-- display the emp names of all the dept where number of employees are less than 2
SELECT E_name 
FROM emp 
WHERE Dept IN (
    SELECT Dept 
    FROM emp
    GROUP BY Dept
    HAVING COUNT(*) < 2
);


-- display the highest salary department wise and name of emp who is taking that salary.
SELECT E_name 
FROM emp 
WHERE Salary IN (
    SELECT MAX(Salary) 
    FROM emp
    GROUP BY Dept
);




-- adding a column address and inserting values into it in the table emp
ALTER TABLE emp
ADD COLUMN Address VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;

UPDATE emp
SET Address =
    CASE E_id
        WHEN 1 THEN 'Chandigarh'
        WHEN 2 THEN 'Delhi'
        WHEN 3 THEN 'Pune'
        WHEN 4 THEN 'Bangalore'
        WHEN 5 THEN 'Chandigarh'
        ELSE NULL
    END
WHERE E_id IN (1, 2, 3, 4, 5);


-- creating a table project
CREATE TABLE project (
    E_id INT,
    P_id INT PRIMARY KEY,
    Pname VARCHAR(30),
    Location VARCHAR(30),
    FOREIGN KEY(E_id) REFERENCES emp(E_id)
);

INSERT INTO project
VALUES
(1, 101, 'IOT', 'Bangalore'),
(5, 102, 'BigData', 'Delhi'),
(3, 103, 'Retail', 'Mumbai'),
(4, 104, 'Android', 'Hyderabad');


-- detail of emp whose address is either Delhi or Chd or Pune.
SELECT * FROM emp
WHERE Address IN ('Delhi', 'Chandigarh', 'Pune');

-- find the names of the employees who are working on a project.
SELECT E_name FROM emp
WHERE E_id IN (
    SELECT DISTINCT(E_id)
    FROM project
);



-- EXISTS / NOT EXISTS always return either True / False
-- Outer to Inner checking in EXISTS and ON EXISTS 


-- correlated nested query
-- find the detail of employee who is working on at least one project.
SELECT * 
FROM emp 
WHERE EXISTS (
    SELECT E_id 
    FROM project
    WHERE emp.E_id = project.E_id
);



-- Corelated Subquery (Synchronized Query)
-- It is a subquery that uses values from outer query.
-- Top to Down approach

-- find all emp detail who work in a department
SELECT * 
FROM emp AS e
WHERE EXISTS (
    SELECT * 
    FROM department AS d
    WHERE d.E_id = e.E_id
);








CREATE TABLE workers (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO workers
VALUES
(1, "Varun"),
(2, "Arun"),
(3, "Karuna"),
(4, "Amrit"),
(5, "Ranjeet"),
(6, "Ajeet");

-- find employee detail whose name starting with 'A'
SELECT * FROM workers 
WHERE Name LIKE 'A%';

-- find employee detail whose name ending with 'n'
SELECT * FROM workers 
WHERE Name LIKE '%n';

-- find employee detail whose name contains 'ee'
SELECT * FROM workers 
WHERE Name LIKE '%ee%';

-- find employee detail whose name contain 'a' in second place.
SELECT * FROM workers 
WHERE Name LIKE '_a%';

-- find employee detail whose name contain 'a' in second place and name should contain total five characters.
SELECT * FROM workers 
WHERE Name LIKE '_a___';





-- Case and Character Manipulation Queries

SELECT * FROM workers;

SELECT LOWER(Name) FROM workers;

SELECT UPPER(Name) FROM workers;

SELECT INITCAP(Name) FROM workers;

SELECT CONCAT(ID, Name) AS concated_values FROM workers;

SELECT SUBSTR(Name, 2, 5) AS substring_values , INSTR(Name, 'T') AS instring_values FROM workers;

SELECT Name, LENGTH(Name) AS length FROM workers;

SELECT RPAD(Name, 15, '*') AS right_padded FROM workers;

SELECT LPAD(Name, 15, '*') As left_paddded FROM workers;

SELECT TRIM('V' from Name) AS trimmed_values FROM workers;

SELECT REPLACE(Name, 'V', 'T') AS replaced_value FROM workers;



