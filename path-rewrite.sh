#!/bin/bash

#today=$(TZ=UTC-9 date "+%Y%m%d")
#yesterday=$(TZ=UTC-9 date --date "1 day ago" "+%Y%m%d")
today=$(date "+%Y%m%d")
yesterday=$(date --date "1 day ago" "+%Y%m%d")

### directory of motion.conf
picture_dir=/var/motion-log/picture
#movie_dir=/var/motion-log/movie

### Create Folder of today
mkdir -p ${picture_dir}${today}

### Backup original file
if [[ -e /etc/motion/motion.conf ]]; then
  cp /etc/motion/motion.conf /etc/motion/motion.conf.old
fi

### Rewrite of motion.conf
sed -i -e 's/daemon off/deamon on/g' /etc/motion/motion.conf
sed -i -e 's/'$yesterday'/'$today'/g' /etc/motion/motion.conf
sed -i -e 's/target_dir \/var\/motion-log\/picture\/'$yesterday'/target_dir \/var\/motion-log\/picture\/'$today'/g' /etc/motion/motion.conf
sed -i -e 's/picture_output off/picture_output on/g' /etc/motion/motion.conf
sed -i -e 's/movie_output on/movie_output off/g' /etc/motion/motion.conf
sed -i -e 's/movie_codec mkv/movie_codec mp4/g' /etc/motion/motion.conf
sed -i -e 's/threshold 1500/threshold 1600/g' /etc/motion/motion.conf
sed -i -e 's/stream_localhost off/stream_localhost on/g' /etc/motion/motion.conf

### Reload motion.conf at kill&<PID>
motion_pid=$(ps -ef | pgrep motion)
kill -s 1 ${motion_pid}
