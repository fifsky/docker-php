FROM verystar/php:5.6.22

RUN apt-get update && apt-get install libmosquitto-dev supervisor -y && apt-get clean

# add basic supervisor config
COPY ./conf/supervisord.conf /etc/supervisord.conf

VOLUME ["/data"]

CMD ["supervisord", "-n"]