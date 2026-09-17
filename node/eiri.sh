#!/bin/bash

# ==== QUEST 11 ====
telnet 192.215.3.2
# login: phantom_user / wired_ghost

# ---- SETUP NODE ----
cat <<EOF > /etc/network/interfaces
auto eth0
iface eth0 inet static
  address 192.215.3.3
  netmask 255.255.255.0
  gateway 192.215.3.1
EOF

grep -q "nameserver 8.8.8.8" /etc/resolv.conf || echo "nameserver 8.8.8.8" >> /etc/resolv.conf

apt update
which telnet &>/dev/null || apt install -y telnet