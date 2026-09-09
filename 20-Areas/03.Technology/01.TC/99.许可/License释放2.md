---
title: License释放2
updated: 2026-06-18T13:38:20+08:00
created: 2019-11-15T10:23:21
---

释放TCLicence
1、清理死进程：进入TC命令窗口，执行clearlocks -assert_all_dead -u=infodba -p=infodba -g=dba
2、删除表数据：delete from PFND0LICENSELOGINTIMES;
delete from PFND0LICENSEUSAGE;
3、重启PoolManager服务
