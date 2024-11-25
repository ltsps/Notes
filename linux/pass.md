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

# gpg迁移
gpg --list-keys [uid]
gpg --export-secret-keys [uid] > private.key
gpg --import private.key

# 查看主key和子key
#gpg --list-secret-keys --verbose --with-subkey-fingerprints
sec   rsa3072 2022-06-14 [SC] [expires: 2027-11-25]
      527E59695F44B300xxxD0EBD6D7191F
uid           [ultimate] xxx <xxx@xxx.com>
ssb   rsa3072 2022-06-14 [E] [expired: 2024-06-13]
      A0401E4526AAFxxxxDC8357E78FB9CD6E0FE9D
# 变更主key和子key过期时间
用法: gpg [选项] --quick-set-exipre 指纹 过期时间 [子密钥指纹]
gpg --quick-set-expire 527E59695F44B300xxxD0EBD6D7191F 3y A0401E4526AAFxxxxDC8357E78FB9CD6E0FE9D
如果不同步，会报"via Local: Unusable public key"错误
