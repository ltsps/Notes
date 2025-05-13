
## 容器化部署
```
docker run -d --name postgres -e POSTGRES_PASSWORD=mysecretpassword -e PGDATA=/var/lib/postgresql/data/pgdata -v /custom/mount:/var/lib/postgresql/data -p 5432:5432	postgres
psql -Upostgres    登录数据库
```
## 物理机部署
登录方法
sudo -u postgres psql -U postgres
ALTER USER postgres WITH PASSWORD 'new_password';
## 配置远程登录
```
vim pg_hba.conf
host    all             all             0.0.0.0/0                       scram-sha-256
```
## 数据库操作
```
\l 查看数据库
\c $database 连接数据库，相当于mysql use $database
\dt 查看表
```
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

