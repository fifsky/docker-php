FROM nginx:1.9

#添加本地文件到docker
ADD ./conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/* /etc/nginx/conf.d/

#添加用户和分组
RUN groupadd www-data && -s /sbin/nologin -g www www

#指定执行的用户
USER www-data


RUN mkdir -p /data/www && mkdir /data/log/nginx RUN chown -R www-data.www-data /data/log/nginx

#挂载目录
VOLUME ["/data"]