FROM mysql:5.7
MAINTAINER caixudong "fifsky@gmail.com"

RUN usermod -u 1000 mysql && chown mysql.mysql /var/run/mysqld/

EXPOSE 3306
VOLUME ["/data"]