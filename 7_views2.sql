use demo_db;
drop table employees;

CREATE TABLE employees (
  emp_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  dept VARCHAR(50),
  salary INT
);
SELECT * FROM employees;

CREATE or replace VIEW simple_emp_view AS SELECT emp_id, name, salary FROM employees;

INSERT INTO simple_emp_view (name,  salary)VALUES ('Rama', 65000);

UPDATE simple_emp_view SET salary = 50000 WHERE emp_id = 1;

DELETE FROM simple_emp_view WHERE emp_id = 1;

select * from simple_emp_view;
-- select * from high_salaries;

INSERT INTO employees (name, dept, salary)
VALUES 
('Ravi', 'IT', 55000),
('Meena', 'Finance', 60000),
('John', 'HR', 47000),
('Priya', 'Marketing', 52000),
('Arjun', 'Sales', 48000),
('Sanya', 'Finance', 63000),
('Karan', 'IT', 58000),
('Neha', 'HR', 50000);

CREATE or replace VIEW high_salaries AS
SELECT  * FROM employees WHERE salary > 55000;

-- DDL Changes will not be reflected on the view
alter table employees add column DOB varchar(20);
select * from simple_emp_view;
select * from high_salaries;
select * from employees;
 -- show full tables;

drop table employees;
drop view high_salaries;
drop view simple_emp_view;
