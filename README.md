# Construction method for motion

## Contents List

- Construction environment
- Install packages
- Configuration
- Reference

## Construction environment

- Raspberry pi 3B+
- ubuntu server 20.04 LTS
- ufw 0.36

## Install packages

`apt install -y motion`

## Configuration

create folder for storing pictures
`mkdir -p /home/camera`

Rewrite motion.conf

(etc/motion/motion.conf)

```conf
11 # Start in daemon (background) mode and release terminal.
12 daemon on

41 # Target directory for pictures, snapshots and movies
42 target_dir /home/camera/<today>

237 # Output pictures when motion is detected
238 picture_output on

375 # Restrict stream connections to the localhost.
376 stream_localhost off
```

Release using port for motion

```terminal
ufw enable
ufw allow 8081
ufw reload
```

Register shell script with cron

```nano
0 0 * * * sh <File Path>
```

Confirm registered with cron
`crontab -e`

Starting motion
`motion`

## Reference

- [https://motion-project.github.io/4.2.2/motion_config.html](https://motion-project.github.io/4.2.2/motion_config.html)
- [https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.2.0/com.ibm.zos.v2r2.bpxa500/kil.htm](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.2.0/com.ibm.zos.v2r2.bpxa500/kil.htm)
