use demo_db;
-- SAVEPOINTS
drop table accounts;
SELECT @@autocommit; 


CREATE TABLE accounts (
    acc_id VARCHAR(10) PRIMARY KEY,
    acc_name VARCHAR(50),
    balance DECIMAL(10, 2)
);
INSERT INTO accounts (acc_id, acc_name, balance) VALUES
('A001', 'Alice', 20000.00),
('B001', 'Bob', 10000.00),
('B002', 'Charlie', 8000.00);

-- Disable autocommit mode
SET AUTOCOMMIT = 0;
SELECT * FROM accounts; 
-- Start transaction
START TRANSACTION;

-- Step 1: Deduct ₹5000 from Alice
UPDATE accounts 
SET balance = balance - 5000 
WHERE acc_id = 'A001';
SELECT * FROM accounts; 
-- Set a savepoint after withdrawal
SAVEPOINT after_deduction;

-- Step 2: Try to add ₹5000 to Bob (simulate a failure)
UPDATE accounts 
SET balance = balance + 5000 
WHERE acc_id = 'B001';  -- This fails

-- BUT alice realise he sent bob money by mistake, so he disputed the transaction
-- Rollback only to the savepoint
ROLLBACK TO after_deduction;
SELECT * FROM accounts; 
-- Step 3: Try again with another account (Charlie)
UPDATE accounts 
SET balance = balance + 5000 
WHERE acc_id = 'B002';
SELECT * FROM accounts; 
-- Commit the final state
COMMIT;

rollback;
