#! /bin/bash

sudo apt update && sudo apt install default-jre macchanger python3-pip dialog figlet -y
cd ~/Downloads && wget https://download.i2p2.no/releases/2.1.0/i2pinstall_2.1.0.jar
java -jar i2pinstall_2.1.0.jar #i2p'yi /home/kullanici/i2p/ adresine kur
sudo rm -rf /etc/resolv.conf && sudo touch /etc/resolv.conf
sudo bash -c "echo 9.9.9.9 > /etc/resolv.conf"
sudo bash -c "echo 149.112.112.112 >> /etc/resolv.conf"
sudo chattr +i /etc/resolv.conf
sudo /sbin/ifconfig wlan0 down
sudo macchanger -r wlan0
sudo /sbin/ifconfig wlan0 up
sudo systemctl restart NetworkManager
sudo pip3 install protonvpn-cli
sudo rm -rf /var/log/*
sudo rm -rf /var/tmp/*
cd ~/i2p && ./i2prouter start
rm -rf ~/Downloads/i2pinstall_2.1.0.jar
sudo protonvpn init #bu komut ile proton hesabinizi giriyorsunuz, daha sonra "sudo protonvpn c" komutu ile sunuculara baglaniyorsunuz.
figlet "ukendt79"
echo "successfull"
