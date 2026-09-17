#!/bin/bash

# ==== QUEST 7 ====
ftp alice@192.215.2.2
# put signal_alice.txt

# ==== QUEST 12 ====
nc -z -v 192.215.3.2 22 80 7777

# ---- SETUP NODE ----
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
  address 192.215.1.2
  netmask 255.255.255.0
  gateway 192.215.1.1
EOF

grep -q "nameserver 8.8.8.8" /etc/resolv.conf || echo "nameserver 8.8.8.8" >> /etc/resolv.conf

apt update
which ftp &>/dev/null || apt install -y ftp