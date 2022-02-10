#!/bin/bash

cd /tmp/docker/php/shell
chmod 770 ./user.sh

./install_apt_get.sh
./user.sh
./install_php_modules.sh
./deploy.sh
./compose.sh
