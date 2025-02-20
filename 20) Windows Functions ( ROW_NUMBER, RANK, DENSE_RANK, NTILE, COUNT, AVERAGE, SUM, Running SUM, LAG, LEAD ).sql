SELECT * FROM sales;
SELECT * FROM customer;

CREATE TABLE cust_sales AS (
	SELECT a.customer_name, b.*, a.state  FROM customer a
	LEFT JOIN (
		SELECT customer_id, COUNT(DISTINCT order_id) AS num_orders, SUM(sales) AS total_sales FROM sales
		GROUP BY customer_id
	) b
	ON a.customer_id = b.customer_id
);


SELECT * FROM cust_sales;

SELECT * FROM (SELECT 	*, 
		ROW_NUMBER() OVER ( PARTITION BY state ORDER BY num_orders DESC) AS row_n,
		RANK() OVER ( PARTITION BY state ORDER BY num_orders DESC) AS rank,
		DENSE_RANK() OVER ( PARTITION BY state ORDER BY num_orders DESC) AS d_rank,
		NTILE(5) OVER ( PARTITION BY state ORDER BY num_orders DESC) AS n_tile
FROM cust_sales
WHERE state = 'Tennessee')
WHERE customer_name = 'Rose O''Brian';


CREATE TABLE order_sales AS (
	SELECT a.order_id, 
		   MAX(a.order_date) AS order_date, 
		   MAX(a.customer_id) AS customer_id,
		   MAX(b.customer_name) AS customer_name,
		   MAX(b.state) AS state,
		   SUM(a.sales) AS order_sales
	FROM sales a
	LEFT JOIN customer b
	ON a.customer_id=b.customer_id
	GROUP BY a.order_id
);

SELECT *, 
	   LAG(rsum_sale_state,1) OVER (PARTITION BY state) AS lag_rsum_sales,
       AVG(rsum_sale_state) OVER (PARTITION BY state) AS avg_rsum_sale_state
FROM (
    SELECT order_id, 
		   state,
		   order_sales, 
		   LEAD(order_sales,1) OVER (PARTITION BY state) AS lead_sales,
		   SUM(order_sales) OVER (PARTITION BY state) AS sum_sale_state,
           SUM(order_sales) OVER (PARTITION BY state ORDER BY order_date) AS rsum_sale_state
    FROM order_sales
	WHERE state = 'California' AND order_sales > 1000 
);



