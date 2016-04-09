FROM graze/composer
MAINTAINER Dave Wikoff <dgsims@gmail.com>

ENV DRUSH_VERSION 8.0.5
ENV TERMINUS_VERSION 0.11.1

USER root
RUN apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
           php7-ctype curl pv mariadb-client

RUN ln -sf /usr/bin/php7 /usr/bin/php  && \
    curl -Lo /usr/bin/drush "https://github.com/drush-ops/drush/releases/download/$DRUSH_VERSION/drush.phar" && \
    curl -Lo /usr/bin/terminus "https://github.com/pantheon-systems/terminus/releases/download/$TERMINUS_VERSION/terminus.phar "  && \
    curl -Lo /usr/bin/wp "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" && \
    chmod +x /usr/bin/drush /usr/bin/wp /usr/bin/terminus

USER composer
ENTRYPOINT ["/bin/sh", "-c"]