FROM openjdk:8u171-alpine3.8
LABEL maintainer "Francesco Zanini <francesco@zanini.me>"

EXPOSE 8080

ENV DOTCMS_VERSION 5.0.0

RUN apk add --no-cache --virtual build-deps curl \
    && apk add --no-cache dumb-init \
    && mkdir /app \
    && curl -Lo /tmp/dotcms.tar.gz https://dotcms.com/physical_downloads/release_builds/dotcms_${DOTCMS_VERSION}.tar.gz?r=$(date -Iseconds) \
    && tar -C /app -xzf /tmp/dotcms.tar.gz \
    && addgroup -S dotcms \
    && adduser -S -h /app -G dotcms dotcms \
    && chown -R dotcms:dotcms /app \
    && apk del --no-cache build-deps \
    && rm -rf /tmp/dotcms.tar.gz

WORKDIR /app
USER dotcms
CMD ["/usr/bin/dumb-init", "/app/bin/startup.sh", "run"]
