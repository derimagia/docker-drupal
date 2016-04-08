FROM php:7.0-fpm-alpine
MAINTAINER Dave Wikoff <dgsims@gmail.com>

RUN apk -U upgrade \
     apk --update --no-cache add libpng-dev && \
     rm -rf /tmp/src && \
     rm -rf /var/cache/apk/*

RUN docker-php-ext-install -j5 \
        mysqli \
        opcache \
        gd mbstring

RUN curl -fsSL 'https://github.com/phpredis/phpredis/archive/php7.zip' -o phpredis-php7.zip && \
	unzip phpredis-php7.zip && \
	rm phpredis-php7.zip && ( \
		cd phpredis-php7 && \
		phpize && \
		./configure &&  \
		make && \
		make install \
	) && \
	rm -r phpredis-php7 && \
    pecl install xdebug && \
	docker-php-ext-enable redis xdebug

COPY php.ini /usr/local/etc/php/conf.d/php.ini