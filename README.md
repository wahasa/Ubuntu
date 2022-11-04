
<p align="center">My Channel</br><b>
| <a href="https://discord.gg/GCehyym">Discord</a> | <a href="https://youtube.com/channel/UC3sLb7eZCu72iv3G1yUhUHQ">YouTube</a> |</b></p>

---
## Ubuntu on Termux Android

---
Warning :

Especially for Android 12 there are several bugs, and for more details, please read in Official [Termux](https://github.com/termux/termux-app).

---
• Install Apps on Android
- [x] [Termux](https://github.com/termux/termux-app/releases)
- [x] [Vnc Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

## Installation

Copy and paste this command to Termux :

> pkg update && pkg upgrade


1. Install Ubuntu
* [Ubuntu 22.10 (Kinetic)](https://youtu.be/PmRJ2mLLh4U)

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/install-ubuntu.sh && chmod +x install-ubuntu.sh && ./install-ubuntu.sh
```
* Ubuntu 22.04 (Jammy)
```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/22.04/install-ubuntu.sh && chmod +x install-ubuntu.sh && ./install-ubuntu.sh
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

4. [Desktop Environment](https://github.com/wahasa/Ubuntu/issues/7)

on Ubuntu, run this command :

> apt update && apt upgrade

* [Install Desktop-xfce](https://youtu.be/yMxE2uq2hz8)

```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-xfce.sh && chmod +x de-xfce.sh && ./de-xfce.sh
```

* [Install Desktop-lxde](https://youtu.be/SMHOkW3cv80)
```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxde.sh && chmod +x de-lxde.sh && ./de-lxde.sh
```

* [Install Desktop-lxqt](https://youtu.be/JAfoc3zvlXc)

```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxqt.sh && chmod +x de-lxqt.sh && ./de-lxqt.sh
```

* [Install Desktop-kde](https://youtu.be/ZpJSMWh9y8c)
```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-kde.sh && chmod +x de-kde.sh && ./de-kde.sh
```

* Install Desktop-cinnamon
> In the process,.

* Install Desktop-ukui
> In the process,.

* Install Desktop-mate
> In the process,.

* Install Desktop-gnome
> In the process,.

---
Note :
- [x] Soundfix
- [x] Browserfix
- [x] Install Chromium [Click here](https://github.com/wahasa/Ubuntu/issues/6#issuecomment-1243252084)
- [x] Install Libre Office [Click here](https://github.com/wahasa/Ubuntu/issues/6#issuecomment-1243256188)

Visit problem now in : [Issues](https://github.com/wahasa/Ubuntu/issues)

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
Ubuntu 22
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


