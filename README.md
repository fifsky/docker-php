# Docker 开发环境

只需修改docker-compose.yml要将你的WEB根目录映射到/data即可

`!重要` 如果对Dockerfile文件进行修改，需要重新编译docker镜像，如果对docker-compose.yml文件进行修改，需要删除docker容器，重新创建

`!注意` 由于公司团队开发使用的是公用的mysql环境，所以编排里面的mysql被注释了，需要mysql的取消注释自行编排


## 概念

docker 分镜像和容器，镜像在脚本写好之后只需要编译一次，然后就可以采用该镜像生成N个docker容器服务，比如一个编译好的php镜像，可以生成N个PHP容器类运行，
之所以将每一个功能都独立的编译为一个镜像，就是为了可以随时替换升级，比如从php5升级到php7可以很方便的制作一个php7的镜像，然后停止php5的容器，创建php7
的容器，有点类似积木的感觉

## 停止所有docker
```
docker stop $(docker ps -a -q) 
```

## 删除所有docker
```
docker rm $(docker ps -a -q) 
```

## 使用compose启动docker
```
docker-compose run -d
```

## 重启某个docker

```
docker restart verystar_php
```

> 同理停止和启动分别是`start` `stop`

## 使用下面的命令可以清理所有未打过标签的本地镜像，清理磁盘空间
```
docker rmi $(docker images -q -f "dangling=true")
```

## 重新编译docker镜像
```
docker-compose build --no-cache
```

