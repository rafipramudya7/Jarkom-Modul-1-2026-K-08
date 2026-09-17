#!/bin/bash
# ==== NODE MIKA (FTP CLIENT) ====


apt install -y ftp


ftp -n 192.168.2.2 <<'FTP_COMMANDS'
user mika mika123
get protokol_tujuh.txt /root/protokol_tujuh.txt
bye
FTP_COMMANDS



echo "test upload" > /root/test_upload_mika.txt

ftp -n 192.168.2.2 <<'FTP_COMMANDS'
user mika mika123
put /root/test_upload_mika.txt test_upload_mika.txt
bye
FTP_COMMANDS

