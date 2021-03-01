#视图
/*
含义：虚拟表，和普通表一样使用

比如：舞蹈班和普通班级的对比

*/

#一、创建视图
/*
语法：
create view 视图名
as
查询语句；

*/

#1、查询姓名中包含a字符的员工名、部门名和工种信息
CREATE VIEW myv1
AS
SELECT last_name,department_name,job_title
FROM employees e
INNER JOIN  departments d  ON  e.department_id = d.department_id
INNER JOIN  jobs j  ON  e.job_id = j.job_id;

SELECT * FROM myv1 WHERE last_name LIKE "%a%";

#2、查询各部门的平均工资级别
CREATE VIEW myv2
AS
SELECT	AVG(salary) ag,department_id
FROM	employees
GROUP BY	department_id;

SELECT myv2.ag,g.grade_level
FROM	myv2
JOIN  job_grades g
ON	myv2.ag BETWEEN	g.lowest_sal AND	g.highest_sal;

#3、查询平均工资最低的部门信息
SELECT *
FROM	myv2
ORDER BY	ag
LIMIT	1;

#4、查询平均工资最低的部门名和工资
CREATE VIEW myv3
AS
SELECT *
FROM myv2
ORDER BY	ag
LIMIT 1;

SELECT d.department_name,m.ag
FROM myv3 m
JOIN	departments d
ON	m.department_id = d.department_id;


#二、视图的修改

#方式一：
/*
create or replace view 视图名
as
查询语句；

*/

#方式二
/*
语法：
alter view 视图名
as
查询语句；

*/

#三、视图的查看

DESC myv3;

SHOW CREATE VIEW myv2;

#四、视图的删除
/*
语法：
drop view 视图名，视图名，···；


*/

DROP VIEW	myv1,myv2,myv3;





