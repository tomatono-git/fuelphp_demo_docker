#!/bin/bash

echo 'redis をインストール'
pecl install redis
echo 'redis を有効にする'
docker-php-ext-enable redis
