```
mongosh --host <hostname> --port <port> -u "testuser" -p "password123" --authenticationDatabase "<database_name>"
mongosh --host 127.0.0.1 --port 27017
db.runCommand({hello:1})
show dbs

# 创建管理员用户
use admin  #切换或创建数据库
db.createUser({user: 'root', pwd: 'admin', roles: ['root']})
db.auth('root','admin')

use mydb
db.createUser({user: 'user', pwd: '123456', roles: [{role:'readWrite',db:'mydb'}]})

db.changeUserPassword('user','xxxx')
db.dropUser("testuser")

查询
admin> show tables;
system.version
db.mycollection.find();    # select * from system.version;
db.myCollection.find({ age: { $gt: 25 } });
db.users.find({gender:"M"},{user_name:1,_id:0}).hint({gender:1,user_name:1}).explain() #查询分析

db.createCollection('collection_name')  # 创建集合（表）
db.adminCommand({
  renameCollection: "test.oldCollection",
  to: "production.newCollection"
});  #更改集合（表）名
db.dropDatabase()  # use db 删除db

db.myCollection.insertOne({ name: "Alice", age: 30 })
```

```
#mongod.conf
#启用身份验证
security:
  authorization: "enabled"
```
