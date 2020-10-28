FROM php:8.0.0RC2-alpine
MAINTAINER TYPO3 GmbH <info@typo3.com>

RUN apk add --no-cache \
	curl \
	less \
	vim \
	psmisc \
	net-tools \
	ncdu \
	bzip2 \
	patch \
	openssh-client \
	git \
	parallel \
	zip \
	tar \
	libffi \
	libressl \
	aspell \
	postgresql-dev \
	gd-dev \
	libzip-dev \
	gmp-dev \
	libmemcached-dev \
&& apk add --no-cache --virtual .build-deps \
	icu-dev \
	gettext-dev \
	aspell-dev \
	bzip2-dev \
	pkgconf \
	coreutils \
	autoconf \
	dpkg-dev dpkg \
	file \
	g++ \
	gcc \
	libc-dev \
	make \
	unixodbc-dev \
	gnupg \
	bison \
	re2c \
	autoconf \
	libtool \
	curl-dev \
	jpeg-dev \
	argon2-dev \
	freetype-dev \
	libedit-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	libffi-dev \
	libressl-dev \
	libsodium-dev \
	libxml2-dev \
	oniguruma-dev \
	sqlite-dev \
	libsodium-dev \
	libwebp-dev \
	libxpm-dev \
	libxslt-dev && \
docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && docker-php-ext-install -j$(nproc) zip gd bz2 pgsql soap bcmath pdo_mysql gmp intl gettext pspell && \
# Install SQLSrv pre-reqs
curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.6.1.1-1_amd64.apk && \
curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.6.1.1-1_amd64.apk && \
curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.6.1.1-1_amd64.sig && \
curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.6.1.1-1_amd64.sig && \
curl https://packages.microsoft.com/keys/microsoft.asc  | gpg --import - && \
gpg --verify msodbcsql17_17.6.1.1-1_amd64.sig msodbcsql17_17.6.1.1-1_amd64.apk && \
gpg --verify mssql-tools_17.6.1.1-1_amd64.sig mssql-tools_17.6.1.1-1_amd64.apk && \
apk add --allow-untrusted msodbcsql17_17.6.1.1-1_amd64.apk && \
apk add --allow-untrusted mssql-tools_17.6.1.1-1_amd64.apk && \
rm msodbcsql17_17.6.1.1-1_amd64.sig msodbcsql17_17.6.1.1-1_amd64.apk && \
rm mssql-tools_17.6.1.1-1_amd64.sig mssql-tools_17.6.1.1-1_amd64.apk && \
# Install PECL Extensions:
mkdir -p /usr/src/php/ext/redis && curl -fsSL https://pecl.php.net/get/redis | tar xvz -C "/usr/src/php/ext/redis" --strip 1 && docker-php-ext-install redis && \
mkdir -p /usr/src/php/ext/xdebug && curl -fsSL https://pecl.php.net/get/xdebug | tar xvz -C "/usr/src/php/ext/xdebug" --strip 1 && docker-php-ext-install xdebug && \
mkdir -p /usr/src/php/ext/sqlsrv && curl -fsSL https://pecl.php.net/get/sqlsrv | tar xvz -C "/usr/src/php/ext/sqlsrv" --strip 1 && docker-php-ext-install sqlsrv && \
mkdir -p /usr/src/php/ext/apcu && curl -fsSL https://pecl.php.net/get/apcu | tar xvz -C "/usr/src/php/ext/apcu" --strip 1 && docker-php-ext-install apcu && \
mkdir -p /usr/src/php/ext/memcached && curl -fsSL https://pecl.php.net/get/memcached | tar xvz -C "/usr/src/php/ext/memcached" --strip 1 && docker-php-ext-install memcached && \
apk del .build-deps && \
mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" && \
sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ $PHP_INI_DIR/php.ini && \
# Restrict cli based php.ini settings for php -S web server to have sane values in acceptance tests
sed -i s/'memory_limit = 128M'/'memory_limit = 2G'/ $PHP_INI_DIR/php.ini && \
# Enable apc on cli for unit tests
echo "apc.enable_cli=1" >> $PHP_INI_DIR/conf.d/docker-php-ext-apcu.ini && \
echo "apc.slam_defense=0" >> $PHP_INI_DIR/conf.d/docker-php-ext-apcu.ini && \
# @todo Prepare an additional php.ini file that does *NOT* include xdebug -- unavailable due to no xdebug
# can be used with:  php -n -c /etc/php/cli-no-xdebug/php.ini
mkdir -p /etc/php/cli-no-xdebug/ && \
	php -i | \
		grep "\.ini" | \
		grep -o -e '\(/[A-Za-z0-9._-]\+\)\+\.ini' | \
		grep -v xdebug | \
		xargs awk 'FNR==1{print ""}1' | \
		grep -v '^;' | \
		grep -v '^$' > /etc/php/cli-no-xdebug/php.ini && \
rm -Rf /usr/src/* && \
# Install composer latest
curl -sSL https://getcomposer.org/download/2.0.2/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer
