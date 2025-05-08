use demo_db;
drop table students;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT
);
desc students;
INSERT INTO students (name, age) VALUES ('Alice', 21);
-- INSERT INTO students VALUES (8,'Bob7', 22);
INSERT INTO students (name, age) VALUES ('Charlie', 20);

ALTER TABLE students AUTO_INCREMENT = 1001;
-- MySQL does not allow setting AUTO_INCREMENT starting value inside CREATE TABLE, 
-- but ALTER TABLE works perfectly.

select * from students;