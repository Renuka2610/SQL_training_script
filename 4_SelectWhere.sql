use demo_db;

drop table Customer;

CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Address VARCHAR(100)
);
INSERT INTO Customer (CustID, FirstName, LastName, Age, Address) VALUES
(1, 'Deven', 'Prajapati', 25, 'Pune'),
(2, 'Anita', 'Verma', 30, 'Delhi'),
(3, 'Suresh', 'Patel', 40, NULL),
(4, 'Rekha', 'Soorma', 22, 'Mumbai'),
(5, 'Arjun', 'Mehta', 22, 'Pune'),
(6, 'Sneha', 'Sharma', 25, 'Bangalore'),
(7, 'Aman', 'Shah', 45, 'Delhi'),
(8, 'Priya', 'Singh', 25, 'Lucknow'),
(9, 'Manoj', 'Lee', 34, 'Chennai'),
(10, 'Tina', 'Kapoor', NULL, 'Indore');

--  SELECT Statements with WHERE Examples
-- Basic SELECT
SELECT * FROM Customer;

-- SELECT Specific Columns
SELECT FirstName, LastName FROM Customer;

-- WHERE with Equality
SELECT * FROM Customer WHERE Age = 25;

-- WHERE with Comparison
SELECT * FROM Customer WHERE Age > 30;

-- WHERE with AND
SELECT * FROM Customer WHERE Age =  25 AND Address = 'Pune';

-- WHERE with OR
SELECT * FROM Customer WHERE Age < 18 OR Address = 'Delhi';

-- WHERE with NOT
SELECT * FROM Customer WHERE NOT Age = 30;

-- WHERE with BETWEEN
SELECT * FROM Customer WHERE Age BETWEEN 20 AND 30;

-- WHERE with IN
SELECT * FROM Customer WHERE Address IN ('Mumbai', 'Pune', 'Delhi');

-- WHERE with LIKE

SELECT * FROM Customer WHERE LastName LIKE 'S%';   -- starts with 'S'
SELECT * FROM Customer WHERE FirstName LIKE '%an'; -- ends with 'an'
SELECT * FROM Customer WHERE Address LIKE '%el%'; -- contains 'road'

SELECT * FROM Customer WHERE LastName LIKE 'S___ma'; -- exact length
SELECT * FROM Customer WHERE LastName LIKE '____a';
-- WHERE IS NULL
SELECT * FROM Customer WHERE Address IS NULL; --

-- WHERE IS NOT NULL
SELECT * FROM Customer WHERE Age IS NOT NULL;

-- SELECT DISTINCT
SELECT DISTINCT Age FROM Customer;

-- ORDER BY
SELECT * FROM Customer ORDER BY LastName DESC;
SELECT * FROM Customer ORDER BY Age ASC;
-- GROUP BY
SELECT Age, COUNT(*) FROM Customer GROUP BY Age;

-- HAVING
SELECT Age, COUNT(*) FROM Customer GROUP BY Age HAVING COUNT(*) > 1;
 -- LIMIT
 SELECT * FROM Customer LIMIT 5;

select @@autocommit;
 -- set autocommit = 1;
 SET SQL_SAFE_UPDATES = 0; 
-- UPDATE with WHERE
 start transaction;
 SELECT * FROM Customer WHERE LastName = 'Sharma';
UPDATE Customer SET Address = 'New York' WHERE LastName = 'Sharma';

-- DELETE with WHERE
SELECT * FROM Customer ;
DELETE FROM Customer WHERE Age > 30 or Age is null;
rollback;