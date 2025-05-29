```
mongosh --host 127.0.0.1 --port 27017
db.runCommand({hello:1})
show dbs

# 创建管理员用户
use admin
db.createUser({user: 'root', pwd: 'admin', roles: ['root']})
db.auth('root','admin')

use mydb
db.createUser({user: 'user', pwd: '123456', roles: [{role:'readWrite',db:'mydb'}]})
```
