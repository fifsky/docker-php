FROM pushtospace/php:7.0

MAINTAINER Gino Jongenelen <g.jongenelen@pushto.space>


RUN apt-get update && apt-get upgrade -y && apt-get install libmosquitto-dev supervisor -y && apt-get clean

RUN wget https://github.com/mgdm/Mosquitto-PHP/archive/php7.zip && unzip php7.zip && cd Mosquitto-PHP-php7 && /usr/local/bin/phpize && ./configure && make && make install && cd .. && rm -rf Mosquitto-PHP-php7 php7.zip

RUN echo "[supervisord]">>/etc/supervisord.conf && echo "nodaemon=true">>/etc/supervisord.conf && echo "">>/etc/supervisord.conf && echo "include /etc/supervisor">>/etc/supervisord.conf

CMD ["supervisord"]