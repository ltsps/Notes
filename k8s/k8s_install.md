### 1、安装docker
下载离线安装包https://download.docker.com/linux/centos/7/x86_64/stable/Packages/
### 2、创建docker私有镜像库
docker pull registry
涉及dockerd代理
（1）docker.service
[Service]
Environment="HTTP_PROXY=socks5://127.0.0.1:9080"
Environment="HTTPS_PROXY=socks5://127.0.0.1:9080"
Environment="NO_PROXY=localhost,127.0.0.1"
### 3、安装k8s
（1）配置yum源
 cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
（2）下载包
yum install --downloadonly --downloaddir=/home/centos/k8s kubeadm kubectl kubelet

（3）kubeadm config images list 获取镜像列表
（4）pull镜像列表
（5）初始化master节点
kubeadm init --apiserver-advertise-address 10.209.69.12 --apiserver-bind-port 6443 --kubernetes-version 1.18.0 --pod-network-cidr 10.244.0.0/16 --service-cidr 10.1.0.0/16

mkdir -p $HOME/.kube

  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

  sudo chown $(id -u):$(id -g) $HOME/.kube/config

（6）加入子节点

kubeadm join 10.209.69.12:6443 --token voj8z6.ytej05mfnul5gci7 \

    --discovery-token-ca-cert-hash sha256:d12c6150f5752238e8eabe81403ff4defaf2aeb1a1c159ed7310e027b367b57b

### 4、安装flannel
下载https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml文件

把里面依赖的image都在有网络环境中下载下来；

 

导入私有镜像库；

docker tag xxx:vxxx 10.209.69.12:5000/xxx:vxxx

docker push 10.209.69.12:5000/xxx:vxxx

修改yml中镜像为私有镜像库中的包

部署

kubectl apply -f flannel.yml

查看节点  是否为ready

kubectl get nodes


### 查看kube-proxy使用iptables还是ipvs
kubectl get configmap kube-proxy -n kube-system -o yaml |grep mode


