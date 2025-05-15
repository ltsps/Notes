## U8c 5.1 linux 部署

a)	工具包u8c_install下载地址：wget http://auto-resources.yyu8c.com:8098/U8C_INSTALL.sh


修改安装包中安装脚本，添加java启动参数-Dfile.encoding=gb18030
${JAVA_HOME}/bin/java -classpath ${_CLASSPATH} -Dinstall.batchfile.copyall=false -Dfile.encoding=gb18030  nc.newinstall.QuietInstall


## sqlserver数据库创建
```sql
CREATE DATABASE U8Cloud; 
ALTER DATABASE U8Cloud ADD FILEGROUP [NNC_DATA01];
ALTER DATABASE U8Cloud ADD FILE(NAME = nnc_data01 , FILENAME = "/data/mssql/U8Cloud_nnc_data01_Data.NDF", SIZE = 100, FILEGROWTH = 200) TO FILEGROUP [NNC_DATA01];
ALTER DATABASE U8Cloud ADD FILEGROUP [NNC_DATA02];
ALTER DATABASE U8Cloud ADD FILE(NAME = nnc_data02 , FILENAME = "/data/mssql/U8Cloud_nnc_data02_Data.NDF", SIZE = 100, FILEGROWTH = 200) TO FILEGROUP [NNC_DATA02];
ALTER DATABASE U8Cloud ADD FILEGROUP [NNC_DATA03];
ALTER DATABASE U8Cloud ADD FILE(NAME = nnc_data03 , FILENAME = "/data/mssql/U8Cloud_nnc_data03_Data.NDF", SIZE = 100, FILEGROWTH = 200) TO FILEGROUP [NNC_DATA03];
ALTER DATABASE U8Cloud ADD FILEGROUP [NNC_INDEX01];
ALTER DATABASE U8Cloud ADD FILE(NAME = nnc_index01 , FILENAME = "/data/mssql/U8Cloud_nnc_index01_Data.NDF", SIZE = 100, FILEGROWTH = 200) TO FILEGROUP [NNC_INDEX01];
ALTER DATABASE U8Cloud ADD FILEGROUP [NNC_INDEX02];
ALTER DATABASE U8Cloud ADD FILE(NAME = nnc_index02 , FILENAME = "/data/mssql/U8Cloud_nnc_index02_Data.NDF", SIZE = 100, FILEGROWTH = 200) TO FILEGROUP [NNC_INDEX02];
ALTER DATABASE U8Cloud ADD FILEGROUP [NNC_INDEX03];
ALTER DATABASE U8Cloud ADD FILE(NAME = nnc_index03 , FILENAME = "/data/mssql/U8Cloud_nnc_index03_Data.NDF", SIZE = 100, FILEGROWTH = 200) TO FILEGROUP [NNC_INDEX03];

use U8Cloud;
ALTER DATABASE U8Cloud set read_committed_snapshot ON;
sp_configure 'show advanced options',1;
reconfigure WITH override;
sp_configure 'max degree of parallelism',1;
reconfigure WITH override;
```

连接数据库
./sqlcmd -H xxx -Usa -W  -C
