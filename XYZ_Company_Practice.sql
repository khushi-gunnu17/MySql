CREATE DATABASE XYZ_Company;

USE XYZ_Company;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT
);

INSERT INTO employee 
(id, name, salary)
VALUES 
(1, "Adam", 20000),
(2, "Bob", 30000),
(3, "Casey", 35000);


SELECT * FROM employee;

