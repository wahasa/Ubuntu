#!/bin/bash
tarball="code_1.77.3.deb"
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
      wget "https://az764295.vo.msecnd.net/stable/704ed70d4fd1c6bd6342c436f1ede30d1cff4710/code_1.77.3-1681291917_${archurl}.deb" -O $tarball
      wget "https://az764295.vo.msecnd.net/stable/704ed70d4fd1c6bd6342c436f1ede30d1cff4710/code_1.77.3-1681295476_${archurl}.deb" -O $tarball
      wget "https://az764295.vo.msecnd.net/stable/704ed70d4fd1c6bd6342c436f1ede30d1cff4710/code_1.77.3-1681292746_${archurl}.deb" -O $tarball
apt install ~/$tarball
rm /usr/share/applications/code.desktop

wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/code.desktop -P /usr/share/applications/

rm $tarball
rm vscodefix.sh
