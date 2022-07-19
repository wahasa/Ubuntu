#!/bin/bash

#Get the necessary components
sudo apt update -y
sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
sudo apt install keyboard-configuration -y
sudo apt install tzdata -y
sudo apt install wget nano -y
sudo apt install xfce4 xfce4-goodies xfce4-terminal tigervnc-standalone-server tigervnc-common dbus-x11 -y
sudo apt install xfe -y
sudo apt --fix-broken install
sudo apt clean

#Setup the necessary files
mkdir ~/.vnc
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/Xfce/xstartup -P ~/.vnc/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/Xfce/vncserver-start -P /usr/local/bin
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/Xfce/vncserver-stop -P /usr/local/bin

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

echo " "
echo " "
echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Xfce4 Desktop Environment"
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