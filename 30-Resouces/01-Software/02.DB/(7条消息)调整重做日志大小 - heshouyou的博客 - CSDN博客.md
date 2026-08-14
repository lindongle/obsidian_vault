---
title: (7条消息)调整重做日志大小 - heshouyou的博客 - CSDN博客
updated: 2026-06-06T10:05:35
created: 2026-07-05T17:04:54
---

下午
已剪辑自: <https://blog.csdn.net/heshouyou/article/details/68484068>
一、目的：
数据库每次切换日志的时候对有一个检查点，会消耗数据库资源，所以我们增加日志文件大小，减少切换的次数，从而提高数据库的效率。
二、步骤：
2.1、先查看数据库重做日志文件的各种参数信息：
select\* fromv\$log

![image1](d67bd0557069481c8886ff311a65b951.png)
主要信息：有三个日志组，每个组中有一个日志文件，bytes日志文件的大小大概为52M左右，状态信息inactive处于活跃状态但是并不是当前使用日志，current是当前正在使用的日志文件。
2.2、查看数据库重做日志文件的存放位置：
select\* fromv\$logfile

![image2](09f0e4b919814b389ddbe97063292c3e.png)
三个组都是online类型，在linux机器上的物理地址：/opt/app/oracle/oradata/bpstest
2.3、开始删除和重建日志文件
先删除状态为inactive状态的文件，alter database drop logfile group 1;然后添加被删除的日志组，alter database add logfile group 1(’/opt/app/oracle/oradata/bpstest/redo01.log’) size 500M reuse;根据上面步骤把group3页重定义。
2.4、切换一下当前日志到新做的日志文件上，然后把最后的group2也重新定义。
alter system switch logfile;
然后group2的状态变为active，这时候表示脏数据还没有写入数据库，所以需要手动加入全局检查点checkpoint。督促CKPT马上唤醒DBWR写入脏数据。
alter system checkpoint;
然后删除group2，并重新定义。
2.5、安装上面步骤把其他两个的active属性变为inactive。最后结果

![image3](19b02795c22347899f31fcbac42687b1.png)
三、总结：
过程中我们需要注意不能直接删除status为current的日志文件，需要安装步骤先删除和重建status为inactive的文件。最后archived属性为No，表示默认关闭自动归档。如果要开启自动归档，可以执行alter database archived log start。如果要手动归档，需要在alter system switch logfile锁死的情况下，用alter system log current来手动归档。
