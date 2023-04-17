#!/bin/bash
apt install git gedit plank rofi -y
apt install xfce4-panel-profiles xfce4-appmenu-plugin -y
apt install yaru-theme-gtk yaru-theme-icon ubuntu-wallpapers -y

#Rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi ; ./setup.sh ; cd
rm ~/.config/rofi/config.rasi
rm ~/.config/rofi/launchers/type-3/launcher.sh
rm ~/.config/rofi/launchers/type-3/style-1.rasi
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/launcher.sh -P ~/.config/rofi/launchers/type-3/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/style-1.rasi -P ~/.config/rofi/launchers/type-3/
chmod +x ~/.config/rofi/launchers/type-3/launcher.sh
rm -rf rofi

#Panel
mkdir -p ~/.local/share/xfce4-panel-profiles
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/config.txt
tar --sort=name --format ustar -cvjhf ubuntu.tar.bz2 config.txt
mv ~/ubuntu.tar.bz2 ~/.local/share/xfce4-panel-profiles/
sleep 2

dbus-launch xfce4-panel-profiles load ~/.local/share/xfce4-panel-profiles/ubuntu.tar.bz2

sleep 2
vnc-start ; sleep 5 ; vnc-stop
rm config.txt

#Plank
mkdir -p ~/.config/autostart
wget https://github.com/wahasa/Ubuntu/raw/main/modded/ubuntu/menu.png -P ~/.local/share/icons/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/plank.desktop -P ~/.config/autostart/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/rofi-launcher.desktop -P /usr/share/applications/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/plank-preferences.desktop -P /usr/share/applications/

mkdir -p ~/.config/plank/dock1
mkdir -p ~/.config/plank/dock1/launchers
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/firefox-esr.dockitem -P ~/.config/plank/dock1/launchers/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/rofi-launcher.dockitem -P ~/.config/plank/dock1/launchers/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/org.gnome.gedit.dockitem -P ~/.config/plank/dock1/launchers/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/plank-preferences.dockitem -P ~/.config/plank/dock1/launchers/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/org.gnome.Nautilus.dockitem -P ~/.config/plank/dock1/launchers/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/org.gnome.Terminal.dockitem -P ~/.config/plank/dock1/launchers/
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/dock.ini

cat ~/dock.ini | dbus-launch dconf load  /net/launchpad/plank/docks/dock1/

sleep 2
vnc-start ; sleep 5 ; vnc-stop
rm dock.ini

#theme
mkdir -p ~/.local/share/plank/themes
mkdir -p ~/.local/share/plank/themes/Azeny
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/dock.theme -P ~/.local/share/plank/themes/Azeny/
   echo ""
   echo "Please wait,."
   echo ""
sleep 2
dbus-launch xfconf-query -c xfce4-desktop -np '/desktop-icons/style' -t 'int' -s '0'
sleep 2
dbus-launch xfconf-query -c xsettings -p /Net/ThemeName -s "Yaru-magenta-dark"
sleep 2
dbus-launch xfconf-query -c xfwm4 -p /general/theme -s "Yaru-dark"
sleep 2
dbus-launch xfconf-query -c xsettings -p /Net/IconThemeName -s "Yaru-magenta-dark"
sleep 2
dbus-launch xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Yaru-dark"
sleep 2
dbus-launch xfconf-query -c xfwm4 -p /general/show_dock_shadow -s false
sleep 2
dbus-launch xfconf-query -c xfce4-desktop -p $(dbus-launch xfconf-query -c xfce4-desktop -l | grep last-image) -s /usr/share/backgrounds/warty-final-ubuntu.png
sleep 2
rm modded.sh
