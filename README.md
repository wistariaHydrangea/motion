# Construction method motion+samba

## Contents List

- Advance preparation
- Construction environment
- Install necessary packages
- Run script
- Create user for access to samba
- Reference

## Construction environment

| content | detail |
| :-----: | :----: |
| Raspberry pi | 3B+ |
| ubuntu | 20.04 |
| ufw | 0.36 |
| motion | 4.3.0 |
| samba | 4.11.6 |

## Advance preparation

```
> apt upgrade -y
> ufw allow 22/tcp
> ufw enable
> ufw reload
```

## Install necessary packages

```
> apt install -y git motion samba
> git clone https://github.com/wistariaHydrangea/motion.git
```

## Run script

```
> bash motion-setup.sh && bash samba-setup.sh
```

## Create user for access to samba

create on linux and samba

```
> pdbedit -a user01
new password: <--任意のパスワードを入力
retype new password: <--再入力

> pdbedit -L
user01:1001:
```

```
> smbpasswd -a user01
New SMB password: <--任意のパスワードを入力
Retype new SMB password: <--再入力
Added user user01.
```

### When deleting a user

```
> smbpasswd -x user01
Deleted user user01.
```

Confirm registered with cron

```
> crontab -e
```

Register shell script with cron

```nano
0 0 * * * sh <directory path of path-rewrite.sh>
```

Starting motion

```
> motion -b
```

Access "http://\<IP address>:8081" at browser

When stop a motion

```
> pkill motion
```

## Reference

- [Releases · Motion-Project/motion · GitHub](https://github.com/Motion-Project/motion/releases)
- [install Motion](https://motion-project.github.io/motion_build.html)
- [コマンドの途中で聞いてくる yes を自動入力したい？それ yes](https://www.agent-grow.com/self20percent/2018/08/06/linux-command-auto-yes/)
- [\`sed` で検索文字列を含む行の行番号だけを出力する方法 ...](https://genzouw.com/entry/2019/07/08/084532/1663/)
- [Samba.org](https://www.samba.org/)
