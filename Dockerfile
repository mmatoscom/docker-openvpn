FROM alpine:3.11.3
LABEL maintainer="Akito <the@akito.ooo>" \
      version="2.0.0"
ADD VERSION .
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories   && \
    apk update    && \
    apk add --update \
            openssl  \
            easy-rsa \
            openvpn  \
            iptables \
            tzdata   \
            bash  && \
    rm -fr /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
ENV TZ Europe/Berlin
RUN mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 
