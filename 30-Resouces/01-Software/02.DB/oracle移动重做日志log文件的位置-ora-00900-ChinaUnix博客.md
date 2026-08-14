---
title: oracle移动重做日志log文件的位置-ora-00900-ChinaUnix博客
updated: 2026-06-06T00:29:45
created: 2026-07-05T17:04:54
---

oracle移动重做日志log文件的位置-ora-00900-ChinaUnix博客
星期四, 十二月 6, 2018
3:55 下午
已剪辑自: <http://blog.chinaunix.net/uid-25785357-id-3074909.html>
SQL\> select member from v\$logfile;

MEMBER
--------------------------------------------------------------------------------
/u01/app/oracle/oradata/ocp/redo03.log
/u01/app/oracle/oradata/ocp/redo02.log
/u01/app/oracle/oradata/ocp/redo01.log
/u01/app/oracle/oradata/ocp/stdredoa.log
/u01/app/oracle/oradata/ocp/stdredob.log
/u01/app/oracle/oradata/ocp/stdredoc.log

关闭数据库。
SQL\> shutdown immediate

cp日志文件到目标位置。
\[oracle@sc ocp\]\$ cp stdred\* /u01/app/oracle/oradata/log/

数据库mount模式启动。
SQL\>startup mount;

修改数据库中日志文件的位置。
SQL\> startup mount;
ORACLE instance started.

SQL\> alter database rename file '/u01/app/oracle/oradata/ocp/stdredoa.log' to '/u01/app/oracle/oradata/log/stdredoa.log';
SQL\> alter database rename file '/u01/app/oracle/oradata/ocp/stdredob.log' to '/u01/app/oracle/oradata/log/stdredob.log';
SQL\> alter database rename file '/u01/app/oracle/oradata/ocp/stdredoc.log' to '/u01/app/oracle/oradata/log/stdredoc.log';

open数据库
SQL\> alter database open;
查看修改结果。
SQL\> select member from v\$logfile;

MEMBER
--------------------------------------------------------------------------------
/u01/app/oracle/oradata/ocp/redo03.log
/u01/app/oracle/oradata/ocp/redo02.log
/u01/app/oracle/oradata/ocp/redo01.log
/u01/app/oracle/oradata/log/stdredoa.log
/u01/app/oracle/oradata/log/stdredob.log
/u01/app/oracle/oradata/log/stdredoc.log
