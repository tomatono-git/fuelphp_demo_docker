#!/bin/bash

apt-get -y install locales
echo 'mgstring をインストール'
docker-php-ext-install mbstring
echo 'mgstring を有効にする'
docker-php-ext-enable mbstring
