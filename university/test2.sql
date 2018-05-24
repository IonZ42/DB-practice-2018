SELECT
	student. NAME,
	instructor. NAME
FROM
	student,
	advisor,
	instructor
WHERE
	student.id = advisor.s_ID
AND instructor.ID = advisor.i_ID;


SELECT
	*
FROM
	instructor
NATURAL JOIN teaches;


SELECT
	NAME,
	course_id
FROM
	instructor
NATURAL JOIN teaches;


SELECT DISTINCT
	instructor. NAME,
	course.title
FROM
	instructor
NATURAL JOIN teaches
NATURAL JOIN course;


SELECT
	salary / 12 AS monthly_salary
FROM
	instructor;


SELECT DISTINCT
	instructor. NAME
FROM
	instructor,
	instructor AS instru
WHERE
	instru.dept_name = 'Comp. Sci.'
AND instructor.salary > instru.salary;
#上面这条的结果是，所有salary大于COMP.SCI.学院里最小salary的老师，包括COMP.SCI.内部除最小值外的老师们


SELECT
	NAME
FROM
	instructor
WHERE
	NAME LIKE '__in%';


SELECT DISTINCT
	NAME
FROM
	instructor
ORDER BY
	NAME DESC;


SELECT DISTINCT
	dept_name,
	NAME
FROM
	instructor
ORDER BY
	dept_name,
	NAME;


SELECT
	salary
FROM
	instructor
WHERE
	salary BETWEEN 100000
AND 90000;
#无结果！


SELECT
	salary
FROM
	instructor
WHERE
	salary BETWEEN 90000
AND 100000;
#看来between后面应该跟下界


SELECT
	NAME,
	course_id
FROM
	instructor,
	teaches
WHERE
	(instructor.id, dept_name) = (teaches.id, 'Biology');


SELECT
	course_id
FROM
	section
WHERE
	semester = 'Fall'
AND YEAR = 2009
UNION
	SELECT
		course_id
	FROM
		section
	WHERE
		semester = 'Spring'
	AND YEAR = 2010;