#!/bin/bash

today=$(date "+%Y%m%d")
motion_conf=/etc/motion/motion.conf

mkdir -p /var/motion-log/picture

### Backup original file
if [[ -e /etc/motion/motion.conf.old ]]; then
  cp $motion_conf /etc/motion/motion.conf.old
fi

### Rewrite of motion.conf
sed -i -e 's/daemon off/deamon on/g' $motion_conf
sed -i -e 's/target_dir \/var\/lib\/motion/target_dir \/var\/motion-log\/picture\/'$today'/g' $motion_conf
sed -i -e 's/picture_output off/picture_output on/g' $motion_conf
sed -i -e 's/movie_output on/movie_output off/g' $motion_conf
sed -i -e 's/threshold 1500/threshold 1600/g' $motion_conf
sed -i -e 's/stream_localhost on/stream_localhost off/g' $motion_conf

ufw allow 8081
echo y | ufw Reload
