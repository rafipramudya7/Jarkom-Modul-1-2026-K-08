#!/bin/bash
# ==== NODE KNIGHTS ====


apt install -y openssh-server
service ssh start


apt install -y nginx
service nginx start



# ==== NODE ALICE====


apt install -y netcat-openbsd



echo "=== Scan port 22 (SSH - seharusnya terbuka) ==="
nc -z -v 192.215.3.2 22

echo "=== Scan port 80 (HTTP - seharusnya terbuka) ==="
nc -z -v 192.215.3.2 80

echo "=== Scan port 7777 (rahasia - seharusnya tertutup) ==="
nc -z -v 192.215.3.2 7777
