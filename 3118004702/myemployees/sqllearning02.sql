#进阶二：条件查询
/*
一、按条件表达式筛选
		条件运算符：<  >  =  <=  >=  <>
二、按逻辑表达式筛选
		逻辑运算符：and  or  not 
三、模糊查询
		like
		between and
		in
		is null
*/

USE myemployees;

#1、按条件表达式筛选

#案例一：查询工资大于12000的员工信息
SELECT *
FROM employees
WHERE salary > 12000;

#案例二：查询部门编号不等于90好的员工名字和部门编号
SELECT last_name,department_id
FROM employees
WHERE department_id <> 90;

#2、按逻辑表达式筛选

#案例一：查询工资在10000到20000之间的员工的员工名、工资以及奖金
SELECT
		last_name,salary,commission_pct
FROM
		employees
WHERE
		salary > 10000 AND salary <20000;
		
#案例二：查询部门编号不是在90和110之间，或者工资高于15000的员工的信息
SELECT
		*
FROM
		employees
WHERE
		department_id < 90 OR department_id > 110 OR salary > 15000;

#3、模糊查询
/*
like
特点：
1、一般与通配符搭配使用
						通配符：
									%  任意多个字符，包含0个字符
									—  任意单个字符
between and
in
is null    is not null
*/

#like

#案例一：查询员工名中包含字符a的员工信息
SELECT * 
FROM employees
WHERE last_name LIKE '%a%';

#案例二：查询员工名中第三个字符为n，第五个字符为l的员工名和工资
SELECT last_name,salary
FROM	employees
WHERE last_name LIKE '__n_l%'; 

#案例三：查询员工名中第二个字符为_的员工名
#方式一
SELECT last_name
FROM employees
WHERE last_name LIKE '_\_%';
#方式二
SELECT last_name
FROM employees
WHERE last_name LIKE '_$_%' ESCAPE '$';

#between and
/*
1、可以提高语句简洁度
2、包含两个临界值
3、临界值不能调换顺序
*/

#案例一：查询员工编号在100到120之间的员工信息
#方式一
SELECT *
FROM employees
WHERE employee_id >100 AND employee_id < 120;
#方式二
SELECT *
FROM employees
WHERE employee_id BETWEEN 100 AND 120;

#in
#案例：查询员工的工种编号是IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
#方式一
SELECT last_name,job_id
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'AD_VP' OR job_id = 'AD_PRES';
#方式二
SELECT last_name,job_id
FROM employees
WHERE job_id IN ('IT_PROG','AD_VP','AD_PRES');

#is null

#案例一：查询没有奖金的员工名和奖金率
SELECT last_name,commission_pct
FROM	employees
WHERE commission_pct IS NULL;

#案例二：查询有奖金的员工名和奖金率
SELECT last_name,commission_pct
FROM	employees
WHERE commission_pct IS NOT NULL;



#经典面试题
/*
试问
select * from employees;
和
select * from employees where commission_pct like '%%' and last_name like '%%';
结果是否一样？
并说明原因。
*/

/*
结果不同：如果奖金率（commission_pct）的值为null时，第二个语句将无法得出选择结果（条件不成立null无法like）

如果将and改为or，只要有一个条件中不包含null值，则结果相同。
*/







