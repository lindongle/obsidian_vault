---
title: (26条消息) ORA-00742:oracle数据库服务器断电后文件丢失恢复（非归档模式下noar...
updated: 2026-06-06T10:05
created: 2022-03-19T01:44:35
---

(26条消息) ORA-00742:oracle数据库服务器断电后文件丢失恢复（非归档模式下noarchive）\_佐云的博客-CSDN博客
已剪辑自: <https://blog.csdn.net/qq_41141058/article/details/100732596>
**错误提示：**
SQL\> startup  
ORACLE instance started.  

Total System Global Area 5368709120 bytes  
Fixed Size 8632016 bytes  
Variable Size 2281703728 bytes  
Database Buffers 3070230528 bytes  
Redo Buffers 8142848 bytes  
Database mounted.  
ORA-00742: Log read detects lost write in thread 1 sequence 31 block 217928  
ORA-00312: online log 3 thread 1: '/u01/app/oracle/oradata/zydb/redo03.log'
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
![image1](c2aed54bb7714ab78e1b8a22a98077db.png)
执行恢复：  
1、通过使用备份控制文件直到取消，来恢复数据库
RECOVER DATABASE USING BACKUP CONTROLFILE UNTIL CANCEL
- 1
2、执行提示的重做日志文件
/u01/app/oracle/oradata/zydb/redo03.log
- 1
3、数据库不完全启动
ALTER DATABASE OPEN RESETLOGS;
- 1
SQL\> RECOVER DATABASE USING BACKUP CONTROLFILE UNTIL CANCEL  
ORA-00279: change 3057923 generated at 09/11/2019 10:53:07 needed for thread 1  
ORA-00289: suggestion :  
/u01/app/oracle/product/12.2.0.1/db_1/dbs/arch1_31_1016119588.dbf  
ORA-00280: change 3057923 for thread 1 is in sequence \#31  

  
Specify log: {\<RET\>=suggested \| filename \| AUTO \| CANCEL}  
/u01/app/oracle/oradata/zydb/redo03.log  
Log applied.  
Media recovery complete.  
SQL\> ALTER DATABASE OPEN RESETLOGS;  

Database altered.
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
![image2](e299549b718e413a8753cf74f479aac2.png)
星期五, 三月 18, 2022
5:44 下午
