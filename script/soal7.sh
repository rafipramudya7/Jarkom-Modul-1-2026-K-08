# ==== NODE CHISA (FTP SERVER) ====


apt update && apt install -y vsftpd


mkdir -p /var/wired/data


useradd -m -d /var/wired/data alice
echo "alice:alice123" | chpasswd
chown alice:alice /var/wired/data
chmod 755 /var/wired/data


useradd -m -d /var/wired/data mika
echo "mika:mika123" | chpasswd



useradd -m eiri
echo "eiri:eiri123" | chpasswd
echo "eiri" >> /etc/vsftpd.userlist


cat > /etc/vsftpd.conf <<'EOF'
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
user_sub_token=$USER
local_root=/var/wired/data
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=YES
chown_uploads=NO
chmod_enable=YES
EOF

service vsftpd restart
echo "[OK] FTP Server Chisa aktif"


# ==== NODE ALICE ====

#!/bin/bash
apt install -y ftp


ftp -n 192.168.2.2 <<'FTP_COMMANDS'
user alice alice123
put /dev/stdin signal_alice.txt <<< "Hello from Alice"
ls
bye
FTP_COMMANDS


# ==== NODE EIRI ====


apt install -y ftp


ftp -n 192.168.2.2 <<'FTP_COMMANDS'
user eiri eiri123
bye
FTP_COMMANDS
