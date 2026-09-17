#!/bin/bash
# ==== NODE CHISA (TELNET SERVER) ====


apt update && apt install -y telnetd


adduser --gecos "" phantom_user <<'ADDUSER'
wired_ghost
wired_ghost
ADDUSER

# ==== NODE EIRI ====


apt install -y telnet


telnet 192.168.2.2
