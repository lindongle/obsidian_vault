---
title: 安装原数据库守护程序Action Manager Service/Subscription Mana...
updated: 2026-09-02T16:30:04
created: 2026-07-05T17:09:04
tags:
  - TC安装部署
---

安装原数据库守护程序Action Manager Service/Subscription Manager Service/Teamcenter Task Manager Service
2025年12月3日
9:51
![image1](4b35fd917c724c59a82b681312798d94.png)

![image2](bc277503f53b4c7fab4228634bb2fbf2.png)

Process daemons include the following:
- [Action Manager](https://docs.sw.siemens.com/en-US/product/282219420/doc/PL20230510731367206.plm00035/html/using_actionmgrd_daemon)  
  Dispatches events that have a specified execution time or subscription events that have failed to process.
- [Subscription Manager](https://docs.sw.siemens.com/en-US/product/282219420/doc/PL20230510731367206.plm00035/html/using_subscriptionmgrd_daemon)  
  Monitors the event queue for**TcEvent**objects.
- [Task Manager](https://docs.sw.siemens.com/en-US/product/282219420/doc/PL20230510731367206.my_teamcenter/html/wftasks)  
  Checks a user's inbox for tasks that have passed their due date. If such a task is found, the daemon notifies the delegated recipients and marks the task as late.  
  The frequency of the daemon's monitoring is controlled by setting the**TASK_MONITOR_SLEEP_TIME**preference. To kill the daemon at any time, create an empty file as[*TC_ROOT*](https://docs.sw.siemens.com/en-US/product/282219420/doc/PL20230510731367206.plm00026/html/xid361766#TC_ROOT)**\logs\taskmonitor_graceful_exit.tmp**.

*From \< <https://docs.sw.siemens.com/documentation/external/PL20230510731367206/en-US/tc_help_sc/tc/2312/tc_help_sc/en-US/plm00102/xid1095174/xid1095175/daemons.html>\>*
![image3](3450d06d43eb4e9da16c680cc1c7f04b.png)
查看Linux订阅服务进程
ps -ef\|grep subscriptionmgrd
删除Linux订阅服务进程
killall /infodba/Siemens/Teamcenter2412/bin/subscriptionmgrd
查看Linux任务监视服务
ps -ef\|grep actionmgrd
删除Linux任务监视服务进程
killall /infodba/Siemens/Teamcenter2412/bin/actionmgrd

