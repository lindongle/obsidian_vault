---
title: PoolManager优化
updated: 2026-06-19T19:10:52
created: 2026-07-05T17:04:50
---

调整Pool Manager的JVM，从原来的512MB增加到1024MB。调整方法为修改文件mgrstartServerID.bat中的JAVA_HEAP_SIZE参数。
D:\backup\Teamcenter11\pool_manager\confs\config1\mgrenv.bat
![image1](70da065f1ed447bdbebebb4df724d804.png)

