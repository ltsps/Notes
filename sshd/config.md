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

Host 86ecs
        HostName 10.86.58.131
        User root
        Port 2223
        ServerAliveInterval 3
        StrictHostKeyChecking no
        #ProxyCommand nc -X 5 -x 100.64.64.132:50544 %h %p  ##socks
        ProxyCommand nc -X connect -x 100.64.64.132:50434 %h %p  ##http


Host __test__
        User user
        Hostname xxxxxx
        Port 8022

Host 1* 2* 3* 4* 5* 6* 7* 8* 9*
        User root
        ProxyCommand ssh -F /home/ly/.ssh/usm/ssh_config -q __test__ -W %h:%p
        ForwardAgent yes

Host a* b* c* d* e* f* h* i* j* k* l* m* n* o* p* q* r* s* t* u* v* w* x* y* z*
        ProxyCommand ssh -F /home/ly/.ssh/usm/ssh_config -q __test__ -W %h:%p
        ForwardAgent yes

Host A* B* C* D* E* F* H* I* J* K* L* M* N* O* P* Q* R* S* T* U* V* W* X* Y* Z*
        ProxyCommand ssh -F /home/ly/.ssh/usm/ssh_config -q __test__ -W %h:%p
        ForwardAgent yes
