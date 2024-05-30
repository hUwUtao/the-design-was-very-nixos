FROM php:8.2-fpm-alpine

RUN sed -ri 's/^www-data:x:82:82:/www-data:x:1000:50:/' /etc/passwd

RUN apk add php82-pdo php82-pdo_mysql php82-mysqli \
php82-zip php82-curl php82-dom php82-xml \
php82-bcmath php82-tokenizer php82-mbstring \
php82-gd php82-common php82-pecl-redis

RUN docker-php-ext-install mysqli pdo pdo_mysql

