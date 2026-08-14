---
title: Linux访问Windows共享的tcdata
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

sudo mount -t cifs -0 username=infodba,password=Yf2025@Plm <span style='color:#FA0000'>//10.30.2.82/tc_data</span> /infodba/Siemens/tc_data/
