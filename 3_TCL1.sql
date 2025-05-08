use demo_db;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50)
);

SELECT @@autocommit;
SET autocommit = 0;

select * from students;

INSERT INTO students (id, name, age) VALUES (7, 'Rollback Test 2', 99);

rollback;
commit;
