#docker
#download address https://downloads.openwrt.org/releases/22.03.5/targets/x86/generic/
docker import openwrt-22.03.5-x86-generic-rootfs.tar.gz openwrt-22.03.5-x86-generic-rootfs  ##import images

docker run -i -t -d openwrt-x86-generic-rootfs /sbin/init
docker exec -it  openwrt /bin/ash

opkg install lighttpd  ## uhttpd


单口配置
docker network create -d macvlan -o parent=enp1s0 mvnet
docker run -d -i --network mvnet --name openwrt --restart always --privileged openwrt-22.03.5-x86-64-rootfs /sbin/init

# x86添加switch
安装 opkg install swconfig
vi /etc/config/network
config switch
        option name 'switch0'
        option reset '1'
        option enable '1'
完成添加后，reboot

