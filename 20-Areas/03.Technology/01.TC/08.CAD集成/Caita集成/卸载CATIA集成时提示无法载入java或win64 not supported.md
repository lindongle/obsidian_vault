---
title: 卸载CATIA集成时提示无法载入java或win64 not supported
updated: 2026-06-05T23:28:00
created: 2026-07-05T17:04:43
---

在TCIC安装目录中找到卸载程序配置文件
.lax文件
修改里面的参数
lax.nl.current.vm=
后面写32位jre的java.exe的全路径（含java.exe）
