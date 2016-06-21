#!/usr/bin/env bash

#安装nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
source ~/.bash_profile

#安装node 4.4.5版
nvm install 4.4.5

#安装cnpm镜像
npm install -g cnpm --registry=https://registry.npm.taobao.org

#安装anyproxy代理
cnpm install anyproxy