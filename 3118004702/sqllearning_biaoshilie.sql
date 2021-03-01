#标识列
/*
又称为自增长列

含义：可以不用手动的插入值，系统提供默认的序列值

特点：
		1、标识列必须和键搭配
		2、一个表只能有一个标识列
		3、标识列的类型只能是数值
		4、标识列可以通过set auto_increment_increment = 3;设置

*/
USE students;


#一、创建表时添加标识列
DROP TABLE if EXISTS tab_identity;
CREATE TABLE tab_identity(
		id INT PRIMARY KEY AUTO_INCREMENT,
		NAME VARCHAR(20)
		
);

INSERT INTO tab_identity
VALUES (NULL,'john');
INSERT INTO tab_identity
VALUES (NULL,'john');
INSERT INTO tab_identity
VALUES (NULL,'john');

SELECT * FROM tab_identity;

#二、修改表时添加表示列------------同添加约束相同





















