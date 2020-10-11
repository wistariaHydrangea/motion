#!/bin/bash

#today=$(TZ=UTC-9 date "+%Y%m%d")
#yesterday=$(TZ=UTC-9 date --date "1 day ago" "+%Y%m%d")
today=$(date "+%Y%m%d")
yesterday=$(date --date "1 day ago" "+%Y%m%d")

### directory of motion.conf
dir=/home/camera/

### Create Folder of today
mkdir -p ${dir}${today}

### Rewrite of motion.conf
sed -i -e 's/'$yesterday'/'$today'/g' /etc/motion/motion.conf

### Reload motion.conf at kill&<PID>
motion_pid=$(ps -ef | pgrep motion)
kill -s 1 ${motion_pid}
