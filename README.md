# apache-php-docker
一个 Docker 镜像，基于 Apache httpd 和 PHP 应用，用于部署 PHP 站点。

## 一、使用方法

1. 拉取镜像

```
% sudo docker pull xingchaovv/apache-php-docker:php8
```

全部可用的 TAG：php7 php8

2. 启动容器

```
% sudo docker run -v <站点目录>:/var/www/html -p <端口>:80 xingchaovv/apache-php-docker:php8
```

## 二、开发指南

### 2.1 源码结构

php7 构建 PHP 7 镜像源文件

phpXXX 构建 PHP 其它版本镜像源文件

php_base 构建镜像的基础或公共源文件

run 运行镜像容器的环境文件

build.sh 构建镜像的脚本

run.sh 运行镜像容器的脚本

### 2.2 开发流程

1. 编写 Dockerfile 文件等镜像源文件

2. 构建镜像脚本

% ./build.sh php8

若某语句出错，只构建镜像到报错语句前。通过下文的调试模式，进行调试。

3. 运行镜像容器

正常启动 apache 的模式

% ./run.sh php8 apache

进入 bash 用于调试的模块

% ./run.sh php8 bash

4. 测试镜像

待补充 @TODO

测试 www 目录

测试脚本：http://127.0.0.1:xxx/phpinfo.php

bash 交互

% sudo docker exec -ti CONTAINER /bin/bash

5. 发布镜像

待补充 @TODO

% sudo docker push xxx/apd
