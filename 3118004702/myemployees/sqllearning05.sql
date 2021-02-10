#进阶5：分组查询
/*
语法：
		select 分组函数，列（要求出现在group by的后面）
		from 表
		where 筛选条件
		group by 分组的列表
		order by 子句
		
注意：
		查询列表必须特殊，要求是分组函数和group by后出现的字段
		
特点：
		1、分组查询后做条件的放在having子句中
		2、优先使用分组前筛选--------效率高
		3、GROUP BY子句既支持单个字段分组，也支持多个字段分组
		4、也可以添加排序（排序放在整个分组查询的最后）	
*/

#一、简单的查询
#案例一：查询每个工种的最高工资
SELECT	MAX(salary),job_id
FROM	employees
GROUP BY	job_id;

#案例二：查询每个位置上的部门个数
SELECT	COUNT(*),location_id
FROM	departments
GROUP BY	location_id;


#二、添加筛选条件
#案例一：查询邮箱中包含a字符的每个部门的平均工资
SELECT AVG(salary),department_id
FROM	employees
WHERE	email	LIKE	'%a%'
GROUP BY	department_id;

#案例二：查询有奖金的每个领导手下的员工的最高工资
SELECT	MAX(salary),manager_id
FROM	employees
WHERE	commission_pct IS NOT NULL
GROUP BY	manager_id;


#三：添加复杂的查询条件-------------分组后查询------------	HAVING
#案例一：查询哪个部门的员工个数>2
SELECT	department_id,COUNT(*)
FROM	employees
GROUP BY	department_id
HAVING	COUNT(*) > 2;

#案例二：查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
SELECT	job_id,MAX(salary) l
FROM	employees
WHERE	commission_pct IS NOT NULL
GROUP BY	job_id
HAVING	l > 12000;

#案例三：查询领导编号>102的每个领导手下的最低工资>5000的领导编号是哪个，以及其最低工资
SELECT	manager_id,MIN(salary) mi
FROM	employees
WHERE	manager_id>102
GROUP BY	manager_id
HAVING	mi>5000;


#四、按表达式或函数分组
#案例一：按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数>5
SELECT	LENGTH(last_name) l,COUNT(*) c
FROM	employees
GROUP BY	l
HAVING	c>5;


#五、按多个字段分组
#案例一：查询每个部门每个工种的员工的平均工资
SELECT	department_id	d,job_id j,AVG(salary)
FROM	employees
GROUP BY	d,j;


#六、添加排序
#案例一：查询每个部门每个工种的员工的平均工资，并且按照平均工资的高低显示
SELECT	department_id	d,job_id j,AVG(salary) a
FROM	employees
GROUP BY	d,j
ORDER BY	a desc;

















