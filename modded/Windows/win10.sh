#/bin/bash
apt install git gedit plank rofi -y
apt install xfce4-panel-profiles xfce4-appmenu-plugin -y
   git clone https://github.com/B00merang-Artwork/Windows-10 ; mv Windows-10 /usr/share/icons/
   git clone https://github.com/B00merang-Project/Windows-10 ; mv Windows-10 /usr/share/themes/
   git clone https://github.com/B00merang-Project/Windows-10-Dark ; mv Windows-10-Dark /usr/share/themes/
   wget https://github.com/wahasa/Ubuntu/raw/main/modded/Windows/Win10-1.jpg -P /usr/share/backgrounds/
   wget https://github.com/wahasa/Ubuntu/raw/main/modded/Windows/Win10-2.jpg -P /usr/share/backgrounds/

#Panel
mkdir -p ~/.local/share/xfce4-panel-profiles
wget https://github.com/wahasa/Ubuntu/raw/main/modded/Windows/Win-10.tar.bz2 
mv ~/Win-10.tar.bz2 ~/.local/share/xfce4-panel-profiles/

dbus-launch xfce4-panel-profiles load ~/.local/share/xfce4-panel-profiles/Win-10.tar.bz2

sleep 2

#theme
   echo ""
   echo "Please wait,."
   echo ""
sleep 2
dbus-launch xfconf-query -c xfce4-desktop -np '/desktop-icons/style' -t 'int' -s '0'
sleep 2
dbus-launch xfconf-query -c xsettings -p /Net/ThemeName -s "Windows-10-Dark"
sleep 2
dbus-launch xfconf-query -c xfwm4 -p /general/theme -s "Windows-10-Dark"
sleep 2
dbus-launch xfconf-query -c xsettings -p /Net/IconThemeName -s "Windows-10"
sleep 2
dbus-launch xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Default"
sleep 2
dbus-launch xfconf-query -c xfwm4 -p /general/show_dock_shadow -s true
sleep 2
dbus-launch xfconf-query -c xfce4-desktop -p $(dbus-launch xfconf-query -c xfce4-desktop -l | grep last-image) -s /usr/share/backgrounds/Win10-1.jpg
sleep 2
#rm modded.sh
