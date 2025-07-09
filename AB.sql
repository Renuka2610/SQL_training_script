drop procedure raise_salary;
DELIMITER //
CREATE PROCEDURE raise_salary(IN p_emp_id INT)
BEGIN
select p_emp_id;
UPDATE employees
    SET emp_salary = emp_salary * 1.10
    WHERE emp_ID = p_emp_id;
    SELECT * FROM employees;
END //

DELIMITER ;



select * from employees;

call raise_salary(1);