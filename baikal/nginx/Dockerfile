FROM alpine:latest as builder

ENV BAIKAL_VERSION 0.4.6

WORKDIR /home
RUN apk update && \
    apk add curl
RUN curl -LO https://github.com/fruux/Baikal/releases/download/${BAIKAL_VERSION}/baikal-${BAIKAL_VERSION}.zip
RUN unzip -q baikal-${BAIKAL_VERSION}.zip

FROM nginx:mainline-alpine
LABEL maintainer="Francesco Zanini <francesco@zanini.me>"

RUN rm -rf /etc/nginx/conf.d/default.conf && \
    rm -rf /var/www

COPY nginx/nginx.conf /etc/nginx/conf.d/baikal.conf

COPY --from=builder /home/baikal /var/www
