#!/bin/bash
mv /etc/apt/sources.list /etc/apt/sources.list.bak
  echo " "
  echo "Add Debian repo for Firefox installation,.."
  echo " "

wget https://ftp.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2025.1_all.deb
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/passwd -P .vnc/

echo "deb http://ftp.debian.org/debian stable main" > /etc/apt/sources.list
sudo apt install ~/debian-archive-keyring_2025.1_all.deb

apt update ; sudo apt install firefox-esr -y

vncserver
sleep 2
DISPLAY=:1 firefox &
sleep 10
pkill -f firefox
vncserver -kill :*
sleep 2

wget -O $(find ~/.mozilla/firefox -name *.default-esr)/user.js https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/user.js

echo"" > /etc/apt/sources.list
rm .vnc/passwd
rm firefoxfix.sh
