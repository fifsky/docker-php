FROM debian:jessie
MAINTAINER caixudong "caixudong@verystar.cn"

# Install source
ADD ./conf/sources.list /etc/apt/sources.list

RUN apt-get update && DEBIAN_FRONTENT=noninteractive \
    apt-get install -yqq gearman-job-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 4730

CMD ["gearmand"]