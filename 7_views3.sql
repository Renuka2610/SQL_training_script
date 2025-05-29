use demo_db;
drop table students;

CREATE TABLE students (
  roll_no INT PRIMARY KEY,
  name VARCHAR(50),
  marks1 INT,
  marks2 INT,
  marks3 INT
);

INSERT INTO students (roll_no, name, marks1, marks2, marks3)
VALUES 
(101, 'Asha', 85, 90, 88),
(102, 'Ravi', 70, 75, 80),
(103, 'Neha', 95, 92, 94),
(104, 'Karan', 60, 65, 68),
(105, 'Meena', 78, 82, 79);

CREATE VIEW view_marks_only AS
SELECT roll_no, marks1, marks2, marks3
FROM students;

CREATE VIEW view_avg_marks AS
SELECT roll_no,
       ROUND((marks1 + marks2 + marks3) / 3.0, 2) AS avg_marks
FROM students;

select * from view_marks_only;
select * from view_avg_marks;

-- Will fail: trying to insert into a filtered + computed view
INSERT INTO view_avg_marks (roll_no, avg_marks)
VALUES (106,  85.00);

-- Will fail: trying to update a calculated field
UPDATE view_avg_marks
SET avg_marks = 95
WHERE roll_no = 101;

