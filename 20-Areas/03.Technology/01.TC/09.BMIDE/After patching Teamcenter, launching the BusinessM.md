---
title: After patching Teamcenter, launching the BusinessM...
updated: 2026-06-06T10:08:49
created: 2026-07-05T17:04:45
---

After patching Teamcenter, launching the BusinessModelerIDE client ( bmide.bat) fails with
![image1](47a72b4e56324053a238b3eb54b9596d.png)
That log file shows

!ENTRY org.eclipse.equinox.app 0 0 2022-04-25 11:55:20.228
!MESSAGE Product com.teamcenter.bmide.branding.product could not be found.

!ENTRY org.eclipse.osgi 4 0 2022-04-25 11:55:50.810
!MESSAGE Application error
!STACK 1
java.lang.RuntimeException: No application id has been found.
 at org.eclipse.equinox.internal.app.EclipseAppContainer.startDefaultApp(EclipseAppContainer.java:246)
 at org.eclipse.equinox.internal.app.MainApplicationLauncher.run(MainApplicationLauncher.java:33)
 at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.runApplication(EclipseAppLauncher.java:137)
 at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.start(EclipseAppLauncher.java:107)
 at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:400)
 at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:255)
 at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
 at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
 at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
 at java.base/java.lang.reflect.Method.invoke(Method.java:566)
 at org.eclipse.equinox.launcher.Main.invokeFramework(Main.java:659)
 at org.eclipse.equinox.launcher.Main.basicRun(Main.java:595)
 at org.eclipse.equinox.launcher.Main.run(Main.java:1501)

**Solution**
To workaround the error, it is necessary to rebuild the BMIDE workspace directory.
1\. Rename the current directory
![image2](e044209c802b4ba6b9dad37ddb272e6e.png)
Once complete, Exit BMIDE

3\. Copy the project from renamed workspace to new workspace
![image3](94750bf455a845e5ba2ee23a59df4066.png)
After a Finish to import the template, this concludes the workaround. Functionality will resume as expected.

*来自 \< <https://support.sw.siemens.com/zh-CN/knowledge-base/PL8640798>\>*

