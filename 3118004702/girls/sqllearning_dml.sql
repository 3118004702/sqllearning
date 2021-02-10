#DML语言
/*
数据操作语言：
		插入：insert
		修改：update
		删除：deleete
			
*/

#一、插入语句
##插入方式一
/*
语法：
INSERT	INTO	表名（列名，···）
VALUES	（值1，···）；

*/
SELECT	*	FROM	beauty;

###1、插入的值的类型要与列的类型一致或兼容
INSERT	INTO	beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
VALUES(13,'唐艺昕','女','1990-4-23','1898888888',NULL,2);

###2、不可以为null的列必须插入值，可以为null的列如何插入值
####方式一---------------在可以为null的列插入值null
INSERT	INTO	beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
VALUES(13,'唐艺昕','女','1990-4-23','1898888888',NULL,2);

####方式二---------------省略可以为null的列
INSERT	INTO	beauty(id,NAME,sex,borndate,phone,boyfriend_id)
VALUES(14,'金星','女','1990-4-23','1388888888',9);

INSERT	INTO	beauty(id,NAME,sex,phone)
VALUES(15,'娜扎','女','1388888888');

###3、列的顺序可以颠倒
INSERT	INTO	beauty(NAME,sex,id,phone)
VALUES('蒋欣','女',16,'110');

###4、列和值的个数必须一致
INSERT	INTO	beauty(NAME,sex,id,phone)
VALUES('关晓彤','女',17,'110');

###5、可以省略列名，默认所有列，而且列的顺序和表中顺序一致
INSERT	INTO	beauty
VALUES(18,'张飞','男',NULL,'119',NULL,NULL);


##插入方式二
/*
语法：
INSERT	INTO	表名
SET		列名=值，列名=值，···

*/

INSERT	INTO	beauty
SET	id=19,NAME='刘涛',phone='119';



#二、修改语句
/*
1、修改单表的记录
语法：
UPDATE	表名
SET	列=新值，列=新值，···
WHERE	筛选语句；

2、修改多表的记录
语法：

sql92语法：-----------------------仅支持内连接
UPDATE	表1 别名，表2 别名
SET	列=值，···
WHERE	筛选条件
AND	筛选条件；

sql99语法：
UPDATE	表1 别名
INNER|LEFT|RIGHT	JOIN	表2 别名
ON	连接条件
SET		列=值，···
WHERE		筛选条件；

*/
SELECT	*		FROM	beauty;

##1、修改单表的记录
###案例一：修改beauty表中姓唐的女生的电话为13899888899
UPDATE	beauty
SET	phone = '13899888899'
WHERE	`name`	LIKE	'唐%';

###案例二：修改boys表中id号为2的名称为张飞，魅力值为10
UPDATE	boys
SET	boyName = '张飞',userCP = 10
WHERE	id=2;

##2、修改多表的记录
###案例一：修改张无忌的女朋友的手机号为114
UPDATE	beauty b
INNER JOIN	boys bo
ON	b.boyfriend_id = bo.id
SET		phone = '114'
WHERE	bo.boyName = '张无忌';

###案例二：修改没有男朋友的女生的男朋友编号都为2号
UPDATE	beauty b 
LEFT JOIN	boys bo 
ON	b.boyfriend_id = b.id
SET		b.boyfriend_id = 2
WHERE		b.boyfriend_id	IS	NULL;


#三、删除语句
/*
方式一：delete

语法：
1、单表的删除
DELETE	FROM	表名
WHERE		筛选条件；

2、多表的删除
sql92语法：---------------------仅支持内连接
DELETE	表1的别名，表2的别名
FROM	表1 别名，表2 别名
WHERE	连接条件
AND	筛选条件；

sql99语法：
DELETE	表1的别名，表2的别名
INNER|LEFT|RIGHT	JOIN	表2 别名
ON	连接条件
WHERE	筛选条件；


方式二：truncate
语法：TRUNCATE	TABLE		表名；


*/
##方式一：DELETE
###单表的删除
####案例一；删除手机号一9结尾的女生信息
DELETE	FROM	beauty
WHERE	phone	LIKE	'%9';

###多表的删除
####案例一：删除张无忌的女朋友的信息
DELETE	b
FROM	beauty b
INNER JOIN	boys bo
ON	b.boyfriend_id = bo.id
WHERE	bo.id = 1;

####案例二：删除黄晓明以及他女朋友的信息
DELETE	b,bo
FROM	beauty b
INNER JOIN	boys bo
ON	b.boyfriend_id = bo.id
WHERE	bo.boyName = '黄晓明';



##方式二：TRUNCATE

###案例一：将魅力值>100的男神信息删除
TRUNCATE	TABLE	boys;








