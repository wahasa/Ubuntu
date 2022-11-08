#!/bin/bash

#Get the necessary components
apt-get update
apt-get install udisks2 -y
echo " " > /var/lib/dpkg/info/udisks2.postinst
apt-mark hold udisks2
apt-get install sudo tzdata -y
apt-get install ubuntu-mate-desktop mate-desktop-environment mate-terminal -y
apt-get install tigervnc-standalone-server dbus-x11 -y
apt-get --fix-broken install
apt-get clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
export XKL_XMODMAP_DISABLE=1

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources

xsetroot -solid grey
x-window-manager &
mate-session &" > ~/.vnc/xstartup
echo "#!/bin/sh
rm -rf /run/dbus/pid
dbus-daemon --system
dbus-launch
DISPLAY=:1 $HOME/.vnc/xstartup" > /usr/local/bin/vncstart
echo "vncserver -geometry 1600x900 -name remote-desktop :1" > /usr/local/bin/vnc-start
echo "vncserver -kill :1" > /usr/local/bin/vnc-stop
clear
chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vncstart
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop

echo " "
echo "Installing browser,.."
echo " "
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/browserfix.sh && chmod +x browserfix.sh && ./browserfix.sh
clear
echo " "
echo "Vnc Server address will run at 127.0.0.1:5901"
echo " "
echo "In Termux"
echo "Start Vnc Server, run vncstart"
echo "Stop  Vnc Server, run vncstop"
echo " "
echo "In Linux"
echo "Start Vnc, run vncstart"
echo "Exit  Vnc, run ctrl+c"
echo " "

rm browserfix.sh
rm de-mate.sh

vnc-start
