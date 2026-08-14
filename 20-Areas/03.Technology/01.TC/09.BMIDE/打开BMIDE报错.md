---
title: 打开BMIDE报错
updated: 2026-06-13T15:32:08
created: 2026-07-05T17:04:45
---

!SESSION 2019-03-16 17:32:43.482 -----------------------------------------------
eclipse.buildId=unknown
java.version=1.7.0_79
java.vendor=Oracle Corporation
BootLoader constants: OS=win32, ARCH=x86_64, WS=win32, NL=zh_CN
Command-line arguments: -os win32 -ws win32 -arch x86_64

!ENTRY org.eclipse.equinox.app 0 0 2019-03-16 17:32:46.274
!MESSAGE Product com.teamcenter.bmide.branding.product could not be found.

!ENTRY org.eclipse.osgi 4 0 2019-03-16 17:32:58.161
!MESSAGE Application error
!STACK 1
java.lang.RuntimeException: No application id has been found.
at org.eclipse.equinox.internal.app.EclipseAppContainer.startDefaultApp(EclipseAppContainer.java:242)
at org.eclipse.equinox.internal.app.MainApplicationLauncher.run(MainApplicationLauncher.java:29)
at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.runApplication(EclipseAppLauncher.java:110)
at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.start(EclipseAppLauncher.java:79)
at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:353)
at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:180)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
at java.lang.reflect.Method.invoke(Unknown Source)
at org.eclipse.equinox.launcher.Main.invokeFramework(Main.java:629)
at org.eclipse.equinox.launcher.Main.basicRun(Main.java:584)
at org.eclipse.equinox.launcher.Main.run(Main.java:1438)

解决：
In the %TC_ROOT%\bmide\client\configuration\config.ini add the following line
to the bottom of the file one line up from the bottom:

osgi.configuration.area=@user.dir/.././workspace/config

This should be directly after the line that defines the @user.

