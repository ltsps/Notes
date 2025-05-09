## OutOfMemoryError处置策略
### linux
-XX:+HeapDumpOnOutOfMemoryError -XX:OnOutOfMemoryError='kill -9 %p'
### windows
"-XX:+HeapDumpOnOutOfMemoryError" "-XX:OnOutOfMemoryError=cmd /c taskkill /pid %%%%p /t /f"

## jar包管理
### 1、解压jar包
jar xf xx.jar

### 2、更新jar包中文件
jar uf xxx.jar  file_name  # filename 不可带路径
### 3、重新打包整个目录
jar cvfm xx.jar  META-INF/MANIFEST.MF .

