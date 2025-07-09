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
    department_id INT unique ,
   FOREIGN KEY (department_id) REFERENCES departments(dept_id)
);
-- for CHECK
 INSERT INTO employees (emp_id, name, email, age, salary)
VALUES (2011, 'Alice', 'alicae@example.com', 18, 300);

-- for Default -- remove the salary and push
INSERT INTO employees 
VALUES (2012, 12 , 'david12256ql514@example.com', '50', 40,6 );

 desc employees;
select * from employees;
select * from departments;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'employees';

