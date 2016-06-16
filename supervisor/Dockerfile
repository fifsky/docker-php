FROM verystar/php:5.6.22
MAINTAINER caixudong "caixudong@verystar.cn"

RUN apt-get update && apt-get install libmosquitto-dev supervisor -y \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# add basic supervisor config
COPY ./conf/supervisord.conf /etc/supervisord.conf

VOLUME ["/data"]

CMD ["supervisord", "-n"]