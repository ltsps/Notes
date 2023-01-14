### 压测

#### 压测基于 sysbench 构建 20 个测试表，每个表里有 100 万条数据，接着使用 100 个并发线程去对这个数据库发起访问，连续访问 5 分钟，也就是 300 秒。命令如下：

    sysbench --db-driver=mysql --time=300 --threads=100 --report-interval=1 --mysql-host=123 --mysql-port=3306 --mysql-user=123 --mysql-password=123 --mysql-db=test_ly --tables=20 --table_size=1000000 oltp_read_write --db-ps-mode=disable prepare

#### 测试数据库的综合读写 TPS，使用的是 oltp_read_write 模式：

    sysbench --db-driver=mysql --time=300 --threads=100 --report-interval=1 --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=test_user --mysql-password=test_user --mysql-db=test_db --tables=20 --table_size=1000000 oltp_read_write --db-ps-mode=disable run

#### 测试数据库的只读性能，使用的是 oltp_read_only模式：

    sysbench --db-driver=mysql --time=300 --threads=100 --report-interval=1 --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=test_user --mysql-password=test_user --mysql-db=test_db --tables=20 --table_size=1000000 oltp_read_only --db-ps-mode=disable run

#### 测试数据库的写入性能，使用的是 oltp_write_only 模式：

    sysbench --db-driver=mysql --time=300 --threads=100 --report-interval=1 --mysql-host=127.0.0.1 --mysql-port=3306 --mysql-user=test_user --mysql-password=test_user --mysql-db=test_db --tables=20 --table_size=1000000 oltp_write_only --db-ps-mode=disable run
