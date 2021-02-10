#进阶3：进阶排序

USE myemployees;

/*
语法：
SELECT 查询列表
FROM	表
WHERE	筛选条件
ORDER BY	排序列表（ASC   DESC）

特点：
1、ORDER BY子句支持单个字段、多个字段、表达式、函数、别名
2、ORDER BY子句一般放在查询语句最后，除了limit子句
*/

#案例一：查询员工信息，要求工资从高到底排下序
SELECT *
FROM	employees
ORDER BY	salary DESC;

#案例二：查询部门编号>=90的员工信息，按入职时间的先后进行排序（添加筛选条件）
SELECT * 
FROM employees
WHERE	department_id >= 90
ORDER BY	hiredate ASC;

#案例三：按年薪的高低显示员工的信息和年薪（按表达式表达）
SELECT *,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪
FROM	employees
ORDER BY 年薪 DESC;

#案例四：按姓名的长度显示员工的姓名和工资（按函数排序）
SELECT last_name,salary,LENGTH(last_name) 字节长度
FROM employees
ORDER BY LENGTH(last_name) DESC;

#案例五：查询员工信息，要求先按工资降序排序，在按员工编号升序排序（按多个字段排序）
SELECT	*
FROM	employees
ORDER BY	salary DESC,employee_id ASC;



















