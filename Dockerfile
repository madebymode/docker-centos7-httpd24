FROM arm64v8/httpd
MAINTAINER madebymode

# default values to connect to php-fpm
ENV PHP_HOST php
ENV PHP_PORT 9000

RUN rm /etc/httpd/conf.d/welcome.conf
RUN mkdir -p /etc/httpd/conf.d/vhosts
ADD php-fpm.conf /etc/httpd/conf.d/
ADD mounted-vhosts.conf /etc/httpd/conf.d/

# Update and install latest packages and prerequisites
RUN yum update -y \
    && yum clean all && yum history new
    
EXPOSE 80
EXPOSE 443
