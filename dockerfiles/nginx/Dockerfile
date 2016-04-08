FROM nginx:alpine
MAINTAINER Dave Wikoff <dgsims@gmail.com>

COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types
COPY fastcgi.conf /etc/nginx/fastcgi.conf
COPY conf.d/* /etc/nginx/conf.d/

EXPOSE 80 443
