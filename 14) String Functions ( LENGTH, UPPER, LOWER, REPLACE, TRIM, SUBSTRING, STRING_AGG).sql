SELECT * FROM sales;
SELECT * FROM product;
SELECT * FROM customer;

SELECT MAX(LENGTH(product_name)) as name_length FROM product;

SELECT UPPER(product_name) AS upper_name FROM product;

SELECT  product_name, 
		sub_category, 
		category, product_name || ', ' || sub_category || ', ' || category AS product_details 
FROM product;  

SELECT  product_id, 
		LEFT(LTRIM(product_id), 3) AS left , 
		SUBSTRING(TRIM(product_id), 5, 2) AS mid, 
		RIGHT(RTRIM(product_id), 8) AS right 
FROM product;

SELECT STRING_AGG(product_name, ', ') AS all_products_sub FROM product
WHERE sub_category IN ('Chairs','Tables'); 

