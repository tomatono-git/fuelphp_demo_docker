FROM php:7.4-fpm
# FROM php:7.3-fpm

RUN apt-get update
RUN apt install -y locales-all
RUN apt-get install -y libonig-dev

# Time Zone
ENV TZ Asia/Tokyo

# Language
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# php.ini をコピー
COPY ./usr_local_etc_php/php.ini /usr/local/etc/php/php.ini

# スクリプトなどをホストからコンテナにコピー
COPY ./tmp/ /tmp/docker/php/
RUN /tmp/docker/php/setup.sh
