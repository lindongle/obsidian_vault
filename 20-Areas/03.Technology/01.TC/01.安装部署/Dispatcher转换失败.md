---
title: Dispatcher转换失败
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

2018-05-24 17:36:48,330 INFO - Connected to Scheduler on Url rmi://localhost:2001
2018-05-24 17:36:49,354 INFO - 正在计划请求状态管理任务。间隔（以分钟计）： 30
2018-05-24 17:36:49,358 INFO - 开始处理数据库中的请求。
2018-05-24 17:36:49,882 ERROR - 拒绝访问 - 请检查访问规则以进行正确配置，或是联系管理员。
2018-05-24 17:36:49,884 INFO - 正在停止服务...
2018-05-24 17:36:50,964 ERROR - Exception.
java.lang.Exception: java.lang.Exception: java.security.GeneralSecurityException: 拒绝访问 - 请检查访问规则以进行正确配置，或是联系管理员。
at com.teamcenter.ets.extract.Extractor.\<init\>(Extractor.java:272)
at com.teamcenter.ets.ServiceMode.startService(ServiceMode.java:67)
at com.teamcenter.ets.ServiceMode.main(ServiceMode.java:256)
Caused by: java.lang.Exception: java.security.GeneralSecurityException: 拒绝访问 - 请检查访问规则以进行正确配置，或是联系管理员。
![image1](419fbf6077ce4bd9a16bd01abec5fae4.png)
at com.teamcenter.ets.request.TranslationRequest.updateTransRqstState(TranslationRequest.java:761)
at com.teamcenter.ets.extract.Extractor.getNext(Extractor.java:771)
at com.teamcenter.ets.extract.Extractor.start(Extractor.java:310)

![image2](b089c288f7c046eb9e2906854c7ffcdb.png)

