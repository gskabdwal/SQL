SELECT * FROM customer;

SELECT * FROM product;

SELECT * FROM sales;

-- INNER JOIN
SELECT 
    a.customer_id, 
    c.customer_name, 
    b.product_name, 
    a.discount
FROM sales a
JOIN product b 
    ON a.product_id = b.product_id
JOIN customer c 
    ON a.customer_id = c.customer_id;

-- LEFT JOIN
SELECT 
    a.customer_id, 
    c.customer_name, 
    b.product_name, 
    a.discount
FROM sales a
LEFT JOIN product b 
    ON a.product_id = b.product_id
LEFT JOIN customer c 
    ON a.customer_id = c.customer_id;

-- RIGHT JOIN
SELECT 
    a.customer_id, 
    c.customer_name, 
    b.product_name, 
    a.discount
FROM sales a
RIGHT JOIN product b 
    ON a.product_id = b.product_id
RIGHT JOIN customer c 
    ON a.customer_id = c.customer_id;

-- FULL JOIN
SELECT 
    a.customer_id, 
    c.customer_name, 
    b.product_name, 
    a.discount
FROM sales a
FULL JOIN product b 
    ON a.product_id = b.product_id
FULL JOIN customer c 
    ON a.customer_id = c.customer_id;

-- CROSS and SELF JOIN
SELECT DISTINCT a.region, a.city 
FROM customer a, customer b
ORDER BY a.region; 

-- NATURAL JOIN - Automatically joins on the columns having same name and data type
SELECT *
FROM sales a
NATURAL JOIN customer b; 