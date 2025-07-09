
drop database  if exists demo_db;
create database if not exists demo_db;
USE demo_db;
show databases;
drop table Employees;
show tables;
CREATE TABLE Employees (
    emp_id INT primary key ,
    name VARCHAR(100) ,
    age INT not null,
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (emp_id, name,  department, salary)
VALUES 
(101, 'Alice', 'HR', 50000.00),
(102, 'Bob', 'IT', 60000.00),
(103, 'Charlie','Finance', 75000.00);

select * from employees;
show tables;
desc employees;

SHOW CREATE TABLE employees;
