### Mycat install
mkdir /opt/mycat/logs
/opt/mycat/logs/mycat.pid  
#wrapper.java.additional.3=-XX:+AggressiveOpts
wrapper.java.additional.3=--add-opens=java.base/sun.nio.ch=ALL-UNNAMED
##wrapper.java.additional.1=-XX:+UnlockExperimentalVMOptions
mysql console

### Mysql client install
apt install default-mysql-client

mysql -uroot -p127.0.0.1 -P 8066 -p
insert into tt (id, name, create_time) values (6 ,@@hostname, now());

### manage mycat
mysql -h127.0.0.1 -P9066 -uroot -p123456 [-dTESTDB]
show @@help


CREATE TABLE `tt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tt'


