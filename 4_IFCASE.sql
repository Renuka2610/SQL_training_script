use demo_db;
drop table Employees;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);
INSERT INTO Employees (EmpID, Name, Department, Salary) VALUES
(1, 'Alice', 'HR', 45000),
(2, 'Bob', 'IT', 80000),
(3, 'Charlie', 'Sales', 60000),
(4, 'David', 'IT', 30000),
(5, 'Eva', 'HR', 55000),
(6, 'Fay', 'Sales', 25000);

SELECT Name, Salary,
       IF(Salary > 50000, 'High', 'Low') AS SalaryStatus
FROM Employees;

SELECT Name, Salary,
       IF(Salary < 40000, 'Low',
          IF(Salary BETWEEN 40000 AND 70000, 'Medium', 'High')) AS SalaryGrade
FROM Employees;

SELECT Name, Department,
       CASE
         WHEN Department = 'IT' THEN 'Technical'
         WHEN Department = 'HR' THEN 'Administrative'
         WHEN Department = 'Sales' THEN 'Business'
         ELSE 'Other'
       END AS DeptCategory
FROM Employees;


SELECT Name, Department,
       IF(Department = 'IT', 'Tech', 'Non-Tech') AS DeptDiv
FROM Employees;

