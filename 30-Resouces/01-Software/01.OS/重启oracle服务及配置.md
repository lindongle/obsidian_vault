---
title: 重启oracle服务及配置
updated: 2026-06-06T00:28
created: 2019-09-19T16:37:36
---

用root以ssh登录到linux，打开终端输入以下命令：

cd \$ORACLE_HOME \#进入到oracle的安装目录

dbstart \#重启服务器

lsnrctl start \#重启监听器

cd \$ORACLE_HOME \#进入到oracle的安装目录

dbstart \#重启服务器

lsnrctl start \#重启监听器

启动图形配置界面
cd /app/oracle/product/12.2.0.1/dbhome_1/bin
./dbca \#启动数据库实例配置
./netca#启动网络连接配置
./netmgr#启动netmanager
