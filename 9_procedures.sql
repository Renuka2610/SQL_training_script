-- create database demo_db;
use sys;

show tables;

use demo_db;
show tables;
drop tables if exists  employees, employees2, employees3 ;

 SHOW PROCEDURE STATUS WHERE Db = 'demo_db';
 SHOW CREATE PROCEDURE show_all_employees;
 -- DROP PROCEDURE IF EXISTS get_total_employees, raise_salary, show_all_employees, add_bonus;



-- session variable
Set @greeting = now() ;
Select @greeting;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    emp_salary DECIMAL(10,2)
);

INSERT INTO employees (emp_name, emp_salary)
VALUES ('Alice', 40000), ('Bob', 50000), ('Charlie', 60000), ('Dave', 70000),('Eva', 80000);
-- -----------------------------------------------------------------------
-- Simple Procedure
DROP PROCEDURE if exists show_all_employees;
DELIMITER //
CREATE PROCEDURE show_all_employees()
BEGIN
  SELECT emp_name FROM employees ;
SELECT emp_salary FROM employees ;
END //

DELIMITER ;
SELECT * FROM employees;

-- Call it
CALL show_all_employees();

-- -----------------------------------------------------------------------
-- IN-only Procedure
DROP PROCEDURE if exists raise_salary ;
DELIMITER //
CREATE PROCEDURE raise_salary(IN p_emp_id INT)
BEGIN
select p_emp_id;
    UPDATE employees
    SET emp_salary = emp_salary * 1.10
    WHERE emp_id = p_emp_id;
    SELECT * FROM employees;
END 
//
DELIMITER ;
SELECT * FROM employees;
drop procedure raise_salary;
-- Call it
CALL raise_salary(2); -- raises Bob's salary
call show_all_employees;
Set @emp = 4;
CALL raise_salary(@emp); -- raises Dan's salary
-- -- -----------------------------------------------------------------------
-- OUT-only Procedure
SELECT @@autocommit; 
drop procedure get_total_employees;
DELIMITER //

CREATE PROCEDURE get_total_employees(out total INT)
BEGIN


select @emp_count; 
select total as total; 
-- set total = 7;
   --  SELECT COUNT(*) INTO total FROM employees;
END //

DELIMITER ;

-- Call it
SET @emp_count = 3;
CALL get_total_employees(@emp_count); -- emp_count is just a vessel here
SELECT @emp_count AS total_employees;
 
-- -----------------------------------------------------------------------
-- IN-OUT Procedure
DROP PROCEDURE IF EXISTS add_bonus;
DELIMITER //

CREATE PROCEDURE add_bonus(INOUT bonus DECIMAL(10,2))
BEGIN
 -- select bonus as oldB; 
    SET bonus = bonus + 500;
END //
DELIMITER ;
-- Call it
SET @my_bonus = 1000;
CALL add_bonus(@my_bonus);
SELECT @my_bonus AS updated_bonus;
SHOW PROCEDURE STATUS WHERE Db = 'demo_db';
 SHOW CREATE PROCEDURE show_all_employees;