CREATE TABLE textbook (
	bookID VARCHAR (10),
	name VARCHAR (40) NOT NULL,
	author VARCHAR (40),
	publishing_house VARCHAR (40),
	price INTEGER CHECK (price > 0),
	edition INTEGER CHECK (edition > 0),
	course_ID VARCHAR (10),
	PRIMARY KEY (bookID),
	FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE SET NULL
);
#外码要加（引用表中该主码的名字）！

INSERT INTO textbook
VALUES
	(
		'1',
		'call_of_cathulu',
		'love_craft',
		'miskatonic_university',
		20,
		6,
		'HIS-351'
	);


SELECT
	NAME
FROM
	instructor;


SELECT DISTINCT
	dept_name
FROM
	instructor;


SELECT 
  id,name,salary/12
FROM
	instructor;


SELECT
	NAME
FROM
	instructor
WHERE
	dept_name = 'Comp. Sci.'
AND salary > 70000;


SELECT
	*
FROM
	instructor,
	teaches


SELECT
	NAME,
	course_id
FROM
	instructor,
	teaches
WHERE
	instructor.id = teaches.id;


SELECT
	course.course_id,
	semester,
	YEAR,
	title
FROM
	course,
	section
WHERE
	section.course_id = course.course_id
AND dept_name = 'Comp. Sci.';


DELETE
FROM
	time_slot_copy;


DROP TABLE time_slot_copy;