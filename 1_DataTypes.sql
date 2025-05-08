
use demo_db;
DROP TABLE IF EXISTS DataTypesDemo; 
CREATE TABLE DataTypesDemo (
    ID INT PRIMARY KEY,
    Age TINYINT,
    Salary DECIMAL(10, 2),
    Score FLOAT,
    Name VARCHAR(50),
    Bio TEXT,
    CreatedDate DATE,
    LoginTime TIME,
    Timestamped TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ImageData BLOB,
    Flags BIT(4),
    IsActive BOOLEAN
);

-- ✅ PRACTICE: Insert Sample Data
INSERT INTO DataTypesDemo (ID, Age, Salary, Score, Name, Bio, CreatedDate, LoginTime, ImageData, Flags, IsActive)
VALUES
(1, 25, 55000.75, 89.5, 'Alice', 'HR Manager with 5 years of experience', '1997-08-15', '09:30:00', 'abc', b'1010', TRUE),
(2, 31, 72000.00, 92.0, 'Bob', 'IT Engineer, specialized in DBMS', '1990-02-20', '08:45:00', 'def', b'1111', FALSE);

-- ✅ CODE: Select and View All Data Types
SELECT
    ID, Age, Salary, Score,
    Name, Bio,
    CreatedDate, LoginTime, Timestamped,
    HEX(ImageData) AS ImageHex,
    BIN(Flags) AS FlagBits,
    IsActive
FROM DataTypesDemo;
