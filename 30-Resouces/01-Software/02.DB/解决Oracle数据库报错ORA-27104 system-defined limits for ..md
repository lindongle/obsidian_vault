---
title: "解决Oracle数据库报错ORA-27104: system-defined limits for ..."
updated: 2026-06-13T15:25:47
created: 2026-07-05T17:04:54
---

解决Oracle数据库报错ORA-27104: system-defined limits for shared memory was misconfigured-CSDN博客
星期一, 八月 26, 2024
8:29 下午
Clipped from: <https://blog.csdn.net/dayuuu/article/details/105957474>
解决Oracle数据库报错ORA-27104: system-defined limits for shared memory was misconfigured
测试环境申请了新的机器后，Oracle数据库直接克隆了其他机器，但完成后使用Navicat连接报错：
![image1](39dcd2ba51994a9c98dc04751c50594a.png)
XShell连接后，登录报错没有实例，关闭数据库和启动数据库都有如下报错：
![image2](f9ef3238d8234518a8919cee05b6c80f.png)
在网上搜了很久之后，看到很多人提到alert.log日志，但是我找不到该日志。百度后参考如下路径  
O R A C L E B A S E / d i a g / r d b m s / ORACLE_BASE/diag/rdbms/ ORACLEB ASE/diag/rdbms/ORACLE_SID/\$ORACLE_SID  
**echo \$ORACLE_BASE**
![image3](34ce44b8e7104d16b0c7b69bfdeaba66.png)
最终在/u01/app/oracle/diag/rdbms/orcl/orcl/aler下找到了类似的日志，日志中发现如下报错：
![image4](988e5c2fb70546e58ba7f9d44247366c.png)
根据错误，可以判断出来是sga相关的配置太大了。
过程如下：  
*1.sysdba登录数据库*  
*\[oracle@oracle dbs\]\$* **sqlplus / as sysdba**  
**SQL\*Plus: Release 19.0.0.0.0 - Production on Thu May 7 02:19:18 2020**  
**Version 19.3.0.0.0**  
**Copyright © 1982, 2019, Oracle. All rights reserved.**  
**Connected to an idle instance.**  
*2.根据spfile创建pfile文件*  
*SQL\>* **create pfile=’/u01/app/oracle/product/19.0.0/dbhome_1/dbs/init20200506.ora’ from spfile;**  
**File created.**  
*3.修改pfile文件*  
*SQL\>* **!vi /u01/app/oracle/product/19.0.0/dbhome_1/dbs/init20200506.ora**  
*4.先用备用的pfile启动oracle*  
*SQL\>* **startup pfile=’/u01/app/oracle/product/19.0.0/dbhome_1/dbs/init20200506.ora’;**  
**ORACLE instance started.**  
**Total System Global Area 3221222464 bytes**  
**Fixed Size 8901696 bytes**  
**Variable Size 654311424 bytes**  
**Database Buffers 2550136832 bytes**  
**Redo Buffers 7872512 bytes**  
**Database mounted.**  
**ORA-01157: cannot identify/lock data file 10 - see DBWR trace file**  
**ORA-01110: data file 10: ‘/u01/app/oracle/oradata/ORCL/zpzdata.dbf’**  
**SQL\>**  
**此处启动我报的错误已经与原始错误无关了（该错误解决办法见其他博客），已经可以启动数据库了!**  
**但是，如果此时关闭数据库再重新启动，还必须要使用pfile文件执行才不会报原来的错误，如果直接执行startup默认是执行的spfile文件启动，因此还需要将已修改的pfile文件覆盖到spfile文件。**  
**测试过程如下：**  
**SQL\> shutdown immediate;**  
**Database closed.**  
**Database dismounted.**  
**ORACLE instance shut down.**  
**SQL\> startup;**  
**ORA-27104: system-defined limits for shared memory was misconfigured**  
**SQL\> startup pfile=’/u01/app/oracle/product/19.0.0/dbhome_1/dbs/init20200506.ora’;**  
**ORACLE instance started.**  
**Total System Global Area 3221222464 bytes**  
**Fixed Size 8901696 bytes**  
**Variable Size 654311424 bytes**  
**Database Buffers 2550136832 bytes**  
**Redo Buffers 7872512 bytes**  
**Database mounted.**  
**Database opened.**  
*5.根据pdfile文件重新创建spfile文件*  
*SQL\>* **create spfile from pfile=’/u01/app/oracle/product/19.0.0/dbhome_1/dbs/init20200506.ora’;**  
**File created.**  
*6.重启数据库*  
*SQL\>* **shutdown immediate;**  
**Database closed.**  
**Database dismounted.**  
**ORACLE instance shut down.**  
**SQL\> startup;**  
**ORACLE instance started.**  
**Total System Global Area 3221222464 bytes**  
**Fixed Size 8901696 bytes**  
**Variable Size 654311424 bytes**  
**Database Buffers 2550136832 bytes**  
**Redo Buffers 7872512 bytes**  
**Database mounted.**  
**Database opened.**  
**SQL\> exit**  
**搞定！撒花！**
