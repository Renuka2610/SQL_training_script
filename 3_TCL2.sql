use demo_db;
-- COMMIT & ROLLBACK
-- ONE OF THE MOST TRICKY TOPICS // NEEDS A LOT OF ATTENTION
drop table accounts;
SELECT @@autocommit; 
SET autocommit = 0 ;

CREATE TABLE accounts (
    acc_id VARCHAR(10) PRIMARY KEY,
    acc_name VARCHAR(50),
    balance DECIMAL(10, 2)
);
INSERT INTO accounts (acc_id, acc_name, balance) VALUES
('A001', 'Alice', 20000.00),
('B001', 'Bob', 10000.00);
 SELECT * FROM accounts;
 INSERT INTO accounts (acc_id, acc_name, balance) VALUES
('A002', 'Alice', 20000.00),
('B005', 'Bob', 10000.00);
 SELECT * FROM accounts;

 -- SUPPOSE SUCCESSFUL Fund Transfer Code (₹5000 from A001 to B001) 
START TRANSACTION;

-- Step 1: Deduct from Alice's account
UPDATE accounts
SET balance = balance - 5000
WHERE acc_id = 'A001';
SELECT * FROM accounts;

-- Step 2: Add to Bob's account
UPDATE accounts
SET balance = balance + 5000
WHERE acc_id = 'B001';

SELECT * FROM accounts;
-- Commit transaction
COMMIT;

-- SUPPOSE ERROR Fund Transfer Code (₹5000 from A001 to B001) 
-- Start transaction
START TRANSACTION;

UPDATE accounts
SET balance = balance - 5000
WHERE acc_id = 'A001';
SELECT * FROM accounts;

-- Simulate an error (wrong account ID)
UPDATE accounts
SET balance = balance + 5000
WHERE acc_id = 'INVALID';  -- This will fail
SELECT * FROM accounts; 

-- Rollback since one update failed
ROLLBACK;
