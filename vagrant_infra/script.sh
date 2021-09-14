#!/usr/bin/env bash

# Garantindo as chaves
KEY_PATH="/vagrant/files"
mkdir -p /root/.ssh
cp $KEY_PATH/id_rsa /root/.ssh/id_rsa
cp $KEY_PATH/id_rsa.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/id_rsa.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

#HOST_IP="192.168.56.3"

# Garantindo os hosts
echo '192.168.56.10 node1.lab' >> /etc/hosts
echo '192.168.56.20 node2.lab' >> /etc/hosts
echo '192.168.56.30 node3.lab' >> /etc/hosts

# Criando arquivo de SWAP 
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo -e "/swapfile swap swap defaults 0 0" >> /etc/fstab
swapon -a