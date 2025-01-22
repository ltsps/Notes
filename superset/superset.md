

docker run -d -it --name superset -p 8089:8088 --network minikube apache/superset


openssl rand -base64 42
export SUPERSET_SECRET_KEY='v9N3yX7a1tK+3VeyUP0haOvFgpZlYUsDqD1ye67SrLSH+stVzdJg1LdF'
echo "SECRET_KEY = 'v9N3yX7a1tK+3VeyUP0haOvFgpZlYUsDqD1ye67SrLSH+stVzdJg1LdF'" > superset_config.py

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
