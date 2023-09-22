# 安装图形界面
apt install xfce4

apt install xrdp  #安装远程工作

dpkg-reconfigure locales  # 添加语言
将zh_CN 语言选中

apt install fonts-wqy-zenhei #安装中文字体，（只安装语言没有字体，显示会乱码）

#安装chrome browser
apt install -y /tmp/google-chrome-stable_current_amd64.deb
apt --fix-broken install
