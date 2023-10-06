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
