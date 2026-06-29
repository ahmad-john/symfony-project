FROM php:8.3-fpm-alpine

# Ставим системные зависимости и расширения PHP
RUN apk add --no-cache \
    git \
    bash \
    postgresql-dev \
    linux-headers \
    $PHPIZE_DEPS \
    && docker-php-ext-install pdo pdo_pgsql

# Устанавливаем Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/symfony

CMD ["php-fpm"]