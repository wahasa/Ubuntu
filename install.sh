#!/bin/bash
rm ../usr/bin/Install*
wget -P https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/Install ../usr/bin/
chmod +x ../usr/bin/Install
  echo ""
  echo "Installation successful,."
  echo ""
rm ../usr/bin/Install.*
clear
Install
rm install.sh
