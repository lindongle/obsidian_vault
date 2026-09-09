---
title: Oracle更改数据文件位置 - haiross的专栏 - CSDN博客
updated: 2026-06-06T00:29
created: 2018-12-06T23:54:58
---

Oracle更改数据文件位置 - haiross的专栏 - CSDN博客
星期四, 十二月 6, 2018
3:54 下午

已剪辑自: <https://blog.csdn.net/haiross/article/details/18559659>
[Oracle更改数据文件位置](http://blog.chinaunix.net/uid-26528029-id-4057947.html)  

前言：  
在数据库运行、管理、维护维优过程中，有可能会碰到需要移动数据文件到其他硬盘或目录的情况。  

 删除或移动数据文件，都不像在操作系统中使用rm或cp命令那么简单。如果只是简单的rm或cp数据文件，  

 那么数据库运行时会因为找不到正确的数据文件位置而报错。这是因为数据文件的位置和信息都被记录
 在控制文件中，rm或cp命令是不会也不可能更改控制文件记录的，这时必须通过alter操作去更改刷新数
 据库控制文件中数据文件的相关信息，以此确保数据库能够正常运行。
 以下将介绍两种方法更改数据文件的位置，更改数据文件位置前，建议暂停所有针对此数据文件的数  

 据操作。
(一) 方法一：offline表空间
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*  
\* 主要步骤： \*  
\* 1、offline表空间：alter tablespace tablespace_name offline;\*  
\* 2、复制数据文件到新的目录； \*  
\* 3、rename修改表空间，并修改控制文件； \*  
\* 4、online表空间； \*  
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
以更改表空间zerone的数据文件/opt/oracle/oradata/ZERONE01.DBF的位置为例
1、offline表空间zerone，使表空间zerone离线  
 ----------------------------------------  
SQL\> alter tablespace zerone offline;  
表空间已更改。

2、复制数据文件到新的目录  
 ----------------------  
 注：  
 \* 1、如检查新目录/home/oracle/oradata/zerone是否存在，不存在则创建此路径，并更改目录属性：  
 \* \# mkdir -p /home/oracle/oradata/zerone  
 \* \# chown -R oracle:oinstall /home/oracle/oradata/zerone  

 复制数据文件  
 \# cp /opt/oracle/oradata/ZERONE01.DBF /home/oracle/oradata/zerone/ZERONE01.DBF  
 \# chown oracle:oinstall /home/oracle/oradata/zerone/ZERONE01.DBF
3、rename修改表空间数据文件为新的位置，并修改控制文件  
 --------------------------------------------------  
SQL\> alter tablespace zerone rename datafile '/opt/oracle/oradata/ZERONE01.DBF' to '/home/oracle/oradata/zerone/ZERONE01.DBF';  
表空间已更改。
4、online表空间  
 ---------------------  
SQL\> alter tablespace zerone online;  
表空间已更改。
检查：  
SQL\> select name from v\$datafile;  
NAME  
--------------------------------------------------------------------------------  
/home/oracle/oradata/zerone/ZERONE01.DBF
SQL\> select file_name,tablespace_name from dba_data_files where tablespace_name='ZERONE';  
FILE_NAME TABLESPACE_NAME  
------------------------------------------------------------------------------------------------  
ZERONE /home/oracle/oradata/zerone/ZERONE01.DBF  

(二) 方法二：SQL修改数据文件位置
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*  
\* 主要步骤：  
\* 1、关闭数据库；  
\* 2、复制数据文件到新的位置；  
\* 3、启动数据库到mount状态；  
\* 4、通过SQL修改数据文件位置；  
\* 5、打开数据库；  
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
1、关闭数据库  
 ---------------------------  
SQL\> shutdown immediate;  
数据库已经关闭。  
已经卸载数据库。  
ORACLE 例程已经关闭。
2、复制数据文件到新的位置；  
 ---------------------------  
 同方法一

3、启动数据库到mount状态；  
 ----------------------------  
SQL\> startup mount  
ORACLE 例程已经启动。  
Total System Global Area 167772160 bytes  
Fixed Size 1247900 bytes  
Variable Size 96470372 bytes  
Database Buffers 67108864 bytes  
Redo Buffers 2945024 bytes  
数据库装载完毕。

4、通过SQL修改数据文件位置；  
 -------------------------------  
SQL\> alter database rename file '/opt/oracle/oradata/ZERONE01.DBF' to '/home/oracle/oradata/zerone/ZERONE01.DBF';  
数据库已更改。
5、打开数据库；  
 -------------------------------  
SQL\> alter database open;  
数据库已更改。
检查：  
SQL\> select name from v\$datafile;  
NAME  
--------------------------------------------------------------------------------  
/home/oracle/oradata/zerone/ZERONE01.DBF
SQL\> select file_name,tablespace_name from dba_data_files where tablespace_name='ZERONE';  
FILE_NAME TABLESPACE_NAME  
------------------------------------------------------------------------------------------------  
ZERONE /home/oracle/oradata/zerone/ZERONE01.DBF

如何查看数据文件属于哪个表空间  

 (1) 查看永久表空间的数据文件对应的表空间  
 SQL\> select TABLESPACE_NAME from dba_data_files where FILE_NAME='数据文件全路径';
 (2) 查看临时表空间的数据文件对应的临时表空间  
 SQL\> select TABLESPACE_NAME from dba_temp_files where FILE_NAME='数据文件全路径';

参考：
临时数据文件 更改路径 谷歌  

