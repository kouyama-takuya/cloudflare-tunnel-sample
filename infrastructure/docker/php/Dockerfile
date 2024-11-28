# 基盤イメージとして公式のPHP-FPMイメージを使用
FROM php:8.3-fpm

# システムパッケージの更新と必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Docker内でComposerをインストール
RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer self-update --2

# PHP拡張モジュールのインストール
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 作業ディレクトリを設定
WORKDIR /var/www/html

# Laravelの依存関係をインストール
RUN if [ ! -f /var/www/html/composer.json ]; then \
    composer create-project --prefer-dist laravel/laravel .; \
    else \
    composer install; \
    fi

# アプリケーションの所有者とグループを変更
RUN chown -R www-data:www-data /var/www/html

# 権限を設定
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
