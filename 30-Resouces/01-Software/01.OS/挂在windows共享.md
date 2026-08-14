---
title: 挂在windows共享
updated: 2026-06-06T00:28:01
created: 2026-07-05T17:04:54
---

sudo mount.cifs //10.2.1.8/SiemensBackup /mnt/remote_tc_backup -o user="hryt\infodba",password="Hrytplm@#2018",uid=500

用户名和密码为访问windows共享的用户名密码，必须用引号括起来。
