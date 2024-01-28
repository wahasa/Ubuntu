#!/bin/bash
clear
cp /etc/apt/sources.list ~/
  echo " "
  echo "Add Debian repo for Firefox installation,.."
  echo " "

wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/passwd -P .vnc/

echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 605C66F00D6C9793

apt update ; apt install firefox-esr -y

vnc-start
sleep 5
DISPLAY=:1 firefox &
sleep 10
pkill -f firefox
vnc-stop
sleep 2

wget -O $(find ~/.mozilla/firefox -name *.default-esr)/user.js https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/user.js

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/
rm .vnc/passwd
rm firefoxfix.sh
