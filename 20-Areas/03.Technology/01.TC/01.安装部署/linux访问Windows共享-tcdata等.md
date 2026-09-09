---
title: linux访问Windows共享-tcdata等
updated: 2026-06-05T23:56
created: 2025-07-22T13:34:29
tags:
  - TC安装部署
---

手动设置共享：
sudo mount -t cifs -o username=infodba,password=Yf2025@Plm //10.30.2.82/media /infodba/media
sudo mount -t cifs -0 username=infodba,password=Yf2025@Plm //10.30.2.82/software /infodba/software
……
设置开机挂载：
sudo vi /etc/fstab
//10.30.2.82/media /infodba/media cifs uid=1000,gid=107,username=infodba,password=Yf2025@Plm 0 0
//10.30.2.82/software /infodba/software cifs uid=1000,gid=107,username=infodba,password=Yf2025@plm 0 0
//10.30.2.56/filerepo /infodba/Siemens/Teamcenter2412/filerepo cifs uid=1000,gid=107,username=infodba,password=Yf2025@Plm 0 0
//10.30.2.82/tc_data /infodba/Siemens/tc_data cifs uid=1000,gid=107,username=infodba,password=Yf2025@Plm 0 0

