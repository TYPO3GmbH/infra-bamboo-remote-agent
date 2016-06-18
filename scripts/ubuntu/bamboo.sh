#!/bin/sh -eux

# Create group
if id -g bamboo >/dev/null 2>&1; then
  # Group exists, skip action
  true
else
  groupadd bamboo
fi

# Create / change user
if id -u bamboo >/dev/null 2>&1; then
  usermod -a -g bamboo -G users bamboo
else
  useradd -c 'Bamboo Remote Agent' -d /home/bamboo -s /bin/bash -m -N -g bamboo -G users bamboo
fi

# Install build dependencies
apt-get install -y \
  curl \
  git \
  language-pack-de \
  language-pack-en \
  mariadb-client \
  mariadb-server \
  openjdk-8-jre-headless \
  nginx \
  php7.0 \
  php7.0-bcmath \
  php7.0-bz2 \
  php7.0-cli \
  php7.0-common \
  php7.0-curl \
  php7.0-fpm \
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
  php7.0-xml \
  php7.0-xmlrpc \
  php7.0-xsl \
  php7.0-zip \
  vim-tiny \
  #

# Create group for remote agent
mkdir -p /srv/bamboo-agent-home
chmod 0775 /srv/bamboo-agent-home
chown bamboo:bamboo /srv/bamboo-agent-home
usermod -c 'Bamboo Remote Agent' -a -G bamboo -s /bin/bash bamboo >/dev/null

# Install bamboo remote agent
curl -SL --progress-bar https://bamboo.typo3.com/agentServer/agentInstaller/atlassian-bamboo-agent-installer-5.12.2.1.jar -o /tmp/bamboo-installer.jar
cd /srv
sudo -HEu bamboo /usr/bin/java -Dbamboo.home=/srv/bamboo-agent-home -jar /tmp/bamboo-installer.jar https://bamboo.typo3.com/agentServer install
rm -f /tmp/bamboo-installer.jar

# Prepare build dir
mkdir -p /srv/bamboo-agent-home/xml-data/build-dir/CORE-GTC-CAT
chown -R bamboo:bamboo /srv/bamboo-agent-home

# Create systemd unit file
cat >/etc/systemd/system/bamboo-agent.service <<'EOF'
[Unit]
Description=Atlassian Bamboo Agent
After=syslog.target network.target

[Service]
Type=forking
User=bamboo
Group=bamboo
ExecStart=/srv/bamboo-agent-home/bin/bamboo-agent.sh start
ExecStop=/srv/bamboo-agent-home/bin/bamboo-agent.sh stop

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable bamboo-agent

# Install composer
curl -sSL https://getcomposer.org/download/1.1.2/composer.phar -o /usr/bin/composer
chmod +x /usr/bin/composer

# Configure NGINX for acceptance tests
cat >/etc/nginx/conf.d/upstream-acceptance-tests.conf <<'EOF'
upstream acceptance-tests-fpm {
  server unix:/run/php/acceptance-tests-fpm.sock;
}
EOF

cat >/etc/nginx/sites-available/acceptance-tests <<'EOF'
server {
  listen 127.0.0.1:8000;

  server_name localhost;

  root  /srv/bamboo-agent-home/xml-data/build-dir/CORE-GTC-CAT;
  index index.php;
  client_max_body_size 64M;

  location /typo3/install {
    return 307 $scheme://$host/typo3/sysext/install/Start/Install.php;
  }

  # Prevent clients from accessing hidden files (starting with a dot)
  # This is particularly important if you store .htpasswd files in the site hierarchy
  # Access to `/.well-known/` is allowed.
  location ~* /\.(?!well-known\/) {
      deny all;
  }

  # Prevent clients from accessing to backup/config/source files
  location ~* (?:\.(?:bak|conf|dist|fla|in[ci]|log|psd|sh|sql|sw[op])|~)$ {
      deny all;
  }

  # Built-in filename-based cache busting
  location ~* (.+)\.(?:\d+)\.(js|css|png|jpg|jpeg|gif)$ {
    try_files $uri $1.$2;
  }

  location / {
    try_files $uri $uri/ /index.php?$args;
  }

  location ~ \.php$ {
    # regex to split $uri to $fastcgi_script_name and $fastcgi_path
    fastcgi_split_path_info ^(.+\.php)(/.+)$;

    # Check that the PHP script exists before passing it
    try_files $fastcgi_script_name =404;

    # Bypass the fact that try_files resets $fastcgi_path_info
    # see: http://trac.nginx.org/nginx/ticket/321
    set $path_info $fastcgi_path_info;
    fastcgi_param PATH_INFO $path_info;

    fastcgi_index index.php;

    fastcgi_param QUERY_STRING    $query_string;
    fastcgi_param REQUEST_METHOD    $request_method;
    fastcgi_param CONTENT_TYPE    $content_type;
    fastcgi_param CONTENT_LENGTH    $content_length;

    fastcgi_param SCRIPT_FILENAME   $request_filename;
    fastcgi_param SCRIPT_NAME     $fastcgi_script_name;
    fastcgi_param REQUEST_URI     $request_uri;
    fastcgi_param DOCUMENT_URI    $document_uri;
    fastcgi_param DOCUMENT_ROOT   $document_root;
    fastcgi_param SERVER_PROTOCOL   $server_protocol;

    fastcgi_param GATEWAY_INTERFACE CGI/1.1;
    fastcgi_param SERVER_SOFTWARE   nginx/$nginx_version;

    fastcgi_param REMOTE_ADDR     $remote_addr;
    fastcgi_param REMOTE_PORT     $remote_port;
    fastcgi_param SERVER_ADDR     $server_addr;
    fastcgi_param SERVER_PORT     $server_port;
    fastcgi_param SERVER_NAME     $server_name;

    fastcgi_param HTTPS       $https if_not_empty;

    # PHP only, required if PHP was built with --enable-force-cgi-redirect
    fastcgi_param REDIRECT_STATUS   200;

    fastcgi_pass acceptance-tests-fpm;
    fastcgi_read_timeout 90;
  }
}
EOF

# Enable NGINX Sites
rm -f /etc/nginx/sites-enabled/default
ln -nsf /etc/nginx/sites-available/acceptance-tests /etc/nginx/sites-enabled/acceptance-tests

# Configure PHP-FPM for acceptance tests
cat >/etc/php/7.0/fpm/pool.d/acceptance-tests.conf <<'EOF'
; Start a new pool named 'acceptance-tests'.
; the variable $pool can we used in any directive and will be replaced by the
; pool name ('acceptance-tests' here)
[acceptance-tests]
user = bamboo
group = bamboo

listen = /run/php/$pool-fpm.sock
listen.owner = www-data
listen.group = www-data

pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3

php_value[memory_limit] = 128M
php_value[max_execution_time] = 240
php_value[variables_order] = EGPCS
php_value[post_max_size] = 32M
php_value[upload_max_filesize] = 32M
php_value[date.timezone] = UTC
php_value[max_input_vars] = 2000
php_value[always_populate_raw_post_data] = -1
EOF

# Grant access to MySQL
cat >/etc/mysql/grants.sql <<'EOF'
GRANT ALL ON `func\_%`.* to funcu@'%' IDENTIFIED BY 'funcp' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

cat >/etc/mysql/mariadb.conf.d/init-file.cnf <<'EOF'
[mysqld]
init-file=/etc/mysql/grants.sql
EOF

# git-cherry-pick
curl -Lo /usr/bin/gerrit-cherry-pick https://review.typo3.org/tools/bin/gerrit-cherry-pick
chmod +x /usr/bin/gerrit-cherry-pick
