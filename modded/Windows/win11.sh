#/bin/bash
apt install git gedit rofi -y
apt install xfce4-panel-profiles xfce4-appmenu-plugin -y
   wget https://github.com/wahasa/Ubuntu/blob/main/modded/Windows/Icons-Win11.zip?raw=true -O Icons-Win11.zip ; unzip Icons-Win11.zip ; mv Windows-11 /usr/share/icons/
   git clone https://github.com/B00merang-Project/Windows-10-Fluent Windows-11 ; mv Windows-11 /usr/share/themes/
   git clone https://github.com/B00merang-Project/Windows-10-Fluent-Dark Windows-11-Dark ; mv Windows-11-Dark /usr/share/themes/
   wget https://github.com/wahasa/Ubuntu/raw/main/modded/Windows/Win11-1.jpg -P /usr/share/backgrounds/
   wget https://github.com/wahasa/Ubuntu/raw/main/modded/Windows/Win11-2.jpg -P /usr/share/backgrounds/
rm Icons-Win11.zip

#Rofi
#git clone --depth=1 https://github.com/adi1090x/rofi.git
#cd rofi ; ./setup.sh ; cd
rm ~/.config/rofi/config.rasi
rm ~/.config/rofi/launchers/type-3/launcher.sh
rm ~/.config/rofi/launchers/type-3/style-1.rasi
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/launcher.sh -P ~/.config/rofi/launchers/type-3/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/Windows/style-1.rasi -P ~/.config/rofi/launchers/type-3/
chmod +x ~/.config/rofi/launchers/type-3/launcher.sh
rm -rf rofi

#Panel
mkdir -p ~/.local/share/xfce4-panel-profiles
wget https://github.com/wahasa/Ubuntu/raw/main/modded/Windows/Win-11.tar.bz2 
mv ~/Win-11.tar.bz2 ~/.local/share/xfce4-panel-profiles/
sleep 2

dbus-launch xfce4-panel-profiles load ~/.local/share/xfce4-panel-profiles/Win-11.tar.bz2

sleep 2
vnc-start ; sleep 5 ; vnc-stop

#theme
   echo ""
   echo "Please wait,."
   echo ""
sleep 2
dbus-launch xfconf-query -c xfce4-desktop -np '/desktop-icons/style' -t 'int' -s '0'
sleep 2
dbus-launch xfconf-query -c xsettings -p /Net/ThemeName -s "Windows-11-Dark"
sleep 2
dbus-launch xfconf-query -c xfwm4 -p /general/theme -s "Windows-11-Dark"
sleep 2
dbus-launch xfconf-query -c xsettings -p /Net/IconThemeName -s "Windows-11"
sleep 2
dbus-launch xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Default"
sleep 2
dbus-launch xfconf-query -c xfwm4 -p /general/show_dock_shadow -s true
sleep 2
dbus-launch xfconf-query -c xfce4-desktop -p $(dbus-launch xfconf-query -c xfce4-desktop -l | grep last-image) -s /usr/share/backgrounds/Win11-1.jpg
sleep 2
#rm modded.sh
