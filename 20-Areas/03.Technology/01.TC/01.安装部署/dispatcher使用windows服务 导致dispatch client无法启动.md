---
title: dispatcher使用windows服务 导致dispatch client无法启动
updated: 2026-06-06T00:11
created: 2018-10-17T15:13:31
tags:
  - TC安装部署
---

添加两个环境变量
<span style='color:#333333;background:white'>make sure to set</span><span style='color:red;background:white'> TC_DATA</span><span style='color:#333333; background:white'> and </span><span style='color:red;background:white'>TC_ROOT</span> as system environment variables and  
retest.
On Windows systems, you can optionally configure the dispatcher client as a Windows
service.
Note
If you run the dispatcher client as a service, Siemens PLM Software recommends
running the scheduler and modules also as a service.
1\. If you use Teamcenter, set the TC_DATA and TC_ROOT system variables as appropriate.
<span style='color:red'>You must set a permanent system variable from My Computer or Control Panel \> Advanced</span>
<span style='color:red'>system settings \> Environment variables.</span>
<span style='color:red'>Examples:</span>
<span style='color:red'>TC_DATA=C:\Progra~1\Siemens\tcdata</span>
<span style='color:red'>TC_ROOT=C:\Progra~1\Siemens\Teamcenter8</span>
Note
When you install Teamcenter, TEM automatically sets the FMS_HOME system variable.
The Dispatcher Client service fails to start as a Windows service if you do not
set the TC_DATA and TC_ROOT system variables.
2\. Run the runDispatcherClientWinService.bat file from the DispatcherClient\bin
directory.
3\. From the Windows Services console, right-click DispatcherClientversion service and
choose Properties.
4\. In the Log On pane, choose the This account option to assign a logon account for
the Dispatcher Client service.
Note
You must provide administrator privileges for the Dispatcher Client service.
5\. Start the Dispatcher Scheduler.
6\. Start the DispatcherClientversion service.

Run the module as a Windows service
On Windows systems, you can optionally configure the module as a Windows service or run
it from a console.
Note
If you run the module as a service, Siemens PLM Software recommends that you run the
scheduler and dispatcher client also as Windows services.
For more information, see the respective chapters for the scheduler and dispatcher
client components.
To run the module as a Windows service, run the moduleWinService.bat file from the
Module\bin directory.
Note
Windows service does not support mapped drives. You should use a UNC path or path
which is local to the machine.

