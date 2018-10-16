#!/bin/bash
set -e
source /pd_build/buildconfig
set -x

minimal_apt_get_install \
    build-essential \
    php-apcu \
    php7.0 \
    php7.0-bcmath \
    php7.0-bz2 \
    php7.0-cli \
    php7.0-common \
    php7.0-curl \
    php7.0-dev \
    php7.0-gd \
    php7.0-gmp \
    php7.0-imap \
    php7.0-intl \
    php7.0-json \
    php7.0-mbstring \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-opcache \
    php7.0-pgsql \
    php7.0-pspell \
    php7.0-readline \
    php7.0-recode \
    php7.0-soap \
    php7.0-sqlite3 \
    php7.0-xml \
    php7.0-xmlrpc \
    php7.0-xsl \
    php7.0-zip \
    php-redis \
    php-memcached \
    php-xdebug \
    php-pear \
    graphicsmagick \
    imagemagick \
    zip \
    unzip \
    sqlite3 \
    #

# Enable phar writing for packaging tasks
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php/7.0/cli/php.ini

# Restrict cli based php.ini settings for php -S web server to have sane values in acceptance tests
sed -i s/'memory_limit = -1'/'memory_limit = 2G'/ /etc/php/7.0/cli/php.ini
sed -i s/'max_execution_time = 30'/'max_execution_time = 240'/ /etc/php/7.0/cli/php.ini
sed -i s/'; max_input_vars = 1000'/'max_input_vars = 1500'/ /etc/php/7.0/cli/php.ini

echo "xdebug.max_nesting_level = 400" >> /etc/php/7.0/mods-available/xdebug.ini

# Enable apc on cli for unit tests
echo "apc.enable_cli=1" >> /etc/php/7.0/mods-available/apcu.ini
echo "apc.slam_defense=0" >> /etc/php/7.0/mods-available/apcu.ini

# mssql driver
ACCEPT_EULA=Y minimal_apt_get_install \
    msodbcsql17 \
    mssql-tools \
    unixodbc-dev \
    #
pecl install sqlsrv
pecl install pdo_sqlsrv
echo extension=sqlsrv.so >> /etc/php/7.0/mods-available/sqlsrv.ini
echo extension=pdo_sqlsrv.so >> /etc/php/7.0/mods-available/pdo_sqlsrv.ini
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
curl -sSL https://getcomposer.org/download/1.6.3/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer
