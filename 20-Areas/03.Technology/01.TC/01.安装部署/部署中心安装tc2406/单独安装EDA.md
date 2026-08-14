---
title: 单独安装EDA
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:40
tags:
  - TC安装部署
---

![image1](aaf83f9e017b435a9214517c4466e89c.png)
ERROR: Required software not found.

This utility was expecting to find the following "wntx64" software in the location(s) - D:\DeploymentCenter\repository\software
\- Teamcenter Cadence Orcad CIS integration to Teamcenter

Please add the missing software before executing the deploy script.
If the software is available in mentioned location then ensure that media manifest file has platform value as either "wntx64" or "all".
原因：D:\DeploymentCenter\repository\software\Teamcenter Cadence OrCAD_2312_win64\artifacts\Teamcenter Cadence OrCAD_2312_setup.exe是32位程序
![image2](665ed785d4084a3e9a721fb2f11d4827.png)

![image3](af0d4ff571ed425d9013cc7e24171ea1.png)
改为手动安装，不适用部署中心安装。
