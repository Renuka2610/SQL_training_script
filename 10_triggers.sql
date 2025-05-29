use demo_db;
-- Step 0: Cleanup if needed
DROP TABLE IF EXISTS employee_audit, employees;
DROP TRIGGER IF EXISTS before_insert_users;
DROP TRIGGER IF EXISTS after_insert_emp;
DROP EVENT IF EXISTS cleanup_old_logs;
DROP table IF EXISTS users;
DROP table IF EXISTS audit_log;

-- Step 1: Create Main Table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO employees (emp_id, name, salary) VALUES
(1, 'Alice Johnson', 50000),
(2, 'Bob Smith', 60000),
(3, 'Carol Davis', 55000),
(4, 'David Lee', 62000),
(5, 'Eva Brown', 58000);

INSERT INTO employees (emp_id, name, salary) VALUES
(8, 'mark Johnson', 10000);
delete from employees where emp_id = 8;
-- Step 2: Create Audit Table
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(10),
    action_time DATETIME,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2)
);

-- Step 3: BEFORE INSERT Trigger
DELIMITER //

CREATE TRIGGER before_insert_emp
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.salary = IF(NEW.salary < 30000, 30000, NEW.salary);
END;
//

DELIMITER ;
-- Step 3: AFTER INSERT Trigger
DELIMITER //

CREATE TRIGGER after_insert_emp
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
 --   INSERT INTO employee_audit(emp_id, action_type, action_time, new_salary)
  --  VALUES (NEW.emp_id, 'INSERT', NOW(), NEW.salary);
   select 'insert successful';
END;
//

DELIMITER ;

-- Step 4: AFTER UPDATE Trigger
DELIMITER //
CREATE TRIGGER after_update_users
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_type, username)
    VALUES ('UPDATE', NEW.name);
END;
//
DELIMITER ;


-- BEFORE UPDATE
DELIMITER //

CREATE TRIGGER before_update_emp
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 25000 THEN
        SET NEW.salary = 25000;
    END IF;
END;
//

DELIMITER ;
--  AFTER UPDATE
DELIMITER //

CREATE TRIGGER after_update_emp
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(emp_id, action_type, action_time, old_salary, new_salary)
    VALUES (NEW.emp_id, 'UPDATE', NOW(), OLD.salary, NEW.salary);
END;
//

DELIMITER ;
-- BEFORE DELETE
DELIMITER //

CREATE TRIGGER before_delete_emp
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(emp_id, action_type, action_time, old_salary)
    VALUES (OLD.emp_id, 'DELETE-BEFORE', NOW(), OLD.salary);
END;
//

DELIMITER ;
-- AFTER DELETE
DELIMITER //

CREATE TRIGGER after_delete_emp
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(emp_id, action_type, action_time, old_salary)
    VALUES (OLD.emp_id, 'DELETE', NOW(), OLD.salary);
END;
//

DELIMITER ;

select * from employees;
select * from em	ployee_audit;
show triggers;
drop trigger after_insert_emp;
