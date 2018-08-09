FROM debian:stretch
LABEL maintainer "Francesco Zanini <francesco@zanini.me>"

VOLUME /data
EXPOSE 6789 8080 8443 8843 8880 3478/udp

ENV UNIFI_VERSION 5.8.28
ENV JVM_OPTS ""

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sSo /tmp/unifi.deb https://dl.ubnt.com/unifi/${UNIFI_VERSION}/unifi_sysvinit_all.deb && \
    apt-get install -y /tmp/unifi.deb && \
    rm -rf /var/lib/apt/lists/* /tmp/unifi.deb

COPY docker-entrypoint.sh /

WORKDIR /data
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
