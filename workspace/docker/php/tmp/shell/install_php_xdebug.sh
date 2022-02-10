#!/bin/bash

echo 'xdebug をインストール'
pecl install xdebug
echo 'xdebug を有効にする'
docker-php-ext-enable xdebug

# xdebug の設定を追加
cat /tmp/docker/php/xdebug.ini >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
