SELECT * FROM sales;
SELECT * FROM product;
SELECT * FROM customer;

SELECT SETSEED(0.5);

SELECT customer_id, customer_name, RANDOM() AS rand_n 
FROM customer
ORDER BY rand_n 
LIMIT 5;

SELECT  sales, 
		CEIL(sales) as max_sales, 
		FLOOR(sales) as min_sales,
		ROUND(sales) as round_sales,
		POW(order_line,2)
FROM sales;