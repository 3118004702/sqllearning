#进阶9：联合查询
/*
UNION-----联合查询
		将多条查询语句的结构合并成一个结果

语法：
查询语句1
UNION
查询语句2

应用场景：
		要查询的结果来自于多个表，且多个表没有直接的连接关系，但查询的信息一致时

*/

#案例一：查询部门编号>90或邮箱包含a的员工信息
SELECT	*	FROM	employees	WHERE	email	LIKE	'%a%'
UNION
SELECT	*	FROM	employees	WHERE	department_id>90;