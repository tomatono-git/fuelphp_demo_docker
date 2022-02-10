#!/bin/bash

apt-get install -y sudo
# 追加するユーザー
DOCKER_UID=1000
DOCKER_USER=dev
DOCKER_PASSWORD=pass
# ユーザーを作成
echo 'ユーザーを作成'
useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} -s /bin/bash \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

# 作成したユーザーに切り替える
# USER ${DOCKER_USER}
