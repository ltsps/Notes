### 指定行前添加内容
sed -i '2i hello2' test.txt  
### 指定行后添加内容
sed -i '2a hello2' test.txt
### 指定行替换内容
sed -i 2/hello/#hello/g test.txt
