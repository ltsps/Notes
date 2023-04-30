# 使用版本3的命令行
export ETCDCTL_API=3
# 查看所有的key
etcd get --prefix ""

etcd --endpoints=$ENDPOINTS put foo "hello World!"

etcdctl --endpoints=http://127.0.0.1:2379 --write-out=table endpoint status
etcdctl --endpoints=http://127.0.0.1:2379 --write-out=table endpoint health
etcdctl --endpoints=http://127.0.0.1:2379 --write-out=table member list


