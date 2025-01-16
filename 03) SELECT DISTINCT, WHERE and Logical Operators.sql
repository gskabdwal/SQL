CREATE TABLE science_class (
	enrollment_no INT,
	name VARCHAR(30),
	science_marks INT
	);

INSERT INTO science_class 
VALUES  (0, 'Gaurav', 100),
		(3, 'Hari', 89);

COPY science_class FROM 'C:/Users/HP/OneDrive/Desktop/SQL/Exercises/Data/stu_csv.csv' DELIMITER ',' CSV HEADER;

COPY science_class FROM 'C:/Users/HP/OneDrive/Desktop/SQL/Exercises/Data/stu_txt.txt' DELIMITER ',' HEADER;
COPY science_class FROM 'C:/Users/HP/OneDrive/Desktop/SQL/Exercises/Data/stu_txt.txt' DELIMITER ',' HEADER;

SELECT * FROM science_class;

SELECT DISTINCT * FROM science_class;

SELECT name FROM science_class WHERE name != 'Hari';

SELECT name FROM science_class WHERE science_marks > 90;

SELECT DISTINCT * FROM science_class WHERE science_marks > 90 AND science_marks <= 99;

SELECT DISTINCT * FROM science_class WHERE science_marks < 90 OR science_marks <= 99;