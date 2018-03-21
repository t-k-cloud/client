#!/bin/bash
# must be root permission
touch /root/test || exit

USER=tk

# rsync daemon
pacman --noconfirm -S rsync
cp ./rsyncd.conf /etc/
rm -f /home/$USER/rsyncd.*
systemctl enable rsyncd
systemctl start rsyncd

# check rsync status
set -x
systemctl status rsyncd.service
ps aux | grep 'rsync --daemon'
rsync rsync://localhost:8990
set +x

# make incr directory
INCR_DIR=/home/$USER/incr
mkdir -p $INCR_DIR
chown $USER:$USER $INCR_DIR
