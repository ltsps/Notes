# 静态编译
CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o main main.go
