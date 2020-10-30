#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
    make \
    php7.2 \
    php7.2-apcu \
    php7.2-bcmath \
    php7.2-bz2 \
    php7.2-cli \
    php7.2-common \
    php7.2-curl \
    php7.2-dev \
    php7.2-gd \
    php7.2-gmp \
    php7.2-imap \
    php7.2-intl \
    php7.2-json \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-opcache \
    php7.2-pgsql \
    php7.2-pspell \
    php7.2-readline \
    php7.2-recode \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-xdebug \
    php7.2-xml \
    php7.2-xmlrpc \
    php7.2-xsl \
    php7.2-zip \
    php-pear \
    php-redis \
    php-memcached \
    re2c \
    graphicsmagick \
    imagemagick \
    zip \
    unzip \
    sqlite3 \
    #


# Disable opcache on php 7.2 since that triggers segfaults 'zend_mm_heap corrupted' with vfsStream 1.6.4 (currently)
# Note: Still true?
echo "opcache.enable_cli=0" >> /etc/php/7.2/cli/conf.d/10-opcache.ini

# Enable phar writing
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php/7.2/cli/php.ini

# Restrict cli based php.ini settings for php -S web server to have sane values in acceptance tests
sed -i s/'memory_limit = -1'/'memory_limit = 2G'/ /etc/php/7.2/cli/php.ini
sed -i s/'max_execution_time = 30'/'max_execution_time = 240'/ /etc/php/7.2/cli/php.ini
sed -i s/'; max_input_vars = 1000'/'max_input_vars = 1500'/ /etc/php/7.2/cli/php.ini

echo "xdebug.max_nesting_level = 400" >> /etc/php/7.2/mods-available/xdebug.ini

# Enable apc on cli for unit tests
echo "apc.enable_cli=1" >> /etc/php/7.2/mods-available/apcu.ini
echo "apc.slam_defense=0" >> /etc/php/7.2/mods-available/apcu.ini

# mssql driver
ACCEPT_EULA=Y minimal_apt_get_install \
    msodbcsql17 \
    mssql-tools \
    unixodbc-dev \
    #
pecl install sqlsrv
pecl install pdo_sqlsrv
echo extension=sqlsrv.so >> /etc/php/7.2/mods-available/sqlsrv.ini
echo extension=pdo_sqlsrv.so >> /etc/php/7.2/mods-available/pdo_sqlsrv.ini
phpenmod sqlsrv
phpenmod pdo_sqlsrv

# Prepare an additional php.ini file that does *NOT* include xdebug
# can be used with:  php -n -c /etc/php/cli-no-xdebug/php.ini
mkdir /etc/php/cli-no-xdebug/
php -i | \
    grep "\.ini" | \
    grep -o -e '\(/[A-Za-z0-9._-]\+\)\+\.ini' | \
    grep -v xdebug | \
    xargs awk 'FNR==1{print ""}1' | \
    grep -v '^;' | \
    grep -v '^$' > /etc/php/cli-no-xdebug/php.ini

# Install composer
curl -sSL https://getcomposer.org/download/2.0.3/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer
