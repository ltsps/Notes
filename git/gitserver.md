# 创建用户
adduser git

mkdir test.git
cd test.git
初始化git
git init --bare


客户端 git remote add origin git@127.0.0.1:/home/git/test.git

从仓库中把文件备份出来
git archive -o test.tar.gz HEAD
