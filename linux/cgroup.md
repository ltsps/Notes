# 识别 Linux 节点上的 cgroup 版本
stat -fc %T /sys/fs/cgroup/
对于 cgroup v2，输出为 cgroup2fs。
对于 cgroup v1，输出为 tmpfs。

系统上默认开启cgroup v1
mount |grep cgroup
...
cgroup on /sys/fs/cgroup/rdma type cgroup (rw,nosuid,nodev,noexec,relatime,rdma)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,relatime,perf_event)
cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relatime,memory)
...

切换cgroup v2
加上一个内核引导参数：
systemd.unified_cgroup_hierarchy=1
 mount|grep cgroup
cgroup2 on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,nsdelegate)

# 查看根控制组能力
cat /sys/fs/cgroup/cgroup.controllers
cpuset cpu io memory pids
# 查看子控制组能力
cat /sys/fs/cgroup/test/cgroup.controllers
memory pids
# 增加子控制组能力
echo '+cpuset +cpu +io +memory +pids' > /sys/fs/cgroup/cgroup.subtree_control


# 临时创建cgroup
systemd-run --unit=name --scope --slice=slice_name command

# 设置资源使用量
systemctl set-property httpd.service CPUShares=600 MemoryLimit=500M
如希望此更改为临时更改，请添加 --runtime 选项：
systemctl set-property --runtime httpd.service CPUShares=600 MemoryLimit=500M
# 修改单位文件
若要为 Apache service 分配 1500 个 CPU share 而不是 1024 个，请修改 /usr/lib/systemd/system/httpd.service 单位文件中的 CPUShares 设置：
[Service]
CPUShares=1500
要应用此项修改，请重新载入 systemd 的配置并重启 Apache 来让修改过的 service 文件生效：
若要限定 Apache service 的最大可用内存为 1GB，请修改 /usr/lib/systemd/system/httpd.service 单位文件中的 MemoryLimit 设定：
MemoryLimit=1G
例 2.5. 限定一个单位 Block IO 的可用量
如要降低 Apache service 存取 /home/jdoe/ 目录 block IO 的权重，请将下列字符添加至 /usr/lib/systemd/system/httpd.service 单位文件：
BlockIODeviceWeight=/home/jdoe 750
如要设定 Apache 从 /var/log/ 目录读取的最大带宽为 5MB/秒，请使用下列句法：
BlockIOReadBandwith=/var/log 5M
如要应用此项修改，请重新载入 systemd 的配置并重启 Apache，这样所修改的 service 文件会生效：
~]# systemctl daemon-reload
~]# systemctl restart httpd.service


使用 systemctl list-units
如要查看系统使用的全部 slice 列表，请输入：
~]$ systemctl -t slice
如要将全部被激活的已屏蔽 service 列表，请输入：
~]$ systemctl -t service,masked 
对您系统中安装的单位文件及其状态列表，请输入：
systemctl list-unit-files

# 查看控制群组的层级
systemd-cgls
# 查看资源管控器
cat proc/PID/cgroup
# 监控资源消耗量
systemd-cgtop
