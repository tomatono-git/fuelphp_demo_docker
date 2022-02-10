#!/bin/bash

# php.iniのパスを設定 (php.ini)
# pear config-set php_ini /usr/local/etc/php/php.ini

docker-php-ext-install fpm gd pear devel
# apt-get install -y gcc ImageMagick librsvg2-tools lcov

./install_php_pgsql.sh
./install_php_xdebug.sh
# PHP 7.4 では mbstring の代わりに libonig-dev を使う
# ./install_php_mbstring.sh
# ./install_php_redis.sh

# # apt-get install -y \
# #     php php-fpm php-mbstring php-pdo php-gd php-pgsql php-pdo_pgsql php-pecl-redis php-pear php-devel gcc ImageMagick librsvg2-tools lcov
