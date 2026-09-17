#!/bin/bash
# ==== NODE LAIN (ROUTER) ====


cat >> /etc/network/interfaces <<EOF
auto eth0
iface eth0 inet dhcp
EOF
ifup eth0

sysctl -w net.ipv4.ip_forward=1

echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# [Soal 4] 
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# [Soal 4] 
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# [Soal 5]
cat > /root/cek_status.sh <<'SCRIPT'
#!/bin/bash
echo "==============================="
echo " STATUS INTERFACE (ip -br a)"
echo "==============================="
ip -br a

echo ""
echo "==============================="
echo " STATUS NAT TABLE (iptables)"
echo "==============================="
iptables -t nat -L -v -n
SCRIPT

chmod +x /root/cek_status.sh
echo "[OK] cek_status.sh dibuat di /root/"


# ==== NODE ALICE ====
# [Soal 1] 
ip addr add 192.168.1.2/24 dev eth0
ip route add default via 192.168.1.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf


# ==== NODE MIKA ====
# [Soal 1] 
ip addr add 192.168.1.3/24 dev eth0
ip route add default via 192.168.1.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf


# ==== NODE CHISA ====
# [Soal 1] 
ip addr add 192.168.2.2/24 dev eth0
ip route add default via 192.168.2.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf


# ==== NODE KNIGHTS ====
# [Soal 1] 
ip addr add 192.215.3.2/24 dev eth0
ip route add default via 192.215.3.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf


# ==== NODE EIRI ====
# [Soal 1] Set IP statis Eiri
ip addr add 192.215.3.3/24 dev eth0
ip route add default via 192.215.3.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf
