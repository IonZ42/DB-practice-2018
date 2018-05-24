SELECT
	avg(salary)
FROM
	instructor
WHERE
	dept_name = 'Comp. Sci.';


SELECT
	count(DISTINCT ID)
FROM
	teaches
WHERE
	semester = 'Spring'
AND YEAR = '2010';
#报的是符合条件的ID数


SELECT
	count(*)
FROM
	course;
#报的是行数


SELECT
	dept_name,
	avg(salary)
FROM
	instructor
GROUP BY
	dept_name;


SELECT
	dept_name,
	avg(salary)
FROM
	instructor
GROUP BY
	dept_name
HAVING
	avg(salary) > 42000;


SELECT DISTINCT
	course_id
FROM
	section
WHERE
	semester = 'Spring'
AND YEAR = '2010'
AND course_id IN (
	SELECT
		course_id
	FROM
		section
	WHERE
		semester = 'Fall'
	AND YEAR = 2009
);


SELECT
	count(DISTINCT takes.id)
FROM
	takes,
	teaches
WHERE
	takes.course_id = teaches.course_id
AND teaches.id = '10101';


SELECT
	count(DISTINCT id)
FROM
	takes
WHERE
	course_id IN (
		SELECT
			course_id
		FROM
			teaches
		WHERE
			teaches.id = '10101'
	);
#以上两个查询功能一样，第一个是经典实现，第二个是嵌套子查询实现


SELECT DISTINCT
	instructor. NAME
FROM
	instructor,
	instructor AS ins
WHERE
	instructor.salary > ins.salary
AND ins.dept_name = 'Biology';


SELECT DISTINCT
	NAME
FROM
	instructor
WHERE
	salary > SOME (
		SELECT
			salary
		FROM
			instructor
		WHERE
			dept_name = 'Biology'
	);
#以上两个查询功能一样，第一个是重命名实现，第二个是用some实现


SELECT
	NAME
FROM
	instructor
WHERE
	salary > SOME (
		SELECT
			max(salary)
		FROM
			instructor
		WHERE
			dept_name = 'Biology'
	);


SELECT
	NAME
FROM
	instructor
WHERE
	salary > ALL (
		SELECT
			salary
		FROM
			instructor
		WHERE
			dept_name = 'Biology'
	);
#以上两个查询功能一样，第一个是max实现，第二个是用all实现


#以下操作先加了两条记录，然后查询学了生院开设所有课程的所有学生ID
INSERT INTO section
VALUES
	(
		'BIO-399',
		'1',
		'Summer',
		'2010',
		'Painter',
		'514',
		'A'
	);

INSERT INTO takes
VALUES
	(
		'98988',
		'BIO-399',
		'1',
		'Summer',
		'2010',
		'A'
	);

SELECT
	id,
	NAME
FROM
	student
WHERE
	NOT EXISTS (
		SELECT
			course_id
		FROM
			course
		WHERE
			dept_name = 'Biology'
		AND course_id NOT IN (
			SELECT
				t.course_id
			FROM
				takes AS t
			WHERE
				t.id = student.id
		)
	);
#学生必须学了【所有】生院开的课,注意 NOT EXISTS(U-A) means 全集U(生院所有的课)属于A（学生选的课）！上文的括号关系为为not exists(U(-(A)))
#另一个思路：生物系开课数count distinct，学生选的生物系课数count distinct，二者相等则OK，选出这些学生