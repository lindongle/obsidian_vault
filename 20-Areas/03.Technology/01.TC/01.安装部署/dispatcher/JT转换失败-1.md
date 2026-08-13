---
title: JT转换失败
updated: 2026-06-05T23:27
created: 2019-02-27T10:35:41
tags:
  - TC安装部署
---

2019-02-27 10:33:14,943 INFO - Exiting custom DataBaseOperation class for: SIEMENS catiav5tojt (com.teamcenter.ets.translator.ugs.catiatojt.DatabaseOperation)
2019-02-27 10:33:14,943 INFO - ------------------------------------------------------------
2019-02-27 10:33:14,943 INFO - 2019-02-27 10:33:14 - U27ebx50f45c75f67a2324,COMPLETE,SIEMENS,catiav5tojt,1,weihuafan-v,Body Structure,dcproxy,2019-02-27 10:33:14,1,500000921/001.0012;1,1,500000921/001.0012-3D,6,INITIAL,2019-02-27 10:31:22,PREPARING,2019-02-27 10:32:55,SCHEDULED,2019-02-27 10:32:55,TRANSLATING,2019-02-27 10:33:13,LOADING,2019-02-27 10:33:14,COMPLETE,2019-02-27 10:33:14
2019-02-27 10:33:14,959 INFO - Load Complete U27ebx50f45c75f67a2324
2019-02-27 10:33:14,959 INFO - Load Complete
2019-02-27 10:33:14,959 INFO - Done processing TaskId U27ebx50f45c75f67a2324
2019-02-27 10:33:55,613 INFO - Begin Extract of Request U27ebx626c5c74d933196x
2019-02-27 10:33:55,613 INFO - Begin Extract of Request U27ebx626c5c74d933196x
2019-02-27 10:33:55,629 INFO - Validating Request
2019-02-27 10:33:55,645 INFO - ------------------------------------------------------------
2019-02-27 10:33:55,645 INFO - Entering custom TaskPrep class for: SIEMENS catiav5tojt com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep@18a9c9ad
2019-02-27 10:33:55,645 ERROR - com.teamcenter.soa.client.model.strong.Dataset cannot be cast to com.teamcenter.soa.client.model.strong.ItemRevision
java.lang.ClassCastException: com.teamcenter.soa.client.model.strong.Dataset cannot be cast to com.teamcenter.soa.client.model.strong.ItemRevision
at com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep.getItemRevObjs(TaskPrep.java:347)
at com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep.prepareTask(TaskPrep.java:71)
at com.teamcenter.ets.extract.Extractor.processRequest(Extractor.java:420)
at com.teamcenter.ets.extract.Extractor.start(Extractor.java:320)
at com.teamcenter.ets.extract.Extractor.\<init\>(Extractor.java:266)
at com.teamcenter.ets.ServiceMode.startService(ServiceMode.java:67)
at com.teamcenter.ets.ServiceMode.main(ServiceMode.java:256)
2019-02-27 10:33:55,660 INFO - 2019-02-27 10:33:55 - U27ebx626c5c74d933196x,TERMINAL,SIEMENS,catiav5tojt,1,xianguozheng-v,Body Structure,dcproxy,2019-02-27 10:33:55,1,500000854/001;4,1,500000863/001.0002,3,INITIAL,2019-02-27 10:33:23,PREPARING,2019-02-27 10:33:55,TERMINAL,2019-02-27 10:33:55
2019-02-27 10:33:55,660 ERROR - com.teamcenter.soa.client.model.strong.Dataset cannot be cast to com.teamcenter.soa.client.model.strong.ItemRevision
java.lang.ClassCastException: com.teamcenter.soa.client.model.strong.Dataset cannot be cast to com.teamcenter.soa.client.model.strong.ItemRevision
at com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep.getItemRevObjs(TaskPrep.java:347)
at com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep.prepareTask(TaskPrep.java:71)
at com.teamcenter.ets.extract.Extractor.processRequest(Extractor.java:420)
at com.teamcenter.ets.extract.Extractor.start(Extractor.java:320)
at com.teamcenter.ets.extract.Extractor.\<init\>(Extractor.java:266)
at com.teamcenter.ets.ServiceMode.startService(ServiceMode.java:67)
at com.teamcenter.ets.ServiceMode.main(ServiceMode.java:256)
2019-02-27 10:33:55,660 ERROR - Failure processing request: U27ebx626c5c74d933196x
java.lang.ClassCastException: com.teamcenter.soa.client.model.strong.Dataset cannot be cast to com.teamcenter.soa.client.model.strong.ItemRevision
at com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep.getItemRevObjs(TaskPrep.java:347)
at com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep.prepareTask(TaskPrep.java:71)
at com.teamcenter.ets.extract.Extractor.processRequest(Extractor.java:420)
at com.teamcenter.ets.extract.Extractor.start(Extractor.java:320)
at com.teamcenter.ets.extract.Extractor.\<init\>(Extractor.java:266)
at com.teamcenter.ets.ServiceMode.startService(ServiceMode.java:67)
at com.teamcenter.ets.ServiceMode.main(ServiceMode.java:256)
2019-02-27 10:34:55,739 INFO - Begin Extract of Request U18ede3a285c75f74b2656
2019-02-27 10:34:55,739 INFO - Begin Extract of Request U18ede3a285c75f74b2656
2019-02-27 10:34:55,770 INFO - Validating Request
2019-02-27 10:34:55,770 INFO - ------------------------------------------------------------
2019-02-27 10:34:55,770 INFO - Entering custom TaskPrep class for: SIEMENS catiav5tojt com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep@4ff9816
2019-02-27 10:34:55,770 INFO - Translation request contains 1 selection(s)...
2019-02-27 10:34:55,770 INFO - Dataset = com.teamcenter.soa.client.model.strong.Dataset@c75ea4f5 , Item revision = com.teamcenter.soa.client.model.strong.ItemRevision@a0b514db
2019-02-27 10:34:55,942 INFO - Exiting custom TaskPrep class for: SIEMENS catiav5tojt com.teamcenter.ets.translator.ugs.catiatojt.TaskPrep@4ff9816
2019-02-27 10:34:55,942 INFO - ------------------------------------------------------------
2019-02-27 10:34:55,957 INFO - Translation input files have been staged in D:/Apps/Dispatcher/Stage\DC\U18ede3a285c75f74b2656

解决：
与PR \#9025880非常类似.
最终给出的solution是在流程开始时，先不attach数据集，在转换后添加CATPart
或者可以忽略这些错误，因为数据转换是成功的

处理程序的目标必须是零组件版本。处理程序遍历零组件版本以查找处理
程序定义中指定的数据集。

把转换JT的handler放到最开始，在附加数据集handler之前。

