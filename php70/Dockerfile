FROM php:7.0-alpine
MAINTAINER TYPO3 GmbH <info@typo3.com>

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/v3.9/main \
    unixodbc \
    unixodbc-dev

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache \
    bash \
    file \
    git \
    graphicsmagick \
    imagemagick \
    grep \
    net-tools \
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
        pdo_pgsql \
        pgsql \
        pspell \
        redis \
        soap \
        sysvsem \
        xdebug-^2.8 \
        zip \
    # Manually install sqlsrv, docker-php-extension-installer downgrades unixodbc again which breaks the installation on alpine 3.7 \
    && mkdir /opt \
    && mkdir -p /tmp/src \
    && rm -rf /tmp/src/msodbcsql.apk \
    && curl -sSLf -o /tmp/src/msodbcsql.apk https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.8.1.1-1_amd64.apk \
    && apk add --allow-untrusted /tmp/src/msodbcsql.apk \
    && rm -rf /tmp/src/msodbcsql.apk \
    && apk add --no-cache autoconf make gcc g++ \
    && pecl install pdo_sqlsrv-5.3.0 \
    && pecl install sqlsrv-5.3.0 \
    && apk del autoconf make gcc g++ \
    && docker-php-ext-enable pdo_sqlsrv \
    && docker-php-ext-enable sqlsrv \
    # Continue regular setup
    && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    && sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ $PHP_INI_DIR/php.ini \
    && sed -i s/'memory_limit = 128M'/'memory_limit = 2G'/ $PHP_INI_DIR/php.ini \
    && sed -i s/'max_execution_time = 30'/'max_execution_time = 240'/ $PHP_INI_DIR/php.ini \
    && sed -i s/'; max_input_vars = 1000'/'max_input_vars = 1500'/ $PHP_INI_DIR/php.ini \
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
    && sed -i s/'#default_bits'/'default_bits'/ /etc/ssl/openssl.cnf \
    && rm -rf /var/cache/apk/*
