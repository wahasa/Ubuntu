#!/bin/bash

#Get the necessary components
apt-get update
apt-get install udisks2 -y
echo  " "  > /var/lib/dpkg/info/udisks2.postinst
apt-mark hold udisks2
apt-get install keyboard-configuration -y
apt-get install tzdata -y
apt-get install sudo -y
apt-get install kde-plasma-desktop konsole -y
apt-get install tigervnc-standalone-server dbus-x11 -y
ln -s /dev/null /etc/tmpfiles.d/journal-nocow.conf
export USER=root
apt-get --fix-broken install
apt-get clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
startplasma-x11" > ~/.vnc/xstartup
echo "vncserver -geometry 1600x900 -name remote-desktop :1 -xstartup" > /usr/local/bin/vnc-start
echo "vncserver -kill :1" > /usr/local/bin/vnc-stop
clear
chmod +x ~/.vnc/xstartup
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
echo "Start Vnc Server, run vnc-start"
echo " "
echo "Stop Vnc Server, run vnc-stop"
echo " "

rm browserfix.sh
rm de-kde.sh

vnc-start
