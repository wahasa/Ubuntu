#!/bin/bash
apt install git -y
apt install plank rofi -y

#Rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi ; ./setup.sh ; cd
rm ~/.config/rofi/config.rasi
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/launcher.sh -P ~/.config/rofi/launchers/type-3/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/style-1.rasi -P ~/.config/rofi/launchers/type-3/
rm rofi

#Plank
mkdir -p ~/.config/autostart
wget -q https://github.com/wahasa/Ubuntu/raw/main/modded/ubuntu/menu.png -P ~/.local/share/icons/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/plank.desktop -P ~/.config/autostart/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/rofi-launcher.desktop -P /usr/share/applications/
wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/modded/ubuntu/launcher/plank-preferences.desktop -P /usr/share/applications/
