show index from table_name;或show keys from tb_name;
解释：显示表的索引
增加索引
alter table $tabel_name add index $index_name ($col_name)

desc table_name== show columns from db.tb

show privileges;
解释：显示服务器所支持的不同权限

show grants for user_name@localhost;   涉及mysql三张表 user，db，tables_priv
解释：显示一个用户的权限，显示结果类似于grant 命令

show engies;
解释：显示安装以后可用的存储引擎和默认引擎。

show engine innodb status\G
解释：显示innoDB存储引擎的状态

修改表名
rename table $old_name to $new_name
alter table $old_name rename [as] $new_name

# 数据库空间分析
select TABLE_NAME as 表名 ,TABLE_SCHEMA as 数据库名, ENGINE as 存储引擎 ,TABLE_ROWS as 表行数 ,truncate((DATA_LENGTH+INDEX_LENGTH)/1024/1024,2) as 表空间 ,DATA_LENGTH as 数据空间,INDEX_LENGTH as 索引空间, DATA_FREE as 空间碎片大小,DATA_FREE/DATA_LENGTH as 空间碎片率,AVG_ROW_LENGTH as 平均行长 from information_schema.tables order by 表空间

# docker run
docker run -d --net mynet --name mysql -v /opt/mysql/conf.d:/etc/mysql/conf.d  -v /opt/mysql/datadir:/var/lib/mysql --env MARIADB_USER=example-user --env MARIADB_PASSWORD=my_cool_secret --env MARIADB_ROOT_PASSWORD=my-secret-pw mariadb:latest 

# 导入数据
load data local infile 'order-manage-urgency.csv' into table order_manage_urgency fields terminated by ',' lines
terminated by '\r\n';


# 创建数库和用户及授权
create database test default character set utf8 collate utf8_general_ci;
create user 'user'@'%' identified by 'xxx';
grant all privileges on test.* to 'user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, FILE, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EVENT, GRANT OPTION, TRIGGER ON *.* TO 'user'@'%';

去除权限
REVOKE GRANT OPTION ON*.* FROM 'zhangtiancheng'@'%';
REVOKE SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER ON*.* FROM 'user'@'%';

使 expuser 账号密码立即过期
mysql> ALTER USER 'expuser'@'%' PASSWORD EXPIRE;
修改账号密码永不过期
mysql> ALTER USER 'expuser'@'%' PASSWORD EXPIRE NEVER;
单独设置该账号密码90天过期
mysql> ALTER USER 'expuser'@'%' PASSWORD EXPIRE INTERVAL 90 DAY;
查询密码过期情况
select user,host,password_expired,password_lifetime,password_last_changed,account_locked from mysql.user;
让此账号使用默认的密码过期全局策略
mysql> ALTER USER 'expuser'@'%' PASSWORD EXPIRE DEFAULT;

 # 修改数据库并发连接
 1、show variables like '%max_connections%';
 set global max_connections=1000;
 2、修改配置文件my.cnf中设置max_connections

 # mysql自带压测工具
 mariadb-slap -uroot -pgwycel --concurrency=999 --number-of-queries=10000000 --create-schema=testdb --query="insert into test_table (name) values (uuid())"

 # 强制】表必备三字段：id，create_time，update_time
  CREATE TABLE `tt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tt';
### 插入测试数据
insert into tt (name,create_time) values (@@hostname, now());

### 替代大表统计行数sql 不可分开查询
select SQL_CALC_FOUND_ROWS 1 from order_manage_test limit 1; #先执行，
select found_rows() as rowcount #获取上次查询的总行数
 
