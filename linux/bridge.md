在 /etc/network/interface.d

## 获取静态 IP 配置 ##
auto br0
iface br0 inet static
address 192.168.1.10
broadcast 192.168.1.255
netmask 255.255.255.0
gateway 192.168.2.254

# 如果你有多个接口，例如 eth0 和 eth1
# bridge_ports eth0 eth1
bridge_ports enp3s0

# 禁用生成树协议
bridge_stp off

# 端口可用之前没有延迟
bridge_waitport 0

# 无转发延迟
bridge_fd 0

## br0是网桥的名字，按需修改，enp3s0 是物理网卡的名字，也不要照抄



## DHCP 自动获取获取IP ##
auto br0

# 网桥设置
iface br0 inet dhcp
bridge_ports enp3s0
