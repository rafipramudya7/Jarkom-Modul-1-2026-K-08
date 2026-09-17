#!/bin/bash
# ==== NODE KNIGHTS (SSH SERVER) ====


apt update && apt install -y openssh-server


adduser --gecos "" mika_admin <<'ADDUSER'
mika_pass_sementara
mika_pass_sementara
ADDUSER


sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config


service ssh restart



# ==== NODE MIKA (SSH CLIENT) ====


adduser --gecos "" mika_admin <<'ADDUSER'
mika_pass_sementara
mika_pass_sementara
ADDUSER


su - mika_admin -c "
  # Generate SSH keypair 
  ssh-keygen -t rsa -b 2048 -N '' -f ~/.ssh/id_rsa

  cat ~/.ssh/id_rsa.pub
"



su - mika_admin -c "ssh -o StrictHostKeyChecking=no mika_admin@192.215.3.2 "

