use demo_db;
show tables;
drop table students;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) );


SELECT @@autocommit;
SET autocommit = 0;


select * from students;
INSERT INTO students (id, name) VALUES (default, 'Rollback Test 2');

rollback;
commit;
