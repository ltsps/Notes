docker run --name postgres -e POSTGRES_PASSWORD=xxx -pxx:xx -v xx:xx -d postgres

```
docker run -d --name postgres -e POSTGRES_PASSWORD=mysecretpassword -e PGDATA=/var/lib/postgresql/data/pgdata -v /custom/mount:/var/lib/postgresql/data -p 5432:5432	postgres
```

psql -Upostgres    登录数据库
\l 查看数据库
\c $database 连接数据库，相当于mysql use $database
\dt 查看表

## 创建用户名
```
create user $username with password '1234';
create database db_a with owner $username;
grant all privileges on database mydb to myuser;
回收权限
revoke create on schema public from public;
检查权限
\dn

```
