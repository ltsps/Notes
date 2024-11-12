docker run --name postgres -e POSTGRES_PASSWORD=xxx -pxx:xx -v xx:xx -d postgres

psql -Upostgres    登录数据库
\l 查看数据库
\c $database 连接数据库，相当于mysql use $database
\dt 查看表
