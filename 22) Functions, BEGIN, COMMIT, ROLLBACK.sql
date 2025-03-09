CREATE TABLE accounts (account_id VARCHAR(25), balance INT);

INSERT INTO accounts 
VALUES ('AccountA', 200),
	   ('AccountB', 0);

-- Function to transfer funds from one account to another
CREATE OR REPLACE FUNCTION transfer_funds(account_from TEXT, account_to TEXT, amount INT) 
RETURNS VOID AS $$
DECLARE
    balanceA INT;
BEGIN
    -- Step 1: Withdraw the amount from account_from
    UPDATE Accounts
    SET balance = balance - amount
    WHERE account_id = account_from;

    -- Step 2: Check if account_from has sufficient balance
    SELECT balance INTO balanceA FROM Accounts WHERE account_id = account_from;

    IF balanceA < 0 THEN
        RAISE EXCEPTION 'Insufficient balance in account: %', account_from;
    END IF;

    -- Step 3: Deposit the amount into account_to
    UPDATE Accounts
    SET balance = balance + amount
    WHERE account_id = account_to;

END;
$$ LANGUAGE plpgsql;


-- Successful Transaction

BEGIN;  -- Start the outer transaction

-- Execute the function inside a DO $$ block
DO $$
BEGIN
    -- Call the transfer_funds function
    PERFORM transfer_funds('AccountA', 'AccountB', 100);
    
    -- If the function executes successfully, no need to commit here, let the outer transaction handle it
    RAISE NOTICE 'Transaction successful: $100 transferred from AccountA to AccountB';
EXCEPTION
    WHEN OTHERS THEN
        -- If there's an error, do not try to commit, just let the outer transaction handle the rollback
        RAISE NOTICE 'Transaction failed: %', SQLERRM;
        -- The outer transaction will handle rollback
END $$;

-- At this point, if the DO block executes successfully, commit the outer transaction
COMMIT;

-- If an error occurs in the DO block, the outer transaction will automatically be rolled back


SELECT * FROM accounts;


UPDATE accounts SET balance = 50 WHERE account_id = 'AccountA';
SELECT * FROM accounts;


-- Unsuccessful Transaction

BEGIN;  -- Start the outer transaction

-- Execute the function inside a DO $$ block
DO $$
BEGIN
    -- Call the transfer_funds function
    PERFORM transfer_funds('AccountA', 'AccountB', 100);
    
    -- If the function executes successfully, no need to commit here, let the outer transaction handle it
    RAISE NOTICE 'Transaction successful: $100 transferred from AccountA to AccountB';
EXCEPTION
    WHEN OTHERS THEN
        -- If there's an error, do not try to commit, just let the outer transaction handle the rollback
        RAISE NOTICE 'Transaction failed: %', SQLERRM;
        -- The outer transaction will handle rollback
END $$;

-- At this point, if the DO block executes successfully, commit the outer transaction
COMMIT;

-- If an error occurs in the DO block, the outer transaction will automatically be rolled back


SELECT * FROM accounts;