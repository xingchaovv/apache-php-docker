FROM php:8-apache

RUN cd
# 配置软件源
COPY files/sources.list /etc/apt/sources.list
# 设置时区
RUN rm /etc/localtime; ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 更新
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils git
RUN apt-get install -y vim vim-doc curl iputils-ping
RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev libmagickwand-dev
RUN apt-get autoremove -y
RUN apt-get autoclean -y

# 安装 PHP 扩展
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install exif
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli

RUN git clone --depth=1 https://github.com/Imagick/imagick
RUN cd imagick; phpize; ./configure; make; make install
RUN cd ../; rm -rf imagick
RUN docker-php-ext-enable imagick

# 配置 Apache
RUN cd /etc/apache2/mods-enabled; ln -s ../mods-available/rewrite.load rewrite.load; cd

# 配置入口脚本
COPY files/app_entrypoint.sh /usr/local/bin/
COPY files/app_init_user.sh /usr/local/bin/
ENTRYPOINT ["app_entrypoint.sh"]
CMD ["apache2-foreground"]
