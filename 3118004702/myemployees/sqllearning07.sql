#进阶7：子查询
/*
含义：
		出现在其他语句中的select语句，称为子查询或内查询

分类：
		按照子查询出现的位置：
						select后面；
									仅仅支持标量子查询
						from后面；
									支持表子查询
						where或having后面；
									标量子查询（单行单列）
									列子查询（单列多行）
									行子查询（单行多列）
						exists后面；（相关子查询）
									表子查询（多行多列）
									
		按照结构集的行列数不同；
						标量子查询；单行单列
						列子查询 ；单列多行
						行子查询；单行多列
						表子查询；多行多列
						
*/

#一、where和having后面
##1、标量子查询（单行单列）
###案例一：谁的工资比Abel高
SELECT	*
FROM	employees
WHERE	salary > (
			SELECT	salary
			FROM	employees
			WHERE	last_name = 'Abel'
);

###案例二：返回job_id与141号员工相同，salary比143号员工多的员工的姓名，job_id和工资
SELECT	last_name,job_id,salary
FROM	employees
WHERE	job_id = (
		SELECT	job_id
		FROM	employees
		WHERE	employee_id = 141
)
AND	salary > (
		SELECT	salary
		FROM	employees
		WHERE	employee_id = 143
);

###案例三：返回公司工资最少的员工的名字，job_id和salary
SELECT	last_name,job_id,salary
FROM	employees
WHERE	salary = (
		SELECT	MIN(salary)
		FROM	employees
);

###案例四：查询最低工资大于50号部门最低工资的部门的部门id和其最低工资
SELECT	department_id,MIN(salary)
FROM	employees
GROUP BY	department_id
HAVING	MIN(salary) > (
		SELECT	MIN(salary)
		FROM	employees
		WHERE	department_id = 50
);


##2、列子查询（单列多行）
###案例一：返回location_id是1400或1700的部门中的所有员工姓名
SELECT	last_name
FROM	employees
WHERE	department_id IN (
		SELECT	department_id
		FROM	departments
		WHERE	location_id IN (1400,1700)
);

###案例二：返回其他工种中比job_id为‘IT_PROG’工种任意工资低的员工的员工名、姓名、job_id以及salary
SELECT	last_name,job_id,salary
FROM	employees
GROUP BY	job_id
HAVING	salary < (
		SELECT	MAX(salary)
		FROM	employees
		WHERE	job_id = 'IT_PROG'
);

##3、行子查询
###案例一：查询员工编号最小并且工资最高的员工信息
SELECT	*
FROM	employees
WHERE	employee_id = (
		SELECT	MIN(employee_id)
		FROM	employees
)
AND	salary = (
		SELECT	MAX(salary)
		FROM	employees
);


#二、FROM后面
##案例一：查询每个部门的平均工资的工资等级--------此处有问题
SELECT	ag_dep.*,g.grade_level
FROM	(
		SELECT	AVG(salary) ag,department_id
		FROM	employees
		GROUP BY	department_id
)  ag_dep
INNER JOIN	job_grades g
ON	ag_dep.salary BETWEEN	lowest_sal AND highest_sal;



#三、EXISTS后面
##案例一：查询有员工的部门名
SELECT	department_name
FROM	departments d
WHERE	EXISTS(
		SELECT *
		FROM	employees e
		WHERE	d.department_id = e.department_id
);
































