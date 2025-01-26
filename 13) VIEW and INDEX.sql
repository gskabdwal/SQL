SELECT * FROM sales;
SELECT * FROM product;
SELECT * FROM customer;

-- VIEW
CREATE VIEW daily_billing AS
			(
				SELECT order_line, product_id, sales, discount FROM sales
				ORDER BY order_date
				LIMIT 1
			);

SELECT * FROM daily_billing;

ALTER VIEW daily_billing RENAME TO d_b;

SELECT * FROM d_b;

CREATE OR REPLACE VIEW d_b AS
			(
				SELECT order_line, product_id, sales, discount FROM sales
				ORDER BY order_date
				LIMIT 2
			);

SELECT * FROM d_b;

DROP VIEW d_b;

-- Do not use update on VIEW as it will change the data in table if still want to check the rules before doing so.


-- INDEX

CREATE INDEX c_idx
ON customer(customer_id);

ALTER INDEX c_idx
RENAME TO cust_id_idx;

DROP INDEX cust_id_idx;
