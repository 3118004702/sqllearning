#进阶6：连接查询
/*
含义：
		又称多表查询，当查询的字段来自多个表是，就会用到连接查询
分类:
		按年代分类：
				sql92标准
				sql99标准
		按功能分类：
				内连接：
						等值连接
						非等值连接
						自连接
				外连接：
						左外连接
						右外连接
						全外连接
				交叉连接
*/

#sql92标准


##一、等值连接

###1、等值连接
####案例一：查询员工名和对应的部门名
SELECT	last_name,department_name
FROM	employees e,departments d
WHERE	e.department_id = d.department_id;

###2、添加筛选
####案例一：查询有奖金的员工名、部门名
SELECT	last_name,department_name
FROM	employees e,departments d
WHERE	e.department_id = d.department_id AND	commission_pct IS NOT NULL;

###3、添加分组
#####案例一：查询每个城市的部门个数
SELECT	COUNT(*) 个数,city
FROM	departments d,locations l
WHERE d.location_id = l.location_id
GROUP BY	city;

###4、添加排序
####案例一：查询每个工种的工种名和员工的个数，并按照员工个数降序
SELECT	job_title,COUNT(*) c
FROM	jobs j,employees e
WHERE	j.job_id = e.job_id
GROUP BY	job_title
ORDER BY	c DESC;

###5、三表查询
####案例一：查询员工名、部门名和所在的城市
SELECT	last_name,department_name,city
FROM	employees e,departments d,locations l
WHERE	e.department_id = d.department_id AND d.location_id = l.location_id
ORDER BY	department_name DESC;


##二、非等值连接

###案例一：查询员工的工资和工资等级
SELECT	salary,grade_level
FROM	employees e,job_grades g
WHERE	salary	BETWEEN	g.lowest_sal	AND	g.highest_sal;


##三、自连接

###案例一：查询员工名和上级的名称
SELECT	e.employee_id,e.last_name,m.employee_id,m.last_name
FROM	employees e,employees m
WHERE	e.employee_id = m.manager_id;



#sql99语法
/*
语法：
		select 查询列表
		from 表一 别名 连接类型
		join 表二 别名
		on 连接条件
		where 筛选条件
		group by 分组
		having 筛选条件
		order by 排序列表
		
分类：
		内连接：inner join
				等值连接
				非等值连接
				交叉连接
		外连接：
				左外连接：left outer
				右外连接：right outer
				全外连接：full outer
		交叉连接：cross
		
*/

##一、内连接
###1、等值连接
####案例一：查询员工的员工名和对应的部门名

SELECT	last_name,department_name
FROM	departments d
INNER JOIN	employees e
ON	d.department_id = e.department_id;

####案例二：查询名字中包含e的员工的员工名和其工种名（添加筛选）
SELECT	last_name,job_title
FROM		employees e 
INNER JOIN	jobs j
ON	e.job_id = j.job_id
WHERE	e.last_name LIKE '%e%';

####案例三：查询部门个数>3的城市的城市名和其部门个数（添加筛选+分组）
SELECT	city,COUNT(*) c
FROM	departments d
INNER JOIN	locations l
ON	d.location_id = l.location_id
GROUP BY	city
HAVING	c > 3;

####案例四：查询部门的员工个数>3的部门的部门名和员工个数，并按个数降序（添加筛选+分组+排序）
SELECT	department_name,COUNT(*) c
FROM	departments d
INNER JOIN	employees e
ON	e.department_id = d.department_id
GROUP BY	department_name
HAVING	c > 3
ORDER BY	c DESC;

####案例五：查询员工名、部门名、工种名，并按部门名降序
SELECT	last_name,department_name,job_title
FROM	employees e
INNER JOIN	departments d ON e.department_id = d.department_id
INNER JOIN	jobs j ON e.job_id = j.job_id
ORDER BY	department_name DESC;


###2、非等值连接
####案例一：查询员工的工资级别
SELECT	salary,grade_level
FROM	employees e
INNER JOIN	job_grades j
ON	e.salary BETWEEN j.lowest_sal AND j.highest_sal;

####案例二：查询工资级别的个数>20的工资级别的个数，并且按照工资级别降序
SELECT	COUNT(*) c,grade_level
FROM	employees e
INNER JOIN	job_grades g
ON	salary BETWEEN g.lowest_sal AND g.highest_sal
GROUP BY	grade_level
HAVING	c > 20
ORDER BY	c;


###3、自连接
####案例一：查询员工的名字、上级的名字
SELECT	e.last_name,m.last_name
FROM	employees e
INNER JOIN	employees m
ON	e.manager_id = m.employee_id;

####案例二：查询姓名中包含字符k的员工的名字和上级的名字
SELECT	e.last_name,m.last_name
FROM	employees e
INNER JOIN	employees m
ON	e.manager_id = m.employee_id
WHERE	e.last_name LIKE '%k%';



##二、外连接
###1、左外连接
####案例一：查询哪个部门没有员工
SELECT	d.*,employee_id
FROM	departments d
LEFT JOIN	employees e
ON	d.department_id = e.department_id
WHERE	e.employee_id IS NULL;

###2、右外连接
####案例一：查询哪个部门没有员工
SELECT	d.*,employee_id
FROM	employees e
RIGHT JOIN	departments d
ON	d.department_id = e.department_id
WHERE	e.employee_id IS NULL;



































