数据库要开启大小写不敏感
修改不区分大小写,在my.cnf中的[mysqld]后面添加lower_case_table_names=1，重启MYSQL服务
show variables like '%case%';
CREATE DATABASE IF NOT EXISTS yourdbname DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

###jdk 1.8
nohup java -Duser.timezone=Asia/Shanghai -jar chaosblade-box-1.0.3.jar --spring.datasource.url="jdbc:mysql://XXXX:3306/chaosblade?characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai" --spring.datasource.username=XXXX --spring.datasource.password=XXXX --chaos.server.domain=XXXX:7001 --chaos.function.sync.type=ALL  --chaos.prometheus.api=http://127.0.0.1:9090/api/v1/query_range > chaosblade-box.log 2>&1 &

###jdk 17 but failed
nohup java --add-opens java.base/java.lang=ALL-UNNAMED -Duser.timezone=Asia/Shanghai -jar chaosblade-box-1.0.3.jar --spring.datasource.url="jdbc:mysql://XXXX:3306/chaosblade?characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai" --spring.datasource.username=XXXX --spring.datasource.password=XXXX --chaos.server.domain=XXXX:7001 --chaos.function.sync.type=ALL  --chaos.prometheus.api=http://127.0.0.1:9090/api/v1/query_range > chaosblade-box.log 2>&1 &


可能会因字符问题存在场景导入乱码，需要重新写入表t_chaos_scene_function_category
具体sql可以在源码中搜索该表

java 版本需要使用jre8测试没有问题，也可以编译


客户端安装
sh /opt/chaos/chaosctl.sh install -k c3c54a0c8f67420f84455ef98162c7c2 -p tomcat -g docker -n docker -t chaos:7001
-t chaos endpoint
-n namespace
-k license
-p applicationInstance
-G applicationgroup
