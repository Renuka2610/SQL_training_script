use demo_db;
drop table employees;

CREATE TABLE employees (
  emp_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  dept VARCHAR(50),
  salary INT
);

CREATE VIEW simple_emp_view AS
SELECT emp_id, name, dept, salary FROM employees;

INSERT INTO high_salaries (name,  salary)
VALUES ('Rama', 45000);

UPDATE simple_emp_view
SET salary = 50000
WHERE emp_id = 1;

DELETE FROM simple_emp_view
WHERE emp_id = 1;

select * from simple_emp_view;
select * from high_salaries;

INSERT INTO simple_emp_view (name, dept, salary)
VALUES 
('Ravi', 'IT', 55000),
('Meena', 'Finance', 60000),
('John', 'HR', 47000),
('Priya', 'Marketing', 52000),
('Arjun', 'Sales', 48000),
('Sanya', 'Finance', 63000),
('Karan', 'IT', 58000),
('Neha', 'HR', 50000);

CREATE VIEW high_salaries AS
SELECT name, salary FROM employees WHERE salary > 55000;

drop view high_salaries;