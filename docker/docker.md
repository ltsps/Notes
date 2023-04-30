### 修改docker0网桥的默认IP
#### 修改配置文件
#vim /etc/docker/daemon.json
{
	"bip":"192.168.200.1/24",
	"mtu":"1400
}

#systemctl stop docker
#ip link set dev docker0 down
#brctl delbr docker0
#systemctl start docker


dockerd add proxy
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo touch /etc/systemd/system/docker.service.d/proxy.conf

[Service]
Environment="HTTP_PROXY=http://proxy.example.com:8080/"
Environment="HTTPS_PROXY=socks5://proxy.example.com:8080/"
Environment="NO_PROXY=localhost,127.0.0.1,.example.com"
###ps:https://note.qidong.name/2020/05/docker-proxy/
