
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

1. Ubuntu 22.10 (Kinetic Kudu)
* Install Ubuntu-cli

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/22.10/install-ubuntu && chmod +x install-ubuntu && ./install-ubuntu cli
```

* Install Ubuntu-xfce

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/22.10/install-ubuntu && chmod +x install-ubuntu && ./install-ubuntu xfce
```

* Install Ubuntu-lxde

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/22.10/install-ubuntu && chmod +x install-ubuntu && ./install-ubuntu lxde
```

2. Ubuntu 22.04 (Jammy Jellyfish)
* Install Ubuntu-cli

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/22.04/install-ubuntu && chmod +x install-ubuntu && ./install-ubuntu cli
```

* Install Ubuntu-xfce

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/22.04/install-ubuntu && chmod +x install-ubuntu && ./install-ubuntu xfce
```

* Install Ubuntu-lxde

```
pkg install wget -y && wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/22.04/install-ubuntu && chmod +x install-ubuntu && ./install-ubuntu lxde
```

3. Start Ubuntu

```
./ubuntu
```

4. Stop Ubuntu

```
exit
```

=> Visit original site on [Andronix](https://github.com/AndronixApp/AndronixOrigin)

-----------
- [x] Sound
- [x] Chromium

Visit problem bug Ubuntu in : [Issues](https://github.com/wahasa/Ubuntu/issues/1)

-----------

## VNC Viewer

* Start VNC Server

on Ubuntu, run this command to start :

```
vncserver
```

* Open Vnc Viewer

Add (+) VNC Client to connect, fill with :

Address
> 127.0.0.1:5901

Name
> UUbuntu 22

To disconnect VNC Client, click (X) on the right.

* Stop VNC Server

on Ubuntu, run this command to stop :

```
vncserver-stop
```
-------------

