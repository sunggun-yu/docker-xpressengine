# --------------------------------------------------
#  Dockerfile for installing XpressEngine 1.9
# --------------------------------------------------

FROM php:7.2-apache

MAINTAINER Sunggun Yu <sunggun.dev@gmail.com>

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y \
    apt-utils \
    wget \
    unzip \
    ca-certificates \
    apt-transport-https \
    git \
    zlib1g-dev \
    libpng-dev \
    libcurl4-openssl-dev

# Download XpressEngine package
RUN set -x \
    && wget -O /tmp/xe.zip https://github.com/xpressengine/xe-core/releases/download/1.9.6/xe.1.9.6.zip

# Install required PHP extensions for XpressEngine
RUN set -x \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    && docker-php-ext-install zip mbstring tokenizer curl fileinfo

# Enableing the Apache2 rewrite module
RUN set -x \
    && a2enmod rewrite

# Extract the XpressEngine package into `/var/www/html` directory which is default directory of Apache2
RUN set -x \
    && unzip /tmp/xe.zip -d /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && mkdir -p /var/www/html/files \
    && chmod -R 0707 /var/www/html/files

# Cleanup
RUN set -x \
    && rm -rf /var/lib/apt/lists/* \
    && rm /tmp/xe.zip
