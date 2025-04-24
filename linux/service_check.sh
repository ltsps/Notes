#!/bin/sh
#auth:
#createtime:
#updatetime:

StartTomcat=/mnt/tomcat/bin/startup.sh
TomcatCache=/mnt/tomcat/work/Catalina/localhost
# 定义要监控的页面地址
WebUrl="http://127.0.0.1:8080/jsearchfront/"
# 日志输出
TomcatMonitorLog=/tmp/tomcatMonitor.log
#export JAVA_HOME=/usr/local/java/
#export JRE_HOME=/usr/local/jdk/jre/
source /etc/profile
tomcat_path='/mnt/tomcat/conf' #tomcat 完整路径

#获取 tomcat_path 所知tomcat 的进程ID
TomcatID=$(ps -ef |grep java |grep -w $tomcat_path|grep -v 'grep'|awk '{print $2}')
Monitor()
{
  echo -n "[info]开始监控tomcat...[$(date +'%F %H:%M:%S')]|"
  if [[ $TomcatID ]];then
    echo -n "[info]当前tomcat进程ID为:$TomcatID,继续检测页面...|"
    # 检测是否启动成功(成功的话页面会返回状态"200")
    TomcatServiceCode=$(curl -I -m 10 -o /dev/null -s -w %{http_code}"\n" $WebUrl )
    if [ $TomcatServiceCode -eq 200 ];then
        echo "[info]页面返回码为$TomcatServiceCode,tomcat启动成功,测试页面正常......"
    else
        echo -n "[error]tomcat页面出错,请注意......状态码为$TomcatServiceCode,错误日志已输出到$GetPageInfo|"
        echo -n "[error]页面访问出错,开始重启tomcat|"
        kill -9 $TomcatID  # 杀掉原tomcat进程
        sleep 3
        rm -rf $TomcatCache # 清理tomcat缓存
        /usr/bin/bash $StartTomcat
        echo "[info] tomcat重启成功"
    fi
  else
    echo -n "[error]tomcat进程不存在!tomcat开始自动重启...|"
    echo "[info]$StartTomcat,请稍候......"
#  su - tomcat -c  "/bin/bash $StartTomcat"
    /usr/bin/bash $StartTomcat
  fi
#  echo "------------------------------"
}

Monitor>>$TomcatMonitorLog
