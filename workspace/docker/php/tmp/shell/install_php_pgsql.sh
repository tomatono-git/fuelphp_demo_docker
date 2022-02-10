#!/bin/bash

# PostgreSQL関連
echo 'libpq-dev をインストール'
apt-get install -y libpq-dev
echo 'pgsql をインストール'
docker-php-ext-install pdo pdo_pgsql pgsql
