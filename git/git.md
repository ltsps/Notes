#### 1. add ssh pubkey to setting' ssh and gpg keys

#### 2. git clone git@github.com:xx/xx.git

#### 3. push file to git





#### Setting your Git username for every repository on your computer
git config --global user.name 'xx'   ## ~/.gitconfig
git config --system   ## /etc/gitconfig
git config --local    ## .git/config
git config --worktree ## .git/config.worktree

#### Setting your commit email address in Git
git config --worktree user.email 'xx@mail.com'

#### Creating remote repositories
git remote add $remote_registry_name https://gitee.com/XXX/XXX.git ## add remote responsy

#### add ssh pubkey to setting' ssh and gpg keys

#### git clone git@github.com:xx/xx.git

####  push file to git
git push $remote_registry_name $branch
git push $remote_registry_name -d yyy ## delete remote branch




git branch -d xxx      ## delete local branch
git remote rm $remote_registry_name   ## delete remote responcity
git branch -r          ## list remote branch
git branch -a          ## list all branch
git branch -m master main  ## change branch name
git branch update      ## update remote branch
git push notes master

#### Inviting collaborators to a personal repository 
1. click  Settings in your repository,
2. In the "Access" section of the sidebar, click  Collaborators.
3. Click Add people.

## git push error
git fetch origin/main #抓取远端主分支
git log -p main origin/main #对比本地分支
git merge origin/main # 确认无误后合并

## 解决中文显示乱码问题
git config --global core.quotepath false
