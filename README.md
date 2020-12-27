# apache-php-docker
一个 Docker 镜像，基于 Apache 和 PHP 应用，用于部署 PHP 站点。

## 构建流程

### 构建镜像
% sudo docker build -t apd .

### 启动测试
% sudo docker stop apd-test

% sudo docker rm apd-test

% sudo docker run --name apd-test -v "$PWD"/test_www:/var/www/html -v "$PWD"/test_conf/php.ini:/usr/local/etc/php/php.ini -p 8080:80 apd

% sudo docker run --name apd-test -v "$PWD"/test_www:/var/www/html -v "$PWD"/test_conf/php.ini:/usr/local/etc/php/php.ini -p 8080:80 -e "RUN_UID=501" -e "RUN_GID=20" apd

TTY 交互

### Bash 登录
% sudo docker exec -ti apd-test /bin/bash

### 前端页面
http://localhost:8080/phpinfo.php

### 推送镜像仓库
% sudo docker push xxx/apd

### 日常配置

web 目录：/var/www/html
PHP 配置文件：/usr/local/etc/php/php.ini

## 其它

暂无
