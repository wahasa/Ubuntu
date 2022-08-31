#!/bin/bash

#Get the necessary components
apt-get update
apt-get install sudo -y
sudo apt-get install udisks2 -y
sudo apt-mark hold udisks2
sudo apt-get install keyboard-configuration -y
sudo apt-get install tzdata -y
sudo apt-get install xfce4 xfce4-goodies xfce4-terminal -y
sudo apt-get tigervnc-standalone-server dbus-x11 -y
sudo apt-get clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
startxfce4" > ~/.vnc/xstartup
echo "vncserver -geometry 1600x900 -name remote-desktop :1 -xstartup" > /usr/local/bin/vnc-start
echo "vncserver -kill :1" > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop

echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo " "
echo "Start Vnc Server, run vnc-start"
echo " "
echo " "
echo "Stop Vnc Server, run vnc-stop"
echo " "
echo " "

vncserver
