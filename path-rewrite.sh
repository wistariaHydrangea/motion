#!/bin/bash

today=$(date "+%Y%m%d")
yesterday=$(date --date "1 day ago" "+%Y%m%d")

### directory of motion.conf
picture_dir=/var/motion-log/picture

### Create Folder of today
mkdir -p ${picture_dir}${today}

motion_conf=/etc/motion/motion.conf

### Rewrite of motion.conf
sed -i -e 's/target_dir \/var\/motion-log\/picture\/'$yesterday'/target_dir \/var\/motion-log\/picture\/'$today'/g' $motion_conf

### Reload motion.conf at kill&<PID>
motion_pid=$(ps -ef | pgrep motion)
kill -s 1 ${motion_pid}
