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

autossh -M 11030 -yNR  *:11040:localhost:22 root@3.lysps.top -p 3232   #*：11040 remoteip：remoteport   localhost:22 本地地址及端口   remotesshinfo

ssh -NfCD 127.0.0.1:10088 u0_a398@3.lysps.top -p 9222   
ssh -NfCL 127.0.0.1:10086:100.64.64.132:50434 u0_a398@3.lysps.top -p 9222

ssh -o TCPKeepAlive=yes -o ServerAliveInterval=10 -o StrictHostKeyChecking=no -o Compression=yes -NfCD 10.137.69.199:1088 xxx.xx.xxx.xx -p 3954

GatewayPorts yes  需要0.0.0.0端口，需要打开sshd_config文件的配置
