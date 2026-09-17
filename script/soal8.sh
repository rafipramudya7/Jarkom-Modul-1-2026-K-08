#!/bin/bash
# ==== NODE KNIGHTS (FTP CLIENT) ====


apt install -y ftp


wget -O /root/intel_report.txt "https://drive.google.com/..." --no-check-certificate


ftp -n 192.168.2.2 <<'FTP_COMMANDS'
user alice alice123
passive
put /root/intel_report.txt intel_report.txt
ls
bye
FTP_COMMANDS
