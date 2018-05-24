SELECT
	dept_name,
	avg_salary
FROM
	(
		SELECT
			dept_name,
			avg(salary) AS avg_salary
		FROM
			instructor
		GROUP BY
			dept_name
	) AS temp
WHERE
	avg_salary > 42000;
#from句中的嵌套子查询

/*
WITH (
	SELECT
		dept_name,
		sum(salary)
	FROM
		instructor
	GROUP BY
		dept_name
) AS dept_total (dept_name, VALUE),
 (
	SELECT
		avg(VALUE)
	FROM
		dept_total
) AS dept_total_avg (dept_name, VALUE) 
SELECT
	dept_name
FROM
	dept_total,
	dept_total_avg
WHERE
	dept_total.VALUE
	>= dept_total_avg.VALUE;


WITH (
	SELECT
		dept_name,
		sum(salary)
	FROM
		instructor
	GROUP BY
		dept_name
) AS (dept_name, VALUE)AS dept_total,
 (
	SELECT
		avg(VALUE)
	FROM
		dept_total
) AS (dept_name, VALUE)AS dept_total_avg 
SELECT
	dept_name
FROM
	dept_total,
	dept_total_avg
WHERE
	dept_total.VALUE
	>= dept_total_avg.VALUE;


WITH (
	SELECT
		dept_name,
		sum(salary)
	FROM
		instructor
) AS dept_name, VALUE AS dept_total,
 (
	SELECT
		avg(VALUE)
	FROM
		dept_total
) AS dept_name, VALUE AS dept_total_avg 
SELECT
	dept_name
FROM
	dept_total,
	dept_total_avg
WHERE
	dept_total.VALUE
	>= dept_total_avg.VALUE;


WITH dept_total (dept_name, VALUE) AS(
	SELECT
		dept_name,
		sum(salary)
	FROM
		instructor
	GROUP BY
		dept_name
) , dept_total_avg (dept_name, VALUE) AS
 (
	SELECT
		avg(VALUE)
	FROM
		dept_total
) 
SELECT
	dept_name
FROM
	dept_total,
	dept_total_avg
WHERE
	dept_total.VALUE
	>= dept_total_avg.VALUE;
*/
#以上尝试均告失败，因为MYSQL不支持WITH...AS...语法


UPDATE instructor
SET salary = salary * 1.03
WHERE
	salary > 100000;

UPDATE instructor
SET salary = salary * 1.05
WHERE
	salary <= 100000;
#注意update是不同的指令，要考虑好几条update间顺序关系，保证缩胀覆盖的范围符合题意

UPDATE instructor
SET salary = CASE
WHEN salary <= 100000 THEN
	salary * 1.05
ELSE
	salary * 1.03 
END；
#或者这么写，但是又报error了，来不及调试了。。。。


/*
CASE
WHEN sum(credits) IS NOT NULL THEN
	sum(credits)
ELSE
	0
END
*/
#某个if语句的写法

#######################################chapter4##############################


SELECT
	*
FROM
	course
NATURAL LEFT OUTER JOIN prereq;


SELECT
	*
FROM
	course
NATURAL RIGHT OUTER JOIN prereq;


SELECT
	*
FROM
	course
NATURAL FULL OUTER JOIN prereq;
#不支持


SELECT
	*
FROM
	course
INNER JOIN prereq ON course.course_id = prereq.course_id;


CREATE VIEW faculty AS SELECT
	id,
	NAME,
	dept_name
FROM
	instructor;

CREATE TABLE faculty1
SELECT
	id,
	NAME,
	dept_name
FROM
	instructor;

SELECT
	NAME
FROM
	faculty
WHERE
	dept_name = 'Biology';
#同理，建view也可以引用view


INSERT INTO faculty
VALUES
	('30765', 'Green', 'Music');
#同时，instructor表也同步被更新了,salary为null