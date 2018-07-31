# FROM node:10.7-alpine

# WORKDIR /app

# RUN echo @edgecommunity http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
#     && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
#     && apk add --no-cache \
#         chromium \
#         nss@edge \
#         grep \
#         dumb-init \
#     && addgroup -S rendertron \
#     && adduser -S rendertron rendertron \
#     && chown -R rendertron:rendertron /app

# USER rendertron

# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
# RUN npm i rendertron@1.1.1 \
#     && ln -sf /app/node_modules/.bin/rendertron rendertron

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]
# CMD ["/app/rendertron"]
FROM node:10.7-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        google-chrome-unstable \
        libgconf-2-4 \
        fonts-ipafont-gothic \
        fonts-wqy-zenhei \
        fonts-thai-tlwg \
        fonts-kacst \
        ttf-freefont \
    && curl -sSLo dumb-init.deb https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64.deb \
    && dpkg -i dumb-init.deb \
    && useradd -G audio,video -m -r rendertron \
    && chown -R rendertron:rendertron /app \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /var/lib/apt/lists/* dumb-init.deb

USER rendertron

RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm i rendertron@2.0.0 \
    && cd node_modules/rendertron \
    && npm i \
    && npm run-script build \
    && rm -f config.json \
    && cd ../.. \
    && ln -sf /app/node_modules/.bin/rendertron rendertron

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/app/rendertron"]
