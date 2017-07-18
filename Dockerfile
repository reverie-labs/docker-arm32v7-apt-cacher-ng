FROM resin/rpi-raspbian:jessie
MAINTAINER Guto Andreollo <gutoandreollo@users.noreply.github.com>

RUN apt-get update && \
    apt-get install -y apt-cacher-ng && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ADD acng.conf /etc/apt-cacher-ng/

VOLUME /var/cache/apt-cacher-ng  /var/log/apt-cacher-ng

EXPOSE 3142

CMD ["/usr/sbin/apt-cacher-ng", "-c", "/etc/apt-cacher-ng"]

