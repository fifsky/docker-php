FROM nginx:1.9
MAINTAINER caixudong "caixudong@verystar.cn"

#添加本地文件到docker
ADD ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /data && chown -R www-data:www-data /data

#挂载目录
VOLUME ["/data"]

CMD ["nginx", "-g", "daemon off;"]