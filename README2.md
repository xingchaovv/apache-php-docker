# apache-php-docker
一个 Docker 镜像，基于 Apache 和 PHP 应用，用于部署 PHP 站点。

## 2 分钟

# 开发流程

1. 编写 Docker 镜像实现

2. 执行运行脚本

% ./dev-run.sh

3.

# 源码结构

files: 镜像构建所需文件


TTY 交互

### Bash 登录
% sudo docker exec -ti apache-php-docker_php8 /bin/bash

### 前端页面
http://localhost:8080/phpinfo.php

### 推送镜像仓库
% sudo docker push xxx/apd

### 日常配置

web 目录：/var/www/html
PHP 配置文件：/usr/local/etc/php/php.ini

## 其它

暂无
