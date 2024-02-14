#!/bin/bash
case `uname -m` in
      aarch64)
           archurl="arm64" ;;
      arm*)
           archurl="armhf" ;;
      x86_64)
           archurl="amd64" ;;
      *)
           echo "unknown architecture"; exit 1 ;;
      esac
      wget "https://vscode.download.prss.microsoft.com/dbazure/download/stable/8b3775030ed1a69b13e4f4c628c612102e30a681/code_1.85.2-1705560689_${archurl}.deb"
      wget "https://vscode.download.prss.microsoft.com/dbazure/download/stable/8b3775030ed1a69b13e4f4c628c612102e30a681/code_1.85.2-1705559800_${archurl}.deb"
      wget "https://vscode.download.prss.microsoft.com/dbazure/download/stable/8b3775030ed1a69b13e4f4c628c612102e30a681/code_1.85.2-1705561292_${archurl}.deb"
sleep 1
apt install ~/code*
rm /usr/share/applications/code.desktop

wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Patch/code.desktop -P /usr/share/applications/

rm code*
rm vscodefix.sh
