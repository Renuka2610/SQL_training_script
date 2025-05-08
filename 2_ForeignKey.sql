use demo_db;
drop table employees;
 drop table departments;



-- Dept table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Emp table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(dept_id)
);
INSERT INTO employees (emp_id, name, age, department_id) VALUES
(101, 'Alice', 30, 1),
(102, 'Bob', 28, 2),
(103, 'Charlie', 35, 3),
(104, 'John', 30, 1);
select * from employees;
INSERT INTO employees (emp_id, name, age, department_id) VALUES
(107, 'David', 29, 1);  -- ERROR: department_id 5 does not exist!


-- best example is joins--
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
JOIN departments d ON e.department_id = d.dept_id;
