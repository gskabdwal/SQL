SELECT * FROM customer;


-- INTERSECT USING CTE (Common Table Expression)
WITH 
first_10_customers AS (
    SELECT customer_id, customer_name 
    FROM customer 
    LIMIT 5
),
first_10_customers_from_4th AS (
    SELECT customer_id, customer_name
    FROM customer
    LIMIT 5 OFFSET 3
)
SELECT * 
FROM first_10_customers
INTERSECT
SELECT * 
FROM first_10_customers_from_4th;

-- EXCEPT USING CTE (Common Table Expression)
WITH 
first_10_customers AS (
    SELECT customer_id, customer_name 
    FROM customer 
    LIMIT 5
),
first_10_customers_from_4th AS (
    SELECT customer_id, customer_name
    FROM customer
    LIMIT 5 OFFSET 3
)
SELECT * 
FROM first_10_customers
EXCEPT
SELECT * 
FROM first_10_customers_from_4th;

-- UNION USING CTE (Common Table Expression)
WITH 
first_10_customers AS (
    SELECT customer_id, customer_name 
    FROM customer 
    LIMIT 5
),
first_10_customers_from_4th AS (
    SELECT customer_id, customer_name
    FROM customer
    LIMIT 5 OFFSET 3
)
SELECT * 
FROM first_10_customers
UNION
SELECT * 
FROM first_10_customers_from_4th;
