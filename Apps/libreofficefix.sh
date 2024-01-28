#!/bin/bash
apt install libreoffice -y
rm -rf /usr/lib/libreoffice/program/oosplash

wget -q https://github.com/wahasa/Ubuntu/blob/main/Patch/oosplash?raw=true -O /usr/lib/libreoffice/program/oosplash

chmod +x /usr/lib/libreoffice/program/oosplash
mkdir /prod && mkdir /prod/version
  echo ""
  echo "Patch has been applied successfully"
  echo ""
rm libreofficefix.sh
