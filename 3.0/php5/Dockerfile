# --------------------------------------------------
#  Dockerfile for installing XpressEngine 3
# --------------------------------------------------

FROM php:5.6.28-apache

MAINTAINER Sunggun Yu <sunggun.dev@gmail.com>

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y \
    wget \
    unzip \
    ca-certificates \
    apt-transport-https \
    git

# Download XpressEngine package
RUN set -x \
    && wget -O /tmp/xpressengine.zip http://start.xpressengine.io/latest.zip

# Install required PHP extensions for XpressEngine
RUN set -x \
    && apt-get install -y \
    zlib1g-dev \
    libpng-dev \
    libcurl4-openssl-dev \
    && docker-php-ext-install gd zip mbstring tokenizer curl pdo pdo_mysql

# Enableing the Apache2 rewrite module
RUN set -x \
    && a2enmod rewrite

# Extract the XpressEngine package into `/var/www/html` directory which is default directory of Apache2
RUN set -x \
    && unzip /tmp/xpressengine.zip -d /var/www/html \
    && mkdir -p /var/www/html/files \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 707 /var/www/html/files

# Cleanup
RUN set -x \
    && rm -rf /var/lib/apt/lists/* \
    && rm /tmp/xpressengine.zip
