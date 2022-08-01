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

* Install Ubuntu-xfce

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/de-ubuntu-xfce.sh && chmod +x de-ubuntu-xfce.sh && ./de-ubuntu-xfce.sh
```

* Install Ubuntu-lxde

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/de-ubuntu-lxde.sh && chmod +x de-ubuntu-lxde.sh && ./de-ubuntu-lxde.sh
```

2. Start Ubuntu

```
./ubuntu
```

3. Stop Ubuntu

```
exit
```

---------

> Original site on [Andronix](https://github.com/AndronixApp/AndronixOrigin)

---------
- [x] Sound bug fix
- [x] Browser bug fix

Visit problem Ubuntu in : [Issues](https://github.com/wahasa/Ubuntu/issues/1)

-----------

## VNC Viewer

* Start VNC Server

on Ubuntu, run this command to start :

```
vncserver
```

Or
```
vncserver localhost:1
```

* Open Vnc Viewer

Add (+) VNC Client to connect, fill with :

Address
> 127.0.0.1:5901

Or

> localhost:1

Name
> Ubuntu 22

To disconnect VNC Client, click (X) on the right.

* Stop VNC Server

on Ubuntu, run this command to stop :

```
vncserver-stop
```

-------------
