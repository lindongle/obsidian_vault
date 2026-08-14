---
title: 复制介质，设置jre环境变量
updated: 2026-07-05T17:09:07
created: 2026-07-05T17:09:07
tags:
  - TC安装部署
---

sudo -s
vi /etc/profile
添加以下环境变量：
su - infodba,会校验是否正确

手动拖拽的文件夹，需要调整权限；
![image1](3e5fb984f27245b18cd07fa5de972126.png)

设置图形化界面：
export DISPLAY=192.168.1.20:0.0
IP为主机虚拟网卡的ip地址
注意最好root账号和普通账号均设置；
