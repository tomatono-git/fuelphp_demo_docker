#!/bin/bash

echo 'インストール開始'
apt-get update
apt-get install -y vim curl

apt-get install -y zip unzip git tig zlib1g-dev libpq-dev

# # php.iniのパスを設定 (php.ini)
# pear config-set php_ini /usr/local/etc/php/php.ini

# # # PostgreSQL関連
# # docker-php-ext-install pdo_pgsql pgsql
# docker-php-ext-install fpm mbstring pdo gd pgsql pdo_pgsql pecl-redis pear devel
# # apt-get install -y gcc ImageMagick librsvg2-tools lcov
