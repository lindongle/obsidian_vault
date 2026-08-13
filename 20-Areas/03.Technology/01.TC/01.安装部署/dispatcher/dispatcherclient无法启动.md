---
title: dispatcherclient无法启动
updated: 2026-06-05T23:27
created: 2022-12-14T15:05:44
tags:
  - TC安装部署
---

Customer encoutered the following error while starting DispatcherClient using runDispatcherClient.bat script:

2019-02-27 09:30:50,407 INFO - Starting Service...
2019-02-27 09:30:50,453 WARN - TC_USE_KEYMANAGER environment variable is configured to not use KeyManager.
2019-02-27 09:30:51,047 INFO - Login to 2Tier TcServer attempt 12019-02-27 09:30:52,422 INFO - Stopping Service...
2019-02-27 09:30:52,469 ERROR - Exception.java.lang.Exception: java.lang.UnsatisfiedLinkError: no tctp_jni in java.library.path at com.teamcenter.ets.extract.Extractor.\<init\>(Extractor.java:272) at com.teamcenter.ets.ServiceMode.startService(ServiceMode.java:67) at com.teamcenter.ets.ServiceMode.main(ServiceMode.java:256)Caused by: java.lang.UnsatisfiedLinkError: no tctp_jni in java.library.path...

On the same server we are able to start a 2-Tier client. There is no additional info in the dispatcher client log file.

**SOLUTION**
It was found that the environment variable FMS_HOME was missing. The problem was solved after setting it to \<TC_ROOT\>\tccs in runDispatcherClient.bat.

*来自 \<<https://support.sw.siemens.com/zh-CN/knowledge-base/PL8008241>\>*
