系统上默认仍然开启cgroup v1
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
