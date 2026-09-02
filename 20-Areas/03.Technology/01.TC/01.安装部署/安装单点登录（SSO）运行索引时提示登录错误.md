---
title: 安装单点登录（SSO）运行索引时提示登录错误
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:04:39
tags:
  - TC安装部署
---

2023-05-24 16:53:20,420 INFO - Sleeping for 5000 milliseconds
2023-05-24 16:53:25,558 WARN - Connection to Tc failed. (Attempt 5 of 5.)
2023-05-24 16:53:25,558 ERROR - Login Error: The login attempt failed: either the user ID or the password is invalid.
2023-05-24 16:53:25,559 ERROR - Max retry reached. Connection to <http://tcqas.lusterinc.com:8080/tc> failed.
java.lang.Exception: Max retry reached. Connection to <http://tcqas.lusterinc.com:8080/tc> failed.
at com.siemens.teamcenter.ftsi.util.tc.TcConnectionManager.getLiveConnection(TcConnectionManager.java:358) ~\[TcFtsIndexer.jar:?\]
at com.siemens.teamcenter.ftsi.util.TcFtsIndexerUtil.addPreferencesValuesToProperties(TcFtsIndexerUtil.java:921) ~\[TcFtsIndexer.jar:?\]
at com.siemens.teamcenter.ftsi.objdata.TcFtsIndexeObjDataFlow.initialize(TcFtsIndexeObjDataFlow.java:66) ~\[TcFtsIndexer.jar:?\]
at com.siemens.teamcenter.ftsi.core.TcFtsIndexerFlow.initiateAsyncFlow(TcFtsIndexerFlow.java:370) ~\[TcFtsIndexer.jar:?\]
at com.siemens.teamcenter.ftsi.core.TcFtsIndexerFlow.initiateFlow(TcFtsIndexerFlow.java:385) ~\[TcFtsIndexer.jar:?\]
at com.siemens.teamcenter.ftsi.core.TcFtsIndexerFlow\$FlowTimerTask.execute(TcFtsIndexerFlow.java:550) \[TcFtsIndexer.jar:?\]
at com.siemens.teamcenter.ftsi.core.TcFtsIndexerFlow\$FlowTimerTask.run(TcFtsIndexerFlow.java:524) \[TcFtsIndexer.jar:?\]
at java.util.TimerThread.mainLoop(Timer.java:556) \[?:?\]
at java.util.TimerThread.run(Timer.java:506) \[?:?\]

解决：更新密码
D:\Siemens\Teamcenter14\tc_menu\>cd /d D:\Siemens\Teamcenter14\TcFTSIndexer\bin

D:\Siemens\Teamcenter14\TcFTSIndexer\bin\>set tcenv=Luster2023

D:\Siemens\Teamcenter14\TcFTSIndexer\bin\>encryptPass.bat -tc tcenv
Updated encrypted Password file D:\Siemens\Teamcenter14\TcFTSIndexer\cache\TeamcenterFtsIndexer.pwf

如更新
Indexing Engine密码，则将上面-tc 改为-ie
![image1](ad46e7d83b33467ca0de86fb016428fd.png)

