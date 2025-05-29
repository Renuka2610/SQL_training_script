-- Create base table

-- CREATE AND USE DB, AND MAKE SURE THIS TABLE DOES NOT EXIT

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 55000);

-- Add a new column for department
ALTER TABLE Employees ADD COLUMN department VARCHAR(50);

-- Modify salary column to be NOT NULL with updated precision
ALTER TABLE Employees MODIFY salary DECIMAL(12, 2) NOT NULL;

-- Rename column 'name' to 'full_name'
ALTER TABLE Employees CHANGE name full_name VARCHAR(100);

-- Add a UNIQUE constraint on full_name
ALTER TABLE Employees ADD CONSTRAINT unique_name UNIQUE (full_name);

-- Drop the department column
ALTER TABLE Employees DROP COLUMN department;

-- Rename the table for broader use
ALTER TABLE Employees RENAME TO Staff;

-- Add an auto-incrementing id (MySQL only — usually needs to be created at table definition)
ALTER TABLE Staff MODIFY id INT AUTO_INCREMENT;

-- Reorder the full_name column after id (MySQL only)
ALTER TABLE Staff MODIFY full_name VARCHAR(100) AFTER id;

-- Oracle-only: Make a column invisible in SELECT *
-- ALTER TABLE Staff MODIFY salary INVISIBLE;

-- Example of partitioning (MySQL only, requires engine=InnoDB and additional setup)
-- ALTER TABLE Staff PARTITION BY RANGE (id) (
--   PARTITION p0 VALUES LESS THAN (3),
--   PARTITION p1 VALUES LESS THAN (6)
-- );
