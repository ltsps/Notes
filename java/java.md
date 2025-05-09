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

## 使用其它工具进行管理
unzip -q $JAR_FILE -d $TEMP_DIR
zip -qr ../new-$JAR_FILE .

## 签名
### 创建密钥库
```
keytool -genkeypair -alias myapp -keyalg RSA -keysize 2048 -keystore appstore.jks -validity 730
```
### 签名jar
```
jarsigner -verbose -keystore appstore.jks -signedjar myapp-signed.jar myapp-unsigned.jar myapp
```
### 验证签名
```
jarsigner -verify -verbose myapp-signed.jar
```
