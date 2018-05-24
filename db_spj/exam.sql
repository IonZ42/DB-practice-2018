SELECT DISTINCT
	jno
FROM
	spj
WHERE
	jno NOT IN (
		SELECT
			spj.jno
		FROM
			spj,
			s,
			p
		WHERE
			spj.sno = s.sno
		AND s.city = '天津'
		AND spj.pno = p.pno
		AND p.color = '红'
	);

select * from j where city='北京';

select distinct qty from spj where qty between 300 and 750;

select  distinct spj.sno,spj.pno,spj.jno from spj,j,s
where spj.sno=s.sno and spj.jno=j.jno and s.city=j.city;

select distinct p.pno,p.pname,p.color,p.weight from spj,p,s
where spj.sno=s.sno and spj.pno=p.pno and s.city='北京';