Host sockstest
        HostName 192.168.50.14
        User root
        Port 8022
        ProxyCommand nc -X 5 -x 127.0.0.1:10088 %h %p  ##socks
Host httptest
        Hostname 192.168.50.14
        User root
        Port 2022
        ProxyCommand nc -X connect -x 192.168.50.14:3128 %h %p  ##http

#ssh root@192.168.50.14 -o "ProxyCommand nc --proxy 192.168.50.14:3128 %h %p"   
