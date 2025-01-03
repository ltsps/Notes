

docker run -d -it --name superset -p 8089:8088 --network minikube apache/superset

openssl rand -base64 42
echo "SECRET_KEY = 'EY16MU0mTw1HYfkIOne9XDyynuY7gn8Dsgm9cI5MxFkQLzMU21mP0Y1J'" > superset_config.py

pip install pillow

flask fab create-admin
