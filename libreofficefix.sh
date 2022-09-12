#!/bin/bash
sudo apt install libreoffice
rm -rf /usr/lib/libreoffice/program/oosplash

wget -q https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/oosplash?raw=true -O /usr/lib/libreoffice/program/oosplash

chmod +x /usr/lib/libreoffice/program/oosplash
mkdir /prod && mkdir /prod/version

#echo "Patch has been applied successfully"
rm libreofficefix.sh
