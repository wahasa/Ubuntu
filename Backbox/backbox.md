### Backbox 8 (Jammy Jellyfish)

* Install Ubuntu
```
pkg install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/ubuntu22.04.sh ; chmod +x ubuntu22.04.sh ; ./ubuntu22.04.sh
```

* Add Repo Backbox
```
apt install wget gnupg gnupg1 gnupg2 -y
```

```
echo "deb https://ppa.launchpadcontent.net/backbox/eight/ubuntu jammy main" >> /etc/apt/sources.list
```

```
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 680E1A5A78A7ABE1
```

```
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/
```

```
cp /etc/skel/.bashrc ~/
```
