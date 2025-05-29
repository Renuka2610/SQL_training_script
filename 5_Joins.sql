use demo_db;
drop table departmentsJoin;
drop table employeesJoin;

-- -------------------------- DUMMY DATA --------------------------------------------------------------------
CREATE TABLE departmentsJoin (dept_id INT PRIMARY KEY, dept_name VARCHAR(50));
INSERT INTO departmentsJoin VALUES(1, 'HR'),(2, 'Finance'),(3, 'Engineering'),(4, 'Marketing');
CREATE TABLE employeesJoin (emp_id INT PRIMARY KEY,emp_name VARCHAR(50),dept_id INT);
INSERT INTO employeesJoin VALUES(101, 'Alice', 1),(102, 'Bob', 2),(103, 'Charlie', 3),(104, 'David', NULL),(105, 'Eve', 5); -- no matching department
-- -------------------------- DUMMY DATA --------------------------------------------------------------------
SELECT * FROM employeesJoin;
SELECT * FROM departmentsJoin;


-- 1: INNER JOIN: Matches only where dept_id exists in both tables
SELECT e.emp_id, e.emp_name, d.dept_name, e.dept_id 
FROM employeesJoin e
INNER JOIN departmentsJoin d ON e.dept_id = d.dept_id ;

-- 2. LEFT JOIN: All employees, even if no department
SELECT e.emp_name, d.dept_name
FROM employeesJoin e
LEFT JOIN departmentsJoin d ON e.dept_id = d.dept_id;

-- 3. RIGHT JOIN: All departments, even if no employee
SELECT e.emp_name, d.dept_name
FROM employeesJoin e
RIGHT JOIN departmentsJoin d ON e.dept_id = d.dept_id;

-- 4. FULL OUTER JOIN (MySQL doesn't support directly — use UNION)
SELECT *
FROM employeesJoin e
LEFT JOIN departmentsJoin d ON e.dept_id = d.dept_id

 UNION


SELECT *
FROM employeesJoin e
RIGHT JOIN departmentsJoin d ON e.dept_id = d.dept_id;



-- 5. CROSS JOIN: All possible combinations (Cartesian product)
SELECT e.emp_name, d.dept_name
FROM employeesJoin e
CROSS JOIN departmentsJoin d;

Select * from employeesJoin;
Select * from departmentsJoin;
-- Select emp_id, emp_Name, dept_name from employeesJoin e  join departmentsJoin d where e.dept_id = d.dept_id;
 Select * from employeesJoin e  join departmentsJoin d on e.dept_id = d.dept_id;
 update  employeesJoin set dept_id = null where emp_id = 104;
 
 
SELECT emp_name FROM employeesJoin UNION SELECT dept_name FROM departmentsJoin;

-- LEFT TABLE AS A RIGHT TABLE
 Select * from employeesJoin e  left join departmentsJoin d on e.dept_id = d.dept_id;
  Select emp_id, emp_name, e.dept_id, d.dept_id, dept_name from departmentsJoin d  right join employeesJoin e  on e.dept_id = d.dept_id;
  