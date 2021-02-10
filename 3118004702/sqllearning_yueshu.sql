#常见约束

/*
含义：
		一种限制，用于限制表格中的数据，为了保证表中的数据的准确性和可靠性
		
分类：六大约束
		not null：非空，用于保证该字段的值不能为空
				如姓名、学号等
		default：默认，用于保证改字段有默认值
				如性别
		primary key：主键，用于保证该字段的值都具有唯一性 ，并且非空
				如学号
		unique：唯一，用于保证该字段的值具有唯一性，可以为空
				如座位号
		check：检查约束【mysql中不支持】
				如性别（是否为‘男’或‘女’）
		foreign key：外键，用于限制两个表的关系

添加约束的时机：
		1、创建表时
		2、修改表时
		
		
约束的添加分类：
		列级约束：
				六大约束都支持，但外键约束没有效果
		表级约束：
				除了非空默认，其他的都支持

*/
CREATE	DATABASE	students;
USE	students;

#一、创建表时添加约束
#1、添加列级约束
DROP	TABLE	IF	EXISTS	stuinfo;
CREATE	TABLE		stuinfo(
		id INT PRIMARY KEY,
		stuName VARCHAR(20) NOT	NULL,
		gender CHAR(1) CHECK(gender = '男' OR gender = '女'),
		seat INT UNIQUE,
		age INT	DEFAULT  18,
		majorID INT REFERENCES major(id)
);
DESC	stuinfo;
DROP	TABLE	IF	EXISTS	major;
CREATE	TABLE	major(
		id INT	PRIMARY	KEY,
		majorName VARCHAR(20)
);



#2、添加表级约束
DROP	TABLE	IF EXISTS	stuinfo;
CREATE	TABLE	stuinfo(
		id INT,
		stuName VARCHAR(20),
		gender CHAR(1),
		seat INT,
		age INT,
		majorID int,
		
		CONSTRAINT	pk PRIMARY	KEY(id),#主键
		CONSTRAINT  uq UNIQUE(seat),#唯一
		CONSTRAINT	ch CHECK(gender = '男' OR gender = '女'),
		CONSTRAINT	fk_stuinfo_major FOREIGN	KEY(majorID) REFERENCES	major(id)

);

DESC	stuinfo;



#二、修改表时添加约束
DROP	TABLE	IF EXISTS	stuinfo;
CREATE	TABLE	stuinfo(
		id INT,
		stuName VARCHAR(20),
		gender CHAR(1),
		seat INT,
		age INT,
		majorID INT
);


DESC stuinfo;

#1、添加非空约束
ALTER	TABLE	stuinfo
MODIFY	COLUMN stuName VARCHAR(20) NOT	NULL;

#2、添加默认约束
ALTER	TABLE	stuinfo
MODIFY	COLUMN age INT	DEFAULT(18);

#3、添加主键
##列级约束
ALTER	TABLE	stuinfo
MODIFY	COLUMN	id INT PRIMARY	KEY;
##表级约束
ALTER	TABLE	stuinfo
ADD	PRIMARY	KEY(id);

#4、添加唯一键
#列级约束
ALTER	TABLE	stuinfo
MODIFY	COLUMN	seat INT	UNIQUE;
#表级约束
ALTER	TABLE	stuinfo
ADD	UNIQUE(seat);

#5、添加外键
ALTER	TABLE	stuinfo
ADD	CONSTRAINT	fk_stuinfo_major FOREIGN	KEY(majorID) REFERENCES	major(id);














