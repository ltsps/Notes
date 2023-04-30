#method get
curl 'http://url?a=b&c=d'

#method Post
1、curl 'http://url' -X POST -d '{"a": "b", "c":"d"}'
2、curl -X POST 'http://url?a=b&c=d'

# 测试自定义解析
curl --resolve 'www.test.com:9443:127.0.0.1' https://www.test.com:9443/hello  -vvv



curl -I -m 10 -o /dev/null -s -w %{http_code}""  localhost:18080/health

for i in `seq 1 10`; do curl -m 2 "http://127.0.0.1:8083/test"; done

curl http://test.com/ -H 'X-Forwarded-For: 1.1.1.1' -H 'X-Real-IP: 2.2.2.2'

curl -IL -H "X-Forwarded-For:8.8.8.8" https://www.test.com/static/09.png
