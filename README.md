## Ubuntu on Termux Android

---------
Warning :

Especially for Android 12 there are several bugs, and for more details, please read in Official [Termux](https://github.com/termux/termux-app).

---------
• Install Apps on Android
- [x] [Termux](https://github.com/termux/termux-app/releases)
- [x] [Vnc Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

## Installation

Copy and paste this command to Termux :

```
pkg update && pkg upgrade
```

1. Ubuntu 22.10 (Kinetic Kudu)
* Install Ubuntu

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/install-ubuntu.sh && chmod +x install-ubuntu.sh && ./install-ubuntu.sh
```

2. Desktop Environment

on Ubuntu, run this command :

```
apt update && apt upgrade
```

* Install Ubuntu-xfce

```
apt install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/de-xfce.sh && chmod +x de-xfce.sh && ./de-xfce.sh
```

> * Install Ubuntu-lxde

> * Install Ubuntu-lxqt

> * Install Ubuntu-kde


3. Start Ubuntu

```
ubuntu
```

4. Stop Ubuntu

```
exit
```

---------
- [x] Sound bug fix
- [x] Browser bug fix

Visit problem now in : [Issues](https://github.com/wahasa/Ubuntu/issues/5)

-----------

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

-------------
