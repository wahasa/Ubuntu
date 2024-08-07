
<p align="center">My Channel</br><b>
| <a href="https://discord.gg/GCehyym">Discord</a> | <a href="https://youtube.com/channel/UC3sLb7eZCu72iv3G1yUhUHQ">YouTube</a> |</b></p>

---
## Ubuntu on Termux Android

---
• Install Apps on Android
- [x] [Termux](https://play.google.com/store/apps/details?id=com.termux)
- [x] [Vnc Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

## Installation

Copy and paste this command to Termux :
> pkg update

<details><summary><b><code>Install Ubuntu</code></b></summary>

#### Ubuntu 24.10 (Pre-release)
Rootfs : Armhf, Arm64, Amd64
```
pkg install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/ubuntu24.10.sh ; chmod +x ubuntu24.10.sh ; ./ubuntu24.10.sh
```

#### Ubuntu 24.04 (Noble Numbat)
Rootfs : Armhf, Arm64, Amd64
```
pkg install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/ubuntu24.04.sh ; chmod +x ubuntu24.04.sh ; ./ubuntu24.04.sh
```

#### List Ubuntu | [Click Hare >](https://github.com/wahasa/Ubuntu/tree/main/Install)
</details>

---
* Start Ubuntu
```
ubuntu
```

* Stop Ubuntu
```
exit
```

* Remove Ubuntu
```
rm -rf ubuntu-fs .ubuntu $PREFIX/bin/ubuntu
```

---
Basic commands Ubuntu
> apt update : Update list package.</br>
> apt upgrade : Upgrade package.</br>
> apt search (pkg) : Search package.</br>
> apt install (pkg) : Install package.</br>
> apt autoremove (pkg) : Delete package.</br>
> apt -h : Help all commands.

---
## Desktop Environment

In Ubuntu, run this command :
> apt update ; apt upgrade

<details></br>
<summary><b><code>Install Desktop Xfce</code></b></summary>

![xfce](https://github.com/wahasa/Project/assets/69626847/8a5d72d8-d08b-491f-a209-80e2fa68786a)
```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-xfce.sh ; chmod +x de-xfce.sh ; ./de-xfce.sh
```
</details>

<details></br>
<summary><b><code>Install Desktop Lxde</code></b></summary>

![lxde](https://github.com/wahasa/Project/assets/69626847/d7e1579d-cd75-4151-832f-f869a892eeeb)
```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxde.sh ; chmod +x de-lxde.sh ; ./de-lxde.sh
```
</details>

<details></br>
<summary><b><code>Install Desktop Lxqt</code></b></summary>

![lxqt](https://github.com/wahasa/Project/assets/69626847/e6290702-c845-4a95-b555-65e27d36c234)
```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxqt.sh ; chmod +x de-lxqt.sh ; ./de-lxqt.sh
```
</details>

<details></br>
<summary><b><code>Install Desktop Kde</code></b></summary>

![kde](https://github.com/wahasa/Project/assets/69626847/efaf0ab7-2891-4314-bded-f9d9a25b4721)
```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-kde.sh ; chmod +x de-kde.sh ; ./de-kde.sh
```
</details>

---
Feature
- [x] Fixed Sound
- [x] Access to Sdcard
- [x] Fixed Browser Crash
- [x] Install Applications | [Click Here >](https://github.com/wahasa/Ubuntu/tree/main/Apps)

Visit problems now in : [Issues](https://github.com/wahasa/Ubuntu/issues)

---
## VNC Viewer

* Start VNC Server

In Ubuntu, run this command to start :
```
vnc-start
```

* Open Vnc Viewer

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

* Stop VNC Server

In Ubuntu, run this command to stop :
```
vnc-stop
```
</br>

---
<p align="center">Good Luck</p>

---
