### 分组统计
cat test.txt|awk -F '|' '{x[$1]++;} END{for(i in x) print(i ":" x[i])}'
### 转义分隔符处理
echo "aa||bb" | awk -F '\\|\\|' '{print $2}'
### 求和
awk -F '|' '{sum += $2} END {print sum}' test.txt
### 一次分组
awk -F '|' '{x[$6] += $2} END {for(i in x){print i, x[i]}}' test.txt
### 二次分组
awk -F '|' '{x[$6"-"$7] += $2} END {for(i in x){print i, x[i]}}' test.txt
### 分组求平均
awk -F '|' '{sum += $2} END {print "Average = ", sum/NR}' test.txt
awk -F '|' '{a[$6] += $2; ca[$6]++} END {for(i in a){print(i,a[i]/ca[i])}}' test.txt
