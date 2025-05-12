## U8c 5.1 linux 部署

a)	工具包u8c_install下载地址：wget http://auto-resources.yyu8c.com:8098/U8C_INSTALL.sh


修改安装包中安装脚本，添加java启动参数-Dfile.encoding=gb18030
${JAVA_HOME}/bin/java -classpath ${_CLASSPATH} -Dinstall.batchfile.copyall=false -Dfile.encoding=gb18030  nc.newinstall.QuietInstall
