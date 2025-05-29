use demo_db;

-- Step 1: Drop if exists
DROP TABLE IF EXISTS employees, departments, locations;

-- Step 2: Create tables
CREATE TABLE locations (
    id INT PRIMARY KEY,
    location VARCHAR(50)
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Step 3: Insert data
INSERT INTO locations VALUES
(1, 'NY'),
(2, 'CA'),
(3, 'TX'),
(4, 'FL'),
(5, 'NV');

INSERT INTO departments VALUES
(101, 'HR', 'NY'),
(102, 'Engineering', 'CA'),
(103, 'Marketing', 'TX'),
(104, 'Sales', 'NV');

INSERT INTO employees VALUES
(1, 'Alice', 101, 55000),
(2, 'Bob', 102, 80000),
(3, 'Charlie', 102, 85000),
(4, 'David', 103, 60000),
(5, 'Eva', 104, 75000);

-- Step 4: Correlated Subquery
SELECT name 
FROM employees e 
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE dept_id = e.dept_id
);

-- Step 5: Non-Correlated Subquery
SELECT name 
FROM employees 
WHERE dept_id IN (
    SELECT dept_id 
    FROM departments 
    WHERE location = 'NY'
);

-- Step 6: Nested Query
SELECT name 
FROM employees 
WHERE dept_id = (
    SELECT dept_id 
    FROM departments 
    WHERE location = (
        SELECT location 
        FROM locations 
        WHERE id = 1
    )
);

-- Step 7: EXISTS
SELECT dept_name 
FROM departments d 
WHERE EXISTS (
    SELECT 1 
    FROM employees e 
    WHERE e.dept_id = d.dept_id
);

-- Step 8: NOT EXISTS
SELECT dept_name 
FROM departments d 
WHERE NOT EXISTS (
    SELECT 1 
    FROM employees e 
    WHERE e.dept_id = d.dept_id
);
