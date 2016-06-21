FROM mysql:5.7
MAINTAINER caixudong "caixudong@verystar.cn"

RUN usermod -u 1000 mysql && chown mysql.mysql /var/run/mysqld/

EXPOSE 3306
VOLUME ["/data"]