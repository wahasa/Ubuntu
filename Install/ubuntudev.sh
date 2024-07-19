#!/data/data/com.termux/files/usr/bin/bash
pkg install root-repo x11-repo
pkg install proot xz-utils pulseaudio -y
termux-setup-storage
ubuntu=noble
folder=ubuntu-fs
if [ -d "$folder" ]; then
        first=1
        echo "Skipping Downloading"
fi
tarball="ubuntu-rootfs.tar.gz"
if [ "$first" != 1 ];then
        if [ ! -f $tarball ]; then
                echo "Download Rootfs, this may take a while base on your internet speed."
                case `dpkg --print-architecture` in
                aarch64)
                        archurl="arm64" ;;
                arm*)
                        archurl="armhf" ;;
                ppc64el)
                        archurl="ppc64el" ;;
                x86_64)
                        archurl="amd64" ;;
                *)
                        echo "Unknown Architecture"; exit 1 ;;
                esac
                wget "https://cdimage.ubuntu.com/ubuntu-base/daily/current/${ubuntu}-base-${archurl}.tar.gz" -O $tarball
                #wget "https://partner-images.canonical.com/oci/${ubuntu}/current/ubuntu-${ubuntu}-oci-${archurl}-root.tar.gz" -O $tarball
        fi
        cur=`pwd`
        mkdir -p "$folder"
        cd "$folder"
        echo "Decompressing Rootfs, please be patient."
        proot --link2symlink tar -xf ${cur}/${tarball}||:
        cd "$cur"
   fi
   echo "ubuntu" > ~/"$folder"/etc/hostname
   echo "127.0.0.1 localhost" > ~/"$folder"/etc/hosts
   echo "nameserver 8.8.8.8" > ~/"$folder"/etc/resolv.conf
mkdir -p $folder/binds
bin=.ubuntu
linux=ubuntu
echo "writing launch script"
cat > $bin <<- EOM
#!/bin/bash
pulseaudio --start \
    --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
    --exit-idle-time=-1
cd \$(dirname \$0)
## Unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --kill-on-exit"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A $folder/binds)" ]; then
    for f in $folder/binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /dev/null:/proc/sys/kernel/cap_last_cap"
command+=" -b /proc"
command+=" -b /data/data/com.termux/files/usr/tmp:/tmp"
command+=" -b $folder/root:/dev/shm"
## Uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## Uncomment the following line to mount /sdcard directly to /
command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM
   #Fixing shebang of $linux"
   termux-fix-shebang $bin
   #Making $linux executable"
   chmod +x $bin
   #Removing image for some space"
   #rm $tarball
#Repositories
echo "#Ubuntu Development
deb http://ports.ubuntu.com/ubuntu-ports devel main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports devel-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports devel-security main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports devel-proposed main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports devel-backports main restricted universe multiverse" > ~/"$folder"/etc/apt/sources.list
echo "export PULSE_SERVER=127.0.0.1" >> $folder/root/.bashrc
echo 'bash .ubuntu' > $PREFIX/bin/$linux
chmod +x $PREFIX/bin/$linux
   clear
   echo ""
   echo "Updating Ubuntu,.."
   echo ""
echo "#!/bin/bash
touch ~/.hushlogin
apt update && apt upgrade -y
apt install apt-utils dialog nano -y
cp /etc/skel/.bashrc .
rm -rf ~/.bash_profile
exit" > $folder/root/.bash_profile
bash $linux
   clear
   echo ""
   echo "You can login to Ubuntu with 'ubuntu' script next time"
   echo ""
   #rm ubuntudev.sh

#
## Script edited by 'WaHaSa', Script V3-revision.
#
