FROM nginx:1.9

#添加本地文件到docker
ADD ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /data/www && mkdir -p /data/log/nginx && chown -R www-data:www-data /data/log/nginx

#挂载目录
VOLUME ["/data"]

CMD ["nginx", "-g", "daemon off;"]