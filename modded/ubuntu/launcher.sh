#!/bin/bash
apt install git -y
apt install plank rofi -y

#Rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi ; ./setup.sh ; cd
rm ~/.config/rofi/config.rasi
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/launcher.sh -P ~/.config/rofi/launchers/type-3/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/style-1.rasi -P ~/.config/rofi/launchers/type-3/
rm rofi

#Panel
mkdir -p ~/.local/share/xfce4-panel-profiles
wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/config.txt
tar --sort=name --format ustar -cvjhf ubuntu.tar.bz2 config.txt
mv ~/ubuntu.tar.bz2 ~/.local/share/xfce4-panel-profiles/
dbus-launch xfce4-panel-profiles load ~/.local/share/xfce4-panel-profiles/ubuntu.tar.bz2
rm config.txt

#Plank
mkdir -p ~/.config/autostart
wget -q https://github.com/wahasa/Ubuntu/raw/main/modded/ubuntu/menu.png -P ~/.local/share/icons/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/plank.desktop -P ~/.config/autostart/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/rofi-launcher.desktop -P /usr/share/applications/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/plank-preferences.desktop -P /usr/share/applications/
mkdir -p ~/.config/plank/dock1
mkdir -p ~/.config/plank/dock1/launchers
wget -q -P ~/.config/plank/dock1/launchers/
wget -q -P ~/.config/plank/dock1/launchers/
wget -q -P ~/.config/plank/dock1/launchers/
wget -q -P ~/.config/plank/dock1/launchers/
wget -q -P ~/.config/plank/dock1/launchers/
wget -q -P ~/.config/plank/dock1/launchers/

#theme
mkdir -p ~/.local/share/plank/themes
mkdir -p ~/.local/share/plank/themes/Azeny
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/theme/dock.theme -P ~/.local/share/plank/themes/Azeny/

