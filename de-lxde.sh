#!/bin/bash

#Get the necessary components
apt-get update
apt-get install udisks2 -y
echo  " "  > /var/lib/dpkg/info/udisks2.postinst
dpkg --configure -a
apt-mark hold udisks2
apt-get install keyboard-configuration -y
apt-get install tzdata -y
apt-get install sudo -y
apt-get install lxde lxde-core lxterminal -y
apt-get install tigervnc-standalone-server dbus-x11 -y
apt-get --fix-broken install
apt-get clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
startlxde" > ~/.vnc/xstartup
echo "vncserver -geometry 1600x900 -name remote-desktop :1 -xstartup" > /usr/local/bin/vnc-start
echo "vncserver -kill :1" > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop
clear

#wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/browserfix.sh && chmod +x browserfix.sh && ./browserfix.sh

clear
echo " "
echo "Vnc Server address will run at 127.0.0.1:5901"
echo " "
echo "Start Vnc Server, run vnc-start"
echo " "
echo "Stop Vnc Server, run vnc-stop"
echo " "
echo " "

rm browserfix.sh
rm de-lxde.sh

vncserver
