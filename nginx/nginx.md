## 添加用户名和密码
yum install -y httpd-tools
htpasswd -c /etc/nginx/passwd xxx
## 修改配置文件
server {
    listen 80;
    server_name  localhost;
    .......
    #新增下面两行
    auth_basic "Please input password"; #这里是验证时的提示信息
    auth_basic_user_file /usr/local/src/nginx/passwd;

    #添加证书
    listen 8443 ssl default_server;
    listen [::]:8443 ssl default_server;
    server_name report.lssps.art;
    ssl_certificate /etc/nginx/report.lssps.art.pem;
    ssl_certificate_key /etc/nginx/report.lssps.art.key;
    
    location /{
    .......
}
