无线胖AP设备10.X到11.X软件升级

一、升级注意事项：

    1）、从10.x到11.x升级，配置会丢失，所以一定要提前备份配置

    2）、必须准备配置线，因为升级到11.x的中间版本之后，配置是丢失的，中间版本也没有默认的IP地址，所以只能通过配置线登陆配置（实际升级过程中发现，中间版本也是有默认IP地址的，192.168.110.1，但是毕竟升级是有风险的，所以还是要准备配置线）

    3）、在升级之前需要确认AP的版本是否为10.4(1b19)p2及之后的版本，因为之前的版本认为AP的软件版本不会超过12M，故需要先升级AP的版本到RGOS 10.X的新版本解决软件版本限制的问题

    4、升级11.x中间版本------升级11.x目标版本

    5、如果升级到中间版本后，串口底层无输出，请尝试修改波特率为115200或者9600

二、升级步骤

1、备份配置文件

Ruijie#copy flash:config.text tftp://192.168.1.100/config.text --->备份设备配置

2、升级11.x的中间版本

Ruijie#copy tftp://192.168.1.100/AP_RGOS11.1(2)B1_AP320_v1.0_upgrade.bin flash:rgos.bin

Ruijie#reload --->重启设备完成升级

3、检查是否升级成功

Ruijie>enable

Ruijie#show version detail

System description      : Ruijie Indoor AP320-I (802.11a/n and 802.11b/g/n) By Ruijie Networks.

System start time       : 1969-12-31 23:59:59

System uptime: 0:00:01:46

System hardware version : 1.10

System software version : AP_RGOS 11.1(2)B1 --->11.X中间版本

System patch number     : NA

System software number  : M17510709162014

System serial number    : G1GDC13025434

System boot version     : 1.1.6.faecb93(140920)

System core version     : 2.6.32.5a76500ea29c2a

4、因升级到11.x中间版本，配置会丢失，需要重新配置管理IP地址或者导入之前的配置，保证和电脑的连通性，配置参考

Telnet方式登陆 章节

5、升级11.x的目标版本

Ruijie#upgrade download tftp://192.168.1.100/AP_RGOS11.1(2)B1_AP320_01240204_install.bin

Upgrade the device must be auto-reset after finish, are you sure upgrading now?[Y/n]y

6、重启成功后检查是否升级成功

Ruijie#show version detail

System description      : Ruijie Indoor AP320-I (802.11a/n and 802.11b/g/n) By Ruijie Networks.

System start time       : 1969-12-31 23:59:59

System uptime: 0:00:01:37

System hardware version : 1.10

System software version : AP_RGOS 11.1(2)B1

System patch number     : NA

System software number  : M04064812022014  --->后8位表示2014年12月02日，详细参数参见下文

System serial number    : G1GDC13025434

System boot version     : 1.1.6.faecb93(140920)

System core version     : 2.6.32.9ef8668ea29c2a

7、恢复AP配置

Ruijie#copy tftp://192.168.1.100/config.text flash:config.text

Ruijie#copy star run  ------>重启加载配置

注意：由于11.X的部分配置命令与10.X存在差异，因此建议show run检查一下当前配置是否和原来的配置一样

注：11.xAP/AC版本号说明

AP_RGOS11.1(2)B1_AP320_01240204_install.bin

01231004

01 表示年：2013+1==2014

24 表示月：24-12==12

02 表示日：2号

04 表示时：4点

通过show version detail 可查看具体的版本编译时间

Software number: M04064812022014

1202—表示月、日：12月2号

2014—表示年份：2014年

040648----表示4点06分48秒
