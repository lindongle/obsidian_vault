---
title: License释放2
updated: 2026-06-18T13:38:20
created: 2026-07-05T17:04:50
---

释放TCLicence
1、清理死进程：进入TC命令窗口，执行clearlocks -assert_all_dead -u=infodba -p=infodba -g=dba
2、删除表数据：delete from PFND0LICENSELOGINTIMES;
delete from PFND0LICENSEUSAGE;
3、重启PoolManager服务
