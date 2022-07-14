#!/bin/bash
#Get the necessary components
sudo apt update
sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
sudo apt install keyboard-configuration -y
sudo apt install tzdata -y
sudo apt install sudo wget nano -y
sudo apt install gnome tigervnc-standalone-server tigervnc-common dbus-x11 -y
sudo apt install xfe -y
sudo apt --fix-broken install
sudo apt clean

mkdir -p ~/.vnc
mkdir -p /usr/local/bin/vncserver-start
mkdir -p /usr/local/bin/vncserver-stop

echo '#!/bin/bash

xrdb $HOME/.Xresources startgnome &' > ~/.vnc/xstartup

echo '#!/usr/bin/env bash

export USER=root
export HOME=/root vncserver -name remote-desktop -localhost no :1' > /usr/local/bin/vncserver-start

echo '#!/usr/bin/env bash

export USER=root
export HOME=/root vncserver -kill :1

rm -rf /root/.vnc/localhost:1.pid
rm -rf /tmp/.X1-lock
rm -rf /tmp/.X11-unix/X1' > /usr/local/bin/vncserver-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

echo " "

echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Gnome Desktop Environment"
echo " "
echo " "
echo " "
echo "Running vncserver-start"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncserver-stop"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd
