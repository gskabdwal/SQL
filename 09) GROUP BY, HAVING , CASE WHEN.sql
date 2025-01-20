SELECT * FROM sales;

SELECT * FROM customer;

SELECT customer_id, SUM(sales) as sales_per_customer FROM sales
GROUP BY customer_id
ORDER BY sales_per_customer DESC
LIMIT 10;

SELECT customer_id, COUNT(sales) as count_per_customer FROM sales
GROUP BY customer_id
HAVING COUNT(sales) >32
ORDER BY count_per_customer DESC
LIMIT 10;

SELECT customer_id, age, CASE  WHEN age > 60 THEN 'Senior'
                          WHEN age >30 THEN 'Middle'
                          ELSE 'Young'
					END AS age_category
FROM customer;
