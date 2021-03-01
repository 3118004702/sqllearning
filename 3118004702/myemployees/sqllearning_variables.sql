#变量
/*
系统变量：
				全局变量
						跨连接，不跨重启
				会话变量
						不跨连接，连接内全局
自定义变量：
				用户变量
						连接内全局
				局部变量
						
*/

#一、系统变量
/*
说明：
		变量由系统提供，不是用户定义，属于服务器层面

语法：
		1、查看所有的系统变量
		show global|session variables；
		
		2、查看满足条件的部分系统变量
		show global|session variables like “%char%”；
		
		3、查看指定的某个系统变量的值 
		select @@global|session.系统变量名；
		
		4、为某个系统变量赋值
		方式一：
				set global|session 系统变量名 = 值；
		方式二：
				set @@global|session.系统变量名 = 值；
*/

#一、全局变量
#1、查看所有的全局变量
SHOW GLOBAL VARIABLES;

#2、查看部分的全局变量
SHOW GLOBAL VARIABLES LIKE "%char%";

#3、查看指定的全局变量的值
SELECT	@@global.autocommit;

#4、为某个指定的全局变量赋值
SET	@@global.autocommit = 0;


#二、会话变量
#1、查看所有的会话变量
SHOW	SESSION	VARIABLES;

#2、查看部分的会话变量
SHOW	SESSION	VARIABLES LIKE	"%char%";


#三、自定义变量
/*
说明：
		变量是用户自己定义的，不是由系统定义的

使用步骤：
		1、声明并初始化
				set @用户变量名 = 值；
				set @用户变量名 := 值；
				select @用户变量名 := 值；
		2、赋值
				方式一：
						set @用户变量名 = 值；
						set @用户变量名 := 值；
						select @用户变量名 := 值；
				方式二：
						select 字段 into @变量名
						from 表；								
		3、使用（查看、比较、运算）
						select @用户变量名；
*/

#案例：
#声明并初始化、赋值
#方式一
SET	@name = 'john';
SET	@name = 100;
SET @count = 1;
#方式二
SELECT COUNT(*) INTO @count
FROM	employees;
#使用
SELECT @count;


#四、局部变量
/*
作用域：仅仅在定义它单位begin end中有效

使用步骤：
		1、声明并初始化
				declare 变量名 类型；
				declare 变量命 类型 default 值；
				
		2、赋值
				方式一：
						set 用户变量名 = 值；
						set 用户变量名 := 值；
						select @用户变量名 := 值；
				方式二：
						select 字段 into 变量名
						from 表；								
		3、使用（查看、比较、运算）
						select 用户变量名；

*/

#案例：声明两个变量并赋初始值，求和，并打印

#1、用户变量
SET	@m = 1;
SET @n = 2;
SET @l = @m + @n;

SELECT @l;

#2、局部变量

DECLARE	a INT DEFAULT 1;
DECLARE b INT DEFAULT 2;
DECLARE c INT;

SET	c = a + b;
SELECT c;


