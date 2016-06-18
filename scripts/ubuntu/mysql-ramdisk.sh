#!/bin/sh -eux

# Modify systemd unit to run MySQL on ramdisk
mkdir -p /etc/systemd/system/mysql.service.d
cat >/etc/systemd/system/mysql.service.d/override.conf <<'EOF'
[Service]
ExecStartPre=/bin/mount -t tmpfs -o size=512M tmpfs /var/lib/mysql
ExecStartPre=/bin/chmod 0755 /var/lib/mysql
ExecStartPre=/bin/chown -R mysql:mysql /var/lib/mysql
ExecStartPre=/usr/bin/mysql_install_db
ExecStopPost=/bin/umount -f /var/lib/mysql
EOF
