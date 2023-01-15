
<p align="center">My Channel</br><b>
| <a href="https://discord.gg/GCehyym">Discord</a> | <a href="https://youtube.com/channel/UC3sLb7eZCu72iv3G1yUhUHQ">YouTube</a> |</b></p>

---
## Ubuntu on Termux Android

---
Announcement :

For Android 12 problems in [Termux v0.119.1](https://apkcombo.com/id/termux/com.termux) it has been fixed.

---
• Install Apps on Android
- [x] [Termux](https://apkcombo.com/id/termux/com.termux)
- [x] [Vnc Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

## Installation

Copy and paste this command to Termux :

> pkg update && pkg upgrade


1. Install Ubuntu

* [Ubuntu 23.04 (Lunar)](https://youtu.be/8mnytrMVHOw)
```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Project/main/Linux/Ubuntu/ubuntu23.04.sh && chmod +x ubuntu23.04.sh && ./ubuntu23.04.sh
```

* [Ubuntu 22.10 (Kinetic)](https://youtu.be/PmRJ2mLLh4U)
```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Project/main/Linux/Ubuntu/ubuntu22.10.sh && chmod +x ubuntu22.10.sh && ./ubuntu22.10.sh
```

2. Start Ubuntu
```
ubuntu
```

3. Stop Ubuntu
```
exit
```

---
Basic commands
> apt update

> apt upgrade

> apt search (pkg)

> apt install (pkg)

> apt autoremove (pkg)

---
## [Desktop Environment](https://github.com/wahasa/Ubuntu/issues/7)

on Ubuntu, run this command :
> apt update && apt upgrade

* [Install Desktop Xfce](https://youtu.be/yMxE2uq2hz8)
```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-xfce.sh && chmod +x de-xfce.sh && ./de-xfce.sh
```

* [Install Desktop Lxde](https://youtu.be/SMHOkW3cv80)
```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxde.sh && chmod +x de-lxde.sh && ./de-lxde.sh
```

* [Install Desktop Lxqt](https://youtu.be/JAfoc3zvlXc)
```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxqt.sh && chmod +x de-lxqt.sh && ./de-lxqt.sh
```

* [Install Desktop Kde-plasma](https://youtu.be/ZpJSMWh9y8c)
```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-kde.sh && chmod +x de-kde.sh && ./de-kde.sh
```

* More List Desktop [Click here,.](https://github.com/wahasa/Ubuntu/issues/10)

---
Note :
- [x] Sound fix
- [x] Browser fix
- [x] Install Chromium [Click here,.](https://github.com/wahasa/Ubuntu/issues/6#issuecomment-1243252084)
- [x] Install LibreOffice [Click here,.](https://github.com/wahasa/Ubuntu/issues/6#issuecomment-1243256188)

Visit problems now in : [Issues](https://github.com/wahasa/Ubuntu/issues)

---
## VNC Viewer

1. Start VNC Server

on Ubuntu, run this command to start :
```
vnc-start
```

2. Open Vnc Viewer

Add (+) VNC Client to connect, fill with :

Address
```
localhost:1
```

Name
```
Ubuntu Desktop
```

To disconnect VNC Client, click (X) on the right.

3. Stop VNC Server

on Ubuntu, run this command to stop :
```
vnc-stop
```

</br>

---
<p align="center">Good Luck</p>

---
