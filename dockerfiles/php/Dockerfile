FROM php:7-fpm-alpine
MAINTAINER Dave Wikoff <dgsims@gmail.com>

RUN apk add --no-cache  --virtual .phpext-builddeps\
        libpng-dev \
        gettext-dev \
        libmcrypt-dev \
        libxslt-dev \
        zlib-dev && \
        docker-php-ext-install -j5 \
        gettext \
        mysqli \
        pdo_mysql \
        opcache \
        mcrypt  \
        sockets \
        xsl \
        zip \
        gd \
        mbstring && \
        curl -fsSL 'https://github.com/phpredis/phpredis/archive/php7.zip' -o phpredis-php7.zip && \
        	unzip phpredis-php7.zip && \
        	rm phpredis-php7.zip && ( \
        		cd phpredis-php7 && \
        		phpize && ./configure && make install \
        	) && \
        	rm -r phpredis-php7 && \
            pecl install xdebug && \
        docker-php-ext-enable redis xdebug && \
        apk add --virtual .phpext-rundeps \
            gettext \
            libmcrypt \
            libxslt && \
        apk del .phpext-builddeps

COPY php.ini /usr/local/etc/php/conf.d/php.ini
