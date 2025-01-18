
SELECT * FROM customer;

SELECT * FROM product;

SELECT * FROM sales;


SELECT SUM(sales) AS total_sales FROM sales;

SELECT COUNT(DISTINCT customer_id) AS Number_of_People_North FROM customer WHERE age BETWEEN 20 AND 30;

SELECT AVG(age) AS Avg_Age_East FROM customer;

SELECT MIN(age) AS Min_Age_Philadelphia FROM customer;

SELECT MAX(age) AS Max_Age_Philadelphia FROM customer;