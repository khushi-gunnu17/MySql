# SQL
SQL is a programming language used to interact with relational databases.

It is used to perform CRUD operations :
Create 
Read
Update
Delete

## DataTypes in SQL
- CHAR          (string(0 - 255), can store characters of fixed length.)
- VARCHAR       (string(0 - 255), can store characters up to given length.)
- BLOB          (string(0 - 65535), can store binary large digit.)
- INT           ( integer (-2147483648 to 2147483647) )
- TINYINT       (integer(-128 to 127))
- BIGINT        integer()
- BIT           (can store x-bit values. x can range from 1 to 64)
- FLOAT         (Decimal Number - with precision to 23 digits)
- DOUBLE        (Decimal Number - with 24 to 53 digits)
- BOOLEAN       (Boolean Values 0 or 1)
- DATE          (date in format of YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31)
- YEAR          (year in 4 digits format ranging from 1901 to 2155 )
- signed and unsigned       ( TINYINT UNSIGNED = RANGE (0 TO 255) )


## Types of SQL Commands
- DDL (Data Definition Language) : create, alter, rename, truncate and drop
- DQL (Data Query Laguage) : select
- DML (Data Manipulation Language) : insert, update and delete
- DCL (Data Control Language) : grant and revoke permission to users
- TCL (Transaction Control Language) : start transaction, commit, rollback (E)


## Keys

### Primary Key
1. It is a column (or set of columns) in a table that uniquely identifies each row. (a unique id).
2. There is only 1 PK and it should be NOT null.

### Foreign Key
1. A foreign key is a column (or set of columns) in a table that refers to the primary key in anothe table.
2. There can be multiple FKs in a table.
3. FKs can have duplicate and null values.


## Constraints
SQL Constraints are used to specify rules for data in a table.

- NOT NULL - columns cannot have a null value.
- UNIQUE - all values in colimn are different.
- PRIMARY KEY - makes a column unique and not null but used only for one.

- FOREIGN KEY - prevent action that would destroy links between tables


> CREATE TABLE temp (  
    cust_ind INT,   
    FOREIGN KEY (cust_id) references customer(id)  
);

- DEFAULT - sets the default value of a column

salary INT DEFAULT 25000

- CHECK - It can limit the values allowed in a column.


> CREATE TABLE city (  
    id INT PRIMARY KEY,  
    city VARCHAR(50),  
    age INT,  
    CONSTRAINT age_check CHECK (AGE >= 18 AND city == "Delhi")  
);

OR

> CREATE TABLE newTab (  
    age INT CHECK (age >= 18)  
);


## Select in Detail
used to select any data from the database

Basic Syntax =>  
SELECT col1, col2 FROM table_name;

To select All  =>
> SELECT * FROM table_name;


## WHERE Clause
To Define some conditions

Syntax =>  
SELECT col1, col2 FROM table_name
WHERE conditions;

> SELECT * FROM student   
WHERE marks > 80;



### Operators in Where Clause
Using Operators in WHERE

- Arithmetic Operators
- Comparion Operators
- Logical Operators : AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
- Bitwise Operators : & (Bitwise AND), | (Bitwise OR)



## Limit Clause 
Sets an upper limit on number of (tuples) rows to be returned.

> SELECT * FROM student LIMIT 3;



## Order By Clause
To sort in Ascending Order (ASC) or Descending Order (Desc)

> SELECT * FROM student ORDER BY city ASC;



## Aggregate Functions
Aggregate functions perform a calculation on a set of values, and return a single value.
- COUNT()
- MAX()
- MIN()
- SUM()
- AVG()



## Group By Clause
Groups rows that have the same values into summary rows.  
It collects data from multiple records and groups the result by one or more column.

Generally we use group by with some aggregation function.

Basic Syntax : 
> SELECT city, COUNT(name) FROM student GROUP BY city;



## Having Clause
Similar to Where i.e applies some conditions on rows.  
Used when we want to apply any condition after grouping.



## General Order
SELECT column(s)  
FROM  table_name  
WHERE condition  
GROUP BY column(s)  
HAVING condition  
ORDER BY column(s) ASC OR DESC;







## Table Related Queries

- Update (to update existing rows)

> UPDATE table_name  
SET col1 = val1, col2 = val2  
WHERE condition;


- Delete (to delete existing rows)

Syntax =>   
> DELETE FROM table_name  
WHERE condition;

- Alter (To change the schema)  
#### Methods with their syntaxes =  
> ADD Column  =>  
ALTER TABLE table_name  
ADD COLUMN column_name datatype constraint;

> DROP Column  =>  
ALTER TABLE table_name  
DROP COLUMN column_name;

> RENAME Table  =>  
ALTER TABLE table_name  
RENAME TO new_table_name;

> CHANGE column (rename)  =>  
ALTER TABLE table_name  
CHANGE old_name new_name new_datatype new_constraint;  

> MODIFY column (modify datatype/constraint)  =>  
ALTER TABLE table_name  
MODIFY col_name new_datatype new_constraint; 


- Truncate (To delete table's data)  

Syntax =>  
TRUNCATE TABLE table_name;


### Cascading Foreign Key
- On Delete Cascade  
When we create a foreign key using this option, it deletes the referencing rows in the child table when the referenced row is deleted in the parent table which has a primary key.

- On Update Cascade  
When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child table when the referenced row is updated in the parent table which has a primary key.







## Joins In SQL
Join is used to combine rows from two or more tables, based on a related column between them.

### Types of Joins
- Inner Join
- Outer Join (Left, Right and Full)


#### Inner Join
- Returns records that have matching values in both tables.

Syntax  =>  
> SELECT column(s)  
FROM tableA  
INNER JOIN tableB  
ON tableA.col_name = tableB.col_name;


#### Left Join
- Returns all records from the left table, and the matched records from the right table.

Syntax =>  
> SELECT column(s)  
FROM tableA  
LEFT JOIN tableB  
ON tableA.col_name = tableB.col_name;



#### Right Join
- Returns all records from the right table, and the matched records from the left table.

Syntax =>  
> SELECT column(s)  
FROM tableA as alias  
RIGHT JOIN tableB  
ON tableA.col_name = tableB.col_name;


#### Full Join
- Returns all records when there is a match in either left or right table.

Syntax =>  
> SELECT column(s)  
FROM tableA as alias  
LEFT JOIN tableB as alias  
ON tableA.col_name = tableB.col_name;  
UNION  
SELECT column(s)  
FROM tableA as alias  
RIGHT JOIN tableB as alias  
ON tableA.col_name = tableB.col_name;


LEFT JOIN  
UNION  
RIGHT JOIN  


#### Left Exclusive Join
Syntax =>  
> SELECT column(s)  
FROM tableA as alias  
LEFT JOIN tableB as alias  
ON tableA.col_name = tableB.col_name  
WHERE tableB.col_name IS NULL;


#### Right Exclusive Join
Syntax =>  
> SELECT column(s)  
FROM tableA as alias  
RIGHT JOIN tableB as alias  
ON tableA.col_name = tableB.col_name  
WHERE tableA.col_name IS NULL;


#### Self Join
- It is a regular join but the table is joined with itself.
- to make out the values from the same table.

Syntax =>  

> SELECT column(s)  
FROM table as a  
JOIN table as b  
ON a.col_name = b.col_name;  


## Union
It is used to combine the result-set of two or more SELECT statements, Gives UNIQUE records.

To use it : 

- every SELECT should have same number of columns.
- columns must have similar data types.
- columns in every SELECT should be in same order.

Syntax =>  
SELECT column(s) FROM tableA  
UNION   
SELECT column(s) FROM tableB

- UNION ALL = allows duplicates also.


## SQL Sub Queries
A subquery or inner query or a Nested query is a query within another SQL query.

It involves 2 Select statements.

Syntax =>  
SELECT column(s)
FROM table_name
WHERE col_name operator
(subquery);

Types of writing SubQueries in Subqueries --->
- SELECT
- FROM 
- WHERE



## MySql Views
A view is a virtual table based on the result-set of an SQL statement.

Queries -->
> CREATE VIEW view1 AS  
SELECT rollno, name FROM students;

> SELECT * FROM view1;

- A view always shows up-to-date data. The database engine recreates the view, every time a user queries it.