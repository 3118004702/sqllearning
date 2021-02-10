#DDL
/*
数据定义语言

库和表的管理

一、库的管理：
				创建
				修改
				删除
				
二、表的管理：
				创建
				修改
				删除
				
*/

#一、库的管理
##1、库的创建
/*
CREATE	DATABASE	库名；
*/
###案例一：创建库book
CREATE	DATABASE	book;

###案例二：安全创建库book；
CREATE	DATABASE	IF	NOT	EXISTS	book;


##2、库的修改
###案例一：更改库的字符集
ALTER	DATABASE	book	CHARACTER	SET	gbk;


##3、库的删除
###案例一：安全删除库book
DROP	DATABASE	IF EXISTS	book;


#二、表的管理
##1、表的创建
/*
语法：

CREATE	TABLE	表名（
					列名	列的类型【（长度）	约束】，
					列名	列的类型【（长度）	约束】，
					···
）
*/
###案例一：创建表Book
USE	book;

CREATE	TABLE	book(
				id INT,
				bName VARCHAR(20),
				price	DOUBLE,
				authorID	INT,
				publishDate	DATETIME
);

DESC	book;

###案例二：创建表 author
CREATE	TABLE	author(
				id	int,
				au_name	VARCHAR(20),
				nation VARCHAR(10)
)

DESC	author;


##2、表的修改
/*
ALTER	TABLE	表名	ADD|DROP|MODIFY|CHANGE	COLUMN	列名【列类型   约束】；
*/
###案例一：修改列名
ALTER	TABLE book 
CHANGE	COLUMN	publishDate pubDate DATETIME;
 
###案例二：修改列的类型和约束
ALTER	TABLE book 
MODIFY	COLUMN pubdate TIMESTAMP;

###案例三：添加新列
ALTER	TABLE	book
ADD	COLUMN	annual DOUBLE;

###案例四：删除列
ALTER	TABLE	book
DROP	COLUMN	annual;

###案例五：修改表名
ALTER	TABLE	author
RENAME	TO book_authors;


##3、表的删除
DROP	TABLE	IF	EXISTS	book_author;

SHOW	DATABASES;


##通用写法
DROP	DATABASE	IF	EXISTS	旧库名；
CREATE	DATABASE	新库名；

DROP	TABLE	IF	EXISTS	旧表名；
CREATE	TABLE	新表名（）；


##4、表的复制

INSERT	INTO	author
VALUES	(1,'村上春树','日本'),
				(2,'莫言','中国'),
				(2,'冯唐','中国'),
				(2,'金庸','中国');

###案例一：仅仅复制表的结构
CREATE	TABLE	copy
LIKE	author;

###案例二：复制表的结构+数据
CREATE	TABLE	copy2
SELECT	*		FROM	author;

###案例三：只复制部分数据
CREATE	TABLE	copy3
SELECT	id,au_name
FROM	author
WHERE	nation = '中国';

###案例四：仅仅复制部分结构
CREATE	TABLE	copy4
SELECT	id,au_name
FROM	author
WHERE	0;




































































