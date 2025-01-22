

docker run -d -it --name superset -p 8089:8088 --network minikube apache/superset


openssl rand -base64 42
export SUPERSET_SECRET_KEY='v9N3yX7a1tK+3VeyUP0haOvFgpZlYUsDqD1ye67SrLSH+stVzdJg1LdF'
#echo "SECRET_KEY = 'v9N3yX7a1tK+3VeyUP0haOvFgpZlYUsDqD1ye67SrLSH+stVzdJg1LdF'" > superset_config.py

cp /app/superset/config.py /app/superset_config.py，删除1860行之后的内容，避免重复加载superset_config

添加 SECRET_KEY = 'v9N3yX7a1tK+3VeyUP0haOvFgpZlYUsDqD1ye67SrLSH+stVzdJg1LdF'"

pip install pillow

### 数据库更新
superset db upgrade 

### 创建管理员用户
superset fab create-admin



export SUPERSET_CONFIG=superset_config;

flask fab create-admin

# 更新key
#Open shell
superset shell
#Print Secret key
from flask import current_app; print(current_app.config["SECRET_KEY"]) # 查看现在的key

PREVIOUS_SECRET_KEY = ‘Paste the key you just found’
SECRET_KEY = ‘Add your new key’


superset db upgrade 
superset re-encrypt-secrets
superset init


Open superset_config.py and change SECRET_KEY
Open superset metadb through a client. Example for Postgres.
sudo -i -u postgres

Activate the metaDB.
\connect db_name;

Set password and encryption to null.
update dbs set password = null;

update dbs set encrypted_extra = null;

Navigate to superset prompt and run
superset db upgrade superset init superset run

Go to the superset UI and update password on Data > Databases
