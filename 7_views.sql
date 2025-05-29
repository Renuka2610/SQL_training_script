use demo_db;
drop table employees;

CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  dept_id INT,
  salary INT
);

INSERT INTO employees (name, dept_id, salary) VALUES
('Alice', 101, 50000),
('Bob', 102, 60000),
('Charlie', 101, 55000);

CREATE VIEW hr_employees AS
SELECT name, salary
FROM employees
WHERE dept_id = 101;


SELECT * FROM hr_employees;
SELECT * FROM employees;

