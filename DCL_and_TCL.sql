USE department;

CREATE TABLE Students (
    StudentId INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);

-- Data Control Language
-- Grant and Revoke

REVOKE INSERT ON Students FROM user_name;

GRANT SELECT, INSERT ON Students TO user_name;




-- Transaction Control Language 
-- Commit, Rollback and Savepoint


START Transaction;

INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES (2, 'Jane', 'Smith', '2023-06-15');

SAVEPOINT Save1;

UPDATE Students
SET LastName = 'Doe'
WHERE StudentID = 2;

ROLLBACK TO Save1;

COMMIT;