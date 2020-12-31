#!/bin/bash

smb_conf=/etc/samba/smb.conf

### Backup original file
if [[ /etc/samba/smb.conf.old ]]; then
  cp $smb_conf /etc/samba/smb.conf.old
fi

samba_global_number=$(($(sed -n "/\[global]/=" $smb_conf) + 2))
sed -i -e $samba_global_number'i\
  unix charset = UTF-8\
  dos charset = CP932\
' $smb_conf

samba_path_number=$(($(sed -n "/\#======================= Share Definitions =======================/=" $smb_conf) + 2))
sed -i -e $samba_path_number'i\
\[motion_log]\
  comment = picture and movie of motion\
  path = /var/motion-log/\
  writable = yes\
  read only = no\
  guest ok = no\
  create mask = 0741\
  valid users = user01\
' $smb_conf

ufw allow 8081
ufw allow 137:138/udp
ufw allow 139/tcp
ufw allow 445/tcp
echo y | ufw Reload
