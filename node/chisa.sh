#!/bin/bash

# ---- SETUP NODE ----
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
  address 192.215.2.2
  netmask 255.255.255.0
  gateway 192.215.2.1
EOF

grep -q "nameserver 8.8.8.8" /etc/resolv.conf || echo "nameserver 8.8.8.8" >> /etc/resolv.conf

apt update
which ftp &>/dev/null || apt install -y vsftpd
which telnetd &>/dev/null || apt install -y telnetd

mkdir -p /var/wired/data
useradd -m -d /var/wired/data alice
passwd alice
chown alice:alice /var/wired/data
chmod 755 /var/wired/data

useradd -m -d /var/wired/data mika

useradd -m -d /var/wired/data eiri
passwd eiri
echo "eiri" >> /etc/vsftpd.userlist

cat <<EOF > /etc/vsftpd.conf
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
user_sub_token=\$USER
local_root=/var/wired/data
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=YES
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
chown_uploads=NO
chmod_enable=YES
EOF

service vsftpd restart

adduser phantom_user
service telnetd restart