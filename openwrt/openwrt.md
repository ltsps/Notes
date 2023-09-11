#docker
#download address https://downloads.openwrt.org/releases/22.03.5/targets/x86/generic/
docker import openwrt-22.03.5-x86-generic-rootfs.tar.gz openwrt-22.03.5-x86-generic-rootfs  ##import images

docker run -i -t -d openwrt-x86-generic-rootfs /sbin/init
docker exec -it  openwrt /bin/ash

opkg install lighttpd  ## uhttpd

