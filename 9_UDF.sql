-- create database demo_db;
-- use sys;
-- show tables;
-- DROP FUNCTION IF EXISTS get_time_based_code;
use demo_db;
drop table students;

CREATE TABLE students (
    roll_no INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);
INSERT INTO students VALUES
(1, 'Asha', 90),
(2, 'Vivek', 76),
(3, 'Sneha', 58),
(4, 'Amit', 39),(5, 'Pramit', 62);


DELIMITER $$

CREATE FUNCTION get_grade(marks INT)
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(2);

    IF marks >= 90 THEN
        SET grade = 'A+';
    ELSEIF marks >= 75 THEN
        SET grade = 'A';
    ELSEIF marks >= 60 THEN
        SET grade = 'B';
    ELSEIF marks >= 45 THEN
        SET grade = 'C';
    ELSE
        SET grade = 'F';
    END IF;

    RETURN grade;
END$$

DELIMITER ;

SELECT roll_no, student_name, marks, get_grade(marks) AS grade FROM students;
-- -------------------------------------------------------------------------------------------------------



DELIMITER $$

CREATE FUNCTION get_time_based_code(marks int)
RETURNS INT
READS SQL DATA -- 	Tells MySQL: “I’m reading system data”
NOT DETERMINISTIC
BEGIN
    DECLARE sec INT;
    DECLARE result INT;

    SET sec = SECOND(NOW());
   set result =  sec + marks;
    RETURN result;
END$$

DELIMITER ;
-- select SECOND(NOW());
SELECT student_name,marks, get_time_based_code(marks) AS NewMarks FROM students;

-- ---------------------------------------------------------------------------------------
-- funct1(x){
-- func2 (y)
-- }

--  funct1(func2(x))
