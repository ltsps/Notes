### 安装
ubuntu安装
apt install qemu-system-x86_64
或是全量安装 apt install qemu-system



qemu-system-x86_64  -drive format=raw,file=openwrt.img -nographic
退出 ctrl+a，x
-drive format=raw,file=openwrt.img,if=virtio    参数中的virtio表示使用Linux下的虚拟化IO框架VirtIO
