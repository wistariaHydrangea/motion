# Construction method for motion

## Contents List

- Construction environment
- Install packages
- Configuration
- Reference

## Construction environment

- Raspberry pi 3B+
- ubuntu 20.04
- ufw 0.36
- motion 4.3.0
- samba 4.11.6

## Install packages

```ter minal
wget https://github.com/Motion-Project/motion/archive/Release-4.3.0.zip
```

```terminal
apt install autoconf automake autopoint build-essential pkgconf libtool libzip-dev libjpeg-dev git libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev libwebp-dev gettext libmicrohttpd-dev
unzip Release-4.3.0.zip
cd motion-Release-4.3.0
autoreconf -fiv && ./configure && make && make install
```

## samba setup

create on linux and samba

`sudo adduser -m user01`
Enter password

`sudo pdbedit -L -a user01`
Enter password
Enter password for confirmation

## Configuration

Confirm registered with cron

`crontab -e`

Register shell script with cron

```nano
0 0 * * * sh <Shell File Path>
```

Starting motion

`motion`

## Reference

- [Releases · Motion-Project/motion · GitHub](https://github.com/Motion-Project/motion/releases)
- [install Motion](https://motion-project.github.io/motion_build.html)
- [コマンドの途中で聞いてくる yes を自動入力したい？それ yes](https://www.agent-grow.com/self20percent/2018/08/06/linux-command-auto-yes/)
- [`sed` で検索文字列を含む行の行番号だけを出力する方法 ...](https://genzouw.com/entry/2019/07/08/084532/1663/)
- [Samba.org](https://www.samba.org/)
