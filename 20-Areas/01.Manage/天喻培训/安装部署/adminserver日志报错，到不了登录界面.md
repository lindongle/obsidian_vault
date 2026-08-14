---
title: adminserver日志报错，到不了登录界面
updated: 2026-06-13T22:11:17
created: 2026-07-05T17:04:37
tags:
  - 天喻
  - 国产
---

adminserver日志报错，到不了登录界面
java.util.concurrent.TimeoutException: Did not observe any item or terminal signal within 10000ms in 'map' (and no fallback has been configured)
at reactor.core.publisher.FluxTimeout\$TimeoutMainSubscriber.handleTimeout(FluxTimeout.java:294) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
Suppressed: reactor.core.publisher.FluxOnAssembly\$OnAssemblyException:
Error has been observed at the following site(s):
\|\_ checkpoint ? Request to GET health \[DefaultWebClient\]
Stack trace:
at reactor.core.publisher.FluxTimeout\$TimeoutMainSubscriber.handleTimeout(FluxTimeout.java:294) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
at reactor.core.publisher.FluxTimeout\$TimeoutMainSubscriber.doTimeout(FluxTimeout.java:279) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
at reactor.core.publisher.FluxTimeout\$TimeoutTimeoutSubscriber.onNext(FluxTimeout.java:418) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
at reactor.core.publisher.FluxOnErrorResume\$ResumeSubscriber.onNext(FluxOnErrorResume.java:79) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
at reactor.core.publisher.MonoDelay\$MonoDelayRunnable.run(MonoDelay.java:119) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
at reactor.core.scheduler.SchedulerTask.call(SchedulerTask.java:68) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
at reactor.core.scheduler.SchedulerTask.call(SchedulerTask.java:28) ~\[reactor-core-3.4.3.jar!/:3.4.3\]
at java.util.concurrent.FutureTask.run(FutureTask.java:266) ~\[na:1.8.0_172\]
at java.util.concurrent.ScheduledThreadPoolExecutor\$ScheduledFutureTask.access\$201(ScheduledThreadPoolExecutor.java:180) ~\[na:1.8.0_172\]
at java.util.concurrent.ScheduledThreadPoolExecutor\$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:293) ~\[na:1.8.0_172\]
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149) ~\[na:1.8.0_172\]
at java.util.concurrent.ThreadPoolExecutor\$Worker.run(ThreadPoolExecutor.java:624) ~\[na:1.8.0_172\]
at java.lang.Thread.run(Thread.java:748) ~\[na:1.8.0_172\]
解决：升级Chrome软件版本到最新版本
