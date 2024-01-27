
<p align="center">My Channel</br><b>
| <a href="https://discord.gg/GCehyym">Discord</a> | <a href="https://youtube.com/channel/UC3sLb7eZCu72iv3G1yUhUHQ">YouTube</a> |</b></p>

---
## Ubuntu on Termux Android

---
• Install Apps on Android
- [x] [Termux](https://apkcombo.com/id/termux/com.termux)
- [x] [Vnc Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)

## Installation

Copy and paste this command to Termux :
> pkg update ; pkg upgrade

<details></br>
<summary><b><code>Install Ubuntu</code></b></summary>

* Ubuntu 24.04 (Noble Numbat)
```
pkg install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/ubuntu24.04.sh ; chmod +x ubuntu24.04.sh ; ./ubuntu24.04.sh
```

* Ubuntu 23.10 (Mantic Minotaur)
```
pkg install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/ubuntu23.10.sh ; chmod +x ubuntu23.10.sh ; ./ubuntu23.10.sh
```

* Ubuntu 22.04 (Jammy Jellyfish)
```
pkg install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Install/ubuntu22.04.sh ; chmod +x ubuntu22.04.sh ; ./ubuntu22.04.sh
```

* List Ubuntu</br>
[Click here,.](https://github.com/wahasa/Ubuntu/tree/main/Install)
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
rm -rf ubuntu-fs
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

on Ubuntu, run this command :
> apt update && apt upgrade

<details></br>
<summary><b><code>Install Desktop Xfce</code></b></summary>
<p align="center"><img src="https://raw.githubusercontent.com/wahasa/Ubuntu/main/Images/xfce.jpg"</p>

```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-xfce.sh ; chmod +x de-xfce.sh ; ./de-xfce.sh
```
</details>

<details></br>
<summary><b><code>Install Desktop Lxde</code></b></summary>
<p align="center"><img src="https://raw.githubusercontent.com/wahasa/Ubuntu/main/Images/lxde.jpg"</p>

```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxde.sh ; chmod +x de-lxde.sh ; ./de-lxde.sh
```
</details>

<details></br>
<summary><b><code>Install Desktop Lxqt</code></b></summary>
<p align="center"><img src="https://raw.githubusercontent.com/wahasa/Ubuntu/main/Images/lxqt.jpg"</p>

```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-lxqt.sh ; chmod +x de-lxqt.sh ; ./de-lxqt.sh
```
</details>

<details></br>
<summary><b><code>Install Desktop Kde</code></b></summary>
<p align="center"><img src="https://raw.githubusercontent.com/wahasa/Ubuntu/main/Images/kde.jpg"</p>

```
apt install wget -y ; wget https://raw.githubusercontent.com/wahasa/Ubuntu/main/Desktop/de-kde.sh ; chmod +x de-kde.sh ; ./de-kde.sh
```
</details>

---
Feature
- [x] Fixed Sound
- [x] Access to Sdcard
- [x] Fixed Browser Crash
- [x] Install Applications [Click here,.](https://github.com/wahasa/Ubuntu/tree/main/Apps)

Visit problems now in : [Issues](https://github.com/wahasa/Ubuntu/issues)

---
## VNC Viewer

* Start VNC Server

on Ubuntu, run this command to start :
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

on Ubuntu, run this command to stop :
```
vnc-stop
```

---
<p align="center">Good Luck</p>

---
