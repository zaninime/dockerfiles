FROM debian:stretch
LABEL maintainer "Francesco Zanini <francesco@zanini.me>"

ENV ZTC_VERSION 1.0.1

VOLUME /var/lib/zerotier-one
VOLUME /workdir

COPY ztc-wrapper.sh /usr/local/bin
COPY apt.gpg /tmp

RUN apt-get update \
    && apt-get install -y apt-transport-https gnupg2 curl \
    && apt-key add /tmp/apt.gpg \
    && echo deb https://download.zerotier.com/debian/stretch stretch main > /etc/apt/sources.list.d/zerotier.list \
    && apt-get update \
    && apt-get install -y zerotier-one \
    && ln -s /usr/local/bin/ztc-wrapper.sh /usr/local/bin/ztc \
    && curl -sSL https://github.com/zaninime/ztc/releases/download/v${ZTC_VERSION}/ztc_${ZTC_VERSION}_Linux-64bit.tar.gz | tar -C /usr/bin -zxf - \
    && rm -rf /var/lib/apt/lists/* /tmp/apt.gpg

WORKDIR /workdir

CMD ["zerotier-one"]
