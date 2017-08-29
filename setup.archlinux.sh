#!/bin/bash
# must be root permission
touch /root/test || exit

# rsync daemon
pacman --noconfirm -S rsync
cp ./rsyncd.conf /etc/
systemctl enable rsyncd
systemctl start rsyncd
