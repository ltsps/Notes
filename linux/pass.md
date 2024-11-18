# 生成gpg密钥对
gpg --gen-key    

# 使用email-id或gpg-id初始化本地密码存储
pass init xxx@xx.com

# 还可以将密码存储初始化成git存储库
pass git init

# 添加仓库地址
pass git remote add <名称> <地址>

# 推送至仓库
pass git push -u --all

# 添加密码
pass insert tet@test

# 生成密码
pass generate test/test

