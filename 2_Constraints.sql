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
INSERT INTO departments (dept_id, dept_name) VALUES
(4, 'HR');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    salary DECIMAL(10, 2) DEFAULT 30000.00,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(dept_id)
);
-- for CHECK
 INSERT INTO employees (emp_id, name, email, age, department_id)
VALUES (201, 'Alice', 'alice@example.com', 17, 1);

-- for Default -- remove the salary and push
INSERT INTO employees (emp_id, name, email, age, salary, department_id)
VALUES (206, 'David', 'david12@example.com', 40, 50000, 6);

 desc employees;
select * from employees;
