SELECT * FROM sales;
SELECT * FROM product;
SELECT * FROM customer;

SELECT CURRENT_TIME;

SELECT CURRENT_TIMESTAMP;

SELECT AGE(CURRENT_DATE,'1939-04-06');

SELECT EXTRACT(MONTH FROM TO_DATE('1939-04-06', 'YYYY-MM-DD'));

SELECT  EXTRACT(MONTH FROM a.order_date) AS order_month, 
		TO_CHAR(DATE '2000-01-01' + (EXTRACT(MONTH FROM a.order_date) - 1) * INTERVAL '1 month', 'Month') AS month_name,
		SUM(a.sales) FROM sales a
JOIN product b
ON a.product_id=b.product_id
WHERE b.sub_category IN ('Chairs')
GROUP BY order_month
ORDER BY order_month;
