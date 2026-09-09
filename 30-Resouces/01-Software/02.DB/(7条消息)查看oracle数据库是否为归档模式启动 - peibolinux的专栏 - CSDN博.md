---
title: (7条消息)查看oracle数据库是否为归档模式启动 - peibolinux的专栏 - CSDN博...
updated: 2026-06-06T00:30
created: 2019-09-25T04:55:45
---

(7条消息)查看oracle数据库是否为归档模式启动 - peibolinux的专栏 - CSDN博客
星期二, 九月 24, 2019
8:55 下午
已剪辑自: <https://blog.csdn.net/peibolinux/article/details/21227799>
　　\[1\]
　　1.selectname,log_modefromv\$database;
　　NAMELOG_MODE
　　------------------------------------------
　　QUERYNOARCHIVELOG
　　2.使用ARCHIVELOGLIST命令
　　DatabaselogmodeNoArchiveMode
　　AutomaticarchivalDisabled
　　Archivedestination/data/oracle/product/10.2.0/db_1//dbs/arch
　　Oldestonlinelogsequence739
　　Currentlogsequence741
什么是[Oracle](http://www.2cto.com/database/Oracle/)归档模式
　　Oracle数据库有联机重做日志，这个日志是记录对数据库所做的修改，比如插入，删除，更新数据等，对这些操作都会记录在联机重做日志里。一般数据库至少要有2个联机重做日志组。当一个联机重做日志组被写满的时候，就会发生日志切换，这时联机重做日志组2成为当前使用的日志，当联机重做日志组2写满的时候，又会发生日志切换，去写联机重做日志组1，就这样反复进行。
　　如果数据库处于非归档模式,联机日志在切换时就会丢弃.而在归档模式下，当发生日志切换的时候，被切换的日志会进行归档。比如，当前在使用联机重做日志1，当1写满的时候，发生日志切换，开始写联机重做日志2，这时联机重做日志1的内容会被拷贝到另外一个指定的目录下。这个目录叫做归档目录，拷贝的文件叫归档重做日志。
　　数据库使用归档方式运行时才可以进行灾难性恢复。
　　1.归档日志模式和非归档日志模式的区别
　　非归档模式只能做冷备份,并且恢复时只能做完全备份.最近一次完全备份到[系统](http://www.2cto.com/os/)出错期间的数据不能恢复.
　　归档模式可以做热备份,并且可以做增量备份,可以做部分恢复.
　　用ARCHIVELOGLIST可以查看当前模式状态是归档模式还是非归档模式.
配置数据库的归档模式
　　1.改变非归档模式到归档模式:
　　1)SQL\>conn/assysdba(以DBA身份连接数据库)
　　2)SQL\>shutdownimmediate;(立即关闭数据库)
　　3)SQL\>startupmount(启动实例并加载数据库，但不打开)
　　4)SQL\>alterdatabasearchivelog;(更改数据库为归档模式)
　　5)SQL\>alterdatabaseopen;(打开数据库)
　　6)SQL\>altersystemarchivelogstart;(启用自动归档)
　　7)SQL\>exit(退出)

　　做一次完全备份,因为非归档日志模式下产生的备份日志对于归档模式已经不可用了.这一步非非常重要!

　　2.改变归档模式到非归档模式:

　　1)SQL\>SHUTDOWNNORMAL/IMMEDIATE;

　　2)SQL\>STARTUPMOUNT;

　　3)SQL\>ALTERDATABASENOARCHIVELOG;

　　4)SQL\>ALTERDATABASEOPEN;

　　3.启用自动归档:LOG_ARCHIVE_START=TRUE

　　归档模式下,日志文件组不允许被覆盖(重写),当日志文件写满之后,如果没有进行手动归档,那么系统将挂起,知道归档完成为止.

　　这时只能读而不能写.

　　运行过程中关闭和重启归档日志进程

　　SQL\>ARCHIVELOGSTOP

　　SQL\>ARCHIVELOGSTART

　　4.手动归档:LOG_ARCHIVE_START=FALSE

　　归档当前日志文件

　　SQL\>ALTERSYSTEMARCHIVELOGCURRENT;

　　归档序号为052的日志文件

　　SQL\>ALTERSYSTEMARCHIVELOGSEQUENCE052;

　　归档所有日志文件

　　SQL\>ALTERSYSTEMARCHIVELOGALL;

　　改变归档日志目标

　　SQL\>ALTERSYSTEMARCHIVELOGCURRENTTO'&PATH';

　　5.归档模式和非归档模式的转换

　　第4步的逆过程.

　　6.配置多个归档进程

　　Q:什么时候需要使用多个归档进程?

　　A:如果归档过程会消耗大量的时间,那么可以启动多个归档进程,这是个动态参数,可以用ALTERSYSTEM动态修改.

　　SQL\>ALTERSYSTEMSETLOG_ARCHIVE_MAX_PROCESSES=10;

　　Oracle9i中最多可以指定10个归档进程

　　与归档进程有关的动态性能视图

　　v\$bgprocess,v\$archive_processes

　　7.配置归档目标,多归档目标,远程归档目标,归档日志格式

　　归档目标LOG_ARCHIVE_DEST_n

　　本地归档目标:

　　SQL\>LOG_ARCHIVE_DEST_1="LOCATION=D:ORACLEARCHIVEDLOG";

　　远程归档目标:

　　SQL\>LOG_ARCHIVE_DEST_2="SERVICE=STANDBY_DB1";

　　强制的归档目标,如果出错,600秒后重试:

　　SQL\>ALTERSYSTEMSETLOG_ARCHIVE_DEST_4="LOCATION=E:ORACLEARCHIVEDLOGMANDATORYREOPEN=600";

　　可选的归档目标,如果出错,放弃归档:

　　SQL\>ALTERSYSTEMSETLOG_ARCHIVE_DEST_3="LOCATION=E:ORACLEARCHIVEDLOGOPTIONAL";

　　归档目标状态:关闭归档目标和打开归档目标

　　关闭归档目标1

　　SQL\>ALTERSYSTEMSETLOG_ARCHIVE_DEST_STATE_1=DEFER

　　打开归档目标2

　　SQL\>ALTERSYSTEMSETLOG_ARCHIVE_DEST_STATE_2=ENABLE

　　归档日志格式

　　LOG_ARCHIVE_FORMAT

　　8.获取归档日志信息

　　V\$ARCHIVED_LOG

　　V\$ARCHIVE_DEST

　　V\$LOG_HISTORY

　　V\$DATABASE

　　V\$ARCHIVE_PROCESSES

　　ARCHIVELOGLIST;
