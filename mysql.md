数据库（DataBase，简称DB）
===

数据库是长期存放在计算机内、有组织、可共享的数据即可。
数据库中的数据按一定的数据模型组织、描述和储存，具有较小的冗余度、较高的数据独立性和易扩展性，并可为各种用户共享

数据库管理系统（DataBase Management System 简称DBMS）
===

在了解了Data与DB的概念后，如何科学地组织和存储数据，如何高效获取和维护数据成了关键
这就用到了一个系统软件---数据库管理系统
如MySQL、Oracle、SQLite、Access、MS SQL Server

    数据库服务器：运行数据库管理软件
    数据库管理软件：管理-数据库
    数据库：即文件夹，用来组织文件/表
    表：即文件，用来存放多行内容/多条记录

文件系统管理数据具有以下缺点：
===

1 数据共享性差，冗余度大：一个文件对应一个应用程序，不同应用有相同数据时，也必须建立各自的文件，不能共享相同的数据，造成数据冗余，浪费空间，且相同的数据重复存储，各自管理，容易造成数据不一致性

2 数据独立性差：一旦数据的逻辑结构改变，必须修改应用程序，修改文件结构的定义。应用程序的改变，也将引起文件的数据结构的改变。因此数据与程序之间缺乏独立性。可见，文件系统仍然是一个不具有弹性的无结构的数据集合，即文件之间是孤立的，不能反映现实世界事物之间的内存联系。

MySQL
===
mysql就是一个基于socket编写的C/S架构的软件
客户端软件

    mysql自带：如mysql命令，mysqldump命令等
    python模块：如pymysql

数据库管理软件分类
===
分两大类：

    关系型：如sqllite，db2，oracle，access，sql server，MySQL，注意：sql语句通用
    非关系型：mongodb，redis，memcache

可以简单的理解为：

    关系型数据库需要有表结构
    非关系型数据库是key-value存储的，没有表结构

Mysql安装
===
1.安装

    yum -y install mysql-server mysql


2.添加自启动服务

    chkconfig --add mysql
    chkconfig mysql on

3.启动mysql

    chkconfig --list | grep 'mysql'
    service mysql start     #linux
    brew services start mysql   #mac

    # 获取 service 列表
    brew services list
    # 重启 mysql 服务
    brew services restart mysql
    # 停止 mysql 服务
    brew services stop mysql

    加入密码后，可以用mysql.server启动
    mysql.server start 


4.登录mysql及改密码与配置远程访问

    mysqladmin -u root password 'your_password'     
    mysql -u root -p     #登录mysql,需要输入密码

5.修改密码

    mysqladmin -u root -p password "NewPasswd"  
    mysqladmin -u root -p'OldPasswd' password 'NewPasswd'
    mysql -h 服务器IP -P 端口号 -u 用户名 -p 密码
    mysql -h 127.0.0.1 -P 3306 -uroot -pmysql



    旧版本mysql允许远程访问
    mysql>GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'your_password' WITH GRANT OPTION;     #允许root用户远程访问
    mysql>GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'your_password';     #允许root用户远程访问
    mysql>GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'mysql';     #允许root用户远程访问
    GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'mysql';
    FLUSH PRIVILEGES;     #刷新权限

    新版本mysql允许远程访问
    create user 'NEW_NAME'@'127.0.0.1' identified by 'passwd';   #必须创建root以外的用户
    grant all on *.* to 'NEW_NAME'@'127.0.0.1' with grant option;
    FLUSH PRIVILEGES;

新版SQL授权用户时报错 near 'IDENTIFIED BY '密码' with grant option' at line 1

1 问题:
当使用 grant 权限列表 on 数据库 to ‘用户名’@’访问主机’ identified by ‘密码’; 时会出现”……near ‘identified by ‘密码” at line 1”这个错误

2 原因:
因为新版的的mysql版本已经将创建账户和赋予权限的方式分开了

3解决办法:
创建账户:create user ‘用户名’@’访问主机’ identified by ‘密码’;
赋予权限:grant 权限列表 on 数据库 to ‘用户名’@’访问主机’ ;(修改权限时在后面加with grant option)

----------------------------------------------------------------------------
报错信息:pymysql.err.OperationalError: (1045, "Access denied for user 'root'@'localhost' (using password: NO)。
原理：新版mysql更换了root密码的认证方式，使用的是caching_sha2_password。
解决办法：命令行里输入如下指令。

    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_passwd';
----------------------------------------------------------------------------
远程连接MySQL(connection refused)解决方法
打开防火墙3306端口

    vim /etc/sysconfig/iptables
    要把开放端口语句，放前面, 有执行顺序，写后面就没用

    service iptables restart








操作命令
===

###1. 操作文件夹/database

    增：create database db_name [charset utf8];

    删: drop database db_name;

    改：alter database db_name charset latin1;

    查：show databases; 查看所有数据库
        show create database db1;  查看数据库的创建方式
        select database();  查看当前使用的数据库
        show engines\G;     查询所有支持的存储引擎 

    用：use db_name;    进入文件夹

###2. 操作文件/表

    先切换到文件夹下：use db1

#### 表本身

    增：create table t1(id int,name char);
        
    删：drop table t1;

    改：rename table oldName to newName;    #修改表名称

    查：show tables;

#### 表字段
    
    增：alter table t1 add name char(3)[first/after];
        
    删：alter table t1 drop primary key;

    改：alter table t1 modify name char(3); #字段属性
        alter table t1 change name name1 char(2);   #修改字段名称

    查：desc tb_name;    
        show create table tb_name\G; 


#3. 操作文件中的内容/记录

    增：insert [into] t1 (f1, f2) values(v1, v2);
        insert [into] t1 set f1=v1, f2=v2;

    删：delete from t1 [where...];
        如果不跟where语句则删除整张表中的数据
        truncate table t1;   #此种方式删除的数据不能在事务中恢复

    改：update t1 set f1=v1, f2=v2 [where...];

    查：select * from t1;

    清空表：
    delete from t1; #如果有自增id，新增的数据，仍然是以删除前的最后一样作为起始。
    truncate table t1;数据量大，删除速度比上一条快，且直接从零开始，
    auto_increment 表示：自增
    primary key 表示：约束（不能重复且不能为空）；加速查找

#3.1 进阶查询：

    select [distinct] *|field1 [as] F1 ...   from tab_name

    where 
    group by field
    having 
    order by field
    limit 


####3.1.1 where字句中可以使用：

    > < >= <= <> !=
    between v1 and v2 
    in(v1, v2,...) 
    and or not

    like 'string%'
    %匹配任意个字符, 等同正则中'.*'
    _匹配任意一个字符。两个_匹配任意两个字符：__

####3.1.2 Order by 指定排序的列，排序的列即可是表中的列名，也可以是select 语句后指定的别名。

    select *|field1... from tab_name order by field [Asc|Desc]

####3.1.3 having 和 where两者都可以对查询结果进行进一步的过滤，差别有：

    where语句用在分组之前的筛选，having用在分组之后的筛选；
    having中可以用聚合函数，where中不行
    使用where语句的地方一般可以用having替换, 除了执行顺序上面的差异

####3.1.4 聚合函数

    COUNT   SUM    AVG    MAX    MIN

    count(*) 统计所有行    count(field)不统计null值
    注意：null 和所有的数计算都是null，所以需要用ifnull将null转换为0
    ifnull(filed,0)

####3.1.5 执行顺序

    Select from where group by having order by

    Mysql在执行sql语句时的执行顺序：
    from  where  select group by  having order by

####3.1.6 limit

    SELECT * from tab_name limit 1;
    SELECT * from tab_name limit 2,5;--跳过前两条显示接下来的五条纪录

####3.1.7 正则
    
    REGEXP pattern


####3.1.8 外键约束

    外键的使用条件：

　　1.两个表必须是InnoDB表
　　2.外键引用的列必须建立了索引，或者是主键
　　3.外键关系的两个表的列必须是数据类型相似，也就是可以相互转换类型的列，比如int和tinyint可以，而int和char则不可以；

    外键的好处：可以使得两张表关联，保证数据的一致性和实现一些级联操作；

    [constraint symbol] foreign key [id] (index_col_name, ...)
    references tbl_name (index_col_name, ...)
    [on delete {restrict | cascade | set null | on action | set default}]
    [on update {restrict | cascade | set null | on action | set default}]

    该语法可以在 create table 和 alter table 时使用，如果不指定constraint symbol，MYSQL会自动生成一个名字。
    on delete,on update表示事件触发限制，可设参数：
    restrict（限制外表中的外键改动）
    cascade（跟随外键改动）
    set null（设空值）
    set default（设默认值）
    no action（无动作，默认的）


    增加外键
    ALTER TABLE child_tab_name ADD CONSTRAINT fk_name) FOREIGN KEY(field)
    REFERENCES  main_tab_name(field);

    删除外键
    ALTER TABLE child_tab_name DROP FOREIGN KEY abc;


####INNODB支持的ON语句

    外键约束对子表的含义:如果在父表中找不到候选键,则不允许在子表上进行insert/update

    外键约束对父表的含义:    在父表上进行update/delete以更新或删除在子表中有一条或多条对
    应匹配行的候选键时,父表的行为取决于：在定义子表的外键时指定的on update/on delete子句


-----------------innodb支持的四种方式---------------------------------------

-----cascade方式 在父表上update/delete记录时，同步update/delete掉子表的匹配记录
-----外键的级联删除：如果父表中的记录被删除，则子表中对应的记录自动被删除--------

     FOREIGN KEY (charger_id) REFERENCES main_tab_name(field)
                              ON DELETE CASCADE


------set null方式 在父表上update/delete记录时，将子表上匹配记录的列设为null
   -- 要注意子表的外键列不能为not null

     FOREIGN KEY (charger_id) REFERENCES main_tab_name(field)
                              ON DELETE SET NULL


------Restrict方式 :拒绝对父表进行删除更新操作(了解)

------No action方式 在mysql中同Restrict,如果子表中有匹配的记录,则不允许对父表对应候选键

####多表查询

#####内连接

    查询两张表中都有的关联数据,相当于利用条件从笛卡尔积结果中筛选出了正确的结果
    select * from tabA,tabB where tabA.field = tabB.field;
    select * from tabA inner join tabB on tabA.field = tabB.field;

#####外连接

    1）左外连接：在内连接的基础上增加左边有右边没有的结果
    select * from tabA left join tabB on tabA.field = tabB.field;

    2）右外连接：在内连接的基础上增加右边有左边没有的结果
    select * from tabA RIGHT JOIN tabB on tabA.field = tabB.field;

    3）全外连接：在内连接的基础上增加左边有右边没有的和右边有左边没有的结果
    -- mysql不支持全外连接 full JOIN
    -- mysql可以使用此种方式间接实现全外连接

    select * from tabA RIGHT JOIN tabB on tabA.field = tabB.field
    UNION
    select * from tabA LEFT JOIN tabB on tabA.field = tabB.field;

#####多表查询之子查询

    子查询是将一个查询语句嵌套在另一个查询语句中。
    内层查询语句的查询结果，可以为外层查询语句提供查询条件。
    子查询中可以包含：IN、NOT IN、ANY、ALL、EXISTS 和 NOT EXISTS等关键字
    还可以包含比较运算符：= 、 !=、> 、<等

    EXISTS关字键字表示存在。在使用EXISTS关键字时，内层查询语句不返回查询的记录。
    而是返回一个真假值。Ture或False
    当返回Ture时，外层查询语句将进行查询；当返回值为False时，外层查询语句不进行查询


索引
===
####使用原则：

    1、对经常更新的表就避免对其进行过多的索引，对经常用于查询的字段应该创建索引，
    2、数据量小的表最好不要使用索引，因为由于数据较少，可能查询全部数据花费的时间比遍历索引的时间还要短，索引就可能不会产生优化效果。
    3、在一同值少的列上(字段上)不要建立索引，比如在学生表的"性别"字段上只有男，女两个不同值。相反的，在一个字段上不同值较多可是建立索引。

####分类
注意：索引是在存储引擎中实现的，也就是说不同的存储引擎，会使用不同的索引
MyISAM和InnoDB存储引擎：只支持BTREE索引， 也就是说默认使用BTREE，不能够更换
MEMORY/HEAP存储引擎：支持HASH和BTREE索引

    索引我们分为四类来讲 单列索引(普通索引，唯一索引，主键索引)、组合索引、全文索引、空间索引

单列索引：一个索引只包含单个列，但一个表中可以有多个单列索引。 

    普通索引：MySQL中基本索引类型，没有什么限制，允许在定义索引的列中插入重复值和空值，纯粹为了查询数据更快一点。
    唯一索引: 索引列中的值必须是唯一的，但是允许为空值，
    主键索引：是一种特殊的唯一索引，不允许有空值。

组合索引: 在表中的多个字段组合上创建的索引，只有在查询条件中使用了这些字段的左边字段时，索引才会被使用，使用组合索引时遵循最左前缀集合。

全文索引: 全文索引，只有在MyISAM引擎上才能使用，只能在CHAR,VARCHAR,TEXT类型字段上使用全文索引

空间索引: 空间索引是对空间数据类型的字段建立的索引，MySQL中的空间数据类型有四种，GEOMETRY、POINT、LINESTRING、POLYGON。
在创建空间索引时，使用SPATIAL关键字。要求，引擎为MyISAM，创建空间索引的列，必须将其声明为NOT NULL。


####创建

    CREATE TABLE 表名[字段名 数据类型]  [UNIQUE|FULLTEXT|SPATIAL|...] [INDEX|KEY] [索引名字] (字段名[length])　[ASC|DESC]

####添加

    ALTER TABLE 表名 ADD[UNIQUE|FULLTEXT|SPATIAL] [INDEX|KEY] [索引名] (索引字段名)[ASC|DESC]
    CREATE [UNIQUE|FULLTEXT|SPATIAL] [INDEX|KEY] 索引名称 ON 表名(创建索引的字段名[length])[ASC|DESC]

####删除

    ALTER TABLE 表名 DROP INDEX 索引名
    DROP INDEX 索引名 ON 表名；



系统数据库
===

information_schema： 虚拟库，不占用磁盘空间，存储的是数据库启动后的一些参数，如用户表信息、列信息、权限信息、字符信息等
performance_schema： 主要用于收集数据库服务器性能参数，记录处理查询请求时发生的各种事件、锁等现象 
mysql： 授权库，主要存储系统用户的权限信息
test： MySQL数据库系统自动创建的测试数据库

输入中文报错，设置/etc/my.cnf

    [client]
    default-character-set=utf8
    
    [mysql]
    default-character-set=utf8
    
    [mysqld]
    init_connect='SET collation_connection = utf8_unicode_ci'
    init_connect='SET NAMES utf8'
    character-set-server=utf8
    collation-server=utf8_unicode_ci
    skip-character-set-client-handshake


pymysql
=====

    pymysql.Connect()参数说明
    host(str):      MySQL服务器地址
    port(int):      MySQL服务器端口号
    user(str):      用户名
    passwd(str):    密码
    db(str):        数据库名称
    charset(str):   连接编码
    
    connection对象支持的方法
    cursor()        使用该连接创建并返回游标
    commit()        提交当前事务
    rollback()      回滚当前事务
    close()         关闭连接
    
    cursor对象支持的方法
    execute(op)     执行一个数据库的命令
    fetchone()      取得结果集的下一行
    fetchmany(size) 获取结果集的下几行
    fetchall()      获取结果集中的所有行
    rowcount()      返回数据条数或影响行数
    close()         关闭游标对象


```
import pymysql

# 本机连接到远程CentOS
conn = pymysql.Connect(
        host='10.211.55.4',
        port=3306,
        user='root',
        passwd='mysql',
        db='demo')

cursor = conn.cursor()

# 更改获取数据结果的数据类型,默认是元组,可以改为字典等:
# conn.cursor(cursor=pymysql.cursors.DictCursor)

# sql1 = "insert t1 values (5, 'Jack', 'male', 'XX', 200);"
# sql2 = 'create table d2 (id int, name varchar(30));'
# sql3 = 'delete from t1 where id=5;'
sql4 = 'select * from t1 order by id;'

cursor.execute(sql4)
print(cursor.fetchone())
print('-'*10)
print(cursor.fetchone())
print('-'*10)
cursor.scroll(-1, mode='relative')  # 相对当前位置移动
print(cursor.fetchone())
print('-'*10)
cursor.scroll(2, mode='absolute')  # 相对绝对位置移动
print(cursor.fetchone())
print('-'*10)
print(cursor.fetchall())


conn.commit()
cursor.close()
conn.close()

```

ERROR 1305(42000) SAVEPOINT *** DOES NOT EXIST
===
autocommit模式：在开启情况下，对于每条statement来说，都会自动形成一个commit，也就是会即时对开始和结束一个事务。所以，当出现rollback to savepoint出现这个错误时，第一步是检查autocommit模式是否有开启。

    select @@autocommit;

1则代表开启，0则代表未开启。
如果需要关闭，则输入以下代码

    set autocommit = 0 ;



```
import pymysql

# 本机连接到远程CentOS
conn = pymysql.Connect(
        host='10.211.55.4',
        port=3306,
        user='root',
        passwd='mysql',
        db='demo')

cursor = conn.cursor()

sql_ct = 'create table account (id int, name varchar(20),balance float);'
sql_in = 'insert account values (1, "Jack", 100), (2, "Rose", 100);'

cursor.execute(sql_ct)
cursor.execute(sql_in)
conn.commit()

sql_1 = 'update account set balance=balance-50 where id=1;'
sql_2 = 'update account set balance=balance+50 where id=1;'

try:
    cursor.execute(sql_1)
    raise Exception
    cursor.execute(sql_2)
except Exception as e:
    conn.rollback()
    print(e)
else:
    conn.commit()

sql_q = 'select * from account'
cursor.execute(sql_q)
print(cursor.fetchall())
conn.commit()

cursor.close()
conn.close()

```

隔离性
===

将数据库设计为串行化程的数据库，让一张表在同一时间内只能有一个线程来操作。如果将数据库设计为这样，那数据库的效率太低了。所以数据库的设计这没有直接将数据库设计为串行化，而是为数据库提供多个隔离级别选项

脏读：一个事务读取到了另一个事务未提交的数据,这是特别危险的，要尽力防止。
不可重复读: 在一个事务内读取表中的某一行数据，多次读取结果不同。（一个事务读取到了另一个事务已经提交的数据--增加记录、删除记录、修改记录）
幻读:是指在一个事务内读取到了别的事务插入的数据，导致前后读取不一致。（一个事务读取到了另一个事务已经提交的数据---增加记录、删除记录）

四个隔离级别：

    Serializable：可避免脏读、不可重复读、虚读情况的发生。（串行化）
    Repeatable read：可避免脏读、不可重复读情况的发生。（可重复读）不可以避免虚读
    Read committed：可避免脏读情况发生（读已提交）
    Read uncommitted：最低级别，以上情况均无法保证。(读未提交)

    隔离级别 	脏读（Dirty Read） 	不可重复读（NonRepeatable Read） 	幻读（Phantom Read）
    未提交读（Read uncommitted） 	可能 	可能 	可能
    已提交读（Read committed） 	不可能 	可能 	可能
    可重复读（Repeatable read） 	不可能 	不可能 	可能
    可串行化（Serializable ） 	不可能 	不可能 	不可能

    安全性考虑：Serializable>Repeatable read>Read committed>Read uncommitted
    数据库效率：Read uncommitted>Read committed>Repeatable read>Serializable

幻读是指当事务不是独立执行时发生的一种现象，例如第一个事务对一个表中的数据进行了修改，比如这种修改涉及到表中的“全部数据行”。同时，第二个事务也 修改这个表中的数据，这种修改是向表中插入“一行新数据”。那么，以后就会发生操作第一个事务的用户发现表中还有没有修改的数据行，就好象发生了幻觉一 样.一般解决幻读的方法是增加范围锁RangeS，锁定检锁范围为只读，这样就避免了幻读。简单来说，幻读是由插入或者删除引起的。 

一般情况下，我们会使用Repeatable read、Read committed mysql数据库默认的数据库隔离级别Repeatable read

mysql中设置数据库的隔离级别语句：

    select @@tx_isolation;  #查看隔离级别
    set [global/session] transaction isolation level xxxx;

如果使用global则修改的是数据库的默认隔离级别，所有新开的窗口的隔离级别继承自这个默认隔离级别如果使用session修改，则修改的是当前客户端的隔离级别，和数据库默认隔离级别无关。当前的客户端是什么隔离级别，就能防止什么隔离级别问题，和其他客户端是什么隔离级别无关。

存储过程
===
程序与数据库结合使用的三种方式

    方式一：
    MySQL：存储过程
    程序：调用存储过程

    方式二：
    MySQL：
    程序：纯SQL语句

    方式三：
    MySQL:
    程序：类和对象，即ORM（本质还是纯SQL语句）
