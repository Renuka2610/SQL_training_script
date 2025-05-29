use demo_db;
drop table employees;

-- Create the employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10, 3),
    hire_date DATE,
    dept_id INT
);


-- Insert sample data
INSERT INTO employees (name, email, salary, hire_date, dept_id) VALUES
('Alice', 'alice@example.com', 50000.754, '2020-01-15', 101),
('Bob', 'bob@example.com', 62000.499, '2019-03-20', 102),
('Carol', 'carol@example.com', 70000, '2022-11-01', 101),
('David', 'david@example.com', 45000.125, '2023-05-10', 103),
('Eve', 'eve@example.com', 58000, '2021-07-22', 102);


select * from employees;

-- String Functions
SELECT name, CONCAT(name, ' - ', email,' ', hire_date) AS contact_info FROM employees; -- concat
SELECT name, LENGTH(name) AS name_length FROM employees; -- LENGTH
SELECT name, SUBSTRING(name, 1, 5) AS email_prefix FROM employees; -- subsrtring (field, begin, size) -- min is 1
SELECT name, REPLACE(email, '@example.com', '@company.org') AS updated_email FROM employees; -- replace (fld, old str, new str)
SELECT 
    name, 
    CONCAT(name, ' - ', email) AS contact_info,
    LENGTH(name) AS name_length,
    SUBSTRING(email, 1, 5) AS email_prefix,
    REPLACE(email, '@example.com', '@company.org') AS updated_email
FROM employees;

-- Numeric Functions
SELECT name, salary, ROUND(salary) AS rounded_salary FROM employees; --  round (fld, round by value)
SELECT name, salary as og_Salary, CEIL(salary) AS ceil_salary, FLOOR(salary) AS floor_salary FROM employees; -- floor/ceil (fld)
SELECT id, MOD(id, 2) AS is_even FROM employees;  -- 0 for even, 1 for odd

SELECT 
    name, salary as og_Salary,
    ROUND(salary, 1) AS rounded_salary,
    CEIL(salary) AS ceil_salary,
    FLOOR(salary) AS floor_salary,
    id as og_ID,
    MOD(id, 2) AS is_evenMODED
FROM employees;

-- Date & Time Functions
SELECT NOW() AS current_datetime, CURDATE() AS 'current_date';
 -- SELECT  current_date, CURDATE() AS 'curr_date';


SELECT name, DATEDIFF(CURDATE(), hire_date) AS days_worked FROM employees; --  DATEDIFF(date1, date2)
SELECT  DATEDIFF(CURDATE(),'1999-10-26') AS 'Age in days' ;
SELECT  DATEDIFF('2000-10-26','1999-10-26') AS 'Age in days' ; 

SELECT name, TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked FROM employees; -- TIMESTAMPDIFF(unit, datetime1, datetime2)

SELECT
  TIMESTAMPDIFF(SECOND, '2025-05-11 10:00:00', '2026-05-11 10:00:30') AS seconds_diff,
  TIMESTAMPDIFF(MINUTE, '2025-05-11 10:00:00', '2025-05-11 10:30:00') AS minutes_diff,
  TIMESTAMPDIFF(HOUR, '2025-05-11 10:00:00', '2025-05-11 18:00:00') AS hours_diff,
  TIMESTAMPDIFF(DAY, '2025-05-01', '2025-05-11') AS days_diff,
  TIMESTAMPDIFF(MONTH, '2025-01-01', '2025-05-01') AS months_diff,
  TIMESTAMPDIFF(QUARTER, '2024-01-01', '2024-10-01') AS quarters_diff,
  TIMESTAMPDIFF(YEAR, '2020-01-01', '2025-01-01') AS years_diff;

SELECT 
    name,
    CURDATE() AS today,
    NOW() AS now,
    DATEDIFF(CURDATE(), hire_date) AS days_worked,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;

-- Aggregate Functions
SELECT * FROM employees;
SELECT COUNT(*) AS total_employees FROM employees;
SELECT SUM(salary) AS total_salary FROM employees;

SELECT AVG(salary) AS average_salary FROM employees;
SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;

SELECT MIN(salary) AS lowest_salary, MAX(salary) AS highest_salary FROM employees;
SELECT 
    dept_id, count(*),
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
GROUP BY dept_id;

SELECT 
    dept_id,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id;




-- Conversion Functions
SELECT 
    name,
    CAST(salary AS SIGNED) AS salary_as_int,
    CONVERT(hire_date, CHAR) AS hire_date_str
FROM employees;
-- Using CAST
SELECT CAST('2024-01-01' AS DATE);
SELECT CONVERT(now(), char) AS hire_date_str;

-- Using CONVERT
SELECT CONVERT('2024-01-01', DATE);

