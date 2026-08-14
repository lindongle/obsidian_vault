---
title: 同步pool manger日志时间与服务器一致。
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:39
tags:
  - TC安装部署
---

修改
D:\Siemens\Teamcenter11\pool_manager\confs\config1\mgrstart.bat文件，在call mgrenv.bat下面的"%JAVA_COMMAND%" %JVM_OPTS% %JMX_OPTS% %\* %PoolManager_Main%中\*的后面增加-Dcom.teamcenter.jeti.util.log.category=ServerManager -Dcom.teamcenter.mld.utility.logging.timezone="Asia/Shanghai"
保存，重启pool池服务

[mgrstart.bat](995cbad0d03d4284a9fe9549e232867f.bat)

![image1](1ca16b06b67f430baa41a30dc5a9ba55.png)

