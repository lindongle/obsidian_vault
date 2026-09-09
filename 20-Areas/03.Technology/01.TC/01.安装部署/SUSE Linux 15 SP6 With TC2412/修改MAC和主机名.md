---
title: 修改MAC和主机名
updated: 2026-06-06T10:09
created: 2025-05-19T14:49:20
tags:
  - TC安装部署
---

1.  修改主机名：第二天去主机中执行
[Linux系统中修改MAC地址的方法-CSDN博客](https://blog.csdn.net/2203_75758128/article/details/132939098)
sudo ip link set dev ==eth0== down
sudo ip link set dev ==eth0== address 00:16:3E:1E:D0:3F
sudo ip link set dev ==eth0== up
2.  ![image1](ddf8eb61ea824a49933c1cae141f8271.png)
3.  修改主机名
hostnamectlset-hostnamePLMServer
