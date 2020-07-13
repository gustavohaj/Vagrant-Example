    # Garantindo as chaves
    KEY_PATH='/vagrant/files'
    mkdir -p /root/.ssh
    cp $KEY_PATH/key /root/.ssh/id_rsa
    cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
    cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
    chmod 400 /root/.ssh/id_rsa*
    cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

    HOST_IP="200.100.50"


    # Garantindo os hosts
    HOSTS=$(head -n7 /etc/hosts)
    echo -e "$HOSTS" > /etc/hosts
    echo '200.100.50.10 worker01.4labs.example' >> /etc/hosts
    echo '200.100.50.20 worker02.4labs.example' >> /etc/hosts
    echo '200.100.50.30 manager01.4labs.example' >> /etc/hosts
    echo '200.100.50.40 monitoring.4labs.example' >> /etc/hosts
    echo '200.100.50.50 registry.4labs.example' >> /etc/hosts

    # Garantindo q o usuario suporte esteja presente
    sudo adduser suporte
    #usermod -aG wheel suporte

    # Criando arquivo de SWAP 
    fallocate -l 1G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    echo -e "/swapfile swap swap defaults 0 0" >> /etc/fstab
    swapon -a

    # for Centos
    # sudo -i
    # adduser suporte
    # usermod -aG wheel suporte
    # passwd suporte