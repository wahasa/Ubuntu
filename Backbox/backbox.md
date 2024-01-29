### Backbox 8 (Jammy Jellyfish)

* Install Ubuntu
```
pkg install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/ubuntu22.04.sh ; chmod +x ubuntu22.04.sh ; ./ubuntu22.04.sh
```

* Add Repo Backbox
```
nano /etc/apt/sources.list
```
```
deb https://ppa.launchpadcontent.net/backbox/eight/ubuntu jammy main
```
