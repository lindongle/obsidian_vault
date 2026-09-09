---
title: 修改Oracle数据库的字符集为UTF-8 - ljy2013 - 博客园
updated: 2026-06-06T00:30
created: 2019-07-28T07:11:31
---

下午

已剪辑自: <https://www.cnblogs.com/ljy2013/p/4597816.html>
**1、改客户端字符集：**通过WINDOWS的运行菜单运行Regedit，修改注册表
Start -\> Run -\> Rededit \<-\|
Under registry Editor - \> HKEY_LOCAL_MACHINE -\> SOFTWARE -\>ORACLE-\>KEY_XE-\>RIGHT WINDOW DOUBLE CLICK NLS_LANG -\> CHANGE VALUE TO "AMERICAN_AMERICA.UTF8" -\>OK -\>CLOSE REGISTRY

**正确设置ORACLE客户端字符集的方法：**
**oracle客户端字符集设置需要和服务器端一致，否则会出现乱码问题。**
首先连接服务器，查询服务器端设置：
select \* from v\$nls_parameters;
找到：
**NLS_LANGUAGE**
**NLS_TERRITORY**
**NLS_CHARACTERSET**
环境变量nls_lang便是由这三部分组成
**NLS_LANG = language_territory.charset**
比如：
NLS_LANG = American_Japan.JA16SJIS

**2、改服务器端字符集**，通过ORACLE的SQL PLUS命令窗口改
在SQL\*PLUS 中，以DBA登录
conn 用户名 as sysdba
**然后执行以下命令**

\>shutdown immediate; (把database停了)
\>startup mount; (把database重开去可更改情況)
\>alter system enable restricted session;
\>alter system set job_queue_processes=0;
\>alter system set aq_tm_processes=0;
\>alter database open;
\>alter database character set utf8;
OR
\>alter database character set internal_use utf8;
\>shutdown immediate;
\>startup; (重开正常oracle)

**ORACLE数据库字符集修改完成！**
