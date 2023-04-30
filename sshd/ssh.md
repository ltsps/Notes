$scp config.yaml ax6:/etc/test/config.yaml
ash: /usr/libexec/sftp-server: 

使用“-O”参数使用得scp的变回传scp方式
$scp -O config.yaml ax6:/etc/test/config.yaml


Host 10.71.15.*
  HostName %h
  ProxyCommand ssh bastion_GOP_SG_NC_MAIN -W %h:%p

Host bastion_GOP_SG_NC_MAIN
  HostName 8.8.8.8
  port 22
  User wangao

ssh -yfNR *:9080:3.lysps.top:9080 root@192.168.1.2 -p 2222
