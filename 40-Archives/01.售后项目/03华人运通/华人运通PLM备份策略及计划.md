---
title: 华人运通PLM备份策略及计划
updated: 2026-06-05T22:02:20
created: 2026-07-05T17:04:57
---

**备份策略：**
**生产环境备份：**
**1、备份tcdata及bmide。**
1）1.6服务器设置共享D:\plmdatabackup_temp\tcdata_bmideproject_temp\\所有人只读权限。
2）将1.6的tcdata和bmide，备份到1.6的D:\plmdatabackup_temp\tcdata_bmideproject_temp\下，并进行压缩，删除此文件夹中压缩前的文件。
3）将1.6的共享挂载到1.7服务器上的/plmdata/plmdatabackup_temp/tcdata_bmideproject_temp中。
**2、备份volume及database**
1）将1.7服务器上volume及database，备份并压缩放到/plmdata/plmdatabackup_temp/volume_database_temp中。压缩后删除压缩前文件。
2）0.51上设置共享目录/plmdata/plmdatabackup
3）1.7服务器上挂载0.51的共享目录/plmdata/plmdatabackup
4）将1.7服务器上/plmdata/plmdatabackup_temp/压缩到/plmdata/plmdatabackup中，压缩完成后删除/plmdata/plmdatabackup_temp/volume_database_temp和/plmdata/plmdatabackup_temp/tcdata_bmideproject_temp目录中的文件。自动删除30天前备份数据。
3、所有挂载设置开启启动。
**测试虚拟机备份（备份虚拟机）：**
1.1.8上开共享E:\Virtual Machines
2.将1.8测试虚拟机文件E:\Virtual Machines，备份到1.16电脑（测试工作站）D:\teamcenter_test_backup中。自动压缩，删除30天前备份数据
**备份计划：**
1）10.2.1.6,tcdata及bmide备份时间，每周六晚上22:00
2）10.2.1.7,上oracle数据库备份时间，每天晚上00:00
3）10.2.1.7,卷和数据库备份时间，每周六凌晨2:00
4）10.2.1.7,所有数据备份到10.0.1.51上，每周日凌晨2:00
5）10.2.1.16,备份10.2.1.8上的测试虚拟机，每周六晚上00:00

