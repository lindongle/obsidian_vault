---
title: oracle连接提示ORA-12641且conn /as sysdba 提示用户名密码错误
updated: 2026-06-06T00:28:59
created: 2026-07-05T17:04:53
---

后来在support上看到修改sqlnet.ora成
SQLNET.AUTHENTICATION_SERVICES = (BEQ,NONE)，本地机器上就可以sys/admin@mytest_pri as sysdba这样连接了

*来自 \<<http://www.itpub.net/thread-1271404-1-1.html>\>*
