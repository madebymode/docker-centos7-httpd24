FROM arm64v8/httpd
MAINTAINER madebymode

# default values to connect to php-fpm
ENV PHP_HOST php
ENV PHP_PORT 9000

RUN mkdir -p /etc/httpd/conf.d/vhosts
ADD php-fpm.conf /etc/httpd/conf.d/
ADD mounted-vhosts.conf /etc/httpd/conf.d/

EXPOSE 80
EXPOSE 443
