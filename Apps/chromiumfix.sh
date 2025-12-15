#!/bin/bash
echo ""
echo "Add Mozilla repo for Firefox installation,.."
#echo "Add Mozilla repo for Thunderbird installation,.."
echo ""

#sudo apt install software-properties-common -y
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update

#Firefox Browser
sudo apt install firefox-esr -y 

#Thunderbird
#sudo apt install thunderbird -y

rm
