#!/data/data/com.termux/files/usr/bin/bash
# <=> https://github.com/wahasa

# Ubuntu Release
# <=> https://ubuntu.com
# <=> https://releases.ubuntu.com
# <=> https://ubuntu.com/about/release-cycle
# <=> https://documentation.ubuntu.com/project/release-team/list-of-releases

# Ubuntu ESM ( Extended Security Maintenance )
# [+] trusty 14.04 lts ( Trusty Tahr )
# [+] xenial 16.04 lts ( Xenial Xerus )
# [+] bionic 18.04 lts ( Bionic Beaver )
# [+] focal  20.04 lts ( Focal Fossa )

# Ubuntu LTS ( Long Term Support )
# [+] jammy  22.04 lts ( Jammy Jellyfish )
# [+] noble  24.04 lts ( Noble Numbat )

# Ubuntu Lastest
# [+] plucky     25.04 ( Plucky Puffin )
# [+] questing   25.10 ( Questing Quokka )

# Ubuntu Next
# [+] resolute   26.04 (Resolute Raccoon)

# Ubuntu Devel
# [+] devel      Next  ( Development )

# Ubuntu Repositories
# <=> https://esm.ubuntu.com/infra/ubuntu/dists
# <=> https://ports.ubuntu.com/ubuntu-ports/dists

# Ubuntu Rootfs
# <=> https://cloud-images.ubuntu.com
# <=> https://partner-images.canonical.com/oci
# <=> https://partner-images.canonical.com/core
# <=> https://cdimage.ubuntu.com/ubuntu-base
# <=> https://hub.docker.com/_/ubuntu

# Regular Colors
blk="\033[0;30m"       # Black
red="\033[0;31m"       # Red
grn="\033[0;32m"       # Green
ylw="\033[0;33m"       # Yellow
blu="\033[0;34m"       # Blue
ppl="\033[0;35m"       # Purple
cyn="\033[0;36m"       # Cyan
wht="\033[0;37m"       # White
rst="\033[0m"          # Reset

clear
printf "${blu} • Welcome To Ubuntu Termux For Android\n"
printf "\n"
printf "${blu}List Code Name      Version      Status\n"
printf "${ppl}[+]  ${ppl}devel           ${ppl}devel        ${ppl}test\n"
printf "${ylw}[+]  ${ylw}resolute        ${ylw}26.04        ${ylw}next\n"
printf "${grn}[+]  ${ylw}questing        ${wht}25.10         ${grn}ok \n"
printf "${grn}[+]  ${ylw}plucky          ${wht}25.04         ${grn}ok \n"
printf "${grn}[+]  ${ylw}noble           ${wht}24.04         ${grn}ok \n"
printf "${grn}[+]  ${ylw}jammy           ${wht}22.04         ${grn}ok \n"
printf "${grn}[+]  ${ylw}focal           ${wht}20.04         ${grn}ok \n"
printf "${grn}[+]  ${ylw}bionic          ${wht}18.04         ${grn}ok \n"
printf "${red}[-]  ${red}xenial          ${red}16.04        ${red}eror\n"
printf "${red}[-]  ${red}trusty          ${red}14.04        ${red}eror\n"
printf "${blu}\n"
printf "${cyn}Select your ubuntu < ${ylw}code name${cyn} > :${ylw}"
read -p " " ubuntu

# Script Ubuntu
clear
bin=.ubuntu
linux=ubuntu
   printf "${rst}\n"
   printf "${grn}Installing $linux $ubuntu,..\n"
   printf "${rst}\n"
   pkg install root-repo x11-repo
   pkg install proot neofetch pulseaudio -y
   #pkg install tur-repo tigervnc xorg-xhost -y
   #termux-setup-storage
   #echo "vncserver -geometry 1600x900 -listen tcp :1 && DISPLAY=:1 xhost +" > $PREFIX/bin/vncstart
   #echo "vncserver -kill :1" > $PREFIX/bin/vncstop ; chmod +x $PREFIX/bin/vnc*
   printf "${rst}\n"
folder=ubuntu-fs
neofetch --ascii_distro $linux -L
if [ -d "$folder" ]; then
        first=1
        printf "${red}Ubuntu has been installed on $folder.${rst}\n"
        printf "\n" ; exit
fi
tarball="ubuntu-rootfs.tar.gz"
if [ "$first" != 1 ];then
        if [ ! -f $tarball ]; then
        printf "${grn}Downloading rootfs, please wait,..${rst}\n"
        printf "\n"
               case `dpkg --print-architecture` in
               aarch64)
                       archurl="arm64" ;;
               arm*)
                       archurl="armhf" ;;
               #s390x)
               #       archurl="s390x" ;;
               #riscv64)
               #       archurl="riscv64" ;;
               #ppc64el)
               #       archurl="ppc64el" ;;
               #i386)
               #       archurl="i386" ;;
               #x86_64)
               #       archurl="amd64" ;;
               *)
               printf "${red}Unknown architecture.\n"
               printf "\n" ; exit 1 ;;
               esac
               wget "https://partner-images.canonical.com/oci/${ubuntu}/current/ubuntu-${ubuntu}-oci-${archurl}-root.tar.gz" -O $tarball
        fi
        mkdir -p $folder
        printf "${cyn}Extracting rootf, please wait,..${rst}\n"
        proot --link2symlink tar -xpf ~/${tarball} -C ~/$folder ||:
   fi
   echo "localhost" > $folder/etc/hostname
   echo "127.0.0.1 localhost" > $folder/etc/hosts
   echo "nameserver 8.8.8.8" > $folder/etc/resolv.conf
   mkdir -p $folder/sdcard ; mkdir -p $folder/binds
   mkdir -p $folder/data ; mkdir -p $folder/home/$linux
sleep 2
printf "\n"
printf "${ylw}Writing script to login.....[${grn}ok${ylw}]${rst}\n"
cat > $bin <<- EOM
#!/data/data/com.termux/files/usr/bin/bash
cd \$(dirname \$0)
## Audio output script in pulseaudio termux.
pulseaudio --start --load="module-aaudio-sink" --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
## Unset LD_PRELOAD in case termux-exec is installed.
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
command+=" -b /dev/urandom:/dev/random"
command+=" -b /dev/null:/proc/sys/kernel/cap_last_cap"
command+=" -b /proc"
command+=" -b /proc/self/fd:/dev/fd"
command+=" -b /proc/self/fd/0:/dev/stdin"
command+=" -b /proc/self/fd/1:/dev/stdout"
command+=" -b /proc/self/fd/2:/dev/stderr"
command+=" -b /sys"
command+=" -b /sys/fs/selinux"
command+=" -b /data/data/com.termux"
command+=" -b $folder/root:/dev/shm"
## Uncomment the following line to get access to termux directory.
#command+=" -b /data/data/com.termux/files/home:/home/$linux"
## Uncomment the following line to mount sdcard directly to linux.
command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" MOZ_FAKE_NO_SANDBOX=1"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
command+=" TERM=\$TERM"
command+=" TMPDIR=/tmp"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com=" \$@"
if [ -z "\$1" ];then
   exec \$command
else
   \$command -c "\$com"
fi
EOM
   sleep 1
   printf "${ylw}Fixing shebang of $linux....[${grn}ok${ylw}]\n"
   termux-fix-shebang $bin
   sleep 1
   printf "${ylw}Making executable $linux....[${grn}ok${ylw}]\n"
   chmod +x $bin
   sleep 1
   printf "${ylw}Fixing permissions $linux...[${grn}ok${ylw}]\n"
   #chmod -R 755 $folder
   sleep 1
   printf "${ylw}Removing rootfs in termux...[${grn}ok${ylw}]\n"
   rm $tarball
   printf "\n"
   sleep 2
## Home:root
#mv $folder/root/.bashrc $folder/root/.bashrc.bak ; mv $folder/root/.profile $folder/root/.profile.bak
#cp $folder/etc/skel/.bashrc $folder/root ; cp $folder/etc/skel/.profile $folder/root
#echo "TZ='Asia/Jakarta'; export TZ" >> $folder/root/.profile
echo "export PULSE_SERVER=127.0.0.1" >> $folder/root/.bashrc
echo "" > $folder/root/.hushlogin
#sed -i 's/32/31/g' $folder/root/.bashrc
cat > $PREFIX/bin/$linux <<- EOF
bash .$linux
EOF
## Home:ubuntu
#user=$linux
#pass=$linux
#printf "\n"
#printf "${cyn}Your default username < ${grn}$linux ${cyn}>${rst}\n"
#sleep 2
#printf "\n"
#printf "${grn}Input new password${rst}\n"
#read -p " " pass
## Home:costum
printf "\n"
printf "${cyn}Please, create your new username${rst}\n"
sleep 1
printf "${grn}Input username${rst}\n"
read -p " " user
sleep 2
printf "\n"
printf "${grn}Input password${rst}\n"
read -p " " pass
   sleep 1
   printf "\n"
   printf "\n"
   printf "${red}Updating package,..${rst}\n"
   printf "\n"
chmod +x $PREFIX/bin/$linux
mv $folder/etc/apt/sources.list $folder/etc/apt/sources.list.bak
cat > $folder/etc/apt/sources.list.d/ubuntu.sources <<- EOF
## Modernized from /etc/apt/sources.list
Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports
Suites: $ubuntu $ubuntu-updates $ubuntu-security $ubuntu-proposed $ubuntu-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF
cat > $folder/root/.bash_profile <<- EOF
apt update
apt install dialog -y ; apt upgrade -y
ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
apt install apt-utils alsa-utils nano sudo wget tzdata -y
## Home:ubuntu/costum
useradd -m -s /bin/bash $user ; useradd -m -s /bin/bash $linux
usermod -aG sudo $user ; usermod -aG sudo $linux
echo "$user:$pass" | chpasswd ; echo "$linux:$pass" | chpasswd
echo "$user  ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$user ; echo "$linux  ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$linux
rm -rf ~/.bash_profile
exit
EOF
bash $bin
cat > $PREFIX/bin/$linux <<- EOF
bash .$linux su $user
EOF
## Home:ubuntu/costum
cp $folder/etc/skel/.bashrc $folder/home/$user ; cp $folder/etc/skel/.profile $folder/home/$user
#cp $folder/etc/skel/.bashrc $folder/home/$linux ; cp $folder/etc/skel/.profile $folder/home/$linux
echo "export PULSE_SERVER=127.0.0.1 ; cd" >> $folder/home/$user/.bashrc ; echo "export PULSE_SERVER=127.0.0.1 ; cd" >> $folder/home/$linux/.bashrc
#echo "TZ='Asia/Jakarta'; export TZ" >> $folder/home/$user/.profile ; echo "TZ='Asia/Jakarta'; export TZ" >> $folder/home/$linux/.profile
echo "" > $folder/home/$user/.hushlogin ; echo "" > $folder/home/$linux/.hushlogin
#sed -i 's/32/31/g' $folder/home/$user/.bashrc
   sleep 2
   clear
   printf "\n"
   printf "${cyn}You can login to Linux with '${grn}$linux${cyn}' script next time.${rst}\n"
   printf "\n"
   #rm ubuntu.sh
#
## Script edited by 'WaHaSa', Script has been revised.
#
