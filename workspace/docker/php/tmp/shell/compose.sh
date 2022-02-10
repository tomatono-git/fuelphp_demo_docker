#!/bin/bash

# # rootでのインストールを許可
export COMPOSER_ALLOW_SUPERUSER=1
# 対話型のメッセージを表示しない
export COMPOSER_NO_INTERACTION=1

cd /var/www/html

# if [ -e /var/www/html/composer.phar ]; then
#     echo '*** /var/www/html/composer.phar を削除'
#     rm /var/www/html/composer.phar
# fi
# echo '*** Composerのインストール'
# curl -s https://getcomposer.org/installer | php

# ※ Composerのバージョンが古い(1系)と以下のエラーになる。
# SHA384 is not supported by your openssl extension, could not verify the phar file integrity
# -> 更新した composer.phar をあらかじめ用意しておくので上記は不要。

# Composerの更新
echo '*** Composerの self-update'
php composer.phar self-update
echo '*** Composerの update'
php composer.phar update

echo '*** [START] php oil refine install'
# 
php oil refine install
