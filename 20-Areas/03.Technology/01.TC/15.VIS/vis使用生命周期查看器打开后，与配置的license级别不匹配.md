---
title: vis使用生命周期查看器打开后，与配置的license级别不匹配
updated: 2026-06-06T00:08
created: 2018-10-16T21:54:39
---

1、添加环境变量，SPLM_LICENSE_SERVER，连接license服务器
==2、修改D:\Siemens\Teamcenter11.5\Visualization\License\license.dat==
«span style='font-family:"Microsoft YaHei";background:yellow;mso-highlight:yellow'»添加«/span»<span style='font-family:Calibri;background:yellow;mso-highlight:yellow'>TCVIS_LICENSE_FILE=28000@plmtest</span>«span style='font-family:"Microsoft YaHei";background:yellow;mso-highlight:yellow'»，控制本地打开的许可证级别«/span»
修改注册表 \[HKEY_CURRENT_USER\Software\Classes\VisView.Ini\shell\open\command\]
="...\Products\\\*\*\VisView.exe /dde"
值为需要打开那种级别的vis的路径。

