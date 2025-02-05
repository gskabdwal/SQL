SELECT * FROM sales;
SELECT * FROM product;
SELECT * FROM customer;

SELECT * FROM customer
WHERE customer_name ~*'^[a-z]{5}\s[abcd]{1}[a-z]{4}$'


CREATE TABLE zip_codes ( zipcode VARCHAR(25));

INSERT INTO zip_codes 
VALUES 	('234432'),
		('23345'),
		('sdfe4'),
		('123&3'),
		('67424'),
		('7895432'),
		('12312');

SELECT * FROM zip_codes 
WHERE zipcode ~*'^[0-9]{5,6}$'