USE demo_db;

show tables;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (emp_id, name, age, department, salary)
VALUES 
(101, 'Alice', 30, 'HR', 50000.00),
(102, 'Bob', 28, 'IT', 60000.00),
(103, 'Charlie', 35, 'Finance', 75000.00);

select * from employees;


