#!/bin/bash
#Get the necessary components
sudo apt update
sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo apt-mark hold udisks2
sudo apt install software-properties-common elementary-xfce-icon-theme -y
sudo apt install xfce4 xfce4-goodies xfce4-appmenu-plugin parole -y
sudo apt install tigervnc-standalone-server dbus-x11 -y
sudo apt --fix-broken install
sudo apt clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
service dbus start
startxfce4" > ~/.vnc/xstartup

echo "#!/bin/sh
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
rm -rf /run/dbus/dbus.pid
dbus-launch startxfce4" > /usr/local/bin/vncstart
   echo "vncserver -geometry 1600x900 remote-desktop :1 ; pkill vncconfig" > /usr/local/bin/vnc-start
   echo "vncserver -kill :* ; rm -rf /tmp/.X*-lock ; rm -rf /tmp/.X11-unix/X* ; rm -rf ~/.vnc/localhost:*.pid" > /usr/local/bin/vnc-stop
   chmod +x ~/.vnc/xstartup ; chmod +x /usr/local/bin/*
   clear
   echo ""
   echo "Installing Browser,.."
   echo ""
#Browser Fix
   clear
   echo ""
   echo "Vnc Server address will run at 127.0.0.1:5901"
   echo "Start Vnc Server, run vnc-start"
   echo "Stop  Vnc Server, run vnc-stop"
   echo ""
rm de-xfce.sh
