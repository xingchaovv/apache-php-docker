FROM php:7.4-apache

# 复制镜像文件
COPY php_base/image-files/ /

# 设置时区
RUN rm /etc/localtime; ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 更新
RUN apt-get update; apt-get install -y apt-utils
RUN apt-get install -y git vim vim-doc curl iputils-ping
RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev libmagickwand-dev libzip-dev
RUN apt-get autoremove -y; apt-get autoclean -y

# 安装 PHP 扩展
RUN docker-php-ext-enable opcache
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install sockets
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install exif
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN pecl install /usr/src/imagick-3.4.4.tgz; docker-php-ext-enable imagick

# 配置 Apache
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

# 配置入口脚本
ENTRYPOINT ["app_entrypoint.sh"]
CMD ["apache2-foreground"]
