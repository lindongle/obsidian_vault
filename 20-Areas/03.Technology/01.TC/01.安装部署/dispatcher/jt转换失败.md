---
title: jt转换失败
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:40
tags:
  - TC安装部署
---

2019-02-27 17:13:23,107 ERROR - An error has been detected for task U18ede3a285c76547b888x during the execution of Provider: SIEMENS, Service: catiav5tojt. Refer to module task log (U18ede3a285c76547b888x_m.log) for further details.
java.lang.Exception: An error has been detected for task U18ede3a285c76547b888x during the execution of Provider: SIEMENS, Service: catiav5tojt. Refer to module task log (U18ede3a285c76547b888x_m.log) for further details.
at com.teamcenter.ets.schedule.Scheduler.onReport(Scheduler.java:296)
at com.teamcenter.translationservice.impl.TranslationTaskManager.onReport(TranslationTaskManager.java:803)
at com.teamcenter.tstk.server.translation.util.BasicTranslationUtil.clientReport(BasicTranslationUtil.java:805)
at com.teamcenter.tstk.client.translation.remote.TranslationClientRemote.schedulerReport(TranslationClientRemote.java:581)
at com.teamcenter.tstk.server.scheduler.event.RemoteSchedulerListenerImpl.schedulerReport(RemoteSchedulerListenerImpl.java:60)
at sun.reflect.GeneratedMethodAccessor9.invoke(Unknown Source)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
at java.lang.reflect.Method.invoke(Unknown Source)
at sun.rmi.server.UnicastServerRef.dispatch(Unknown Source)
at sun.rmi.transport.Transport\$1.run(Unknown Source)
at sun.rmi.transport.Transport\$1.run(Unknown Source)
at java.security.AccessController.doPrivileged(Native Method)
at sun.rmi.transport.Transport.serviceCall(Unknown Source)
at sun.rmi.transport.tcp.TCPTransport.handleMessages(Unknown Source)
at sun.rmi.transport.tcp.TCPTransport\$ConnectionHandler.run0(Unknown Source)
at sun.rmi.transport.tcp.TCPTransport\$ConnectionHandler.lambda\$run\$0(Unknown Source)
at java.security.AccessController.doPrivileged(Native Method)
at sun.rmi.transport.tcp.TCPTransport\$ConnectionHandler.run(Unknown Source)
at java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)
at java.util.concurrent.ThreadPoolExecutor\$Worker.run(Unknown Source)

解决：修改D:\Siemens\JTTranslators\CATIAV5\13.0\etc\catiatojt.config
将参数XTbrep = true
