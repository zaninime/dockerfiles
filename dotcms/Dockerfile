FROM openjdk:8u171-alpine3.8
LABEL maintainer "Francesco Zanini <francesco@zanini.me>"

EXPOSE 8080

ENV DOTCMS_VERSION 4.3.3

RUN apk add --no-cache curl dumb-init \
    && mkdir /app \
    && curl -Lo /tmp/dotcms.tar.gz https://dotcms.com/physical_downloads/release_builds/dotcms_${DOTCMS_VERSION}.tar.gz?r=$(date -Iseconds) \
    && tar -C /app -xzf /tmp/dotcms.tar.gz \
    && apk del --no-cache curl \
    && addgroup -S dotcms \
    && adduser -S -h /app -G dotcms dotcms \
    && chown -R dotcms:dotcms /app \
    && rm -rf /tmp/dotcms.tar.gz

WORKDIR /app
USER dotcms
CMD ["/usr/bin/dumb-init", "/app/bin/startup.sh", "run"]
