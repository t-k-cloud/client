#!/bin/sh
pacman -S proxychains-ng
proxychains -f ./proxychains.conf google.com
