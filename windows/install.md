# win11安装
## tpm检测
有效的方法是在安装过程中（检测前）按shift+F10打开cmd界面，修改注册表
```
reg add HKLM\System\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
reg add HKLM\System\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1
```
执行上述命令后，再进行检测，就可以通过
## 磁盘检测，如果是MBR，需要转成GPT分区
```
检查磁盘 mbr2gpt /validate
开始转换 mbr2gpt /convert
```
待测
在安装过程中按shift+f10执行如下命令进行转换
```
diskpart
list disk
select disk X
clean    #清除磁盘，是否无损待验证
convert gpt
```
## 苹果电脑安装
进入u盘启动
启动过程中按住options,在bootcamp界面，选择u盘启动


# 激活
```
irm https://get.activated.win | iex
```
You will see the activation options. Choose (1) HWID for Windows activation. Choose (2) Ohook for Office activation.
