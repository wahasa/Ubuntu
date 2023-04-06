#!/bin/bash
clear
cp /etc/apt/sources.list ~/
  echo " "
  echo "Add Debian repo for Chromium installation,.."
  echo " "
echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 605C66F00D6C9793
apt update
apt install chromium -y

sed -i 's/chromium %U/chromium --no-sandbox --test-type %U/g' /usr/share/applications/chromium.desktop

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/

rm chromiumfix.sh
