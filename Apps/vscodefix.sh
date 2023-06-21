#!/bin/bash
case `uname -m` in
      aarch64)
           archurl="arm64" ;;
      arm*)
           archurl="armhf" ;;
      x86)
           archurl="amd64" ;;
      x86_64)
           archurl="amd64" ;;
      *)
           echo "unknown architecture"; exit 1 ;;
      esac
      wget "https://az764295.vo.msecnd.net/stable/695af097c7bd098fbf017ce3ac85e09bbc5dda06/code_1.79.2-1686733230_${archurl}.deb"
      wget "https://az764295.vo.msecnd.net/stable/695af097c7bd098fbf017ce3ac85e09bbc5dda06/code_1.79.2-1686733070_${archurl}.deb"
      wget "https://az764295.vo.msecnd.net/stable/695af097c7bd098fbf017ce3ac85e09bbc5dda06/code_1.79.2-1686734195_${archurl}.deb"
sleep 1
apt install ~/code*
rm /usr/share/applications/code.desktop

wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/code.desktop -P /usr/share/applications/

rm code*
rm vscodefix.sh
