FROM php:5.6.22-fpm
RUN apt-get update && apt-get install -y zlib libmemcached-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && pecl install msgpack \
    && docker-php-ext-enable msgpack
    && pecl install redis \
    && docker-php-ext-enable redis

#添加配置文件
ADD ./conf/php.ini /usr/local/etc/php/php.ini
ADD ./conf/php-fpm.conf /usr/local/etc/php-fpm.conf

#运行用户
USER www-data

WORKDIR /data

#创建目录
RUN mkdir -p /data/www && mkdir /data/log/php RUN chown -R www-data.www-data /data/log/php

VOLUME ["/data"]