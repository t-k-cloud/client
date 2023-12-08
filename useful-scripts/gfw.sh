#!/bin/sh
cd /home/tk/master-tree/incr/install
cat ss.json
set -x
sudo docker run --net host -v `pwd`/ss.json:/mnt/ss.json approach0/docker-ss ss-local -c /mnt/ss.json
set +x
