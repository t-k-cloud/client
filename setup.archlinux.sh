#!/bin/bash
# must be root permission
touch /root/test || exit

# rsync daemon
pacman --noconfirm -S rsync
cp ./rsyncd.conf /etc/
systemctl enable rsyncd
systemctl start rsyncd

# check rsync status
set -x
systemctl status rsyncd.service
ps aux | grep 'rsync --daemon'
rsync rsync://localhost:8990
set +x

# make incr directory
INCR_DIR=/home/tk/incr
USER=tk
mkdir -p $INCR_DIR
chown $USER:$USER $INCR_DIR
