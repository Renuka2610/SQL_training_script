-- Funception — calling a function inside another function

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

CREATE FUNCTION get_luck_statusTrad(marks INT)
RETURNS VARCHAR(20)
READS SQL DATA
NOT DETERMINISTIC
BEGIN
    DECLARE new_marks INT;
    DECLARE status VARCHAR(20);

     SET new_marks = get_time_based_code(marks);
   -- set new_marks = marks;

    IF MOD(new_marks, 5) = 0 THEN
        SET status = 'Lucky';
    ELSE
        SET status = 'Try Again';
    END IF;

    RETURN status;
END$$


CREATE FUNCTION get_luck_statusMod(marks INT)
RETURNS VARCHAR(20)
READS SQL DATA
NOT DETERMINISTIC
BEGIN
    DECLARE new_marks INT;
    DECLARE status VARCHAR(20);

    -- SET new_marks = get_time_based_code(marks);
    set new_marks = marks;

    IF MOD(new_marks, 5) = 0 THEN
        SET status = 'Lucky';
    ELSE
        SET status = 'Try Again';
    END IF;

    RETURN status;
END$$

DELIMITER ;

SELECT student_name, marks, get_time_based_code(marks) AS NewMarksTrad, get_luck_statusTrad(marks) AS Status FROM students;
SELECT student_name, marks, get_time_based_code(marks) AS NewMarksMod, get_luck_statusMod(get_time_based_code(marks)) AS Status FROM students;
