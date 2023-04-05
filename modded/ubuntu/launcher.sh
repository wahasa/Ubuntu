#!/bin/bash
apt install git -y
apt install plank rofi -y
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi ; ./setup.sh ; cd

rm ~/.config/rofi/config.rasi
wget -q https://github.com/wahasa/Ubuntu/raw/main/modded/ubuntu/menu.png -P ~/.local/share/icons/
mkdir -p ~/.config/autostart
