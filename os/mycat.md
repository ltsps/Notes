### Mycat install
mkdir /opt/mycat/logs
/opt/mycat/logs/mycat.pid  
#wrapper.java.additional.3=-XX:+AggressiveOpts
wrapper.java.additional.3=--add-opens=java.base/sun.nio.ch=ALL-UNNAMED
##wrapper.java.additional.1=-XX:+UnlockExperimentalVMOptions
mysql console

### Mysql client install
apt install default-mysql-client

### manage mycat
mysql -h127.0.0.1 -P9066 -uroot -p123456 [-dTESTDB]
show @@help

