---
title: Creo保存报错，未生成轻量化文件
updated: 2026-06-06T00:01
created: 2024-10-25T17:54:59
tags:
  - 天喻
  - 国产
---

序号名称/信息执行情况
1D:\TeamSpace\WorkSpace\127_0_0_1_7002\admin\test\PRT0001.PRT服务器返回异常，未知异常，请联系管理员处理!

管理员身份运行：D:\inteplm\1_basic\lightweight\src\main\resources\tools\LightWeightServer.exe
提示错误：2024-10-25 17-50-31-945未找到指定版本的CREO插件库目录：D:\inteplm\1_basic\lightweight\src\main\resources\tools\SupporterCREO\Creo10
根据提示新建个Creo10文件夹即可

Creo工程图转PDF报错：
java.lang.IllegalStateException: Can't stop StopWatch: it's not running
at org.springframework.util.StopWatch.stop(StopWatch.java:154)
at com.ty.lightweight.dto.LocalStopWatch.stop(LocalStopWatch.java:64)
at com.ty.lightweight.service.impl.LightWeightServiceImpl.createThumbnailByLightWeightEXE(LightWeightServiceImpl.java:654)
at com.ty.lightweight.service.impl.LightWeightServiceImpl.asyncCreateThumbnail(LightWeightServiceImpl.java:531)
at com.ty.lightweight.service.impl.LightWeightServiceImpl.lambda\$convertStart\$1(LightWeightServiceImpl.java:407)
at java.util.concurrent.CompletableFuture\$AsyncRun.run(CompletableFuture.java:1626)
at java.util.concurrent.CompletableFuture\$AsyncRun.exec(CompletableFuture.java:1618)
at java.util.concurrent.ForkJoinTask.doExec(ForkJoinTask.java:289)
at java.util.concurrent.ForkJoinPool\$WorkQueue.runTask(ForkJoinPool.java:1056)
at java.util.concurrent.ForkJoinPool.runWorker(ForkJoinPool.java:1692)
at java.util.concurrent.ForkJoinWorkerThread.run(ForkJoinWorkerThread.java:157)

