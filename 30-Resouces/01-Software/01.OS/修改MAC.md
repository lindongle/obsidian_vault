---
title: 修改MAC
updated: 2026-06-06T00:29
created: 2025-05-14T16:23:09
---

sudo ifconfig eth0 down
sudo ifconfig eth0 hw ether 00:16:3E:1E:D0:3F
sudo ifconfig eth0 up
