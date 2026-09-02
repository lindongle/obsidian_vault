---
title: ORA-12518 TNS:监听程序无法分发客户机连接 解决办法 - hhs的个人空间 - OSCH...
updated: 2026-09-02T16:30:06
created: 2026-07-05T17:04:54
---

ORA-12518 TNS:监听程序无法分发客户机连接 解决办法 - hhs的个人空间 - OSCHINA - 中文开源技术交流社区
已剪辑自: <https://my.oschina.net/huhs/blog/14637>
![image1](14b12cd183ef4f688fadf6db453f1bc4.png)
在网上查了一下，主要有以下三种解决方案：
一、listener文件中的GLOBAL_DBNAME ,SID_NAME可能与实例名称不符，修改后，重启listener.
二、专有服务器模式下processes值设的过小。可通过以下方法解决：
 1.cmd
 2.sqlplus
 3.connect sys/test as sysdba
 4.查看会话数、processes、sessions
SQL\> select count(\*) from v\$session;
 COUNT(\*)
----------
45
 SQL\> show parameter processes
NAME                 TYPE    VALUE
db_writer_processes         integer   1
gcs_server_processes         integer   0
job_queue_processes         integer   10
log_archive_max_processes      integer   2
processes              integer   50

 SQL\> show parameter sessions
NAME                 TYPE    VALUE
java_soft_sessionspace_limit     integer   0l
icense_max_sessions         integer   0
license_sessions_warning       integer   0
logmnr_max_persistent_sessions    integer   1
sessions               integer   60
shared_server_sessions        integer
 5.修改processes和sessions值:sessions=(1.1\*process+5)
 SQL\>altersystemsetprocesses=300scope=spfile;
系统已更改。  
SQL\>altersystemsetsessions=335scope=spfile;
系统已更改。
 6.重启数据库，使更改生效
三、共享模式下
 1.show parameters dispatchers;
NAMETYPEVALUE  
dispatchersstring(protocol=tcp)(service=oracle10xdb)
max_dispatchersinteger
 2.确定是否有足够的dispatchers
 SQL\> select name, (busy/(busy + idle)) "dispatcher busy rate" from v\$dispatcher; 
 NAME dispatcher busy rate
---- --------------------  
D000 .000121704  
D001 .000042597
D002 .004935402
 如果超过50%，则需要考虑增加更多的dispatchers;
3.改变dispathchers:
SQL\>alter system set dispatchers = '(protocol=tcp)(dispatchers=3)(service=oracle10xdb)';
system altered
四、PGA内存设置太小
 注：该方法没试过。

参考以下链接：
1\. <http://www.cnoracle.com/archives/474>
2\. <http://www.cnblogs.com/freedom831215/archive/2010/05/12/1733859.html>
3.http://blog.csdn.net/wudi_1982/archive/2007/06/08/1643610.aspx

正解：
Oracle监听及数据库服务改为系统本地账号登录。重启两个服务即可

2020年10月30日
21:13
