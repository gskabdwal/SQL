SELECT * FROM sales;
SELECT * FROM product;
SELECT * FROM customer;

SELECT a.*, c.product_name, c.category,  b.customer_name, b.age FROM sales a
LEFT JOIN (
			SELECT customer_id, customer_name, age FROM customer
) AS b
ON a.customer_id=b.customer_id
LEFT JOIN (
			SELECT product_id, product_name, category FROM product
) AS c
ON a.product_id=c.product_id

EXCEPT

SELECT 
	sp.*,
    c.customer_name, 
    c.age    
FROM customer AS c
RIGHT JOIN (
    SELECT 
        s.*, 
        p.product_name, 
        p.category 
    FROM 
        sales AS s
    LEFT JOIN product AS p
    ON s.product_id = p.product_id
) AS sp
ON c.customer_id = sp.customer_id;

