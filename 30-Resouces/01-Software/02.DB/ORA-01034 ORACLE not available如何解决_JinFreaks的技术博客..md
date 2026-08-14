---
title: "ORA-01034: ORACLE not available如何解决_JinFreaks的技术博客..."
updated: 2026-06-06T10:05:35
created: 2026-07-05T17:04:54
---

上午
已剪辑自: <https://blog.51cto.com/jinfreaks/2545626>
我们使用SQL Plus进行数据库连接时提示ORA-01034: ORACLE not available。一下是解决方法：
![image1](53af843c60944a2d8f939c14c9f53c31.jpg)
![image2](6b0c3ddb05dd43198447f10b4cd1539d.png)
![image3](c2d085bca79a48ccbc97b6e3eaccbb83.png)
![image4](ba9c62013b584186ad9c094f30803643.png)
C:\Documents and Settings\Administrator\>sqlplus "/as sysdba"
SQL\*Plus: Release 11.2.0.1.0 Production on 星期一 3月 18 15:45:23 2013
Copyright (c) 1982, 2010, Oracle.All rights reserved.
ERROR:  
ORA-01031: insufficient privileges
请输入用户名:sys/sys as sysdba  
已连接到空闲例程。
SQL\>select \*from v\$log;  
select \*from v\$log  
\*  
第 1 行出现错误:  
ORA-01034: ORACLE not available  
进程 ID: 0  
会话 ID: 0 序列号: 0
SQL\>alterdatabase open resetlog;  
alterdatabase open resetlog  
\*  
第 1 行出现错误:  
ORA-01034: ORACLE not available  
进程 ID: 0  
会话 ID: 0 序列号: 0
SQL\>alterdatabase open resetlogs;  
alterdatabase open resetlogs  
\*  
第 1 行出现错误:  
ORA-01034: ORACLE not available  
进程 ID: 0  
会话 ID: 0 序列号: 0
SQL\>shutdown immedate;  
SP2-0717: 非法的 SHUTDOWN 选项  
SQL\>shutdown immediate  
ORA-01034: ORACLE not available  
ORA-27101: shared memory realm does not exist  
SQL\>startup mount;  
ORACLE 例程已经启动。
Total System Global Area 6847938560 bytes  
Fixed Size2188768 bytes  
Variable Size3422554656 bytes  
Database Buffers3405774848 bytes  
Redo Buffers17420288 bytes  
数据库装载完毕。  

SQL\>alter database open resetlogs;  
alter database open resetlogs  
\*  
第 1 行出现错误:  
ORA-01139: RESETLOGS 选项仅在不完全数据库恢复后有效
SQL\>select \* from v\$log;
GROUP#THREAD#SEQUENCE#BYTESBLOCKSIZEMEMBERS ARC  
---------- ---------- ---------- ---------- ---------- ---------- ---  
STATUSFIRST_CHANGE# FIRST_TIMENEXT_CHANGE# NEXT_TIME  
---------------- ------------- -------------- ------------ --------------  
113823524288005121 NO  
CURRENT34344047 12-3月 -132.8147E+14
313822524288005121 NO  
INACTIVE34327500 12-3月 -1334344047 12-3月 -13
213821524288005121 NO  
INACTIVE34324562 12-3月 -1334327500 12-3月 -13
SQL\>alter database open resetlogs;  
alter database open resetlogs  
\*  
第 1 行出现错误:  
ORA-01139: RESETLOGS 选项仅在不完全数据库恢复后有效
SQL\>  
SQL\>recover database until time '2013-03-01 12:12:12';  
完成介质恢复。
---
我恢复3月1日的  
SQL\>alter database open resetlogs;
数据库已更改。
SQL\>shutdown  
数据库已经关闭。  
已经卸载数据库。  
ORACLE 例程已经关闭。  
SQL\>startup  
ORACLE 例程已经启动。
Total System Global Area 6847938560 bytes  
Fixed Size2188768 bytes  
Variable Size3422554656 bytes  
Database Buffers3405774848 bytes  
Redo Buffers17420288 bytes  
数据库装载完毕。  
数据库已经打开。  
SQL\>

如果启动Oracle的时候发生错误：ORA-00119: invalid specification for system parameter LOCAL_LISTENER。按照以下方法解决
重启oracle是提示错误ORA-00119: invalid specification for system parameter LOCAL_LISTENER。
解决方法：
首先仍然是了解错误信息：oerr ora 00119
*00119, 00000, "invalid specification for system parameter %s"*  
*// \*Cause: The syntax for the specified parameter is incorrect.*  
*// \*Action: Refer to the Oracle Reference Manual for the correct syntax.*
既然参数出现错误，那么需要调整参数LOCAL_LISTENER
1、创建pfile：SQL\>create pfile from spfile
2、修改pfile，pfile的命名方式为init\$ORACLE_SID.ora，存储位置为\$ORACLE_HOME/dbs，检查LOCAL_LISTENER这个参数，如果没有，则在最后一行添加：
\*.local_listener='(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=*ip*)))'，此处的ip就是oracle数据库所在服务器的ip
3、修改完成后，保存退出
4、SQL\>startup pfile='\$ORACLE_HOME/dbs/init\$ORACLE_SID.ora';
可以看到，数据库启动成功
5、重新创建spfile SQL\>create spfile from pfile

