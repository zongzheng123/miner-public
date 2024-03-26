# 使用官方 Go 最新版镜像
FROM golang:latest

# 设置工作目录。容器内部的路径，您的 Go 应用将会在这里被放置
WORKDIR /app

# 将当前目录下的 Go 模块和和 sum 文件复制到容器里
COPY go.mod ./
COPY go.sum ./

# 下载依赖项。利用 Docker 缓存层，只有当 go.mod 或 go.sum 文件变更时才重新下载
RUN go mod download

# 将当前目录下的代码复制到容器里
COPY . .

# 构建应用程序。您可以根据实际情况替换 ./... 为您的应用程序入口文件
RUN go build .

# 运行构建后的可执行文件
CMD ["./miner-go"]