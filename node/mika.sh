#!/bin/bash

# ==== QUEST 6 ====
wget -O traffic_generator.zip "linkdrive" --no-check-certificate
unzip traffic_generator.zip
./traffic_generator.sh

# ==== QUEST 9 ====
ftp mika@192.215.2.2

# ==== QUEST 13 ====
ssh-keygen
ssh-copy-id mika_admin@192.215.3.2
ssh mika_admin@192.215.3.2

# ---- SETUP NODE ----
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
  address 192.215.1.3
  netmask 255.255.255.0
  gateway 192.215.1.1
EOF

grep -q "nameserver 8.8.8.8" /etc/resolv.conf || echo "nameserver 8.8.8.8" >> /etc/resolv.conf

apt update
which ftp &>/dev/null || apt install -y ftp
which ssh &>/dev/null || apt install -y openssh-client

adduser mika_admin