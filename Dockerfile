FROM clojure:lein-2.8.1-alpine
MAINTAINER Christian Johansen <christian@cjohansen.no>

RUN sed -i -e 's/v3\.7/edge/g' /etc/apk/repositories && \
    echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

# Install firefox and tzdata
RUN \
    apk update && apk upgrade && \
    apk add bash tzdata firefox dbus ttf-freefont fontconfig && \
    rm -rf /var/cache/apk/* && \
    firefox --version

# Install slimerjs
COPY slimerjs /usr/local/slimerjs

# Run firefox in HEADLESS mode
ENV MOZ_HEADLESS=1

# Make symlink for /usr/bin/slimerjs
RUN \
    ln -s /usr/local/slimerjs/src/slimerjs /usr/bin/slimerjs && \
    slimerjs /usr/local/slimerjs/examples/phantomjs/loadspeed.js http://google.com
