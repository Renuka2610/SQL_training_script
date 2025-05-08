use demo_db;
show tables;
drop table students;

-- Step 1: Create the students table (if not already exists)
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- Step 2: INSERT data into students table
INSERT INTO students (id, name, age) 
VALUES (1, 'Alice', 21), 
       (2, 'Bob', 22), 
       (3, 'Charlie', 20);

-- View table after INSERT
SELECT * FROM students;

-- Step 3: UPDATE Alice's age to 23 
UPDATE students 
SET age = 23 
WHERE id = 1;
SELECT * FROM students;


-- SET SQL_SAFE_UPDATES = 0;
UPDATE students 
SET age = 71
WHERE name = 'Alice';
 

-- View table after UPDATE
SELECT * FROM students;

-- Step 4: DELETE Bob from the table
INSERT INTO students (id, name, age) VALUES (7, 'Bob', 22); -- multiple bobs

DELETE FROM students 
WHERE name = 'Bob';

-- View table after DELETE
SELECT * FROM students;
-- SET SQL_SAFE_UPDATES = 1;
