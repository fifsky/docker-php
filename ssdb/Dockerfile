FROM debian:jessie
MAINTAINER caixudong "fifsky@gmail.com"

# Install source
ADD ./conf/sources.list /etc/apt/sources.list

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    make gcc g++ curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL 'https://github.com/ideawu/ssdb/archive/1.9.0.tar.gz' -o ssdb.tar.gz \
    && mkdir -p ssdb \
    && tar -zxf ssdb.tar.gz -C ssdb --strip-components=1 \
    && rm ssdb.tar.gz \
    && ( \
        cd ssdb \
        && make \
        && make install \
        && cp ssdb-server /usr/bin \
    ) \
    && cp ssdb/ssdb.conf /etc

RUN mkdir -p /var/lib/ssdb && \
  sed \
    -e 's@home.*@home /var/lib@' \
    -e 's/loglevel.*/loglevel info/' \
    -e 's@work_dir = .*@work_dir = /var/lib/ssdb@' \
    -e 's@pidfile = .*@@' \
    -e 's@level:.*@level: info@' \
    -e 's@ip:.*@ip: 0.0.0.0@' \
    -i /etc/ssdb.conf

ENV TZ Asia/Shanghai
EXPOSE 8888
VOLUME /var/lib/ssdb
ENTRYPOINT /usr/bin/ssdb-server /etc/ssdb.conf