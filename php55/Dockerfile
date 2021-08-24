FROM php:5.5-alpine
MAINTAINER TYPO3 GmbH <info@typo3.com>

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
    libssl1.1 \
    zstd-dev \
    zstd-libs

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    libressl \
    libressl-dev \
    libzip-dev

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache \
    bash \
    file \
    git \
    imagemagick \
    grep \
    net-tools \
    zlib-dev \
    cyrus-sasl-dev \
    zip \
    && chmod +x /usr/local/bin/install-php-extensions \
    && sync \
    && install-php-extensions \
        apcu \
        bcmath \
        bz2 \
        @composer-2 \
        gd \
        gettext \
        gmp \
        intl \
        memcached \
        mysqli \
        opcache \
        pdo_mysql \
        pspell \
        redis \
        soap \
        sysvsem \
        xdebug-^2.5 \
        zip \
    && touch "$PHP_INI_DIR/php.ini" \
    && echo "phar.readonly = Off" >> $PHP_INI_DIR/php.ini \
    && echo "memory_limit = 2G" >> $PHP_INI_DIR/php.ini \
    && echo "max_input_vars = 1500" >> $PHP_INI_DIR/php.ini \
    && echo "xdebug.max_nesting_level = 400" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "apc.enable_cli=1" >> $PHP_INI_DIR/conf.d/docker-php-ext-apcu.ini \
    && echo "apc.slam_defense=0" >> $PHP_INI_DIR/conf.d/docker-php-ext-apcu.ini \
    && mkdir -p /etc/php/cli-no-xdebug/ \
    && php -i | \
        grep "\.ini" | \
        grep -o -e '\(/[A-Za-z0-9._-]\+\)\+\.ini' | \
        grep -v xdebug | \
        xargs awk 'FNR==1{print ""}1' | \
        grep -v 'zend_extension=xdebug.so' | \
        grep -v '^;' | \
        grep -v '^$' > /etc/php/cli-no-xdebug/php.ini \
    && rm -rf /var/cache/apk/*
