免密登录设置
windows中特有的操作
更改authorized_keys文件权限，不更改则无法通过密钥登录
# 远程通过ACL更改文件权限
ssh --% user1@ip icacls.exe "C:\Users\username\.ssh\authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
#在服务器端修改authorized_keys文件权限
icacls.exe "C:\Users\username\.ssh\authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
在Windows OpenSSH中，默认的授权密钥存放位置为ProgramData\ssh\administrators_authorized_keys，此位置对应为管理用户权限。因此需要修改默认授权文件位置。通过文本编辑器（推荐vscode）打开ProgramData\ssh\sshd_config，修改以下条目
#允许公钥授权访问，确保条目不被注释
PubkeyAuthentication yes

#授权文件存放位置，确保条目不被注释
AuthorizedKeysFile	.ssh/authorized_keys

#可选，关闭密码登录，提高安全性
PasswordAuthentication no

#注释掉默认授权文件位置，确保以下条目被注释
#Match Group administrators
#       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys

在PowerShell(管理员)中重启sshd服务
#重启sshd，需要管理员权限
Restart-Service sshd
