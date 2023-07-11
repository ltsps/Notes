#### 1.Setting your Git username for every repository on your computer
git config --global user.name 'xx'   ## ~/.gitconfig
git config --system   ## /etc/gitconfig
git config --local    ## .git/config
git config --worktree ## .git/config.worktree

#### 2. Setting your commit email address in Git
git config --worktree user.email 'xx@mail.com'

#### 3. Creating remote repositories
git remote add $remote_registry_name https://gitee.com/XXX/XXX.git ## add remote responsy

#### 4. add ssh pubkey to setting' ssh and gpg keys

#### 5. git clone git@github.com:xx/xx.git

#### 6. push file to git
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
