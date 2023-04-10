#!/bin/bash
tarball="code_1.77.1.deb"
case `uname -m` in
      aarch64)
           archurl="arm64" ;;
      arm)
           archurl="armhf" ;;
      x86)
           archurl="amd64" ;;
      x86_64)
           archurl="amd64" ;;
      *)
           echo "unknown architecture"; exit 1 ;;
      esac
      wget "https://az764295.vo.msecnd.net/stable/b7886d7461186a5eac768481578c1d7ca80e2d21/code_1.77.1-1680650472_${archurl}.deb" -O $tarball
      wget "https://az764295.vo.msecnd.net/stable/b7886d7461186a5eac768481578c1d7ca80e2d21/code_1.77.1-1680650504_${archurl}.deb" -O $tarball
      wget "https://az764295.vo.msecnd.net/stable/b7886d7461186a5eac768481578c1d7ca80e2d21/code_1.77.1-1680651665_${archurl}.deb" -O $tarball
apt install ~/$tarball
rm /usr/share/applications/code.desktop

wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/code.desktop -P /usr/share/applications/

rm $tarball
rm vscodefix.sh
