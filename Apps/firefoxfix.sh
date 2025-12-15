#!/bin/bash
echo ""
echo "Add Debian repo for Firefox installation,.."
echo ""

mv /etc/apt/sources.list /etc/apt/sources.list.bak
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/passwd -P .vnc/
wget https://ftp.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2025.1_all.deb

sudo apt install ~/debian-archive-keyring_2025.1_all.deb
#echo "deb http://ftp.debian.org/debian stable main" > /etc/apt/sources.list
echo "#Modernized from /etc/apt/sources.list
Types: deb
URIs: http://ftp.debian.org/debian
Suites: stable
Components: main
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg" > /etc/apt/sources.list.d/firefox.sources

apt update ; sudo apt install firefox-esr -y

vncserver
sleep 2
DISPLAY=:1 firefox &
sleep 10
pkill -f firefox
vncserver -kill :*
sleep 2

wget -O $(find ~/.mozilla/firefox -name *.default-esr)/user.js https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/user.js

#mv /etc/apt/sources.list.bak /etc/apt/sources.list
rm .vnc/passwd ; rm 
