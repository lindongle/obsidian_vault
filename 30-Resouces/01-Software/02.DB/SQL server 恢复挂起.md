---
title: SQL server 恢复挂起
updated: 2026-06-18T23:26:53
created: 2026-07-05T17:04:54
---

USE master
GO
ALTER DATABASE test SET SINGLE_USER
GO
ALTER DATABASE test SET EMERGENCY
GO
DBCC CHECKDB(test,REPAIR_ALLOW_DATA_LOSS)
go
ALTER DATABASE test SET ONLINE
GO
ALTER DATABASE test SET MULTI_USER
GO
————————————————
版权声明：本文为CSDN博主「培友的Java++」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/YouYou_GO/article/details/79868919
