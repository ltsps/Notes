

docker run -d -it --name superset -p 8089:8088 --network minikube apache/superset


openssl rand -base64 42
export SUPERSET_SECRET_KEY='v9N3yX7a1tK+3VeyUP0haOvFgpZlYUsDqD1ye67SrLSH+stVzdJg1LdF'
echo "SECRET_KEY = 'EY16MU0mTw1HYfkIOne9XDyynuY7gn8Dsgm9cI5MxFkQLzMU21mP0Y1J'" > superset_config.py

pip install pillow

### 数据库更新
superset db upgrade 

### 创建管理员用户
superset fab create-admin



export SUPERSET_CONFIG=superset_config;

flask fab create-admin
