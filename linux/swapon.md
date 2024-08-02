1、生成镜像文件
dd if=/dev/zero of=/opt/swapfile bs=1024 count=2000000
2、格式化
mkswap /opt/swapfile
3、开启swap
swapon /opt/swapfile

4、查看swap状态
swapon --show
