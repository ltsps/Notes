# replace 
## 当前行
:/s/foo/bar/g
## 全文
:%s/foo/bar/g
## 指定行
:5,12s/foo/bar/g
## 当前行.与接下来两行+2
:.,+2s/foo/bar/g

# 模式切换
字符可视化模式 v
行可视化模式 V（大v）
块可视化模式 ctrl+Q

# 批量插入
进行块可视化模式（ctrl+Q）
批量选择要编辑的行，再按I，输出内容，再按esc，即可
