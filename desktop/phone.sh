#!/bin/sh

# test permission
touch /root/test || exit

# restart docker.
systemctl restart docker

# pull image
docker pull rethinkdb
docker pull openstf/stf

# stop and clean previous containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# pull up adb daemon
adb devices

# run rethinkdb as daemon
docker run -d --name rethinkdb -v /srv/rethinkdb:/data --net host rethinkdb rethinkdb --bind all --cache-size 8192 --http-port 8090

# run STF as daemon
docker run -d --name stf --net host openstf/stf stf local

# print hosting URL
echo "http://localhost:7100"
