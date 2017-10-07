#!/bin/bash
if [ "$1" == "-h" ]; then
cat << USAGE
Description:
Pull sync files back from master node in local network.
Examples:
$0 192.168.232.199
USAGE
exit
fi

[ $# -ne 1 ] && echo 'bad arg.' && exit

# abort on error
set -e

# pull files
rsync -av rsync://${IP}:8990/pull ~/Desktop

# allow sync from now on
echo 'Please sync file first touch in 10 sec...'
sleep 10
touch ~/Desktop/.please-sync
