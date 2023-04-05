#!/bin/bash
apt install git -y
apt install plank rofi -y
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi ; ./setup.sh ; cd

rm ~/.config/rofi/config.rasi
~/.local/share/icons/menu.png
mkdir -p ~/.config/autostart
