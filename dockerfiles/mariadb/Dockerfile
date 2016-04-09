FROM alpine:edge
MAINTAINER Dave Wikoff <dgsims@gmail.com>

RUN addgroup -g 999 -S mysql && adduser -S -u 999 -G mysql mysql
RUN apk --update --no-cache add \
    mariadb mariadb-client && \
    rm -rf /var/lib/mysql && \
    mkdir /var/lib/mysql

RUN mkdir -p /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

COPY docker-entrypoint.sh /

VOLUME /var/lib/mysql
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]
