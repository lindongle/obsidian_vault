---
title: 修改MAC
updated: 2026-06-06T00:29:22
created: 2026-07-05T17:04:53
---

sudo ifconfig eth0 down
sudo ifconfig eth0 hw ether 00:16:3E:1E:D0:3F
sudo ifconfig eth0 up
