---
title: 手动启动FSC服务
updated: 2026-06-05T23:18
created: 2019-08-26T11:14:54
---

Cd到FSC目录
D:\Siemens\Teamcenter11\fsc\>startfsc -Dfsc.config=FSC_PLM_plmadm.xml -Dfms.config=fmsmaster_FSC_PLM_plmadm.xml

移除并重新添加windows服务
uninstallfsc.bat %FSC_HOME% %FSC_ID_HERE%
installfsc.bat %JAVA_HOME% %FSC_HOME% %FSC_ID_HERE%

