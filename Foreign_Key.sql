CREATE DATABASE department;

-- Initializing Foreign Key and cascading Functions

USE department;

-- Parent Table 
CREATE TABLE dept (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept
VALUES 
(101, "English"),
(102, "Maths");

UPDATE dept
SET id = 103
WHERE id = 102;

SELECT * FROM dept;



-- Child Table 
CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES dept(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- DROP TABLE teacher; 

INSERT INTO teacher
VALUES 
(1, "Adam", 101),
(2, "Eve", 102);

SELECT * FROM teacher;

