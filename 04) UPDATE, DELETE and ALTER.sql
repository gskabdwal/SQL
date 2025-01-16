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

SELECT name FROM science_class 
WHERE name != 'Hari';

SELECT name FROM science_class 
WHERE science_marks > 90;

SELECT DISTINCT * FROM science_class 
WHERE science_marks > 90 AND science_marks <= 99;

SELECT DISTINCT * FROM science_class 
WHERE science_marks < 90 OR science_marks <= 99;


UPDATE science_class SET science_marks = 95 WHERE science_marks = 98;

DELETE FROM science_class 
WHERE name = 'Shyam';

ALTER TABLE science_class 
ADD COLUMN email varchar(30);

ALTER TABLE science_class 
ALTER COLUMN email TYPE varchar(25);

ALTER TABLE science_class 
DROP COLUMN email;

ALTER TABLE science_class
RENAME COLUMN name TO student_name;

ALTER TABLE science_class
ALTER COLUMN enrollment_no SET NOT NULL;

ALTER TABLE science_class
ALTER COLUMN enrollment_no DROP NOT NULL;

ALTER TABLE science_class
ADD CONSTRAINT check_enrollment_no CHECK (enrollment_no >= 0);

ALTER TABLE science_class
DROP CONSTRAINT check_enrollment_no;

ALTER TABLE science_class
ADD CONSTRAINT pk_enrollment_no PRIMARY KEY (enrollment_no);

ALTER TABLE science_class
DROP CONSTRAINT pk_enrollment_no;

CREATE TABLE teacher (teacher_id INT, teacher_name VARCHAR(30));

INSERT INTO teacher 
VALUES  ( 1 , 'Sanjay'),
		( 2, 'Sunil');

ALTER TABLE science_class 
ADD COLUMN teacher_id INT;

UPDATE science_class 
SET teacher_id = 2 WHERE enrollment_no = 0;

UPDATE science_class 
SET teacher_id = 1 WHERE enrollment_no != 0;

ALTER TABLE teacher
ADD CONSTRAINT un_teacher_id UNIQUE (teacher_id);

SELECT * FROM teacher; 

ALTER TABLE science_class
ADD CONSTRAINT fk_teacher_id FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id);

SELECT * FROM science_class; 

-- DROP TABLE science_class;
-- DROP TABLE teacher;