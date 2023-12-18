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



添加request_id
1、这种方法前端不会显示
修改在nginx.conf同一路径下的fastcgi_params文件，添加如下内容
fastcgi_param HTTP_REQUEST_ID $request_id;
添加nginx的日志格式：
log_format sas '$http_x_forwarded_for - $request_id';

2、这种配置后前端可以拿到request_id，后端也可以拿到

server{
  set $trace_id "${request_id}";
  if ($http_x_atrace_id != "" ){
      set $trace_id "${http_x_atrace_id}";
  }
  add_header trace_id $trace_id always;
  #无论什么状态码都会返回request_id;

  #配置反向代理时使用
  proxy_set_header x-atrace-id $trace_id;

  ...
}

body_send 流出量
request_size 流入量
