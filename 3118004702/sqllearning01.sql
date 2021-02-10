#进阶1：基础查询
/*
语法：
select 查询列表 from 表名；

特点：
1、查询列表可以是：表中的字段、常量值、表达式、函数
2、查询的结果是一个虚拟的表格
*/#使用数据库
USE myemployees;
#1、查询表中的单个字段
SELECT
	last_name 
FROM
	employees;
#2、查询表中的多个字段
SELECT
	last_name,
	salary,
	email 
FROM
	employees;
#3、查询表中的所有字段
SELECT
	* 
FROM
	employees;
	
#4、查询常量值
SELECT
	100;
SELECT
	'john';
#5、查询表达式
SELECT 100%98;

#6、查询函数
SELECT VERSION();

#7、起别名
/*
1、便于理解
2、如果要查询的字段有重复的情况，使用别名可以区分开来
*/

#方式一：使用AS
SELECT 100%98 AS 结果;
SELECT last_name AS 姓,first_name AS 名 FROM employees;

#方式二：使用空格
SELECT last_name 姓,first_name 名 FROM employees;

#案例：查询salary，显示结果为out put--需要引号表示一个整体
SELECT salary AS "out put" FROM employees;

#8、去重

#案例：查询员工表中涉及到的所有的部门编号
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

#9、+的作用
/*
java中
1、运算符，两个操作数都为数值型
2、连接符，只要有给1个操作数为字符串

mysql中
仅仅只有一个功能：运算符
#两个操作数均为数值，做加法运算
SELECT 100+90;
#只要其中有一个为字符型，试图将字符型数值转换为数值型
#如果转换成功，则继续做加法运算
SELECT '123'+90;
#如果转换失败，则将字符型数值转换为0
SELECT 'john'+90;
#若其中有一方为null，则结果肯定为null
SELECT null+10;
*/

#案例：查询员工名和姓连接成一个字符段，并显示为姓名

SELECT CONCAT('a','b','c') AS 结果;

SELECT CONCAT(last_name,first_name) AS 姓名
FROM employees;