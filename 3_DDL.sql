use demo_db;
drop table students;

-- 1. CREATE: Create the students table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- Insert sample data to verify
INSERT INTO students VALUES (1, 'Alice', 21), (2, 'Bob', 22);

-- View table after CREATE
SELECT * FROM students;
desc students;

-- 2. ALTER: Add a new column 'email'
ALTER TABLE students ADD email VARCHAR(100);

-- Update sample rows to fill email
UPDATE students SET email = 'alice@email.com' WHERE id = 1;
UPDATE students SET email = 'bob@email.com' WHERE id = 2;

-- View table after ALTER
SELECT * FROM students;
desc students;

-- 3. TRUNCATE: Delete all rows but keep the structure
TRUNCATE TABLE students;

-- View table after TRUNCATE (should be empty but structure remains)
SELECT * FROM students;
-- 4. DROP: Permanently delete the table
DROP TABLE students;
show tables;
-- View table after DROP (will throw error because table no longer exists)
SELECT * FROM students;

