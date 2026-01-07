#!/data/data/com.termux/files/usr/bin/bash
clear
echo "Welcome To Ubuntu Termux For Android"
echo ""
echo "* List ubuntu"
sleep 1
echo "- resolute (26.04) - noble (24.04) - bionic (18.04)"
echo "- questing (25.10) - jammy (22.04) - xenial (16.04)"
echo "- plucky   (25.04) - focal (20.04) - trusty (14.04)"
echo ""
read -p "Enter ubuntu : " ubuntu
sleep 2
echo ""
echo "* List device"
sleep 1
echo "- arm64"
echo "- armhf"
echo ""
read -p "Enter device : " device
sleep 2
echo ""
echo "* List extra"
sleep 1
echo "- aarch64"
echo "- armv7l"
echo ""
read -p "Enter extra : " extra
sleep 2
echo ""

linux=ubuntu
folder=ubuntu-fs

echo ""
echo "<=> Downloading rootfs $ubuntu $device."
#https://cdimage.ubuntu.com/ubuntu-base/daily/current/$ubuntu-base-$device.tar.gz
wget https://partner-images.canonical.com/oci/$ubuntu/current/ubuntu-$ubuntu-oci-$device-root.tar.gz
#wget https://partner-images.canonical.com/core/$ubuntu/current/ubuntu-$ubuntu-core-cloudimg-$device-root.tar.gz

sleep 2
echo "[+] Creating folder in termux.........[ok]"
mkdir -p $folder

sleep 2
echo "[+] Extracting rootfs in folder.......[ok]"
proot --link2symlink tar -xpf *tar.gz -C ~/$folder ||:
rm *.tar.gz

sleep 2
echo "[+] Creating folder in $folder......[ok]"
mkdir -p $folder/data
mkdir -p $folder/binds
mkdir -p $folder/sdcard
mkdir -p $folder/home/$linux
touch $folder/root/.hushlogin

sleep 2
echo "[+] Creating script in $folder......[ok]"
echo "localhost" > $folder/etc/hostname
echo "127.0.0.1 localhost" > $folder/etc/hosts
echo "nameserver 8.8.8.8" > $folder/etc/resolv.conf
echo "export PULSE_SERVER=127.0.0.1" >> $folder/root/.bashrc
echo "export PULSE_SERVER=127.0.0.1" >> $folder/home/$linux/.bashrc

cat > $folder/root/.bash_profile <<- EOM
#cat > $folder/root/update <<- EOM
apt update
#apt purge --allow-remove-essential coreutils-from-uutils -y
apt install dialog -y
apt upgrade -y
ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
apt install apt-utils alsa-utils nano sudo wget tzdata -y
apt install ~/fastfetch*
rm fastfetch*
#rm update.sh
rm -rf ~/.bash_profile
exit
EOM
#chmod +x $folder/root/update

sleep 2
echo "[+] Creating file repo in $linux......[ok]"
cat > $folder/etc/apt/sources.list.d/ubuntu.sources <<- EOM
# Modernized from /etc/apt/sources.list

Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports
Suites: $ubuntu $ubuntu-updates $ubuntu-security $ubuntu-proposed $ubuntu-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOM

cat > $folder/etc/apt/sources.list <<- EOM
# Ubuntu sources have moved to the /etc/apt/sources.list.d/ubuntu.sources

#deb http://ports.ubuntu.com/ubuntu-ports $ubuntu main restricted universe multiverse
#deb http://ports.ubuntu.com/ubuntu-ports $ubuntu-updates main restricted universe multiverse
#deb http://ports.ubuntu.com/ubuntu-ports $ubuntu-security main restricted universe multiverse
#deb http://ports.ubuntu.com/ubuntu-ports $ubuntu-proposed main restricted universe multiverse
#deb http://ports.ubuntu.com/ubuntu-ports $ubuntu-backports main restricted universe multiverse
EOM

sleep 2
echo "[+] Creating script login $linux......[ok]"
cat > .login <<- EOM
#!/data/data/com.termux/files/usr/bin/bash
cd \$(dirname \$0)
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
unset LD_PRELOAD
command+="proot"
command+=" --link2symlink"
command+=" --kill-on-exit"
command+=" --kernel-release=6.18.3-fake_kernel"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A $folder/binds)" ]; then
   for f in $folder/binds/* ;do
       . \$f
   done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sys"
command+=" -b $folder/root:/dev/shm"
command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com=" \$@"
if [ -z "\$1" ];then
   exec \$command
else
   \$command -c "\$com"
fi
EOM
termux-fix-shebang .login
chmod +x .login

sleep 2
echo ""
echo "<=> Downloading extra package."
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.56.1/fastfetch-linux-$extra.deb
mv fastfetch* $folder/root

sleep 2
echo ""
echo "<=> Ubuntu is running now."
echo ""
echo "Updating $linux package..."
bash .login

echo ""
echo "Backup rootfs to sdcard..."
cat > backup <<- EOM
#tar -cJf /sdcard/ubuntu-$ubuntu-$device.tar.xz $folder/*
#tar -czf /sdcard/ubuntu-$ubuntu-$device-root.tar.gz $folder/*
rm backup
EOM
chmod +x backup
bash backup

echo ""
echo "<=> All has been completed."
echo ""
echo ""
echo "> Start ubuntu run with : bash .login"
echo "> Stop  ubuntu run with : exit"
echo ""

#
## WaHaSa
#
