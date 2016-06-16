FROM php:5.6.22-fpm
MAINTAINER caixudong "caixudong@verystar.cn"

# Install env
ADD ./conf/sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    libz-dev \
    libmemcached-dev \
    libmcrypt-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    git \
    libgearman-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install zip \
        && docker-php-ext-install gd \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install mysql \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install pdo_mysql

RUN pecl install memcached \
    && pecl install msgpack-0.5.7 \
    && pecl install redis-2.2.8 \
    && pecl install xdebug \
    && pecl install swoole \
    && pecl install gearman

RUN git clone --depth 1 https://github.com/jonnywang/phpssdb.git phpssdb \
    && ( \
        cd phpssdb \
        && phpize \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r phpssdb

RUN curl -fsSL 'https://github.com/Qihoo360/phptrace/archive/v0.3.0.tar.gz' -o /usr/local/phptrace.tar.gz \
    && cd /usr/local \
    && mkdir -p phptrace \
    && tar -zxf phptrace.tar.gz -C phptrace --strip-components=1 \
    && rm /usr/local/phptrace.tar.gz \
    && ( \
        cd /usr/local/phptrace/extension \
        && phpize \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    ) \
    && ( \
        cd /usr/local/phptrace/cmdtool \
        && make \
        && ln -s /usr/local/phptrace/cmdtool/phptrace /usr/bin/phptrace \
    )

#添加配置文件
ADD ./conf/php.ini /usr/local/etc/php/php.ini
ADD ./conf/php-fpm.conf /usr/local/etc/php-fpm.conf

#创建目录
RUN mkdir -p /data/www && mkdir -p /data/log/php && chown -R www-data:www-data /data/log/php

RUN usermod -u 1000 www-data

WORKDIR /data

VOLUME ["/data"]

CMD ["php-fpm"]