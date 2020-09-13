FROM ubuntu:latest

MAINTAINER Jieter

ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_PORT=8080

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends php-fpm

ADD phpinfo.php /home/php/
CMD [ "/usr/bin/php", "-S", "0.0.0.0:8000", "-t", "/home/php/"]
