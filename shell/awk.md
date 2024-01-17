### 分组统计
cat test.txt|awk -F '|' '{x[$1]++;} END{for(i in x) print(i ":" x[i])}'
### 转义分隔符处理
echo "aa||bb" | awk -F '\\|\\|' '{print $2}'
