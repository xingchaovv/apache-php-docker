FROM php:7.4-apache

### 构建 ###

# 配置软件源
COPY files/sources.list /etc/apt/sources.list

# 修改时区
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 更新
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y vim vim-doc curl iputils-ping
RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev libmagickwand-dev
RUN apt-get autoremove -y
RUN apt-get autoclean -y
# 安装 PHP 扩展
RUN docker-php-ext-enable opcache
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install exif
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN pecl install imagick
RUN docker-php-ext-enable imagick
# 配置 Apache
RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load rewrite.load

# 添加启动脚本
COPY files/app_entrypoint.sh /usr/local/bin/
COPY files/app_init_user.sh /usr/local/bin/

### 配置 ###

# 配置入口
ENTRYPOINT ["app_entrypoint.sh"]
CMD ["apache2-foreground"]
