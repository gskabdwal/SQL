SELECT * FROM customer;

SELECT * FROM product;

SELECT * FROM sales;

-- Get the list of all cities where the region is north or east without any duplicates using IN statement
SELECT city FROM customer
WHERE region IN('North', 'East');

-- Get the list of all orders where the ‘sales’ value is between 100 and 500 using the BETWEEN operator
SELECT * FROM sales
WHERE sales BETWEEN 100 AND 500;

-- Get the list of customers whose last name contains only 4 characters using LIKE
SELECT * FROM customer
WHERE customer_name LIKE '% ____';

-- Retrieve all orders where ‘discount’ value is greater than zero ordered in descending order basis ‘discount’ value
-- Limit the number of results in above query to top 10
SELECT * FROM sales
WHERE discount > 0
ORDER BY discount DESC
LIMIT 10;
