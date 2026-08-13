---
title: Oracle数据库升级11.2.0.1-11.2.0.4
updated: 2026-06-06T00:30
created: 2019-08-19T13:31:55
---

==1、停止Oracle所有服务==
2、设置Oracle_HOME环境变量到新的路径，如果不生效，需要重启服务器。
3、清理回收站
C:\Users\plmadm\>sqlplus /nolog

SQL\*Plus: Release 11.2.0.4.0 Production on 星期二 8月 20 13:46:35 2019

Copyright (c) 1982, 2013, Oracle. All rights reserved.

SQL\> conn / as sysdba;
已连接。
SQL\> PURGE DBA_RECYCLEBIN;

DBA 回收站已清空。

SQL\>

运行11.2.0.4安装程序
![image1](51bf0f0f15694f0795f8d8dc83324277.png)

![image2](9f1f896c0a724cfaa3f9fa4279daad05.png)

![image3](86b7c6633afe4dffb91b40fa0cf861b2.png)

![image4](8fb60c6760b348ba8892f8893ee1215e.png)

![image5](50e0c432e2714859a9844d8a5641b4b0.png)

![image6](639fbcd4eb1d476dacc3a4e8143472a9.png)

![image7](3fd056f7ff174f0ea7ae73a4853f430b.png)

![image8](3f1f8c7014e54f1ab134321ffdacfa41.png)

![image9](0aae85f6356d4635bd89035cd9715b2b.png)

升级完后，可以通过开始，数据库升级向导，再升级另一个数据库实例。

![image10](8dee53ce2fb74247ad2ea9df05415323.png)

![image11](4206d17c82934ed990e9ca6af1263593.png)

![image12](df8e980d71ef429b9386baea48cb7431.png)

![image13](4ddbb88a98ea420cab8054010d7c88f5.png)

![image14](8322ba2de50c434d9156b86a04fb397c.png)

![image15](b321ccc622cb44cca43032eee506900e.png)

![image16](12c5e84888ff4b25b89e8f467a710fe4.png)

![image17](069ac119c5094635bf3dfcc7e747bdf9.png)
升级失败后，通过D:\app\plmadm\admin\tc11\backup\TC11_restore.bat恢复。

