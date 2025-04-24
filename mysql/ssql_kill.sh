#!/bin/bash

# Project : monitor
# File :    db_kill_session.sh
# Time :    
# Author :  
# Email :   
# purpose :

db_user="xxx"
db_passwd="xxxx"
db_host="xxx"
db_port=3306
db_name=""
# 建议5s以上，可以根据实际情况调整
limit_time=5

echo "正在查询慢SQL的会话..."

mysql -h$db_host -u$db_user -p$db_passwd -e "select id,info from information_schema.processlist where info is not null and COMMAND='Query' and TIME > $limit_time;"
read -p "是否要执行批量kill(y)?" is_continue
case $is_continue in
  n|N)
  exit 0
  ;;
esac
# 连续杀5次（防止有些重试）
for i in {1..5}
do
  # 只对查询语句进行操作
  r=$(mysql -h$db_host -u$db_user -p$db_passwd -e "select id from information_schema.processlist where info is not null and COMMAND='Query' and TIME > $limit_time;")
  let k_num=k_num+`echo $r |tr ' ' '\n' |grep -v id |wc -l`
  # 等待1秒
  sleep 1
  for i in $r
  do
    if [ "$i" != "id" ]; then
        mysql -h$db_host -u$db_user -p$db_passwd -e "kill ${i};"
    fi
  done
done
echo "已完成$k_num条慢SQL查杀"
