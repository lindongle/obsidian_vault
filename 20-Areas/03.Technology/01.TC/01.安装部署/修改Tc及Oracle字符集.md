---
title: 修改Tc及Oracle字符集
updated: 2026-06-13T22:12:00
created: 2026-07-05T17:04:38
tags:
  - TC安装部署
---

![image1](cbd28f63d7ec41578ed79caac69b065d.png)
When you run Teamcenter in a multibyte environment, make sure the**TC_XML_ENCODING**environment variable is set to**UTF-8**and the**UGII_UTF8_MODE**environment variable is set to**1**.

*来自 \<<https://docs.sw.siemens.com/documentation/external/PL20210421143201885/zh-CN/tc_help_sc/tc/13.3/tc_help_sc/zh-CN/localization_guide/id1071572/xid603217/xid684059.html>\>*

以上你iiop路径Tc13之后为：D:\Siemens\Teamcenter13\tctpservers\starttcserver.bat

修改Oracle字符集：
Microsoft Windows \[版本 10.0.17763.107\]
\(c\) 2018 Microsoft Corporation。保留所有权利。

C:\Users\infodba\>sqlplus /nolog

SQL\*Plus: Release 19.0.0.0.0 - Production on 星期二 3月 29 16:22:06 2022
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle. All rights reserved.

SQL\> conn / as sysdba;
已连接。
SQL\> select userenv('language') from dual;

USERENV('LANGUAGE')
----------------------------------------------------
SIMPLIFIED CHINESE_CHINA.ZHS16GBK

SQL\> shutdown immediate
数据库已经关闭。
已经卸载数据库。
ORACLE 例程已经关闭。
SQL\> STARTUP MOUNT
ORACLE 例程已经启动。

Total System Global Area 3472882184 bytes
Fixed Size 9034248 bytes
Variable Size 721420288 bytes
Database Buffers 2734686208 bytes
Redo Buffers 7741440 bytes
数据库装载完毕。
SQL\> ALTER SYSTEM ENABLE RESTRICTED SESSION;

系统已更改。

SQL\> ALTER SYSTEM SET JOB_QUEUE_PROCESSES=0;

系统已更改。

SQL\> ALTER SYSTEM SET AQ_TM_PROCESSES=0;

系统已更改。

SQL\> ALTER DATABASE OPEN;

数据库已更改。

SQL\> ALTER DATABASE character set INTERNAL_USE AL32UTF8;

数据库已更改。

SQL\> ALTER SESSION SET SQL_TRACE=FALSE;

会话已更改。

SQL\> shutdown immediate;
数据库已经关闭。
已经卸载数据库。
ORACLE 例程已经关闭。
SQL\> startup;
ORACLE 例程已经启动。

Total System Global Area 3472882184 bytes
Fixed Size 9034248 bytes
Variable Size 721420288 bytes
Database Buffers 2734686208 bytes
Redo Buffers 7741440 bytes
数据库装载完毕。
数据库已经打开。
SQL\> select userenv（'language'） from dual;

USERENV（'LANGUAGE'）
--------------------------------------------------------------------------------
SIMPLIFIED CHINESE_CHINA.AL32UTF8

SQL\>

