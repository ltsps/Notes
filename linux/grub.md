# window hyper 设置屏幕分辨率
vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"  #原配置
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=hyperv_fb:1920x1080" #修改后配置
