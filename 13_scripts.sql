drop database if exists  Test_db;

create database Test_db;
use Test_db;


CREATE TABLE students (
    roll_no  INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);
alter table students auto_increment  = 101;

INSERT INTO students (student_name, marks) VALUES
( 'Asha', 90),
( 'lata', 76),
( 'ravi', 58),
( 'Amit', 39),
( 'Pramit', 62);

Select 'Que 1 - A';
select * from students order by marks Desc limit 3 ; -- 1
Select 'Que 1 - B';
select student_name from students where student_name like '_a%' ; -- 2
-- AND student_name like '_a%' ; 

Select 'Que 1 - C';
select roll_no, student_name, marks, if(marks>=40,'Pass','Fail') as result from students ; -- 3

-- ----------------

SET @@sql_safe_updates = 0; 
update students set marks = 38 where student_name = 'Ravi'; 
Select 'Que 1 - D';
select roll_no, student_name, marks, if(marks>=40,'Pass','Fail') as result from students ; -- 4

