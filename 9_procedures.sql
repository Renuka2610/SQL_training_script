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
DELIMITER //
CREATE PROCEDURE show_all_employees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;

-- Call it
CALL show_all_employees();

-- -----------------------------------------------------------------------
-- IN-only Procedure
DELIMITER //

CREATE PROCEDURE raise_salary(IN p_emp_id INT)
BEGIN
    UPDATE employees
    SET emp_salary = emp_salary * 1.10
    WHERE emp_id = p_emp_id;
END 
//

DELIMITER ;

-- Call it
CALL raise_salary(2); -- raises Bob's salary
call show_all_employees;
Set @emp = 3;
CALL raise_salary(@emp); -- raises Dan's salary
-- -- -----------------------------------------------------------------------
-- OUT-only Procedure
DELIMITER //

CREATE PROCEDURE get_total_employees(OUT total INT)
BEGIN
 select total; 
set total = 7;
  --   SELECT COUNT(*) INTO total FROM employees;
END //

DELIMITER ;

-- Call it
SET @emp_count = 3;
CALL get_total_employees(@emp_count); -- emp_count is just a vessel here
SELECT @emp_count AS total_employees;
 DROP PROCEDURE IF EXISTS get_total_employees;
-- -----------------------------------------------------------------------
-- IN-OUT Procedure

DELIMITER //

CREATE PROCEDURE add_bonus(OUT bonus DECIMAL(10,2))
BEGIN
 select bonus; 
    SET bonus = bonus + 500;
END //

DELIMITER ;

-- Call it
SET @my_bonus = 1000;
CALL add_bonus(@my_bonus);
SELECT @my_bonus AS updated_bonus;
