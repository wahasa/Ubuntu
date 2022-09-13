#!/bin/bash

cd /etc/apt
cp sources.list /root
cd

#echo "Adding Debian repo for Chromium installation"

echo "deb http://ftp.debian.org/debian bullseye main
deb http://ftp.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605c66f00d6c9793
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 73a4f27b8dd47936
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys a48449044aad5c5d
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4dfab270caa96dfa
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys eda0d2388ae22ba9

apt update && apt upgrade -y
sudo apt install firefox-esr -y

#sudo apt install chromium -y
#sed -i 's/chromium %U/chromium --no-sandbox --test-type %U/g' /usr/share/applications/chromium.desktop

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/
