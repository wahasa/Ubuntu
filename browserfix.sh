#!/bin/bash

cd /etc/apt
cp sources.list /root
cd

echo "deb http://ftp.debian.org/debian bullseye main
deb http://ftp.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 605c66f00d6c9793
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 73a4f27b8dd47936
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys a48449044aad5c5d
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4dfab270caa96dfa

apt update && apt upgrade -y
sudo apt install firefox-esr -y

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/
