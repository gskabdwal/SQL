
-- EXPLAIN gives the cost of query specified
EXPLAIN SELECT * FROM sales;
EXPLAIN SELECT DISTINCT * FROM sales;
EXPLAIN VERBOSE SELECT DISTINCT * FROM sales;


-- VACUUM deletes soft deleted entries in a table
VACUUM sales;

-- TRUNCATE is better than select delete and does hard delete, takes less overhead and logging. Unable to rollback before truncate and delete without transaction.   
BEGIN TRANSACTION;
TRUNCATE TABLE customer;
SELECT * FROM customer;

-- If something goes wrong or you change your mind
ROLLBACK;  -- The TRUNCATE will be undone, and the data will be restored
SELECT * FROM customer;
