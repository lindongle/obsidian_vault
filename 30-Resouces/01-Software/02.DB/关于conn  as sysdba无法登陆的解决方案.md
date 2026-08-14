---
title: 关于conn / as sysdba无法登陆的解决方案
updated: 2026-06-06T00:30:44
created: 2026-07-05T17:04:54
---

1\. 操作系統用户是否dba组
2\. sqlnet.ora 认证服务从NONE改为NTS
 SQLNET.AUTHENTICATION_SERVICES= (NTS) --windows使用nts、linux使用all（貌似也得用NTS）

服务器是linux的，没有dba组，然后执行usermod -G oinstall,dba -g oinstall oracle。搞定。
————————————————
版权声明：本文为CSDN博主「jlds123」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/jlds123/article/details/8994306
