groupadd --gid 3003 permagrp1
groupadd --gid 9997 permagrp2
groupadd --gid 20447 permagrp3
groupadd --gid 50447 permagrp4
groupadd --gid 99909997 permagrp5

su
apt update -y && apt upgrade -y
apt-get install apt-utils wget nano sudo -y
rm -rf /etc/skel/.profile.1 /root/.profile.1
