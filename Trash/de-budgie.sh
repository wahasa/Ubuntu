#!/bin/bash
#Get the necessary components
apt-get update
apt-get install udisks2 -y
echo " " > /var/lib/dpkg/info/udisks2.postinst
apt-mark hold udisks2
apt-get install sudo tzdata -y
apt-get install budgie-desktop gnome-session-flashback gnome-terminal -y
apt-get install tigervnc-standalone-server dbus-x11 -y
apt-get --fix-broken install
apt-get clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
metacity
budgie-panel
gnome-flashback" > ~/.vnc/xstartup

echo "#!/bin/sh
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
rm -rf /run/dbus/dbus.pid
metacity &
budgie-panel &
gnome-flashback &" > /usr/local/bin/vncstart
   echo "vncserver -geometry 1600x900 -name remote-desktop :1" > /usr/local/bin/vnc-start
   echo "vncserver -kill :*" > /usr/local/bin/vnc-stop
   chmod +x ~/.vnc/xstartup
   chmod +x /usr/local/bin/*
   clear
   echo ""
   echo "Installing Browser,.."
   echo ""
#Browser Fix
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/browserfix.sh ; chmod +x browserfix.sh ; ./browserfix.sh
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/libreofficefix.sh ; chmod +x libreofficefix.sh ; ./libreofficefix.sh
   clear
   echo ""
   echo "In Termux"
   echo "Start Vnc Server, run vncstart"
   echo "Stop  Vnc Server, run vncstop"
   echo ""
   echo "In Linux"
   echo "Start Vnc, run vncstart"
   echo "Exit  Vnc, run ctrl+c"
   echo ""
rm browserfix.sh
rm de-budgie.sh
