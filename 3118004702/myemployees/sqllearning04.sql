#进阶4：常见函数
/*
一、单行函数
			字符函数
			数学函数
			日期函数
			其他函数
			流程控制函数
*/

#一、字符函数


#1、length获取参数值的字节个数------一个汉字占三个字节

SELECT LENGTH('john');
SELECT LENGTH('张三丰hahaha');

SHOW VARIABLES LIKE '%char%'

#2、拼接字符串-----concat

SELECT	CONCAT(last_name,'_',first_name) 姓名
FROM employees;

#3、大写----upper,小写----lower

SELECT UPPER('john');
SELECT LOWER('joHN');

#4、索引截取----substr,substring----索引从1开始

#截取从指定索引处后面的所有字符
SELECT SUBSTR('李莫愁爱上了陆展元',7) out_put;

#截取从指定索引处开始指定长度的字段
SELECT SUBSTR('李莫愁爱上了陆展元',2,4) out_put;

#案例：姓名中首字符大写，其他字符小写然后用_拼接，显示出来
SELECT CONCAT(UPPER(SUBSTR(last_name,1,1)),'_',LOWER(SUBSTR(last_name,2))) out_put
FROM employees;

#5、查找索引----返回字符串第一出现时的索引-----instr
SELECT INSTR('殷六。杨不悔爱上了殷六侠','殷六侠') out_put;

#6、去除前后字符--------默认去除空格-----trim
SELECT TRIM('    张翠山            ') out_put;
SELECT TRIM('a' FROM 'aaaaaaaaaaa张翠山aaaaaaaaaaaa') out_put;

#7、用指定的字符填充至指定的长度------lpad--左填充-----rpad----右填充
SELECT LPAD('殷素素',10,'*') out_put;
SELECT RPAD('殷素素',12,'ab') out_put;

#8、替换-----replace
SELECT REPLACE('张无忌爱上了周芷若呀周芷若','周芷若','赵敏') '花心大萝卜';


#二、数学函数

#1、四舍五入-------round
SELECT ROUND(1.55) out_put;
SELECT ROUND(5.87545,2);

#2、取整函数------上去整----ceil-----下取整----------floor
SELECT	CEIL(-1.02);
SELECT	FLOOR(-9.99);

#3、截断-------truncate
SELECT TRUNCATE(1.6999999,1);

#4、取余----mod（a，b）-----a-a/b*b
SELECT MOD(10,3);


#三、日期函数

#1、返回当前系统日期+时间-----now
SELECT NOW();

#2、返回当前系统日期，不含时间-----curdate
SELECT CURDATE();

#3、返回当前时间，不含日期-------curtime
SELECT CURTIME();

#4、获取指定部分的年、月、日、小时、分钟、秒
SELECT YEAR(NOW()) 年;
SELECT YEAR('1998-1-1') 年;
SELECT YEAR(hiredate) 年 FROM employees;

SELECT MONTH(NOW()) 月;
SELECT MONTHNAME(NOW()) 月；

#4、将字符型的日期转换为日期格式------str_to_date
SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d') out_put;

#案例一：查询入职时间为1992-4-3的员工
SELECT * FROM employees WHERE hiredate='1992-4-3';

SELECT * FROM employees WHERE hiredate=STR_TO_DATE('4-3 1992','%c-%d %Y');

#5、将日期格式的日期转换为字符格式------date_format
SELECT DATE_FORMAT(NOW(),'%y年%m月%d日') out_put;

#案例一：查询有奖金的员工名和入职日期（xx月/xx日 xx年）
SELECT last_name,DATE_FORMAT(hiredate,'%m月/%d日 %y年') 入职日期
FROM	employees
WHERE	commission_pct IS NOT NULL;


#四、其他函数

#1、数据库版本
SELECT VERSION();

#2、查看当前数据库
SELECT DATABASE();

#3、查看当前用户
SELECT USER();


#五、流程控制函数

#1、if函数
SELECT IF(10<5,'大','小');

SELECT last_name,commission_pct,IF(commission_pct IS NULL,'没奖金，呵呵','有奖金，嘻嘻') 备注
FROM	employees;

#2、case函数
/*
java中
switch(变量或表达式){
					case 变量1：语句1；break；
					···
					default：语句n；break；
}

mysql中
case 要判断的字段或表达式
when 常量1 then 要表达的值1或语句1；
when 常量2 then 要表达的值2或语句2；
···
else 要显示的值n或语句n；
end
*/

/*
案例一：查询员工的工资，要求
部门号=30，显示的工资为1.1倍
部门号=40，显示的工资为1.2倍
部门号=50，显示的工资为1.3倍
其他部门，显示为原工资
*/

SELECT salary 原始工资,department_id,
CASE department_id
WHEN 30 THEN	salary*1.1
WHEN 40 THEN	salary*1.2	
WHEN 50 THEN	salary*1.3
ELSE		salary
END AS 新工资
FROM	employees;

/*
案例二：查询员工工资的情况 
如果工资>20000，显示A级别
如果工资>15000，显示B级别
如果工资>10000，显示C级别
否则，显示D级别
*/

SELECT salary,
CASE 
WHEN salary>20000 THEN 'A'
WHEN salary>15000 THEN 'B'
WHEN salary>10000 THEN 'C'
ELSE 'D'
END AS 工资级别
FROM employees;



/*
二、分组函数
		功能：用作统计使用，又称为聚合函数或统计函数或组函数
		
		分类：
				sum-求和      avg-平均值
        max-最大值    min-最小值
				count-计数 
		
		特点：
			1、sum、avg一般用于处理数值型
				 max、min、count可以处理任何类型
		  2、以上分组都忽略null
			3、可以和distinct搭配
			4、count函数的效率
							MYISAM存储引擎下，COUNT(*)的效率高
							INNODB存储引擎下，COUNT(*)的效率和COUNT(1)的效率差不多，比COUNT(字段)要高一些
*/

#1、简单的使用
SELECT	SUM(salary)	FROM	employees;
SELECT	AVG(salary)	FROM	employees;
SELECT	MAX(salary) FROM	employees;
SELECT	MIN(salary)	FROM	employees;
SELECT	COUNT(salary)	FROM	employees;

#2、支持哪些类型
SELECT	MAX(last_name),MIN(last_name) FROM	employees;
SELECT	MAX(hiredate),MIN(hiredate)	FROM	employees;
SELECT	COUNT(commission_pct)	FROM	employees;
SELECT	COUNT(hiredate)	FROM	employees;

#3、和distinct搭配-----值不同
SELECT	SUM(DISTINCT salary),SUM(salary)	FROM	employees;

#4、count函数的详细介绍
SELECT	COUNT(salary)	FROM	employees;
SELECT	COUNT(*)	FROM	employees;
SELECT	COUNT(1)	FROM	employees;







