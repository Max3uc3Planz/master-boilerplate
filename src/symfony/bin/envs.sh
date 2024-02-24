#!/bin/sh
printenv | sed 's/^\([^=]*\)\=\(.*\)$/export \1\="\2"/g' > /root/envs.sh
chmod +x /root/envs.sh